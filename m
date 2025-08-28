Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C321B39971
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098258.1452355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZhg-00041i-8s; Thu, 28 Aug 2025 10:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098258.1452355; Thu, 28 Aug 2025 10:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZhg-0003zo-67; Thu, 28 Aug 2025 10:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1098258;
 Thu, 28 Aug 2025 10:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urZhe-0003zi-2x
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:17:58 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43761dc2-83f8-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:17:55 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afec56519c4so91248166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:17:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afef34bdc53sm41645866b.26.2025.08.28.03.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:17:54 -0700 (PDT)
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
X-Inumbo-ID: 43761dc2-83f8-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756376275; x=1756981075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=otpGHBbvUAq5mC7d429NbrV6+mzS05fO2sCUjHWLPXY=;
        b=UWHseiE+tu1IsIB7oHGcb24Kr4UT1gpDRsLGomkSR9EsCdvWJRMvhDEs2a+Dck4BX8
         dqpFAthhIHJSHDfLXn5q/UPR2McygBlRg5cnuZWGHMnyH68zhlavSl8laeS5xGzypnyf
         wCMvIHABI+4EzQdOQribA8fmV5l1d1gCwXXwEhlQ3qNg1sTxaGf/s7bxTLSm+eYyb+Kh
         PvofGBlZ55+/+Pzglrfsw+nIoh/c/c+FxaTBqkeJ5iMJ5Mr+GztqdKphsJrpMZMi5Rbm
         T/a+SNg3fTOr34vyi2t1EjICzFLfRsP+z+6MgX7acjIXCAlH3NQW+c92LYF7WEOPrg9P
         Lz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376275; x=1756981075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otpGHBbvUAq5mC7d429NbrV6+mzS05fO2sCUjHWLPXY=;
        b=BuAr9WcMGzBURYweN5b2OVoFOxSRcDXqvpVu/5PId7ExYkc1aOvLCjHbsxCp3mfytu
         7bX2Qykr3IszN3Ke/nSzid//8Jsohvw8rQfX3qY7NCdtG+Ney2rUU7xPqOuYkywToQKr
         0AQiGStFJYEG1t+wQEXpGes4mFaSMZmbBx81GV6W90WqmfzkHknQxXCHWrNJfROf3G8H
         iEhnmHzpJx2wcYj8svch5IhADB6U0DfL0NO1YFhGPoVhIZYIFkp5kPEPtJI5nR50UrhF
         ZlIP+m1b1d9Q1ney4MaZ1hDaKEHOlBnqAN6HxxB7l2+w4jcuk4iXrzu0pkJc0SJdXO3F
         hemw==
X-Gm-Message-State: AOJu0Yzw0z03pNVEqtYqnYnxE+NRf86Z2Jj3BCJ2c2FHF0htrD2A7J+P
	19qsRA+xihXHAFV2TC341KVRLxqSwf+4xqczM0tITHq6YpFc53fssfoPH14mSFu7tPW3mDhBvQY
	sqr8=
X-Gm-Gg: ASbGnctKNQCMm2ITbNg+5aLI62uwXO2zS/gWiyDRqbDR3TudvKPrVzUmh4HhruKWRw/
	tyzNuJ/RS/G/brdCJL8IyBw8JlczrCQrd2axzJtitZKxq7Xf5RUr7ATHEneyb6VZcZQoVdfvxYr
	LiIk2zdEmqCRfnY3Y010cSTH7cG3Dh+q8lP1ryg23qPWNFD8d1wEqaY6jUbpL9vBcC9nlXBu8I/
	tjLvLjvhXuMWltE/BiFYyQ/VWo7eeBO12n2F/ni4hhMN9Y+ZXJI1Fvk0Rh3kkymf4679yn68gjl
	aGx/krPsB6/OAQKegiEi/Iw07FKjVdPSFHuuzjZDc41C3oo/zVQT6MJA7KWvJqZziBsLuXh9KnH
	h1MKYCBTZ3wVsINeEkOd4H0462pzYX3u8GW1cx4LlEiLhLpUUhaykDdB0NP4KpsZQpBM3aTGXuL
	AxbVDnbk+m50sx2Ei+5g==
X-Google-Smtp-Source: AGHT+IFdm4ctR1loWwODO43SldozgQ5l75xIYStqeZXDSJo5paZ4TbIjCWcdBe8kKZBKFjVeU3vlwQ==
X-Received: by 2002:a17:907:3f94:b0:afe:caf7:6dea with SMTP id a640c23a62f3a-afecaf7724cmr451468666b.3.1756376275011;
        Thu, 28 Aug 2025 03:17:55 -0700 (PDT)
Message-ID: <7172dc7c-575c-45f0-9cd9-1aaf067e0e46@suse.com>
Date: Thu, 28 Aug 2025 12:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MCA hypercall with PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <318f8ef3-aa52-421b-b9cb-6cd6139e1dd1@amd.com>
 <c011bc78-4ce0-4c43-9638-f03aee41816e@suse.com> <aLAmZGDn9QsBZWrb@Mac.lan>
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
In-Reply-To: <aLAmZGDn9QsBZWrb@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 11:50, Roger Pau Monné wrote:
> On Thu, Aug 28, 2025 at 10:48:49AM +0200, Jan Beulich wrote:
>> On 28.08.2025 03:22, Jason Andryuk wrote:
>>> The MCA hypercall, do_mca(), is only available for PV.  That is, it's 
>>> only added to the hypercall table for PV.  Is there a particular reason 
>>> it was omitted from PVH, or did PVH dom0 just not exist?
>>
>> PVH Dom0 didn't exist back at the time, yes, but it's more than this. The
>> hypercall, in some places, deals with MFNs, which aren't "visible" to PVH
>> Dom0. IOW enabling it (perhaps just partly) would need to be done with
>> extra care.
> 
> I think there's also a question of whether we want to use a PV
> interface here, or try for Xen to mediate between the hardware domain
> and the native interface, possibly exposing some kind of partially
> emulated view that matches the native interface, and thus avoids
> having to use a PV driver in the hardware domain.
> 
> I've opened a GitLab ticket long ago about MCE:
> 
> https://gitlab.com/xen-project/xen/-/issues/101
> 
> But didn't look into it.  I think we need some prior investigation to
> figure out whether it would be feasible to expose a native MCA
> interface to the hardware domain, as that would be the preference for
> PVH (rather than re-using the classic PV interfaces).
> 
> The main barrier here is the disassociation between the hardware
> domain physical memory map versus the host one, as the MCE/MCA
> drivers will need to operate based on the host memory map, not the
> one used by the hardware domain.

Right. Obtaining the host memory map alone already requires some level
of PV-ness. Associating memory addresses (necessarily surfaced as MFNs,
as not all MFNs have an associated GFN in Dom0) back to Dom0's own
memory would further require exposure of the M2P. That's getting pretty
heavily PV already, imo. And we haven't arrived at DomU-owned pages,
yet.

Jan

> I think (some?) of the MSRs also contain CPU specific status/errors,
> and hence using a native interface would require the hardware domain
> vCPU count to be equal to the host pCPU count.
> 
> Nit: I've just taken a quick look at do_mca() but it looked like the
> sharing of the data would be better done using acquire_resource if
> possible, as to avoid repeated hypercalls.
> 
> Thanks, Roger.


