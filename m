Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC639831A2F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 14:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668752.1041156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQSC2-00028l-Tt; Thu, 18 Jan 2024 13:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668752.1041156; Thu, 18 Jan 2024 13:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQSC2-00026i-QN; Thu, 18 Jan 2024 13:12:26 +0000
Received: by outflank-mailman (input) for mailman id 668752;
 Thu, 18 Jan 2024 13:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQSC1-00026c-8b
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 13:12:25 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38002fcd-b603-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 14:12:23 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-337d32cd9c1so423703f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 05:12:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b00337bfaa944bsm4024568wrq.54.2024.01.18.05.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 05:12:22 -0800 (PST)
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
X-Inumbo-ID: 38002fcd-b603-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705583543; x=1706188343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjHSWSmk0B0uNRGjYK9RCGnwBndVB5QFk7WtD3lqen0=;
        b=KP8cbfSi29KH5NwdIWatNgQ+Tbxue6XIoj+d/OmRc6k/aet7m3xa/rzFIyhZjYyFtf
         Nbwr6/gMWhVrtdaQuWEtpCCkOsVV13MW9gsjCMJXwG5udZXzOJSObsWmiPvBdUwsOD2f
         SiNRt7vFaV+g6SGPI0lBdcqWlJklkcBi8O3Pgi6rWUOD7+qlGd5m02GzhddlU8sAadWw
         C2Zp7c0TwHDGvq7F2x72Q+0Plr69NbaWrUR6pWH29yl4C7Q90c7Fhlb/vHDC3GZl/zHK
         QOEho+NrD+oHH+wW/hYk78HQmSD3NVyFsy+j+JJwZIaLq1byKyIWIikq9/QLJ6lAcn3C
         Ozmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705583543; x=1706188343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjHSWSmk0B0uNRGjYK9RCGnwBndVB5QFk7WtD3lqen0=;
        b=vgtffJ2vRPpF5H6pTySsabRyXivFHAOWeI2T2rsfcQmqVYjDlbDy1XO2s3YB5oqyJH
         3rP27itw/NXZBd1BLMjISRci2748hFGxKy1F71GHScRIuMcudzW9SvjSDUXC9WUYxijg
         lN8stHskABwOwHHrXanc5utK55VbUsqX/0jZxpDpICAGOB+T60Iv1+uL2q6oQ9LxO3f+
         hTm6jTSrwR8/YlMm9gS1a6OmgreDT3ufhIt3rcB89QkXYwEa1aIP3hO3gYFtMPSrncJS
         xLnYPNxOvsn44JKdB/aZBeubjdTtJRC5apoWtlr5ZD2J61RG4dQJjD9w119/OW2LCXrH
         Edxg==
X-Gm-Message-State: AOJu0YwpLYfSK4tORZGHHPtit1mvfRPB9xmfDxVQ5p6NISCBB5Cp+6+Y
	+4jLooFJoeNNMjL70qtJHtDjrLiUCupdtAjdVPA/wOorgKBG5mxmlTbknB2nhA==
X-Google-Smtp-Source: AGHT+IGn+jGkfS4AK5R/YKe3bcAcPj9tinbQFxwC4Tml0Fo59uPxzmaY5O0KNg0gW6xTOwKHxiBGfg==
X-Received: by 2002:a5d:5147:0:b0:337:c55f:66d5 with SMTP id u7-20020a5d5147000000b00337c55f66d5mr442679wrt.87.1705583543202;
        Thu, 18 Jan 2024 05:12:23 -0800 (PST)
Message-ID: <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
Date: Thu, 18 Jan 2024 14:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
References: <20240118120641.24824-1-michal.orzel@amd.com>
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
In-Reply-To: <20240118120641.24824-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.01.2024 13:06, Michal Orzel wrote:
> At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
> under the hood) results in a crash. This is due to an attempt to
> access code in the .init.* sections (libfdt for Arm and libelf for x86)
> that are stripped after boot. Normally, the build system compiles any
> *.init.o file without COV_FLAGS. However, these two libraries are
> handled differently as sections will be renamed to init after linking.
> 
> This worked until e321576f4047 ("xen/build: start using if_changed")
> that added lib{fdt,elf}-temp.o to extra-y. Any file listed there without
> *.init.o suffix will be part of non-init-objects for which COV_FLAGS
> will be appended.

While this is true, aiui COV_FLAGS would be empty for anything listed
in nocov-y and all of the prerequisites of those objects (iirc target-
specific variable settings propagate to prerequisites). Therefore ...

> In such case, the solution is to add a file to nocov-y.

... libelf.o / libfdt.o already being listed there ought to suffice.
Alternatively listing only libelf-temp.o / libfdt-temp.o ought to
suffice as well.

Since you apparently observed things not working, I must be missing
something.

Jan

