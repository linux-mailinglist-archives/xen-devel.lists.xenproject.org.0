Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A148B125E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 20:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711620.1111726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzhOf-0005Pe-Tl; Wed, 24 Apr 2024 18:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711620.1111726; Wed, 24 Apr 2024 18:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzhOf-0005Mk-R0; Wed, 24 Apr 2024 18:31:09 +0000
Received: by outflank-mailman (input) for mailman id 711620;
 Wed, 24 Apr 2024 18:31:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rzhOe-0005Md-IP
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 18:31:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzhOe-0008BS-5s; Wed, 24 Apr 2024 18:31:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzhOe-000262-0x; Wed, 24 Apr 2024 18:31:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=s0m53aWYxfGLRQ1+sSrl/pHgmrq6CcRJ2flB/C5sWv4=; b=crMF06kbfP5di3TNI7Xs7au9pw
	8A5P0XkKxIlIVT0Wr2bjCtCUG2jXqZfN5DI9+dyyEgsYcTL5al9nKpuznvQYfX7A079+Ew4w4qMf+
	DkqZeS6M6IJ/IHafHQeFSoB/qFtdvgGYHAKJ0uUhbAr6VzgImFy5e8UzgV+rgA6FztCg=;
Message-ID: <d92e4626-9cc5-45e2-9608-75c3b3140518@xen.org>
Date: Wed, 24 Apr 2024 19:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] xen/ppc: Introduce stub asm/static-shmem.h
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <feadb431b4c7a13e803c342ed00c60a6415f2ceb.1712893887.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <feadb431b4c7a13e803c342ed00c60a6415f2ceb.1712893887.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 12/04/2024 04:55, Shawn Anastasio wrote:
> Required for bootfdt.c to build.

AFAIU, this patch is only necessary in #4. So I would consider to fold 
it there as it doesn't seem to add any value alone.

> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> Changes in v4: none
> 
>   xen/arch/ppc/include/asm/static-shmem.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 xen/arch/ppc/include/asm/static-shmem.h
> 
> diff --git a/xen/arch/ppc/include/asm/static-shmem.h b/xen/arch/ppc/include/asm/static-shmem.h
> new file mode 100644
> index 0000000000..84370d6e6c
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/static-shmem.h

Just an idea to avoid introducing static-shmem.h for PPC (and I guess 
RISC-V). Could we instead ifdef the inclusion and in bootfdt.c provide a 
stub for...

> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier:  GPL-2.0-only */
> +
> +#ifndef __ASM_PPC_STATIC_SHMEM_H__
> +#define __ASM_PPC_STATIC_SHMEM_H__
> +
> +static inline int process_shm_node(const void *fdt, int node,
> +                                   uint32_t address_cells, uint32_t size_cells)
> +{
> +    return -EINVAL;
> +}

... this helper? Something like [1].

Cheers,


[1]
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 4d708442a19e..26dada1e3a1e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -15,7 +15,9 @@
  #include <xen/sort.h>
  #include <xsm/xsm.h>
  #include <asm/setup.h>
+#ifdef CONFIG_STATIC_SHM
  #include <asm/static-shmem.h>
+#endif

  static void __init __maybe_unused build_assertions(void)
  {
@@ -436,6 +438,15 @@ static int __init process_domain_node(const void 
*fdt, int node,
                                     MEMBANK_STATIC_DOMAIN);
  }

+#ifndef CONFIG_STATIC_SHM
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t 
size_cells)
+{
+    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared 
memory nodes\n");
+    return -EINVAL;
+}
+#endif
+
  static int __init early_scan_node(const void *fdt,
                                    int node, const char *name, int depth,
                                    u32 address_cells, u32 size_cells,
diff --git a/xen/arch/arm/include/asm/static-shmem.h 
b/xen/arch/arm/include/asm/static-shmem.h
index 3b6569e5703f..39b5881d24aa 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -68,13 +68,6 @@ static inline int process_shm_chosen(struct domain *d,
      return 0;
  }

-static inline int process_shm_node(const void *fdt, int node,
-                                   uint32_t address_cells, uint32_t 
size_cells)
-{
-    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared 
memory nodes\n");
-    return -EINVAL;
-}
-
  static inline void early_print_info_shmem(void) {};

  static inline void init_sharedmem_pages(void) {};


Cheers,

-- 
Julien Grall

