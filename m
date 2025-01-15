Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9378A12900
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872860.1283861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6VG-0002oN-5G; Wed, 15 Jan 2025 16:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872860.1283861; Wed, 15 Jan 2025 16:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6VG-0002la-1E; Wed, 15 Jan 2025 16:44:26 +0000
Received: by outflank-mailman (input) for mailman id 872860;
 Wed, 15 Jan 2025 16:44:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY6VF-0002lI-2C
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:44:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY6V5-0065vB-1a;
 Wed, 15 Jan 2025 16:44:15 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY6V5-006iNM-1O;
 Wed, 15 Jan 2025 16:44:15 +0000
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
	bh=SMDQ4zCFk0wf00K4czERKQpp4UcFPfCXWNTi2lvuzbE=; b=dwpgvUrbPKs+KkSUi/d15INanp
	hhHvqdXX6LMeyBQZzrjsT1YJuuYeAhYmfGTwFpif8Yvtc/aXGcPZLNTBwznJ62mLSiHpHraWqTb8I
	LB97K7NSQoBwu4ARGVZkW+8RPao4zvCTTCGE80J92xQEOmWOuR5MYysQQ6YydsPzGFq0=;
Date: Wed, 15 Jan 2025 17:44:13 +0100
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
Subject: Re: [PATCH v3 1/7] hw/xen: Add xs_node_read() helper function
Message-ID: <Z4fl3ZeDyOr1wZNw@l14>
References: <20250115163542.291424-1-dwmw2@infradead.org>
 <20250115163542.291424-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115163542.291424-2-dwmw2@infradead.org>

On Wed, Jan 15, 2025 at 04:27:19PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This returns the full contents of the node, having created the node path
> from the printf-style format string provided in its arguments.
> 
> This will save various callers from having to do so for themselves (and
> from using xs_node_scanf() with the non-portable %ms format string.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> [remove double newline and constify trace parameters]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

