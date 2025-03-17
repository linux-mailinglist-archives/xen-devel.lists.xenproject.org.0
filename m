Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916CDA657E7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917452.1322369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDFp-0008St-5t; Mon, 17 Mar 2025 16:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917452.1322369; Mon, 17 Mar 2025 16:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDFp-0008R8-2o; Mon, 17 Mar 2025 16:23:53 +0000
Received: by outflank-mailman (input) for mailman id 917452;
 Mon, 17 Mar 2025 16:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rdq/=WE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tuDFn-0007xs-Oq
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:23:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34231ef0-034c-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 17:23:47 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so2764696f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:23:47 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b2bsm15083896f8f.26.2025.03.17.09.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:23:46 -0700 (PDT)
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
X-Inumbo-ID: 34231ef0-034c-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742228627; x=1742833427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avfzUeOggfHVdiAQhDfUOVX9Fi+u2OCZ2GM9j7NAP70=;
        b=Z51rLlxsdX7Uc72/vhYBGjezwqLxey0KZsKlADnZHm+wAStZ4Cg6UwaJJ0Q9Qr8QZb
         4CFMGwt5bQF3EpCKSPk9PM9VJaDwCWZM34kMAe72X+lS27KnZCzsxpYaULHIbjCaSja8
         AP6RKr8z8szf7qhZ/Y1B8DE/0Xo0Xblw1yH5QtBmJFQpZjLTt3jHXdFFYdkp3JSaDLmH
         tI6QPRTPsq6qlCQgnzNoixvwHy+dyxXY0hVgPnrpBOH7CFmy3ZlSaGa5K3fj0UwlStRC
         teG8Weun3R0Dli1iSot6+REWw3NGHoFPKNmDR+ytZv7QqV0ipHX+t3/dR7afDb4t8mwd
         gM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228627; x=1742833427;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=avfzUeOggfHVdiAQhDfUOVX9Fi+u2OCZ2GM9j7NAP70=;
        b=eswOyLQCF0XGKL6hlpniVNggsqKwYHPljzQN8MzGE59b/52AWOM/I6H2/QXhVP+zGh
         MwYhJ8lj1A4Yqfg1FrlBNMVyVA5Jc3cywyhcIbIZwlNsO1Rzs40O0QsHs62Gyn+9g4WO
         kCcJWdRkOX4mbc21WGUzKHtZ4hC61yzcLdXCqMFO3lTZ5F7RCdxaDStUGbWCsUZcp0r4
         xciU8uMZaPpsu7b7gdYbO2qB2SRTWZICFma3LUl2i8KIT8ExE70Kyxsb22vBOrKW9f1z
         B+c4IccG+JbvGJS8eECOIjXJTGCJPgoGUz6c4abc4jyYNQBAWUYABWqK6F7VDYh1Vjff
         zp2w==
X-Forwarded-Encrypted: i=1; AJvYcCXs5z2vWWPBS291GMS06F4zP2gcdb/BAnR0fvUFGAKoowCA7Am9FzGZ2pa8VRfpvqoIEtAa4NeKPR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl5qUIlDYUEZniYptYlw1hXzFvMxtOuwBGuiSAUin6hYZ6qD2x
	LPK2ZCZTbLqSMMl9vyFo2XXXcYX3zzYxRqt5DF2/+UjZ1Sf+slpwNoU1s2hJhSA=
X-Gm-Gg: ASbGncvJyyx/R+udVe0ZRy/EVQxDRtCokj1j378JUaTHbR+ufIME+HxwWB5e0LpaULx
	F3kiy0AVzTdjc0BCXO8I8qMTEgKhBKbtTaBKupridcsvpYrqAy5Tvy7YZ410sfv9HkW8vmWvPWN
	fC5QJ2GBimsSzljK0cHOiJCdTwXK+IGMS25Xk8N1qSQvUuZk35mL40UR2wCaDS4Lh4rncb3X00l
	DB/er4ezAHfoEkPXmVs8a9bWZCmA+tN7e24BifTskSwRfQ+PALY2P4cDDwVA0RxvSQrCYU1FHPR
	GuPxF6BJaubwy8sMCrNqZGX8hj6EtncDiGDQnPA1zpFISIlz4QhH4HAxVrcqsZv46pTm1VCRPm9
	BP6h2jAB4zw==
X-Google-Smtp-Source: AGHT+IEamG3WdlxD2LrQxwdmg89i4SPc4GJaByF7u76Lrx89qJx15nBJz8iHq3PU1coEHuSB+Sy0JA==
X-Received: by 2002:a05:6000:1ac6:b0:391:48f7:bd8a with SMTP id ffacd0b85a97d-3996b467819mr185608f8f.30.1742228627083;
        Mon, 17 Mar 2025 09:23:47 -0700 (PDT)
Message-ID: <d93f6514-6d42-467d-826b-c95c6efd66b1@linaro.org>
Date: Mon, 17 Mar 2025 17:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
 <ad7cdcaf-46d6-460f-8593-a9b74c600784@linaro.org>
 <edc3bc03-b34f-4bed-be0d-b0fb776a115b@linaro.org>
 <9c55662e-0c45-4bb6-83bf-54b131e30f48@linaro.org>
Content-Language: en-US
In-Reply-To: <9c55662e-0c45-4bb6-83bf-54b131e30f48@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/3/25 17:22, Philippe Mathieu-Daudé wrote:
> On 17/3/25 17:07, Pierrick Bouvier wrote:
>> On 3/17/25 08:50, Philippe Mathieu-Daudé wrote:
>>> On 14/3/25 18:31, Pierrick Bouvier wrote:
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>> ---
>>>>    include/exec/ram_addr.h | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
>>>> index f5d574261a3..92e8708af76 100644
>>>> --- a/include/exec/ram_addr.h
>>>> +++ b/include/exec/ram_addr.h
>>>> @@ -339,7 +339,9 @@ static inline void 
>>>> cpu_physical_memory_set_dirty_range(ram_addr_t start,
>>>>            }
>>>>        }
>>>> -    xen_hvm_modified_memory(start, length);
>>>> +    if (xen_enabled()) {
>>>> +        xen_hvm_modified_memory(start, length);
>>>
>>> Please remove the stub altogether.
>>>
>>
>> We can eventually ifdef this code under CONFIG_XEN, but it may still 
>> be available or not. The matching stub for xen_hvm_modified_memory() 
>> will assert in case it is reached.
>>
>> Which change would you expect precisely?
> 
> -- >8 --
> diff --git a/include/system/xen-mapcache.h b/include/system/xen-mapcache.h
> index b68f196ddd5..bb454a7c96c 100644
> --- a/include/system/xen-mapcache.h
> +++ b/include/system/xen-mapcache.h
> @@ -14,8 +14,6 @@
> 
>   typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
>                                            ram_addr_t size);
> -#ifdef CONFIG_XEN_IS_POSSIBLE
> -
>   void xen_map_cache_init(phys_offset_to_gaddr_t f,
>                           void *opaque);
>   uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
> @@ -28,44 +26,5 @@ void xen_invalidate_map_cache(void);
>   uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
>                                    hwaddr new_phys_addr,
>                                    hwaddr size);
> -#else
> -
> -static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
> -                                      void *opaque)
> -{
> -}
> -
> -static inline uint8_t *xen_map_cache(MemoryRegion *mr,
> -                                     hwaddr phys_addr,
> -                                     hwaddr size,
> -                                     ram_addr_t ram_addr_offset,
> -                                     uint8_t lock,
> -                                     bool dma,
> -                                     bool is_write)
> -{
> -    abort();
> -}
> -
> -static inline ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> -{
> -    abort();
> -}
> -
> -static inline void xen_invalidate_map_cache_entry(uint8_t *buffer)
> -{
> -}
> -
> -static inline void xen_invalidate_map_cache(void)
> -{
> -}
> -
> -static inline uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
> -                                               hwaddr new_phys_addr,
> -                                               hwaddr size)
> -{
> -    abort();
> -}
> -
> -#endif
> 
>   #endif /* XEN_MAPCACHE_H */

(sorry, the include/system/xen-mapcache.h change is for the next patch)

> diff --git a/include/system/xen.h b/include/system/xen.h
> index 990c19a8ef0..04fe30cca50 100644
> --- a/include/system/xen.h
> +++ b/include/system/xen.h
> @@ -30,25 +30,16 @@ extern bool xen_allowed;
> 
>   #define xen_enabled()           (xen_allowed)
> 
> -void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> -void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> -                   struct MemoryRegion *mr, Error **errp);
> -
>   #else /* !CONFIG_XEN_IS_POSSIBLE */
> 
>   #define xen_enabled() 0
> -static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t 
> length)
> -{
> -    /* nothing */
> -}
> -static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> -                                 MemoryRegion *mr, Error **errp)
> -{
> -    g_assert_not_reached();
> -}
> 
>   #endif /* CONFIG_XEN_IS_POSSIBLE */
> 
> +void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> +void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> +                   MemoryRegion *mr, Error **errp);
> +
>   bool xen_mr_is_memory(MemoryRegion *mr);
>   bool xen_mr_is_grants(MemoryRegion *mr);
>   #endif
> ---


