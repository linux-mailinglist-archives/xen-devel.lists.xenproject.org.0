Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB659151D8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746740.1153884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlR1-0005sl-FB; Mon, 24 Jun 2024 15:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746740.1153884; Mon, 24 Jun 2024 15:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlR1-0005q7-BN; Mon, 24 Jun 2024 15:16:47 +0000
Received: by outflank-mailman (input) for mailman id 746740;
 Mon, 24 Jun 2024 15:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLlR0-0005po-J4
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:16:46 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4902196-323c-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 17:16:45 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so48836861fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:16:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7199dcba2desm3415979a12.35.2024.06.24.08.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:16:43 -0700 (PDT)
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
X-Inumbo-ID: c4902196-323c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719242204; x=1719847004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UIXAHclaNihtEWr0OABZTng8qozHt/sxKa1lfpXkniA=;
        b=OpnGObmjufVhkyowE9yAZlmvAyytKffDwvQRCb3hAIjXSOeOTMqOq3mqdrewd/Pcxl
         f7aewdRMIdGLTcGkhA6WRDo2kreEcIiIo7y6Ucai1gGtZKlv2mAu2cjE+T16aNa+xhWX
         oHawVkUjJK7z/7Y01fmaY1QjucwqkH+SEESVmEp0BrKjvvNtXMqR2scEOKd6p4W4Lcx4
         H8KoE8/RMqoB+Bdob/YJ5ON9nrO0zfbUr+ja9b9zQqUc9mNFzi94Z3H/10U3kHYQc5P9
         skOYear7aAPn4Pg0oUW50IB6N9+/E19k8UFvyqRtt/oLj8GrRXjFpgo6dcDNjhYb3Y3d
         Y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242204; x=1719847004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIXAHclaNihtEWr0OABZTng8qozHt/sxKa1lfpXkniA=;
        b=XsgQQmX3+gRPrQQ+XhEyx1kH6cw6YL4X4JX/vOivdr/btwQJqUo5LApeEZAyRvmU4S
         8pNMfhvEyth+ThR5SVjHcSB0PxVRZUcLEYT3Vcrz+IoXvZYvqtBuAxn12xJ5hNxTUAe3
         ERWx5lBBKq/Fhq4S3oCCsFX01mPSYik+tOc6isdyC+iu3lrv+LfGo7Na2L6h7ZoG+APS
         Rm6rzLAEDXyhNuWd7oIujlHITJKstPCJqQ0RYkwJbKnJ6lopmeH5JsjI1CmMnGfcmwCv
         r4qja388rMQJJ6g5BmhPq8jX9YkV8jUuZ7YHWzvLnqvO7DW10o2lt9gCqub2jAJjthxQ
         R1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SC3x9JN8cBpb3YaoQd5M0vcP0HltdBwnRnuHSR5uEqpSfkhASQe2MjrxCZVcRQHz7Q50cxSKy8Ixp4TynqfGoNHsr1RjOoO4suCSBk8=
X-Gm-Message-State: AOJu0Ywf37RBlAzSzZDS36i06bymQ07MP00skaWpGRGelPoM6mnuJ3//
	R0nSj0L/r6Nc30qIyC0srBklXhsND7K/oI88KMQdYkY1bxzgQ93lP+CjDFTraQ==
X-Google-Smtp-Source: AGHT+IFngQ15CqFwR7T1stKi2RvUGUzCnA3Ev4nr1qSQoyLqhOIr8W6vjOjmXRjGjMJHhavJe4jlNQ==
X-Received: by 2002:a2e:87d9:0:b0:2ec:5467:dcb6 with SMTP id 38308e7fff4ca-2ec5b39c57bmr30529051fa.52.1719242204441;
        Mon, 24 Jun 2024 08:16:44 -0700 (PDT)
Message-ID: <1ea5bebd-23ee-4d2c-a7c8-bc6ba99851c5@suse.com>
Date: Mon, 24 Jun 2024 17:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 04/13] x86/vpmu: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <c45b27a08a1608de85e4bbae80763f8429d40ad5.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <c45b27a08a1608de85e4bbae80763f8429d40ad5.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -713,6 +713,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
>              break;
>          default:
>              rdmsrl(msr, *msr_content);
> +            break;
>          }
>      }
>      else if ( msr == MSR_IA32_MISC_ENABLE )

Up from here, in core2_vpmu_do_wrmsr() there's a pretty long default
block with no terminating break. Is there a reason that you don't put
one there?

Jan

