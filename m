Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E3AAB63CE
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983839.1370023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Eq-0002Ji-Jw; Wed, 14 May 2025 07:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983839.1370023; Wed, 14 May 2025 07:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Eq-0002Gw-Ge; Wed, 14 May 2025 07:09:12 +0000
Received: by outflank-mailman (input) for mailman id 983839;
 Wed, 14 May 2025 07:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF6Ep-0001qP-AW
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:09:11 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55842e2d-3092-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 09:09:10 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5fca2805ca4so7901535a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 00:09:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ff8c016a16sm1369403a12.2.2025.05.14.00.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 00:09:09 -0700 (PDT)
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
X-Inumbo-ID: 55842e2d-3092-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747206550; x=1747811350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YoC5otRfYaoYgWdIKPd+seYGPSywRjB8myPrW0/fU1E=;
        b=Gohujve7CkhdrCQnO9RPhUXvxDabEZYCJINcWNj7Eftg45Iv266Ei7FXE26/cOuutC
         +34p1wPosbHU1ajhXVWuuPwJMvdRw4PTGoEYnNleyWJXxq7dEW3hgBYnrhErXje10+Ea
         PXp0RmcS8/mLMuiSUKN+AINg2McUhwpbBhX5fHtnXjFXYfEiOQB1M7sPj0EW5QAEhjtm
         DC8ECFIkcIHMALaPy5v/sZ0fsxbCmXFtUytNUXrYWaLHqmsCIYkiNgHSog7WuCOuDAHm
         +QKkv7POT4pKBAqOUG7E2vYMGSCOxqF3vHHkHQefcI8OV8yGhQTYYBgeJQ/1kfiL3LSr
         nQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206550; x=1747811350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoC5otRfYaoYgWdIKPd+seYGPSywRjB8myPrW0/fU1E=;
        b=RSccg5BggVfui4vovr0GYaTehnRkS00mkFpZM6wnN7JML8kwa5E9TGJIytT1JQiugb
         Dt+RDe518w7ySgYD7VtQ/gW8yaCJOqPK7UteIsqiX0Trc2vypxh65pqE9341L5plOYlN
         69vsxTbK5YhxbtQYy+fx2sfpfqJuSKLS7nopRcc/1FRZZASiHrU5IEkB7IQUuVe9K1cI
         icsV0wXU+Sr1QAyVYjcPtFioUvA9srHgGp8Wa8GDvRkKGaS5tI5wRZ9VIl6AiBABFRmi
         uVMOjgHDNlLc126PmsVClrPplHGAKe6e5LKdxNQe09T94tdiW7oYhS6JtQDSokuwbQuC
         6mwg==
X-Forwarded-Encrypted: i=1; AJvYcCWO8nJx3ppcdiQ5DVS+eesfMKSPi08eRzrMp4MdmvZUfLcBtaeqgW2KwkbrjaVCtJhS7QBgG4gGc9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5fezCcAafwy+MR+ZRvP/13J/a9ssJnqv5GPYXQi0IKfhXbTw5
	t+xVnDRGuTsrMokdv/vtOITbLGnIAtyqLwi+9JiXQKeXgycfYfoKuSSs0OV3DA==
X-Gm-Gg: ASbGncsP2AhUGFE+8XxzguWU2RJIAVEsK359jSknUlLWqdioZVCPnLXWvPTPfSpz8oS
	TarVWrPmIBtZoFhP7LAG3/w8jdLm9OGXqT16piMalVO/PiwlvNTt/lredlYl6oZbg069zb320Lf
	CzFF3JlFYrV36us3um0Tszs5j4Fg03MUDfTOaL+yxU/YGfD8kIijfUzeZzIyFOE1txO7jhZALfy
	N+24p4wq4F/ChmI6a3Xgl8oJV+EsCR015UQb6B/dMmV8Jfd4Lh9TiqRMjQCsunZdkExayE9FZVI
	g1jgQoIPhmPkMQretvPD1R/JgA7afOxFAvhCYd8z/Uq6Bsz/LN0KdC01sbPRHgltEhQkFnrUMNj
	jnP17pG58GHwXnOC6vvUEIpk8+0XZqSXawkIb
X-Google-Smtp-Source: AGHT+IEsBEFMZvYnDMbTKcoG1TcS2xu7UuEC3b2mQw8W3AM2ff6bEctE18HnwCeHyfvdfwc58aqoeA==
X-Received: by 2002:a17:907:728a:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-ad4f712bf42mr202097866b.22.1747206550049;
        Wed, 14 May 2025 00:09:10 -0700 (PDT)
Message-ID: <70e5eeee-f1fa-41b4-91eb-450edc0bcaca@suse.com>
Date: Wed, 14 May 2025 09:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <aCObaP4xs158L5tV@mail-itl>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aCObaP4xs158L5tV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2025 21:20, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> When debugging CI job on Linus' master branch, I added "console=vga vga=,keep" and got PV dom0 crash Xen with:
> 
> (XEN) [   40.870435] Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed at arch/x86/irq.c:294
> (XEN) [   40.886925] ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> (XEN) [   40.903356] CPU:    10
> (XEN) [   40.919824] RIP:    e008:[<ffff82d04059d2ed>] create_irq+0x272/0x339
> (XEN) [   40.936267] RFLAGS: 0000000000010297   CONTEXT: hypervisor (d0v13)
> (XEN) [   40.952709] rax: 00000000fffffff4   rbx: ffff830498007c00   rcx: 0000000000001899

There looks to be a -ENOMEM in %rax, so ...

> (XEN) [   40.969147] rdx: ffff830498007c5e   rsi: 0000000000000002   rdi: ffff83049830e398
> (XEN) [   40.985892] rbp: ffff830498307d18   rsp: ffff830498307ce8   r8:  0000000000000000
> (XEN) [   41.003093] r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> (XEN) [   41.020279] r12: 00000000fffffff4   r13: 000000000000007c   r14: ffffffffffffffff
> (XEN) [   41.037489] r15: 000000000000007c   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) [   41.054699] cr3: 0000000492c34000   cr2: ffff8881001603f0
> (XEN) [   41.071904] fsb: 0000000000000000   gsb: ffff8882365ac000   gss: 0000000000000000
> (XEN) [   41.089116] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) [   41.106320] Xen code around <ffff82d04059d2ed> (create_irq+0x272/0x339):
> (XEN) [   41.123521]  3f d9 ff e9 cc fe ff ff <0f> 0b 48 8d 3d 5a a0 29 00 e8 f4 3d d9 ff c6 43
> (XEN) [   41.140739] Xen stack trace from rsp=ffff830498307ce8:
> (XEN) [   41.157931]    000000ff00000001 ffff830497faa000 ffff830498307e00 00000000ffffffff
> (XEN) [   41.175132]    0000000000010000 ffff830497faa160 ffff830498307d70 ffff82d0405a6f85
> (XEN) [   41.192351]    00000000000002a0 ffff830498307e24 0000000000000200 00000000ffffffff
> (XEN) [   41.209551]    ffff830497faa000 0000000000000000 ffff830497faa168 0000000000010000
> (XEN) [   41.226753]    ffff830497faa160 ffff830498307de0 ffff82d0405c9ea6 5f24a0ddbbeda194
> (XEN) [   41.244062]    ffff830498307e10 0000000000000000 0000000000000001 ffff830498307e00
> (XEN) [   41.261387]    ffff830498307e24 ffff830498307e20 ffff830497faa000 ffff830498307ef8
> (XEN) [   41.278730]    ffff830497faa000 ffff830497f5a000 ffffc9004002ba78 ffff830498307e68
> (XEN) [   41.296052]    ffff82d0405cbd4f ffff82d04053fc3e ffffc9004002ba78 00000000000000a0
> (XEN) [   41.313381]    00a0fb0000000001 0000000000000000 0000000000007ff0 ffffffffffffffff
> (XEN) [   41.330708]    000000a000000000 0000000000000000 0000000000000000 ffff830498307ef8
> (XEN) [   41.348026]    ffff830497f5a000 0000000000000021 0000000000000000 ffffc9004002ba78
> (XEN) [   41.365357]    ffff830498307ee8 ffff82d0405427db ffff8881d6961b40 0000000000000001
> (XEN) [   41.382680]    000000a000000000 000000000000000d 0000000000000000 ffff830498307ee8
> (XEN) [   41.400003]    ffff82d0405e7bc2 ffff830497f5a000 0000000000000000 ffff830497f5a000
> (XEN) [   41.417343]    0000000000000000 0000000000000000 ffff830498307fff 0000000000000000
> (XEN) [   41.434674]    00007cfb67cf80e7 ffff82d0402012d3 ffff8881d6961b40 ffff888100ef30c0
> (XEN) [   41.452010]    0000000000000001 0000000000000005 0000000000000000 ffff888100ef3000
> (XEN) [   41.469342]    0000000000000202 0000000000000001 0000000000007ff0 ffff8881d6961b40
> (XEN) [   41.486681]    0000000000000021 ffffffff8229d355 000000a000000000 ffffc9004002ba78
> (XEN) [   41.504015] Xen call trace:
> (XEN) [   41.521314]    [<ffff82d04059d2ed>] R create_irq+0x272/0x339

... I'd expect the function calling init_one_irq_desc() to have caused this.
In which case, yes, the assertion is certainly valid to trigger (as it's
arch_init_one_irq_desc() which sets the field to the expected value, yet
that won't happen if one of the involved allocations fails). I'll make a
patch, but this raises the question of how you're running Xen, when
seemingly small allocations like the ones involved here end up failing.

Jan

