Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84974B25C7E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080815.1440998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRyz-0001Ag-Ur; Thu, 14 Aug 2025 07:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080815.1440998; Thu, 14 Aug 2025 07:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRyz-00017x-Rr; Thu, 14 Aug 2025 07:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1080815;
 Thu, 14 Aug 2025 07:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umRyy-00017q-IG
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:02:40 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b83c7d-78dc-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 09:02:38 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b6548adso1140086a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:02:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6178b074a38sm15106320a12.32.2025.08.14.00.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:02:37 -0700 (PDT)
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
X-Inumbo-ID: a9b83c7d-78dc-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755154958; x=1755759758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3lv3T5HNPgiLT9IcKhsojimiDCgnEUq7jA3psdpdsTA=;
        b=Q5Oosqu9UBau0odPwxsMxx16MMPO+v0S0M04Mcx09O+STtk8CMV59kgEX+wPKyoGln
         c9T2nJ04vvaMQzGmb8oGllhcjLDAd0lc9mrveOAjMh6xD1bfJ3j4ElEPiTQJ18Jj+v+4
         /HPVrER+mVtqCi40rgwdnbEq3tABmbfqarxeH0fUinj1dNECaMc9MYinBO0o1FTol1dn
         IqKyHzZ2W6MaPqz32gIIEnzPsMKahp/BWm1U+0OGKE/YbCc8SBBIJL4z2tE5vjwWOcig
         EF/f0huxgyEkVxVCAYyDAV1F3YOaHFcviVKR7omYiEcEdeXS9nf7MGmEb95JuQbcvTNj
         qUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154958; x=1755759758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lv3T5HNPgiLT9IcKhsojimiDCgnEUq7jA3psdpdsTA=;
        b=RD39z9JCjDm2M+mRbm4XGLZUcKGwLYST9peuM2ZRzHG80Q9eq8Qu+lWdLbxm1DsUJy
         ISbHjx8otfm72VgCRG5dz/caNfXTWfbwBsWh1QEVOMBsUjgv+oR6MrriHXZT6lirywPC
         Cy9p3nw7l2oePyXwIWCZCQBNLIkpnQKjWF44Ab1tkmqEg9YIxdQM2WO4sttQB+W7lz2C
         DIvEaxUCerqJgutAmKZ9zgoZGEqExS1UqtTAh5Sx9L4c8GElGzcUt1uizLvNAkTrA2ry
         BEaId7YysyeuK3tyFc48uCJzzEBm1ktr9wMUUD+siwsciakATAAMD0LCHRkwLeSuONTa
         kHWg==
X-Gm-Message-State: AOJu0YxWmjf5cdoZOG0nSs4gbezYG6lK20veMCSXwB+LoW1AAHGeuY9p
	hT90eTGd1W7dTU2ZGLu6eK1lNfZqqqRqvu5169L/TroNJ64Mup4xD+/PtDqlSGu/9A==
X-Gm-Gg: ASbGncuREo5DvxnphfLVPhQbZziXutTarYvYFsMI21D0G/4cq+UAVKlThEKwrYp+742
	i4U7Cve5zKV+txGV5dX9PbFr8Qtmg5jcrWsMeJmaayIVxkp32ja66sekKeBzYfWtcYxDB4wNir1
	kGfvgQaw7XPyvQ8nJswHE/keHNUfXo0u4RyeDDNK8/fqQcHcXn97zruPLkQup3RHub2lMjBIrGv
	P7hBOSxzc37FHq3k6JFIkd8bzs2qPOzZSbAwyWtyM8fFr8ZXRpwkz6+o250FBQKVlBcrR67C7fI
	1M2a0MqGsVp4kboMA6HZyPWJqa7NyEJnLTTZiyQvF+p6EohZmPOPwxBryQd9O/fFSSXDRCraeR2
	t+JDLGN6GtI9cV0CGCm/tMYYvvumwTUb0hfvfM4enGAqoHTwt7rAmecdOIIlHDWXI78O0nX4VCi
	QdO2RDKps=
X-Google-Smtp-Source: AGHT+IHNzH4RUMSnmMAZxLRJGY/4+VTgSe2jLal1EnlwtQKyDarCXCf6HSp8pdcLe71PJzfFGZI9bA==
X-Received: by 2002:a05:6402:3507:b0:615:78c6:7b18 with SMTP id 4fb4d7f45d1cf-6188c1f5cadmr1468307a12.23.1755154957884;
        Thu, 14 Aug 2025 00:02:37 -0700 (PDT)
Message-ID: <38430fbf-a6e4-4ba9-bbff-2279108721e6@suse.com>
Date: Thu, 14 Aug 2025 09:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/mkelf32: pad load segment to 2Mb boundary
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
 <6e295921-0432-435e-9efe-51caa106f203@suse.com>
 <aJtpXOM2AERnOCrH@macbook.local>
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
In-Reply-To: <aJtpXOM2AERnOCrH@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.08.2025 18:18, Roger Pau Monné wrote:
> On Mon, Aug 11, 2025 at 12:49:57PM +0200, Jan Beulich wrote:
>> @@ -339,9 +340,12 @@ int main(int argc, char **argv)
>>      (void)lseek(infd, in64_phdr.p_offset, SEEK_SET);
>>      dat_siz = (uint32_t)in64_phdr.p_filesz;
>>  
>> -    /* Do not use p_memsz: it does not include BSS alignment padding. */
>> -    /*mem_siz = (uint32_t)in64_phdr.p_memsz;*/
>> -    mem_siz = (uint32_t)(final_exec_addr - in64_phdr.p_vaddr);
>> +    /*
>> +     * We don't pad .bss in the linker script, but during early boot we map
>> +     * the Xen image using 2M pages.  To avoid running into adjacent non-RAM
>> +     * regions, pad the segment to the next 2M boundary.
> 
> Won't it be easier to pad in the linker script?  We could still have
> __bss_end before the padding, so that initialization isn't done to the
> extra padding area.  Otherwise it would be helpful to mention why the
> padding must be done here (opposed to being done in the linker
> script).

The way the linker script currently is written doesn't lend itself to do
the padding there: It would either mean to introduce an artificial
padding section (which I'd dislike), or it would result in _end[] and
__2M_rwdata_end[] also moving, which pretty clearly we don't want. Maybe
there are other options that I simply don't see.

A further complication would be xen.efi's .reloc, which we don't want to
needlessly move either. That may be coverable by pr-processor
conditionals, but I wanted to mention the aspect nevertheless.

Jan

