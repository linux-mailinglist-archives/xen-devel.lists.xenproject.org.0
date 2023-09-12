Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524779D862
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 20:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600703.936452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg7oH-0006GF-M1; Tue, 12 Sep 2023 18:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600703.936452; Tue, 12 Sep 2023 18:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg7oH-0006Cp-IU; Tue, 12 Sep 2023 18:08:25 +0000
Received: by outflank-mailman (input) for mailman id 600703;
 Tue, 12 Sep 2023 18:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YY/q=E4=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qg7oG-0006Cj-Ck
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 18:08:24 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af8a122-5197-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 20:08:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 32D9782856E8;
 Tue, 12 Sep 2023 13:08:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5d10FWiM5tGv; Tue, 12 Sep 2023 13:08:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 436F08285713;
 Tue, 12 Sep 2023 13:08:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YW7w8svlRWLo; Tue, 12 Sep 2023 13:08:18 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BCA0E82856E8;
 Tue, 12 Sep 2023 13:08:17 -0500 (CDT)
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
X-Inumbo-ID: 5af8a122-5197-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 436F08285713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694542098; bh=xYCNi9uY9zXPATSSt/FI4NbEkh5aL2fadK98ItLA1Gc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=ovIH8QMwyShvWHlQpivfMDe6ae5ioA/tshMsah3sezQeE4/3dSaB3w6hPK2HZ3JpC
	 6mlofPbJW5vHPWRjEGACSJL/1nTM7Pc+rmkrVlBHccpeZC5EdNfHi9kmq1KQKwd2kM
	 aW7XPZ8Vl2Uo/0wzb1eAVAV3+G1EuUk0NyP4RIFg=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <b92b75f9-67b0-33ef-00d6-4ccf516a4cc9@raptorengineering.com>
Date: Tue, 12 Sep 2023 13:08:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <31292b9b259a401045646d50a7237364640bc85b.1694211900.git.sanastasio@raptorengineering.com>
 <65b367b2-34b7-0887-6f29-8cb8e77ede7f@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <65b367b2-34b7-0887-6f29-8cb8e77ede7f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/23 8:53 AM, Jan Beulich wrote:
> On 09.09.2023 00:50, Shawn Anastasio wrote:
>> +/**
>> + * test_bit - Determine whether a bit is set
>> + * @nr: bit number to test
>> + * @addr: Address to start counting from
>> + */
>> +static inline int test_bit(int nr, const volatile void *addr)
>> +{
>> +    const volatile unsigned long *p = (const volatile unsigned long *)addr;
>> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
>> +}
> 
> Do you really mean unsigned long in here? (As an aside I'd also recommend
> to drop the cast; I don't think it's needed for anything.)
>

Good point -- this should definitely be int.

>> +static inline unsigned long test_and_clear_bits(
>> +    unsigned long mask,
> 
> While apparently benign here, perhaps also better to use unsigned int.
> (Looks like I even missed instances yet further up.)
> 
>> +    volatile unsigned int *p)
>> +{
>> +    unsigned long old, t;
> 
> I'm less certain here, because I don't know what exactly "r" permits on
> ppc. (Having said that I notice that mask also is used with an "r"
> constraint, so restrictions would then apply there as well. But if long
> is really needed in various placed, then I would say that a comment is
> warranted, perhaps next to the BITOP_* defines.)
>

I've tested it and it seems "r" works as expected with 32-bit operands,
so there should be no problem changing these longs to ints.

>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx %0,0,%3,0\n"
>> +                   "andc %1,%0,%2\n"
>> +                   "stwcx. %1,0,%3\n"
>> +                   "bne- 1b\n"
>> +                   PPC_ATOMIC_EXIT_BARRIER
>> +                   : "=&r" (old), "=&r" (t)
>> +                   : "r" (mask), "r" (p)
>> +                   : "cc", "memory" );
>> +
>> +    return (old & mask);
>> +}
>> +
>> +static inline int test_and_clear_bit(unsigned int nr,
>> +                                     volatile void *addr)
>> +{
>> +    return test_and_clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
>> +                               BITOP_WORD(nr)) != 0;
> 
> I think this is misleading wrapping of arguments. Even if not strictly
> mandated, imo if an argument doesn't fit on the rest of a line it should
> start on a fresh one.
>

Will fix.

> Jan

Thanks,
Shawn

