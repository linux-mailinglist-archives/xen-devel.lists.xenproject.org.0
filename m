Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B339D8D4D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843116.1258769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfUG-0007Yw-Kh; Mon, 25 Nov 2024 20:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843116.1258769; Mon, 25 Nov 2024 20:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfUG-0007Vn-Gg; Mon, 25 Nov 2024 20:15:12 +0000
Received: by outflank-mailman (input) for mailman id 843116;
 Mon, 25 Nov 2024 20:15:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFfUE-0007Vh-WC
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:15:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfUE-0053Cp-1N;
 Mon, 25 Nov 2024 20:15:10 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfUE-005C1G-0y;
 Mon, 25 Nov 2024 20:15:10 +0000
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
	bh=h4A2y/4uBrKZJSLvFzQd2sHwJMlNO5gUQaXoieof/dc=; b=OsTNHTS77ol0KNvH56tNkTPalj
	A7I3H+4TRrtYeWwj585Ok2x6KhbS1ggkr6umP+c0HasdkKNzCZ9CI7L1FvdxqHXSK23Q8xayF220b
	ALfRTV94/TW3NzDsA+VFgxLpeMzjId6apJPcRtWSGXWbiZJnTSUztEp78pioKV+WT6mU=;
Message-ID: <7026ab4b-11b9-4ca1-9d33-581fc46b11e9@xen.org>
Date: Mon, 25 Nov 2024 20:15:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] Arm32: use new-style entry annotations for
 library code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <658f0a05-742e-44ed-bf3f-bd6bb8c694a7@suse.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <658f0a05-742e-44ed-bf3f-bd6bb8c694a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Sorry for the late answer.

On 01/10/2024 16:16, Jan Beulich wrote:
> No functional change, albeit all globals now become hidden, and aliasing
> symbols (__aeabi_{u,}idiv) as well as __memzero lose their function-ness
> and size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If the function-ness is important, some new construct would need
> inventing. Not setting size for the aliases may even be desirable, as
> I'm uncertain whether it is really legal in ELF that two entities
> overlap in space.

I can't think of a reason where we would need the "function-ness".

> 
> I fear I'm breaking __memzero(), as I don't understand the purpose of
> the ".word 0" next to where the FUNC_LOCAL() appears.

I am not entirely sure either. AFAIK, "0" is not a valid instruction.

This code was taken from Linux, the history doesn't give much clue 
because it seems the ".word 0" was added before Linux used git.

However, it looks like Linux replace __memzero with memset() 6 years ago 
on arm32. So maybe we should get rid of it? This would at least avoid 
worrying on the purpose of ".word 0".

The rest of the patch looks good to me.

Cheers,

-- 
Julien Grall

