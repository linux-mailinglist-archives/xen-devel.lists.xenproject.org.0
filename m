Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81676AD5398
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011611.1390051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJS4-0003y0-91; Wed, 11 Jun 2025 11:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011611.1390051; Wed, 11 Jun 2025 11:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJS4-0003v7-5g; Wed, 11 Jun 2025 11:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1011611;
 Wed, 11 Jun 2025 11:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPJS2-0003v0-In
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:17:02 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98a7b0e7-46b5-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:17:01 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so4932062f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:17:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af38353sm9283701b3a.10.2025.06.11.04.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 04:17:00 -0700 (PDT)
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
X-Inumbo-ID: 98a7b0e7-46b5-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749640621; x=1750245421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLDSEy6Dp0uSWzx+8NrSl5JOBzfk7xturrz9sIv/fd8=;
        b=VXdyAKeMV770RKqc19L9X771QtKmJdIEjoWVQgY77NfyDuCjmO4NVoDGrB3lEfYUM2
         yjs5QtbqV4yn1VM7nphJGaDDMmCi4f6PSx2Fy1WE8BFEOapIka7C6jYJOT3LKEbbdkKj
         iBLvWWKc2bEVM6bFQfaEWyoWeg50ls8MA/INUjBmwtVNIGcjpr16eLAUHrxDEcLv1Rp3
         Ep2PiGeqEkXvgFzXlLlH+wK4nEYWN2H2Dzdd1XpfeBGV79cEl8E5V2T83JTYyzImKPtA
         D4t4vdkaUuqwrx7BI0oukWKzIf2ESxrgpZbAdkGzKaMfACNPxVxwITJPevt5WplMAhdX
         fyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640621; x=1750245421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLDSEy6Dp0uSWzx+8NrSl5JOBzfk7xturrz9sIv/fd8=;
        b=exPQx8MSEVeadaOVSA3mD1v2ZHJxplfhIz/cez4pCxTIfpCYG1vZp+oEY83v8lzmT6
         BoeiQTM+RAk/S1emt4IKTBnDYPIY4Er6Vjirtu/7HKhDr54vWdPyAZROv5QngQqWGObQ
         zvJs1kv0CGxSm+Z0pzzpbLhQvQ+7r50ka1NfIIEMgu9YgMxncCKlxskTe+7Fdfc3q1MD
         Sxe+UYIbhXvTHYc45bjXCG9PkidtcIJbAVQCtwQgF7cE5Z+vcNyagJ+QUkI2S02HA+FM
         RRcnWD6RHMjTMRTJOjDwbA0GsgQSECRJEPdXRBf7iM6pDkVRTq00Lbi1U4wDfnKbGW0y
         PnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWytWlP2McaqyzLo0aMIUmETLqzwIJ4lXePXN+NBubES/wuT03eC2nwCMxqfR4D06xyLoDso6Spmcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1caBIXc9pDqhUj8BQmvM76UiGloiEHQB1Cpw0p/Mj0ock7chK
	y7czdlg0kNeRBMv71FDNkK+3AmvFLZbrFFdPMYvh8eLtmaxosvFsu6jTCV6jKuqxKA==
X-Gm-Gg: ASbGncsA3tYtOk2hqVpRYX6NqAzK3GKShoqsMlPKd6OYEYoid4ZxFucy7yQqsmeiujq
	yCkM8TUh9MjmJI84kCEsxm7I+b96fNcbmMQyfO0dh0OQlXw/FtYmqB6HnnNG6poVS/j91mzH3cp
	LyW6sIL0SeauJrHgQLsxvVdfjDykt3AqV0OlLTcRcnd6jsmltmhkdnJoniBHj6CKG3GxPM5Jz5T
	v6c7Pl30TNFA7OcGGv+fyi5o2mjfgoADQI0TiIOJ2M8IR7ZebBhPR8z2ifkAmr+kocCQMPN/chw
	VZPhOmiBC3wOU5pUR7lqaujvmlRpz9DR0Oq5NE1MA/UVfUwglA40EN8+xshPS4EH+Nd6IvFte0H
	ms9NWmijzT3IenWiY4l6YfnohF6tNLJTnG6KH/O/7ZxSrbvw=
X-Google-Smtp-Source: AGHT+IExIZv8s/w3l0ticjhD8jV+Y4m0io5eSyOAkcaCXYfZmaJoFT+X5NQ5Dcdh1PzIwg1jJ23Rtg==
X-Received: by 2002:a05:6000:1446:b0:3a4:f918:9d4e with SMTP id ffacd0b85a97d-3a558ae2c77mr1947522f8f.41.1749640621026;
        Wed, 11 Jun 2025 04:17:01 -0700 (PDT)
Message-ID: <f7a34aac-a6e8-492e-aac8-ba1f007bbbe5@suse.com>
Date: Wed, 11 Jun 2025 13:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] vVMX: adjust reg_read() for 32-bit guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
 <9384234e-3a07-4ae1-b632-fe007beb4c4f@suse.com>
 <ea269ff2-73bf-4c40-b2c2-aa147c2534ff@citrix.com>
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
In-Reply-To: <ea269ff2-73bf-4c40-b2c2-aa147c2534ff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 13:07, Andrew Cooper wrote:
> On 11/06/2025 11:42 am, Jan Beulich wrote:
>> Using the full 64-bit register values is wrong in this case; especially
>> soon after a mode switch from long mode to 32-bit one upper halves of
>> registers may continue to be non-zero.
>>
>> Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Note that the affected VMX insns are invalid to use from compatibility
>> mode, and hence the more expensive vmx_guest_x86_mode() doesn't need
>> using here.
> 
> Fine, but you must have a comment to this effect in the code, and what
> prevents compatibility mode getting here?

Sure, I can add a comment there. As to compatibility mode - the insns will
#UD, and hence no (instruction based) VMEXIT will occur.

Jan

