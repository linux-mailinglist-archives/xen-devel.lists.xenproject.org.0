Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D18BF5A99
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146954.1479289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB97w-0004Kp-An; Tue, 21 Oct 2025 09:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146954.1479289; Tue, 21 Oct 2025 09:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB97w-0004IZ-83; Tue, 21 Oct 2025 09:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1146954;
 Tue, 21 Oct 2025 09:57:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vB97u-0004IP-ME
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:57:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vB97u-00CfXG-0F;
 Tue, 21 Oct 2025 09:57:58 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vB97t-005Tey-2u;
 Tue, 21 Oct 2025 09:57:58 +0000
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
	bh=1Gsvqf3e/LzqT4p8LcpYiLytYpOlg0dgQVtmRDGm5Bw=; b=f0oZ5aqtzoHgZNMwi5CuTJNSTQ
	pmn2ablG0HC0EEH60vhTsjFG+XYiVNkfKzxp4yVRYMTFeG7UIjXrpPhml3KDY6iLiULTpG/lvvYOm
	ZdWqFmeJqLLitDbDJQHSmktIqMB80JGPgwA/jJDB68RoQujhZYdeixqf+YUAJFDCTLxY=;
Date: Tue, 21 Oct 2025 11:57:56 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH for-4.21] tools/xl: fix for dead code in
 list_domains_details()
Message-ID: <aPdZJBdAOqiy1Bgl@l14>
References: <20251020121959.54337-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020121959.54337-1-roger.pau@citrix.com>

On Mon, Oct 20, 2025 at 01:19:59PM +0100, Roger Pau Monne wrote:
> Commit d0193c6d6716 introduced checking for the return value of
> printf_info_one_json(), but failed to remove a further check down, which
> now Coverity complains is dead code.
> 
> The correct fix is to make the call to json_object_array_add() conditional
> on printf_info_one_json() having been successful, so that the further call
> to libxl_domain_config_dispose() is not avoided.
> 
> CID: 1667251
> Fixes: d0193c6d6716 ("tools/xl: check return value of printf_info_one_json() in list_domains_details()")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

