Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8052C9F32
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 11:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41813.75277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk2vp-00036R-Bx; Tue, 01 Dec 2020 10:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41813.75277; Tue, 01 Dec 2020 10:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk2vp-000362-8x; Tue, 01 Dec 2020 10:30:49 +0000
Received: by outflank-mailman (input) for mailman id 41813;
 Tue, 01 Dec 2020 10:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kk2vn-00035x-Kj
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 10:30:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk2vl-0000mV-Dy; Tue, 01 Dec 2020 10:30:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk2vl-0007MT-49; Tue, 01 Dec 2020 10:30:45 +0000
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
	bh=Dv11DqHyCy/2lJw7+6ik3PRNikc0v30V0ItAaA2NVC8=; b=mYnFuashNVPl7xNQLg+YTHMg6X
	n+3TIo3m6LhGCgFHunqhzzQCaFXTzIcqxMfBejWmBAVJhNN8eEUWhHCzm3LXf0ZzCu51wr00hm+1j
	3SM7OddnXvI3PGaidQft8J+yL2Rmpxl3HOvX/S71xDw+nMJXmT62GClqm6UE/bntf7UQ=;
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
 <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
Date: Tue, 1 Dec 2020 10:30:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/12/2020 07:55, Jan Beulich wrote:
> On 01.12.2020 00:27, Oleksandr wrote:
>> On 30.11.20 23:03, Volodymyr Babchuk wrote:
>>> Oleksandr Tyshchenko writes:
>>>> --- a/xen/include/asm-arm/traps.h
>>>> +++ b/xen/include/asm-arm/traps.h
>>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
>>>>            (unsigned long)abort_guest_exit_end == regs->pc;
>>>>    }
>>>>    
>>>> +/* Check whether the sign extension is required and perform it */
>>>> +static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>>>> +{
>>>> +    uint8_t size = (1 << dabt.size) * 8;
>>>> +
>>>> +    /*
>>>> +     * Sign extend if required.
>>>> +     * Note that we expect the read handler to have zeroed the bits
>>>> +     * outside the requested access size.
>>>> +     */
>>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>>> +    {
>>>> +        /*
>>>> +         * We are relying on register_t using the same as
>>>> +         * an unsigned long in order to keep the 32-bit assembly
>>>> +         * code smaller.
>>>> +         */
>>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>>> +        r |= (~0UL) << size;
>>> If `size` is 64, you will get undefined behavior there.
>> I think, we don't need to worry about undefined behavior here. Having
>> size=64 would be possible with doubleword (dabt.size=3). But if "r"
>> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
>> we deal with byte, halfword or word operations (dabt.size<3). Or I
>> missed something?
> 
> At which point please put in a respective ASSERT(), possibly amended
> by a brief comment.

ASSERT()s are only meant to catch programatic error. However, in this 
case, the bigger risk is an hardware bug such as advertising a sign 
extension for either 64-bit (or 32-bit) on Arm64 (resp. Arm32).

Actually the Armv8 spec is a bit more blurry when running in AArch32 
state because they suggest that the sign extension can be set even for 
32-bit access. I think this is a spelling mistake, but it is probably 
better to be cautious here.

Therefore, I would recommend to rework the code so it is only called 
when len < sizeof(register_t).

Cheers,

-- 
Julien Grall

