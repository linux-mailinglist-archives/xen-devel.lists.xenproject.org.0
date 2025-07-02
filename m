Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CDAF585E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031134.1404853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxLz-0001pJ-Jt; Wed, 02 Jul 2025 13:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031134.1404853; Wed, 02 Jul 2025 13:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxLz-0001nI-H1; Wed, 02 Jul 2025 13:18:23 +0000
Received: by outflank-mailman (input) for mailman id 1031134;
 Wed, 02 Jul 2025 13:18:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uWxLy-0001mw-B8
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:18:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWxLx-00EiaQ-1F;
 Wed, 02 Jul 2025 13:18:21 +0000
Received: from [2a02:8012:3a1:0:694b:6608:aaf6:1a4c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWxLx-008ELo-0c;
 Wed, 02 Jul 2025 13:18:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ixruQnGhY+U9HaPTddMoH9aDRLowOu2FYYvN7LNV2UQ=; b=xPFbn7rqeNTN+YY/H9TxsDN29/
	nXo2Y2Jlhx02SR1NpHw/IcQgqh2HUshlzEdeskbLlH6BHi5bOUYtVWQbOf64Fu20wNWO+M2VhSSvI
	5uGi0iq2vBUgn4RqtwxZs8wIqBo7f/wGtu4WZPUcSAvN1knvRqYQqzTpZmtFOCxSl9Nk=;
Message-ID: <d6ac150c-b2c0-4d90-af1e-64f2df151e60@xen.org>
Date: Wed, 2 Jul 2025 14:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/07/2025 14:06, Jan Beulich wrote:
> When the bumping by <nr> (instead of just 1) was introduced, a comment
> was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
> code path can in principle be taken (depending on configuration coming
> from the outside), and we shouldn't assert anything we didn't check
> elsewhere.

I suggested to add the ASSERT_UNREACHABLE (see [1]). My take is the 
overflow is not something that should happen and it is good to be able 
to catch very clearly in debug build.

So I am reluctant to remove it at the moment.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/47b4d6c2-3bc7-02bc-be5a-a2b782541c3c@xen.org/

-- 
Julien Grall


