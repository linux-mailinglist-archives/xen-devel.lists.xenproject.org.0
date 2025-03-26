Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20AA713C6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927382.1330128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txN9s-0003id-If; Wed, 26 Mar 2025 09:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927382.1330128; Wed, 26 Mar 2025 09:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txN9s-0003gW-G7; Wed, 26 Mar 2025 09:34:48 +0000
Received: by outflank-mailman (input) for mailman id 927382;
 Wed, 26 Mar 2025 09:34:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txN9r-0003gQ-Hf
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:34:47 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5b4792-0a25-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:34:46 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso50055965e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:34:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm227515815e9.22.2025.03.26.02.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:34:45 -0700 (PDT)
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
X-Inumbo-ID: 8e5b4792-0a25-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742981686; x=1743586486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nwcfmviDfc9HYBYFyoF0Thsj//TBc1EObkoKzxW+X70=;
        b=ldloEQzyAB5zHPHTPWXncm77nHtzN20t+7SGZ53Gh+JJYha2/quHZo8y5RkI5e1XCq
         tRIQRTcyILvAeUOqQ6mQ+sbtASALX16UCxJDx7EA5QcJGA/gOZNVr7+ymiYDDcoJbE+k
         s+fSKMZnJ/DU31vnoGBdDHKhF1Q340xYiW1yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981686; x=1743586486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwcfmviDfc9HYBYFyoF0Thsj//TBc1EObkoKzxW+X70=;
        b=bx8l4eJQevw0tRFYz6AqM0/iDd2UFiKzUEJMJ31XybWn3znGjD7v53XO/h5wnw/exC
         lf72NKj3YW7GZZbLummyVmYW/42KdEJHKoss/JqrEFTKrJn7Xr7jiVUn3YMDOCDPz4vb
         KQucLvRxAVUvhKmMMUuuDp8yHHjhP2gBDGPjht+xS5WC1j13BKr76LNTDTOav4+5JRa5
         JREdFqM1kW3qlm7bhZDM9QvG2Q4Eb0O/VMQNbOizQ60a8sMvEp3uOT9NCeMVlqW4K7e1
         eoJT5ItGty93YGdTFvfRAgxJDK0XkelvcEGhto4ZvnmQU4K13TmDP9TxqSoHYSuTWLvv
         xyfA==
X-Forwarded-Encrypted: i=1; AJvYcCU71HYrk0PJtVe1ITJg1XjHVpZXKoBmc66n4Vqdzjrlzvu5zQ08PewdHD4CmEX6JTdbqUTPOOsf21g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkTDvZ18mCKTLIi0i9vqqk06X/KN/3xmq+Lqf+0I9yK+dYvzd7
	tR1GzBK5uLeIrqOFbGYM5kX+gJ+uRsBrFbirENLU60WmmPLP4z8PGR/Y01KYOK4=
X-Gm-Gg: ASbGncuezX/hXz3j4B+0/gKQKLKlPQstVEZVpSsFRx6g7bo8ioDxuvQChCz14wnkuyS
	J2XXuMgWQ72E3AUgRFcDeNJ0JioAvq0FybwBovUbcjfFWmgNEjcl49bl9TYb/6+7fN97mAwZYvj
	WL781NdhroDOl4mxKxm/OWBoDYjRWvZKoD81IBdeTwsJTP05QXtxaPZbvFnu6072onbjfXPoOYR
	YCCzVqBA+1KWKgLj2fJDutTkY9Q/2EQuEvqryFO0UktIYXxLFO1lC+rmCpA+3LEMGlpxkgO4hr+
	ADffsBob1fs1u/2ZOxYd4xO+k7mHN0ELXDyPoAX9swJFWXaDIFHZcRsalLoqyD9Z4q4+g/m7Ax8
	ifg/Nejel3w==
X-Google-Smtp-Source: AGHT+IEGxOsLkuKpWZAx7NzTXS9XUQiUd+UK/tTMpfTBIzDZwHxySQxKAcZWTO04x44xUF/ZcVZOBw==
X-Received: by 2002:a05:600c:1d8f:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43d509f44f2mr212746085e9.16.1742981686086;
        Wed, 26 Mar 2025 02:34:46 -0700 (PDT)
Message-ID: <a57c2ae0-2c9f-4fac-9ebb-a570f0f2cabc@citrix.com>
Date: Wed, 26 Mar 2025 09:34:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Account for POPCNT errata on earlier Intel
 CPUs
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325185219.315319-1-andrew.cooper3@citrix.com>
 <56fbd614-2b46-4cc2-88f3-e244aedd5479@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <56fbd614-2b46-4cc2-88f3-e244aedd5479@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 9:20 am, Jan Beulich wrote:
> On 25.03.2025 19:52, Andrew Cooper wrote:
>> It turns out that LZCNT/TZCNT have the same input dependent bug, prior to
>> Skylake.
> These two do, but BSF/BSR don't? Pretty odd.

BSF/BSR have true input dependencies.  They both have cases where the
destination register is left unmodified.

>
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -488,10 +488,16 @@ static always_inline unsigned int arch_hweightl(unsigned long x)
>>       *
>>       * This limits the POPCNT instruction to using the same ABI as a function
>>       * call (input in %rdi, output in %eax) but that's fine.
>> +     *
>> +     * On Intel CPUs prior to Cannon Lake, the POPCNT instruction has a false
>> +     * input dependency on it's destination register (errata HSD146, SKL029
>> +     * amongst others), impacting loops such as bitmap_weight().  Insert an
>> +     * XOR to manually break the dependency.
>>       */
> With this being an Intel-only issue, wouldn't we better ...
>
>>      alternative_io("call arch_generic_hweightl",
>> +                   "xor %k[res], %k[res]\n\t"
> ... put this line in #ifdef CONFIG_INTEL then? The extra overhead is small, but
> I see no reason not to avoid it if we can. (I realize that's not quite as
> straightforward as it reads, for alternative_io() being a macro.)

For an XOR, no; not worth the complexity.

Besides, this gets used a whole 5 locations in the hypervisor, after I
cleaned up the paths which shouldn't have been using hweight() in the
first place.

~Andrew

