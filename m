Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576D79708E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 09:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597155.931353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe9iO-0007sJ-79; Thu, 07 Sep 2023 07:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597155.931353; Thu, 07 Sep 2023 07:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe9iO-0007pv-3s; Thu, 07 Sep 2023 07:46:12 +0000
Received: by outflank-mailman (input) for mailman id 597155;
 Thu, 07 Sep 2023 07:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe9iM-0007pp-9U
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 07:46:10 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96784bd8-4d52-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 09:46:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 07:45:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 07:45:58 +0000
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
X-Inumbo-ID: 96784bd8-4d52-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/84Y2WlTLutQZERl69MR4hmDOBClwazQ7Y3nvU+Nqf6U778ApXpG2WKSnx6UZZXR7ePdya4JfDXuSVl4q2GkwhmGXHSI/yCM6JI4cJ3DvUi/0wyRIP0xDxcGeJ3pXzKrFkgb3MybzsinZsgoxBrIE0WfF/vWPTcfnbvt3EMKPojGS//WrrA11+o0G61+kO63mRJo1lUfNMtyjYZGJ4lYaTMHTIwhe2d2ZOQonyz0cFRuYr3DHMYCG6T+/No8KI6Uzi4Mg7xRTU7+If6XEDIuPqQb9f6OpqsRKFRGeCJ7PKQZMwLrMImR1sPL0RvpJSBYotj2qwW4b6sdTfVPym3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LA8h0yfEMbV6daKal0abZLk8Yk/KcqV4BLNGkjYcORM=;
 b=ofG6Xo2OaeEUEpyDwby//ZumOiy8mLc9vYQaY4HYKkulo1iaXxiSKkCBGR7teR0wmp8OBRHHkNyOmnPhg3hTZptkU90hqOyUQiqu4uEqmWITXGwPLyJiVb5zE8jDFnx35LQDqCY1HBZD9tdICoXANyNUHGWae4+nh2iVcRc7UFz1xcPgcv9qOd/Ekn6tr/08gKEOUT4oHH1uXQ8SZ/ImTp5H3Bmwck8/zx/o3ggyaMdvfDlBHE2PTloDkI2ZPWwtj4pWXEqBXGK3yyhsIJ/1YRDPcCMaDWouUSn63miLpQhlUkNqil5qvqDc7zQCjexYuXmXexD9Ma5c4O/8Kwz6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA8h0yfEMbV6daKal0abZLk8Yk/KcqV4BLNGkjYcORM=;
 b=ZvNCmk6ZO+DlUF3Oixu16xMrrnhNSzQbrKJYwwgw50jzAgo0bpMUZJAl7rEoLkUrxPKFwPEC33O3ojJb001fpiGK7kAHuEXBBdXkBxWQsYo8tqmv+r27bXRHoZWR01/kOgWbI1BCyizKI5KPqjugM6kyWbVfQACo2lCTncFW624nW26YsB+YsxIDIELAI7wcnWZKdSwJGplTHMxyfgH89rL5yCdpPcyrUs44drnXHGX4+fjJPorR1OtIYb71NlR1wavETtHNEo/1UmMh7umdaVMNMAUoNF/ahd0lVJ7moCAvzAhZeOvj54yDohfHdtQIak8CLcFLtwUqtQurme4U/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb6831bd-5846-5cfe-53fd-8274b24bdfb5@suse.com>
Date: Thu, 7 Sep 2023 09:45:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] MAINTAINERS: generalize vm-event/monitor entry
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 72da8825-554a-46fd-df18-08dbaf767968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DpdfG+VzOt7ppSElrN8BhYtiXdQLycAXEgAWOtmDMsqYe9g4S2KyfAyic3hFrnlyFlr84PmZSl1DuNvns0FlrRHbZE7jPX/9GQlaWyR2ZX3nSnC+lJrAiAGFbKQPRQBcsS62h/UpVoyT8OevGaVqGCCGNvznyZV3Jp3ajkAx2k5BX3lO8gjjGnNN3JssbeEGWoDYICQ2qrKbT3xWFiqDmJI5V7f3XuTPa6BkTxM8NRR4rewOYXN540Uh1GXz2Ja8UqLzumHUUUuzkws7OB+F9FIXhOaZS+qWs6UR+J0f9pez+PTqbiW0qyB6B0kv1TkEoHNxA8H9GdLghiyrnqx17hcid/MBmbf+pEMrGmo38Ni/xNV32507CmiyGjbnp5sTSaZOxbyd2n3L4adUcBsrOqlDm/pAoVrEdqU1qeNHFmxVk+qD7F+Vx/XaoGLPDyMSbK8spTBjiV5z9M+C6doKy32kgdYnIf/lNNNIs45Dm0gp10FjOHMBiUJVDhrEcK0rVcHiCgexDR728hydG3GSq3uFDmJej4L7Ac5rZMg1Duu6tB2SgADArXchp0DjiAjuFfuKuGhJs8yEIe+mGBnk414JnD//CWWxV9YHZDrqojZ3RsbZ6RsisHxrR6j1c/SY0MblCnuWKOE8OVu5n9KVQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(186009)(1800799009)(451199024)(6486002)(6506007)(6666004)(6512007)(83380400001)(26005)(2616005)(54906003)(66946007)(38100700002)(6916009)(66556008)(66476007)(5660300002)(316002)(36756003)(41300700001)(86362001)(31696002)(8676002)(8936002)(4326008)(31686004)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJtem1GNytuUmVETkxjak80NlpYSTFqLzdFMVUyTjU5ejZlOUhmQ0hpeW1R?=
 =?utf-8?B?TWZhQzFGNHdXRXc3SGhaM2g0dkVuaGU5eXQrWm9xdnlBRDRDWk13My8ySTBT?=
 =?utf-8?B?Mys1SUo3QVRXd052MEtUaUNoODc0bjllZ2VBNFFEVEhMcEZZSVJtcEl3Tmc0?=
 =?utf-8?B?WXFyaWVJa0thTE9pTVp0R1hWTzlZdDYvWkYzMm92c3h2U09XZVRHcVVGSk1p?=
 =?utf-8?B?SUZmRDR4aFlVV3lUVHV6WUEzTVZ2OG5uQ3JDdVNPVEEzazNJMCtMRGtISTQr?=
 =?utf-8?B?dFJZd0twR2MrL1hxeDA1K3RNeFZxK3R1ek5ucU0rYVB4dkRlTkFsbVhrdXdp?=
 =?utf-8?B?SUMwZUJpRHY0SzRpbVNOVG5rRkdKcEJEejZYTkxMWnkyMUpZVEloT2trTkEr?=
 =?utf-8?B?UXhBMjQzWDVjdXZDQ0VCSDB5UXQ1NldKY2g5d0hVclNLWU5zQ3VoTmJTSTU1?=
 =?utf-8?B?OS9OS0IzQVBGbmpOWHY5N0Nkem13MDZwVXI1azNSbG5KbHpvNXdscmFOU2hF?=
 =?utf-8?B?RmQ1dnNlQStsby9maXVEZ2RsanlraWlyeUNUcmU4NHV5ZlJTV3kvY1pwZ3V0?=
 =?utf-8?B?NmlOQmI0UjVzVUJ3cnpXOWVFVjUrSXhvOEZ2eVdsa09vRGhIT0k3c3RPdnNN?=
 =?utf-8?B?cmllTDNlTW9tekk3cGI4RVp6dDN5QndZc1ZIQlNPeS9UdWJ1aUs4SDNYTTZT?=
 =?utf-8?B?RFBueENiS3FuUjc1SWR1YTJkeUhzWVZ5dUl1MDVxN0tBNUsvMlZpMFZWK1Nt?=
 =?utf-8?B?WHV0U3YwaDdOdm16Q0pmcWhpNlA0TVBDTytjSW9SakRybm5xbGZEUks2WXhD?=
 =?utf-8?B?VmVCbWpvR0FKeEN0cGoxUDZacWNTbmRvOUNUY3NhQUVMK1BNOHcxK2paeXdY?=
 =?utf-8?B?WCtVYTgxbjdTODR0c2Fud1pWSVkyODczanB5Q09YTm1FUW5xMWhqNW1keE1w?=
 =?utf-8?B?SmJQQ1REdVprZ0tYWVZwR3o1S0dKQkVrWklxaFNHSnNmTzRTVGtGTTIxN2ZE?=
 =?utf-8?B?WUQwWVlFaGVqbEJuenhnNzMzT3hQeGs2dzl4SWFLR2w4UXBJMVdWb2JBTnhZ?=
 =?utf-8?B?N3E1VWhDZm1HdVBJV0NGVjREWSs0aWw2cWJsU3lwOEtPbTA3aDdoK1dZNTBH?=
 =?utf-8?B?dHVnV2xqT3dGb1JlTGcrcWZieDlLVTRtMEx2MVhsaS9FV29BSGRiYjdiSGN5?=
 =?utf-8?B?dS91QU1qeUFjOGFPT0hxZTc5M05yOTh3bnRkZjgyVEtMcjB2TlBxZml2UjVD?=
 =?utf-8?B?TzEybkhER1pyM3ZkTXhMb2JqUXdjTHJpb04xcWh6K0pGZTVOT2s2cEd0SHlB?=
 =?utf-8?B?em1XNkNUMDNaN0NOVUdhUVpXdHlneGVHcFhiR0VuNjR1M2ZQQXlWL2NQN3ds?=
 =?utf-8?B?ajd0dktjNmlXUjJFMC84RTJjTjNkTm9WZHQweDlMbURBaEpoUnZkWXl1cVp1?=
 =?utf-8?B?M1kreTh4VDVMV0FvdUUyV3VRMFRoMk5aRmRqUFZlWXc5cXpkTE11VmFMdkI0?=
 =?utf-8?B?aThvekZaVGZheTUxVXRRcVlGRHRTVXhQMThyQU5MdEhwSHFpb0tMMzFvOG9M?=
 =?utf-8?B?SGlIcDVwajJmRnJUTTdVczlmdm5FY296RmxHVlhHN1BtcDlMdHlOak5uNGlR?=
 =?utf-8?B?OVpoeWR1TVkrQkppSmRuZmI2bzZITXMvc3BvWWxUZlprNk5DY1BjanNjOFF1?=
 =?utf-8?B?NjRqdFd1cnpwYkhEOHg3VFpnbHlUbHE0N2MrTUF2azhkd0d3Y2ZyUkhyanl4?=
 =?utf-8?B?bE5EUXFtRG5zckxLdFpTUFZrZVE2RW12RGFVQXliT2FIQytWSExxazJteVNi?=
 =?utf-8?B?bFpqZVJscE5FY3BnTkJWbUZRUkJoUURKTjFBQ1kxRE1idlVmc01HaGZYWlRz?=
 =?utf-8?B?aTNkTnJOTWdMWHkrQkRzVzFmcHVKTHAvRVhvcDE2SXdDU3FEQU56a1ViOElG?=
 =?utf-8?B?cEs4czhOWUR6WFlTV1dLVnhINTlZOFgwVzQzeUhJc0xlZ09zMlFiWWJqcUMw?=
 =?utf-8?B?VFFZNzYwTVJnN3ZvM3VzRFluMnpMaHQwV3RHNkRocE1LbDJxSUVKMU5aTG1H?=
 =?utf-8?B?UENKbFI5SlEyYUhCOWlKT3orSEFxenB4dkcrUzhMaU5wdHJzaVgyNFY5Vmcr?=
 =?utf-8?Q?5fVo97I2+bxoWGFms2yh7L6Fy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72da8825-554a-46fd-df18-08dbaf767968
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 07:45:58.1860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU7qumYpuP7KKTH050EZ0hZXANM9fyv/rS+Y/nW46iZ5Afrq5MCz7BSpA1u08h3zk41bd0qMXBF/CFyt3wCuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771

Replace Arm- and x86-specific lines with wildcard ones, thus covering
all architectures. Uniformly permit an extra sub-directory level to be
used, as is already the case for xen/include/.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Unfold, for F: not being handled as originally expected.
v2: Further fold patterns.
---
Triggered by me looking at the entry in the context of Oleksii's RISC-V
preparatory patch.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,14 +559,18 @@ R:	Alexandru Isaila <aisaila@bitdefender
 R:	Petre Pircalabu <ppircalabu@bitdefender.com>
 S:	Supported
 F:	tools/misc/xen-access.c
+F:	xen/arch/*/*/mem_access.c
+F:	xen/arch/*/*/monitor.c
+F:	xen/arch/*/*/vm_event.c
+F:	xen/arch/*/include/asm/*/mem_access.h
+F:	xen/arch/*/include/asm/*/monitor.h
+F:	xen/arch/*/include/asm/*/vm_event.h
+F:	xen/arch/*/include/asm/mem_access.h
+F:	xen/arch/*/include/asm/monitor.h
+F:	xen/arch/*/include/asm/vm_event.h
+F:	xen/arch/*/mem_access.c
 F:	xen/arch/*/monitor.c
 F:	xen/arch/*/vm_event.c
-F:	xen/arch/arm/mem_access.c
-F:	xen/arch/x86/include/asm/hvm/monitor.h
-F:	xen/arch/x86/include/asm/hvm/vm_event.h
-F:	xen/arch/x86/mm/mem_access.c
-F:	xen/arch/x86/hvm/monitor.c
-F:	xen/arch/x86/hvm/vm_event.c
 F:	xen/common/mem_access.c
 F:	xen/common/monitor.c
 F:	xen/common/vm_event.c

