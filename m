Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701424026EA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180791.327603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY4s-0007aG-Ey; Tue, 07 Sep 2021 10:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180791.327603; Tue, 07 Sep 2021 10:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY4s-0007Ws-9p; Tue, 07 Sep 2021 10:11:42 +0000
Received: by outflank-mailman (input) for mailman id 180791;
 Tue, 07 Sep 2021 10:11:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY4r-0007VE-Ff
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:11:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec5d5787-3209-4ed2-98a3-fcdd27580d25;
 Tue, 07 Sep 2021 10:11:40 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-Y5WVL8bmO0iESB8OdgIVFw-2;
 Tue, 07 Sep 2021 12:11:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 10:11:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:11:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0236.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 10:11:36 +0000
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
X-Inumbo-ID: ec5d5787-3209-4ed2-98a3-fcdd27580d25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRrXpYXcTwwQ057nr8ZyUKJTAVb8uMCfo1R65cMzIyc=;
	b=Zqfh4NKKZ/TdOyE5seIUSid8v/GFn51H5z+NAjHdeSpT9v7b1Mnmj5ikxJi1JKrSevU4vg
	UbxVqvXNp7UP0TiDGDCU2KS6xEYxo3AD24Sagzb1C3j5ewYZ6Sb5ndGwqkPPEt7r4dAH7Y
	eHfgm4TODmS5wEVK2Eve9Rfa4VQyGVk=
X-MC-Unique: Y5WVL8bmO0iESB8OdgIVFw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAcFQj8m378SmU1rK/4XO+ZvKIIJDUJ7hqH+UezJQm4UrmFmCcXDws8WZs+N9dh6MyQ01SE3yEwMGGGnHkMTqihik2C+pGk0RUPQpSZP5k/X4KJYMCby3PGyE+Rw8Zd5cdAv3zT3Pf+QfBY7zkmy7yREHNQA+KEuZuhe5GFS6hR31h/wrEUp6nZaVCAooLBBIw614dJ9BabmdoF7RD1WCwS++HxImjrpuL8GauEtBUPMnMpRnZW+V7mUZlbgchMii4Z6SdUvhSEsppq2GGXJU1crEpCto/TjGjoHrYgNHl74nDmRChbQhT2na9Xo/NlhmMTBdNnmdYYn5jO6h1+S7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RRrXpYXcTwwQ057nr8ZyUKJTAVb8uMCfo1R65cMzIyc=;
 b=DIql3QeGkH+9x2BGcrQqBIPaNPny4Q3YwckzAnQxO1zzO8gYDNoXTUhdfQtuqI/v+mIfBmQKFPCqBvc3m7zq8nV/dzOTuL/BQdEsv4DcgLbAYzxgDN6IhpOFtUCuX4ASt9vHCyO9105GpSGudwLXKNCQeGcg+JoyXGsbHutbITGodHUq+0lc+4y2JLdOAh/1BqMqqW9LlfHAf+zACU/xcnUG3PU2E1D0ecXjdrTpNwNOXdy5N0nY6MbUNaldtG4XNWLdtbz8RbL0jNLvwMR48t0HHPn6Upo25qUOnSK0gp0KSQgVqPdOTOdaMdSC9VZiBkYBR1spiq6/AbmV2bmuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
Date: Tue, 7 Sep 2021 12:11:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0236.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ca94ea6-dec4-4502-a200-08d971e7e046
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447E6ECE13AB2AD88462014B3D39@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tD+7OUJlsPyQgQWrjEg/VzzGUbE+OtklIEnab7QZzi6SHIjoiuaw6HyBjH9KPMKF2+BepxdfONPto1kdUfqVJrO7T41UKL38HnZf1oAmiQAX/tezGmXS0Q+oEsto7oDXyf5CXDQmDLVi4sztXKPUoreWVRRL/qdtMJATDUFqyP9XAFQugU1FZ1EDIizi3ZPVIsy3Hn+ykACa55inX16DW2zdJe58vUSP79PIjavHn5gwjDr+w6G25fbTH6dtNieIzUDjRQ7gmEKdlYC7s/f0Ki69HzqgTk2LNH0gzYmqQqYmWm0p8IHLQZJEO6fayJNSZ9uSCFTHedFOaEy5IEPWjYL8P4/AgXnNyROhjH2CxebONG0L117ruWSmaohNXxbhYY/9dSfmB9ctyM3myF2z/HWLQgLgPWH4O+xSSgSc+5ZsAFqAXD1kyKwaMq3dRtupYtpFIiO9wlmerkK3IwUMlXDNZer7DExvpAZ/2mRE2IBNVA2j2hO60w6xpmmr043N/WbPXwJ2+UfbV/oTIPYYhgfFDEWdnEXrEYWu+P61JotI+jqPjRUilCTIFBIE+Cdw2ndb8mWlonKFpyrevjKcUGVq6pvzz1ZWdFnHm29MaFGCJn2jUdOYCifV7CINu9/w68sncu/CoSwKe6bkrpIcTeWLJF9sKz1zp50HJ03BFmKlud6JCTrVgLJ8uzwZJO+KrXdGD4WppE9KxG3azkVNREpP+DjUnLt4pweRPPbzcPDj/2m/JmykSud1I1XHY6ChqZGxKX7yS6LGdl78vRHMPcmp12+YtqPS8wDd9vlrlMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(26005)(31686004)(5660300002)(186003)(2616005)(2906002)(31696002)(83380400001)(54906003)(956004)(4326008)(8676002)(86362001)(316002)(38100700002)(110136005)(6486002)(16576012)(478600001)(66476007)(66556008)(8936002)(66946007)(36756003)(52103002)(158003001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVNFSkM0V0I5T1pCRGt2WGdRWit5dmRIdHlmUm80cCtQcTBlY3dZT0hWMkkx?=
 =?utf-8?B?a0xEQ3NlKzM4OWh4VVpyZnFraGhpaUN5UkdTNU5XT2h4Qi8zRm9YQjR2aDBL?=
 =?utf-8?B?ejJ3cGFxM0wzcVZjc0RpeStSY2I3TFRielM1djZzeEhlVit0R09QVnlqUXVF?=
 =?utf-8?B?eXc4TTUxWTRNSWNYSHgzYVZLeGx4ck1wOGtXTGkwb2M3VVJoRjRNT0cvTFNo?=
 =?utf-8?B?MGEyMlcwb2ZrbVRueHJHN1ZqTFZGdUlLa1QwS09sVXJqQWFkZ3dBMVlvQ1dZ?=
 =?utf-8?B?MlpDejNRakdLK3BCZlY0eEVWVzhYeUxZNzI5WkFwWUsxWnJuM29jUVdTRFB5?=
 =?utf-8?B?WDdHR2M4NmVZcnNReU8yS3VSN3ZiZmROY3FMNXRud3ZzU2N5OGtyNE1PM3NM?=
 =?utf-8?B?WnRRZ3ZhV1Y1YWw4RXZZWUZpNU9PWGRpVXJkcFp2Y2syMUJGZENmdmJJVUto?=
 =?utf-8?B?QnpCNGhvUVkvVUxGM3dWbzdLQktRUEVEZTVSb2VXV0V4bVRhK1N0VlBEcS9R?=
 =?utf-8?B?RGYzMFZoazc3eUM3VFdoMEJPeGdIU2lJRGUwYWFoWC82Qk1wQkRUeEQ4TWlP?=
 =?utf-8?B?VmdaK2lIMzFuQTYydnZPOVFnNUdmKzB6VG9XTi81Z1BkcGhybFhvMXlqR3NP?=
 =?utf-8?B?dkNOdkRkMGZLTFh6V1dsQzJUTDZiZGVvM0NvbmlLeWI5NjhtSVdBanR4WVlJ?=
 =?utf-8?B?V2RsWEJoN0FSa2liNDJSVEh5MGNkak5VQm1ieUdoVDFZUU9SNS9zZW9jKy9Q?=
 =?utf-8?B?YU5zWDZQL1FpYlNhanZTT1pKWTZZTG9zZ2dYNFFYRHBjcW85WXQ5STNHVlBZ?=
 =?utf-8?B?bzl1cnRRQ0RMTGtzWngzUkFwZE5hZ1ZPWFFsMjhlSjkzakNXT3NJa0ZWaGRD?=
 =?utf-8?B?a0Y4UkZNRmRYK2pNVXc5L3R3b2xQd0k1T1ZkWCtsejIyWTRSei85dTZWZGNJ?=
 =?utf-8?B?Q3BOWUJxbncyalNRU2JXMU9LbzFYSXZlMDJWbU03ZGlzYm1vQStmWHpVbzZj?=
 =?utf-8?B?NmdmU2lxS2dYekJWVzBlQTVIaDVaaU1pNVV0cUJNOWV0K2xhQ2VrMkZua2x6?=
 =?utf-8?B?NnFuZGZpbVRMOUdMKzlqT1dYbzdZMXNjWkxNcmEwSU5KbG12RytzS3dSMEp4?=
 =?utf-8?B?bnBKYWNOZjBFNTBFTXNPTFNwNVg2SmFWWXpiaVRKdmdvUDJDWWNSYWdGMjNw?=
 =?utf-8?B?dldNL3BteVBLcGJxaU8xL1BxZkhoMTAyWHZzbmpZM0lOZlI4Q0pxdXloK1M5?=
 =?utf-8?B?U29kMVRDb1l5REhhaXhwcStxaGN4YUIxTEJRWVJ0TDdjOEZtYi9mY3VUR082?=
 =?utf-8?B?c1ZmanROV3Q2R0lDYnZqRDIzQ2poN0Z3b2VNYm5kMEF4QlBxaG43T3RjQ1o1?=
 =?utf-8?B?N2FaakVvUVorYWY5cEdWVldsV3FmZ3Q5bmROblpNYmJmbTNyd0oyVnAyWlVt?=
 =?utf-8?B?RXlWVWRub2NnNlMzeVhoNXowb213TEQ1MGMrZithT0s2bWl5bWJzUFgxaHBp?=
 =?utf-8?B?MWdIVG91TElnMnhVV2t4VE8rNHg4TURUVnJYSG1TY3dqZFpYUHlxRGxHVWtk?=
 =?utf-8?B?MkZmRVErYzJvRWJxRDF1UittbjJNNkwvdmpPUjJjV0p2OENIT0V4MFo0NEU0?=
 =?utf-8?B?REhKdHJ1RWRHUCtSNDFZY1RDVU9HanFmQkZXM2JXQndXMFRiTXgrYk5qS1FM?=
 =?utf-8?B?bEJjV3RJMlMxZ0FtS01BYmh6b3N1cXZraldIWWp0WGMvOHlKY25walUzT3pM?=
 =?utf-8?Q?QPh6akzVdk4BshLTZQSsUwys3qi5/0E34/gCsst?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca94ea6-dec4-4502-a200-08d971e7e046
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:11:36.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2reX+14OiwDhd1vrHhRx3IWOxAa/HEC9FnvM45xTLk3eSIrMKWurl/lKntmqephyKmY9Pb+kz7cXHCp9Z5nLSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

This was effectively lost while dropping PVHv1 code. Move the function
and arrange for it to be called the same way as done in PV mode. Clearly
this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_ad
check that was recently removed, as that's a PV-only feature.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
 	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
 }
 
+void __init xen_banner(void)
+{
+	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
+	struct xen_extraversion extra;
+	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
+
+	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
+	pr_info("Xen version: %u.%u%s%s\n",
+		version >> 16, version & 0xffff, extra.extraversion,
+		xen_feature(XENFEAT_mmu_pt_update_preserve_ad) ? " (preserve-AD)" : "");
+}
+
 /* Check if running on Xen version (major, minor) or later */
 bool xen_running_on_version_or_later(unsigned int major, unsigned int minor)
 {
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -108,17 +108,6 @@ struct tls_descs {
  */
 static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
 
-static void __init xen_banner(void)
-{
-	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
-	struct xen_extraversion extra;
-	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
-
-	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
-	pr_info("Xen version: %d.%d%s (preserve-AD)\n",
-		version >> 16, version & 0xffff, extra.extraversion);
-}
-
 static void __init xen_pv_init_platform(void)
 {
 	populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -38,6 +38,7 @@ void __init xen_pvh_init(struct boot_par
 
 	if (xen_initial_domain())
 		x86_init.oem.arch_setup = xen_add_preferred_consoles;
+	x86_init.oem.banner = xen_banner;
 
 	xen_efi_init(boot_params);
 }
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -51,6 +51,7 @@ void __init xen_remap_memory(void);
 phys_addr_t __init xen_find_free_area(phys_addr_t size);
 char * __init xen_memory_setup(void);
 void __init xen_arch_setup(void);
+void xen_banner(void);
 void xen_enable_sysenter(void);
 void xen_enable_syscall(void);
 void xen_vcpu_restore(void);


