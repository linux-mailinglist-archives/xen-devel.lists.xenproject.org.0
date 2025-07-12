Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50BB02A71
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 12:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041795.1412386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXc0-00089x-HG; Sat, 12 Jul 2025 10:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041795.1412386; Sat, 12 Jul 2025 10:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXc0-00088Q-E1; Sat, 12 Jul 2025 10:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1041795;
 Sat, 12 Jul 2025 10:37:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXby-00088K-Lq
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:37:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXbt-00Dn4G-1x;
 Sat, 12 Jul 2025 10:37:37 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXbt-000squ-15;
 Sat, 12 Jul 2025 10:37:37 +0000
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
	bh=zB7Ww1POl9dJomDcJbBpSHDxmZDyvnA6uedPhX9f1Xs=; b=ZAlzTMFNs01ps3fjmnCjNhO7wL
	4vAAgy2zYjkmuVH7Zhs9S6xvP8V96zHx8Nws8EbAJKVbHKMhxNZRn8sekf373AVt6yVZCi1vgKI7g
	wWbvHHkCPIYpe23MC6S0mU/YkkxwmMK9SrnYMtWMU/nc7h9APLGE7/ALM1bLBqPRnMzk=;
Message-ID: <e246c2ce-dddf-49bb-8013-cbc302fe5ff0@xen.org>
Date: Sat, 12 Jul 2025 11:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
 <d6ac150c-b2c0-4d90-af1e-64f2df151e60@xen.org>
 <5e52900c-97fb-4895-bde5-33ccfb132986@suse.com>
 <079ead0e-e613-4c58-89f4-8a0df1294ba9@xen.org>
 <e599c29f-03e4-40e7-99df-33b7f2143fbd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e599c29f-03e4-40e7-99df-33b7f2143fbd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Sorry for the late answer.

On 03/07/2025 11:04, Jan Beulich wrote:
> On 03.07.2025 10:52, Julien Grall wrote:
>> On 02/07/2025 14:37, Jan Beulich wrote:
>>> On 02.07.2025 15:18, Julien Grall wrote:
>>>> On 02/07/2025 14:06, Jan Beulich wrote:
>>>>> When the bumping by <nr> (instead of just 1) was introduced, a comment
>>>>> was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
>>>>> code path can in principle be taken (depending on configuration coming
>>>>> from the outside), and we shouldn't assert anything we didn't check
>>>>> elsewhere.
>>>>
>>>> I suggested to add the ASSERT_UNREACHABLE (see [1]). My take is the
>>>> overflow is not something that should happen and it is good to be able
>>>> to catch very clearly in debug build.
>>>
>>> But catching an anomalous entry in DT (which aiui the values come from,
>>> even if perhaps indirectly) isn't going to depend on people using debug
>>> builds. It depends on what DT blobs they use. And issues there shouldn't
>>> be checked by assertions, as those blobs live outside of Xen.
>>
>> I agree we probably want check upfront. But I still don't think we want
>> to remove this ASSERT_UNREACHABLE().
>>
>> By the way, I am not asking you to add those checks.
> 
> Sure, I wouldn't even know where and what. I can re-send just the comment
> change, but that would feel wrong as long as the ASSERT_UNREACHABLE() is
> actually reachable.

I am guessing you mean this change:

          /*
-         * Count ==  0: Page is not allocated, so we cannot take a 
reference.
-         * Count == -1: Reference count would wrap, which is invalid.
+         * Count ==   0: Page is not allocated, so we cannot take a 
reference.
+         * Count >= -nr: Reference count would wrap, which is invalid.
           */

If so, I think it is still valid regardless whether we continue to use 
ASSERT_UNREACHABLE().	

Cheers,

-- 
Julien Grall


