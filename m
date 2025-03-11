Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F197A5B170
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 01:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906939.1314272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trnAu-00027D-CH; Tue, 11 Mar 2025 00:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906939.1314272; Tue, 11 Mar 2025 00:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trnAu-000248-7j; Tue, 11 Mar 2025 00:08:48 +0000
Received: by outflank-mailman (input) for mailman id 906939;
 Tue, 11 Mar 2025 00:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trnAs-000240-8U
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 00:08:46 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc8eb2e7-fe0c-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 01:08:43 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ff64550991so7394581a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 17:08:41 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30103449c84sm109325a91.1.2025.03.10.17.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 17:08:39 -0700 (PDT)
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
X-Inumbo-ID: fc8eb2e7-fe0c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741651719; x=1742256519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTvxJUlPBJjWMPlx3bz6qPMSvpnDhRXJlpzPDdfISJA=;
        b=iEKe+qZwqrKfGbIUINupT8hvSANINpUwra+fNhahpgv+sYdz3ksovMhdBkWhzgKCFG
         zpCisBhzCCeMnvMhYBFJH7rlmAlcEPg8UzwXCvaKsdSqIJvnyBS9xHsmDfbuWq91Ri7B
         dq8DovaV12jWFH7OB9nfIIJqkPpqPgufYpDrGKIxNK3tq1/uuR5mMnEWdTYryasWHVyT
         LIJEYq0kKdge0feXShY3nz2F1lZ+WtQx4E0spYLhyjxoWSy5WPQVKuW3pvja7C2k4cAG
         maFTa/tQyPpcdLcE8iBNAGxCDVNsQ/H4wJMv34SXpoUrsWNYBDNfDj5UNLTcgGdcrgpU
         MLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741651719; x=1742256519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTvxJUlPBJjWMPlx3bz6qPMSvpnDhRXJlpzPDdfISJA=;
        b=qEAjDXD19kpCpRTDNs60Ih5yVdY2fWnM73tZ98+MSRh2TxN4zcr5XELLqd/d5X2sQZ
         yIVRpBkrCppuNDDSegz77rnAJ4Z1fAltgJb0CIEpi1ikhvH592tJU7LnPp37Q16pDEQ5
         SYIIJrh0Duhb7nVcUCzolFpJJyKyko4rcc8JEw+KOZ/cXpwhRZxq3Ic3fA++FYEnWIIG
         bgdRTqZO0Qc2IH7QrDLxiDI9X3pihZzJDiMGGluTiJyfEQWv4J2ofkgdPR5YH29RUjN9
         cM9SduDYNQxpPVGNFzqj8WR/4cKym/vzjFT0fdFsoBBhncss194yiOkZ/bbVupMhdcMV
         HVZg==
X-Forwarded-Encrypted: i=1; AJvYcCWvngNZplG6dRSnkX2voMy/5bGzJsdR3dZsZ/mg5WfZlgUMqpsdk/o12kyXrJ2MJftWDQbiyPcPP2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYnXhI/SJOGE4r2QFcpMaJwfisOD3uGsbAmM7bWognua/kTMXN
	HzPyIPfPZCPSECiF0huXwJOgx0BvgqwYRo9ZgtSXT4cUhC4lmId9rRrUyCh0v5E=
X-Gm-Gg: ASbGncsAeuIA3U6Ood5QIiRo6YPDkTp+CgkNyeSBI4pK9H2sNFomYdLxExon5m3LoqP
	+/q4lTOxIWlV5T0eOKXpOoxFmKJBigi9VvxfUlpyGuh64r6mG41aKcZ5Q4/ieE5g9LCqJviVzyI
	QHljGH9hUcYoevkXhArkvnMEzh463huypyEFqT1FLeH8a4k5Z8Zt+Tr0x7Wc3tTeQ9bVgVVlhw1
	hLDKPLA1GdLl57Gd3xPafg1+5ZuybLXkH+vgXOkRsn1zCNgDvHrqjlqnK+dwWn1hcIENmV1C6hV
	vaPS/KgYM4Q1k5Gi4+8CN1WeV4Fe0Y0MlbwwI105m+yf5FJhzI5bQPbSqw==
X-Google-Smtp-Source: AGHT+IGi4aJraVBfVl/EoRE61kEiyTdmOlXjmvYO10+d4f3aT2ylBHqrXw1ypyhAFiauPBgYo5Y/4w==
X-Received: by 2002:a17:90b:3c49:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-2ff7cd62f6dmr28557548a91.0.1741651719455;
        Mon, 10 Mar 2025 17:08:39 -0700 (PDT)
Message-ID: <106877af-deff-4919-adad-698b4c09b85e@linaro.org>
Date: Mon, 10 Mar 2025 17:08:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] exec/memory_ldst_phys: extract memory_ldst_phys
 declarations from cpu-all.h
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, manos.pitsidianakis@linaro.org,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
 <20250310045842.2650784-3-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250310045842.2650784-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/25 21:58, Pierrick Bouvier wrote:
> They are now accessible through exec/memory.h instead, and we make sure
> all variants are available for common or target dependent code.
> 
> To allow this, we need to implement address_space_st{*}_cached, simply
> forwarding the calls to _cached_slow variants.
> 

It's not needed, following inclusion will do it.

#define ENDIANNESS
+#include "exec/memory_ldst_cached.h.inc"

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h              | 15 ------------
>   include/exec/memory.h               | 36 +++++++++++++++++++++++++++++
>   include/exec/memory_ldst_phys.h.inc |  5 +---
>   3 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 17ea82518a0..1c2e18f492b 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -75,21 +75,6 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
>                                  MEMTXATTRS_UNSPECIFIED, NULL);
>   }
>   
> -#define SUFFIX
> -#define ARG1         as
> -#define ARG1_DECL    AddressSpace *as
> -#define TARGET_ENDIANNESS
> -#include "exec/memory_ldst_phys.h.inc"
> -
> -/* Inline fast path for direct RAM access.  */
> -#define ENDIANNESS
> -#include "exec/memory_ldst_cached.h.inc"
> -
> -#define SUFFIX       _cached
> -#define ARG1         cache
> -#define ARG1_DECL    MemoryRegionCache *cache
> -#define TARGET_ENDIANNESS
> -#include "exec/memory_ldst_phys.h.inc"
>   #endif
>   
>   /* page related stuff */
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 78c4e0aec8d..7c20f36a312 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2798,6 +2798,42 @@ static inline void address_space_stb_cached(MemoryRegionCache *cache,
>       }
>   }
>   
> +static inline uint16_t address_space_lduw_cached(MemoryRegionCache *cache,
> +    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
> +{
> +    return address_space_lduw_cached_slow(cache, addr, attrs, result);
> +}
> +
> +static inline void address_space_stw_cached(MemoryRegionCache *cache,
> +    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
> +{
> +    address_space_stw_cached_slow(cache, addr, val, attrs, result);
> +}
> +
> +static inline uint32_t address_space_ldl_cached(MemoryRegionCache *cache,
> +    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
> +{
> +    return address_space_ldl_cached_slow(cache, addr, attrs, result);
> +}
> +
> +static inline void address_space_stl_cached(MemoryRegionCache *cache,
> +    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
> +{
> +    address_space_stl_cached_slow(cache, addr, val, attrs, result);
> +}
> +
> +static inline uint64_t address_space_ldq_cached(MemoryRegionCache *cache,
> +    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
> +{
> +    return address_space_ldq_cached_slow(cache, addr, attrs, result);
> +}
> +
> +static inline void address_space_stq_cached(MemoryRegionCache *cache,
> +    hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
> +{
> +    address_space_stq_cached_slow(cache, addr, val, attrs, result);
> +}
> +
>   #define ENDIANNESS   _le
>   #include "exec/memory_ldst_cached.h.inc"
>   
> diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
> index ecd678610d1..db67de75251 100644
> --- a/include/exec/memory_ldst_phys.h.inc
> +++ b/include/exec/memory_ldst_phys.h.inc
> @@ -19,7 +19,6 @@
>    * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>    */
>   
> -#ifdef TARGET_ENDIANNESS
>   static inline uint16_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
>   {
>       return glue(address_space_lduw, SUFFIX)(ARG1, addr,
> @@ -55,7 +54,7 @@ static inline void glue(stq_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
>       glue(address_space_stq, SUFFIX)(ARG1, addr, val,
>                                       MEMTXATTRS_UNSPECIFIED, NULL);
>   }
> -#else
> +
>   static inline uint8_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
>   {
>       return glue(address_space_ldub, SUFFIX)(ARG1, addr,
> @@ -139,9 +138,7 @@ static inline void glue(stq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t va
>       glue(address_space_stq_be, SUFFIX)(ARG1, addr, val,
>                                          MEMTXATTRS_UNSPECIFIED, NULL);
>   }
> -#endif
>   
>   #undef ARG1_DECL
>   #undef ARG1
>   #undef SUFFIX
> -#undef TARGET_ENDIANNESS


