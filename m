Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B961ABF5B3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 15:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991861.1375660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjFM-00020h-EI; Wed, 21 May 2025 13:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991861.1375660; Wed, 21 May 2025 13:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjFM-0001yu-A7; Wed, 21 May 2025 13:12:36 +0000
Received: by outflank-mailman (input) for mailman id 991861;
 Wed, 21 May 2025 13:12:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uHjFL-0001yo-Mk
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 13:12:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uHjFL-005yf1-0D;
 Wed, 21 May 2025 13:12:34 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uHjFK-005USJ-1q;
 Wed, 21 May 2025 13:12:34 +0000
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
	bh=IXsdIHjx3NsnQcBO8ZJhdJ31Takj+JFk4b7Uzzyu7fc=; b=VAxRwJ9AGEzcXcaVArplwPTXXo
	PnSKfUlm9FSmuBdTapzCgFHOV+xS3tViEx5l/9Dd/UMpM71OpBDvAM1Cz040WatYek/cfKpPqhQQw
	XGDiOcLuMyfJjktKuZt2b2BLVrj2i6PbsO5/bHO0sfNOnQwx0qCY77YaQ7ZbaCSsDrjU=;
Date: Wed, 21 May 2025 15:12:32 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libxl: Only access legacy altp2m on HVM
Message-ID: <aC3RQAocK5Q2tHCj@l14>
References: <20250513154419.27860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513154419.27860-1-jason.andryuk@amd.com>

On Tue, May 13, 2025 at 11:44:19AM -0400, Jason Andryuk wrote:
> Only access the HVM union b_info->u.hvm on HVM guests.  The union
> access is not guarded, so this reads and sets the default even on
> non-HVM guests.  Usually this doesn't matter as PV and PVH unions are
> smaller and zero-initialized, but the zero default will be re-written as
> a -1 boolean.  Generally, it could incorrectly set b_info->altp2m
> through aliased data.
> 
> Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

