Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9860AC9162
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001317.1381508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0bH-0007AC-0K; Fri, 30 May 2025 14:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001317.1381508; Fri, 30 May 2025 14:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0bG-00078i-Td; Fri, 30 May 2025 14:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1001317;
 Fri, 30 May 2025 14:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4Up=YO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uL0bF-00076t-Pk
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:20:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 459e54d0-3d61-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 16:20:43 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad8a8da2376so341731466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 07:20:43 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d84f9e0sm333813066b.85.2025.05.30.07.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 07:20:42 -0700 (PDT)
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
X-Inumbo-ID: 459e54d0-3d61-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748614843; x=1749219643; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq4O2cXXlau/9IvM04wGVOB3qhjvpwF9KoVzci7dJDQ=;
        b=K+qdQD/nIWgA4eg8hmhNz0pQ005whmRG8XC+y2GWsogqsROe4bbqZ9DkK45Afm1/7J
         Cm418GL2DrIDg3GImn/Pl8/++0NRN23+6q5RFFNeR2n4jiIhf/xsc+MLg0yr8hZS3+kS
         vC3nVf8P6gONZWl/PC/+2XUkyqRVkeX3FQ4swkUYLVjz4cMOq/IpMTEM4UXa/aJePAKW
         3uesh6D1zenRFYdvwL8H+Vo4GqrMhc5OTwy4+Y5Sbd5vh+RMkhRz3M11LDnqM3oFBfIM
         NzmsZStaNgmZ+B2eA6y16sLFkHg2U/zfXy3tkgRuXtCzn2FJitCxz+9ZIZGiNL1Dgtgl
         gqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748614843; x=1749219643;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uq4O2cXXlau/9IvM04wGVOB3qhjvpwF9KoVzci7dJDQ=;
        b=eWIobekRZZHvP8U7nMZzRzX/ItaXpyYiYvO669ZMWbuVGQcIRpOJfnXS0ZMUBf5lOC
         IxboM3xAIkKHsx1kwmB4M/uxm4oXxy+q2jLB1xDJyE2Y2L77Cq0MMAIhAwN88WIlIibd
         YJGA1Rc2xkuPTOzi9ST6/xwteZY4Zj6STWSRVW926xkRfa9XtxLb/FJux7QwbSQi6iIM
         THHZHHTyM1J7pKh7elT+D4/lZYDXgeN5DZVslj/WEJDqsMTNQ1YDYq+gGEvwykaS1fMw
         2y/pPAVXC2Uqwo5A4co3dt1n4Es439pB7wkEt/+kqqmepwphwZ5b5yq3coSGc48uiND/
         /ZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWhTozxFIhREj1R4AsDWiEqcw01npjRQElrFqB/NUKbEtDoRgM1+/uqovzCOOmW1nCVcviDCUjPbjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXDv4sry5xl1/N8GNpHK2wtWAfafzR2EnYc6B8hVtWmrBs0BMV
	dBDcWRTNcppDr7Y4FMRsvT6EHHSz+4R21piIGQsPMKngvRSrGLoxiHE7
X-Gm-Gg: ASbGncsx+N6go3FACYWfeJ4xzDaWCUklQ20sMWvAP+zVOY50IoF1INg73GYKiIZbkiR
	J3XLP80gGuxucPDP6Oc+l1Y0y5NG26gEujZ4PF+euPy2Cs6BacJj+//lyQDw+HOvTPWyNR7ZJ4N
	IFAkfgI/RhIYvM+L8zM+ty2+eA5ziXz2kCDiGx5QoQOnFfcM4SJtQ7vQNG5IBH0lofkcuYkM0UI
	W6TwJANMBnGbXrwdnCRKz5U47kXr/cvjBDBfox2XOsBw3XqEh1uENzyrxC5+iKUv/L7/UssgSfW
	q+qajz4h8PTrmhpF7YoKN9W/TfqkTHHvM2Nk036dVtlqh1RPc9MzELW+LarFLPaqEKB/H4m5DkH
	I5v00fnJjli0FUoHbRd0saZdV
X-Google-Smtp-Source: AGHT+IHp37/96/rFElV9XhGd7RdgorZr5kNAu/swdIYl5txI+Q+kKvbWyj/IxrtGNKH97CXN8THW2A==
X-Received: by 2002:a17:907:7285:b0:ad8:9c97:c2fa with SMTP id a640c23a62f3a-adb322455e1mr359983566b.4.1748614842921;
        Fri, 30 May 2025 07:20:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------JDxgvwVDw84ZwRGJfq1LHB0J"
Message-ID: <7ba71c82-1143-4793-afae-8ac3a8d0320b@gmail.com>
Date: Fri, 30 May 2025 16:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] xen/riscv: introduce support of Svpbmt extension
 and make it mandatory
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <f1c19b5dec9e00b112d97324d582191fe127eb83.1747843009.git.oleksii.kurochko@gmail.com>
 <3eaba65b-5b36-433c-afbc-ed17886916a9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3eaba65b-5b36-433c-afbc-ed17886916a9@suse.com>

This is a multi-part message in MIME format.
--------------JDxgvwVDw84ZwRGJfq1LHB0J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/25 9:26 AM, Jan Beulich wrote:
> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>> Svpbmt extension is necessary for chaning the memory type for a page contains
>> a combination of attributes that indicate the cacheability, idempotency,
>> and ordering properties for access to that page.
>>
>> As a part of the patch the following is introduced:
>> - Svpbmt memory type defintions: PTE_PBMT_{NOCACHE,IO}.
>> - PAGE_HYPERVISOR_{NOCACHE,WC}.
>> - RISCV_ISA_EXT_svpbmt and add a check in runtime that Svpbmt is
>>    supported by platform.
>> - Update riscv/booting.txt with information about Svpbmt.
>> - Update logic of pt_update_entry() to take into account PBMT bits.
>>
>> Use 'unsigned long' for pte_attr_t as PMBT bits are 61 and 62 and it doesn't
>> fit into 'unsigned int'. Also, update function prototypes which uses
>> 'unsigned int' for flags/attibutes.
>>
>> Enable Svpbmt for testing in QEMU as Svpmbt is now mandatory for
>> Xen work.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>
>
Thanks.

I just noticed a minor typo (PMBT_{IO,NOCACHE}->PMBT_{IO,NOCACHE} in the changes:

xen$ git diff
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 81b91b63d8..4cb0179648 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -45,8 +45,8 @@
   *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
   *  11 - Rsvd   Reserved for future standard use
   */
-#define PTE_PMBT_NOCACHE            BIT(61, UL)
-#define PTE_PMBT_IO                 BIT(62, UL)
+#define PTE_PBMT_NOCACHE            BIT(61, UL)
+#define PTE_PBMT_IO                 BIT(62, UL)
  
  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
  #define PTE_TABLE                   (PTE_VALID)
@@ -59,12 +59,12 @@
  /*
   * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
   *
- * Both PTE_PMBT_IO and PTE_PMBT_NOCACHE are non-cacheable, but the difference
+ * Both PTE_PBMT_IO and PTE_PBMT_NOCACHE are non-cacheable, but the difference
   * is that IO is non-idempotent and strongly ordered, which makes it a good
   * candidate for mapping IOMEM.
   */
-#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
-#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PBMT_IO)
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PBMT_NOCACHE)
  
  /*
   * The PTE format does not contain the following bits within itself;
@@ -77,7 +77,7 @@
  
  #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
  
-#define PTE_PBMT_MASK   (PTE_PMBT_NOCACHE | PTE_PMBT_IO)
+#define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
  
  /* Calculate the offsets into the pagetables for a given VA */
  #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))

I will send them as a part of v4. (if it can't
be done during commit)

~ Oleksii

--------------JDxgvwVDw84ZwRGJfq1LHB0J
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/25 9:26 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3eaba65b-5b36-433c-afbc-ed17886916a9@suse.com">
      <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Svpbmt extension is necessary for chaning the memory type for a page contains
a combination of attributes that indicate the cacheability, idempotency,
and ordering properties for access to that page.

As a part of the patch the following is introduced:
- Svpbmt memory type defintions: PTE_PBMT_{NOCACHE,IO}.
- PAGE_HYPERVISOR_{NOCACHE,WC}.
- RISCV_ISA_EXT_svpbmt and add a check in runtime that Svpbmt is
  supported by platform.
- Update riscv/booting.txt with information about Svpbmt.
- Update logic of pt_update_entry() to take into account PBMT bits.

Use 'unsigned long' for pte_attr_t as PMBT bits are 61 and 62 and it doesn't
fit into 'unsigned int'. Also, update function prototypes which uses
'unsigned int' for flags/attibutes.

Enable Svpbmt for testing in QEMU as Svpmbt is now mandatory for
Xen work.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

</pre>
    </blockquote>
    <pre>Thanks.

I just noticed a minor typo (PMBT_{IO,NOCACHE}-&gt;PMBT_{IO,NOCACHE} in the changes:

xen$ git diff
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 81b91b63d8..4cb0179648 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -45,8 +45,8 @@
  *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
  *  11 - Rsvd   Reserved for future standard use
  */
-#define PTE_PMBT_NOCACHE            BIT(61, UL)
-#define PTE_PMBT_IO                 BIT(62, UL)
+#define PTE_PBMT_NOCACHE            BIT(61, UL)
+#define PTE_PBMT_IO                 BIT(62, UL)
 
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
@@ -59,12 +59,12 @@
 /*
  * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
  *
- * Both PTE_PMBT_IO and PTE_PMBT_NOCACHE are non-cacheable, but the difference
+ * Both PTE_PBMT_IO and PTE_PBMT_NOCACHE are non-cacheable, but the difference
  * is that IO is non-idempotent and strongly ordered, which makes it a good
  * candidate for mapping IOMEM.
  */
-#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
-#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PBMT_IO)
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PBMT_NOCACHE)
 
 /*
  * The PTE format does not contain the following bits within itself;
@@ -77,7 +77,7 @@
 
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
-#define PTE_PBMT_MASK   (PTE_PMBT_NOCACHE | PTE_PMBT_IO)
+#define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
 
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) &gt;&gt; XEN_PT_LEVEL_SHIFT(lvl))

I will send them as a part of v4. (if it can't
be done during commit)

~ Oleksii
</pre>
  </body>
</html>

--------------JDxgvwVDw84ZwRGJfq1LHB0J--

