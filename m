Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEF41D9A8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199833.354124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv2c-0006M4-NC; Thu, 30 Sep 2021 12:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199833.354124; Thu, 30 Sep 2021 12:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv2c-0006Il-JH; Thu, 30 Sep 2021 12:19:58 +0000
Received: by outflank-mailman (input) for mailman id 199833;
 Thu, 30 Sep 2021 12:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv2c-0006Hw-2k
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:19:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b711d58c-21e8-11ec-bd4a-12813bfff9fa;
 Thu, 30 Sep 2021 12:19:53 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-onSn-rNINdyhkkG5Xz_7xQ-1; Thu, 30 Sep 2021 14:19:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 30 Sep
 2021 12:19:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:19:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0243.eurprd06.prod.outlook.com (2603:10a6:20b:45f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:19:49 +0000
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
X-Inumbo-ID: b711d58c-21e8-11ec-bd4a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wR+FOs7yn/K7NS++9RwN2a7HTGpb8J25jreIb/7TIi0=;
	b=DC9K/CAy+eptAR9XbmxY2/oJOuIIhzZY2j5m4FqSKckUgZipGgvP+9mTzgpbUVOYqDdSiz
	spIk92CpxmdjahWCFc7qO2vErTtFh8RQ5FgDUbQpC3902Y3FpgSSwL+WI4SkfimwSssvQj
	nODf926IeswT4li+W6qsiF45SMz3RH0=
X-MC-Unique: onSn-rNINdyhkkG5Xz_7xQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1jmC9y6tMl7E5M3XlCAwXIi6rts76/LxdBtWyVHIR9/itF2Y/U4j4FqjtWSa/hYIhiKtxnbUHgyFAlYberMgiuk9Id7Q/2enVJMwLRH1hlRWc84ueICSD4zo3ZjYkPu2VqYfe2Byrj1jnwBggu5SPOlBMGnxgROjk/gt0xbNRWqeyQVpxtl1O/hq7wOwnhlLFvVBNNgUWuGkSSnEXYOU1Fafuj/KJQSyiSqriPOBq0yVyxPAnoP9R4ISpmv2ChmkDJu3PzY1K4YQqVCrMYT+LF3jMjHmk5egVG/EQkvRTqiUA8BAANGTHvifZgLXKworVcDINi/gY1UA4HoyHZWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wR+FOs7yn/K7NS++9RwN2a7HTGpb8J25jreIb/7TIi0=;
 b=f67+Bgc34Axk7/FlgYarH8n7KvIM047m27VJEwb2dEagF4iqSNwNzieEd7Z/yonQ9+SfeMOYObxnS10r4zjCjr35WLoWN1mNy3XT1jPi7kBpygzKNbcn8dE/1jl2I2A92Z6JzriN97gLr0xivYFRLZooar7ON2qPcsoPGSScSX2KVO3DkZ3UsoPuFZsmQNTiFNqWf6tDtHVuftdWmd/kSclu8fhY/4p9+2FAesdk0/EGW09kPUqMKXvriy+ay7gZzNiD052mf4UfF7dzLXtxEV6o1NbuH3OmXvARntS2QMLRrKCaCptFmgJsKx82MdYfmp+Gk4fUgBscLiMaG2IEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 7/9] xen/x86: hook up xen_banner() also for PVH
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <de03054d-a20d-2114-bb86-eec28e17b3b8@suse.com>
Date: Thu, 30 Sep 2021 14:19:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0243.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dbbd057-b871-4e24-a2bb-08d9840c99bc
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038D4E79662802BF3B80A03B3AA9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZvAPPnHdx1InNkFrXCgdFVfRHrScIMRa8RXaw3IWm6VYtXGFi7Xd4npoEReMHWmdCd47EQzRxbs9IlEx7sY+Op1XNpboD3eYzQmDsZU6x8S7QQuyFRiZW972svkFRKM6Mn95/UxoHYJ9ziDUiJeT75lA9omodJhHJMLPdK9w6FFygTURFQepiXTlGEahKMdMBG9yPXWM/5AXZGMlThi2YK05Q+Em3oWw7hB3aOfn8Hzu0UvdulXz1ZP44p8FBynHbwnn4EHeLRlx0qLz/zD1nnkbb5NWfBciRYH6i9243F7SI7gQOQj5jpmvXz1ow4sRBdVUwJ+FoyLCQKRtLyaHEyEJ+QzXPDv6uvmw/BeTmVu0fdIlqA6aC13MsF3bPmgnaIGWM98+atS7EwHo2XS0z58rK45w2usMyhYYc9iXbDZUcpi6L1Nx/i4ikYCSAv3giTeNmVvF7W1AJLgeYGgU+0cJIV8fxSREJnesDl/xSmuiW2ZFiVeBZiSmCMvAhSD4ABq6DNJawfzWCbI7Mv6O2Leo7hvO5/EzYWV09JroBRvduuZQPJpDSdSUhc6sF1xiecuy5qDqP9ceBj7Ztj4rdQtrKdE+YqZpGFNfNkpFDaEcN1+xM7HCd2jje/yApDbm3Z5f/AIayrnbNH4HXj/LrN3yom9x9VEICeXe31Y7UdIhU4zScnBLeioR71FcnlRu0kEv+m85tFxU5qT8vTJZQTrC3Ht46Qmao0PdJIm7t4uAJxn57lsRGCoUV9H97vV8BxnLIV9geqGfWK6L4/msKy1T3EMaW+Ds2nfak0nZU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(956004)(8936002)(31686004)(110136005)(2616005)(316002)(186003)(38100700002)(26005)(83380400001)(5660300002)(6486002)(54906003)(4326008)(8676002)(31696002)(16576012)(66946007)(86362001)(508600001)(36756003)(66556008)(66476007)(52103002)(158003001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDNHZTNYNlJYVmhkNXBmaEhRVGFDbTJrSGxlTTdGZWxScWJwaHNPeDVOMWkx?=
 =?utf-8?B?NERNdHZhMTljUlRaMVVveU9scC90VG5USkpkT3BRc3NDOTc0RitVVW5MK1cz?=
 =?utf-8?B?ZlZmakpFcndVZHdJQlYwY21YbnRkK0FCdXJKZGhDT3Z0aFF2WjdKYWJMTEJm?=
 =?utf-8?B?Q25xWWhtdWswZUZyT3VGYmtjZUZrOFd6RGQ4UVY4OS84SVNSV0k5RUVPNWxx?=
 =?utf-8?B?aWt3OS9yNzNEMHpSaUVpQk9IelRMdG9GYko2czVIenRscXo5MHQ4S0F5UDdH?=
 =?utf-8?B?Wml1bFVVRjhjVjZFSDhTQXZ6SFRuTjEwcWY0cHZZZVdnMGZBbi93K2pJWFdj?=
 =?utf-8?B?V3oyZUdNdVl6RHJNaU9wejJlaUlTTnp0QW81M3UyaGFnbW9XTjlXaHgvb1U1?=
 =?utf-8?B?QS91L3lvQ3ZycXNVamJ6OHBOL1VFSXpyeFMwNlJWc0JWTHcrN1V0NDltU1ZH?=
 =?utf-8?B?T2l4SVhHTHlPTnpWc2dEUFdlUFR3bmwzTytyRTRqeFlrb0h1K2xSRkg1ZHBr?=
 =?utf-8?B?MHFEY1VuS3RLbHU4V1ZpU0hvT0RBaHVleFZ3Rjh3L21WWmFIOWM5SFdtUWFP?=
 =?utf-8?B?TnI1WTE0RnlkVVpmdWhzRFcreGRJdGY5WE1VTk1jL2tOdEZkMy9EcWtrVmM4?=
 =?utf-8?B?OU1XQzZTOUtjS3FRdlR2WWZzM0lSSnFiR3d5MjUwZ3JtbkRMMnFRdEpGY0pO?=
 =?utf-8?B?VjV2NzlxTUp0ZjVyR3MyZk40dHBzWTlxM0lEMUtIREFZcXB4cDlDVm5vK2xq?=
 =?utf-8?B?OHJGeWF5N1FGelE3MjV6VWtSY0NYb1ZHK09iWG5hdkdVZ01YYkRlR3ZMUG5K?=
 =?utf-8?B?OHRKYytscUdaOWdiZTh0aGFhSEVlQlM4SGs0N3RrSEZnUjI4S1hRall3cmhn?=
 =?utf-8?B?TEpmcGEwNzRCODJmei81a3NDdjlaL3l2bmc5OW00S3FKWmVrZnNpNkZvMFNC?=
 =?utf-8?B?TXJaT1ZQM1N4MkpQK1h5b1NtVDI3dFhOcnVqTE0wcXYrT3AvS3pqQTl5Mmlo?=
 =?utf-8?B?Y1BUZDdQOHNObVo5cDRtSFhTOVpNMXFpOVUxUmVvL2VTY0dseVI3K3FUZmI2?=
 =?utf-8?B?Q2VBN0ZRUXQvWlZaSnpRYjJuTmF6YThpdUR0T250cVY1R3BLZ25VSmI1WEJI?=
 =?utf-8?B?eGcvMysvUUtDTzdjU210TFp1WWZKWm1temd6ODkxRjZYMlBrN3dXQlhtK1pi?=
 =?utf-8?B?bkx3czF0anRERldUUlluU0xFOVNqTFVqUnVSbThvQW4wakIxMWNJYms4WUtj?=
 =?utf-8?B?bFViQTRlbmFXRU5zQzNhRjVncVVNZ25kWGdDc3FweTVuZXd5UUZlSmFENFVr?=
 =?utf-8?B?S203anlIR3ZQZlhHU2RrMnpCaUZCTkswTm1hS0xLNlZQd0gvVFZGaml1SEg1?=
 =?utf-8?B?QVduUUthTjJHN3hsQ0VyaWtPRitNTjJRcWV0bHM1bzY0ODk3M0VLYlF6aXov?=
 =?utf-8?B?MG9JdnBrSnFqajF1VkNiVHRrMXdVaGxqSzhEYTVYajhMVU5hUy95enV5ZjAr?=
 =?utf-8?B?QmxHTnA1UUVOa2hBY2E5NTZkZjR1blVzanA2bVJUdC9FbFg4ZkdsM1RTTTFJ?=
 =?utf-8?B?Y1V2ZGpBYnY4dWV2QjZPaFNVa2pMVnpDSHd3TVhka21aSVZCMWZSRE9IL0pJ?=
 =?utf-8?B?aEUrRGVUVUY1Y1NBRkkwNUNLNTh6MmZBc0dscVl6SzBUcU1hbXZmdlA3S1FV?=
 =?utf-8?B?VEVUMGYyR0x2azB3Q2VOL21PVExXQ01UNmUyMmdUT0VYL2NXcm03ZG4vRG9m?=
 =?utf-8?Q?JVLLLFkauGlengPGmM/YvszFsLArITPCI3dM73n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbbd057-b871-4e24-a2bb-08d9840c99bc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:19:50.4325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q+cofDn+VPWsB7ANXEanaMpMi0NbjJ5bkfM8TZ2lDohi2iaGWF7L3tGO5FYYopL5HMW006PPHQEmNZ3KPq3EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

This was effectively lost while dropping PVHv1 code. Move the function
and arrange for it to be called the same way as done in PV mode. Clearly
this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_ad
check that was recently removed, as that's a PV-only feature.

Since the string pointed at by pv_info.name describes the mode, drop
"paravirtualized" from the log message while moving the code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add blank line. Drop "paravirtualized" from log message. Wrap a long
    line.

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -261,6 +261,20 @@ int xen_vcpu_setup(int cpu)
 	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
 }
 
+void __init xen_banner(void)
+{
+	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
+	struct xen_extraversion extra;
+
+	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
+
+	pr_info("Booting kernel on %s\n", pv_info.name);
+	pr_info("Xen version: %u.%u%s%s\n",
+		version >> 16, version & 0xffff, extra.extraversion,
+		xen_feature(XENFEAT_mmu_pt_update_preserve_ad)
+		? " (preserve-AD)" : "");
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


