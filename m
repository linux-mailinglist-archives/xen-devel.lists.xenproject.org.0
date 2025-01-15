Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C6A12622
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 15:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872625.1283597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4V8-0003oc-4R; Wed, 15 Jan 2025 14:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872625.1283597; Wed, 15 Jan 2025 14:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4V8-0003mE-0J; Wed, 15 Jan 2025 14:36:10 +0000
Received: by outflank-mailman (input) for mailman id 872625;
 Wed, 15 Jan 2025 14:36:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY4V6-0003m3-Ma
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 14:36:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY4V0-0061ge-2w;
 Wed, 15 Jan 2025 14:36:03 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY4V0-006U5Y-2l;
 Wed, 15 Jan 2025 14:36:03 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=BzHVI2QHsblFL3UdSqVJ+hb2V1l2T08WDs3ev7B3rhU=; b=xX5GMUOF7fb6dPESjNoX3BU1Pt
	xYQSp1DvKS8gZEuQnyeqmVK43oN0bHMO89pCSUnersCo3ye9upzNNr0g7dwu0UGn6aXcbOJo54QgE
	DAIyQtU2LBsbuxLKVdygZtPrXLA8xez8lKro5Q/a6/+TMqipsB3nGXAKKT2wZU0mOA4s=;
Date: Wed, 15 Jan 2025 15:36:00 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/2] xen: do not use '%ms' scanf specifier
Message-ID: <Z4fH0NwPEmjryqoG@l14>
References: <20250110093531.23221-1-roger.pau@citrix.com>
 <20250110093531.23221-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110093531.23221-3-roger.pau@citrix.com>

On Fri, Jan 10, 2025 at 10:35:31AM +0100, Roger Pau Monne wrote:
> diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> index ef0c2912efa1..989e75fef88f 100644
> --- a/hw/char/xen_console.c
> +++ b/hw/char/xen_console.c
> @@ -550,7 +550,8 @@ static void xen_console_device_create(XenBackendInstance *backend,
>          goto fail;
>      }
>  
> -    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
> +    type = xs_node_read(xsh, XBT_NULL, NULL, errp, "%s/%s", fe, "type");
> +    if (!type) {
>          error_prepend(errp, "failed to read console device type: ");
>          goto fail;
>      }
> @@ -568,7 +569,8 @@ static void xen_console_device_create(XenBackendInstance *backend,
>  
>      snprintf(label, sizeof(label), "xencons%ld", number);
>  
> -    if (xs_node_scanf(xsh, XBT_NULL, fe, "output", NULL, "%ms", &output) == 1) {
> +    output = xs_node_read(xsh, XBT_NULL, NULL, errp, "%s/%s", fe, "output");

This now set `errp` on error, when `output == NULL`. In case `output` is
NULL, we check for `number` instead and may generate an error message
that probably doesn't really make sense.
    "console: No serial device #2 found: failed to read from /frontend_path/output"
And if number == 0, we tried to create a null device, and if that
failed, the error message will just be about the missing xenstore path
as error_setg() will not set `errp` again.

Could you keep ignoring errors from xs_node_read() like it was done with
xs_node_scanf() (I mean pass `NULL` instead of `errp`)? And we will need
another patch to fix the wrong use of `error_prepend()` and use
`error_setg` instead when `serial_hd()` fails.

> +    if (output) {
>          /*
>           * FIXME: sure we want to support implicit
>           * muxed monitors here?

Thanks,

-- 
Anthony PERARD

