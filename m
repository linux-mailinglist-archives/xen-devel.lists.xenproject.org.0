Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFBkBO/g8GmoagEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 18:31:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B06488F9A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 18:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296514.1572909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHlLA-0008Pq-21; Tue, 28 Apr 2026 16:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296514.1572909; Tue, 28 Apr 2026 16:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHlL9-0008N4-VL; Tue, 28 Apr 2026 16:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1296514;
 Tue, 28 Apr 2026 16:31:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wHlL8-0008Mx-Jf
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:31:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHlL7-008ycb-VY
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 18:31:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69f0e0ce-5cb7-0a2a0a5109dd-0a2a4507d53e-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 18:31:13 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69f0e0d1-229c-0a2a45070019-d1558033e4f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 18:31:13 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488ad135063so105902265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 09:31:13 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7b5acd00sm4244805e9.15.2026.04.28.09.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 09:31:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777393873; x=1777998673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csOwj0EBmE4ylOTZBavg92OZiArFyAaHzc333vZFscU=;
        b=nk3KVv2oSk7+E/ltydk9gBH6CziJ9dyKM3hWgGsYB+LDXrHaKVuiwutaJ8tEP4QfFn
         dcyHRXtjSmUoflZSnZsuCbIwxCWxDx8GIcRbgq7cYwLrDsqbpsjVFtvJeZegk1lHtoOi
         vlFTNmQg/NGEvIldCuTotCUxK9rW6I3WtjbrdvOPUKAzD81rWPZobw8/Tx+uqpTuRRVB
         Bus+6uj/jBMiON/86+rEwaWjKr8titQhJhVjmI52G5L+ZwJB170Z0d5bKg5sw/5X9sZq
         OqroHD34M2y1OBVo4dv8VWqpvhJ1zIRDS/chd0w3uIC9rA9dccRsjRjWLID1SiZ5lEAV
         FgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393873; x=1777998673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csOwj0EBmE4ylOTZBavg92OZiArFyAaHzc333vZFscU=;
        b=KSjb7dKRACKkl1UN3J3IozuftVqYD4GOOcGpCK0ufGfPpwlGvUOWLfhzs0ZjOVmwjA
         lfWU7KciqLrALrQjisxmKe/puglN1SsnN8z6wDVhgA4bnQOD7Rd0sK2B1S+PK90YxhdA
         AInnzCtjHKglzPYBaPWc5pMg1n7RT0v2paNICdyHnmNyaWLIK0vO0c3RNRsVv6f6+FKa
         UToxFXXhez8rn3r8wVz7BvSW4Yv+EU/I7TPEoPnM5a0BZ159PI3bDlqej7CzpzyBT2Ro
         497hmAsViDVoogLh/YsRQ4iA3xusGUjuxHUDkAwvEnQEqc9CXBhjYmvDkctkNTvqXXC4
         yw0g==
X-Forwarded-Encrypted: i=1; AFNElJ85dgl0M/jFjQ71SaZ0MbESYnUqXlWQFMp0sq7LWAfSWX1AxS1qzRekPbwmyGPFLo2ctlZe1N+VcBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLldav83eITa9wwZMl9A2Bo5VJlzeSK3NY4NMAL8emG6jj1uJq
	T8HbfYssvEQWuaII2rJizjjhAsiuGE+wxeIrVqKWd7RU6e4IjQGZAHH5YgMybg==
X-Gm-Gg: AeBDieuskzBFLAi0SGXT/h/XDcy6XzTaPm4mdDfS+/FZP+sXos8/w0XcX4jT96AVs2d
	Z/4Z3rIlGyCWX0DGCZoHH2KgLMMC8z3xUbBPGE91jiOTNYvN7Y0OKj5/4rw86kvI7vuoWKPD3sY
	fog3LJEZ3xfqAapBIRiLstjZvKOK5ZJEKC/Lj9fphrL9SYNGM2mbx6jwpA6p/4akY94sC+gstOH
	8jkoqa2zsbwRSM4NTZ6SjOvoRJBFRWPNxMyTV8cQoc0RFdi02R7/BXfWpSWQ+U7oxHAfY5Ji1ru
	842Wf8M+74pr7B/0r2bHoSgm8NoG0soX+ekjywoScT3EvFiRtIpADUOkzbqeUrdNGaxcxRhde9N
	IMU3yUuoZ3QI6VudeTXECFp2fr+JenBg82niqaaoDBQT05B6g+tMNW7HaLzQ4BStzPtCvRreQ6G
	q0s8cP3dzC9tWRqYHsIw2EQBJ7hkS8d3F+h9Ix/dgqj11F9Pk6p9aHMbemb3ZqXuQcEw==
X-Received: by 2002:a05:600c:c08f:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48a7b4d165cmr5778515e9.0.1777393872946;
        Tue, 28 Apr 2026 09:31:12 -0700 (PDT)
Message-ID: <6b78dcf3-7e4c-4568-a0fd-58d5c860e4fa@gmail.com>
Date: Tue, 28 Apr 2026 19:31:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/arm: its: pre-initialize ITS quirks before LPI
 setup
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
 <a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1777393873-2B175C48-591AB5A5/0/0
X-purgate-type: clean
X-purgate-size: 8219
X-Rspamd-Queue-Id: 65B06488F9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.949];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



On 3/25/26 12:38, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> In the current initialization flow, gicv3_init() calls gicv3_dist_init()
> before gicv3_its_init().
> 
> When LPIs are supported, gicv3_dist_init() calls
> gicv3_lpi_init_host_lpis(), which initializes host LPI state and allocates
> the boot CPU pending table before ITS quirk flags are computed. Non-boot
> CPUs allocate their pending tables later from the CPU_UP_PREPARE notifier,
> while redistributor LPI programming happens separately in
> gicv3_lpi_init_rdist().
> 
> This means the boot CPU LPI setup can observe default ITS memory attributes
> before dma-noncoherent and other ITS quirks are applied.
> 
> Introduce gicv3_its_preinit() and call it before gicv3_dist_init(). This
> keeps the actual ITS hardware initialization in gicv3_its_init(), but moves
> ITS discovery, quirk validation and quirk flag setup early enough for the
> subsequent LPI initialization to use the correct attributes.


Have you considered an alternative approach that might be less invasive? 
I am thinking of something the other way around: perhaps we could 
allocate the LPI pending table for the boot CPU later.

Would a diff below work?


---
  xen/arch/arm/gic-v3-lpi.c             | 9 +++++++++
  xen/arch/arm/gic-v3.c                 | 2 ++
  xen/arch/arm/include/asm/gic_v3_its.h | 6 ++++++
  3 files changed, 17 insertions(+)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ee338edc2..61cc45d347 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -450,6 +450,15 @@ int gicv3_lpi_init_host_lpis(unsigned int 
host_lpi_bits)

      printk("GICv3: using at most %lu LPIs on the host.\n", 
MAX_NR_HOST_LPIS);

+    return rc;
+}
+
+int gicv3_lpi_post_init_host_lpis(void)
+{
+    int rc;
+
+    ASSERT(smp_processor_id() == 0);
+
      /* Register the CPU notifier and allocate memory for the boot CPU */
      register_cpu_notifier(&cpu_nfb);
      rc = gicv3_lpi_allocate_pendtable(smp_processor_id());
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7f365cdbe9..8b9059c5c9 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1981,6 +1981,8 @@ static int __init gicv3_init(void)
          res = gicv3_its_init();
          if ( res )
              panic("GICv3: ITS: initialization failed: %d\n", res);
+
+        gicv3_lpi_post_init_host_lpis();
      }

      res = gicv3_cpu_init();
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h 
b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..288cc1d42f 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -156,6 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);

  /* Initialize the host structures for LPIs and the host ITSes. */
  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
+int gicv3_lpi_post_init_host_lpis(void);
  int gicv3_its_init(void);

  /* Store the physical address and ID for each redistributor as read 
from DT. */
@@ -245,6 +246,11 @@ static inline int gicv3_lpi_init_host_lpis(unsigned 
int host_lpi_bits)
      return 0;
  }

+static inline int gicv3_lpi_post_init_host_lpis(void)
+{
+    return 0;
+}
+
  static inline int gicv3_its_init(void)
  {
      return 0;
-- 
2.34.1


> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> TODO: Think about separating Redistributor/LPI attributes from ITS.
> ---
>   xen/arch/arm/gic-v3-its.c             | 36 +++++++++++++++++----------
>   xen/arch/arm/gic-v3.c                 |  7 ++++++
>   xen/arch/arm/include/asm/gic_v3_its.h |  5 ++++
>   3 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index ee432088cd..0251d91630 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -63,6 +63,7 @@ struct its_quirk {
>       uint32_t flags;
>   };
>   
> +/* TODO: Separate Redistributor/LPI attributes from ITS quirks. */
>   static uint32_t __ro_after_init its_quirk_flags;
>   
>   static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
> @@ -148,9 +149,15 @@ static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its,
>       return flags;
>   }
>   
> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +static void gicv3_its_enable_quirks(void)
>   {
>       const struct its_quirk *quirk;
> +    const struct host_its *hw_its;
> +
> +    if ( list_empty(&host_its_list) )
> +        return;
> +
> +    hw_its = list_first_entry(&host_its_list, struct host_its, entry);
>   
>       its_quirk_flags = gicv3_its_collect_quirks(hw_its, &quirk);
>   
> @@ -603,16 +610,10 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
>       uint64_t reg;
>       int i, ret;
>   
> -    hw_its->its_base = ioremap_nocache(hw_its->addr, hw_its->size);
> -    if ( !hw_its->its_base )
> -        return -ENOMEM;
> -
>       ret = gicv3_disable_its(hw_its);
>       if ( ret )
>           return ret;
>   
> -    gicv3_its_enable_quirks(hw_its);
> -
>       reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
>       hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
>       hw_its->evid_bits = GITS_TYPER_EVENT_ID_BITS(reg);
> @@ -1161,6 +1162,11 @@ static void add_to_host_its_list(paddr_t addr, paddr_t size,
>       its_data->size = size;
>       its_data->dt_node = node;
>   
> +    its_data->its_base = ioremap_nocache(its_data->addr, its_data->size);
> +    if ( !its_data->its_base )
> +        panic("GICv3: Cannot map ITS frame: 0x%lx, 0x%lx\n",
> +            its_data->addr, its_data->size);
> +
>       printk("GICv3: Found ITS @0x%lx\n", addr);
>   
>       list_add_tail(&its_data->entry, &host_its_list);
> @@ -1238,16 +1244,22 @@ static void gicv3_its_acpi_init(void)
>   
>   #endif
>   
> -int gicv3_its_init(void)
> +void __init gicv3_its_preinit(void)
>   {
> -    struct host_its *hw_its;
> -    int ret;
> -
>       if ( acpi_disabled )
>           gicv3_its_dt_init(dt_interrupt_controller);
>       else
>           gicv3_its_acpi_init();
>   
> +    gicv3_its_validate_quirks();
> +    gicv3_its_enable_quirks();
> +}
> +
> +int gicv3_its_init(void)
> +{
> +    struct host_its *hw_its;
> +    int ret;
> +
>       list_for_each_entry(hw_its, &host_its_list, entry)
>       {
>           ret = gicv3_its_init_single_its(hw_its);
> @@ -1255,8 +1267,6 @@ int gicv3_its_init(void)
>               return ret;
>       }
>   
> -    gicv3_its_validate_quirks();
> -
>       return 0;
>   }
>   
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..6e44d23d64 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1974,6 +1974,13 @@ static int __init gicv3_init(void)
>   
>       spin_lock(&gicv3.lock);
>   
> +    if ( gic_dist_supports_lpis() )
> +        /*
> +         * Apply ITS quirks before gicv3_dist_init() sets up host LPIs,
> +         * so pending tables use the correct ITS memory attributes.
> +         */
> +        gicv3_its_preinit();
> +
>       gicv3_dist_init();
>   
>       if ( gic_dist_supports_lpis() )
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
> index fc5a84892c..e1d7522ea5 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -156,6 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
>   
>   /* Initialize the host structures for LPIs and the host ITSes. */
>   int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
> +void gicv3_its_preinit(void);
>   int gicv3_its_init(void);
>   
>   /* Store the physical address and ID for each redistributor as read from DT. */
> @@ -219,6 +220,10 @@ static inline int gicv3_its_deny_access(struct domain *d)
>       return 0;
>   }
>   
> +static inline void gicv3_its_preinit(void)
> +{
> +}
> +
>   static inline bool gicv3_its_host_has_its(void)
>   {
>       return false;


