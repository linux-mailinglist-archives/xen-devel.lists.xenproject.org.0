Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2FBD1BC1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141734.1475897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CdK-00057q-4D; Mon, 13 Oct 2025 07:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141734.1475897; Mon, 13 Oct 2025 07:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CdK-00055R-0U; Mon, 13 Oct 2025 07:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1141734;
 Mon, 13 Oct 2025 07:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8CdI-00055L-Lj
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:06:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e5a94a-a803-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 09:06:10 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso28458225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 00:06:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb483bbb4sm167410785e9.5.2025.10.13.00.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 00:06:09 -0700 (PDT)
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
X-Inumbo-ID: 18e5a94a-a803-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760339170; x=1760943970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n5CpMu8MBPXFMH0R/+yF4S4X3SIEO2DveB+t4J5aA0o=;
        b=NBjZTnDWNsYKi3hhK4J6HrhkGYTaahPCI/pcjrGqcKhG6EyxIVIrrcyMwozQoOK8+7
         oyg0/OgapcOG8Pfq11XEjazOZ/YiZRcWOhvODrW9P9biJhW8xtb/ftmEkiHkFQnt2GeY
         5aGJx8w/3WYpjJ7WBBRO2FOogBcX2aW33Ll+wjtdFJJfu67Dl8aTjusycIKh6Kbjt12N
         bt8GY745ncDhqoj1oVvktTAiij7A4689J5S/HjGzMmOqi0mAjBLukGkeW+9pttRb1xtG
         6rF2MB9z5xJqU0UOUnyYUMBU3NjLhpqoPSiIe/60/IX04IkRVz6pQGl1CWrLrVzoeSff
         7XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760339170; x=1760943970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5CpMu8MBPXFMH0R/+yF4S4X3SIEO2DveB+t4J5aA0o=;
        b=QX7XqH5ZUFs1fTuRmE5Bs1+bQDBSnF1FNy3uTsePV4dV74KhEBYmPF0rWUD+AwnYDS
         odPwhQHjs+Ef4Unjj37z0s4PWuiaQU7kzBpT1O+TZHbb97uPfwUgDwIaJa57eo+5S6HW
         1pkQ0UGG0HFT1qKnHMg0TML2qc/UU8ohEg853w+J92BCFYqUUULEyU0OLs7WdmmXO504
         +ab5IblqaygVBU5vPTLoqN6AGTgQhzO1l9bcBKv0FNbgklWLRx3FDwOlbkpzNqd7+abb
         mStciN3NoYnxdAM+ul4JMGeL6d77sok0iEDieUyaS03jev8YYip5iI+z+XzOTZ4vR/QD
         EFvg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQNkwqEQX1oNF/KvTE24KEGRKFUW3GIIvTThSU76u9KAzxiOOgYKRaxDXm93jwlN/I22j9CjC9VI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGs50cvwnwmaiG9q+Bu4h9iDwz2ggzuWKZfFPvWUiuL4X8s0fK
	gYxlj0NB20OWPp/Z18i9NNoYjQOEaJ9EBg4V+IN9f5rx97/SL2JUsw1JB8I7CL7vXA==
X-Gm-Gg: ASbGncv9GKu5vEQI2ukInuAzvHwvh0CNxLJWSytRtM2zQFJm4C1VK/plLKmHY7CHru/
	IZZHwSLAVcYgB+wJZvGR+uxLAdyH3pYj4v6lTDtVZ4ikLedKJM2DD4uzQtch2hrz46K0vLYU5rd
	mOEgQZ+kbmnmWBMaECPI4MoDCeTRgEKvZi+u0IEQoO+OnxuMVPtXBmt1zUTLTUJS5EUn9aaLVJ/
	3LvMZb/iB4AP5ko/8EUcrE78DkrH/FAjiT7gkpNNiJkz8O2MRoLTBhjvynrBspAD7pZK/7rPw2c
	8sDuBaddDsuSBS8zrqSKtU7GCZTmLyDWGaEHHCWwOE3JJZIe0dVa2qc45c4nAC7zo7vjQePeipF
	uXWZn3tR+G2edPJr/MB2iVwh1Igjb64+ciDPewH05bHf/ug7XEqfBI7NRdSfPEjHZ9L0gCCDsG8
	zQ3PrYsUxhzD5W/cEiE8wRZXRs2A==
X-Google-Smtp-Source: AGHT+IFNxWYa34g87S5x8mIKpmZsm7YWOHqSqACBthEVUxXuKm2My/hwfQPV1FYmnIxmqOF0GsDmhQ==
X-Received: by 2002:a05:600c:5247:b0:46f:b340:75e7 with SMTP id 5b1f17b1804b1-46fb34075efmr99777255e9.8.1760339169950;
        Mon, 13 Oct 2025 00:06:09 -0700 (PDT)
Message-ID: <0f910175-3b79-4446-9abf-e0e45c799a0a@suse.com>
Date: Mon, 13 Oct 2025 09:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] hvmloader: change constants to hex format in
 size checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <87399e2646ea89eeb0550bd08a408dbff5706540.1760307495.git.w1benny@gmail.com>
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
In-Reply-To: <87399e2646ea89eeb0550bd08a408dbff5706540.1760307495.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.10.2025 00:19, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Match the number format the specification gives.
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Suggested-By: <teddy.astie@vates.tech>

Please have tags ordered chronologically, and please also add a proper name.
(Also, nit: -by, not -By.)

> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -647,7 +647,7 @@ smbios_type_3_init(void *start)
>       * which corresponds with the end of the "Security Status" field.
>       */
>  
> -    BUILD_BUG_ON(endof_field(struct smbios_type_3, security_status) != 13);
> +    BUILD_BUG_ON(endof_field(struct smbios_type_3, security_status) != 0x0d);

As already indicated when these changes were being done within a bigger
patch, I don't see a real need for this. It's extra churn for almost no
gain. If someone else wants to ack this, I'm not going to stand in the way,
but I won't approve it.

Pretty certainly there's no justification at all for this to still go into
4.21.

Jan

