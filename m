Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6E4A5ABE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:57:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263511.456223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqqi-0008MQ-BR; Tue, 01 Feb 2022 10:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263511.456223; Tue, 01 Feb 2022 10:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqqi-0008Jx-8G; Tue, 01 Feb 2022 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 263511;
 Tue, 01 Feb 2022 10:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEqqg-0008Jr-NV
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:57:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab23a05-834d-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 11:57:21 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-ROVeqREKPG26qUe__Kf3CQ-1; Tue, 01 Feb 2022 11:57:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 10:57:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 10:57:18 +0000
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
X-Inumbo-ID: bab23a05-834d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643713040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pY8BM5zZYdZJ+CGLGhbRBx4Ul0yoDcBNt29Q1qqtf54=;
	b=cp9ZvcFsSuuorNapAKA9c3zuO27jZAFR2AD76xV8ks4LnTZ+B5dKyuf2BWkqjPCgTcTLBy
	ZBlfyraE033PC6B5fsSCbTyeurmUIvAhBZ5p+M/bbITmeJjzS3fAV/hBXyIW284gnBF4m2
	+RGWmIzZ29iFCtetKn7yrcVzeWo3yB4=
X-MC-Unique: ROVeqREKPG26qUe__Kf3CQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJJrymzbkByTFbQi7oShfGULSsSWs7h+3bxq0VUCNSSSpTTcRw/HGaIyE72TRtjI3zBwLKAAFX0xWGVTqSocDFwhRR0rOr9Rz23/WOEHcKTgbYXIRsBvf0W8DuyA77P0sLj/bTV2hu+vtxQ0gkNlkY1s5kG8X+mP3ZOpV2Fb0kd4XBd/8wRJVLFjJdjmt3x5u2MIusV2itn3WBEWVwLs9xe5N60YErq2DcZY1Wp33888RxV4ZYMyU3OWeVTgL6F6Msj7RImIbPhbvRnrJ7EHx+AJnWYgUmQzAlmEFbPZgILwJwJaE6UNzFKA73f1uaK/kLCUYlMWeUSp/qllfLZJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY8BM5zZYdZJ+CGLGhbRBx4Ul0yoDcBNt29Q1qqtf54=;
 b=Y24cK6Ic0mAo3+eqh4RppKxJUHWl8mvF1IX1Fe/rKFhZjIDFuL6DACG/MYZsCMRQFlQkqgn1w6CHQLYrImozlyelIJgq+e06/Fl93Uu37cSI5ZarcPsRpdBmk5ox0zq6oeeLj8RFSc47JY2yYX0hGPi4Azg6TkPUSZORVcJ551CWRtZYw9NCgguHZARqDDJ/sqvffhhxb5MBB0cgv3HR4QiTaYCJWynzZ1QshaMgqzKemwzEgq0mO831SGehSiSHEv4f+Bbek9shdYS3yWn2597k3pQJcAJ/F9wJmyA6KcLGVHNNcPV33/93UuHZPO1DbZRZuhqrgQMsmEg/aMfiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
Date: Tue, 1 Feb 2022 11:57:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Xen: streamline (and fix) PV CPU enumeration
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0081.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a9a8dd0-5f8f-4b9b-93f0-08d9e5719d0c
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8096ADDD5E49C7588FA0A04EB3269@PAXPR04MB8096.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WWrlZ2a/yvDFoUiPtRrIrHpsySGnngHB89l0lB/z1ylRuNXunhA79EUO4NWFtnpclXSQEYNSRuMjf4i+HUK/D7VVBAoy/gDwHuqRR4VqS3C6MS6Tt5DGy+uS+PXeU557c7Me1hJpTE++n1MO6t+LnyiqFyw6FW+IEsqiW69q/taoeM6m3PaBrSEawMbCCMhqlHZoH8S/Ug3vyPpF9DrM/PaBu9jcOzbGFrMjVOC4Ck09Vk8iMwnoLfxEPpxWZ7cOBwhsrk+8rX8Iltvnu3EMPbM3shIj1l58kf0N5F6FD2TO9E/GLwwHbBVYY8wm4g9Lgb6NXnE38JVz0TZomUTJUSOMOYlelY6UAKBQ3yd0K48h47n/mzBC3glRxy56iIDMSfGoFSb9SCKtqds+8NnT0QCBN5U8MBLBzXeVwBFeF3h+iSkXsu9wBddd+TI7h1z3bTKuNmh8NVli2YCFNSrveb1N6Y2Gh5f8pT1cxBha6Kd2hGn9JX+IEgMbHk8ulnb5zn08ViH+tkQwP+n0IVSuMTf+ZP3lkfePlHqaOSXyZpJIGXmI+qJ0LeR42wGX6s6a4VjYTxftzAlmSCVTYHzXpyYQop2g4wgsX08G9EMPxr3L56JltCSLOrJsXpEFSSHAY/tFQvkEmhtBbfm0+sCb3ePv4560tbPV54FMDw/fctkXbUTEZFU4hHcRXTpUdxlcBQUQqM84U35MtjfSetZE6v0Yv7CwK3VPBbX6UE83kqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(38100700002)(316002)(31696002)(186003)(6512007)(6506007)(26005)(66476007)(2616005)(36756003)(83380400001)(508600001)(6486002)(2906002)(8936002)(8676002)(31686004)(4326008)(5660300002)(66946007)(66556008)(86362001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXRKd2tPczFoMDE0bEtCc01jczR3eERWWGswdndpcHVxS3lrTmFNQit4M0Zj?=
 =?utf-8?B?b3FrTWhhdktMZTJ5Sys5RUNUMHVBWGIrUjdaS3hKTk9uUXh2WlVKRTI4QUMx?=
 =?utf-8?B?OUxZQzJlSXhFZ0ovYU5jQTkyaWJGVEpZYTgvMStnbDZjQ2xibWt5TWphNFR3?=
 =?utf-8?B?V3ZZTDJENTZKVTh4WStLR3Q0bXhFdXZPMytKQ1hKcEt2NXg5aTRxTk03QzJa?=
 =?utf-8?B?aFU2WWIwbDlHRVdTTlY0bHJzQmtJZytYWDNJS25LTVFjTHFncThsQ00vdkhE?=
 =?utf-8?B?NGt6cW4yTmtHOTJTMWxUNEl4T3dkK2o5VThLM25waE9pMmU1amZhajBKODV5?=
 =?utf-8?B?L3NGS2dteGdZQ2FoYXROeHRpbHIwN3IzMWNtbitwOVRkUTVXblBsSFJyVkZV?=
 =?utf-8?B?S2dqQ1phZC9wNzFRUmxtT09vaW9tS0ljYmFJak1Rb3RsWEtOblRwMU5JVXZj?=
 =?utf-8?B?ekVDQUZqNzd2OWpSaWhJT2liTmhOM0l5L3d0Ym1BZ2FDa1NjRFl1QWFaVHN5?=
 =?utf-8?B?SVpUanJYZUNSaUtBaC9tdkdXSG4vUUlFbjNRUjNUUnJwSXFMNG5QZjI5cnpV?=
 =?utf-8?B?SEVqWmlubkpBVERsRXI3LzNxUHlyMVRDVFRzQUdEeUhSVHgvbWFSdTl5RDRI?=
 =?utf-8?B?S0xJVWFrQ1FhQUllZ1FGVkxid1N2UTUzYm9oYXNSaCtMMUFPdFhDM0dYQ3U3?=
 =?utf-8?B?L1dxay9la1dVWXVDM0FqQ1hGYjF5bEFFU0xuZEV4Tk91elpSNWR1NGUrNUc3?=
 =?utf-8?B?dWR0QithVC9GeThxR2I2bko5ZXkzWnd3bllaSDM5a1dnZVNvQ3dJOFNySnNz?=
 =?utf-8?B?b05MQit0NFQvd1JyNHJBMFVVbElBd1RKaW9wRDF0YlA5MWswdkNYZFlINnk1?=
 =?utf-8?B?ZmRlMlNhNTU2ckZoRFhINjg2RGorbHR2YVVjQmFMYzdPR3RHdjRDN2x3amN6?=
 =?utf-8?B?aUtkempNVFZTMXZBUldUZXhoU2ZrdVowMFFVcERTS3lHQm9MMGhmMi9uclpD?=
 =?utf-8?B?STNlTkpieVZBRlBrME96N1dVMjlOWUJuV3pUREp5eGVLb1pOdnFnMTQzRlBD?=
 =?utf-8?B?Qit5M3Q5dHlZOHlaTlk5MndTRGZXbXF2L1RCUDZIZ3JUSzhwd3pFQ0F0Ukl0?=
 =?utf-8?B?czlOWUtWUUdjb2RMV3BWdlhHWFBaTDdsYUFBQXp2MExwdldGb3J1S2tqSmpV?=
 =?utf-8?B?UjU0cjlIaElvNXFjNHBJQjR0M3pTRzJBVkZxWjcxRUVHMlJqY2JUQjJudFlV?=
 =?utf-8?B?OXk1aGs0MGpBcE5TQ3lPd0txUHQvS0VrWmtvL3p5bjdEZWw1N3ppbE9FcUM2?=
 =?utf-8?B?bFJNOU1YNUJpbE5FeEF6Y1d5dEZ1NHkrNVc1R25VSk5WOEwzM2lYdk13b3Vh?=
 =?utf-8?B?aDBzaHljREJ0R1Q5M0VQVCtla3Z3Y0JkcFFDbldOa0tCb1Q5bnU5UmVzdGVH?=
 =?utf-8?B?ZnprNStiK2VlVjk4MzZoMVBlUjdqcDIzZUNOK1k5bHRvalBOaklCS09wRFBE?=
 =?utf-8?B?cUVJYjVsdFZWc0ZuNEtZOFdaa2RQOHYxenVwYktrMFRhemZsT1dYdGxkbFlI?=
 =?utf-8?B?eTVBOHM0Z2JKc29xQTV4UTN3dFc3UXJkQjdKZlNZNDBzUVFQdXNjbjIxMUYw?=
 =?utf-8?B?Z2ZOdTZEcXBHdk1pdnh4WExXS0d1K0QwVjFUSVNGVU9pcnBFamhBVFErNGpq?=
 =?utf-8?B?NE1yaDFlZ0k2clFKOFl6RTRXM3hHZDc3NXUvVml6NTJBL2Jia1RBYyt0NFJp?=
 =?utf-8?B?NWEvaWZOVkcxUGlGcGh1Tm9sR3FmWlRLTXdIUy9GYzBSNXNXMllNTWtuNHFX?=
 =?utf-8?B?emxaSERQbXUxKzZFS2NtSW5DM1hWYndLUHM2Tldady9YTFVQMHNXMnJkSFZz?=
 =?utf-8?B?bldwaHFIUFlHY0pIWk8rK3FQai9ocUd2WmpuOVBJcTE1cUlUa3I4R3ViVHU5?=
 =?utf-8?B?WHFqeE1lQ2syZlJla1RDUFZjdzJ1ODk1clF6R0Zjc1I5YjJkS1FXWFlnSFkx?=
 =?utf-8?B?a3BKZDgrZFBXVVZCelFRQWFFZ0kvUEhyQnFWYjgxZDFTV3ovK3d6MU5Gd2RH?=
 =?utf-8?B?dXhidiswc2hjdkRNU2tXRk92NWhIVStiRDhhK1Q1Y2F0TmVjK1dKcFpyQlRC?=
 =?utf-8?B?OGZiSm5WbEZMV0Y1S2REVUZKQy9qbThYaWFHdCtDUHNoWWFDK2RySFdoM3B0?=
 =?utf-8?Q?ia2JlHlrDIdjj7tb7OeLP6Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9a8dd0-5f8f-4b9b-93f0-08d9e5719d0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 10:57:17.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6FCIUPcctzQi9463EiVy0IWOHX8xXTJJ+4CZlK/qLiZiX4ZZClJsnPtHbgs06+D7QbyQHwob6uDsI3QD45fzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

This started out with me noticing that "dom0_max_vcpus=<N>" with <N>
larger than the number of physical CPUs reported through ACPI tables
would not bring up the "excess" vCPU-s. Addressing this is the primary
purpose of the change; CPU maps handling is being tidied only as far as
is necessary for the change here (with the effect of also avoiding the
setting up of too much per-CPU infrastructure, i.e. for CPUs which can
never come online).

Noticing that xen_fill_possible_map() is called way too early, whereas
xen_filter_cpu_maps() is called too late (after per-CPU areas were
already set up), and further observing that each of the functions serves
only one of Dom0 or DomU, it looked like it was better to simplify this.
Use the .get_smp_config hook instead, uniformly for Dom0 and DomU.
xen_fill_possible_map() can be dropped altogether, while
xen_filter_cpu_maps() is re-purposed but not otherwise changed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Extend description.

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1341,10 +1341,6 @@ asmlinkage __visible void __init xen_sta
 
 		xen_acpi_sleep_register();
 
-		/* Avoid searching for BIOS MP tables */
-		x86_init.mpparse.find_smp_config = x86_init_noop;
-		x86_init.mpparse.get_smp_config = x86_init_uint_noop;
-
 		xen_boot_params_init_edd();
 
 #ifdef CONFIG_ACPI
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -148,28 +148,12 @@ int xen_smp_intr_init_pv(unsigned int cp
 	return rc;
 }
 
-static void __init xen_fill_possible_map(void)
-{
-	int i, rc;
-
-	if (xen_initial_domain())
-		return;
-
-	for (i = 0; i < nr_cpu_ids; i++) {
-		rc = HYPERVISOR_vcpu_op(VCPUOP_is_up, i, NULL);
-		if (rc >= 0) {
-			num_processors++;
-			set_cpu_possible(i, true);
-		}
-	}
-}
-
-static void __init xen_filter_cpu_maps(void)
+static void __init _get_smp_config(unsigned int early)
 {
 	int i, rc;
 	unsigned int subtract = 0;
 
-	if (!xen_initial_domain())
+	if (early)
 		return;
 
 	num_processors = 0;
@@ -210,7 +194,6 @@ static void __init xen_pv_smp_prepare_bo
 		 * sure the old memory can be recycled. */
 		make_lowmem_page_readwrite(xen_initial_gdt);
 
-	xen_filter_cpu_maps();
 	xen_setup_vcpu_info_placement();
 
 	/*
@@ -476,5 +459,8 @@ static const struct smp_ops xen_smp_ops
 void __init xen_smp_init(void)
 {
 	smp_ops = xen_smp_ops;
-	xen_fill_possible_map();
+
+	/* Avoid searching for BIOS MP tables */
+	x86_init.mpparse.find_smp_config = x86_init_noop;
+	x86_init.mpparse.get_smp_config = _get_smp_config;
 }


