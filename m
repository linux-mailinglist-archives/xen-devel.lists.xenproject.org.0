Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F80A75F08
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931907.1334091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8z1-0002L7-3x; Mon, 31 Mar 2025 06:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931907.1334091; Mon, 31 Mar 2025 06:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8z1-0002I9-07; Mon, 31 Mar 2025 06:50:55 +0000
Received: by outflank-mailman (input) for mailman id 931907;
 Mon, 31 Mar 2025 06:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8yz-0002I3-4W
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:50:53 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b4d020a-0dfc-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 08:50:50 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso1474187f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:50:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658c87sm10523587f8f.9.2025.03.30.23.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:50:49 -0700 (PDT)
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
X-Inumbo-ID: 7b4d020a-0dfc-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743403849; x=1744008649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mulo67s4xyOwq3YWS5wm+JI3ee4XAf8RvE4OYvx8Tsw=;
        b=apTeuDoIMop3Z2V5WzLtqKDt0LF6QOlYnDKEGKx4h6Od0qW/l5DTzuUkOUzfhODfNX
         OZFbT+z46SOSrT7fLMhdFwXcfY6RRa+2R072c8loWWm5vV1bqYRSlfUD8CbEY5ZXgB7V
         ZByV5Qx/Y0NdZWD1IxfFXCxZmTB34jlfB3fV7HriTElAZmin+ZINqlP6SQjY0wSBlUAp
         zADr48h/gGXRcNyjQQ4F4bKBxnfyj7Wpum4HzdSuH5PRcHMZ3Q6JRlkeh/VqSmga2PEU
         Yu+dcdKZs+z7V1xCxrKGnm9rNfVzIlRtXyE0L8EHx2MXArsFyVlOcuF2mlKmau7T28Tm
         jlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403849; x=1744008649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mulo67s4xyOwq3YWS5wm+JI3ee4XAf8RvE4OYvx8Tsw=;
        b=N9oqrVr+IEzSXhhzFAUHeEOB8dla1Gy48ENdeH9x03qP1CYccwsqs9kVTEgMwo6Nl5
         Zv5nDlpj2VSHRXLEucsMaCxD0a9Y4Dv+WdCw0cgDOev6GfHfcOeMZEIntViauewAAGqg
         5J3Q8wEUCS+TfQq4pNLQWwDHPLpzKsFojQw44DZWWdpuw3Sb5rFop76u5H1Ju9Mxf98r
         DF/AcLfRMB6hqU58xRtlB1puM+CUwAlT8pKeKBz6OKX1j3bFicQoKZoUq/03FqHdRO1E
         7XBf5S7Uf+HLSA+zm+QWYNLceK/SJA1isqCvvwB3IYpJI2+jVxcdN831YMIm+/APHccJ
         r6lg==
X-Forwarded-Encrypted: i=1; AJvYcCVGGW62H1C8GEinBGlKbNyKq6goIOqYANrTIggGPfkrkn+KwwTQi7rDvSiUQR+oKxrPOOMBtbxPeno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYZPdyAewyy43sB/Hc9YJOMnwYjJ1DJEezz3xnoMKK/j4c0sOP
	vUoc66DA8jcw2LhUT7x1hVxxbO0tH8gun+I6TCgXM59PlkuV8seE+VCEO8XecQ==
X-Gm-Gg: ASbGncvPIqbfVAvR1FTBjKY9n+1fKVYSDXnbisWDsCprzPF8Xng2sC95JgyYQH/PRPR
	YW4D+/E0jFfpuMXgc5O9oB3IIf0unOtR4hrTlItqxAcugpMilQjEwn7S57v2GX5iAygKmG7jVRu
	pZ5OCaDtwoAhvhj8Cl+B06ulboqw6jog1cE1p7kJz1DtlSaPiquHMCoaZ0jsycO39wKwGw2mrY3
	FUCZ6gehENhBjPwzVRGCfzieGyZI0slGSwH35iLT75KDQhbYh04cl5FUc8RfOGU5eHfq4/8Wbns
	tTijf9keOSkElLWa0rLQ6YfBAaMOAPzChFdVnG8NARMYPHxxX8dJ50MyhZhkHA+2vcM5z8w/Eg7
	9y4nwHFYz10c4zzZ3hR2RhY8+xbDcRfsGNtAVKcn6
X-Google-Smtp-Source: AGHT+IGOol82neLn7VXXvqo+FZ2Y2CLlJzrw3fFHTV2yYKu9LFh9OCzIzN+YvMiEMD1Sf0j+vKFn/w==
X-Received: by 2002:a5d:5f91:0:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39c120ca76emr6452461f8f.1.1743403849566;
        Sun, 30 Mar 2025 23:50:49 -0700 (PDT)
Message-ID: <3725d86e-f804-49c2-b966-2a52aea6fcde@suse.com>
Date: Mon, 31 Mar 2025 08:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 2/6] Arm32: use new-style entry annotations for
 MMU code
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <1287edd8-188f-4b1a-b087-0beb3eea5ed4@suse.com>
 <dad70c39-c398-4641-8775-ffb1b896367e@xen.org>
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
In-Reply-To: <dad70c39-c398-4641-8775-ffb1b896367e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 19:39, Julien Grall wrote:
> Hi Jan,
> 
> On 13/03/2025 08:07, Jan Beulich wrote:
>> Locally override SYM_PUSH_SECTION() to retain the intended section
>> association.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
>> ---
>> v7: New.
>>
>> --- a/xen/arch/arm/arm32/mmu/head.S
>> +++ b/xen/arch/arm/arm32/mmu/head.S
>> @@ -160,6 +160,13 @@
>>   .endm
>>   
>>   .section .text.idmap, "ax", %progbits
>> +/*
>> + * Code below wants to all live in the section established above.  Annotations
>> + * from xen/linkage.h therefore may not switch sections (honoring
>> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
>> + */
>> +#undef SYM_PUSH_SECTION
>> +#define SYM_PUSH_SECTION(name, attr)
> 
> AFAICT, SYM_PUSH_SECTION doesn't exist yet. It is introduced by patch 
> #6. Should this be moved to the last patch?

Perhaps; I failed to notice this when I moved that patch last. I doesn't hurt
to live right here, but I agree it's better to move it.

> The rest of the patch LGTM to me. So with this addressed:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

