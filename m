Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADEBA6A48B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 12:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921843.1325575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDoG-000067-KO; Thu, 20 Mar 2025 11:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921843.1325575; Thu, 20 Mar 2025 11:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDoG-0008Vq-HP; Thu, 20 Mar 2025 11:11:36 +0000
Received: by outflank-mailman (input) for mailman id 921843;
 Thu, 20 Mar 2025 11:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvDoF-0008Tj-R6
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 11:11:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1550ffcb-057c-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 12:11:34 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso365232f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 04:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318afbsm24158396f8f.72.2025.03.20.04.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 04:11:33 -0700 (PDT)
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
X-Inumbo-ID: 1550ffcb-057c-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742469094; x=1743073894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LEFfLSue87S5pd3cvXTqXh7j26JTajmuQX8pX5wdnIA=;
        b=aOCGUiLCGhr2JcJUDqQsIF+D6GrAHUnE950BDo2rJfxU+YdKu+YdDSbYK4TMTLiTlC
         0pCfrrtBdDXpTMPKUV8cmoIWJQ0ccVdSVdMpcYBl2opurXjSQLD8FefkmUxDSSOA1fsB
         6kaSq+Ear/BQWp/7brtuCLYvhxjlnTVdSXj34Cra9/tGtg72u1RDXjy+eN60nlb1i6Ym
         UvkLBHzgX8VtVS0ybMg+sig8VUZbtCzBm2TlawYv6Dv1vKoBPHHePZErUFDL1xsH6xSL
         aXiTYI+hVyMgifepvGaPcqxhR7dsobizUfduKKZ4TaUkrjMGyBct64B6hLVuFPbSE/F+
         Rg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469094; x=1743073894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEFfLSue87S5pd3cvXTqXh7j26JTajmuQX8pX5wdnIA=;
        b=KXuwAaoytNgO5fxTBIGU94C9n2y6Kv6FHwn7MZstEJ18EW1jfBNrR/bqzgND+0pfyL
         W5xctEYj7RoJw/Oci8RJ2IRFdRgiU5Zg0TB6JCsc2rFldhNGziHOpb/SC5sAc0EDxSg2
         nGaqOgg+uCWsPjxNipKq298nF44rKAvSGojHXPZu5A/Bxi/lA4XMeApxQkQWYP1d8Qyu
         ZWYeCyh7gPq584syjPWvYXCNDaF/5BbqfdlrwNHlY/Z3ZPHrEclPGHoNhqZ1wr4Xnwu4
         FcSc9c7e6IUdqGxW0THATeZ+sOW1B+f7N2PySrpILDhCP5791GIrCVb8UKkDBTnKl7zb
         sOgA==
X-Forwarded-Encrypted: i=1; AJvYcCVV6OgYGYD2lZTKfQAEUd9c4xBTikZHRUiuTVl1E3G5i2Rj1Onmmhb+8i6SgDdMszx0RBbouhFbjQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiOKh5o6Z4VL6lICG1wLDD9J3ykfbFjXmxHpBLu+1okSMCu1yn
	38JPz3yHV0Z/Okwtc/WlS0dmKejVT2FQpxROcn8vKgOeZHih/HzOCZAkeCVhTg==
X-Gm-Gg: ASbGncs94NNOh5oyJ2xpjxzMukE4o5AEATI5ry9iVUGgDHdoLeRS5Hb2CzQHMjmaY/Z
	FUXZUw62sBEWuW0IA2/AzHKrrLe+N/DYsvIhTJ2GMYcTr1gHamWzDGKT01QI2vVto2ElC9X937S
	1/3J3/vY504XVWld6jQArvHAye6FcEe/t0WZnp3ixM7hT5xF3Yz71LB9ieWeVyl7LNi4yAZQOLg
	g/BipA0pDOz/sPuIOO9iRLDZ9AnVi/FrL9gFt4IeMkkDubbig8cNsqMvHtBRDgbsT1f092x4hHM
	nZlJFX/oxu74QVCRUdrqgjdTiM+TbrHKFWJVR1zyMqiFiDrRkq6VZFohOdgwDfQTdqzKzmy/dzZ
	cqlBhbGOXp2M5moqpcQdWovZ7oBFbRQ==
X-Google-Smtp-Source: AGHT+IGFC81FZzQ2W1h5NmmTVIuiSexNX8HV3R6qK22V2M72AqqIILJhXR4AoQ4oqFQnoFtSgFjESQ==
X-Received: by 2002:a05:6000:440e:b0:391:39bd:a361 with SMTP id ffacd0b85a97d-399795a8eadmr1855644f8f.18.1742469093740;
        Thu, 20 Mar 2025 04:11:33 -0700 (PDT)
Message-ID: <45d9c656-b35c-4b8e-83bf-aa145f839adc@suse.com>
Date: Thu, 20 Mar 2025 12:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
 <Z9vOc5I828aV49rI@macbook.local>
 <0da7c7dd-bfbc-4e41-98ed-6e98793e6f50@suse.com>
 <3bec51cf-e3db-4f1b-ac24-4686e2498fde@suse.com>
 <1903e4c2-6a2c-47f1-a5dd-28f13cc87da2@suse.com>
 <e5dcb56f-58d3-4141-ab67-92a690310007@citrix.com>
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
In-Reply-To: <e5dcb56f-58d3-4141-ab67-92a690310007@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 12:00, Andrew Cooper wrote:
> On 20/03/2025 10:18 am, Jan Beulich wrote:
>> On 20.03.2025 10:53, Jan Beulich wrote:
>>> On 20.03.2025 09:34, Jan Beulich wrote:
>>>> On 20.03.2025 09:14, Roger Pau Monné wrote:
>>>>> I wonder how this worked then, as I've tested with the xen.efi smoke
>>>>> test in gitlab CI.  Maybe ovmf doesn't acknowledge the RX sections and
>>>>> unconditionally sets all mappings as writable?
>>>> Possible. And that would be in line with the mode being call "physical mode":
>>>> There are no permissions to enforce there. It just so happens that x86-64
>>>> requires paging to be enabled to be able to run 64-bit code.
>>>>
>>>> My experience with OVMF has been that it's hard to find where certain code
>>>> lives. Perhaps I should try whether I can find respective code there. Then
>>>> again if I find nothing, there wouldn't be any guarantee that I merely didn't
>>>> spot the right place.
>>> All I can find is BaseTools/Source/C/Common/BasePeCoff.c:PeCoffLoaderLoadImage(),
>>> which doesn't look to care about section flags at all.
>> And then there is at least one duplicate thereof elsewhere, or something very
>> close to a duplicate. In addition I meanwhile found ProtectUefiImage(), yet
>> it's unclear (to me) under what conditions execution would make it there. Plus
>> it leading to SetUefiImageMemoryAttributes() leaves open where
>> gCpu->SetMemoryAttributes() is implemented. I can spot some Arm and RISC-V code
>> with respective names (albeit in distinct places), and MTRR functionality with
>> names along these lines. None of these can be it.
> 
> https://www.kraxel.org/blog/2023/12/uefi-nx-linux-boot/

Which, besides saying e.g. "When configured to do so ...", means that our copy
of ovmf wouldn't have any of that, as it hasn't been updated for quite some time
afaict (just tried to pull earlier in the day, with nothing new coming through
at all; the last time something new came through was apparently about a year and
a half ago, i.e. older than what that article says is needed).

Jan

