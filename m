Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786DBB3EB5A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105141.1456102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6lm-0000An-10; Mon, 01 Sep 2025 15:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105141.1456102; Mon, 01 Sep 2025 15:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6ll-000095-UJ; Mon, 01 Sep 2025 15:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1105141;
 Mon, 01 Sep 2025 15:48:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ut6lk-00008z-Up
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:48:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ut6lj-001Dx9-2w;
 Mon, 01 Sep 2025 15:48:32 +0000
Received: from [2a02:8012:3a1:0:e5e9:9db0:73a2:cd65]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ut6lj-00C1vy-2x;
 Mon, 01 Sep 2025 15:48:32 +0000
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
	bh=hxVyG9pbLdUUXgWg15ovBtoL5TWNVgLUFEmlpQnGCv0=; b=LlqbTri3OKtQNSpprY01QKU1qg
	EY2mznl5MsskIXV/lu5jY01C8PkbnoOKUN2aR9fMjibnVSOBV9Gq/NxXqaDsEUApDYU3awPOUSaTk
	BjCN7tea8txFhSF2p1Xs+IPXwm6xc/J+nR1iKZ7Fz3o16r1pF9urRsdk5RyB1FbSG3JE=;
Message-ID: <93768b97-a8d4-4b2e-ac59-a2175fcd46be@xen.org>
Date: Mon, 1 Sep 2025 16:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <5f511d386c7f20b09106aa0202e0989477eff498.1756317702.git.leonid_komarianskyi@epam.com>
 <69bdbdac-4876-47de-b8db-ce6f3e1b7a24@xen.org>
 <8ad7cf86-ff85-4d56-b6b1-33fcb0dc0c54@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <8ad7cf86-ff85-4d56-b6b1-33fcb0dc0c54@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Leonid,

On 28/08/2025 17:17, Leonid Komarianskyi wrote:
> On 28.08.25 15:00, Julien Grall wrote:
>> Hi Leonid,
>>
>> On 27/08/2025 19:24, Leonid Komarianskyi wrote:
>>> Currently, many common functions perform the same operations to calculate
>>> GIC register addresses. This patch consolidates the similar code into
>>> a separate helper function to improve maintainability and reduce
>>> duplication.
>>> This refactoring also simplifies the implementation of eSPI support in
>>> future
>>> changes.
>>>
>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> ---
>>> Changes in V4:
>>> - no changes
>>>
>>> Changes in V3:
>>> - changed panic() in get_addr_by_offset() to printing warning and
>>>     ASSERT_UNREACHABLE()
>>> - added verification of return pointer from get_addr_by_offset() in the
>>>     callers
>>> - moved invocation of get_addr_by_offset() from spinlock guards, since
>>>     it is not necessarry
>>> - added RB from Volodymyr Babchuk
>>
>> Procces remark, here you said the Reviewed-by from Volodymyr was added
>> in v3. However, given the changes you made this should have been
>> invalidated (reviewed-by means the person read the code and confirmed it
>> is correct).
>>
>> I see Volodymyr confirmed his reviewed-by on v3. So no issue, but this
>> should have been clarified in the changelog.
>>
> 
> Thank you for your explanation.
> Just to clarify: would it be okay to leave the RB tag (with appropriate
> text in the changelog) if I fix some minor nit from another reviewer in
> the next version, like in this patch?

It depends on the change. In general, typoes or coding style changes (I 
include s/uX/uint_X) are fine to keep the review by. Anything else may 
need a review again.

Acked-by are different because they don't carry a full review. So for 
slightly bigger change it would be fine to keep. But if the logic is 
fully rewritten, then they would need to be dropped.

Cheers,

-- 
Julien Grall


