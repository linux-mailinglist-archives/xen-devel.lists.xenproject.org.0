Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C39FFF65
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:25:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864433.1275677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQop-0003i4-Tf; Thu, 02 Jan 2025 19:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864433.1275677; Thu, 02 Jan 2025 19:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQop-0003d5-OC; Thu, 02 Jan 2025 19:25:19 +0000
Received: by outflank-mailman (input) for mailman id 864433;
 Thu, 02 Jan 2025 19:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQoo-0002q0-RD
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:25:18 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c3f7cac-c93f-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:25:17 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so28728715e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:25:17 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm40212825f8f.0.2025.01.02.11.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:25:15 -0800 (PST)
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
X-Inumbo-ID: 4c3f7cac-c93f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735845916; x=1736450716; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edPTs5r2WJDCVGRT6f4/sc4UPJKROdeZIxE7m/aVPP0=;
        b=r4WSOnwTnXrykGyuCZynr4fY7npndJUt8wv+OjTcQ+k7zS2eOc64atuMRk/+lX6sks
         yxHRqXDIsVfmWw5qdf63/vvj4ql7C31X48bJ0qn9pAm8ACkYrjcz6eE83u11C9/qXlup
         07Gqx6sY+TXGv1bUYo7EsOq21BRZ8F4/SKp3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735845916; x=1736450716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edPTs5r2WJDCVGRT6f4/sc4UPJKROdeZIxE7m/aVPP0=;
        b=UOawGydv+CJKp9lnBVgFlvce2TKHQgprLDY1CmnRLQrykgtNEAkTCeRovi07sSnV6G
         k1Dk50ZNT1QF5vaCrOuOLGMLcLUIcBwgqusdAQDznysNl6hruvpryDvOYsbcRMmBbBxt
         S5cy2KMS10k8JQ2jXa5b4jZPpPyjy0gkog/XpNQ+DydFyLiDPO8tdP5Dhb0scmrqoSJM
         R+2TP8DpXfQRuNPWcvBiyFe5BqxigFiV5EF6S1Yni0lfnPcatqKIeCs9QBT465g2m8ve
         jlUSxFWSr+7IvspLLnAKdygOojTVS6cnzOnqlNYrCm2srBsmApMcR8c9viN9LEzmp57k
         trug==
X-Gm-Message-State: AOJu0YzwVpXBM2xl7Et8/H6xYEm1oqV/RB3CJeMMiIslxxmCS71gXyaK
	pKtQ78xv/tjnkxK/I/98svRUw5Ae56La9CRLYqQnmMPEOTUZgFGEcwngpWvOIuV8y03S6hrde2n
	oDKM8Tw==
X-Gm-Gg: ASbGnctWEJUacmgPhQPbnM10iQc65/PP+WYeX3vUVf4tE7CSRSaQyfki3w1mWst7wRa
	o/QsJaoQv6sxJiraOkoGZE3AOrzaLJ5poo/rZbmL3wjKnEDpzjb4pyW+J1MlR+tYoC6VgSJxk3x
	/kGxTvI58orqhyQeotOed3NslQkViktCPReaFPv3xsViA8djaqeEr6B197kTU6z8hvpcQfqwcLd
	vHTbwN+074AOu6VNzyDaV7N7Bu58G1jgDBbtGk1oiaybl6mZAapeE5HQnXpAi5T0w==
X-Google-Smtp-Source: AGHT+IHmGwLlaLgCcyaeWZID5RvfAd2XbtkcpcMbIkQLTV2v/kVVGKNpAQ/U5CkC4f4tvIrMym4x1g==
X-Received: by 2002:a05:600c:35cc:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-43668547fd1mr365041085e9.6.1735845916238;
        Thu, 02 Jan 2025 11:25:16 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 4/5] xen/perfc: Cleanup
Date: Thu,  2 Jan 2025 19:25:07 +0000
Message-Id: <20250102192508.2405687-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * Strip trailing whitspace.
 * Remove PRIperfc.  It has never been used and isn't useful.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/common/perfc.c      | 10 +++++-----
 xen/include/xen/perfc.h | 23 +++++++++++------------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index b748c8af855b..8302b7cf6db1 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -46,7 +46,7 @@ void cf_check perfc_printall(unsigned char key)
         case TYPE_S_SINGLE:
             for_each_online_cpu ( cpu )
                 sum += per_cpu(perfcounters, cpu)[j];
-            if ( perfc_info[i].type == TYPE_S_SINGLE ) 
+            if ( perfc_info[i].type == TYPE_S_SINGLE )
                 sum = (perfc_t) sum;
             printk("TOTAL[%12Lu]", sum);
             if ( sum )
@@ -56,7 +56,7 @@ void cf_check perfc_printall(unsigned char key)
                 {
                     if ( k > 0 && (k % 4) == 0 )
                         printk("\n%53s", "");
-                    printk("  CPU%02u[%10"PRIperfc"u]", cpu, per_cpu(perfcounters, cpu)[j]);
+                    printk("  CPU%02u[%10u]", cpu, per_cpu(perfcounters, cpu)[j]);
                     ++k;
                 }
             }
@@ -71,7 +71,7 @@ void cf_check perfc_printall(unsigned char key)
                 for ( k = 0; k < perfc_info[i].nr_elements; k++ )
                     sum += counters[k];
             }
-            if ( perfc_info[i].type == TYPE_S_ARRAY ) 
+            if ( perfc_info[i].type == TYPE_S_ARRAY )
                 sum = (perfc_t) sum;
             printk("TOTAL[%12Lu]", sum);
             if (sum)
@@ -82,7 +82,7 @@ void cf_check perfc_printall(unsigned char key)
                     sum = 0;
                     for_each_online_cpu ( cpu )
                         sum += per_cpu(perfcounters, cpu)[j + k];
-                    if ( perfc_info[i].type == TYPE_S_ARRAY ) 
+                    if ( perfc_info[i].type == TYPE_S_ARRAY )
                         sum = (perfc_t) sum;
                     if ( (k % 4) == 0 )
                         printk("\n%16s", "");
@@ -98,7 +98,7 @@ void cf_check perfc_printall(unsigned char key)
                     sum = 0;
                     for ( n = 0; n < perfc_info[i].nr_elements; n++ )
                         sum += counters[n];
-                    if ( perfc_info[i].type == TYPE_S_ARRAY ) 
+                    if ( perfc_info[i].type == TYPE_S_ARRAY )
                         sum = (perfc_t) sum;
                     if ( k > 0 && (k % 4) == 0 )
                         printk("\n%53s", "");
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index 324b47665573..bf0eb032f7a9 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -8,24 +8,24 @@
 
 /*
  * NOTE: new counters must be defined in perfc_defn.h
- * 
+ *
  * Counter declarations:
  * PERFCOUNTER (counter, string)              define a new performance counter
  * PERFCOUNTER_ARRAY (counter, string, size)  define an array of counters
- * 
+ *
  * Unlike counters, status variables do not reset:
  * PERFSTATUS (counter, string)               define a new performance stauts
  * PERFSTATUS_ARRAY (counter, string, size)   define an array of status vars
- * 
- * unsigned long perfc_value  (counter)        get value of a counter  
+ *
+ * unsigned long perfc_value  (counter)        get value of a counter
  * unsigned long perfc_valuea (counter, index) get value of an array counter
- * unsigned long perfc_set  (counter, val)     set value of a counter  
+ * unsigned long perfc_set  (counter, val)     set value of a counter
  * unsigned long perfc_seta (counter, index, val) set value of an array counter
- * void perfc_incr  (counter)                  increment a counter          
+ * void perfc_incr  (counter)                  increment a counter
  * void perfc_decr  (counter)                  decrement a status
- * void perfc_incra (counter, index)           increment an array counter   
- * void perfc_add   (counter, value)           add a value to a counter     
- * void perfc_adda  (counter, index, value)    add a value to array counter 
+ * void perfc_incra (counter, index)           increment an array counter
+ * void perfc_add   (counter, value)           add a value to a counter
+ * void perfc_adda  (counter, index, value)    add a value to array counter
  * void perfc_print (counter)                  print out the counter
  */
 
@@ -49,7 +49,6 @@ enum {
 #undef PERFSTATUS_ARRAY
 
 typedef unsigned int perfc_t;
-#define PRIperfc ""
 
 DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
 
@@ -72,7 +71,7 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
 	 this_cpu(perfcounters)[PERFC_ ## x + (y)] = (v) : (v) )
 
 /*
- * Histogram: special treatment for 0 and 1 count. After that equally spaced 
+ * Histogram: special treatment for 0 and 1 count. After that equally spaced
  * with last bucket taking the rest.
  */
 #ifdef CONFIG_PERF_ARRAYS
@@ -98,7 +97,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc);
 extern void cf_check perfc_printall(unsigned char key);
 extern void cf_check perfc_reset(unsigned char key);
 
-    
+
 #else /* CONFIG_PERF_COUNTERS */
 
 #define perfc_value(x)    (0)
-- 
2.39.5


