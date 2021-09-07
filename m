Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D014026D3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180746.327536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY1f-0002tt-A2; Tue, 07 Sep 2021 10:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180746.327536; Tue, 07 Sep 2021 10:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY1f-0002r8-5m; Tue, 07 Sep 2021 10:08:23 +0000
Received: by outflank-mailman (input) for mailman id 180746;
 Tue, 07 Sep 2021 10:08:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY1d-0002qr-IW
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:08:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86a685aa-0fc3-11ec-b0e1-12813bfff9fa;
 Tue, 07 Sep 2021 10:08:20 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-anK_6fk6M3OBQzdA10Izag-1; Tue, 07 Sep 2021 12:08:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 10:08:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:08:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Tue, 7 Sep 2021 10:08:16 +0000
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
X-Inumbo-ID: 86a685aa-0fc3-11ec-b0e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LnFayoVCN7CZqe8/7arRmIOlirGbN3OOPeviniwqFXQ=;
	b=grRqzC2ACmkqAqP0HE+2Hzjiur/5+ZXIf+rak4xTixfrB1FNS11FwNhIi5IWqnPVIh0VCm
	XTTdsncwES21Qt3x00Jhr+Vvths6CiCCiL4NGea6BjZ03U3iuyp9FQQiEAw/PhgFfkSs3c
	CVN9hMjKOwAfRB0hOr4H9if86dypWC8=
X-MC-Unique: anK_6fk6M3OBQzdA10Izag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0+xL0CiYwpR+SZ3j9oaPfsOv9j6cOlqC79ZwX5f5ElaKTPUueQPdyNQZFWX9tpCTZNcPk5TpnmeLbR1bVrF7Slv/815OzOS460uNu6j0dxJyrp18s4Tc+0yK9nvgABdL6j6aDOMjbYrsKPdkr7j5p3pesJCVndd7NjqoGSzPVno7PoX5P1ZjrUWI7PFAF+dRBj3NsipSLE394cM8t4IZOMsLhQuz30ZoAK1vmsAF2FLICfTRiJ/RmeevrpCCIsBLKGvgAl/mleMOvDkhaOTOyyNDISYxfzjxIIbx3XhwGXR798/Gz1Tww0UDEFTemRzrsBjjxQky4UcjE+wj/tq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LnFayoVCN7CZqe8/7arRmIOlirGbN3OOPeviniwqFXQ=;
 b=Ea9pNlvlxPmJRrBJKuUKdhKz7cr4B2d9WKCAbvEzqcdycgkAA+AgPKKkwmQ82BbdjE9VZ9aFzcjjctVvtZwDZwMicEyTK8U/HMakHCYbqTil367YGYR4B2VyJytNhX2vKGgfOQF/hoMsLpRbuKaeNfE/OsyetA1T6MKCChYJz0fHBAHl0SSmKgjhXlY3c/4wSq4CBAm9tWJOYa/0tsv3EaaNSQ+uy/u6s5Q+lUdsNMEJIIdl10LTteMWXc6RpG5x0OJsqrThTeblibhVafjHn32Ne1anS/nZkUp9USHAPNh4NmZQwv7Xb4kKRBhbmsj25o03DF3apbqA1i/E9lGglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/9] xen/x86: allow PVH Dom0 without XEN_PV=y
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Konrad Wilk <konrad.wilk@oracle.com>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <2254771e-68ff-e190-15b4-42ed92239712@suse.com>
Date: Tue, 7 Sep 2021 12:08:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c2d98cc-5199-4b44-8a24-08d971e7694b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB419188A18F250F0BDA5412B9B3D39@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gL9qw5b10QprkHYC3HkJ2vDJS3edQ1xwm1WhPxPxbAWJXJHUN9sTdnOlkkmx66Bm7FT8F0tsIrs22dFAnRl+6BPV4comZ2DnIcBlwTMXiadQtdvusUigfJhD1Y1IZfIO7LdTnaf7NTDD5hZwvOK5md6G9g2YbNlEE8Uhg+5ba8kh4jb4ftLH5Z2FyQnoBbZYbkX4ESOy2Ra4I5ukWBR7oHhUNd7qO+Px1Tz39FYgdSG0vaoA/UFjz7t0ctdHOmQR/Qmoc3zLIxmfeaA8H09j4hglcTAfCjAnL19MYeFdJaKJyMYVABmrOoUEVdr7FMMe9cZsRJJQ+1ZAl1erl/J6pVsUrAjEqKynLN6rsV1HeZj0nvV7aOOrUrL2IzsaLZu7bXFy2HRePjBJIJkOPGalRwx225fnLaiUYb8bbOKHvjMNewpmJbT8/SUIZOj1qtDiSibkkm8dBGFsk5WHukDLWCXrsopKzE8bi6LBit2RhBEcbQr9DoCgPqCwWPLsXlFdZL2AS9PXO6SDIpVB3s5m/JMFfYoyqC5zU9TPZIzZFLYsnG0Vib2TL2LfF9YFMPHiAh4ozNK8PnOyfRJ1vXuqUSJMRfVY+jyecdDVqKcdbs9B/WvmMRq20eTEei2jIoKFgb5C08IT/4UvF9vw3qxBjPHl1nAHrFGflVu+anKmltyQznuYiB1SVQxXuRCTX/U3CpvQf9AWaZb1mGwvZ7diODTeKH9iZrBk04xl0ScGjxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(86362001)(66946007)(26005)(31696002)(54906003)(186003)(5660300002)(8676002)(31686004)(2906002)(66556008)(66476007)(8936002)(4326008)(83380400001)(16576012)(2616005)(508600001)(6486002)(110136005)(956004)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNYbzFPUnk4ZTc1S1RNMzljMlFkZ2xVaGpwTlpiV0ZYQVYzMU9haGkrdGhB?=
 =?utf-8?B?ZU1rSWxDWXRFWEhJcm03MFhCa0ZpYVExWWFVbk9yZUJocDU1MFUvZkxWM2dh?=
 =?utf-8?B?Mm50N3lqcTRYUnVsOEtmS2x3MFRqU29xd1VZQ2l4NWhIbU5sR0g5b1BjcGhG?=
 =?utf-8?B?RTRDM2ltakNmeTYwRlh2ZzBMYm1FUkUxL2o3WDVnSnp4aFJDYnRPMGFXQVFq?=
 =?utf-8?B?ZytOeGtsUFpiRnVSc0dGVzhIcDV2UlJ4LzBTcDNDa3pnQlloanllWGZ4ci9U?=
 =?utf-8?B?SVVSYXZyenFvN1hJa1NNRzJXS3JvNHlHR2JramtwZi9pUGdObHQwVHBhakhx?=
 =?utf-8?B?a3dXa2RueUV1Z25pYXllRDJXZVphUE8yQnV3NGh1YjBGUzNPQVl4bTBuOHVv?=
 =?utf-8?B?bitWcytEWHgreEN1dVF0L1ZmWFc1cE0wNmVmZXhzRGtJYmMwc2hMeGVBVDJn?=
 =?utf-8?B?M05SZ3drQlBQandKNDUwTUtIeE52L0tJQUJvcHkvWDNtL0xvSzZiM2gwQ2Vp?=
 =?utf-8?B?ZVVOS0RKTlQwQVpZQXg4U3NLbmJTa0EwaGNEdjFiNGFPQlNDQnNsS3Y1S0dq?=
 =?utf-8?B?QkJYbGhjWFI3R0FBUCsvbjNjWUlMQVBoOExhTWVNOEtYVnk2cTdUZktXem1T?=
 =?utf-8?B?cHZwU0dCKzVoZHhLSlFubGpRemlkMXNaNjFONmhnRlFLM0ZJU01QVXdKVHV1?=
 =?utf-8?B?cyt6V2p6eElwVHAyMUY0TEpIQkNBeEdqeEljYVFsenhka1Z4VGhaSWNnanZ5?=
 =?utf-8?B?S041cFF2UWorTFVReE1lRW9hSTlKQUhHenI1cUdCSnNRZ291eHhHM3NDb2lu?=
 =?utf-8?B?bG5YOFN2Qit0NHlNczEvVDRWbHJWckY5TTRtM1pNb1BHQUJjU2hpZUEzUFFZ?=
 =?utf-8?B?VjhNRUtuNzVNTURscU0rWlZDeVNzSVNrQjF2KzE5dXdCTTQ3bytHUTJDaHRF?=
 =?utf-8?B?TjhDandTT0pjTGUwWE5DblFtQ1VEY2FJQVF1RE1LaWtZNDZxZ3IyaTZZVWJx?=
 =?utf-8?B?N2J1Z3c4dEh2LzE2azVqVmg1YVRLQVJPcEY2eHZlc0hKTyt0aksxakZRbkpJ?=
 =?utf-8?B?ZndXU0xjNkFablVHZ2x0bVBnaGlZOGZTYk5DWTZaejdUallHYnlpcElueXBi?=
 =?utf-8?B?TSthK2tpNEFJUStjZVBkN2puRHhsUzMxK29HdWV6djhhdGpMb2VyNDhTU1hu?=
 =?utf-8?B?dHhUUmtHa3Nnd2kweXJqbjFteFBYdS9rcHkxUnd6ZGcvQnZRaUloYXN6TDBn?=
 =?utf-8?B?czhqa2VxSzhxWWE0OG15TytBdmdxcjZiN3JmWHZTNy9RMXlibnBJbWNYZTZM?=
 =?utf-8?B?WnBDSzYrVXpNcEpORlQyYldPaU1JeklkM0JaSmV6VFJDSUxMRkRZam9sZnN1?=
 =?utf-8?B?eUkxUGNhTDdrU1RERjB3alhZTCtIYkp0VDVOdS9QOXF0aXlrTXNnbGE5Zjkr?=
 =?utf-8?B?U0tqUG90aTd0bU5PSGk3VlNNczl0Wmw3UEh2WEFML3Zua1VHQkV0MTlYbEdI?=
 =?utf-8?B?YWVWeXM2RGR2dXZDVnZYZ2d6b0VaR0hoQTBCV2NFUlNEVjJxNk91ZUVjaTI1?=
 =?utf-8?B?SGx2ZHFZQ21ndHZPMFEzSk96N2xSUzN0MmUxU0JZamxLQ3FNN012Y3dxSTZz?=
 =?utf-8?B?dURXUDA0bHJub1RBRHVpYkN0WEVvQ3VuT3JsOUpJSDR6VjNGdHF3RGlkNld0?=
 =?utf-8?B?dlFxMzQ5UWxLWThPRXJWTmRLOEpMajN6bVFNRjBJMWNLWWlCM2N1bmREUGxh?=
 =?utf-8?Q?DVphMp1yCy/B2xaqgdE9cJtifskiwCC/hBZCNc8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2d98cc-5199-4b44-8a24-08d971e7694b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:08:16.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOfTzLFt4eMzjhOo5QNWWlhVrkX29HqCvYHJBxSwYsoLR3PfEc8mYNGJUCUYEw2BuRA7cOeB2dAyYoOdA0nsJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

Decouple XEN_DOM0 from XEN_PV, converting some existing uses of XEN_DOM0
to a new XEN_PV_DOM0. (I'm not convinced all are really / should really
be PV-specific, but for starters I've tried to be conservative.)

For PVH Dom0 the hypervisor populates MADT with only x2APIC entries, so
without x2APIC support enabled in the kernel things aren't going to work
very well. (As opposed, DomU-s would only ever see LAPIC entries in MADT
as of now.) Note that this then requires PVH Dom0 to be 64-bit, as
X86_X2APIC depends on X86_64.

In the course of this xen_running_on_version_or_later() needs to be
available more broadly. Move it from a PV-specific to a generic file,
considering that what it does isn't really PV-specific at all anyway.

Note that xen/interface/version.h cannot be included on its own; in
enlighten.c, which uses SCHEDOP_* anyway, include xen/interface/sched.h
first to resolve the apparently sole missing type (xen_ulong_t).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For drivers/xen/pci.c it's not clear to me what the intentions are: On
one hand I would think this is needed in PVH as well (especially for
hotplugged devices), yet otoh the hypervisor's hvm_physdev_op() doesn't
let the respective physdev-ops through. As a result with how I have
things, a lot of "Failed to add - passthrough or MSI/MSI-X might fail!"
can be observed.

For arch/x86/xen/vga.c I think it really is needed for PVH Dom0 as well,
except that the needed data doesn't get supplied yet by the hypervisor
afaict.

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -10,6 +10,8 @@
 
 #include <xen/xen.h>
 #include <xen/features.h>
+#include <xen/interface/sched.h>
+#include <xen/interface/version.h>
 #include <xen/page.h>
 
 #include <asm/xen/hypercall.h>
@@ -257,6 +259,21 @@ int xen_vcpu_setup(int cpu)
 	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
 }
 
+/* Check if running on Xen version (major, minor) or later */
+bool xen_running_on_version_or_later(unsigned int major, unsigned int minor)
+{
+	unsigned int version;
+
+	if (!xen_domain())
+		return false;
+
+	version = HYPERVISOR_xen_version(XENVER_version, NULL);
+	if ((((version >> 16) == major) && ((version & 0xffff) >= minor)) ||
+		((version >> 16) > major))
+		return true;
+	return false;
+}
+
 void xen_reboot(int reason)
 {
 	struct sched_shutdown r = { .reason = reason };
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -142,22 +142,6 @@ static void __init xen_pv_guest_late_ini
 #endif
 }
 
-/* Check if running on Xen version (major, minor) or later */
-bool
-xen_running_on_version_or_later(unsigned int major, unsigned int minor)
-{
-	unsigned int version;
-
-	if (!xen_domain())
-		return false;
-
-	version = HYPERVISOR_xen_version(XENVER_version, NULL);
-	if ((((version >> 16) == major) && ((version & 0xffff) >= minor)) ||
-		((version >> 16) > major))
-		return true;
-	return false;
-}
-
 static __read_mostly unsigned int cpuid_leaf5_ecx_val;
 static __read_mostly unsigned int cpuid_leaf5_edx_val;
 
--- a/arch/x86/include/asm/xen/pci.h
+++ b/arch/x86/include/asm/xen/pci.h
@@ -14,16 +14,19 @@ static inline int pci_xen_hvm_init(void)
 	return -1;
 }
 #endif
-#if defined(CONFIG_XEN_DOM0)
+#ifdef CONFIG_XEN_PV_DOM0
 int __init pci_xen_initial_domain(void);
-int xen_find_device_domain_owner(struct pci_dev *dev);
-int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
-int xen_unregister_device_domain_owner(struct pci_dev *dev);
 #else
 static inline int __init pci_xen_initial_domain(void)
 {
 	return -1;
 }
+#endif
+#ifdef CONFIG_XEN_DOM0
+int xen_find_device_domain_owner(struct pci_dev *dev);
+int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
+int xen_unregister_device_domain_owner(struct pci_dev *dev);
+#else
 static inline int xen_find_device_domain_owner(struct pci_dev *dev)
 {
 	return -1;
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -113,7 +113,7 @@ static int acpi_register_gsi_xen_hvm(str
 				 false /* no mapping of GSI to PIRQ */);
 }
 
-#ifdef CONFIG_XEN_DOM0
+#ifdef CONFIG_XEN_PV_DOM0
 static int xen_register_gsi(u32 gsi, int triggering, int polarity)
 {
 	int rc, irq;
@@ -261,7 +261,7 @@ error:
 	return irq;
 }
 
-#ifdef CONFIG_XEN_DOM0
+#ifdef CONFIG_XEN_PV_DOM0
 static bool __read_mostly pci_seg_supported = true;
 
 static int xen_initdom_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
@@ -375,10 +375,10 @@ static void xen_initdom_restore_msi_irqs
 		WARN(ret && ret != -ENOSYS, "restore_msi -> %d\n", ret);
 	}
 }
-#else /* CONFIG_XEN_DOM0 */
+#else /* CONFIG_XEN_PV_DOM0 */
 #define xen_initdom_setup_msi_irqs	NULL
 #define xen_initdom_restore_msi_irqs	NULL
-#endif /* !CONFIG_XEN_DOM0 */
+#endif /* !CONFIG_XEN_PV_DOM0 */
 
 static void xen_teardown_msi_irqs(struct pci_dev *dev)
 {
@@ -555,7 +555,7 @@ int __init pci_xen_hvm_init(void)
 	return 0;
 }
 
-#ifdef CONFIG_XEN_DOM0
+#ifdef CONFIG_XEN_PV_DOM0
 int __init pci_xen_initial_domain(void)
 {
 	int irq;
@@ -583,6 +583,9 @@ int __init pci_xen_initial_domain(void)
 	}
 	return 0;
 }
+#endif
+
+#ifdef CONFIG_XEN_DOM0
 
 struct xen_device_domain_owner {
 	domid_t domain;
@@ -656,4 +659,4 @@ int xen_unregister_device_domain_owner(s
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
-#endif
+#endif /* CONFIG_XEN_DOM0 */
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -43,13 +43,9 @@ config XEN_PV_SMP
 	def_bool y
 	depends on XEN_PV && SMP
 
-config XEN_DOM0
-	bool "Xen PV Dom0 support"
-	default y
-	depends on XEN_PV && PCI_XEN && SWIOTLB_XEN
-	depends on X86_IO_APIC && ACPI && PCI
-	help
-	  Support running as a Xen PV Dom0 guest.
+config XEN_PV_DOM0
+	def_bool y
+	depends on XEN_PV && XEN_DOM0
 
 config XEN_PVHVM
 	def_bool y
@@ -86,3 +82,12 @@ config XEN_PVH
 	def_bool n
 	help
 	  Support for running as a Xen PVH guest.
+
+config XEN_DOM0
+	bool "Xen Dom0 support"
+	default XEN_PV
+	depends on (XEN_PV && SWIOTLB_XEN) || (XEN_PVH && X86_64)
+	depends on X86_IO_APIC && ACPI && PCI
+	select X86_X2APIC if XEN_PVH && X86_64
+	help
+	  Support running as a Xen Dom0 guest.
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -45,7 +45,7 @@ obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinl
 
 obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
 
-obj-$(CONFIG_XEN_DOM0)		+= vga.o
+obj-$(CONFIG_XEN_PV_DOM0)	+= vga.o
 
 obj-$(CONFIG_SWIOTLB_XEN)	+= pci-swiotlb-xen.o
 
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -109,7 +109,7 @@ static inline void xen_uninit_lock_cpu(i
 
 struct dom0_vga_console_info;
 
-#ifdef CONFIG_XEN_DOM0
+#ifdef CONFIG_XEN_PV_DOM0
 void __init xen_init_vga(const struct dom0_vga_console_info *, size_t size);
 #else
 static inline void __init xen_init_vga(const struct dom0_vga_console_info *info,
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -240,7 +240,7 @@ config XEN_PRIVCMD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
@@ -258,7 +258,7 @@ config XEN_ACPI_PROCESSOR
 
 config XEN_MCE_LOG
 	bool "Xen platform mcelog"
-	depends on XEN_DOM0 && X86_MCE
+	depends on XEN_PV_DOM0 && X86_MCE
 	help
 	  Allow kernel fetching MCE error from Xen platform and
 	  converting it into Linux mcelog format for mcelog tools


