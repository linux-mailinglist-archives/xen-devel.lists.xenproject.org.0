Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DaP8HHu6ImpVcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 14:00:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C180C647E81
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 14:00:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZnMST6cm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329408.1593542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTDR-0003lz-9s; Fri, 05 Jun 2026 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329408.1593542; Fri, 05 Jun 2026 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTDR-0003jE-71; Fri, 05 Jun 2026 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1329408;
 Fri, 05 Jun 2026 11:59:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVTDP-0003j8-4v
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 11:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVTDO-000yNw-He
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 13:59:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a22ba3a-2eae-0a2a0a5409dd-0a2a450ae8b6-0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 13:59:54 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a22ba3a-56b3-0a2a450a0019-d1558029edd5-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 13:59:54 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so21944905e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 04:59:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d2d11asm55053615e9.1.2026.06.05.04.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 04:59:53 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660794; x=1781265594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byFSVQPBQ/QVGNq8s+HFMCrkPcMypMsF1o4JUjiEn3I=;
        b=ZnMST6cmErFAvgYna3R+dxCGveU9kyLMzSMiDfyyWYDd35+VQ6NiPoom3iiyroSPEH
         r45oZS3uhREI2d6xm7il+zIXTQTfUmjARBiJyqWNUyV8asebnNI6FINtc8dTxq/TAaD/
         IZa5y5m/6pxwDReScjjJCWUF4b3YSgQt8iYNh0JTMjIJmn2sMwU3aMafhJ5YMeGCZtt1
         jv+I6GD3Hxu+ri+pCJqs3Ws3p+ECCnV+3oReVnh8NojnylnghgFqIIAUYSFIhDuVsNxB
         MAxsNGIbS6HQ3QnzCP98Nkhct6HOB1sDCruv5zphXmpLoCTTvdcfH+Uny0IB6W72SxlU
         NKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660794; x=1781265594;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byFSVQPBQ/QVGNq8s+HFMCrkPcMypMsF1o4JUjiEn3I=;
        b=saCwt6tkw8wYM6MfsGOL2qoApdwELxKco4f5ntmcajRrDdfEks3mBwNOwWQ5qFhRTN
         +hQvi6BUKEwgg5N8suKeMzUAHacWbQAMetleky9+ilkaJ1dBaVlds1+AUzJSLkGxasKS
         dogeFI0XFV2Zek+pB3Neh5urK8d1L0w+SSjR3zjgsYlXBtOSZ/3jYTG/OxSXCdECM5u2
         Li57cwISjOr5UdKC2W8lIu1sTQp9qzad9kh9ldC27NQMPlawtbqaY1d9HkNkdAR0bJ5t
         m7BKdoy4wjvRoZF6yrN0jRevo+Bhn68yxoeu0G7dqMDqaIT/HgVzzmuchEc8in/0iBu+
         +x2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+rByUyUnna4QErO3hxIM4sVibCTzip4jfaLZmJA0Zgl2ThXXHA1VL4AVgga4gfTgxPRVycl/lOblo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBTKDIUeQG3jiihKp1L3SgqXzFKGthgawlVNyQbuDuQHwnbWMX
	rbo4gYgZqlGDaJUJqV0f6/XC30c7wtHH151Q8I7GOnkWXnXAiAV66WL/
X-Gm-Gg: Acq92OGMrMt3bYR24/de3tRAPg31T5QN7a/qTrnLgfZDRyhChlcMEFyJ4Sav2FS6sW/
	CwrgWOC9Z8RElKitZ5NauZw0jft//0BsxyRA+v8o9GyLiX82JB7gkFN3rp6c6gTLWyyYh33pP5J
	4U/kq0GYTufldOCrGzMF12AbO/XnllAVdYpXYw1fqDT3uw2N5H0CEvCvr/oLxYry+qyqpb2Aizp
	wd57CGMfI8yal7E+OugZXRsFQHWsT6s90oO0X0BKRHkKPEOxIucLSmfGpYPCcipTwKFj+6QiHVN
	QeamSK6ggFZ35W7DGCCvNwDS/6D26T2X7xUdRMBdOaRkf+IU2VH1unX/riyVNL2MFkuux6G4Yo0
	2nyMSMK8rGDbCIe8T1osf9289Dfs4zvd7//V4bGB9Vw9WzV0XNSHUr9Q+9rn6RZflXbTkb5Yr8f
	1vnQ+Dn9JuiXv9ARGFEYO8fCVdTGfSUMRISFk9yEObPls+V0BZxWKXX+wHm6Igy4Oke2aMilNht
	qo+keG3gZ/3Zt8w
X-Received: by 2002:a05:600c:4e94:b0:490:9588:bdae with SMTP id 5b1f17b1804b1-490c25e30e0mr48829735e9.18.1780660793658;
        Fri, 05 Jun 2026 04:59:53 -0700 (PDT)
Message-ID: <8803731b-ae65-4ff9-a94a-d0670cb8b132@gmail.com>
Date: Fri, 5 Jun 2026 13:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/26] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
 <6ec9620d-7224-49d4-860c-6e447e0534e3@suse.com>
 <702af594-17ce-4e64-8f02-37ad5785c6a4@gmail.com>
Content-Language: en-US
In-Reply-To: <702af594-17ce-4e64-8f02-37ad5785c6a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780660794-70D608B7-DA3FEE04/10/73395122804
X-purgate-type: spam
X-purgate-size: 7314
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C180C647E81



On 6/4/26 1:29 PM, Oleksii Kurochko wrote:
>>> +
>>> +static const struct vintc_ops vintc_ops = {
>>> +    .vcpu_init = vcpu_vaplic_init,
>>> +};
>>> +
>>> +int __init domain_vaplic_init(struct domain *d)
>>
>> Why __init, and why is there no caller? 
> 
> The caller is in follow-up patch. I will add that to commit message.
> 
> Considering that domain_vintc_init() isn't __init from where 
> domain_vaplic_init() is called then __init should be dropped here. I 
> will do that.
> 
> Plus why is the vCPU-init a hook,
>> but the domain init is not? Either you mean to allow for other ICs, or
>> you you don't.
> 
> IIUC your question domain_vaplic_init() ins't a hook because vaplic 
> structure is allocated dynamically so vintc, vintc->ops and/or vintc- 
>  >init_ops aren't initialized at the moment when vintc->{ops or 
> init_ops}->domain_vaplic_init() is used in domain_vintc_init() (which is 
> introduced in the follow up patch).

As an alternative it could be that vintc->init_ops are moved as a 
variable to int.c and then domain_vaplic_(de)init will be just a hook. 
Something like:

$ git diff
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 86d0a247ef3d..4c4f777f7e1b 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -28,6 +28,7 @@
  #include <asm/imsic.h>
  #include <asm/intc.h>
  #include <asm/io.h>
+#include <asm/vaplic.h>
  #include <asm/riscv_encoding.h>

  #define APLIC_DEFAULT_PRIORITY  1
@@ -394,6 +395,7 @@ static int __init aplic_preinit(struct 
dt_device_node *node, const void *dat)
      dt_irq_xlate = aplic_irq_xlate;

      register_intc_ops(&aplic_init_ops);
+    register_vintc_init_ops(&vaplic_vintc_init_ops);

      /* Enable supervisor external interrupt */
      csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
diff --git a/xen/arch/riscv/include/asm/intc.h 
b/xen/arch/riscv/include/asm/intc.h
index 4842ca08aa54..84b97d6c56f9 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -56,6 +56,8 @@ struct intc_hw_init_ops {
  };

  struct vintc_init_ops {
+    int (*init)(struct domain *d);
+    void (*deinit)(struct domain *d);
      /* Create interrupt controller node for domain */
      int (*make_domu_dt_node)(struct kernel_info *kinfo);
  };
@@ -79,13 +81,13 @@ struct vintc_ops {
  struct vintc {
      unsigned int irq_nums;
      unsigned long *allocated_irqs;
-    const struct vintc_init_ops *init_ops;
      const struct vintc_ops *ops;
  };

  void intc_preinit(void);

  void register_intc_ops(const struct intc_hw_init_ops *init_ops);
+void register_vintc_init_ops(const struct vintc_init_ops *ops);

  void intc_init(void);

diff --git a/xen/arch/riscv/include/asm/vaplic.h 
b/xen/arch/riscv/include/asm/vaplic.h
index 0fa690fcb2d7..7720e6556fcb 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -15,8 +15,6 @@

  #include <asm/intc.h>

-struct domain;
-
  #define to_vaplic(d) container_of(d->arch.vintc, struct vaplic, vintc)

  struct vaplic_regs {
@@ -31,7 +29,6 @@ struct vaplic {
      paddr_t regs_size;
  };

-int domain_vaplic_init(struct domain *d);
-void domain_vaplic_deinit(struct domain *d);
+extern const struct vintc_init_ops vaplic_vintc_init_ops;

  #endif /* ASM__RISCV__VAPLIC_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 0934bce3f2f8..304d4def7a4b 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -13,18 +13,24 @@

  #include <asm/aia.h>
  #include <asm/intc.h>
-#include <asm/vaplic.h>

  static const struct intc_hw_operations *__ro_after_init intc_hw_ops;

  static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;

+static const struct vintc_init_ops *__ro_after_init vintc_init_ops;
+
  void __init register_intc_ops(const struct intc_hw_init_ops *init_ops)
  {
      intc_hw_ops = init_ops->ops;
      intc_hw_init_ops = init_ops;
  }

+void __init register_vintc_init_ops(const struct vintc_init_ops *ops)
+{
+    vintc_init_ops = ops;
+}
+
  void __init intc_preinit(void)
  {
      if ( acpi_disabled )
@@ -105,29 +111,18 @@ int intc_route_irq_to_guest(struct irq_desc *desc,

  int __init make_intc_domU_node(struct kernel_info *kinfo)
  {
-    struct vintc *vintc = kinfo->bd.d->arch.vintc;
-
-    ASSERT(vintc->init_ops && vintc->init_ops->make_domu_dt_node);

-    return vintc->init_ops->make_domu_dt_node(kinfo);
+    return vintc_init_ops->make_domu_dt_node(kinfo);
  }

  int domain_vintc_init(struct domain *d)
  {
-    int ret = -EOPNOTSUPP;
-    const enum intc_version ver = intc_hw_ops->info->hw_version;
-
-    switch ( ver )
-    {
-    case INTC_APLIC:
-        ret = domain_vaplic_init(d);
-        break;
+    int ret;

-    default:
-        printk("vintc (ver:%d) isn't implemented\n", ver);
-        break;
-    }

+    ret = vintc_init_ops->init(d);
      if ( !ret )
      {
          d->arch.vintc->allocated_irqs =
@@ -141,19 +136,9 @@ int domain_vintc_init(struct domain *d)

  void domain_vintc_deinit(struct domain *d)
  {
-    const enum intc_version ver = intc_hw_ops->info->hw_version;
-
-    switch ( ver )
-    {
-    case INTC_APLIC:
-        domain_vaplic_deinit(d);
-        break;
-
-    default:
-        printk("vintc (ver:%d) isn't implemented\n", ver);
-        break;
-    }
+    ASSERT(vintc_init_ops && vintc_init_ops->deinit);

+    vintc_init_ops->deinit(d);
      xvfree(d->arch.vintc->allocated_irqs);
  }

diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 57c3433ba03b..301078b8639e 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -397,7 +397,12 @@ static int __init cf_check 
vaplic_make_domu_dt_node(struct kernel_info *kinfo)
      return fdt_end_node(fdt);
  }

-static const struct vintc_init_ops __initdata init_ops = {
+static int domain_vaplic_init(struct domain *d);
+static void domain_vaplic_deinit(struct domain *d);
+
+const struct vintc_init_ops vaplic_vintc_init_ops = {
+    .init              = domain_vaplic_init,
+    .deinit            = domain_vaplic_deinit,
      .make_domu_dt_node = vaplic_make_domu_dt_node,
  };

@@ -408,7 +413,7 @@ static const struct vintc_ops vintc_ops = {
      .emulate_load = vaplic_emulate_load,
  };

-int __init domain_vaplic_init(struct domain *d)
+static int domain_vaplic_init(struct domain *d)
  {
      struct vaplic *vaplic = xvzalloc(struct vaplic);

@@ -417,7 +422,6 @@ int __init domain_vaplic_init(struct domain *d)

      d->arch.vintc = &vaplic->vintc;
      d->arch.vintc->ops = &vintc_ops;
-    d->arch.vintc->init_ops = &init_ops;

      vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                               APLIC_DOMAINCFG_RO80;
@@ -428,7 +432,7 @@ int __init domain_vaplic_init(struct domain *d)
      return 0;
  }

-void __init domain_vaplic_deinit(struct domain *d)
+static void domain_vaplic_deinit(struct domain *d)
  {
      struct vaplic *vaplic = to_vaplic(d);


The downside is that we still need register_vintc_init_ops() which will 
called from real interrupt controller code.

Would it be better solution?

~ Oleksii

