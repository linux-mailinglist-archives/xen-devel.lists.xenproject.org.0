Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D021A657E1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917425.1322348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDEQ-0006uE-Le; Mon, 17 Mar 2025 16:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917425.1322348; Mon, 17 Mar 2025 16:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDEQ-0006s7-Ix; Mon, 17 Mar 2025 16:22:26 +0000
Received: by outflank-mailman (input) for mailman id 917425;
 Mon, 17 Mar 2025 16:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rdq/=WE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tuDEP-0006qG-51
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:22:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00eaf9ac-034c-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:22:21 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so24243855e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:22:21 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdbc36dsm69896975e9.0.2025.03.17.09.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:22:20 -0700 (PDT)
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
X-Inumbo-ID: 00eaf9ac-034c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742228541; x=1742833341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBWphq/OPjakrsPO4SntQfTseOUfZZyLOvc4sgW9R8E=;
        b=oFuZYTR55xr151z2y7u/LXPwYGTOfpKCePq/NeDcEMrB03hsXYcrKOvcFyuHOL33Yo
         2yG433KaSnJ5G3X3s3znDcsYBFbBQg/C6H3Env13Kkd3HImLL819HD/b8d/TqyeiDjn/
         MK4dsxrqf4d5zD4vPEG23uNKvWpMe5SdIOC1JkSTGMNNPhMhYX4gDyTvNGoWDMgCwH8L
         NYSwSyRdBCjGo1gwWTU+thUmHC0ehYXJF94oAseU10GBg65DAZ368RkxGhrkWUVD3bK7
         MlnYuRhU+o1zXQdaDum36MU8Ek1A4sVgvYkIy5/rEd8yTgjzamnTtr3Whytr666yoOJZ
         lU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228541; x=1742833341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBWphq/OPjakrsPO4SntQfTseOUfZZyLOvc4sgW9R8E=;
        b=mfkmGFxAPyAxrYRylyfMpeMSUROD1ZgAYYxUpcVnqtdWdj0CNRoDcqkDzOy5Ifnhi4
         ZYCizJHFfcLu1IVztkJAz8xYw0X8LZZyYbNSH6f4UTcF3ZdT9ayFDIBn8nGW5ac3dEbW
         RtqY9ebWslT9xsGGZ1KrxQOgpPTjSNCbujFm5DLar56DhtcNzEQMqs2jQCUCCReIkeDE
         +bgLb9vVw5D6t08i+dlJJfAEEaJqphvokcKNOSTPV2Rq5jO5lpc+l/sRecTVgPfHZbE4
         tVitG80z9VzjJg/ue3OyqAGa+qw+DY7vjJrqFnKUo/J4hyiW4OE5m6XkvkGV3DbVG8W2
         UHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGggX7k24Rj2StzteqELuZ5UDTJLdDrOGItznIPVDrrE5ACGZFwpc6COFWM39/c2v3d0sRaFmhCdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVk3y/u1dCAh3zS4Ku/XEXIVmU75h7YjJRyE2qrwOWJyQWWPfd
	lUnO7IalMgnuurfoPlu5vKkz9oKroUfHAdbg3FHRJmI3fPRpKpZTMJmtT1+e4Uo=
X-Gm-Gg: ASbGncsszOsfg+LheUdJi5C0OeKJXw96exuOt/bpuZMgO3DoVjYoC4c/gzrez7RHlRl
	FZa5Sfotk26SfOBvvJ9dEMIjclpKXHx+wlGoOwWsFOlt/UghcWZyhoN6sNxMODDCU5T0uXZaTtB
	5mFxgvysR3dKUAY80mOJBc5CEgM7Nlve9GpLg0GXYBAV7ctXSEh/XhwPXOaGn4v42yzJPoqd9Tu
	7dvsN2731Y+UPNZgEHbZ9aX4BA4ixzroL8usVGwQbyp93aSGAhhZI5icQhmpqMILLZncWeaE0FH
	cMmc09qCZJHaab7lZMuDw7tz8FFyQzNYkmbwLyiqjRtKX6unP8qaP5LXOSwaRz9OPjSEz8Z9w3D
	83hqwzRebPA==
X-Google-Smtp-Source: AGHT+IFVNxcAnyCyAJ8pmBaH3OaDkbaFSIvHPQaBVVLvnxipFVeLkYJbNl97a+qtcZml3R72Eig+Jw==
X-Received: by 2002:a05:600c:46c8:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43d1ec6946cmr141436605e9.7.1742228541177;
        Mon, 17 Mar 2025 09:22:21 -0700 (PDT)
Message-ID: <9c55662e-0c45-4bb6-83bf-54b131e30f48@linaro.org>
Date: Mon, 17 Mar 2025 17:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <edc3bc03-b34f-4bed-be0d-b0fb776a115b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/3/25 17:07, Pierrick Bouvier wrote:
> On 3/17/25 08:50, Philippe Mathieu-Daudé wrote:
>> On 14/3/25 18:31, Pierrick Bouvier wrote:
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    include/exec/ram_addr.h | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
>>> index f5d574261a3..92e8708af76 100644
>>> --- a/include/exec/ram_addr.h
>>> +++ b/include/exec/ram_addr.h
>>> @@ -339,7 +339,9 @@ static inline void 
>>> cpu_physical_memory_set_dirty_range(ram_addr_t start,
>>>            }
>>>        }
>>> -    xen_hvm_modified_memory(start, length);
>>> +    if (xen_enabled()) {
>>> +        xen_hvm_modified_memory(start, length);
>>
>> Please remove the stub altogether.
>>
> 
> We can eventually ifdef this code under CONFIG_XEN, but it may still be 
> available or not. The matching stub for xen_hvm_modified_memory() will 
> assert in case it is reached.
> 
> Which change would you expect precisely?

-- >8 --
diff --git a/include/system/xen-mapcache.h b/include/system/xen-mapcache.h
index b68f196ddd5..bb454a7c96c 100644
--- a/include/system/xen-mapcache.h
+++ b/include/system/xen-mapcache.h
@@ -14,8 +14,6 @@

  typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                           ram_addr_t size);
-#ifdef CONFIG_XEN_IS_POSSIBLE
-
  void xen_map_cache_init(phys_offset_to_gaddr_t f,
                          void *opaque);
  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
@@ -28,44 +26,5 @@ void xen_invalidate_map_cache(void);
  uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
                                   hwaddr new_phys_addr,
                                   hwaddr size);
-#else
-
-static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
-                                      void *opaque)
-{
-}
-
-static inline uint8_t *xen_map_cache(MemoryRegion *mr,
-                                     hwaddr phys_addr,
-                                     hwaddr size,
-                                     ram_addr_t ram_addr_offset,
-                                     uint8_t lock,
-                                     bool dma,
-                                     bool is_write)
-{
-    abort();
-}
-
-static inline ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
-{
-    abort();
-}
-
-static inline void xen_invalidate_map_cache_entry(uint8_t *buffer)
-{
-}
-
-static inline void xen_invalidate_map_cache(void)
-{
-}
-
-static inline uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
-                                               hwaddr new_phys_addr,
-                                               hwaddr size)
-{
-    abort();
-}
-
-#endif

  #endif /* XEN_MAPCACHE_H */
diff --git a/include/system/xen.h b/include/system/xen.h
index 990c19a8ef0..04fe30cca50 100644
--- a/include/system/xen.h
+++ b/include/system/xen.h
@@ -30,25 +30,16 @@ extern bool xen_allowed;

  #define xen_enabled()           (xen_allowed)

-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp);
-
  #else /* !CONFIG_XEN_IS_POSSIBLE */

  #define xen_enabled() 0
-static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t 
length)
-{
-    /* nothing */
-}
-static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                                 MemoryRegion *mr, Error **errp)
-{
-    g_assert_not_reached();
-}

  #endif /* CONFIG_XEN_IS_POSSIBLE */

+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   MemoryRegion *mr, Error **errp);
+
  bool xen_mr_is_memory(MemoryRegion *mr);
  bool xen_mr_is_grants(MemoryRegion *mr);
  #endif
---

