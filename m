Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BED48B7B2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 20:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256040.439155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NGM-0007Dj-Hl; Tue, 11 Jan 2022 19:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256040.439155; Tue, 11 Jan 2022 19:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NGM-0007Bc-ED; Tue, 11 Jan 2022 19:56:58 +0000
Received: by outflank-mailman (input) for mailman id 256040;
 Tue, 11 Jan 2022 19:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7NGK-0007Am-NP
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 19:56:56 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f8cd192-7318-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 20:56:55 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47042)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7NGH-000p7C-7L (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 19:56:53 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1C2D51FC68;
 Tue, 11 Jan 2022 19:56:53 +0000 (GMT)
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
X-Inumbo-ID: 9f8cd192-7318-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>
Date: Tue, 11 Jan 2022 19:56:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-2-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 1/3] tools/libs/evtchn: decouple more from mini-os
In-Reply-To: <20220111150318.22570-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:03, Juergen Gross wrote:
> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
> index e5dfdc5ef5..c3a5ce3b98 100644
> --- a/tools/libs/evtchn/minios.c
> +++ b/tools/libs/evtchn/minios.c
> @@ -38,29 +38,40 @@
>  
>  #include "private.h"
>  
> -extern void minios_evtchn_close_fd(int fd);
> +LIST_HEAD(port_list, port_info);
> +
> +struct port_info {
> +    LIST_ENTRY(port_info) list;
> +    evtchn_port_t port;
> +    bool pending;
> +    bool bound;
> +};
>  
>  extern struct wait_queue_head event_queue;

Yuck.  This should come from minios's evtchn header, rather than being
extern'd like this, but lets consider that future cleanup work.

> +int minios_evtchn_close_fd(int fd);

You don't need this forward declaration, because nothing in this file
calls minios_evtchn_close_fd().  The extern should simply be deleted,
and it removes a hunk from your later xen.git series.

> @@ -69,18 +80,54 @@ static void port_dealloc(struct evtchn_port_info *port_info)
>      free(port_info);
>  }
>  
> +int minios_evtchn_close_fd(int fd)
> +{
> +    struct port_info *port_info, *tmp;
> +    struct file *file = get_file_from_fd(fd);
> +    struct port_list *port_list = file->dev;

Looking at this, the file_ops don't need to have the C ABI.

The single caller already needs access to the file structure, so could
pass both file and fd in to the ops->close() function.  Thoughts?

> +
> +    LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
> +        port_dealloc(port_info);
> +    free(port_list);
> +
> +    return 0;
> +}
> +
> +static struct file_ops evtchn_ops = {

This wants to become const, when alloc_file_type() has been
appropriately const'd.

> +    .name = "evtchn",
> +    .close = minios_evtchn_close_fd,
> +    .select_rd = select_read_flag,
> +};
> +
>  /*
>   * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call supported
>   * in Mini-OS.
>   */
>  int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>  {
> -    int fd = alloc_fd(FTYPE_EVTCHN);
> +    int fd;
> +    struct file *file;
> +    struct port_list *list;
> +    static unsigned int ftype_evtchn;
>  
> -    if ( fd == -1 )
> +    if ( !ftype_evtchn )
> +        ftype_evtchn = alloc_file_type(&evtchn_ops);

Hmm.  MiniOS doesn't appear to support __attribute__((constructor)) but
this would be an ideal candidate.

It would remove a non-threadsafe singleton from a (largely unrelated)
codepath.

Should be very simple to add to MiniOS.  See Xen's init_constructors(),
and add CONSTRUCTORS to the linker file.

> @@ -134,42 +171,43 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
>  
>  static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs, void *data)
>  {
> -    int fd = (int)(intptr_t)data;
> -    struct evtchn_port_info *port_info;
> +    xenevtchn_handle *xce = data;
> +    struct file *file = get_file_from_fd(xce->fd);
> +    struct port_info *port_info;
> +    struct port_list *port_list;
>  
> -    assert(files[fd].type == FTYPE_EVTCHN);
> +    assert(file);
> +    port_list = file->dev;
>      mask_evtchn(port);
> -    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
> +    LIST_FOREACH(port_info, port_list, list)
>      {
>          if ( port_info->port == port )
>              goto found;
>      }
>  
> -    printk("Unknown port for handle %d\n", fd);
> +    printk("Unknown port for handle %d\n", xce->fd);

As you're editing this line anyway, it really wants to become "Unknown
port %d for handle %d\n".

~Andrew

