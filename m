Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD061492861
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258560.445422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pU0-00052o-4B; Tue, 18 Jan 2022 14:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258560.445422; Tue, 18 Jan 2022 14:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pU0-00050r-0C; Tue, 18 Jan 2022 14:29:12 +0000
Received: by outflank-mailman (input) for mailman id 258560;
 Tue, 18 Jan 2022 14:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9pTy-0004yn-01
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:29:10 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe802bc6-786a-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 15:29:08 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48430)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9pTv-0002td-6X (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 14:29:07 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CCE4F1FC87;
 Tue, 18 Jan 2022 14:29:06 +0000 (GMT)
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
X-Inumbo-ID: fe802bc6-786a-11ec-a115-11989b9578b4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <44a8d75f-718c-ce72-4b5e-cd67df6087be@srcf.net>
Date: Tue, 18 Jan 2022 14:29:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-4-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [MINIOS PATCH v3 03/12] use alloc_file_type() and
 get_file_from_fd() in xs
In-Reply-To: <20220116083328.26524-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2022 08:33, Juergen Gross wrote:
> diff --git a/lib/xs.c b/lib/xs.c
> index 4af0f960..c12341aa 100644
> --- a/lib/xs.c
> +++ b/lib/xs.c
> @@ -18,23 +18,56 @@ static inline int _xs_fileno(struct xs_handle *h) {
>      return (intptr_t) h;
>  }
>  
> +static int xs_close_fd(struct file *file)
> +{
> +    struct xenbus_event *event, *next;
> +
> +    for (event = file->dev; event; event = next)
> +    {
> +        next = event->next;
> +        free(event);
> +    }
> +
> +    return 0;
> +}
> +
> +static bool xs_can_read(struct file *file)
> +{
> +    return file && file->dev;

Just 'return file->dev;' ?

> @@ -169,18 +202,20 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
>  
>  bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>  {
> -    int fd = _xs_fileno(h);
> +    struct file *file = get_file_from_fd(_xs_fileno(h));
> +
>      printk("xs_watch(%s, %s)\n", path, token);
>      return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
> -                   (xenbus_event_queue *)&files[fd].dev));
> +                   (xenbus_event_queue *)&file->dev));

This is utterly mad.  In particular, close() looks to be very racy with
new watches arriving.

However, can the indentation at least be fixed here as the line is
changing.  That's a parameter to xenbus_watch_path_token(), not xs_bool().

> diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> index b687678f..785389fb 100644
> --- a/xenbus/xenbus.c
> +++ b/xenbus/xenbus.c
> @@ -393,6 +393,7 @@ static int allocate_xenbus_id(void)
>  void init_xenbus(void)
>  {
>      int err;
> +

Spurious hunk?

~Andrew

