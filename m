Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C357CAF75AA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 15:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032172.1405910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXK1c-0002B0-TA; Thu, 03 Jul 2025 13:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032172.1405910; Thu, 03 Jul 2025 13:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXK1c-00028g-QQ; Thu, 03 Jul 2025 13:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1032172;
 Thu, 03 Jul 2025 13:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXK1b-00028Y-U3
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 13:30:51 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa59632-5811-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 15:30:50 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so3189423f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 06:30:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f17f5sm161776035ad.62.2025.07.03.06.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:30:49 -0700 (PDT)
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
X-Inumbo-ID: efa59632-5811-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751549450; x=1752154250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=awjkZYTAl+w3OxhUQ4q16VswS2Q6B7f6BOUkUe/j8zU=;
        b=K4i35O5tZYDlZk+TsTNzp+6++T5fG1+LQ7NDe3td+IY+4kBkdiMGAPEohrVlBdcDEp
         l2gaGQR+XKpdwr5LsEOHZojAE7DAnV3+w6KPZ++F9AByab0v2P4qWJ28MaRRxX8mpzsQ
         5cf0C7XSoX8bIM+H3ABoHlugaRkcevK+sv97/aMEzEPWB9JEDWQBS1OzOMX1PQcRpMQm
         CJ9sFAx/qs41nZzqX2g5k9LIVRhecU/GaXV8w/0avpkinSaVvqEhLIwQXY/IPuwLVubb
         Sy87PvYX9MoIgZjZXsDcg0WO0ZNJbPa2XD24Sfm1MT2alVLCa391bHc3ZO3YI+PmiDAb
         LMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549450; x=1752154250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awjkZYTAl+w3OxhUQ4q16VswS2Q6B7f6BOUkUe/j8zU=;
        b=hyR0p+wVsAAqmKj50KRkuA+D07TuPu4VYGBJPbfBA4NfRyj9D+2vcJu2YAsKuUe/qB
         K9s1Q4OMNOvox2Ummh3Q52Xjjlxy4tcepK300RFAa2gw0X1huMMLlFuhoFzp/B7nkw28
         Hmhxv/Hg8XN/wnyzXXaOU9wDnwOFWk4gSprSzlMSSSukDqjOKh2jWl0t56bI/R+xM35Z
         OzjHdyQpoWaGPtnIAwmtsoYfRcWUdKY+5FtVGH/pBaxE2cEI9dHKdWkwqCfGzZ1ELiiK
         gZ/oDA05ua7PT9ZvCx/0bb/Frtr1dzpdgq5mpuTLMtj259a2IYQeCBIxyEWDFNAd0BI7
         eM9g==
X-Forwarded-Encrypted: i=1; AJvYcCUUY9JfaVq3LHUE93e0eeOJIvZ7gU93/cXUZBWMo0z2O0Ds2XmyphwjhJuz06eASPnWJ0LFIldKIns=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzkhx1MsS4pdS5zZxvYIcdxX7YKpGri7rNOaDk568pacz3c6/Nl
	qovJn+lCf1HOJ1ru7Cl+lNiXLdYDtvjaSg5PiiYzGrvCRpg+jnwr0UEX+yacdRs48Q==
X-Gm-Gg: ASbGncvQn0w0XcT3f7YqnK/qYYFQI1GwPlJ/FuRZsIp0dcFoffsKYrjHrrZbTMOKDRf
	vv1Hh+yxJ4hTacvPLeplEaq6rPBoAq4Wbo2PdKc4sEjze9VZeQIoiV/P61wcdp0d0EhmVcuuBaJ
	pQRokGkhlFWS/8pOx02tSfbhBexO74uaxpJ15QiizfPia0B/sp1g7KvE7xz1jUz5dQ8bP2BbR6d
	hV87AoHY0sv9x0GVmPOvZffYD9nkFQP1NM2YikruyIvuEILznNM7bhSL9HtNWS4uwjdXzhgyI2r
	H47J3q/9yvdYq42mA0kh7x9eybSnEvD6Q6rrnHoNixNOPYZmPmStPwYdFrhEhcRSBvdkJQg1Uti
	D/0M9tpYI1Z93Z/QsRfaYc5lQGZFAcLjHQ/J/BYm4ZhCmqw0=
X-Google-Smtp-Source: AGHT+IH06FsZ21lxqXO4FGuTGlxzBdGcVyOyjFZMBF0KmD3FA2vEbUCkzD148S0abPFpD0dgDayHiA==
X-Received: by 2002:a05:6000:40cb:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3b200f2204amr6083769f8f.39.1751549450068;
        Thu, 03 Jul 2025 06:30:50 -0700 (PDT)
Message-ID: <6fa07d3a-fa63-456a-a801-edf7db54cd32@suse.com>
Date: Thu, 3 Jul 2025 15:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/idle: Drop incorrect smp_mb() in
 mwait_idle_with_hints()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-6-andrew.cooper3@citrix.com>
 <9bcefc6b-fb76-4995-8a75-d90589384d1f@suse.com>
 <f3af6bc7-c953-4b9e-95d2-6d28008a857b@citrix.com>
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
In-Reply-To: <f3af6bc7-c953-4b9e-95d2-6d28008a857b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2025 14:37, Andrew Cooper wrote:
> On 03/07/2025 10:24 am, Jan Beulich wrote:
>> On 02.07.2025 16:41, Andrew Cooper wrote:
>>> With the recent simplifications, it becomes obvious that smp_mb() isn't the
>>> right barrier; all we need is a compiler barrier.
>>>
>>> Include this in monitor() itself, along with an explantion.
>> Ah, here we go. As per my comment on patch 4, would this perhaps better move
>> ahead (which however would require a bit of an adjustment to the description)?
> 
> As said, it's not necessary in practice.

As said where? All you say here is that a memory barrier is needed. Perhaps
my use of "ahead" was ambiguous? I meant "move ahead in the series", not
"move ahead in code". Apart from this as a possibility I fear I don't
understand.

>>> +     * monitored cacheline must not be hoisted over MONITOR.
>>> +     */
>>>      asm volatile ( "monitor"
>>> -                   :: "a" (addr), "c" (ecx), "d" (edx) );
>>> +                   :: "a" (addr), "c" (ecx), "d" (edx) : "memory" );
>>>  }
>> That's heavier than we need, though. Can't we simply have a fake output
>> "+m" (irq_stat[cpu])?
> 
> No.  That would be wrong for one of the two callers.

How that? MONITOR behaves the same in all cases, doesn't it? And it's
the same piece of data in both cases the address of which is passed in
(&softirq_pending(smp_processor_id())).

>  Also we don't have cpu available.

smp_processor_id()? Or else have a pointer to the full array entry passed
in? We could also specify the entire array, just that that's not easily
expressable afaict.

> The correct value would be a round-down on addr and a cacheline-sized
> sized type, but we can't do that because of -Wvla.

But that's what irq_stat[cpu] is (or at least claims to be, by the element
type having the __cacheline_aligned attribute).

> Nothing good can come of anything crossing the MONITOR, and ...
> 
>>  Downside being that the compiler may then set up
>> addressing of that operand, when the operand isn't really referenced. (As
>> long as __softirq_pending is the first field there, there may not be any
>> extra overhead, though, as %rax then would also address the unused operand.)
> 
> ... nothing good is going to come from trying to get clever at
> optimising a constraint that doesn't actually improve code generation in
> the first place.
> 
>> Yet then, is it really only reads from that cacheline that are of concern?
>> Isn't it - strictly speaking - also necessary that any (hypothetical) reads
>> done by the NOW() at the end of the function have to occur only afterwards
>> (and independent of there being a LOCK-ed access in cpumask_clear_cpu())?
> 
> The NOW() and cpumask_clear_cpu() are gone, and not going to be returning.

I just used the former as example and mentioned the latter because it would
serialize memory accesses irrespective of any barriers we add.

> I did put a compiler barrier in mwait() originally too, but dropped it
> because I couldn't reason about it easily.

Which I understand.

> Nothing good can come of having any loads hoisted above MWAIT, but from
> a programmers point of view, it's indistinguishable from e.g. taking an
> SMI.  If there's a correctness issue, it's not MWAIT's fault.

Well, yes, but what in the code is it that tells the compiler not to? Up
to and including LTO, should we ever get that to work again. This
specifically may be why mwait() may need to gain one, despite not itself
dealing with any memory (operands).

Jan

