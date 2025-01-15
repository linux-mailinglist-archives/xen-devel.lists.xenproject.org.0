Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51DA12908
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872872.1283870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6W1-0003T0-DB; Wed, 15 Jan 2025 16:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872872.1283870; Wed, 15 Jan 2025 16:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6W1-0003Qd-9v; Wed, 15 Jan 2025 16:45:13 +0000
Received: by outflank-mailman (input) for mailman id 872872;
 Wed, 15 Jan 2025 16:45:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY6Vz-0003QO-RB
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:45:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY6Vt-0065wR-1g;
 Wed, 15 Jan 2025 16:45:05 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY6Vt-006iO1-1e;
 Wed, 15 Jan 2025 16:45:05 +0000
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
	bh=mE4R8+YTkUIJeVfdLLew/uk/d+X6/7I/F+ktrfhdB34=; b=hycstYFjE+x9opHmSL+Hw+dL1k
	Cf9dDsO5u8RWbhp5/o9R61t5i10CALhnKICc04e+uQp1KRmynCawCifCrIqculUPlcL6WBl7/40qa
	JAzMp3npCKhlPmQMB7aqgcRlaNYvYlGB8kx6SeSxIGpw2OMXlNQL3emr9mjpeY2PDs+A=;
Date: Wed, 15 Jan 2025 17:45:03 +0100
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
Subject: Re: [PATCH v3 2/7] xen: do not use '%ms' scanf specifier
Message-ID: <Z4fmD4UZPcSdfEE8@l14>
References: <20250115163542.291424-1-dwmw2@infradead.org>
 <20250115163542.291424-3-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115163542.291424-3-dwmw2@infradead.org>

On Wed, Jan 15, 2025 at 04:27:20PM +0000, David Woodhouse wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> The 'm' parameter used to request auto-allocation of the destination variable
> is not supported on FreeBSD, and as such leads to failures to parse.
> 
> What's more, the current usage of '%ms' with xs_node_scanf() is pointless, as
> it just leads to a double allocation of the same string.  Instead use
> xs_node_read() to read the whole xenstore node.
> 
> Fixes: a783f8ad4ec9 ('xen: add a mechanism to automatically create XenDevice-s...')
> Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

