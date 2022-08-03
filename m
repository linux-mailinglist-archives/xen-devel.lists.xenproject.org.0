Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0922358896E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379692.613363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAga-00079y-Mk; Wed, 03 Aug 2022 09:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379692.613363; Wed, 03 Aug 2022 09:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAga-000778-IV; Wed, 03 Aug 2022 09:29:04 +0000
Received: by outflank-mailman (input) for mailman id 379692;
 Wed, 03 Aug 2022 09:29:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJAgZ-000770-Af
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:29:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJAgY-0004VH-IB; Wed, 03 Aug 2022 09:29:02 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.5.217]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJAgY-0001fC-Bc; Wed, 03 Aug 2022 09:29:02 +0000
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
	bh=tz0ZO9PH2uZOPqsTrl+pk1vk2oyFhioQJNmwT85gGkM=; b=lLvLTikOzRHPZQZFd/a0E2PSlj
	zKNlUdUXQ5r2yzfBf49T2bYvanunq0FwMnuV3MR5Se7/G5DzPdG5jqWTILeu6GBf+3y1kFXLXJqMu
	6+ahF7CUjb7SVj6b7z9ddD0D/mAdz91tcCqIUoXVFyfsHcK3iN/6U/HxbKri+xAX+WsE=;
Message-ID: <e52776d1-ed65-cf0d-bbc8-1431c183d73c@xen.org>
Date: Wed, 3 Aug 2022 10:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: preparations for 4.16.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <5622e17f-c424-87a4-d7c4-bbe1dee4743c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5622e17f-c424-87a4-d7c4-bbe1dee4743c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Bertrand)

On 27/07/2022 08:26, Jan Beulich wrote:
> All,

Hi Jan,

> the release is due in about two weeks time.
> 
> Please point out backports you find missing from the respective staging
> branch, but which you consider relevant. I'm surprised in particular
> that no Arm backports have appeared on the branch at all since 4.16.1
> had gone out.

Stefano is meant to look after the backports so I have held off doing 
them (although I don't really want to take that responsability :)). 
Below a potential list:

- af570d1c90f1 "xen/arm: Advertise workaround 1 if we apply 3"
- 95604873ccf5 "arm/its: enable LPIs before mapping the collection table"
- 407b13a71e32 "xen/arm: p2m don't fall over on FEAT_LPA enabled hw"
- aa1cba100bff "xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK"
- ee11f092b515 "xen: arm: Don't use stop_cpu() in halt_this_cpu()"
- 6655eb81092a "xen/arm: avoid overflow when setting vtimer in context 
switch"
- 25424d1a6b7b "xen/arm: head: Add missing isb after writing to 
SCTLR_EL2/HSCTLR"
- 800f21499e0e "arm/vgic-v3: fix virq offset in the rank when storing 
irouter"

Cheers,

-- 
Julien Grall

