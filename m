Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9F2B17CBD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 08:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066828.1431899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhirF-00049o-Dj; Fri, 01 Aug 2025 06:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066828.1431899; Fri, 01 Aug 2025 06:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhirF-00047q-Am; Fri, 01 Aug 2025 06:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1066828;
 Fri, 01 Aug 2025 06:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhirE-00047k-NS
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 06:03:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3171bb52-6e9d-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 08:03:06 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so875890f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 23:03:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976a11sm34073125ad.86.2025.07.31.23.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 23:03:05 -0700 (PDT)
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
X-Inumbo-ID: 3171bb52-6e9d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754028186; x=1754632986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t2oy/vUHQ3NgceX5p1XREkfi7ws15n/qjJaWLZdpnhY=;
        b=A8SGs30MR1s/hpG6AYmi5vcvhAUt+mh5/fmV6AnKxBdgBsj7mtD/Iw6LVye4FKDs2h
         fgrjHA3Y4/VDOfsvoFFTovZ8Ifai+NzaB30umjMILYv6DVFattIU6NoSTINh4OFi+ZDD
         bYyPp1aKsV09o3eyJKETCd7vHrA+lEdtcJWI4nu4Q5vxdIQeREkUXQUt/lfN4Up/WSw4
         YM1Tyy9tck3/ESd5mVVUg6ohFvyriXUjPORPJUOOxoTw8dS5w85OZcljOiWPSIPvMzWT
         uJkGboJdUUCDtE+MA4u/CFad9A4ZT1D4dQaQzLcau7SV+mE3CHJe7MfFaJg9Dts1EmQn
         pIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754028186; x=1754632986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2oy/vUHQ3NgceX5p1XREkfi7ws15n/qjJaWLZdpnhY=;
        b=IL97x1k8IWIfh+0x+iVdA8JqE+u7NGnRbmJDWBlbm00tCDZhHlk+VokE/H8xOx4xiA
         53U/ZZQ1HuaDZexV0gvGx3G5WHjTtA7jsL/vjFHVx/VBA2F1kBNgJTlbODFdFHd05q+I
         NNbqMjWk7idWUBsDw9pw/2ovlAkMEEYtNFoyIXfIitaLk1BwSxSQaRF2ga1QEDlzzh8M
         fN0OtkJrhrlMIizesUC6yHJdHJMQbkU582OR+aZw2UElnFPPQ3+rV5QSVu0ws3P4onyb
         bMufeFk8bUhgYf/wRWafEYylidAnpq+xiRfDv5rLWsZhpWq8Zp6owXkoEsY6Qb4KTkTn
         3wLw==
X-Forwarded-Encrypted: i=1; AJvYcCUA8oE2Ee8j9ejxLF+RYSGkTxrF68WagPdLS7K3hlhWnFXWRMYIYiBptwrU1wDHzGqoW0mPIPnDqvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynyRZzg4LM2sKMj+i/oNv2DwjQIZ3S7XCcmb+TiTCKrxh7URYT
	RX62LBMhZ2lXD1FdjXAdBXcglQ1l+Bm6H7CKJeJEZMNjOvaAfy+rRK6q/kxj+Tc3UQ==
X-Gm-Gg: ASbGncszEl55Pq2k4AFntYc8Fi+oSCuG01fuVP3em5MVczLwTDWUMyqvr59ySxFQBM8
	WLuWBl97piujpzhj6KLx8EE6QtgXj28fQNUx99YQzb5SbGXliCvnr1sUHh1coYHF+kqEmC3NXpb
	J+kU1vmb2gMWK7SADNoGvRGKFXgt1YrSn2z+eLT6ir14OdmsE3mPoQw2R3rhCZ2OawZstt2t0lL
	magyAjfyZ3Xs7RBRsC1pyyVOlqhr90Fz2lvPhDuPdcC8Dvhe1BKW8DxUzGWMudag6BHhh2fHf7O
	aPa1ukmaOTsFUNkM4AB55Csu/Q4pwTIwlD7G5aLmaMiixjklix6LkQ9lhXIBcMrciaxBq8y21tL
	3gH2qy88WIgWLLdtC4ev1u4qt8S5LfyJkRrTm6nIW7oNQCDJ96gALj+oSJdhAFEGWaBbYMHZgP8
	zbmQZvjn8=
X-Google-Smtp-Source: AGHT+IFSuQBr+ZZs8AmmvVB36WJ2E8r50DfJo5kxNHwmF1+JvqHWeSvcI8nqcO9akufYzxZ66r+tKQ==
X-Received: by 2002:adf:a1dc:0:b0:3b7:96cb:2271 with SMTP id ffacd0b85a97d-3b796cb245emr4799567f8f.37.1754028186014;
        Thu, 31 Jul 2025 23:03:06 -0700 (PDT)
Message-ID: <65e288b7-d8fe-409e-a287-69b4dc29f0c2@suse.com>
Date: Fri, 1 Aug 2025 08:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-13-dmukhin@ford.com>
 <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com> <aIvYSn2ZwyWTwIzm@kraken>
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
In-Reply-To: <aIvYSn2ZwyWTwIzm@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 22:55, dmkhn@proton.me wrote:
> On Wed, Jul 09, 2025 at 04:57:44PM +0200, Jan Beulich wrote:
>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
>>> @@ -458,16 +459,16 @@ struct arch_domain
>>>  } __cacheline_aligned;
>>>
>>>  #ifdef CONFIG_HVM
>>> -#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
>>> -#define X86_EMU_HPET     XEN_X86_EMU_HPET
>>> -#define X86_EMU_PM       XEN_X86_EMU_PM
>>> -#define X86_EMU_RTC      XEN_X86_EMU_RTC
>>> -#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
>>> -#define X86_EMU_PIC      XEN_X86_EMU_PIC
>>> -#define X86_EMU_VGA      XEN_X86_EMU_VGA
>>> -#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
>>> -#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
>>> -#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
>>
>> The old code deliberately used values from the public interface.
> 
> In next version I am building, I moved all of XEN_X86_EMU_XXX definitions as
> is to a new public header under include/public/xen-emu.h:
> 
>   https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/9b0bc5ffa5710114df8523ae2aa7680b7c6f0942
> 
> That looks less invasive.
> 
> Will that work?
> 
> There should be a common header with emulation flags somewhere, since
> there will be SBSA and hwdom vUART definitions there.

Yet will there be a strict need for any constants to be identical (i.e.
not only have the same name, but also the same value) across architectures?

Jan

