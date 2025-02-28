Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6CA49EB4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899006.1307507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to3A8-0001dn-5h; Fri, 28 Feb 2025 16:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899006.1307507; Fri, 28 Feb 2025 16:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to3A8-0001ad-2c; Fri, 28 Feb 2025 16:24:32 +0000
Received: by outflank-mailman (input) for mailman id 899006;
 Fri, 28 Feb 2025 16:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTn8=VT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1to3A6-0001aV-MU
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:24:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b09e8cc-f5f0-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 17:24:27 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1400284f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 08:24:27 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7a73sm5815365f8f.50.2025.02.28.08.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 08:24:26 -0800 (PST)
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
X-Inumbo-ID: 7b09e8cc-f5f0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740759867; x=1741364667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JuT8/Tb0yflmid11CRxqXhGIEuAv6Oa31I+EXBmpJgg=;
        b=eab6rUXlXZF+IEL8O+NM7ZcDz2Kxmf3gps4qGw0rAGtIguOCQ1tOPzp7ptB9FUpj4o
         ytkO8kfI6TjsKodZk0TN8R2XeNYZvJ6r7KwXttejR37hl4M3DQFmUhqllC62I3snoM4c
         Ez48cB9kUEvKuGMABbsAFxyBlibV5wDwh9LGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759867; x=1741364667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuT8/Tb0yflmid11CRxqXhGIEuAv6Oa31I+EXBmpJgg=;
        b=f1ZKVRm717ZZWBzqEgfbnzgVDqoMClMz3gct5+t/UIcxytrOnJ393/mllK6thElUIz
         Ys8HO6D0cdOobKs+hP8CsLgXUpg6mUy/UTi0G2SKtrrPZO5IMBNQv4mKHmTe6BE4q1Bt
         oYzyfMRoHKJ1f5+7cpjArdGB7f61l6lBQFnfYL2wOZ3pa8mO9c2jL9HCfwOFi7bfKNzA
         4VuTFStJVlWyDQABzDbKMJgoi7yXDD5DsHULKt+39eh2KnbaGEFQAT604H69bk8/0f1p
         1WknilbPb2b2kHri+gLHzAzVJz8zHcEypBU8+kN49AY0G7FnJkfdHXAOShmi2ZxxBEXg
         i6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVYC2rrVwWeFHpjPaqwZC/b7+4Be4jOvZXGD6pWIUgdQ4TgiUNtVeXUPu9Qjxxwr3wCWUgbTgZgi+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqfxULwJ49AZTBWcfGBWkUfPgqH9fNTegNrFSHzXdJ8IrmdQir
	uX6zthKiYvBvKetzDadbc5ALGFh0u2wDbETRR5QYeH6QzRmMc1Das/clRtn0JGQ=
X-Gm-Gg: ASbGncsPJ95ha04V+kpH/RjVmWJd1fuPfoRY6u/9xJLU6EXgaq2CRKhseRt6jcpdcsF
	/bXXGyAW7tgK83ImP0ySNFkXUhwc1+O2BXD+aUWF2Q/D3nNlfwN43/meB8AXtTWs3X8gCKALWCY
	5sOUqAl6uwtgveU3kr9wpY2nzDy1C+Q0b+uCoXGObLHD78GnkD/Rvg3YjaIB6s3mwdHVBuOGhHW
	UxE2x26XUdHXkawGNU8lWx5KoeRmNNqI935a7MIDQ36sIa/QJn0xrGiZGeeIrllOWlUvcj9DjDM
	GHvsjcRViZfpbZ5kA8+eJa5GqUDqq1bBtsLI
X-Google-Smtp-Source: AGHT+IEzzWAKvD9BEVkv4Ur7qkWftp8dx5c49b0R9WaOC/KSQjZGY1aK0ePHqGSbSzCluAK8wAcbSg==
X-Received: by 2002:a5d:598d:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-390ec7c6adbmr3315549f8f.8.1740759867235;
        Fri, 28 Feb 2025 08:24:27 -0800 (PST)
Message-ID: <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
Date: Fri, 28 Feb 2025 16:24:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/02/2025 8:11 am, Jan Beulich wrote:
> On 26.02.2025 18:20, Andrew Cooper wrote:
>> --- a/xen/arch/riscv/include/asm/bitops.h
>> +++ b/xen/arch/riscv/include/asm/bitops.h
>> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>>  #undef NOT
>>  #undef __AMO
>>  
>> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
>> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
>> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
> I fear you won't like me to say this, but can't we avoid baking in yet
> another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
> here (yet better might be sizeof(int) * BITS_PER_BYTE)?

Yes and no.

No, because 32 here is consistent with ARM and PPC when it comes to
arch_fls().  Given the effort it took to get these consistent, I'm not
interested in letting them diverge.

But, if someone wants to introduce BITS_PER_INT to mirror BITS_PER_LONG
and use it consistently, then that would be ok too.


>
>> +#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
>> +
>> +#define arch_heightl(x) __builtin_popcountl(x)
> arch_hweightl()?

Oops yes.  And RISC-V does have two uses, via __bitmap_weight.

~Andrew

