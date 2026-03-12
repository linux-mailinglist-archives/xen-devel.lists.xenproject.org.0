Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lerNAbQls2kPSwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CE279802
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253014.1549454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mtJ-0008Go-Jx; Thu, 12 Mar 2026 20:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253014.1549454; Thu, 12 Mar 2026 20:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mtJ-0008Dg-Gp; Thu, 12 Mar 2026 20:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1253014;
 Thu, 12 Mar 2026 20:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0mtH-0006Bj-9O
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:44:19 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1e406e-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:44:18 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 20:44:14 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:44:14 +0000
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
X-Inumbo-ID: 3d1e406e-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSye53M99Gu5WnsdM3B1OI2RnrAVDbjQBM2XAJuKdj0yPEnZAtRC251x2PifeQhFjyCpVtQueSIfpppCmzQEVE2OEKCD8mZ595L5KA/dD88+9YmO35KW7PMkXww3C3wv2UVShV8VGTp22OaKbkxHLbY6DQw6OrcNlsaMnog2JwaRREZMORfDhZW/Tl0jkz6lzvr0e75rtHW+huLToV8ao3sNCDVMngbcRw2FyFE1PJMVI2yI+PfyowJ8g2rCZlcmw66xYSHPZSSHddQ+c2H7tvTfldvRzO3SE/bGMxkxInF6MIkPLzwnwWUaLt0sb4E4vg6S/Yz5gAzzLg/So5HBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fJg8okjUbsXwQL72YI3Ef64Z5xJVF476Y9inw/GDl0=;
 b=Lc5qX6Y6lasGmrf3EWGg4V6TUPWIqtvOie1MkT1bA+tPc88WJkn2w38Nbvd4YkHtUS03QCWwG2YhjSPaSZpuWC2cK1XS0AWPEFag2ijYWXwORU3LcCcP0pkm0GciB9BmB9XIPJgACbx/+SFoJTN92CYpxSH8tcix56pXk4kxSzTP6SQQOmgK3SS8uqVuaL1NatVCTzCKA3c3DgsqFTwHEUtje4dKjdxezUWR4orLZRTu3TKfwtghKLykdk8SLNoiJ/wHLscr0CF2u3cw28sQ1fT7W1QV6NhcAmIMlMez1TWFnu0hdfgW1l5yCAPzbM7+VLxjj1OeRRlsGXKFrt6/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fJg8okjUbsXwQL72YI3Ef64Z5xJVF476Y9inw/GDl0=;
 b=WtesFeQHiuzyP7YxDH0KEMVZ91VHup9b0yH8Uwizy1ZaaROxOlSGCcuN+ze04VAtVcs256Ias7nlQ4qOBqGBZQBIE8dx9zSuSBnWV1+S6bNGc9MYHRtZH1hzyEKRPbJXvNOxG/sxNphUFRlhsxdw7TF4iXI8+h/qfJKKreLpiJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 6/7] x86: Remove x86 prefixed names from cpuinfo
Date: Thu, 12 Mar 2026 20:43:38 +0000
Message-ID: <20260312204339.740403-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 86638b2c-b4c2-49e1-fdeb-08de80781f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FO136Cpi/WbXf8rWWQgutBD8IZFx9Zl1Tl0mg/d8NrBGINexHnUFtPfeA1HnkG2cDVZGkYS2w13eobL22gONpRtZZM+lL5YWaFCgHX6BTePhv0gKzdW7eCvJyZcNpGUGE/hMX9/4Sb5FGfOIlc6B8E7VHMHCHqDxEIqD5NTaHF1KfPa2/W9jwYM5Z3MgBDJOGXkoLLpCZxr64KaapIs151sRJ+ILuneD637uj4/ivzfrrJlKWpoNB0uEjH9MafY7m4xeIccaSVcyNTm3EFaSME4YWtMCcr/IxntkzJHq1jxiaPBxaY4MrEnoIHJTGuZNsGt2722wrJO8bovPDSBPngAsTBodCy6IPRb4CvopOnnzqtbBPkxYbtUMIi068LoZISPeK25qgKxAolHVwtPuTDMVXCO5zK4sjRUyHlwRNMvgrlBjqJafLE4uopCScGechYP/hscqrOGdZ27IWRsDVN3YGnYADLRWQUEQTzOaT5V+kVAPE6364dwd66FS6gZshshAF8lONJswwSLXb4vFhG7FuRgWMxB3hpfZPTy90+bxkFn/XeDp8MLREvutVDzipiqfZxrGfVB+PsVsxh4stEbH0zf6KsUI3AX2DEn28/skNO+KOgmOi41CkBwahgPMbf0Em2beAnXyQenUVVPffiGc691SMqcWUVVGSHaZFBe+2mHf2/07EsEr2W2FzWR37Qf3YAQMwzIvl/uV7TF0bznFyuMGJRe8n0ZxpMTg3TY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x9o2mq9G8OfQ3daj75c1gkpr6hawwAECZI96DQL9pYyIvDsSNf/V8ZtTJLsE?=
 =?us-ascii?Q?XhbrrNFm/LGhpWbhqYwMFEXoIZxLaU2adeNnzaQ49UqSKB7U+ylwY4Xuy1vU?=
 =?us-ascii?Q?EDkN9bUZga0EN5C+r3Zi9mroQwB9/0BrFiJjBGdRu2KYNWIviqZzSdzHnBYn?=
 =?us-ascii?Q?/+0PyfsMzqCvE7tOJruGf7wZ9QBHnUgkfy3QQHX5GCSy8+sRF5XW2ZLGn0KT?=
 =?us-ascii?Q?j9mPbbhOu4raBeHzqv6uv5C8oJaNLroiUizdIDqe8PSTGjLd2f+uhSxO4lVL?=
 =?us-ascii?Q?QnzMDM8VsxnsPk373jADclT7Z0o03kW/4EEnX5StfsCg5quyEymRYCKMMEXt?=
 =?us-ascii?Q?xmMLF6xB4Cl/tWFoUIkDrrxMskiDLDjUIrZ6K+zdXgf8w8s0XW8JxIXteguZ?=
 =?us-ascii?Q?k0Xatiiw+rncqqrbTWyeAN5hUhrm1MuPM3N4ZWp+GvMUHrE4NyhFnj6LxLdM?=
 =?us-ascii?Q?5ka75LqLNp/PsrUnQPUoHSk5sxOnwTIBHdPd41vBaIheHT8X9Ysea6FIolUK?=
 =?us-ascii?Q?rTnknwiYTbfDFDMzvWIsQjPAlv1EOxTn1P+/RRMfefe5ey0KmFqdVjVC+37n?=
 =?us-ascii?Q?eCYnOZvxnFjOP+3QTwACFSczxO67AxALR0OToG2NjmDWxUEjmbqPA5IB8SXp?=
 =?us-ascii?Q?wyhr63Lu7QZxJ+TqPJNCNC6WQ/Howb4Dm87e91IKH/edzL8J2mfmZRE3MG+O?=
 =?us-ascii?Q?r257g7bWwktd40ad0dJ8ytKMtncuaDsr5+vHduS1YoOg/uUXXDBnHir9UCQa?=
 =?us-ascii?Q?H/+cZrCxH4ywo4ChJdLRItD9dnjA7E/5AQx9JnljWxKbzAlwz8yyRIDl+I5w?=
 =?us-ascii?Q?nMR4m+AyFRyMaM4ZN1C19tp5FUuZ/ra+0JC2+l5ubP1vW4ybhzJ/BB3EVJCd?=
 =?us-ascii?Q?EaE7292zA7lK1GxkIH5xSSXWvTFGSAmvqkqM5un1a0Xm3g41k8mntSeFueEt?=
 =?us-ascii?Q?6DK8eACq74FJwMp+7fiQuLJ4eOcAusgyCDj58tA+aisrMe6ZxwruhWFpIRfS?=
 =?us-ascii?Q?o6yT5Qf/hpuR0DPxEfGaxjRr3SvabZmkHn0khDKZVoxwX4TXPOKL1WZ7Vqd8?=
 =?us-ascii?Q?89mhCgltkT+4Ttk2sh37JZCcxif/dN3LhaBN/Nw9YYRksesfI/tyHtE9z1Td?=
 =?us-ascii?Q?r/yEQmaXQxsDTGyPHlehaozf07XPdUqQXH9Ydskpu2t0Cz3SbJA7e5pdmDpy?=
 =?us-ascii?Q?r0lpdBoMPgY2kAzP/XomkQhuoSvxnF42N+aod0dPhQMY5WInoF4eytc/621x?=
 =?us-ascii?Q?dozFQQP0HubKfk+jiWaWY0V5DSBA1v9uz9KUJgBL+mXuOvezmFgmu2AZ3EUk?=
 =?us-ascii?Q?N6P/Wq4xCcKGSeddhFz7nmuKqghVRp4AGRGUH6DB7yem235aSQ8JzNs1+Qt7?=
 =?us-ascii?Q?1EdSUfp9kTEtgH/oMrfVqLzRSQfDQh7eLo9jQqAkkNPQd5kH7fa1iPED70ru?=
 =?us-ascii?Q?rdu/EiFCvha7ve97gAlTeKpX7sw+IV1M+1zOR7/qPry5x+p5qO30cY/7dFQZ?=
 =?us-ascii?Q?4fTvfZ2lXdCAIBNL1cEJyQ5WZuGpjRJb23ndt4bUdK40bZj8T4RPp26JqFv6?=
 =?us-ascii?Q?UMj1th67Zn1D9t/4q4Va6FfyW6NC27vI66b15YUaUKyuGwOaerEmOCnW7rwB?=
 =?us-ascii?Q?Cc32XVgXi7mQl6l48/m7Mky2kMNHA48cyoko3iDeENnh1xppxZIWiSMV6kC/?=
 =?us-ascii?Q?yjHVhrQPejbxWykhzUUIpdqRTXZ+O44h91PuZ1N8aNbUzdOlXHhhqZ3IGIdY?=
 =?us-ascii?Q?i9sDf0wmSw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86638b2c-b4c2-49e1-fdeb-08de80781f79
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:44:14.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hq/BR2iWmf7kSh4xtWDbUlJfSmj1UI6BALpCU7FiyY/l6264P7hM0Blv0Z9z8m4UQZ8eEUN+ffIWvRXogFFAmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AF9CE279802
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Remove the unneeded unions
---
 xen/arch/x86/include/asm/cpufeature.h | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index dcd223d84f..11661a114f 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -43,29 +43,16 @@
 #ifndef __ASSEMBLER__
 
 struct cpuinfo_x86 {
-    /* TODO: Phase out the x86 prefixed names. */
     union {
         struct {
-            union {
-                uint8_t x86_model;
-                uint8_t model;
-            };
-            union {
-                uint8_t x86;
-                uint8_t family;
-            };
-            union {
-                uint8_t x86_vendor;
-                uint8_t vendor;
-            };
+            uint8_t model;
+            uint8_t family;
+            uint8_t vendor;
             uint8_t _rsvd;             /* Use of this needs coordinating with VFM_MAKE() */
         };
         uint32_t vfm;                  /* Vendor Family Model */
     };
-    union {
-        uint8_t x86_mask;
-        uint8_t stepping;
-    };
+    uint8_t stepping;
 
     unsigned int cpuid_level;          /* Maximum supported CPUID level */
     unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
-- 
2.51.1


