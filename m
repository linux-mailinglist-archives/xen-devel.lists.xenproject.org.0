Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E049541D984
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199798.354068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVuzj-00033u-UU; Thu, 30 Sep 2021 12:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199798.354068; Thu, 30 Sep 2021 12:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVuzj-00030v-Qu; Thu, 30 Sep 2021 12:16:59 +0000
Received: by outflank-mailman (input) for mailman id 199798;
 Thu, 30 Sep 2021 12:16:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVuzi-00030c-JQ
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:16:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b708440-21e8-11ec-bd49-12813bfff9fa;
 Thu, 30 Sep 2021 12:16:53 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-plxmdjIENIahOSP6ObybZg-1;
 Thu, 30 Sep 2021 14:16:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 12:16:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:16:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 30 Sep 2021 12:16:48 +0000
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
X-Inumbo-ID: 4b708440-21e8-11ec-bd49-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNbam7aHstMlEKiiTfzq0joC0jNz1ZNdGuw3sodQCjU=;
	b=lljORLsE7SYxXCzpMIugjP2GJsQGwymLM4DdyY9IgVZmygPXI9NgTADJmf0PqyVoVRUDOH
	VAXG2EXiHuSKPdAAkELwLt9Scm9Jx4aSLTuqua7FfIYY4dWOesIOf6M6Q5X5xvuTB8BDyK
	QEYp6cHZ7fmCQ/lOaE5wkKFydiNO48Q=
X-MC-Unique: plxmdjIENIahOSP6ObybZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ/I+dp1Z9WJ3fIl4h6Spmx2nJRf676c6UcosbNQ8td/WaVXqVnBMhQmZ7QAn5hveqLhuTVthVxfq4IFBAD6URoXWF9+6Cz9gBvHvvJvcGe0rSbxNsssYkdHGbD7cWLCrUHqA9Q9v+BbzyXPXahz57z1GoEiyTKWS+ONmUiqpALMnYelEyXWo8YUPiih9p7jMBsIcGkmC+xBbgrXD0fvCv5MSI93m4XxVY7t42kNSc2I+N8+cxnxyxIdHduNMc43QN4dlJhra2zIc8V5uZpWgGyjXH4nGjjjIp387m6NoV+d79/N42qFl8qtjaYg7GUesiwm/dJLDmTjMf7SQi1nLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZNbam7aHstMlEKiiTfzq0joC0jNz1ZNdGuw3sodQCjU=;
 b=h3sA93cXpNudaLmvVd7hSEJgjwY8ozwrW2DXZsokppqb/aHK5yVHYtSaRvSi1iudNixFGknvYbZlf9btki3zdMqxb4avRLooyvvrh9X3fZlxHGrx1Q4iViTGi4FUxclzs+VS5DlvWW7E6LWkoU1rVOPftS1junoOIttcPYhom62v0idUGFNFLTTKtUFigyXi1ulu4gJ6p7K1Z60kNn7b1LgrwRaM82uQUamGNVm4fTvEJQr8W66VGDoN2yEs1HYbFjuhUmCzOv+DmOGGs6EjOZuD4C538WK0M+pQMUdL+86Kzvd8HIbEC7USH7riWgH+4I/mUys3pLG/PKpOoJNfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 2/9] xen/x86: allow PVH Dom0 without XEN_PV=y
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <983bb72f-53df-b6af-14bd-5e088bd06a08@suse.com>
Date: Thu, 30 Sep 2021 14:16:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c708c28-f89e-4fab-6d84-08d9840c2dc1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64798659F13EA82CE2087A54B3AA9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a+j/3DJ6jGTOR2Y+9eiOGVDBHEbBm0BcTTqXZOWS7N46qGTXwC3++5VoDOMo9kGUbckiOKATOkbvhbVfjgAyz/WgftlpOMHRBIQiIhAvAxNrYJyH76V/GatH1I9Wolx461Ed4oIEE4oYpL19WOxLeEl3yej/HQEvE2/twbzHTLCVk3nxkyXN+OumzxGCXMTwhPQWpl4Oc0NWxYDsHHc7jdomWReqUct2+GfQU1hOpHCv5KpU+jxOIRJpPcSxonfdxkt1O69ibGZBgJbaDHREfGsFy84mGm6jifWAr1o2RRghyPWDCF4S/HLgIXFIgC0hGT4oay9Biv3ZRsWnj18QD/9KqhDr28hlRYAJ4m1HGfgc/FnM/qNJay+GckAV1mjLOx6IeYGm0VKTHnZYmEe+PQzo03I6vmRNAY0/l3IfC91+OAtvZkT8tvncXzvHU2qUekRITi9LxvrLqgQ1mKdpvXzQleLm0MMbSfarK0VvWm3/nl0yhM7TdFwW/vWmccFDgYobkZ4bhPZDNCsSrf+HLng/rnyhs4SMBhrwaI7hvn47iPEAmRWMp2KwSkdr2XSOMibjpDqBcoxYngaJFrH+zgx9msrDYtIdv52IeG9qNs0ompnLbhexbhGnsWk7iAZr2HXogOPGbtS4xgUgjoPUVvmkOiirIyZIRyq/9aQ0VruSgKIdoSfiJLj/KPa3eLSeeY/pO124NzMTSmUuCuJEUnKcTZw06WDhSkMJmOxWVz5+b6SPWR47jbWRjMwhzCv3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(86362001)(26005)(16576012)(508600001)(316002)(956004)(186003)(6486002)(8936002)(31686004)(54906003)(4326008)(83380400001)(110136005)(38100700002)(2616005)(66946007)(31696002)(66476007)(66556008)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QitHQmZUSHgzSyswM0kySzAvcHJGWXZEOFFnSjlHWUlRM1F2ZFhRcnZ0SGhv?=
 =?utf-8?B?ajF5NU9rZllxemZxRUlnUVZJOTlUeEZQeDBhQVZPUjFVWHBRK3N2UzJ1ODdi?=
 =?utf-8?B?bk9IL28wOG1xa0dCVHorOWxzZ1JYUDBPamdkSUUzQW55ZmlYUzRtTkc4dHZ4?=
 =?utf-8?B?MUlCbElBUCtMSkdVcFlTN0oxNHhuVC9ON29MNnFvYVNJT2tPWUxyeWRRZHBu?=
 =?utf-8?B?ZFBoRW5zSTNRRlF1RXQ4OVlLaVhONWw5V3J3cjNxT1NWYnQyd0pMK3RjRWI4?=
 =?utf-8?B?RHgxRWF3cWJQc2ZtdlNPYlhLMElQbTRVSHc4cDF4ZGtETWMrR0FEdFZuM1Iw?=
 =?utf-8?B?YnVpV0toU1hHK1lHb3U4TjN2YkFEdmc3dzljNVE0RXZ6MjI3TGxkbGZqbzhW?=
 =?utf-8?B?WldFMUZlVVl3dEkxN0tVb0FUK25CTUM2SDhaQkpheW1NaVNzOThBQVhGbG9j?=
 =?utf-8?B?K0hJVHh3b04xaVNTVDhSZFVOL2NLZklsZmJWSmtiemtJZ1VjajdIMnA1dUxE?=
 =?utf-8?B?cHdlTHo0cnVZLzgrYlZoczRmMDdLdHE4c3pyd0xmWjdtSUxzZUR3WDRvSzBj?=
 =?utf-8?B?OG5taS9pdEoxVkVVUEg1Z09iRjRJU0Y1SUJFdDVqejk2c1M1eGhtdUNnYmpy?=
 =?utf-8?B?U3FEbDZudThlNm9nRVpFeXBPcWN5RWhSNWFHaDV4UWhQRi9ZRG1RN0tLcWt6?=
 =?utf-8?B?Tk5EN09IeWNDZHpBV0lTRWZwc2M2VWdtMmpjUmVVVmhhbkl6UlRNSUx0S0pT?=
 =?utf-8?B?NDlOalF2b2xmeStFYzZicEwyREhuckZMRXpWaGxjRnJ1Q2dDelh3aEl4UVBk?=
 =?utf-8?B?alZUazdXOWVEdGZZVVZ0SzMzN0hLdHVNaVAzWEVPQ09rdGdHTVRnd1BJZGgw?=
 =?utf-8?B?Q2xnMEtKcGdBb3dLZmNaSzYwWmFIK1kvQUQzUGJZaVQ5RzVTZ3JlNytNbUJx?=
 =?utf-8?B?VzgrS1hUS2NJL2MwTDFXYjh4cFBlL2UwTjI3NVhsaTRHbkROY3VHSndjSFNC?=
 =?utf-8?B?VXJnWWpUMFNGbE1YVWord1hNbFNGSHkzeHNiRWdvWTEwZGxkNWhqaThuY29P?=
 =?utf-8?B?eG03M29yRTF6d2NoMEJ4MVpGYzNCcVlKbHk5YitqaEsvMTlFNmZ6QUM5RDg3?=
 =?utf-8?B?VVVYZ01ubVpTYzdFSUgzb1Y5QkR4NUljcSsvVnFKVjhXbVJ4K293cGk1TVFn?=
 =?utf-8?B?SjY2eWZXemNWK0xkR1ZFcXhPUmpVY2llWll1QmtHb2VHZ3lCZEE1K3VxSVZI?=
 =?utf-8?B?K0djUVdtckJFelBqZ0JwZ204UkRETEg3ZzcxSjNwMWNXeGFvZk5lUnNlM0Iv?=
 =?utf-8?B?WElkdDRzcG9oYTM0Rk1tU3BLaytINjZtNW5nNDFuVElBb3VXZmlSeHlxRnpY?=
 =?utf-8?B?NDhOOURWeVAvZUdGbEtaZ1U0dTRDVGo0VzZIVGFQcndvdmdHM3oxSlZiRE00?=
 =?utf-8?B?aThqdFZoK0hXNmptUFBsZldwVk5YaXJtWGVLM2JDSWlxbG9GcTBzTGxTdmtF?=
 =?utf-8?B?NXp0ZitsalhHWjNtK2FqK3c5T3d6T0JnYVlocXVPL2Zpa2VtL1ROMHRqaW96?=
 =?utf-8?B?MG05TDE3UkI1ejRxL0s0ZzRyQWU4SnliSTJXZzJKc0k4am82NTdGdWR1eXd1?=
 =?utf-8?B?ejZySUhuUkxWSERmbzdISFlCdktmNTVLNytCL3ZKMWNkODU4VXV3NTFsL0tB?=
 =?utf-8?B?dzg3VTBXZ2JBWU5NaUhHc3dCT2tlajZJVmFaS3NwWTBzUG05STNRLzhyZU1G?=
 =?utf-8?Q?3bmiWeQ3X0KzGF568NFvPQWm3ttFWK2eK9K2G+U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c708c28-f89e-4fab-6d84-08d9840c2dc1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:16:49.2990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGcjr+3Rb8WDBmwm6nxsxx31sut4GUTuoMIelbKcNtMkFdd66TxVxTELLD1QJnhECL/7kJMFzTQobPpwoFF76g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

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
Reviewed-by: Juergen Gross <jgross@suse.com>

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
@@ -241,7 +241,7 @@ config XEN_PRIVCMD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
@@ -259,7 +259,7 @@ config XEN_ACPI_PROCESSOR
 
 config XEN_MCE_LOG
 	bool "Xen platform mcelog"
-	depends on XEN_DOM0 && X86_MCE
+	depends on XEN_PV_DOM0 && X86_MCE
 	help
 	  Allow kernel fetching MCE error from Xen platform and
 	  converting it into Linux mcelog format for mcelog tools


