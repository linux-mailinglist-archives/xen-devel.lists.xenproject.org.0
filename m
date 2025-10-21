Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA8BF5AB4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146965.1479299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB992-0004sw-Ky; Tue, 21 Oct 2025 09:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146965.1479299; Tue, 21 Oct 2025 09:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB992-0004q7-Hl; Tue, 21 Oct 2025 09:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1146965;
 Tue, 21 Oct 2025 09:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vB991-0004pz-5f
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:59:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9496cc6f-ae64-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 11:59:06 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47495477241so5869705e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 02:59:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f7dsm19271386f8f.4.2025.10.21.02.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:59:05 -0700 (PDT)
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
X-Inumbo-ID: 9496cc6f-ae64-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761040746; x=1761645546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QZbqOoTIxWA7VAksPbBFHi9ACZ/PYH/YoqygEpm6rDM=;
        b=F7St/lgT/8uRwsKPJOOQKP/yj+HZEZCyKQS9YlnwxQRtUHqsfAAiAmvJ2AMNv+VPCd
         H21TCUypLX+Bl0wVkvaw42pWgBmPsdpPvYSEkrVbb/o1fVxZkgDfTpP3GOMI9OUODg4Z
         ydm4BgCrBZF/qX5WjchBN385l9ind30muq2FDIrusJXZvLgz8Y+DfCjfV8czTacUxf+Q
         Fy5MSNSctjS59rdIdWkysC73TSSOTAVEQDZMBxnYct/gNmkurMd4Au6rvxvbO1uyo2MR
         IFvDlqGkjYhKdALAreHG2Q4SU0fZVAG1ZaC9zd5nHHj7cmmSsdHoUwt5JK1aOM2SskVr
         d+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040746; x=1761645546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZbqOoTIxWA7VAksPbBFHi9ACZ/PYH/YoqygEpm6rDM=;
        b=jlybqVHNflGJV8YcZr2IuSeNd8XcPr0jivbiEdejWRJNhQ0VzvFW0iFWZJy4X00J+3
         fvQPmO4nEyi6vjJD8iB9gR1CbTnIdufXhNRvSuPfSub79kCVSyUALVlvCw0c3zQiKKLf
         L1CzIr32ViKCkgLmQj+apfOBW5IAVHdxlMOuCAgFiRXIGpWh6J1O73bM0gWgD1wWK8Bp
         FfJGT948CGvIBtA6hhyBvPVLmKyEbEHJRF9ImcjwBv4IC3O9yaGPt6xpUqQWSbrE7sSP
         GKAtbBytRWS+cSMztwm6F052CirTpdP/F1IxF4s2W5JRMasplBmMMK+9A+EQFJEorDgR
         vSIw==
X-Gm-Message-State: AOJu0Yzr2R0az1eecTkTVcELWswFfMBV/p0NngmDaQ/Tm7YkYQem8rlc
	BS/6omio8uAR6lsN4Ux/DSDfm8cdrDAABo4hpFmRhFhw4P3eySKQtq6l97BqbwuhzA==
X-Gm-Gg: ASbGncs7x+uZrZxty9/6xwCK/7fcA4ddYJBHzp3ovPxTqHlEvbQOugInByvg0GjAcjo
	1O4r5Rw/MnoQ41voZknO8yd2OQ2yJcKS+DeRnF19Uzz7obK+LesDCm6Ink440VBjNqxyvcwIW91
	i70kJw9epQGqI3ZIdh8ob7uQcqIRBbOwjKp8/tHGFhbpDRfWKmswBhFuXhMKX6FU9rDSHauqX3E
	RU3HDcBNCYCLcrNallghK9X+z84lRXcmu7LlKX2A6fw7X+FLVw5O8cq6Kmkm8mHDezZ+e1eFWO7
	PpobuZKcXEsiSYa0bIQPXKISmuSoN6oDh1viS2XP9NxJQfL53/wG9TWVlmw0tZI6IzoZMA9QdVo
	RMJVDFaBq25IOztnHMowijxqVncBLczxbGZH0NuCPNehMPl59VkMoqjGN94UmihDfEeX7DCHyE6
	V0F4qM8xFhxzmpphjkNyZzfMvHIC/Xn7tQS15bGIlkr+sinpL7GT3iUJurHeTqZbP20cmMnUk=
X-Google-Smtp-Source: AGHT+IHbExcTMZ02DgoZTE8/XYP0KdJQTGvqnXUpL5h+DpaMhQZSbE49EufdLN9g0eMbLduPMxZRTA==
X-Received: by 2002:a05:600c:8b30:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-4711791cbcbmr123457725e9.30.1761040745669;
        Tue, 21 Oct 2025 02:59:05 -0700 (PDT)
Message-ID: <5b98c3a7-c3eb-41c5-af60-2ade0556085a@suse.com>
Date: Tue, 21 Oct 2025 11:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21?] AMD/IOMMU: unshare IRQ .ack and .disable
 handlers
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
 <aPdXCTvrcUHv2uQM@Mac.lan>
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
In-Reply-To: <aPdXCTvrcUHv2uQM@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2025 11:48, Roger Pau Monné wrote:
> On Mon, Oct 20, 2025 at 04:16:13PM +0200, Jan Beulich wrote:
>> A .disable handler can't typically be re-used for .ack: The latter needs
>> to deal with IRQ migration, while the former shouldn't. Furthermore
>> invoking just irq_complete_move() isn't enough; one of
>> move_{native,masked}_irq() also need invoking.
>>
>> Fixes: 487a1cffd71a ("x86: Implement per-cpu vector for xen hypervisor")
>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>> @@ -428,8 +428,6 @@ static void cf_check iommu_msi_mask(stru
>>      unsigned long flags;
>>      struct amd_iommu *iommu = desc->action->dev_id;
>>  
>> -    irq_complete_move(desc);
>> -
>>      spin_lock_irqsave(&iommu->lock, flags);
>>      amd_iommu_msi_enable(iommu, IOMMU_CONTROL_DISABLED);
>>      spin_unlock_irqrestore(&iommu->lock, flags);
>> @@ -442,6 +440,13 @@ static unsigned int cf_check iommu_msi_s
>>      return 0;
>>  }
>>  
>> +static void cf_check iommu_msi_ack(struct irq_desc *desc)
>> +{
>> +    irq_complete_move(desc);
>> +    iommu_msi_mask(desc);
>> +    move_masked_irq(desc);
> 
> Not sure it matters much, as I don't expect IOMMU interrupts to move
> around frequently, but do we really need to mask the source?  The
> update of the interrupt would be done atomically, as we know IOMMU is
> available.

First I wanted to keep things in sync with other, similar functions. Then
the masking here may be not only about the moving, but also about this
actually being the .ack handler. In fact, when taking into account the
combination of both aspects, don't we need to deal with the case of this
being the last IRQ on the "old" vector, with us wanting to prevent another
IRQ on the "new" vector until we actually handled the IRQ? The LAPIC ack
(only done in the .end handler) wouldn't guard against that, if the "new"
vector is a higher priority one than the "old" one.

>  Anyway this can be done later, so:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

