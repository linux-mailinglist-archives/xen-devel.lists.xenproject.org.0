Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203997BBE29
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 19:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613793.954562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qop4c-0000bO-Lx; Fri, 06 Oct 2023 17:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613793.954562; Fri, 06 Oct 2023 17:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qop4c-0000Zh-J6; Fri, 06 Oct 2023 17:57:14 +0000
Received: by outflank-mailman (input) for mailman id 613793;
 Fri, 06 Oct 2023 17:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qop4a-0000ZV-AT
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 17:57:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c561ddec-6471-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 19:57:10 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso2328077f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 10:57:10 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b004068de50c64sm4103236wmq.46.2023.10.06.10.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 10:57:09 -0700 (PDT)
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
X-Inumbo-ID: c561ddec-6471-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696615029; x=1697219829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cTLquPLV/NW4dTlK3IWqIvCdSwrVNdf8Cd7ENbWYK1Y=;
        b=IsocByg0zNW3vQh3OD2g0bNEqJOc4Af81zMycv9IFOcRnY8QgeKDYTm73PwYrPCnwk
         yGhlsQhhEqFBUc4kYXAqRJ8Yx06jleKPWrvN8TsOo77Z77fmnh3oH16O60WtIVuOmnaX
         qaloyWwz4bw1myalXhau+V6WVeQO7qCsDXiDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696615029; x=1697219829;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTLquPLV/NW4dTlK3IWqIvCdSwrVNdf8Cd7ENbWYK1Y=;
        b=H+CTlgxkDs00CzdFnjt2iPqiq8nG6KhOrQ/K0H22jhaNfmdJT/MbL9CNv7TMUORs0e
         SBjyEeqcTfDtGs5AZAo5yMv6a1TEeQ4vEf+346yTNAklpi3nGPnDCZOD/IfPmhxjUoOl
         /NAyYxjn+kPNYPmMaz4ClVh1qsNy0PMulnymp/673Uu4JnE4sh0QPJ/dHrogDFCZ7sN/
         7rtQ6iJScXe2qFI7H6tRSQeF/wcqjBme2U9bpYDEm45WrgGViZ1lrTwucD7lzxMhccpJ
         0oSTmIkGBZCQi+ygUFDh2FUcXfoEl+uizZqAF6W0bJ4ywvW9WCzYQinefeAD3tEK1FhE
         enDg==
X-Gm-Message-State: AOJu0Yx60vS68Bxd8aMXgZr45TJdl4/CVz4k9rBi2qRuUByhz0KzlDfK
	67kheJxCaCXczvcnr3kBp8TvHw==
X-Google-Smtp-Source: AGHT+IF4jM3Qr8xMgKwA/pNmRLuyuCvS3NdguTr4xQhPuZSZse08fyH97eicHEJYVGIjqFzlM+EvNA==
X-Received: by 2002:a05:6000:1102:b0:323:37af:c7c7 with SMTP id z2-20020a056000110200b0032337afc7c7mr7987262wrw.69.1696615029579;
        Fri, 06 Oct 2023 10:57:09 -0700 (PDT)
Message-ID: <91d900b5-1298-4bb3-bd3d-6a829819a030@citrix.com>
Date: Fri, 6 Oct 2023 18:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 5/9] x86/cpu-policy: address violations of MISRA C
 Rule 10.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 roger.pau@citrix.com, Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <463572d126a7700e5e90ef3a49104bd4b8c1c389.1696514677.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <463572d126a7700e5e90ef3a49104bd4b8c1c389.1696514677.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 9:26 am, Nicola Vetrini wrote:
> The COUNT_LEAVES macro is introduced to avoid using an essentially
> boolean value in a subtraction.
>
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/lib/x86/cpu-policy.h | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index bab3eecda6c1..700993cc67e8 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -95,17 +95,18 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>  #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
>                                        CPUID_GUEST_NR_EXTD_AMD)
>  
> +#define COUNT_LEAVES(X) ((X) - ((X) ? 1 : 0))
>  /*
>   * Maximum number of leaves a struct cpu_policy turns into when serialised for
>   * interaction with the toolstack.  (Sum of all leaves in each union, less the
>   * entries in basic which sub-unions hang off of.)
>   */
> -#define CPUID_MAX_SERIALISED_LEAVES                     \
> -    (CPUID_GUEST_NR_BASIC +                             \
> -     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
> -     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
> -     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
> -     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
> +#define CPUID_MAX_SERIALISED_LEAVES         \
> +    (CPUID_GUEST_NR_BASIC +                 \
> +     COUNT_LEAVES(CPUID_GUEST_NR_FEAT) +    \
> +     COUNT_LEAVES(CPUID_GUEST_NR_CACHE) +   \
> +     COUNT_LEAVES(CPUID_GUEST_NR_TOPO) +    \
> +     COUNT_LEAVES(CPUID_GUEST_NR_XSTATE) +  \
>       CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )

This may not have been a MISRA-approved calculation, but encapsulating
it like this breaks any ability to follow what's going on.

CPUID data in x86 is mostly a sparse 1-D array (BASIC, EXTD, HV blocks),
but a couple of elements in the BASIC array have arrays themselves.

The struct is laid out for O(1) access, so you can't just say
sizeof(struct) / sizeof(element).  The BASIC array has elements (0x4,
0x7, 0xb, 0xd) which hold no data because there's actually an array
elsewhere containing all the data.

So logically, it's:

(BASIC + (FEAT - 1) + (CACHE - 1) + (TOPO - 1) + (XSTATE - 1)) + EXTD + 2

And in practice I'd far rather express it with a plain -1 than a -
!!NR_, if the latter isn't an option.

Presumably MISRA would be happy with that?

If so, I can submit a patch.  There's also a typo in that the comment
that wants fixing.

~Andrew

