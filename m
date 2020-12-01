Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F72C98B5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 08:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41604.74878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0VR-00013s-If; Tue, 01 Dec 2020 07:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41604.74878; Tue, 01 Dec 2020 07:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0VR-00013T-FQ; Tue, 01 Dec 2020 07:55:25 +0000
Received: by outflank-mailman (input) for mailman id 41604;
 Tue, 01 Dec 2020 07:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk0VP-00013O-Kv
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 07:55:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5b2c199-83e1-4d7e-92fe-95a6614cf103;
 Tue, 01 Dec 2020 07:55:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14557AC2F;
 Tue,  1 Dec 2020 07:55:22 +0000 (UTC)
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
X-Inumbo-ID: d5b2c199-83e1-4d7e-92fe-95a6614cf103
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606809322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQbGmZorjHVggPDNorqVk7pQ8bzwkxtNEbHZ9tsGUkg=;
	b=NvEaPa/nN/uNhHGiOmVDqIlZUgJFvgL7jhpCk6ym0fx5P7GiS2GnR2QCgg5XmZkeiimY3T
	0CuYaq35JlsDHBUHQHDCadrKu+i9bo6sVQjAOe+VW4FNj6q07Nl33d7+0UgMSniFPYRWP/
	UsvZY7BjFphOsFLRf+ag7lEDiOWWPhE=
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
Date: Tue, 1 Dec 2020 08:55:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 00:27, Oleksandr wrote:
> On 30.11.20 23:03, Volodymyr Babchuk wrote:
>> Oleksandr Tyshchenko writes:
>>> --- a/xen/include/asm-arm/traps.h
>>> +++ b/xen/include/asm-arm/traps.h
>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
>>>           (unsigned long)abort_guest_exit_end == regs->pc;
>>>   }
>>>   
>>> +/* Check whether the sign extension is required and perform it */
>>> +static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>>> +{
>>> +    uint8_t size = (1 << dabt.size) * 8;
>>> +
>>> +    /*
>>> +     * Sign extend if required.
>>> +     * Note that we expect the read handler to have zeroed the bits
>>> +     * outside the requested access size.
>>> +     */
>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>> +    {
>>> +        /*
>>> +         * We are relying on register_t using the same as
>>> +         * an unsigned long in order to keep the 32-bit assembly
>>> +         * code smaller.
>>> +         */
>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>> +        r |= (~0UL) << size;
>> If `size` is 64, you will get undefined behavior there.
> I think, we don't need to worry about undefined behavior here. Having 
> size=64 would be possible with doubleword (dabt.size=3). But if "r" 
> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
> we deal with byte, halfword or word operations (dabt.size<3). Or I 
> missed something?

At which point please put in a respective ASSERT(), possibly amended
by a brief comment.

Jan

