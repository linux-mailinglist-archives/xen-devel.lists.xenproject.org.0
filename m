Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF9A83BA0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 09:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944988.1343277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mf6-0003XO-R8; Thu, 10 Apr 2025 07:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944988.1343277; Thu, 10 Apr 2025 07:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mf6-0003W7-Nn; Thu, 10 Apr 2025 07:49:24 +0000
Received: by outflank-mailman (input) for mailman id 944988;
 Thu, 10 Apr 2025 07:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2mf5-0003Vz-Pl
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 07:49:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50feb9e4-15e0-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 09:49:22 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so4398815e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 00:49:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f113csm3961029f8f.69.2025.04.10.00.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 00:49:21 -0700 (PDT)
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
X-Inumbo-ID: 50feb9e4-15e0-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744271362; x=1744876162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cP6iuQSjwhCOTnOyYl2j2PYNQx8Wm6k1P6Q8iCBrW7M=;
        b=aMjS5IfoyFSuZVaggT3rZw3rgeEIOZabBDmd373I46zXRlyRpoXWOYNflaxD4kaMUr
         eVPNPE7d1HafdMyaENDTS3JntEF9s2Iqvo+SS9urIw8HOQeqsUBrEm0v7E4ZOK8up8CS
         p5Od8UPGVFBAsSE6audDgRctaDLCl5IpiwBJGaSLcM8MdQPYZBsx3EMcn/PpfMdISun7
         PW+Vl8mOOrYrj/5iC9ryqTF74iOiUua/CVqOLeaEnfw/oAeJz2j4Qo7W7mAPrR2ubyi2
         E66fbSHAVJA1Ph3b4FpYM1jfpA73sICRLqKsfBTYrKOm01pjwNND2gpmy8WwNf+g+CJT
         y4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271362; x=1744876162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP6iuQSjwhCOTnOyYl2j2PYNQx8Wm6k1P6Q8iCBrW7M=;
        b=kvnUHfnTaA4DW2KKmcdVJorvVjoxVmuwVXgNlD9uK4XywtRoiaGa82ZcOvzgbD7mUH
         CZL4HfvxJOIzW58eDIayANxw0Vtgpb8UXKfW+XnNgWPIbPejGU44yzOtQI+yUFQdQHio
         5We5FNRFGNt26lvNusLnBTGe83LtfojObHhehwpy9UYtTGFQcVQEcDQZzXUlw0mv3PZo
         G3fw1FENH03aFaYMuSqrX69gCSsl9EYIiJa75Yn5IAerUFrKsqgWe2vL78K/JaQRWjYz
         o2LBWlZbIy8GZAE20+yF8haH5g1FJzOeoIFa9l1vwmYofFg2zBY4Jx+mvmJiIYnHxk3V
         /w8g==
X-Gm-Message-State: AOJu0YyHByiEFvHruwthqg68eZRvqtpshmw+cla2Oc5Oy6QZHwue3bwi
	1ZEHGOAH7F/9bcBvmyaTwpQKgIhveSWKbrEMe4ptf8kahX0casuWZZ708aDRcQ==
X-Gm-Gg: ASbGncvdXYCPeIBrnRqgjLLzrEBZG/vJeuLNkYp6UBv3m1r8/k8vnpmWCZlop+ZGHvx
	191wf/VZW3D91gbqEUQK4FivTwt9GRRJcD1QrVsUGGJ9RVza5ozFJErQedw8RDhf6RRf0F2bb6b
	ERKnteYi9AVO6A3jmUng6BpSyN9JojBArSH+0bl8CS7k84+6QmtFBe93wrpS9Yyy88gFG8FNCdl
	ZzLqVUSgFo+GFVSW+z6Ezk87zkM1CsP8Pjg8QjzIqSsGP80FHSWE1j7j1TpMbY+piRct7s7hsIm
	wQFU1QCCOEnM6Oju0PmPYd8qN4npWYuBJwrjeB32TBDPN4Lk4r1CX5dwUt26S2o1iLhoIEjH7Ko
	CAAjBg90qEYEEgMBrrF2vVsBUDg==
X-Google-Smtp-Source: AGHT+IGlotOVq83Dg19ZAk+M9M1Szziqer3CydGNgz3sO9KPPEgR5hMdty65Jwg0yfQ1l9M7q/+48w==
X-Received: by 2002:a05:600c:4e51:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43f2d98b578mr20609145e9.30.1744271362004;
        Thu, 10 Apr 2025 00:49:22 -0700 (PDT)
Message-ID: <e71d07fa-d53c-4e60-bcba-8676fb3aa9f2@suse.com>
Date: Thu, 10 Apr 2025 09:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/16] x86/hyperlaunch: introduce the domain builder
To: Denis Mukhin <dmkhn@proton.me>, Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-7-agarciav@amd.com>
 <FxuO_b3q9bY4mPUG3KmuO_YTqqsPhI1sMXykQ5UkxaLzhMlAoAZtQKzl9puHPW29hxCx_Fm1y_YfmBquI1Cm0QA0Y3TKYTy4waHKKaODj9c=@proton.me>
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
In-Reply-To: <FxuO_b3q9bY4mPUG3KmuO_YTqqsPhI1sMXykQ5UkxaLzhMlAoAZtQKzl9puHPW29hxCx_Fm1y_YfmBquI1Cm0QA0Y3TKYTy4waHKKaODj9c=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 20:53, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com> wrote:
> 
>>
>>
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>
>>
>> Introduce the domain builder which is capable of consuming a device tree as the
>> first boot module. If it finds a device tree as the first boot module, it will
>> set its type to BOOTMOD_FDT. This change only detects the boot module and
>> continues to boot with slight change to the boot convention that the dom0
>> kernel is no longer first boot module but is the second.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>
>> ---
>> v3:
>> * Move obj-y += domain-builder/
>> * Remove blank line in Makefile
>> * const in has_hyperlaunch_fdt()
>> * CONFIG_LIBFDT rename
>> * Use boot_info forward declaration
>> * Rename domainbuilder.h to domain-builder.h
>> * Add fdt NULL check
>> ---
>> xen/arch/x86/Makefile | 1 +
>> xen/arch/x86/domain-builder/Kconfig | 2 +-
>> xen/arch/x86/domain-builder/Makefile | 2 +
>> xen/arch/x86/domain-builder/core.c | 57 +++++++++++++++++++++++
>> xen/arch/x86/domain-builder/fdt.c | 37 +++++++++++++++
>> xen/arch/x86/domain-builder/fdt.h | 21 +++++++++
> 
> I have a general question.
> 
> Wouldn't that make sense to use arch-independent placeholder for domain builder
> code right from the starting point?
> 
> For example something like xen/common/domain-builder ?
> 
> My understanding is that there's a lot of code in the domain builder which
> can be potentially shared/re-used with non-x86 architectures.

And indeed this point was already raised before.

Jan

