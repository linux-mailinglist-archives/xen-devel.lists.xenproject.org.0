Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1884B0BE7A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 10:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051134.1419413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlh0-0002bt-3R; Mon, 21 Jul 2025 08:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051134.1419413; Mon, 21 Jul 2025 08:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlh0-0002a3-0l; Mon, 21 Jul 2025 08:16:14 +0000
Received: by outflank-mailman (input) for mailman id 1051134;
 Mon, 21 Jul 2025 08:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gt3j=2C=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1udlgy-0002Zx-F1
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 08:16:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f07be292-660a-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 10:16:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 4DA464EE3CC1;
 Mon, 21 Jul 2025 10:16:01 +0200 (CEST)
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
X-Inumbo-ID: f07be292-660a-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753085761;
	b=B2XBp0iH0wshcae+Mok7SAloDqTyrHB7PCfkZA6cRix8L6NHTWTpWtDdtEJoksng2ci3
	 FZyuhepg76k/DbO700YezbUSYz0Q+CqIhmgFagBxbWw7iY3hY/cO+VM2Ik3sMYJXQGW8s
	 JJEhgLFT3ieBdM+7G4EKONciXdWQb/wbbsYRPFuIiznyXsYA/VnfAanNsFzsDqYW3PRbS
	 kpuot/sY9lVvaY3FsZ2pj+u3W8WYwwiSNFIXAqPqEUC8NAgVeIG0AKsEtk+qFkPO1HYJo
	 EownmMu/E/thNfprCDta+U5leJjhvrv6CZJZ2+m8N65eeK8mlXaKGPuxPg65maZokOau4
	 NiUujM48A6120hTQRGKdu9buUQGqRFIlDOqRNSpyTlSlFwPCzttAnaxE+sWsPkrHq7Z0m
	 ZzycrOsiSpe5aVTGyN0QyVTnDbSsn+wuIvfgrWostpNu0zqwoAnNnFhESCi/NAZHHEtpv
	 A09f67OyxkCMhOMIEAWEP2bYhkPqFmnt+JgoZzDE1A8fDqSezTXmoV5ISgzBHrcBKHKZN
	 zL4+jTz8Z47UX3sRTLGVztaAyXMeW7h8iQedjf0sIktH+WeSAiSoQ9hs2b3B3CPDli/l7
	 lq244/aIFZgdOh4+t8IK+kk/imU7bkMFnD8mS/YKpKvCusOL8UFRI4YhQDXWUqo=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753085761;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=jNMP2R96hCKypK1inf8fOGNIpBIeNLye0mCnolOcfGM=;
	b=qfGyNqhjoVvQXBLnz66bTtXIFiuSYYoyQe8BtAfAY4etx1HuOhctDaklbtl0LLN5YoNC
	 BRbmYpjR8RTRn4amPTKMuipyM7SoZGLOo38WkyDrrhrcUBG3FLi/VeaGd5Ax8+iyD/k2a
	 /cWe3Nv7enW8ir56rsUOF0HogB9oHcsmQOay7TxmKcSeKsNHZ2FQ+F/XFg3UWRnV30OB7
	 Mhjmzv213b1zkhbQsonQzv90xi2tUA8KRkrRRP18I/P/E09DKsN2hJoYpXohz2YAu0NGB
	 HoAPeeSISpHVjQYt01NQ/UWcNILkhxpqiaS5EmLKXYqXgXQqRxaQ3QDN6vhGT0aMWK970
	 AAP2Ha048Bp7vSmFo408sfeE/edq/bzkln0LL4rtniWDMsjq6uYjDLeZCCRHl3f1kgRKH
	 lyTTLt9IgkHjrCRpk2I/UNuHSTEd8ApMb7/W6XZhTd3HOflIcqNMM6+oO6/3CVj3utKQc
	 d8XrUJ/fZGJPVXnaUqhpLAT0TUXYxbUoREaPw8gl+8L291a821sfQQzM2gMZAlVnxzRG0
	 d5bKJvmjr+BuqY4mPfK5M85EAqExG9LuUjf5uCGYNBN5X7HL+bvY2WBuxN93b/1vIY4ko
	 FVfeYI/Xpg/fDv5b4Bu8Xy7QUWamPiytYekqJAsDHY0X84QDIySrM6JyzkxEO5k=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753085761; bh=+HP7YSMJLL1aYQ3l03wWOtb+M8h35x6AZwLRhxSDP8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MJj4pH7lZqp2XRfnRlMXXLrE8ZKY6Qe9xq4EfkEPEhe8MzmHJSxXmLfuy2q9q7NW7
	 /efd+7slyXd+CASXdkRzByEbi9bMQbadjKSfM3OOheW20I4gQgtsDGevCUTkUwMCs1
	 rY7TdDBEY5ZM5EvS/KKTXhTBRSxwSkxPGDEfOf4/oJIyjB2FGZHtA1iEwyA6sT0xHn
	 MqXpj+qymVrg0u4T/Xit1I0UkX/eI3arJJoqzBNCXzlOxGO6QgKzUFymk/OXhGYc3j
	 4s/s1iTND2doILJ3Kn/AnYU+AZAr9Vw5eRWwCkTQycmFUU/5puz5QDZKyrEjW5c7+m
	 IGE3cz0/jCCkQ==
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 10:16:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Rework TRY_LOAD_SEG() to use asm goto()
In-Reply-To: <dd20bc85-e5b3-480a-aaeb-4248a427f6ff@suse.com>
References: <20250718202548.2834921-1-andrew.cooper3@citrix.com>
 <dd20bc85-e5b3-480a-aaeb-4248a427f6ff@suse.com>
Message-ID: <714047917162481454c4cce050386125@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-21 08:41, Jan Beulich wrote:
> On 18.07.2025 22:25, Andrew Cooper wrote:
>> This moves the exception path to being out-of-line within the 
>> function, rather
>> than in the .fixup section, which improves backtraces.
>> 
>> Because the macro is used multiple times, the fault label needs 
>> declaring as
>> local.
>> 
>> No functional change.
>> 
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> 
>> Slightly RFC.  I haven't checked if Eclair will be happy with 
>> __label__ yet.
> 
> Even if it is, I guess you'd need to update the list of extensions we
> use (docs/misra/C-language-toolchain.rst)?
> 

Only for using the __label__ token in 
automation/eclair_analysis/ECLAIR/toolchain.ecl. The extension itself is 
already documented in 5590c7e6590d ("eclair: allow and document use of 
GCC extension for label addresses")

>> It is disappointing that, unless we retain the xor/mov for the 
>> exception path,
>> GCC decides to emit worse code, notably duplicating the mov %ds 
>> success path
>> in mov %es's error path.
> 
> Is it the pair of XOR/MOV, or merely the MOV (in which case it might be
> nice to try omitting at least the XOR)? Yet then the dual purpose of 
> the
> zero is likely getting in the way anyway.
> 
>> The "+r" constraint was actually wrong before; the asm only produces
>> all_segs_okay and does not consume it.
> 
> Yet it only conditionally set it in the old construct. That still needs
> expressing with "+r", or else the variable's earlier setting could all
> be eliminated. In the new construct using "=r" is okay.
> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1738,17 +1738,22 @@ static void load_segments(struct vcpu *n)
>>       * @all_segs_okay in function scope, and load NUL into @sel.
>>       */
>>  #define TRY_LOAD_SEG(seg, val)                          \
>> -    asm_inline volatile (                               \
>> -        "1: mov %k[_val], %%" #seg "\n\t"               \
>> -        "2:\n\t"                                        \
>> -        ".section .fixup, \"ax\"\n\t"                   \
>> -        "3: xor %k[ok], %k[ok]\n\t"                     \
>> -        "   mov %k[ok], %%" #seg "\n\t"                 \
>> -        "   jmp 2b\n\t"                                 \
>> -        ".previous\n\t"                                 \
>> -        _ASM_EXTABLE(1b, 3b)                            \
>> -        : [ok] "+r" (all_segs_okay)                     \
>> -        : [_val] "rm" (val) )
>> +    ({                                                  \
>> +        __label__ fault;                                \
>> +        asm_inline volatile goto (                      \
>> +            "1: mov %k[_val], %%" #seg "\n\t"           \
>> +            _ASM_EXTABLE(1b, %l[fault])                 \
>> +            :: [_val] "rm" (val)                        \
> 
> Thoughts on replacing "_val" by "sel" on this occasion?
> 
>> +            :: fault );                                 \
>> +        if ( 0 )                                        \
>> +        {                                               \
>> +        fault: __attribute__((cold));                   \
>> +            asm_inline volatile (                       \
>> +                "xor %k[ok], %k[ok]\n\t"                \
>> +                "mov %k[ok], %%" #seg                   \
>> +                : [ok] "=r" (all_segs_okay) );          \
> 
> Purely formally I think you need "=&r" here now.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

