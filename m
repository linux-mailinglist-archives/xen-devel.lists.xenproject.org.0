Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCCA968AD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 14:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962569.1353752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7CVL-0008PT-3m; Tue, 22 Apr 2025 12:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962569.1353752; Tue, 22 Apr 2025 12:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7CVL-0008Mb-0a; Tue, 22 Apr 2025 12:13:35 +0000
Received: by outflank-mailman (input) for mailman id 962569;
 Tue, 22 Apr 2025 12:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7CVJ-0008MV-EV
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 12:13:33 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33be6f98-1f73-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 14:13:30 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3104139f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 05:13:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4933e7sm15223530f8f.65.2025.04.22.05.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 05:13:29 -0700 (PDT)
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
X-Inumbo-ID: 33be6f98-1f73-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745324009; x=1745928809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GCsyidbxF9lIZ627mP92SNzPhGUsxD8EdDhkvNyFxsM=;
        b=CrT1dRgm5gydE34pz7SvKgEA37Ft4xxX0pCQAb4255nnTWlsHgl6F2m/q2v1iIGFeB
         8QflFO12yeULjwv16RzjsTakDXe/ZFhPpUMBpMsxBU/+kxlfqOTGgfLzSLiqw3Rawr5B
         i1hGz0/l2NcGZEupFxSG5VkV7r7bCY8q7tiDBB2M7w91cJRHi+3IsLUQ5ODoQu1M40bg
         vxUWFBDEzbWrOAxShqX/RDRbTZT82AgYonZLj1Zw0fVYf94rnMPdV1gd/VcWsGPEwrMK
         YICIamvKw/TboQT0c+dHgzO7JvIP/Qhm8DBKnlDwA3MQzjj5Iw6NJpeLPVIZfvyZWkLn
         zA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745324009; x=1745928809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCsyidbxF9lIZ627mP92SNzPhGUsxD8EdDhkvNyFxsM=;
        b=aFW7JvodVzMShGQbKOz8C4qLHCNsKQ1yUAR4eIa2/8B5FMVCmhvJTcXGIHEydBKYuH
         T97wmjbZyRp+rMUKOWFqE5Yk9o3yR8nN87JZtOZTwWNg7yISwPuh1vw66XYfK/Mpg6z/
         w5LYhv0z7jea48JT1I+zAiUApwMe1+d9qz/u/51kChCMHjMDU/os/vctiidGfCEPXkmB
         o20r62HTqKsFxdjdVfF/h87qroHX8hvewCzXxgzQ+62Cuyz6CgcrMDjX9u//rJ0ewVtB
         FvWxVuIlxX5wyaLKbPTVGq8ZjLDsvhedhc7zF5HdVjVIvRoEb0j463VJtsio8XKqgpiz
         r5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFl2yORXHIWo8qAB3w7TQG3nlio/uBp6RyyAhXlz+SrwXv91L9FkTGgNvr66y8ZUDmXIebDKvfV8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6QC1J+LZ9pJhkI2JcoSTn5U+ZT97GBL7sbJCpWNV04NohGEyo
	B8F2IhlKeiOf8Bd4AMQiN5GitfE4TOGVlyZg2f0UioL5XVkSK6Cj23vXabkKyA==
X-Gm-Gg: ASbGnctE3ZWJ1Fv1e+2RQUi+o0s46tf7i2V01uT7/4+JCYIUSHy0LK+IvmIQI7VClIt
	SOaYZijYLprH7lKjWZdFPQlbokpOoeCVtAgS1NN4yMZehK24pb5OHNKzXieogvdde0pR3RbnArl
	KnVt/sEnvx36Mj8x+py2wkh5DmGZ3N9SOBh5UzyAA7e3YBUZoWb0ZcR1kbPhmyXU3T6pvZkRUGr
	L7KzsrVtCZ4AzWDyce9teQC9HN1s8QGM9/8hKP1EyBdrLj6vVg2PIe/5DOP5wP4oefLZUC9bw+j
	4/P2GUkRuk25Y9LIISP0Pzkpfhd3agTXS4/pdJigj05/kk86iikJlmQWqes+78ghokTqYMzHfWH
	g4yaeCQ2v+epuOhK/ZFVexq1kWQ==
X-Google-Smtp-Source: AGHT+IFwQDW4zCSQVrMmSPu6KHE55qikwRmb6TeWvXYeju2/DSLJRFS8KxtaxOqCXYu6AbEFShbrfQ==
X-Received: by 2002:a05:6000:438a:b0:39e:cbd2:9ad2 with SMTP id ffacd0b85a97d-39efba2aa44mr11387508f8f.4.1745324009403;
        Tue, 22 Apr 2025 05:13:29 -0700 (PDT)
Message-ID: <82a02afa-c1b7-4656-8f34-bd4886c9fb9f@suse.com>
Date: Tue, 22 Apr 2025 14:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Include .debug_str_offsets in
 DWARF2_DEBUG_SECTIONS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422113247.1285339-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250422113247.1285339-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 13:32, Andrew Cooper wrote:
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -56,6 +56,7 @@
>    DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>    DECL_DEBUG(.debug_types, 1)                     \
>    DECL_DEBUG(.debug_str, 1)                       \
> +  DECL_DEBUG(.debug_str_offsets, 1)               \

The alignment wants to be at least 4. I don't think it needs to be 8, as
I don't expect us to require a 64-bit Dwarf container any time soon. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

