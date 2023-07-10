Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096874D0A6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561108.877435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImfD-0007dM-CW; Mon, 10 Jul 2023 08:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561108.877435; Mon, 10 Jul 2023 08:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImfD-0007Zw-8t; Mon, 10 Jul 2023 08:54:35 +0000
Received: by outflank-mailman (input) for mailman id 561108;
 Mon, 10 Jul 2023 08:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImfC-0006t6-1q
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:54:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63a90027-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:54:33 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:54:32 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:54:32 +0000
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
X-Inumbo-ID: 63a90027-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp25ct+6Dnx6fYLb/4Niw5AR8CDyB9SDE32sSvRAhBVxklJfR5L5jrOAntIxHV4KjKOVjpwQZEdmMaDWjmz7QlXnjiQbtS+eZ/BHSw/nGRLRlP6hcxK9RAQFGqE0u+HkUprGaXI6ndjD0Djqo6Myf2aB4EczR4yrqlgadp6lCcMX61PL5it1K6Y0zixPC4C+5+8h/lLVDB8f3RkwX0ZW9/t1XcqwBcVKWwZ0ExUhwnURkpajPjKd1TtJY4qlC3k8m0Cmq4JzuY5bfH+l2agAWyXawMF0eoAs5FOr9naGf2r3OT9GOHX/k4G1XH9XLZ2h8vfKg0itXajkZtvx6mNrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxqTYAMqHDtwTsaXt5W2izXbr1PoTAZ70AuZ6hPpGqA=;
 b=LCbJERBr5cTIVelRRPx1rC/Q/EUP6VoSWbj+zFwt3qI4QPwyvqye+/bQVAUWc+n5UXXet9mQWWrmxXU2/QYQKJCR7+Qmtti1K6mKE0P3fJ5d6PtLUKByTjsZt8PJGYQl3i2MUWUvpSJjvd3NlCsjXZ0kbVK9ToWRDGo6DoEZLbggq9dNpSNBEuI3Zh8x92XGi4EYYijxmpkGru2yvhNf7vsbm/cFSc6njrNwn2A/KTGL1P73mcM8w6+qJ2Hy9LejKnoDiwClFUstjvV+FPjEqAj5bfgu197GIYDz0VdsqUU51Chvim3gLq0BIbJsIiBo5AFzOSqmE0bro4BmPxts6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxqTYAMqHDtwTsaXt5W2izXbr1PoTAZ70AuZ6hPpGqA=;
 b=4pFBTGTp63DTqFOVXMOsI06QPZ7d2QL+kzE/m1y2tbBy8BTIe5+kPvRsDQhyoHASLpeLpkRzOW+YS6x0a4fcruGNrhwM0DNXeTdBQJuxADWP3cSBpwkOZMquLw2icWCUJUQlNZ/VMhrQ3P+L7IVNR5L2V57Ad4CygftXP4nL2U4sfgheF6MnvSOEsi5sH13X6tSZ8v/J8QEmB23YxTR3f/5lCxzdFcptmrDKoqdWLMk5Wv0cWRfc4/ZTiDt2DfyI5GqZOhqW/UxNrZzId+3MkDZJOWR6Vdx2UxgCJ44OGSXXM2CwNL0Ica8+o9HwRKiTiPsyEESP+saNaZgVy+nkLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bf03d56-d59d-7c71-c6da-d44de31e4711@suse.com>
Date: Mon, 10 Jul 2023 10:54:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 4/8] x86: also mark assembler globals hidden
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ddcea6-d4ee-4a04-06b4-08db81234734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	smMA5YoXsAMj6jQdwfFijixLcl9Aaf3ci4ym76AW8FcoCr2rnvL72emOKUSSPvWyQkWsZiryv40lo4G5k0O/Q7QH5yUow4RRMGt5RLNXU6Hl5wzUlV98vFKBbwWI3xvOWxzn5pFQ12QNhcQHnM2xLS4auzUeNfOnxkErQVtTItKRm4fcqgq4Lozpxu6WNK+Dm6g4oEOuU0A/0HWEL7alrQvkPbCqcjlA1htKqP17l6wHhMmeKSLMtDNf/DOm8/u7sUTF15bDdjKINlsR7fThCvrb7JPHUcGNJTOO3dotRl6puoiBhVRC3hJABXMV4AbDT/1D//gSjC0g5OWuaBbgL6PWr6bWeypT3rDqcJiDv18aOcjmSOvc1x/s1sMUYsmeKqjzWuM84YQPgjs6X7dww95QOT5c6Iq5pSTWmxH9Ms7V65jj7d94uKnqOFTetGDGrrjmD77bYMPCyUgsl0r784f6tVXAMPFtsjPRLwQOT6XQ6WDV0PgNNTKRcdphfHdtZ7p4U9vjDN5sdJEuPEU1kzz/fIRShC38nRAbIXY5YYMVF09+vNEZ3xuRO/A4L0KUbvm4hCLDtlsnfDR0N/SBisgfLKgSj0rHD5WNgt/5TeZuSf1r87Tsm2UNyNEkJK9ZXVnemvLymfQjL1UWbInIfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(41300700001)(4326008)(6916009)(2906002)(66556008)(316002)(5660300002)(66476007)(8676002)(8936002)(478600001)(66946007)(6486002)(54906003)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2tEbGFmbWo1UTIva2JBaTNPNHp6VndIOCs5U1VDT0syWXBOMTJiclVVL25F?=
 =?utf-8?B?MFdVMngzNG50citYekZUSjJabDdMamM5MVpveWd1Y21XSStHZWF0NnNXdUU1?=
 =?utf-8?B?VnZmeFZhWE43VERDcU8zTHN6MG1kOC9yZ05RZXlZWWU3Z3dLa0lQcjFINDln?=
 =?utf-8?B?VUZ6YkdKRmlXK2dqaHRYNjNEdkEreXdoVHNiZ2hxVXg0VWtUcEVrVlMzcy9T?=
 =?utf-8?B?MFVLRFpFSWxGYUFZT0w1c09ucldYdE5VK0JhS0ZmRzVyMDZ1ZUlMZlFoNFdC?=
 =?utf-8?B?TXBwOU5OYmVHMS9GbklZSFFMaTVxeGZtZVFNNkhVdEpyWHZQODcycTVyR3l6?=
 =?utf-8?B?dThFcDliU0VTUGV5KzhJcTRWS2ZlS2RBMXJxUmp1Q1Y5WE9lRG1Od0F1bVMr?=
 =?utf-8?B?R0lkRWxibGhxMUh1UFpEU2NPSlprZHpoNkFma2tLN0ZDTitwRXZCQWFZLzVl?=
 =?utf-8?B?QWppOWdnRExlY3pSVWxXT3dCVTQ3OTlUWDhPSDFUUTAweS96NWMvcXdVeEx6?=
 =?utf-8?B?UktNUFZweVdPa0x1MjYrZG9BMFJraTg1TEk1Mk5zVi9RU1VwdXRvTUNwZVQ0?=
 =?utf-8?B?K2k0TmdueGVud0hxWFNBazRad3QwT3ZEZUI4cjdGYVd1TkhSU1A5T3YrVlVS?=
 =?utf-8?B?VFRJS21pbGVjeGg5WHhMVmJPUWdIWCt3TTVxUVVJLzhTdG95SStja0NNUktF?=
 =?utf-8?B?ckJUT2dWa3hNdnNrcmJ3QjU5dm85MzZjTnRpbmo5YW42cHBkUTlQRUtId3NI?=
 =?utf-8?B?WVBQS05oOC9NaGZEVDBhczdoQ3pmeTd0dzBVc2V6ZWUzUG9idTJ6eit5NUpQ?=
 =?utf-8?B?R2pYUlBDbWVuWHMyWjFPOFYrVUhkejhCeGhCbDA2WTBYS1YrTVZjUHQ3cDQ4?=
 =?utf-8?B?MDhBUy9nQ3ZvQ3VSVXp2ZHNXMlNxalp3TkpXbHNzS2ZFbHBxUUlmVkZnZFZJ?=
 =?utf-8?B?SENkUndtWXJkOEdrSC9WaVVIM1VsZ2V2R0FvMlVWbVBHWk03L0ZUdjZVQk5w?=
 =?utf-8?B?bEQxSHVrSXhSMXdzSWtTZmQ5a2lITDFZdXZwVDhZVDd3aTBtZXEyeUtKNE1U?=
 =?utf-8?B?c0pxS3BTMlZldytsOU90NENZTWZZbXRQV04yVzBXMFA4ZjMwVzYxbUtLOFll?=
 =?utf-8?B?YWdBWHUyMjl5TzRtT0lubkVualhWMVdFZ25aRjQ2Z0tHSTZwaHRSUDFBTU5H?=
 =?utf-8?B?czZwdVY3cU1OZ21nR21OMERYUnd1c3dnNXVrelJNYVp3Q2UvS3A0bnl3dUVy?=
 =?utf-8?B?QWFMOURVQzdPY3ZuTHkrN0FVc2tZQnIxL3lZT2d0djk0dEhNa3haaHAvU0NQ?=
 =?utf-8?B?QVdMSlVBNmxuWTQxWjFsQ1NYWkJNbm9ZVjNlckt2blpQTW5nbHd5L3Q2S0xz?=
 =?utf-8?B?Qk5oZnp4RU5VcER0ZXo4bTZGRmhPaDYrcHIxNlFPcGtUSnZ5aTJBdnVEcjZR?=
 =?utf-8?B?Mm9EU1hEWTJmMTJxL3lTdFdpVWpZQzdDQ1BseHlVdXUwQklYdUtsYUFXTkRT?=
 =?utf-8?B?QVhhNlpsbGxQTjgrRmVsUVRQYk9CMEhuYXRlZmFhN3NtS0o3S0s2T20weGF1?=
 =?utf-8?B?TW5rMnFLTi9DUytSVG1oWUhnTGlxTDQrK0dTWFdDYTVEaTgraDVlR2NYZU0v?=
 =?utf-8?B?MXFRUGoxalEyb3RZallTQUJ4SkUrUU5uS013M25OWVZxblB5L3YyL1ZyR29t?=
 =?utf-8?B?enU3QmY2SzdEcFNnUGhRaTFuVWRUdG9TV3RWS3VlR3JaVllRcnlOT0dBRk5X?=
 =?utf-8?B?ZW1WU1N2OWl3MlhDaUV5UDNYZXc1d1pZTmErZEdORWhFckFETkt4TTJtUFpj?=
 =?utf-8?B?Sml3amh3Skp1QnhsdThnbC9HdW9uSlhwZlBIUWQxbUhXcEVZaVNFRmxNZTNN?=
 =?utf-8?B?ZlRkRGtJeENZMGJ6QlVYcXNTNUs4MW11N1dMdGtuUXAwTTFPQ25iek5tNEVF?=
 =?utf-8?B?dkpkWXVLVzVPMDY0UVFuSlpId2ZrUGZ4VzR0MUUxaThPV0tCVjJhUGhYQ2px?=
 =?utf-8?B?ZjVkL09taS9OSVpTa2hrQ3FUbzVIaVdoUjEweVlMNG5TSTlFV3UrZXhzVnBF?=
 =?utf-8?B?YWFleG5ZV2JvTHV3VFFWaDFtUyswN1lRbEZsWGg3QkVlL3RnQ2RzTGdSUDV4?=
 =?utf-8?Q?tdQJ4umtHLUgWI3WCzooIdWB6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ddcea6-d4ee-4a04-06b4-08db81234734
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:54:32.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Orx4S5XLHhaAaSH4C/fzhNVz0NkiTAs9h99+2BqBa+MdYj/uYqdOyWXAdorvaNyGS5fUt3+lfzJSzH/X5nj2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051

Let's have assembler symbols be consistent with C ones. In principle
there are (a few) cases where gas can produce smaller code this way,
just that for now there's a gas bug causing smaller code to be emitted
even when that shouldn't be the case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Re-base over generalization of the annotations.
v2: New.

--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -47,11 +47,11 @@
 #define CODE_FILL 0x90
 #define ALIGN .align CODE_ALIGN, CODE_FILL
 #define ENTRY(name)                             \
-  .globl name;                                  \
   ALIGN;                                        \
-  name:
+  GLOBAL(name)
 #define GLOBAL(name)                            \
   .globl name;                                  \
+  .hidden name;                                 \
   name:
 #endif
 
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -21,7 +21,7 @@
 
 #define SYM_ALIGN(algn...) .balign algn
 
-#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_GLOBAL(name) .globl name; .hidden name
 #define SYM_L_WEAK(name)   .weak name
 #define SYM_L_LOCAL(name)  /* nothing */
 


