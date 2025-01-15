Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C3A12929
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872895.1283899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6aQ-0004wU-HF; Wed, 15 Jan 2025 16:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872895.1283899; Wed, 15 Jan 2025 16:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6aQ-0004uX-Du; Wed, 15 Jan 2025 16:49:46 +0000
Received: by outflank-mailman (input) for mailman id 872895;
 Wed, 15 Jan 2025 16:49:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY6aP-0004tm-3Q
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:49:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY6aJ-00666Q-2D;
 Wed, 15 Jan 2025 16:49:39 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY6aJ-006iXJ-2B;
 Wed, 15 Jan 2025 16:49:39 +0000
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
	bh=giFZVBXvBz5ocUI8W7ZNYz1JX4g1+Rv5di62MVhfyX0=; b=YNYy+BDsm6/M7B/b0tosWcIXKC
	WK7Btz8FRB1hHViajVZHZPyqAFTJEtuiOtLQUlQsZKgKtjh3kYm4T+dVaIKBoW7l9BF/F/aoTp+SY
	9KoQ5g0mtUCo1n8wA6+r+xPqpfYbLGYC5dnF4yvkKFtC0wF35YTO2O4tdA7EymioQ4LY=;
Date: Wed, 15 Jan 2025 17:49:37 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>, xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: Re: [PATCH v3 7/7] hw/xen: Fix errp handling in xen_console
Message-ID: <Z4fnIQ8YbTP_i0U9@l14>
References: <20250115163542.291424-1-dwmw2@infradead.org>
 <20250115163542.291424-8-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115163542.291424-8-dwmw2@infradead.org>

On Wed, Jan 15, 2025 at 04:27:25PM +0000, David Woodhouse wrote:
> diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> index e61902461b..9e7f6da343 100644
> --- a/hw/char/xen_console.c
> +++ b/hw/char/xen_console.c
> @@ -581,19 +581,27 @@ static void xen_console_device_create(XenBackendInstance *backend,
>                         output);
>              goto fail;
>          }
> -    } else if (number) {
> -        cd = serial_hd(number);
> -        if (!cd) {
> -            error_prepend(errp, "console: No serial device #%ld found: ",
> -                          number);
> -            goto fail;
> -        }
> +    } else if (errno != ENOENT) {
> +        error_prepend(errp, "console: No valid chardev found: ");
> +        goto fail;
>      } else {
> -        /* No 'output' node on primary console: use null. */
> -        cd = qemu_chr_new(label, "null", NULL);
> -        if (!cd) {
> -            error_setg(errp, "console: failed to create null device");
> -            goto fail;
> +        if (errp) {

I don't think you need this check, with ERRP_GUARD() macro `errp` is
never NULL.

> +            error_free(*errp);

After this, I think you still need
    *errp = NULL;

> +        }
> +        if (number) {
> +            cd = serial_hd(number);
> +            if (!cd) {
> +                error_setg(errp, "console: No serial device #%ld found: ",

That error message doesn't need the ": " at the end anymore.

With those fixed: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Cheers,

-- 
Anthony PERARD

