Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EBBB39992
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098270.1452375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZmS-0006VS-0s; Thu, 28 Aug 2025 10:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098270.1452375; Thu, 28 Aug 2025 10:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZmR-0006Tm-U0; Thu, 28 Aug 2025 10:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1098270;
 Thu, 28 Aug 2025 10:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urZmR-0006T1-7M
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:22:55 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f77c8b-83f8-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:22:51 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so124120266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:22:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fae316sm1192724966b.28.2025.08.28.03.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:22:50 -0700 (PDT)
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
X-Inumbo-ID: f3f77c8b-83f8-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756376571; x=1756981371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vm6cv1gGUZ3A0uXurCraASbs5FzNHb1Xfq1F0okRa7o=;
        b=Axr8NplIgku8yrjsmBWtEShZYsfMOChRP+0XoDpq4XBQhPRHQBcVQxUJiC1PprFpb3
         ctM2ns9jlwa7bdVFtbelFN3g6YnQtLjumnejuBcM3U1J29hcuyRU1G23SxkmLhMPuhTF
         CM2t1DgyLTbWON514AVqOQxuqHy9HPJmgbaDBxDwmzwi/XEldQjQPpBAGdsZBvZkM6ew
         vGFDZRklGhKqjr1Zq+ZcPgENmGftcDZn3D1dst4kkMwWCmkatr6c5ALaAjyLcWjx+GZx
         SQxz2Bmn5pFMQOnZs2PqaAGKEfOAsbSpqYCiDxaLwoDdP4Pmi9nOApQRQfMccpY1KDvD
         bsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376571; x=1756981371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm6cv1gGUZ3A0uXurCraASbs5FzNHb1Xfq1F0okRa7o=;
        b=uUjyq8jgJXxTO66A/hI7pQl6AXQ0SUL9gpTVxWiDdK+f0nNHsZp1ltxqzPFa+KX8l2
         kwV8UEqMzYeGfuBCof5nRhXKVyqaKYAn+JXXPtcJJB5L+YAqJzzcAsSk6LyLGjD/n7h0
         POdStHiuZdYCmfgmSfmxYYw3hc0E5wVMQOTLkp1CSyci/zlgEvMZF5qsdWWw+Zj1LheU
         VfXMH0bRY9wtyTnAXericTFWW2O0EivBOoB13CEgAc2SreSK+ISzKAMzb7ys09CQCLw5
         uj4KoFw4kS80vtKqdzcW4vbeC76XJIgu4xpFVLPXHT8Ik3z/AGVpGZYgtDXJ+Pw3Wo6e
         2pRA==
X-Forwarded-Encrypted: i=1; AJvYcCU66rOZn14rms5JuCKOO0UVC62LQZPvY0votal/1uPrwl3Hi5QBx04eyD/pj6VJedGOE5PVRXarqiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg+8T3BBwJeRlYkJi8Md7D05t3pkU92wnG1wNptUxgTgmVPVVe
	eHwF2JLh3NSgnCK9zXjDG5swpR/ibZHJCPVL3WCsG0ijg5hLwuWdFXUZGcMt/ce93IFw0NxCmsF
	DPow=
X-Gm-Gg: ASbGncvhrhUvoHn87+EXqNFsLDmrh5qHqPJayvtci9mvdZiaJQlEsh/1CU8dHLUefTE
	SfSML/i7+l+/1aLRimMoZXd/mb2tYA96DiCglTUy31B/JJcCC5CgoZoxHbRAHxEcZc/RvxzAg3T
	IxDyFbkjBdXzKZwl+pavcwS+wuCAKeT4cEZ4G66hvJ8o3Z0Xf2adUIDX3VQlCXwb7Wrrv4nLlV7
	cRvLLqQyrGbXY+KaOJHdotXslsgXCKtoWwVUTA72zCIGCRYlhJOD8mKrUAwl+8eeSpAwV+Nu9RD
	M+kDk5TqJQ0+UV5ni6JqzdTzgol3R7lp7SaD1mlhphmxLw0cLL/Lvg7tNlNE/tv/KP7iBphr79H
	SSiu+1+fTBQfLwaajNuUVt64boRjhuInxauEw5zRKX6Gl+49jc3FmXa4wiNFe3M5XimUUysdj3d
	drRMduqcrH2JSPKolByg==
X-Google-Smtp-Source: AGHT+IERrzQBpK8ysC/61spHwnCrLQtiiKyb97SpY5lU20V1pMXnWDfFEGOhSbuZixPomBJfXyCzyQ==
X-Received: by 2002:a17:906:4ec3:b0:afe:74a3:f76d with SMTP id a640c23a62f3a-afe74a3fda1mr1194550166b.16.1756376571186;
        Thu, 28 Aug 2025 03:22:51 -0700 (PDT)
Message-ID: <e24606c1-3f54-44aa-a78c-6cb36be3d5f3@suse.com>
Date: Thu, 28 Aug 2025 12:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
 <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
 <1901e764-9725-4e9e-895a-54c704473510@suse.com>
 <50c15166-b3b5-4e17-8bcc-cb37ad03f0ad@citrix.com>
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
In-Reply-To: <50c15166-b3b5-4e17-8bcc-cb37ad03f0ad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:01, Andrew Cooper wrote:
> On 28/08/2025 8:07 am, Jan Beulich wrote:
>> On 27.08.2025 19:47, Andrew Cooper wrote:
>>> On 22/08/2025 2:47 pm, Teddy Astie wrote:
>>>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>>>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>>>
>>>> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
>>>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
>>>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>>>
>>>> $ cat /sys/hypervisor/uuid
>>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>>>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>>>> $ cat /sys/devices/virtual/dmi/id/product_serial
>>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>>
>>>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>>>> written in the table; which effectively fix this endianness mismatch with
>>>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>>>>
>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>> ---
>>>> This effectively changes the UUID seen with UEFI guests as it was
>>>> actually inconsistent with SeaBIOS and SMBIOS expectations.
>>>> ---
>>> I agree this is a real bug and needs fixing.
>> Hmm, I didn't realize this is a bug, and hence put the patch off as 4.22
>> material. If there is a bug being fixed: Teddy, please add a Fixes: tag.
> 
> I'm not sure if this has a reasonable Fixes tag.
> 
> It's a combination of an ill-specified domain handle format, and using
> an ill-specified version of the SMBios spec.

But the problem was still introduced into the code base at some point. Afaict
in c683914ef913 ("Add code to generate SMBIOS tables to hvmloader"), i.e. when
smbios.c was first added.

Jan

