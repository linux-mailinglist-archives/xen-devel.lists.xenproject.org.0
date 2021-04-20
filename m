Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E453658C8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113582.216453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpJi-0005By-2P; Tue, 20 Apr 2021 12:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113582.216453; Tue, 20 Apr 2021 12:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpJh-0005BZ-VC; Tue, 20 Apr 2021 12:17:21 +0000
Received: by outflank-mailman (input) for mailman id 113582;
 Tue, 20 Apr 2021 12:17:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYpJg-0005BU-6k
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:17:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpJe-0000RI-OU; Tue, 20 Apr 2021 12:17:18 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpJe-0004Fp-IH; Tue, 20 Apr 2021 12:17:18 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=GYaLSacBOXJid1sKdnIt3sLJgN4/gjSCd/oSZzGcFYU=; b=qUv6abHlmL2pTh/oRx6sgDW1Zq
	xygZKd+QcyRyO4JEwLbMuryzfmcDq+jmFyPBX4jglMWb8Kq+G+r6RpzNrtY22JAQnig5RWJnEvBOm
	3M12v6n6aNAAseQn23FlJ53bs3kVOmAEnoi6ToqahEBU21V6kNXpmMVjHk9OO4gRvDWE=;
Subject: Re: [PATCH v4] xen/arm64: Place a speculation barrier following an
 ret instruction
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210418180334.7829-1-julien@xen.org>
 <0433E681-2E59-42B2-88FB-94A56EF2E303@arm.com>
 <alpine.DEB.2.21.2104191124440.4885@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <7e83049f-7a22-5322-e5c7-c2faf4caaf57@xen.org>
Date: Tue, 20 Apr 2021 13:17:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104191124440.4885@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 19/04/2021 19:24, Stefano Stabellini wrote:
> On Mon, 19 Apr 2021, Bertrand Marquis wrote:
>> Hi Julien,
>>
>>> On 18 Apr 2021, at 19:03, Julien Grall <julien@xen.org> wrote:
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Some CPUs can speculate past a RET instruction and potentially perform
>>> speculative accesses to memory before processing the return.
>>>
>>> There is no known gadget available after the RET instruction today.
>>> However some of the registers (such as in check_pending_guest_serror())
>>> may contain a value provided by the guest.
>>>
>>> In order to harden the code, it would be better to add a speculation
>>> barrier after each RET instruction. The performance impact is meant to
>>> be negligeable as the speculation barrier is not meant to be
>>> architecturally executed.
>>>
>>> Rather than manually inserting a speculation barrier, use a macro
>>> which overrides the mnemonic RET and replace with RET + SB. We need to
>>> use the opcode for RET to prevent any macro recursion.
>>>
>>> This patch is only covering the assembly code. C code would need to be
>>> covered separately using the compiler support.
>>>
>>> Note that the definition of the macros sb needs to be moved earlier in
>>> asm-arm/macros.h so it can be used by the new macro.
>>>
>>> This is part of the work to mitigate straight-line speculation.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks both! I have committed the patch.

Cheers,

-- 
Julien Grall

