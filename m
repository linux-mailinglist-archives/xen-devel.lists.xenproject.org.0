Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC141A0727F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868015.1279556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpY6-00012i-N7; Thu, 09 Jan 2025 10:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868015.1279556; Thu, 09 Jan 2025 10:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpY6-00010A-Jq; Thu, 09 Jan 2025 10:13:58 +0000
Received: by outflank-mailman (input) for mailman id 868015;
 Thu, 09 Jan 2025 10:13:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tVpY5-000102-Fv
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:13:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tVpXw-00CjsF-08;
 Thu, 09 Jan 2025 10:13:48 +0000
Received: from lfbn-gre-1-248-145.w90-112.abo.wanadoo.fr ([90.112.205.145]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tVpXv-009DaG-37;
 Thu, 09 Jan 2025 10:13:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=9tmbhfhUfBgbbojY26HWM7Bm8oOBTYN0N1sCjYdDK/o=; b=DxY3FbPQPuQw1c5MViigEAbIP8
	MZ1jDg09m7OpztLiJhAPUD0FpbQY7szXezM3Pbw2Y4kg1hqAY+IjNQKzysuznc0Zb/HUmaQAiT0ht
	StUM8NiNtULQltoN5gU4afQohn4GJNzpW16WsGfDRJmzEkhJ7IKoPHM58AJxiRtrULMM=;
Date: Thu, 9 Jan 2025 11:13:45 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen/console: fix error handling in
 xen_console_device_create()
Message-ID: <Z3-hWRLyMldV4ZZD@l14>
References: <20250107093140.86180-1-roger.pau@citrix.com>
 <20250107093140.86180-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107093140.86180-2-roger.pau@citrix.com>

On Tue, Jan 07, 2025 at 10:31:39AM +0100, Roger Pau Monne wrote:
> The usage of error_prepend() in some of the error contexts of
> xen_console_device_create() is incorrect, as `errp` hasn't been initialized.
> This leads to the following segmentation fault on error paths resulting from
> xenstore reads:
> 
> Program terminated with signal SIGSEGV, Segmentation fault.
> Address not mapped to object.
>     fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50)
>     at ../qemu-xen-dir-remote/util/error.c:142
> 142         g_string_append(newmsg, (*errp)->msg);
> [...]
> (gdb) bt
>     (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50) at ../qemu-xen-dir-remote/util/error.c:142
>     (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ")
>     at ../qemu-xen-dir-remote/util/error.c:152
>     (backend=0x43944de00660, opts=0x43944c929000, errp=0x15cd0165ae10)
>     at ../qemu-xen-dir-remote/hw/char/xen_console.c:555
> 
> Replace usages of error_prepend() with error_setg() where appropriate.
> 
> Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  hw/char/xen_console.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> index ef0c2912efa1..af706c7ef440 100644
> --- a/hw/char/xen_console.c
> +++ b/hw/char/xen_console.c
> @@ -551,7 +551,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
>      }
>  
>      if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
> -        error_prepend(errp, "failed to read console device type: ");
> +        error_setg(errp, "failed to read console device type: ");

According to error_setg() doc, *errp must be NULL but xs_node_scanf may
set it. Looking at the implementation, error_setg() seems to simply
discard this new error message if *errp is already set.

Currently, when there's an I/O error, we get something like:
    failed to read console device type: failed to read from /xenstore/path: doesn't exist
and when the format scan failed:
    SEGV

With this patch, when there's an I/O error, I think we get something
like:
    failed to read from /xenstore/path: doesn't exist
and when the format scan failed:
    failed to read console device type: 


So I think we'll want to distiguish between IO error from
xs_node_scanf() and format error, first one returns EOF (like vsscanf)
and second one returns a value >= 0 but we expect exactly 1.


>          goto fail;
>      }
>  
> @@ -582,7 +582,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
>      } else if (number) {
>          cd = serial_hd(number);
>          if (!cd) {
> -            error_prepend(errp, "console: No serial device #%ld found: ",
> +            error_setg(errp, "console: No serial device #%ld found: ",
>                            number);

This change looks correct, ableit we could remove ":  " from the end of
the string since they shouldn't be anything after it.


Cheers,

-- 
Anthony PERARD

