Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A96A7272E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 00:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928317.1331043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txaOp-0005m9-SZ; Wed, 26 Mar 2025 23:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928317.1331043; Wed, 26 Mar 2025 23:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txaOp-0005k1-PW; Wed, 26 Mar 2025 23:43:07 +0000
Received: by outflank-mailman (input) for mailman id 928317;
 Wed, 26 Mar 2025 23:43:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txaOp-0005jv-75
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 23:43:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txaOp-00A0eu-07;
 Wed, 26 Mar 2025 23:43:06 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txaOo-000geB-1o;
 Wed, 26 Mar 2025 23:43:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=HPdeLpqgKCXuZy7EeEEyVbSmUyi3urxDzlJXEFTHgvg=; b=bMGt2Mbwn38EYypdgsv5Gx6QEO
	AfWJGC48Pp7x7ArTEH0XwH6GEv9uD342UYdUoIaGU9JkCgS6Fpb6Lp2qGq3M71Y4F1vC8gqggJ8lh
	GLbzmZ/Pk9BzUW2gMeO0T2fs301ugVb12shA4Swm6m+bWAYBtlGv55J0WZd88l0uzPcU=;
Message-ID: <9da66919-db6f-48fe-b9ba-1c44bff43ea6@xen.org>
Date: Wed, 26 Mar 2025 23:43:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <0f5cf498c3c511ed192e8b7b7d0f4987e00e5c0d.1742824138.git.bertrand.marquis@arm.com>
 <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
In-Reply-To: <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/03/2025 23:41, Julien Grall wrote:
> Hi Bertrand,
> 
> On 24/03/2025 13:53, Bertrand Marquis wrote:
>> When VM to VM support is activated and there is no suitable FF-A support
>> in the firmware, enable FF-A support for VMs to allow using it for VM to
>> VM communications.
> 
> tee/ and the callbacks associated are meant to be used for mediatiors. 
> My current interpretation ist this is only meant to interpose between a 
> guest and physical resources. Here you are extending the meaning to 
> "virtual TEE". I am sort of ok with that but ...
> 
>> If there is OP-TEE running in the secure world and using the non FF-A
>> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
>> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
>> probed first) so it is not recommended to activate the configuration
>> option for such systems.
> 
> ... this part is concerning me. You should be able to build with 
> CONFIG_FFA_VM_TO_VM and still boot when OP-TEE is present on the system. 
> This is not too critical now as this is tech preview but this is 
> definitely a blocker for making FFA supported. Can this be mentioned at 
> the top of the ffa.c file (which already contains existing blocker)?

Just to clarify, I meant without having the OP-TEE folks to force the 
TEE on the command line because this is a bit of a hack...

Cheers,

-- 
Julien Grall


