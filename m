Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068F48988D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 13:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255313.437474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6tjY-0005uz-UT; Mon, 10 Jan 2022 12:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255313.437474; Mon, 10 Jan 2022 12:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6tjY-0005sz-RT; Mon, 10 Jan 2022 12:25:08 +0000
Received: by outflank-mailman (input) for mailman id 255313;
 Mon, 10 Jan 2022 12:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RiBW=R2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n6tjY-0005st-2t
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 12:25:08 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5732d162-7210-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 13:25:06 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47154)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n6tjU-000OhJ-hg (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 10 Jan 2022 12:25:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 577C71FDB0;
 Mon, 10 Jan 2022 12:25:04 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5732d162-7210-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
Date: Mon, 10 Jan 2022 12:25:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-2-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
In-Reply-To: <20220107103544.9271-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2022 10:35, Juergen Gross wrote:
> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
> index e5dfdc5ef5..3305102f22 100644
> --- a/tools/libs/evtchn/minios.c
> +++ b/tools/libs/evtchn/minios.c
> @@ -38,16 +38,27 @@
>  
>  #include "private.h"
>  
> +LIST_HEAD(port_list, port_info);
> +
> +struct port_info {
> +    LIST_ENTRY(port_info) list;
> +    evtchn_port_t port;
> +    unsigned long pending;
> +    int bound;

Now this is private, it's even more clear that pending and bound are bool's.

Making this adjustment drops 16 bytes from the structure.

> +};
> +
>  extern void minios_evtchn_close_fd(int fd);
>  
>  extern struct wait_queue_head event_queue;
>  
>  /* XXX Note: This is not threadsafe */
> -static struct evtchn_port_info *port_alloc(int fd)
> +static struct port_info *port_alloc(int fd)
>  {
> -    struct evtchn_port_info *port_info;
> +    struct port_info *port_info;
> +    struct file *file = get_file_from_fd(fd);
> +    struct port_list *port_list = file->dev;

This would be rather more obviously correct if port_alloc() took xce
rather than fd.

It is reasonable to assume that xce->fd is good, and that
get_file_from_fd(xce->fd) will be non-null, but the current logic makes
this very opaque.

> @@ -75,12 +86,25 @@ static void port_dealloc(struct evtchn_port_info *port_info)
>   */
>  int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>  {
> -    int fd = alloc_fd(FTYPE_EVTCHN);
> +    int fd;
> +    struct file *file;
> +    struct port_list *list;
> +
> +    list = malloc(sizeof(*list));
> +    if ( !list )
> +        return -1;
> +
> +    fd = alloc_fd(FTYPE_EVTCHN);
> +    file = get_file_from_fd(fd);
>  
> -    if ( fd == -1 )
> +    if ( !file )
> +    {
> +        free(list);
>          return -1;
> +    }

This wants rearranging to keep alloc_fd() ahead of malloc().  With that,
there is no need for free(list) in this error path.

>  
> -    LIST_INIT(&files[fd].evtchn.ports);
> +    file->dev = list;
> +    LIST_INIT(list);
>      xce->fd = fd;
>      printf("evtchn_open() -> %d\n", fd);
>  
> @@ -104,12 +128,15 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
>  
>  void minios_evtchn_close_fd(int fd)

Something very broken is going on here.  The top of evtchn.c declares:

extern void minios_evtchn_close_fd(int fd);

I'm surprised that the compiler doesn't object to instantiating a
function which has previously been declared extern.


Furthermore, in minios itself.

lib/sys.c:91:extern void minios_evtchn_close_fd(int fd);
lib/sys.c:447:      minios_evtchn_close_fd(fd);

So lib/sys.c locally extern's this function too.  It needs to be in the
public API if it is used like this, but surely the better thing is to
wire up xenevtchn_close() properly.

>  {
> -    struct evtchn_port_info *port_info, *tmp;
> +    struct port_info *port_info, *tmp;
> +    struct file *file = get_file_from_fd(fd);
> +    struct port_list *port_list = file->dev;

Is it safe to assume that fd is good here?

> @@ -273,15 +305,17 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xenevtchn_handle *xce,
>  xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
>  {
>      int fd = xce->fd;
> -    struct evtchn_port_info *port_info;
> +    struct file *file = get_file_from_fd(fd);

You've dropped all uses of 'fd' from this function, so why not drop the
local variable and use xce->fd here?

~Andrew

