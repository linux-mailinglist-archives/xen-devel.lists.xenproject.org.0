Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F11B831CAC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 16:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668818.1041285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUSk-0000ty-Hu; Thu, 18 Jan 2024 15:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668818.1041285; Thu, 18 Jan 2024 15:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUSk-0000sM-F6; Thu, 18 Jan 2024 15:37:50 +0000
Received: by outflank-mailman (input) for mailman id 668818;
 Thu, 18 Jan 2024 15:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQUSi-0000sG-Nv
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 15:37:48 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87cee331-b617-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 16:37:47 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so151462671fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 07:37:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b00337d97338b0sm5496wrm.76.2024.01.18.07.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 07:37:46 -0800 (PST)
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
X-Inumbo-ID: 87cee331-b617-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705592267; x=1706197067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTW5sXakIJMa0RuB6XoQWXBxkpXsm0IFjq3raAFZ4tM=;
        b=adI+tn19umaS71EQQelNxc04tkNx1LtBij0g5Ak6Mi2HwBkhDYqBxeOearn7IfSEFi
         CID5DGCa+1xgOcC28C8H3ihB8SbmZc+9i03+UrUBYzE+Qm7ULFABj7VmKfQSokHQ3kPJ
         aUYQIYS19YlostyuGWtiiJiJ4Ld9u5EH4LNR0AHiRK+uibHmT781BdedHs60Vrx64g94
         sCZSUAl0Exve4VFTb04YRbLmYuU9iluLEEs3jmzOivu4mLzHfGs/03pE5wbx7Tz1qIt4
         T3uOXcyjvRNLrxp51mxAL5e2IWmQJXHjYbAYDDrmuN75QEQD/k0c+8eZb2NCSRpgDDPX
         9BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592267; x=1706197067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTW5sXakIJMa0RuB6XoQWXBxkpXsm0IFjq3raAFZ4tM=;
        b=NI55pSYLCVxsd/Uh46spKRr6zURYIyBXgpA8vM6ToEc+h2Z4Bw7okiygeCFwCkWrqV
         QaDVEXVlMBEh+EVA50B1F6uurGdqYnJLyhqSDyEngb7SiHRQL31Xv7crY2anTWgMQrjG
         +ZvIoESJzF8I2HBBvaPIRE2C3RFg3JGsarrBnGaI/GWqSsjWIKJwbZ3utaMJ9fiQNtrO
         MQ3zQ+X8rFIVfgWT8QnseMAnOd1Ax5RgDNxim/FnQ1o9F1QKOX/kkizPUlZyK7+2FEQp
         r6xHliC672J5stS42TFZZroh0XROKJNI0sre5FpjnLLJj3hmfnASdLzXKg8Isol3fVVn
         8r2Q==
X-Gm-Message-State: AOJu0Yzt319mA3WzATz+DIrLe7DfB0SQ/czTo7X1FJJHxTu7YNDRphwQ
	CqzOwAd7UhjJvzV+1eztO4NvLz+SdGlFBG80E2246oucOCapFv5aVocbvGe3Vg==
X-Google-Smtp-Source: AGHT+IH/3Tvi8RZ/zhxcApDziiGnyrWryD9w+gTBgYPE6VzbNtM3NP5lRuqHonCO3CZvNHAWAyvzFg==
X-Received: by 2002:a2e:9d99:0:b0:2cc:a72c:9d with SMTP id c25-20020a2e9d99000000b002cca72c009dmr589491ljj.37.1705592267000;
        Thu, 18 Jan 2024 07:37:47 -0800 (PST)
Message-ID: <80e721ad-f8bb-4c10-bfd9-18c518aca1a9@suse.com>
Date: Thu, 18 Jan 2024 16:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e471e7b4-6558-43bb-8fbd-e067943779e4@amd.com>
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
In-Reply-To: <e471e7b4-6558-43bb-8fbd-e067943779e4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.01.2024 15:40, Michal Orzel wrote:
> On 18/01/2024 14:12, Jan Beulich wrote:
>> On 18.01.2024 13:06, Michal Orzel wrote:
>>> At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
>>> under the hood) results in a crash. This is due to an attempt to
>>> access code in the .init.* sections (libfdt for Arm and libelf for x86)
>>> that are stripped after boot. Normally, the build system compiles any
>>> *.init.o file without COV_FLAGS. However, these two libraries are
>>> handled differently as sections will be renamed to init after linking.
>>>
>>> This worked until e321576f4047 ("xen/build: start using if_changed")
>>> that added lib{fdt,elf}-temp.o to extra-y. Any file listed there without
>>> *.init.o suffix will be part of non-init-objects for which COV_FLAGS
>>> will be appended.
>>
>> While this is true, aiui COV_FLAGS would be empty for anything listed
>> in nocov-y and all of the prerequisites of those objects (iirc target-
>> specific variable settings propagate to prerequisites). Therefore ...
> I'm not sure about this propagation.
> 
>>
>>> In such case, the solution is to add a file to nocov-y.
>>
>> ... libelf.o / libfdt.o already being listed there ought to suffice.
>> Alternatively listing only libelf-temp.o / libfdt-temp.o ought to
>> suffice as well.
>>
>> Since you apparently observed things not working, I must be missing
>> something.
> As I wrote on Matrix, I'm not a build system expert so it might be that the issue
> is due to something else. I managed to find a commit after which building the libfdt/libelf
> with coverage enabled resulted in .gcno files being present. This commit added libfdt-temp.o
> (same as libfdt.o but without sections renaming) to extra-y, hence my fix.

You should probably have Cc-ed Anthony on the submission. Doing so now,
so at least he's aware (and may then also look at the patch).

Jan

