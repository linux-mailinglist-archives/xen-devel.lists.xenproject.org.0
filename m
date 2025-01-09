Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FDA0740E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868107.1279670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqGc-00049Z-Gb; Thu, 09 Jan 2025 10:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868107.1279670; Thu, 09 Jan 2025 10:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqGc-00045w-DJ; Thu, 09 Jan 2025 10:59:58 +0000
Received: by outflank-mailman (input) for mailman id 868107;
 Thu, 09 Jan 2025 10:59:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tVqGa-0003ot-7R
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:59:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tVqGU-00Ckur-38;
 Thu, 09 Jan 2025 10:59:51 +0000
Received: from lfbn-gre-1-248-145.w90-112.abo.wanadoo.fr ([90.112.205.145]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tVqGU-009H4r-2j;
 Thu, 09 Jan 2025 10:59:51 +0000
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
	bh=Xb8WmGVRb/vr/z5nwf4UmXY3kfsCsZcEmJes/p0baWo=; b=ghRRgBC3k/9uFoYqGU8pKpLzEL
	LnxzcjNJZxalmdPHZz3imf+etNf2Lu0rvndDrdIVCEIFVFV4iXiJdkhqW3/InpA8M9r2M8Y8bHHdK
	wm+dk2HNMDKVolfJP+CBYaMILNQ2dQe7dobqc3tcRBSGSrochTA2alblX0PkQITE8oSA=;
Date: Thu, 9 Jan 2025 11:59:48 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: do not use '%ms' scanf specifier
Message-ID: <Z3-sJMXpiFUoATHz@l14>
References: <20250107093140.86180-1-roger.pau@citrix.com>
 <20250107093140.86180-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107093140.86180-3-roger.pau@citrix.com>

On Tue, Jan 07, 2025 at 10:31:40AM +0100, Roger Pau Monne wrote:
> The 'm' parameter used to request auto-allocation of the destination variable
> is not supported on FreeBSD, and as such leads to failures to parse.
> 
> What's more, the current usage of '%ms' with xs_node_scanf() is pointless, as
> it just leads to a double allocation of the same string.  Instead use
> qemu_xen_xs_read() to read the whole xenstore node.
> 
> Fixes: a783f8ad4ec9 ('xen: add a mechanism to automatically create XenDevice-s...')
> Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  hw/char/xen_console.c | 11 +++++++++--
>  hw/xen/xen-bus.c      |  7 +++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> index af706c7ef440..18afd214c2f6 100644
> --- a/hw/char/xen_console.c
> +++ b/hw/char/xen_console.c
> @@ -531,6 +531,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
>      const char *name = xen_backend_get_name(backend);
>      unsigned long number;
>      char *fe = NULL, *type = NULL, *output = NULL;
> +    const char *node_path;

Is "const" correct when we are changing to which string `node_path` is
pointing at? Also, why "const"? Also, compiler complains that we can't
free a "const something*".

>      char label[32];
>      XenDevice *xendev = NULL;
>      XenConsole *con;
> @@ -550,7 +551,10 @@ static void xen_console_device_create(XenBackendInstance *backend,
>          goto fail;
>      }
>  
> -    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
> +    node_path = g_strdup_printf("%s/type", fe);
> +    type = qemu_xen_xs_read(xsh, XBT_NULL, node_path, NULL);
> +    g_free(node_path);

I feel like we want "xs_node_read()" which would be similair to
xs_node_vscanf() but would simply return the result of
qemu_xen_xs_read(). This would avoid the need format of the node path in
several place in the code. But it's OK like that as well.

Cheers,

-- 
Anthony PERARD

