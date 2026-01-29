Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPSNN/pde2kdEQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:17:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52090B04CB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216466.1526414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRtq-0006QH-Og; Thu, 29 Jan 2026 13:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216466.1526414; Thu, 29 Jan 2026 13:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRtq-0006O6-L1; Thu, 29 Jan 2026 13:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1216466;
 Thu, 29 Jan 2026 13:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlRnE-00038i-DI
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:10:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7478094-fd13-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 14:10:37 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so946701f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 05:10:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132303fsm14536283f8f.36.2026.01.29.05.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 05:10:36 -0800 (PST)
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
X-Inumbo-ID: e7478094-fd13-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769692237; x=1770297037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv0OvyCcYzBuokmRIqcrOcEo5thGITFjrVvRj+Q4tm4=;
        b=NlAg3sw3HbqeIbmpm19W2MZRsveJaTpDi0QEbhUVd3ViSsXbuO7qqg4aSqFbL7Yqg9
         GzQb6sSb6eX2/rr2Jh+g1/tlCRtr3z8pNvNud4snS1SDyQk5844cryHGON7YuU3h8VgS
         8dYTtqfiwk+I/muEGVhRL1TwwlXeckuebtbFMg2iTcVcfoECRoaAbAA6O++zj2GonDqu
         ekCMm9XlIMroOUyHkztkXMyovBbciU55yMGdkTHNHb1RdQpuPvTeb6V0g5e5snrQhJli
         oCOohy/5sUHUdIs08jaAGhuu1N31lFuyovwDlg6SSq/mfUhUxh6w+omtQGQlMB+592AO
         hpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769692237; x=1770297037;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv0OvyCcYzBuokmRIqcrOcEo5thGITFjrVvRj+Q4tm4=;
        b=bP/W+/REAJIPU7TEUOi7k1Bqtr5WX5zYMcCujeC7FpOcHMqdgxaeYFwxhMZ4WiIK5q
         aF0y4EFIpf0Qq1+6kFiE/XevueMiMOd+dtL1jeLyOywv6MAw1/3fxVDy5+FWA2b6ap+e
         6KIRoIj12cfauIJT/oz2xQir/CblbOO8wNBAmeFn7IBIBDbnmxC0xCL5dJMaP4KRgqVx
         QThJzLP9x0KIHcvpyKOMeOx+5izJWuhY/sBsaju3Q+JhdmfAhEcW7gDTZBL5XlCEod3h
         qpwmAh2BiYaHDWdMTMrzH2/+NyZrPbkWZitxFG0ERtgVqLsez5uTBHwBMangYqlfEn65
         RaWg==
X-Gm-Message-State: AOJu0Yw6CbEbzS3BB0CLAvWU7n6ZtvieE4S8wQ++5/Zjnil+71/SLn/E
	dOQwb45kHkWR6+y012wSK5jbkMsv2rOn+19PISw6lN0uQvIzur4c8xG9UAxMZiUQyh7b8AeWR57
	DAWM=
X-Gm-Gg: AZuq6aJ2cSpTVP+SFs5xHu6wOCMsoQX3bz1WI+0bRCdOrveGf0shfzI3qMgRSFfP6/I
	sKSA3EJStAs5i2zD7SLn1LOwTSCU7TcVz3pMaSICKrSs6Tt9zDbtl7JWqNEqRfGRgO8Ce96P9eu
	pbc4JTXSdbSSd5EZOjDT8qFwUUauwOU+ZseNT8cX45hqjxH+NKesADz/xeWLZHp5Rkrh0oPQcWe
	io/bRfF8KQU3iGMaI2jTJhno23tbQ+MDUN6kXya3JR6WCVh9NTjj1qy9m8Ztp9WnGs/VYv2JoZN
	cpQ7lw3T5RPdr345ussDCGoVffK0LF+lOW8CmalZyhRxVArY2AULS1cv63vu5aWJexYB9hbBauX
	kXGF25waL8hIdMEBhqSKouSw8RdqXYlQnhohXfgMNc+h6c8ZDmrG0f521tEnPVMcQBEQULggdxu
	CDd2Bo3Ol8H0vggM8JOtsS51I9Qatf3ayECYpIfxpibtsOxE/aEDcLbf66TfvQEWzNWWO/dIHSp
	Pn0DJUM6cgStQ==
X-Received: by 2002:a05:6000:2082:b0:435:a9c9:159 with SMTP id ffacd0b85a97d-435dd05aba3mr12142676f8f.18.1769692237050;
        Thu, 29 Jan 2026 05:10:37 -0800 (PST)
Message-ID: <d6f1c261-5af7-4fcd-b95f-af8baa67ba64@suse.com>
Date: Thu, 29 Jan 2026 14:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/6] vPCI: re-init extended-capability lists when MMCFG
 availability changed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
Content-Language: en-US
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
In-Reply-To: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 52090B04CB
X-Rspamd-Action: no action

When Dom0 informs up about MMCFG usability, this may change whether
extended capabilities are available (accessible) for devices. Zap what
might be on record, and re-initialize the list.

No synchronization is added for the case where devices may already be in
use. That'll need sorting when (a) DomU support was added and (b) DomU-s
may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
vpci_reinit_ext_capability_list()'s return value isn't checked, as it
doesn't feel quite right to fail the hypercall because of this. At the
same time it also doesn't feel quite right to have the function return
"void". Thoughts?
---
v3: New.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -8,6 +8,8 @@
 #include <xen/guest_access.h>
 #include <xen/iocap.h>
 #include <xen/serial.h>
+#include <xen/vpci.h>
+
 #include <asm/current.h>
 #include <asm/io_apic.h>
 #include <asm/msi.h>
@@ -169,7 +171,10 @@ int cf_check physdev_check_pci_extcfg(st
 
     ASSERT(pdev->seg == info->segment);
     if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
+    {
         pci_check_extcfg(pdev);
+        vpci_reinit_ext_capability_list(pdev);
+    }
 
     return 0;
 }
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -869,6 +869,18 @@ static int vpci_init_ext_capability_list
     return 0;
 }
 
+int vpci_reinit_ext_capability_list(const struct pci_dev *pdev)
+{
+    if ( !pdev->vpci )
+        return 0;
+
+    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
+                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
+        ASSERT_UNREACHABLE();
+
+    return vpci_init_ext_capability_list(pdev);
+}
+
 int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -45,6 +45,7 @@ typedef struct {
     REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
 
 int __must_check vpci_init_header(struct pci_dev *pdev);
+int vpci_reinit_ext_capability_list(const struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
@@ -300,6 +301,11 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, uns
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
 
+static inline int vpci_reinit_ext_capability_list(const struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline int vpci_assign_device(struct pci_dev *pdev)
 {
     return 0;


