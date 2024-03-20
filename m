Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A48813B3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695965.1086357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxIN-0008BU-Go; Wed, 20 Mar 2024 14:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695965.1086357; Wed, 20 Mar 2024 14:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxIN-00089x-E7; Wed, 20 Mar 2024 14:51:59 +0000
Received: by outflank-mailman (input) for mailman id 695965;
 Wed, 20 Mar 2024 14:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmxIM-00089r-3c
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:51:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e17366-e6c9-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 15:51:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a46f28f89baso141725866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:51:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l8-20020a17090612c800b00a46aab70226sm5003222ejb.180.2024.03.20.07.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 07:51:55 -0700 (PDT)
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
X-Inumbo-ID: 65e17366-e6c9-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710946316; x=1711551116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFMfJtML86pv/21eEramWeq28DSOe+aESCcohJ1wgE0=;
        b=XalG+dpSwQnh4QNGQ7o+OSkr+d5jQBuIh/HOQIT1d1osWAEu0GygmcCTkXq0MuIToB
         FaA40f7Zp4/EyllQANw8civ60I3qlkpBinnSYxsekAxEboxhrDNwvXYmFSfdoPbUV0oz
         9nWDyXZM0IRBenL5OOu1SmRqb89srmSHGM6GzxDR/T8/UTrAF8Pf4f36fmOwzWEiIwlo
         PX7hh//SDtM384wQQUT77K6ODj19ZarOmAO76llY65TeKul5ahkBC5n4rOaNZoy8hp3B
         2qv/7LXNKr4dm0gC8Ww2TXFFCxSbtXtI/+zUI5s+Z53HS0bjJmi6PYKvlP4G7o4TY0xw
         wOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710946316; x=1711551116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFMfJtML86pv/21eEramWeq28DSOe+aESCcohJ1wgE0=;
        b=CKdpdGxeif5GBAcqry6JIxO/OSoR4UpeMbmr5GMo+FZPeBGmfCHgGqw4GG+QndssZA
         SwC9o3n0aqxTLB4yy26ZpZVceWY4/8s2PatBjAZGpLMmQviE0iOQeDhYENMvPbP4YX9f
         j0ecdvi6WnFwxHTQ0/Vs+qL9XQIG0zTXLasMK+XkW/IQPu9xsAH0gxWeYtWbUO9pNtuR
         TCcsuYnk/NHVbHcVR8J8nOoBzMa+o3m/6LAaVyvgNQswVSoCzGweJIcnxS4b07klmstL
         Sff7MVioupoW3i+Y7fu008dOoxLvYdLoFRCmRqz53GHcXPAn7ZETv4RhxXU4NYZoXiNz
         SXCg==
X-Gm-Message-State: AOJu0YzjqCMAK7f71FfvvLFg4Gia+zeI/U9vgvQcidN4FPl8Ynhfcvj6
	LxIyzZSFLvlCggXPdn35+yH6wAvX5ZjItxehFgaQ2SITcWHb7hpmFM/6J3vdow==
X-Google-Smtp-Source: AGHT+IHcp4QK7WOx2IlrUEzMjc53/wzNLiYSCjVLaXQFzSR3FMnfHyje/z1YoD45tHHveo7TTGtX7w==
X-Received: by 2002:a17:906:1152:b0:a46:ba8f:bcdc with SMTP id i18-20020a170906115200b00a46ba8fbcdcmr2531593eja.8.1710946316322;
        Wed, 20 Mar 2024 07:51:56 -0700 (PDT)
Message-ID: <fef02fa7-3f13-4c51-8971-da59c8b85563@suse.com>
Date: Wed, 20 Mar 2024 15:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] AMD/IOMMU: drop remaining guest-IOMMU bits too
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>
 <Zfq-mNNfG6I7diJw@macbook> <c9f31608-3ff9-45d1-83e9-60541a8ec0f9@suse.com>
 <ZfrtXXgqkeom3uVV@macbook>
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
In-Reply-To: <ZfrtXXgqkeom3uVV@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 15:06, Roger Pau Monné wrote:
> On Wed, Mar 20, 2024 at 11:58:50AM +0100, Jan Beulich wrote:
>> On 20.03.2024 11:46, Roger Pau Monné wrote:
>>> On Tue, Mar 19, 2024 at 02:28:12PM +0100, Jan Beulich wrote:
>>>> With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
>>>> functions") having removed the sole place where d->g_iommu would be set
>>>> to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
>>>> latest from its 2nd if(). With it dropped, all other stuff in the file
>>>> is unused, too. Delete iommu_guest.c altogether.
>>>>
>>>> Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
>>>> struct mmio_reg for being unused with the unused g_iommu also dropped
>>>> from struct arch_iommu.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>>>> ---
>>>> I wasn't sure how far to further go with removing the body of
>>>> parse_ppr_log_entry(), or perhaps even the entire function, and then
>>>> further up to all PPR logging code. Hence why for now I've merely
>>>> commented out the function call into the file being deleted (which of
>>>> course Misra isn't going to like). Thoughts / suggestions?
>>>>
>>>> I further wonder whether set_iommu_guest_translation_control() should
>>>> have been invoked independent of guest-IOMMU actually being enabled. IOW
>>>> that may want purging, too. Along these lines iommuv2_enabled may also
>>>> want dropping, for not having any consumer left. Much like has_viommu()
>>>> and then also {XEN_,}X86_EMU_IOMMU, i.e. going as far as affecting the
>>>> public interface.
> 
> I would drop it all.  The public interface part is not stable anyway,
> as it's a domctl, but I would be fine if you want to keep the X86_EMU_IOMMU.

By "all" you also mean the PPR logging code? That's where I felt I might
be going too far ...

Jan

