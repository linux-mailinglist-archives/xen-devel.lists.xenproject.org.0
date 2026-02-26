Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPg3F+J0oGmtjwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 17:29:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E21AA59B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 17:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242197.1542861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vveEL-0007Nh-2f; Thu, 26 Feb 2026 16:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242197.1542861; Thu, 26 Feb 2026 16:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vveEK-0007L8-VQ; Thu, 26 Feb 2026 16:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1242197;
 Thu, 26 Feb 2026 16:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vveEJ-0007L2-8I
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 16:28:47 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3728dd0d-1330-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 17:28:43 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so6432955e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 08:28:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750701sm166111345e9.11.2026.02.26.08.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 08:28:42 -0800 (PST)
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
X-Inumbo-ID: 3728dd0d-1330-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772123322; x=1772728122; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGnb/LzRdTFuissfGZl/GYWSxvj7rryz8FoZ50rNebM=;
        b=ezKcP9mIvc3cn+JKDDiUlUZVPQCvauJaCoFjcNCjL+snO7N7w0meFf76IsgdAkIOwD
         BstZO7UAbtWMQPop88wbhVJWqtzRA0WIsTIG1zn0NSTENDVj71ShPLE17/uJxsM5hMF6
         UEVvJi7o6WCgZsFCi+v8KV68p4y5TdV3wqDV8YHZSmSdMN7+q0+4xtSAffLSTCp6Rjjk
         gVi1V9sHzzn2cZIydQHmUGbyvkO5tPjnP/wdkqw7RaLfH6dsZGuRmqrSROma5wtSbdn/
         2ury1ptk2YgyWSDJx7b//O/yGYCaOWfA6P1SXBESPRPMikZ1Te0PN6b4VsFApOGKGDpm
         G8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123322; x=1772728122;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGnb/LzRdTFuissfGZl/GYWSxvj7rryz8FoZ50rNebM=;
        b=Oja78gZpww9eO9p+wXpYGjcjJn3jvKmyChCBxSBKN2jJV0A8itgCjqnN5FCif7M5dB
         6IRP+9T2ZzZXg+6FY/LFKfV9ouR4K4/9Pk19hdllB7jOkAMOkalVssaT4iQUZL7sefec
         khDbihMjwEFwvn1TGcOptGVRzdv87rkMiDjn3XHHEEc/5rgf3Pl60n/sOAnfFG5U8BpX
         J1wj0QVXFXu9JP5lEpUhNG7PRoNzNyB2efaFb6s0J4ozYQtj42Q/1PBMtu6xC2HAHIXr
         x2CBbIKmtD+dWJH89JQNgqrWnNhHsn5EyOXQqeQntz45cV0K6//CRf9tNR49fxM1pEll
         /epQ==
X-Gm-Message-State: AOJu0YzXtNdjhnylGIRpJPAkv85eLYFGYw9QYctZE8a4KfRH9BHIu2C9
	695+bmuV5gv36cJhpHTeD8dTVEp01iHcEKnx2cH0sA5YS/+ObKg3GKwquB1EDGR5yAQKXRSpOq8
	selY=
X-Gm-Gg: ATEYQzzGO52AhHBGLPENp0OCcu9vcJM9jxHS70e/7yaGHMyU/FJRLwv7A81qKmq3nzu
	p0rVauei9A42O7+CLMiev+YtJEJbMdDa6n854Z1piRVP7Zb2d0rkS+ht5xaS7XxPGf/tVl2PJF+
	V8dD0X0kgBSY6ZOQ6H4RpWK8uuClu2vVGNas7ttBmttpSfoT4U7+1sUKrDpYe5QpSQiTJ0SJXm3
	fIg/bBVwGdTJeNv9+nCFHp4f4LFkSwjFK4zl2u466W4CD83DqQsRdqrZTHDjAORouFJQTZq7j+V
	gJ9ScIMW5nSHnIsJg1nPXF91m+so1bKXrNu1DT0L4X4vxVZWdTP+pE6zCq3enyp53qIWLwM9FPJ
	Fv6gPPQQ4BqDUre2QUvKiHM+0AXISGo8o65ChnKwB2wDGH/q6P4W0pwCMVzkYAgaDBdL60bBuKu
	NOVd7ONF9CY2WVFTMaoG+oyKLK2ZSrOQ/IEti/ya2wgR+/egOOEOcgeAsIeFw2Euoc9ZE6EoG9J
	hFhvFOslEXc+2olZ6VM9MCvrw==
X-Received: by 2002:a05:600c:45c7:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-483c2197b29mr85494035e9.22.1772123322519;
        Thu, 26 Feb 2026 08:28:42 -0800 (PST)
Message-ID: <c50219c1-5a23-46d0-bbe3-ab4a871a935b@suse.com>
Date: Thu, 26 Feb 2026 17:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: device.c is init-only when OVERLAY_DTB=n
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB8E21AA59B
X-Rspamd-Action: no action

Introduce an annotation similar to __hwdom_init and use it througout the
file. All external callers are either themselves __init or are limited to
OVERLAY_DTB=y. Adjust the Makefile accordingly to also have string
literals moved into .init.rodata.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -15,7 +15,9 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alterna
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
-obj-y += device.o
+device-y := device.init.o
+device-$(CONFIG_OVERLAY_DTB) := device.o
+obj-y += $(device-y)
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/device_tree.h>
+#include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/iocap.h>
 #include <xen/lib.h>
@@ -16,8 +17,8 @@
 #include <asm/firmware/sci.h>
 #include <asm/setup.h>
 
-int map_irq_to_domain(struct domain *d, unsigned int irq,
-                      bool need_mapping, const char *devname)
+int __overlay_init map_irq_to_domain(struct domain *d, unsigned int irq,
+                                     bool need_mapping, const char *devname)
 {
     int res;
 
@@ -49,8 +50,8 @@ int map_irq_to_domain(struct domain *d,
     return 0;
 }
 
-int map_range_to_domain(const struct dt_device_node *dev,
-                        uint64_t addr, uint64_t len, void *data)
+int __overlay_init map_range_to_domain(const struct dt_device_node *dev,
+                                       uint64_t addr, uint64_t len, void *data)
 {
     struct map_range_data *mr_data = data;
     struct domain *d = mr_data->d;
@@ -124,10 +125,10 @@ int map_range_to_domain(const struct dt_
  *   < 0 error
  *   0   success
  */
-int map_device_irqs_to_domain(struct domain *d,
-                              struct dt_device_node *dev,
-                              bool need_mapping,
-                              struct rangeset *irq_ranges)
+int __overlay_init map_device_irqs_to_domain(struct domain *d,
+                                             struct dt_device_node *dev,
+                                             bool need_mapping,
+                                             struct rangeset *irq_ranges)
 {
     unsigned int i, nirq;
     int res, irq;
@@ -180,9 +181,9 @@ int map_device_irqs_to_domain(struct dom
     return 0;
 }
 
-static int map_dt_irq_to_domain(const struct dt_device_node *dev,
-                                const struct dt_irq *dt_irq,
-                                void *data)
+static int __overlay_init map_dt_irq_to_domain(const struct dt_device_node *dev,
+                                               const struct dt_irq *dt_irq,
+                                               void *data)
 {
     struct map_range_data *mr_data = data;
     struct domain *d = mr_data->d;
@@ -219,8 +220,8 @@ static int map_dt_irq_to_domain(const st
  * then we may need to perform additional mappings in order to make
  * the child resources available to domain 0.
  */
-static int map_device_children(const struct dt_device_node *dev,
-                               struct map_range_data *mr_data)
+static int __overlay_init map_device_children(const struct dt_device_node *dev,
+                                              struct map_range_data *mr_data)
 {
     if ( dt_device_type_is_equal(dev, "pci") )
     {
@@ -250,8 +251,10 @@ static int map_device_children(const str
  *  - Assign the device to the guest if it's protected by an IOMMU
  *  - Map the IRQs and iomem regions to DOM0
  */
-int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
-                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges)
+int __overlay_init handle_device(struct domain *d, struct dt_device_node *dev,
+                                 p2m_type_t p2mt,
+                                 struct rangeset *iomem_ranges,
+                                 struct rangeset *irq_ranges)
 {
     unsigned int naddr;
     unsigned int i;
--- a/xen/include/xen/dt-overlay.h
+++ b/xen/include/xen/dt-overlay.h
@@ -42,10 +42,18 @@ struct xen_sysctl_dt_overlay;
 struct xen_domctl_dt_overlay;
 
 #ifdef CONFIG_OVERLAY_DTB
+
+#define __overlay_init
+
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
 long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);
+
 #else
+
 #include <xen/errno.h>
+
+#define __overlay_init __init
+
 static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     return -EOPNOTSUPP;

