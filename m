Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDDE903F46
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 16:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738486.1145254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH2sJ-0007sr-OP; Tue, 11 Jun 2024 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738486.1145254; Tue, 11 Jun 2024 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH2sJ-0007qu-Lh; Tue, 11 Jun 2024 14:53:27 +0000
Received: by outflank-mailman (input) for mailman id 738486;
 Tue, 11 Jun 2024 14:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH2sH-0007qo-W3
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 14:53:25 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a1ca1da-2802-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 16:53:24 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6efe62f583so105178966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 07:53:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1ec85a74sm268414866b.56.2024.06.11.07.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:53:23 -0700 (PDT)
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
X-Inumbo-ID: 5a1ca1da-2802-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718117603; x=1718722403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l86eqjnMZ92TwVa78jcH2B2phLBNWQ4tUfYoh0IYomQ=;
        b=CRrMa2Vd8S5zNyGVSImHaJ2MPv/9wFaYPUujqUybAk1QUiO59chtBjuXNh3+ODgldv
         jFqTW+WKwtA+eMevOhKFnAqmEkgrolhVLtFlaInQRbR/XWbLp1EgfdVGGCsYDVA57Mpw
         ijYd55f25Y8d/p8kbo8GuYqrwWxwG77rFPfFfU7VdoixjfR0u+t8rvDmW6X7j8d4Nbiy
         NupMMG5kHuJMOLsBBpcPCSKWz5s0DJUW1cY3c0APKlyMGEd2kV6sPPLD9YEgG/gTgjA6
         wvwKYR1aJbyKWWhIUaIwNZgbFrPOlBOz13Z7t7LiL29I66B6DQq0VItmXjcUVPokCkJr
         ojpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718117603; x=1718722403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l86eqjnMZ92TwVa78jcH2B2phLBNWQ4tUfYoh0IYomQ=;
        b=Yvv7BJH2t/EF1h8u5q1Lg1kOa3s56gmxjaDTWUcGzYvWizevq+gAYJtkMaaZYb8Vwz
         BOtQFd5MvFToG0X9n3CdxX0L0r4Vx6Xy+STiM9nQA9fN1UgzJpdW0W7+ky0vRHKVzNSZ
         Wue3qG2Ll4Wp+LCKjEJvP0tWJlLbthLBQ4a2hpUS4jHYEuheq6LRc5XJrfdO2AJ/aB5t
         hh9k8Jc+jRJVPMa/WTrMoENp8m/vlxc1/1AGry/5S7LU0mEGlsOrJiPyIw6MHMRmgaki
         oXW2voWRz/8XUDTjPe+EMT5xDiO5qlylQI9EIzQLKgX8aYHffTDCvPGYOnDcCPQy0/0H
         QK4Q==
X-Gm-Message-State: AOJu0YxhXs4Ce9NT5a04P/lR6BWo/2YOyL/aRW9q/7QQKx5d2sIoQNga
	0XE3crHQkUMQGH4v6gvtVGuVJR8HvRo0j58uEjIhvHJCYUAw+XV9QEHo2Y87hw==
X-Google-Smtp-Source: AGHT+IFHkfRWPaS7Y2lJELkNeMp+n3RSdhRBSG7JZdGXmODvCHEG8YPaHNCac74C0DP8I/yncbR2Ew==
X-Received: by 2002:a17:907:7d8f:b0:a6f:d7a:d650 with SMTP id a640c23a62f3a-a6f0d7ad8fcmr644505566b.50.1718117603364;
        Tue, 11 Jun 2024 07:53:23 -0700 (PDT)
Message-ID: <beb67703-c1f0-490a-a3ad-36e2f331f5e4@suse.com>
Date: Tue, 11 Jun 2024 16:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook> <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook> <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
 <ZmgwKmcLDJDhIsl7@macbook> <b076dc8d-701e-4a9f-a147-c54673959009@suse.com>
 <ZmhWtEyuwjTuIAxK@macbook>
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
In-Reply-To: <ZmhWtEyuwjTuIAxK@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 15:52, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 01:52:58PM +0200, Jan Beulich wrote:
>> On 11.06.2024 13:08, Roger Pau Monné wrote:
>>> I really wonder whether Xen has enough information to figure out
>>> whether a hole (MMIO region) is supposed to be accessed as UC or
>>> something else.
>>
>> It certainly hasn't, and hence is erring on the (safe) side of forcing
>> UC.
> 
> Except that for the vesa framebuffer at least this is a bad choice :).

Well, yes, that's where we want WC to be permitted. But for that we only
need to avoid setting iPAT; we still can uniformly hand back UC. Except
(as mentioned elsewhere earlier) if the guest uses MTRRs rather than PAT
to arrange for WC.

>>>  Maybe the mfn_valid() check should be
>>> inverted, and return WB when the underlying mfn is RAM, and otherwise
>>> use the guest MTRRs to decide the cache attribute?
>>
>> First: Whether WB is correct for RAM isn't known. With some peculiar device
>> assigned, the guest may want/need part of its RAM be e.g. WC or WT. (It's
>> only without any physical devices assigned that we can be quite sure that
>> WB is good for all of RAM.) Therefore, second, I think respecting MTRRs for
>> RAM is less likely to cause problems than respecting them for MMIO.
>>
>> I think at this point the main question is: Do we want to do things at least
>> along the lines of this v1, or do we instead feel certain enough to switch
>> the mfn_valid() to a comparison against INVALID_MFN (and perhaps moving it
>> up to almost the top of the function)?
> 
> My preferred option would be the later, as that would remove a special
> casing.  However, I'm unsure how much fallout this could cause - those
> caching changes are always tricky and lead to unexpected fallout.

Which is the very reason why I tried to avoid going to far with this.

> OTOH the current !mfn_valid() check is very restrictive, as it forces
> all MMIO to UC.

Which is why, in this v1, I'm relaxing only the iPAT part.

>  So by removing it we allow guest chosen types to take
> effect, which are likely less restrictive than UC (whether those are
> correct is another question).

No, guest chosen types still wouldn't come into play, due to what the
switch() further down in the function does for p2m_mmio_direct.

>> One caveat here that I forgot to
>> mention before: MFNs taken out of EPT entries will never be INVALID_MFN, for
>> the truncation that happens when populating entries. In that case we rely on
>> mfn_valid() to be "rejecting" them.
> 
> The only caller where mfns from EPT entries are passed to
> epte_get_entry_emt() is in resolve_misconfig() AFAICT, and in that
> case the EPT entry must be present for epte_get_entry_emt() to be
> called.  So it seems to me that epte_get_entry_emt() can never be
> called from an mfn constructed from an INVALID_MFN EPT entry (but it's
> worth adding an assert for it).

Are you sure? I agree for the first of those two calls, but the second
isn't quite as obvious. There we'd need to first prove that we will
never create non-present super-page entries. Yet if I'm not mistaken
for PoD we may create such.

Jan

