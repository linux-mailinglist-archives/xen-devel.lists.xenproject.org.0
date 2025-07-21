Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC000B0BC7C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051004.1419313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udjyF-0001Je-G9; Mon, 21 Jul 2025 06:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051004.1419313; Mon, 21 Jul 2025 06:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udjyF-0001Hm-Cy; Mon, 21 Jul 2025 06:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1051004;
 Mon, 21 Jul 2025 06:25:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udjyD-0001He-NS
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:25:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c1ae5e6-65fb-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 08:25:51 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45610582d07so30064275e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:25:51 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b740c51sm90212795e9.19.2025.07.20.23.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:25:50 -0700 (PDT)
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
X-Inumbo-ID: 8c1ae5e6-65fb-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753079150; x=1753683950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VlcHHcNHwC5o994H0e171qBzPjB6hRrL1CvSGwK7iCA=;
        b=ZW5da364kqiz4dU9DD98HGHILHcO1tw+JhAte18DzB44BATqvdFz4qc9dowbyrX9X/
         Ko7DWTbMgfi1fWmpXhGuPSbAFjsQbVweFJRmoB6xt60MhcCKXMkupoEOVW7WbSpPBCuF
         Fq1RfQtrGl/FweII48T4fkT3/dF68aAxOLXwbeF5AZEEBzDezN21z/4KQ+kqDBi3UThG
         NIDE8plZBvA6n0Nob1rFOVP5OmE8Heo/8zRR3AZHVbMYnHMjJUeKAy4XKKpeyKCsGYGK
         nQHuqX5o3m6WZ8n44bE8H1aSaB/STaY/lVPzh+D0n9hyLtFZ3XYg3D9icg5s35BcjBmI
         vDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753079150; x=1753683950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlcHHcNHwC5o994H0e171qBzPjB6hRrL1CvSGwK7iCA=;
        b=GAj/czaNX3P6+STxisIJ9bzatdh6AjRfZH7KbvyBiez8xsvGuAtVd3YBiew7Zpk95+
         LW1lcIl80kDKFvj+gdSCxtK5jU9oTF3KvdMAFk6WPP+MH5Mte5Zp9/X4LfAvZF2u2//0
         VwrqHcTeu046Fd6ALyhBAUuReZNdBwBab4G+C1SqcYfccRt4fFshON5y7ZvjberwvKGz
         YAKGtF+qv5TzvxkR+37zkxO8p0KoQMhW50MolXfsEX6pxC0deAHYBK8UbzRlt+L8LYww
         OT9TpLU3+wb1RN1HtixAKTnLS7LK3K9jazQF4D20t4vYAwZL7NGJYWxBIDz2sZoF0pzM
         Jd5Q==
X-Gm-Message-State: AOJu0Yw42NVs7zbsvj8ZYCgNQrnxbDbrkHd84U/M1iNB6czCczu5Ah4V
	H6DB86M0F86EFy/Y/YBONFWNtoMZta5scKMp7ACG17ImzhToaRST8H44LlSfj26TAg==
X-Gm-Gg: ASbGncuD0w60ZLuF2aIvOzlqOSfDDD1QKKLFbctHKlGDK3HMSA2J3HiqRRKi30hV05C
	58CwSrAMqQrHvGHt//rHaKGRLD/s6+v9uJ921Gsnv8aVlLYrUDHlooCecuaw4B0gqzy4lmcvGJL
	Bx2vikZr0sACw9BmSTc4a5oPZZ8Ok1U59qAKP197EzJGAhqtBar4Y+VpMz1SXMRXwBg2NAvoHoI
	+TlOKzQhHq4VU8v2kLZ5mr+hmnTOVFzACZQtOB3IZauJW4TUyGrJfz2SDWpTAy10vqxSZo+PdpO
	AfwDKnWTjXyJNEcumruAOkgvYvY/XwKORT1pT7zngEZJ06nyOfAklKRPx173fpw81yDFQ1ZFFsg
	7hXW9Zf8aKYScJCNXnhKV0GxFeOJPyZ6QlFhnjhJgmwZUmOpnnm4gXprUfNalWTe9pQDtvvVE6B
	pwXMOWo1rbhA5bKR+PinUNHtWuH8qX6y7Kj4xlQ7u/iaTXjSyqd0QIfBfL
X-Google-Smtp-Source: AGHT+IGd2IPTXcrGOYsKqiDgvppMOxXsBi6yieduBrkstVeJ4KzVImfVogTBFjBxlThp6DbPpMOdMQ==
X-Received: by 2002:a05:600c:4507:b0:456:2379:c238 with SMTP id 5b1f17b1804b1-45635982c3bmr159202015e9.17.1753079150572;
        Sun, 20 Jul 2025 23:25:50 -0700 (PDT)
Message-ID: <870ebf7f-e953-4c48-b733-a5e7a191cae2@suse.com>
Date: Mon, 21 Jul 2025 08:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain
 pci_sbdf_t
To: dmkhn@proton.me, Andrii Sultanov <sultanovandriy@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1752736989.git.andriy.sultanov@vates.tech>
 <94d8b7537021337a6b54d8950294702f5bbd2590.1752736989.git.andriy.sultanov@vates.tech>
 <aHrElE4KN7djeXzn@kraken>
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
In-Reply-To: <aHrElE4KN7djeXzn@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2025 00:03, dmkhn@proton.me wrote:
> On Thu, Jul 17, 2025 at 08:31:27AM +0100, Andrii Sultanov wrote:
>> @@ -756,16 +755,16 @@ static u16 __init parse_ivhd_device_special(
>>          return 0;
>>      }
>>
>> -    bdf = special->used_id;
>> -    if ( bdf >= ivrs_bdf_entries )
>> +    sbdf = PCI_SBDF(seg, special->used_id);
>> +    if ( sbdf.bdf >= ivrs_bdf_entries )
>>      {
>> -        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
>> +        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", sbdf.bdf);
> 
>                                                               ^^
> Suggest using %pp as a formatter (similar to modification below).

Here using %pp may be okay, albeit I'm not sure even for this one.

>> @@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
>>      new_rte.raw = rte;
>>
>>      /* get device id of ioapic devices */
>> -    bdf = ioapic_sbdf[idx].bdf;
>> -    seg = ioapic_sbdf[idx].seg;
>> -    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
>> +    sbdf = ioapic_sbdf[idx].sbdf;
>> +    iommu = find_iommu_for_device(sbdf);
>>      if ( !iommu )
>>      {
>>          AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
> 
>                                                                 ^^
> Use %pp ?

Here I'm pretty firmly against. We're talking of an IO-APIC here, not really
a PCI device (and that's irrespective of AMD often(?) representing IO-APICs
also as PCI devices).

Jan

