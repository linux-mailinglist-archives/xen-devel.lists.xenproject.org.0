Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D2A6F93B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926422.1329271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2s1-0006gT-UQ; Tue, 25 Mar 2025 11:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926422.1329271; Tue, 25 Mar 2025 11:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2s1-0006eK-RK; Tue, 25 Mar 2025 11:55:01 +0000
Received: by outflank-mailman (input) for mailman id 926422;
 Tue, 25 Mar 2025 11:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx2s0-0006eA-3V
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:55:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa0c7945-096f-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 12:54:59 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3965c995151so2728747f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:54:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a325csm13435924f8f.22.2025.03.25.04.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 04:54:57 -0700 (PDT)
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
X-Inumbo-ID: fa0c7945-096f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742903698; x=1743508498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mzp1P8cUL8hUt4vgEhmoPngV9dqPWE7W/CpUCeIhpwI=;
        b=ViwoI6mKNjll/vtxNHrtWXTVoM8J7WjNdoZeFKlrGaDHmLitgW6sR3ykSsw6rqok7J
         X3+EuNx3F9nVHYVeWyKQ670L2CdXW3SRgLHWbF/b85sj9Kz8WayWIP6shCEpXw9sd0BE
         hrTrNJb98wW9ESvRyyMbBK9jsTmwmbAjbhWqJYAhrO/7ZHmeQj09K/gJAet5/YXsq2Dy
         YeQXodCrg5Yw0mdwx0iA90bGoLaqCt8hgynyvb6qo/GfCkupl/h9URYEy/3uxhzAxezW
         6qzpTCwj6Psmdekn54JaU9wI2fjZPDf5E60AzIS0lJY8FTi+hoEbAv80uUnaIgcyNWuy
         jqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903698; x=1743508498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzp1P8cUL8hUt4vgEhmoPngV9dqPWE7W/CpUCeIhpwI=;
        b=PLDRTxjaFaO8BgfWc974SU6wZF0jqNknH/CjTn1NOXMG0MOdW5jFMEngJxoPuPXoJN
         KG8DZHJCZjvhXX4YYigRBX0vYGgjn8iTjeC61BGIxKxkfzp4WeaxEW2Y+Oc9DVKoxijA
         DfocIzGsLaiH66V7fU7MRgqH9y+qIXL4xenpvkWhzTtg1bsPlrUTR3mx6d2SFdEVhrnt
         FH7kTPt1Qc3lMsPqQjG9xJuvAo5KvjaWxgZkgzt5mE4SxYNyOtHiSGvj4Fo0TvyTbgT9
         9ydl1R3abi9Uir/tFt3kyvn00kxdDQ/MrBj/rO0GmHkdrTHVZeW1F/eZGDXF7vicRsPa
         bMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhZ3x3wbwnV17iNPwpcKbxdU85OmZqENn2/l+ybHpnlfJb6T1ezxFn0ILQL0OZzfqNRPX1v9Vgfnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxniXpfLccc6AC6/JWUo+wMX7qlloJ7ZjcFprX4ucMtVM1hGVSt
	Vx+fXm0xK7WpTXtmNQPy1zQTEr8Ai05EGBPjgcpXIBFK2qc0yqkgbi0otYGrrw==
X-Gm-Gg: ASbGncubKD2UffwiR0RcfGbQIyfzRJZuG2GZmK9guFwyos81Sottl6oQqofyHW5qWf8
	7rRSwFli55RmeKoB96LCw2nSa2MYT+nBXYUqRcIwZI77yfp5G/B1Fxpd/J+oX5e5ShGozgrdTb/
	E44iH0s8bXtI6kYylVivg+ht91EtNu0uMi4jtRv3xrjCTjwSimSZA1S4zBqbWF1Yv/ysu+PiY12
	JpUnGRTVnfH8g7ohFqK541sDKCzSRuOrl9NQNShvSxsSCQoZ/rmxh8aVHqnsFBO42QmTC/IQRwZ
	ZVTx6CQJ65ypcnSkXfzeJcv66KaTPcVvQ83+m6qYfwdHPrlpG+OpyBxCGaML0piMVMZ9L6y7So0
	wGj7WslkhkeDWtgrlIR/kOlYZ4iXsXg==
X-Google-Smtp-Source: AGHT+IGsKtlmIAbgpMrKsgWQWTGFLGAkS4I5wSXl5nv/PtqAh+l9kH173y5CnoS6rEdDSUzAWwa/iA==
X-Received: by 2002:a05:6000:42c2:b0:391:4052:a232 with SMTP id ffacd0b85a97d-3997f9424ffmr10384228f8f.55.1742903698416;
        Tue, 25 Mar 2025 04:54:58 -0700 (PDT)
Message-ID: <1285db95-6336-4fad-b084-e941935f2887@suse.com>
Date: Tue, 25 Mar 2025 12:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
 <b0083a5e-2395-4c94-b6b1-8fd8459ad043@gmail.com>
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
In-Reply-To: <b0083a5e-2395-4c94-b6b1-8fd8459ad043@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 12:23, Oleksii Kurochko wrote:
> 
> On 3/17/25 4:24 PM, Jan Beulich wrote:
>> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>> +static __initdata struct dt_device_node *timer;
>> +
>> +/* Set up the timer on the boot CPU (early init function) */
>> +static void __init preinit_dt_xen_time(void)
>> +{
>> +    static const struct dt_device_match  __initconst timer_ids[] =
>>
> Do we need here __initconstrel too? (the same as we need for
> aplic_dt_match[] in patch3)

Probably. (You zapped too much context, so I had to go back to the
original patch submission, yet even there it's not directly clear, as
there are further abstracting constructs in use.)

Jan


