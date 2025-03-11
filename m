Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421FA5C4E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908284.1315418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1EP-0005UL-GS; Tue, 11 Mar 2025 15:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908284.1315418; Tue, 11 Mar 2025 15:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1EP-0005St-Cs; Tue, 11 Mar 2025 15:09:21 +0000
Received: by outflank-mailman (input) for mailman id 908284;
 Tue, 11 Mar 2025 15:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts1EN-0005Sn-QP
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:09:19 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8d9052-fe8a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 16:09:13 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22409077c06so15471485ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:09:13 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736b3f2412csm8273161b3a.175.2025.03.11.08.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:09:11 -0700 (PDT)
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
X-Inumbo-ID: ca8d9052-fe8a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741705752; x=1742310552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBzq3gZ4RElKkwYhaj8ZNxHgJX2I6SVrzxCcg9CG9Dw=;
        b=jf5rnMWQwUYKs+hZc4roX6YEfjYQQHRaIdPohBhCkFlsvUpnQHRAPGLCITBm79ABN3
         +Oq/qbEkFO/S+FAJnto2CEJNOA0+5lebqQzTR0xA+P1MCb06OPhQjf9MY8CvxG0SYIqX
         oMQgcCnt55el0+1aRglrEhejdDJGCD3vuUv800UJFJIIwXzM1H5PRNdSqTcbz8J0tkMH
         BKRK781UfvwTWPcedMhyGy5CrhRr/Qes5w6jbPctN0He3Dl/n1YYkgmhb3FHUWaCYR54
         lg7FPaOyqJWHN03NrWSFAOrTsaNNseeCvkBsvrGlVEw2Hd1PAO7aNjfki13zmcHNzu1P
         phQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705752; x=1742310552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBzq3gZ4RElKkwYhaj8ZNxHgJX2I6SVrzxCcg9CG9Dw=;
        b=sVklhcCS4dDBpXR71etB8GvEPdLPuJ+yZc/DdRs6bdCRI01IH1SNiUZ0u1AMVrFHSq
         8+qPJ4PnHBhGrqBJz5qAn7Rf38wLRG4da+6nJ3dOjkyLI1chDXn+poXMh1hrbQNss/sx
         CSqw15+gV2SGDfZD/T1HVMDdZa8zuM4JDdn+Bi5TKflJs9fxGGqvgXVzu7S1QNeFCy5q
         tMRUlAkNhmO/HBIl9Y7CbFd/8dzFVlHdCBAdyPohwIC8j7JmE2BqOCsqmloXBYj0nCWJ
         3Zp+1/j0Xao5+XgtbYJYxkBAAqqSCwNYmzTs3upeScUTLt1id1c0mXqcgQCieB/fWQ+u
         vkwg==
X-Forwarded-Encrypted: i=1; AJvYcCWZiBpjwk1RhFs2I5LYMqqMXMbccTeH0959Xf7n3le3GobpCmVydEoJf+3SIXSlaOEWYfX22jgV1go=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYuyDHLX+xucyRqUX+KxJEh1JFqrtQmskKF/cOTAloMx9LshWk
	MKC57qPDaRSINw7b/+QGUU9XgYdnOuPkPXoM1ZduuS/OEAvwhrT5g/qJ4cKcLD4=
X-Gm-Gg: ASbGncsy9KMuS2IgZcNi2pCh0TyNOcYR9LsfcnTmQBua2unUC9EJLy7DsUUeLJQkuPJ
	rWnpuFLsmgm03SncEACWHlM+EfEOPZU6sA3udb502ui4F81GEpasKX+oDoxXRraTseewGwmfIQw
	eVVuG4kk5NffYYM5qfFDsGiqJNgUG0lriNMQ//9TCc+tMXaJGS3TG9ZpbcqeP8RTM9ROiAy+jaW
	Cm8mirfK2cE2CLFnPMph9xmmv/4qOw0Oq8gF78+EmKLJJvXXCat8gM6LE3GXnkU0H0npe3dYTQe
	TYk1zDUr0Gi3DgqFFJMMJaq7UCqG9i0m00puNTK/BOVkzOv6s5dVBz++BQ==
X-Google-Smtp-Source: AGHT+IHdtXZCBvbhA4fnw5TeglBYyYnfR3rHysBoeOpLSs+t9AWpL5KS2rwpMgVJc9S6ANeeel2twg==
X-Received: by 2002:a05:6a00:2e17:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-736aa9e745amr29105632b3a.3.1741705752226;
        Tue, 11 Mar 2025 08:09:12 -0700 (PDT)
Message-ID: <437c66f2-b2f5-42dd-a266-581997d90581@linaro.org>
Date: Tue, 11 Mar 2025 08:09:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] exec/memory_ldst: extract memory_ldst
 declarations from cpu-all.h
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-4-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250311040838.3937136-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/10/25 21:08, Pierrick Bouvier wrote:
> They are now accessible through exec/memory.h instead, and we make sure
> all variants are available for common or target dependent code.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h         | 12 ------------
>   include/exec/memory_ldst.h.inc |  4 ----
>   2 files changed, 16 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index e56c064d46f..0e8205818a4 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -44,18 +44,6 @@
>   
>   #include "exec/hwaddr.h"
>   
> -#define SUFFIX
> -#define ARG1         as
> -#define ARG1_DECL    AddressSpace *as
> -#define TARGET_ENDIANNESS
> -#include "exec/memory_ldst.h.inc"
> -
> -#define SUFFIX       _cached_slow
> -#define ARG1         cache
> -#define ARG1_DECL    MemoryRegionCache *cache
> -#define TARGET_ENDIANNESS
> -#include "exec/memory_ldst.h.inc"
> -
>   static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
>   {
>       address_space_stl_notdirty(as, addr, val,
> diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
> index 92ad74e9560..7270235c600 100644
> --- a/include/exec/memory_ldst.h.inc
> +++ b/include/exec/memory_ldst.h.inc
> @@ -19,7 +19,6 @@
>    * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>    */
>   
> -#ifdef TARGET_ENDIANNESS
>   uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
>       hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
>   uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
> @@ -34,7 +33,6 @@ void glue(address_space_stl, SUFFIX)(ARG1_DECL,
>       hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
>   void glue(address_space_stq, SUFFIX)(ARG1_DECL,
>       hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
> -#else
>   uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
>       hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
>   uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
> @@ -63,9 +61,7 @@ void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
>       hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
>   void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
>       hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
> -#endif
>   
>   #undef ARG1_DECL
>   #undef ARG1
>   #undef SUFFIX
> -#undef TARGET_ENDIANNESS

Just to track last Richard answer,
Posted on v1:

On 3/10/25 17:04, Pierrick Bouvier wrote:
 >  From what I understand, non endian versions are simply passing 
DEVICE_NATIVE_ENDIAN as a
 > parameter for address_space_ldl_internal, which will thus match the 
target endianness.
 >
 > So what is the risk for common code to call this?

You're right.  I failed to look at the current implementation
to see that it would already work.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


