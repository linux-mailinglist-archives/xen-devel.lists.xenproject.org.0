Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0299DB6ED
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845386.1260809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGd2z-000831-U6; Thu, 28 Nov 2024 11:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845386.1260809; Thu, 28 Nov 2024 11:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGd2z-00081Y-RI; Thu, 28 Nov 2024 11:51:01 +0000
Received: by outflank-mailman (input) for mailman id 845386;
 Thu, 28 Nov 2024 11:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGd2y-000809-02
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:51:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078b919a-ad7f-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 12:50:57 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so6322145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:50:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0d9bed7sm20090685e9.8.2024.11.28.03.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:50:56 -0800 (PST)
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
X-Inumbo-ID: 078b919a-ad7f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA3OGI5MTlhLWFkN2YtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzk0NjU3LjI3ODkyNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732794657; x=1733399457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fFsVZEUEQ9yhLojhHgJSrf04chauLVnfQfwjL8IQBRk=;
        b=Pzd7yulcr2RLrnWSnznVkm1h2LWdHDM6oAiYQ2PzXtxtiXjOlbFnjv5wu0V+JkGn3y
         L9ajd7kir+UYBG/sYS0+JxluSMietCPo5wxk25Nxl97qv6k9zcNalVd4mUYx2TjAEkpd
         mzOPSGjIT69x8ispwp43uPcMK451svlC6y12Boja6kh5svgJqaomP0/c4ovE4fqvZ/PV
         PyduUAttJaCDoQbq6i3M4kJoAfBAG2GhZDEi8dRpU2OY7+t+ABUpuEo5OL8+5E/2saJu
         DXP4AcVUHqtI/lM7g8iOQw//4fJHfjklXQ7kuDP1zk9Pm1902B92UYQzV+LhedtRYrmN
         o4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732794657; x=1733399457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFsVZEUEQ9yhLojhHgJSrf04chauLVnfQfwjL8IQBRk=;
        b=PfEiGJfLKnwXB27IWPuyjXIKOqFQMicZDS8CC1AGHZ0Mrufh4zyGvuXUUHBXhKlSKz
         taAJV7z9i8zkn44Nqm+HMDchJBIqF1EqQ9MMw6JPDAyIV/TEZHLGa/OcQTuSMyv5Wepk
         z4LUPoopOPQoRRAksr+vzNdgj0/t8hrJ9Qm69iZGVesGMG7DHhQzZ/aSXYa+kVcygvUI
         OXTfq8wTWfXJM0pJ4kmlCqrILH8xCUF9gjE2Cg3RM+TBvmR1f46DpJM8+5YrQD03i35n
         96r+ia1zt6lcBJrQv4HrOF2pQG7YNu9uAopIeWuNtnvRJ1NNCDJhV5ZXkP96E/DCbbR0
         8XHA==
X-Forwarded-Encrypted: i=1; AJvYcCXwBki1JNiCj+ZHjMzWerBs74ucxvIVItGwOkA1awh7Us7Ey8P3ZOmf2lGF2tewFUJJzQZq6VQL30E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2HJjydq431NTjeqUr3z84MFu+VMKY8aF2MbSm9Wtc6ypoB31j
	Jpbk+LcMw7NZVvccgalRKp1CG0hhNOOYS1dif+l3ewtW5WtBs19Nd/AyUM/0Mw==
X-Gm-Gg: ASbGncuQLdld/bbDa+DAfeb4T0CSAbpjHGFvhF27ptQQoCl9aA9ckyJ2jqqho+nuUBj
	lE8jvwQ2dXTCKjmGlP8mpFe+Lq7Geqyq5lT8wPpc+pTnt8fShp3AAeRZDMWPAh/9Wf+RSNX3L7P
	oR+l1luCZHB/elLlwN55auZ/BJOk/AyWJ1BjJfcYMU7bGj2tpj6Ic8T10cF1InvQL+0C8dbr5pV
	fxS8N+RkC+0S3ZSjHz8Jt0390CElaJipSXB5mRJLwkicywv/nzwTZCo9R/489fw9bJj1/AqNpNW
	HhiubQFZejGMalDTTQBM10gLrspGWV2JmY0=
X-Google-Smtp-Source: AGHT+IFB1GNUQ4KSd3cnTRfzNhKdE+C3+9I74uFrKFqGoASHYMQ6rfK0S/rkRFLeiY4BFyqQCT3jPQ==
X-Received: by 2002:a05:600c:3ba6:b0:434:9e63:faff with SMTP id 5b1f17b1804b1-434a9dbc41bmr63542525e9.2.1732794656612;
        Thu, 28 Nov 2024 03:50:56 -0800 (PST)
Message-ID: <b97f13ad-f3d4-4e92-b3e6-5522badbad5b@suse.com>
Date: Thu, 28 Nov 2024 12:50:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
 <e576e161-5054-40d2-af02-6f32ef636782@suse.com>
 <8a3a3daa-16f6-4488-ae46-224379033c54@citrix.com>
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
In-Reply-To: <8a3a3daa-16f6-4488-ae46-224379033c54@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2024 12:10, Andrew Cooper wrote:
> On 28/11/2024 10:31 am, Jan Beulich wrote:
>> On 28.11.2024 01:47, Andrew Cooper wrote:
>>> Xen currently presents APIC_ESR to guests as a simple read/write register.
>>>
>>> This is incorrect.  The SDM states:
>>>
>>>   The ESR is a write/read register. Before attempt to read from the ESR,
>>>   software should first write to it. (The value written does not affect the
>>>   values read subsequently; only zero may be written in x2APIC mode.) This
>>>   write clears any previously logged errors and updates the ESR with any
>>>   errors detected since the last write to the ESR. This write also rearms the
>>>   APIC error interrupt triggering mechanism.
>>>
>>> Introduce a new pending_esr field in hvm_hw_lapic.  Update vlapic_error() to
>>> accumulate errors here, and extend vlapic_reg_write() to discard the written
>>> value, and instead transfer pending_esr into APIC_ESR.  Reads are still as
>>> before.
>>>
>>> Importantly, this means that guests no longer destroys the ESR value it's
>>> looking for in the LVTERR handler when following the SDM instructions.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> No Fixes: tag presumably because the issue had been there forever?
> 
> Oh, I forgot to note that.
> 
> I can't decide between forever, or since the introduction of the ESR
> support (so Xen 4.5 like XSA-462, and still basically forever).
>>> ---
>>> Slightly RFC.  This collides with Alejandro's patch which adds the apic_id
>>> field to hvm_hw_lapic too.  However, this is a far more obvious backport
>>> candidate.
>>>
>>> lapic_check_hidden() might in principle want to audit this field, but it's not
>>> clear what to check.  While prior Xen will never have produced it in the
>>> migration stream, Intel APIC-V will set APIC_ESR_ILLREGA above and beyond what
>>> Xen will currently emulate.
>> The ESR really is an 8-bit value (in a 32-bit register), so checking the
>> upper bits may be necessary.
> 
> It is now, but it may not be in the future.
> 
> My concern is that this value is generated by microcode, so we can't
> audit based on which reserved bits we think prior versions of Xen never set.
> 
> I don't particularly care about a toolstack deciding to feed ~0 in
> here.  But, if any bit beyond 7 gets allocated in the future, then
> auditing the bottom byte would lead to a migration failure of what is in
> practice a correct value.

If a bit beyond zero got allocated, then it being set in an incoming stream
will, for an unaware Xen version, still be illegal. Such a guest simply can't
be migrated to a Xen version unaware of the bit. Once Xen becomes aware, the
auditing would (of course) also need adjustment.

Jan

