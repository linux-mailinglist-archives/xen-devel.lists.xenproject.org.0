Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD77A12594
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 15:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872585.1283557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY43l-0005h3-7s; Wed, 15 Jan 2025 14:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872585.1283557; Wed, 15 Jan 2025 14:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY43l-0005du-4s; Wed, 15 Jan 2025 14:07:53 +0000
Received: by outflank-mailman (input) for mailman id 872585;
 Wed, 15 Jan 2025 14:07:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY43j-0005do-NP
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 14:07:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY43c-0060qZ-2j;
 Wed, 15 Jan 2025 14:07:45 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY43c-006QEO-2K;
 Wed, 15 Jan 2025 14:07:44 +0000
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
	bh=armD6io0RmDqTc+/mOgyLi04ESlkXMV9/yglO9pLXw0=; b=ELCdo7gswT3tSOyYzBii/HjChq
	OL9zDBqY86FBvnzXED86mSomHdsc2VVW1LFbTGv0eUdGIjl0yD0mMmublkZJMWaagkKz5v+oYJ9i9
	HkrzVV0PhTYOIf2eR8nOY0GzWAu6qjR7uDtIwgmBQkQpLXIj5YrBYovgztrj6v/uZjpI=;
Date: Wed, 15 Jan 2025 15:07:40 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] hw/xen: Add xs_node_read() helper function
Message-ID: <Z4fBLEig8GlAPCv2@l14>
References: <20250110093531.23221-1-roger.pau@citrix.com>
 <20250110093531.23221-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110093531.23221-2-roger.pau@citrix.com>

On Fri, Jan 10, 2025 at 10:35:30AM +0100, Roger Pau Monne wrote:
> diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
> index d8dcc2f0107d..6478d25be5e6 100644
> --- a/include/hw/xen/xen-bus-helper.h
> +++ b/include/hw/xen/xen-bus-helper.h
> @@ -37,6 +37,10 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
>                    const char *node, const char *key, Error **errp,
>                    const char *fmt, ...)
>      G_GNUC_SCANF(6, 7);
> +char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
> +                   unsigned int *len, Error **errp,
> +                   const char *node_fmt, ...)
> +    G_GNUC_PRINTF(5, 6);

Could you add a comment about this new functions? It's quite different
from every other function in this header which deal with a xenstore
path. Every other function use "${node}/${key}" (As explain in the
comment above xs_node_vscanf()), but this one uses a printf format in
`node_fmt` (which could probably better be named `path_fmt` instead).

Otherwise, patch looks fine to me.

Cheers,

-- 
Anthony PERARD

