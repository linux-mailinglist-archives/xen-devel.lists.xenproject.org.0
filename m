Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C3A75ED3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931846.1334030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8eK-0001lg-Eb; Mon, 31 Mar 2025 06:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931846.1334030; Mon, 31 Mar 2025 06:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8eK-0001jf-7p; Mon, 31 Mar 2025 06:29:32 +0000
Received: by outflank-mailman (input) for mailman id 931846;
 Mon, 31 Mar 2025 06:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8eI-0001jV-GB
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:29:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fce390d-0df9-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 08:29:29 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so3661567f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:29:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a8e0asm10299314f8f.101.2025.03.30.23.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:29:28 -0700 (PDT)
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
X-Inumbo-ID: 7fce390d-0df9-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743402568; x=1744007368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oABVh54A14l7o1LdZp0sV58oiI+DfYyg+Z8CR3uZOyA=;
        b=AmsCnDrOa9vo0LaiN7uxDDv19w5zOHVMqQ93dcVy4yo5LIwRd96ZPaHLIjCbnQkJm9
         uBCGqGnnNMDOyr1IGOBVfvCVhMrbNp0pir+jfs+An/XbpEhyPj05qOglt07c5S+BMSZi
         rdOyIgnDToh8Eg67wTBOEP0JH/Swp9nF9SaWIKzEQMEuFdtCDdv6JINoa7Fe3xxSSd+B
         hqWWAxm8Gdk2zXDlBPc7/NfmQg27vdZlLh0xlNHl559P/jCN/osfvg4nyNmuPxTgM9Jq
         VfkCVbvg3OUwF6SHJneQNHFVfrAPt4r4zHSFq+SQoysg8TreO6I+Om3hCT2WtRyKiZu/
         Zwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743402568; x=1744007368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oABVh54A14l7o1LdZp0sV58oiI+DfYyg+Z8CR3uZOyA=;
        b=TiPYNgtap4okvSrdwmg4aMssO+7NkVdx+yuwTBNSXCNYeg0DIkViyp07E/lOaI+rHb
         Qd6yHSHGD509dYl23KFZtu/DS8FLmz8SQAwm4fMQ0o7kKcgJUfirg2R3810M/DJPRyri
         Etm2YvgdXX0CsdT3UkbOgQk2p+L8SWMSNhJxfLWLTAH/RZ+M+3ZMv6vWKk+Xtdqe0e4j
         tx6e5SdTgQluu84WdDT9sz4usvWXsPBc2b4mo3BiCSh63TetwDb/vdVylJ9UJyu8cc9t
         6UxyQDqMVt+WLmMIiOuQi4rVWZBj2rZ2qeBhtxZ36BLlDlyllrAYUuY7Lzpiv9iAO8Hw
         7D7A==
X-Gm-Message-State: AOJu0YwL3xRyOEQqP7V8iOrUSc0a5nyR6WUcPLWT7gh3qAjMacNXnvy8
	D0Ge/JnG4kGvdO8IhXxp9/EQ2MrihnfTE+GD/joIugirSJ6rwZz7EJyQSLIgVQ==
X-Gm-Gg: ASbGnct1COBYYifEAd6LsKDbaZ4vPLejUXVPxNIP+UvY+ji1nATk3/GmMp3DQcpdkIU
	n8xfvA0RwzuAR716STRIaRbU4vX8saoVQQ4PC27/wbUPO2Ob1KIdLVlcGFtz4oVDCl31iSbBDHV
	lE4oi2IJ5rV2N19Q46qrtfKNWdi8w2fv4zwQfuddA9oWJZKMoQ7r2wx7ty6XZrBkJAENJx+ImPC
	D5MHAaIGIqXtw5YiO2weXYIX8miN3ZgBwR2YhZhZa1oZS3a7rM2SNZEyJlCW33yAtyq73fOZmsP
	Nbgh47A+0gscR97C56RxHtLtXhG/TmEwrdcibhwLxTJZp/Nuu4k4f1/zNReQAaPLT/ZmLBGEz5W
	7k3FjR5AeVDHacoKbSsffDMeuWRyvCQ==
X-Google-Smtp-Source: AGHT+IE3QI9e9UfnPngEyL8Lih3wQtuImcrcOwfFqX/iKgKkrbTO5ybfZulHXKDi9moRCfrWV7CGtQ==
X-Received: by 2002:a05:6000:400c:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-39c120dee53mr5402086f8f.15.1743402568585;
        Sun, 30 Mar 2025 23:29:28 -0700 (PDT)
Message-ID: <6b3c3baa-331c-44fa-9085-9b0bf72c62a1@suse.com>
Date: Mon, 31 Mar 2025 08:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-2-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503281655590.563920@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503281655590.563920@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2025 00:56, Stefano Stabellini wrote:
> On Wed, 26 Mar 2025, Penny Zheng wrote:
>> We intend to remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
>> equivalent "if !...") in Kconfig file, since negative dependancy will badly
>> affect allyesconfig.
>> This commit is based on "x86: provide an inverted Kconfig control for
>> shim-exclusive mode"[1]
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Where's this coming from, if I may ask?

>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>>  xen/arch/x86/Kconfig      | 6 ++----
>>  xen/arch/x86/hvm/Kconfig  | 1 -
>>  xen/drivers/video/Kconfig | 4 ++--
>>  3 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 18efdb2e31..1e5df84b25 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -137,7 +137,6 @@ config XEN_IBT
>>  
>>  config SHADOW_PAGING
>>  	bool "Shadow Paging"
>> -	default !PV_SHIM_EXCLUSIVE
>>  	depends on PV || HVM
>>  	help
>>  
>> @@ -169,7 +168,6 @@ config BIGMEM
>>  config TBOOT
>>  	bool "Xen tboot support (UNSUPPORTED)"
>>  	depends on INTEL && UNSUPPORTED
>> -	default !PV_SHIM_EXCLUSIVE
>>  	select CRYPTO
>>  	help
>>  	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
>> @@ -279,10 +277,11 @@ config PV_SHIM_EXCLUSIVE
>>  	  Build Xen in a way which unconditionally assumes PV_SHIM mode.  This
>>  	  option is only intended for use when building a dedicated PV Shim
>>  	  firmware, and will not function correctly in other scenarios.
>> +	  Features, like tboot, shadow page, VGA, HVM, Hyper-V Guest, etc,
>> +	  are unavailable in shim-exclusive mode.
> 
> I don't know if we want to add these two lines or not. Either way:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I don't think we should add that. It's also wrong for shadow in the first
place (where it was a default only anyway, not a dependency).

Jan

