Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B23AB3535
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981245.1367640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQjz-0003Du-Ty; Mon, 12 May 2025 10:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981245.1367640; Mon, 12 May 2025 10:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQjz-0003Ar-QU; Mon, 12 May 2025 10:50:35 +0000
Received: by outflank-mailman (input) for mailman id 981245;
 Mon, 12 May 2025 10:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQjz-0003Al-9r
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:50:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbbf5ae-2f1e-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:50:31 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fcaff7274bso4859050a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:50:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d73fdd0sm5563952a12.81.2025.05.12.03.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:50:30 -0700 (PDT)
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
X-Inumbo-ID: ecbbf5ae-2f1e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747047031; x=1747651831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WNOwQrQJ14uBBj+k/RnMLT9hO+/IJT7VGUvGaoFWIrI=;
        b=SNwyrAoE1hyoHdyOKML7O0n9LR7xibpuI07wYA8hp4d34VnWNRzlMr+4LDYUmbPrn2
         oiGofynu1mwna8FjdpmrELEdmfh+3gRngOcvsn8PswpcuFt+VQ0Ykr2oOODbbjCEb7qs
         QRNOshoRtcRlQlN/Uas1hy03sSIJvRwBat+BeQg9+qTgF3a+o7Cf/mQC3duqOgAlRk1/
         qrEO0jNt8DLhxQAiyg1SeGpHwBU2eSMhqbQljZoXrBo+x2UKkyCfFhwO2nvrDm1JCLaW
         E/qGuJBWugJTYEPSyS9RufQGukCfwVGX6YmeYGFM26gjxn+Jooi+7bOcP/d8sH0Xv1bd
         vcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047031; x=1747651831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNOwQrQJ14uBBj+k/RnMLT9hO+/IJT7VGUvGaoFWIrI=;
        b=bmg+Xwa2xxt5jGWHnRvuevrUD6P/q+H/bYn/0rSlG0CjuVMZraKiPioy1AtTZHDqeN
         4EmlRx4J7IOfoUrRVrrXw2Jqv9nQB9N1pEPhN3FVA6XRA+NW1lHqZ0Tb5emd8dxMtoJt
         Et/7noGFryhcer3IiMonbA2Yq3O05sTq3eFAOu592vPV9kEMKJ5NjD/+qW0agvgDj7QY
         dbW6IDLwIECeYHSDiXyB2c6X18hPvlrE3uResZHjURiSxC44Sti7vAskGD0baUwvwKci
         r7PUTDc6YRfbu0zyM3e0OE9H1zt+r8wW7MvVmWIxoVnJdjDfJmxQMWPrxc7mQ+Sg82gz
         Vm3w==
X-Forwarded-Encrypted: i=1; AJvYcCUy+Z0KplN5RC9DuFV+el5Uw1a0FlA3vnVKU+lD3d+rrVgJbAVXEodcQOggOMq/AQd4ARmaDpeOE9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy2+jCid8lpooUBnX69o8jK6gbAGo2BmTmJAflwIa3iuzd9ZUV
	wCrD0UaLWyxl7+tDzmgQgQR7af1SAQYw5UixtMXHffit40vzukY03CRiM8WCFw==
X-Gm-Gg: ASbGncsorX28hXYkXHYvKp5o+aY+8n0RT/Qq+aI+n3rgSX2Vfni9px16Zc25Q5vWYa4
	13xNMoq6GCrsb/TJFrrdyoQ3y4g/5UZdmDj2kS/CAA+o6Rgj8sW02K1jciEo0/ejEoHZyukY+Qn
	Dq10xRCvIm37o/coiXW94Xl4k1daKy9KJZeL6ntedi7CkgB1AoONmOS6IQMpbI7W4dLwKtVJsKl
	UR8To1ze1+1A31GRuxkYvEh3WlfvNXWAp6bbIB3UB96y+IKKQhqCK9WI/+D3LFZAcmJeWMvkjlE
	P5GRfMm11jPZ3eCCMwHf7UjSj3IW6Ni4TJPMvA/bm0pCTdNpEWr9dELgVkj8mqyWLpE5PEHKW94
	8IICSTUslXb5uXQ/UrxMN5Oujnxs73jNX1NjH
X-Google-Smtp-Source: AGHT+IECvw8pgmhSxPsfVyanFdXvc6giN0nPQdBy4KAjwqVAAhaf55cdVO4sXRn4aEK8eCrozmlOjg==
X-Received: by 2002:a05:6402:90d:b0:5fc:3f48:a673 with SMTP id 4fb4d7f45d1cf-5fca07314a4mr9693065a12.2.1747047031136;
        Mon, 12 May 2025 03:50:31 -0700 (PDT)
Message-ID: <f43c7091-bd82-4341-9143-dd4a78e6bbc6@suse.com>
Date: Mon, 12 May 2025 12:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
 <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
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
In-Reply-To: <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.05.2025 10:51, Andrew Cooper wrote:
> On 07/05/2025 2:54 pm, Gerald Elder-Vass wrote:
> Also,
> 
>> ld: warning: orphan section `.sbat' from `prelink.o' being placed in section `.sbat'
> 
> This is because sbat.o is getting linked into the non-EFI build of Xen too.
> 
> I'm less sure how to go about fixing this.  There's no nice way I can
> see of of getting sbat.o only in the EFI build.  The other option is to
> discard it for the ELF build.

We already link $(note_file) into just xen.efi; I'm pretty sure the same could
be done for this new object.

Jan


