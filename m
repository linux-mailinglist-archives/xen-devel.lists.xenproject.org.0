Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E670DB7B
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538429.838367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QEc-00075k-9q; Tue, 23 May 2023 11:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538429.838367; Tue, 23 May 2023 11:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QEc-00074K-6i; Tue, 23 May 2023 11:31:22 +0000
Received: by outflank-mailman (input) for mailman id 538429;
 Tue, 23 May 2023 11:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1QEa-0006vL-Vm
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:31:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56baa5d0-f95d-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 13:31:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8586.eurprd04.prod.outlook.com (2603:10a6:20b:439::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 11:31:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 11:31:18 +0000
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
X-Inumbo-ID: 56baa5d0-f95d-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsUrY0M5tcQQeAN+INrKVUA+BLSmKWpLDG13sS2te5f+bXYoIl/NKU2aMmz/H2WcRH3IZW9t5zrVzYKIeekcxPl4m5+vNiqjL1XrqsFvhWzhk4BNP4qkSpARk0ze9GPgvG8+NvgkdiuDtBXfD1kSmHFFDWqLCHQMrs1gLBS/tIbPEFIEwcPc2PYXWNZQb72l0dNhXWSxehu+0i046PvAGnOi4aFrS8hLcrQDaPEmC4ek0FuVcCe4TNyboUO7ZelwWMkrbvHM55EN48ZpUXVN+nWyALuABoK8DaeFE8B7pjC9ad+zhV9MXCx8yKePvl12XcKV0EKRRiOiQT/2Lfwa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDEoGHJAvvsFh3CMZf5yMvN6tsIrJvFiC/zCIanZdQw=;
 b=jnkD67kS9jXHgf+PXTnoKzlmKetMsj9M2js5d3Uzx7r+M4meQoncW02rOh7W/22yzKlIHrURINp2XnkB6HLCu0LzelMWBJ030JpoJ2f+HVSTag9N3xtFHr8SZzpbK2i/45Ht43IlaNKcNrzCM7Ypt0l6z4dvqC56IGIKdFzYXUStyqzD9NXIhPAp1IbTBOzH8bzO9f691JFpIIPsYVi0Gv6M97ZRC6EtTrGYtuy/m0kUtPhD3w+lJJcCMDygrrYjb/AVwHbDdXI7ke8gd+MM/6LpPw3cmSSA1SnyX6KnTen1aq6M7cFDWgLTIspsnY6dTJcGpqdxabIjStYC8DYf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDEoGHJAvvsFh3CMZf5yMvN6tsIrJvFiC/zCIanZdQw=;
 b=ED2OuOySokv/WwpG8C6tztnnCIiq+gaFL8XpUM1ypkcMJ5OIAKGH8mYqeJKaOVGXTZ26wsG+hj6lTKrIAkVV1ODiPqc2LbSDOmIJ+3SKzfKYaDAU/MiVHWROzOVUjTxwP+8mzS85P7utnxr5FVqkjrlBviHv24+ISYtWJNwow/VnssjNVu/bXTJFV2X89FN3nsyW64DujUMmCn4q7pwhYObnNgGOwZZTkRbKRmwnvWJjsylDrQPdxrDxPSEsoidxZA3+qSlzwxadrSnflNd5KHwIgZlQ0buQamkIYnbSJp9YkLeQv0Q0lVX+yo59fzi6C8Kj0Wgnj536CXfVzwmh7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52f884cf-b88f-6fd9-e4d9-79da2bfde422@suse.com>
Date: Tue, 23 May 2023 13:31:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v2 2/2] x86: also mark assembler globals hidden
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
In-Reply-To: <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f72934c-dcde-4015-cf7d-08db5b8139b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hKh987ANTY7QXKM3mkn3cpbaDerUfJLa0QC48zSdUIlMBU7QnO0FTR1KQKOfaQqozIEm2z3n1ojpA6/2luBm57u2phnasHldTbRGh3DRc3rRZhGF9wLEHf2nX/OzfBh9AIaZdoVABu6ChUkWXBRo4tmHZIW8d2HB5caxDIAWDkuorJ1bhDM6mINyKaTpKzgvQf/SHAsk0J1iyrgJsfW9IvsjqL7GMbR0N2W4ZgclFA9JXSI/6pap2A59KJvWqNV9ck+MU0RDCmukpHWLaab0zD1af/heqQIXJXecpwI414ZurP634ns8oEe5PBRRBPgbDPhEZbRpNZr/o/me23btPHQf9sOv8t3NPF2j6m1HZIr7Hi5wUNafxDEXiF1WZfSp/idcNNAR+4pUhHecY+AGJ3bCXz8yB78piXA/uqVA7+lFVMVwSDxRLuiu+FkKEZhnZtCoYjca8d16n5wEy6TjLp42ihjfdzS7/HNUYZMjRXHdU7j/eea/+VcbA4e4Fu82LFf4tnbhIbuXLkKgFWfYyUq1eQqJr9TF/Ov9XgW9+H4iktbehb+buxZ1esIczTBksgq9lGGWn6tQC4xXP2KQ6Y0G2UINsYfg55utlQlMHVKH2MDTboEU8FqEGXcTVQg13QpMIoCWPWC5Y95RB3y12g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(41300700001)(6486002)(316002)(26005)(6506007)(6512007)(5660300002)(7416002)(36756003)(8936002)(8676002)(38100700002)(478600001)(31696002)(86362001)(2616005)(54906003)(31686004)(4744005)(6916009)(186003)(2906002)(66556008)(66476007)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpTU3lPblFybnl4R3EyT3dTTGpGNDk3cEc4YjJSSFEycGdmZWFmWGMrN21G?=
 =?utf-8?B?NDNMaTByQXFrTXVlSlJnU0dncFh3L2E5V3lGVHFSVldNZXF4ZzI0THZDbjd3?=
 =?utf-8?B?VEJDK3ZnU3FMaGdDb21VWDZSTEI4d1VHdjZFRkkzSmE2MENISVp4VVhPSW5M?=
 =?utf-8?B?T04xdmlFYkR5c3A4VHMwTXZ0VFZDWTJtRFZaalBsdlpJM2VySVIwaWE0NFJZ?=
 =?utf-8?B?c0pzL0VTM3M5bmJMYlFNU2J6aHlVR2xkRE1sUFBoY2pRTFFHNzBnR2Z2ZTgz?=
 =?utf-8?B?ai9YVUJnMks0cDJHZWVVUGlxSjNod3E3T2dTZmN1NW9XT25nY3Z2T3NsV3JO?=
 =?utf-8?B?V1FDbXpqZ3NEOVNhcEs3aHZWbDgxRmNvQndQSGk5VmtxTGFQdW1NSnBCNHd6?=
 =?utf-8?B?VDZLRGMxdUhXNlhBdHVsMUg3K2NDMzRCRi9BcnNEa3NIdFlEU2NTUHZQRGNS?=
 =?utf-8?B?SElPMFpxMTQ4WStZMS9ITjIwYzBEN1lob1RwSHRmVklqTlZWb0hRZ21BWXFN?=
 =?utf-8?B?NFJBUStTZFQzdWFxUmRwSUh0d210Q2YrOSt4YXZrSmh4cHNPK1R2c3VUSFk2?=
 =?utf-8?B?ODNtWUxNV0xlRjdRU3VDQ1NabklCZE5UcjNFaDAzMjAzUVhEYTE4aGdEUE0v?=
 =?utf-8?B?OWt6eUhlaGFQek40UEZwRFhUdDJOcTRFWDF5SlR4REdYRVYzb0w3UUMrZ0pC?=
 =?utf-8?B?YkFTaUVRdU1MV1E0WFFlWVVxWXBzVjdLSm5tQnAvMzFEVUxQZVJ4TURIL2Za?=
 =?utf-8?B?b1A2RHpvUFMvR2ViRlJNOEdxOFVsNTVQR0pSVXJ1dUdmanVMYzBrNC9vMk1T?=
 =?utf-8?B?UVNGZkpub1VmTU5RaEhFMGVJSjB6SEVZa1BWelY4dTRCOWpDNEphL3ErSmcv?=
 =?utf-8?B?ZjQwVVNCeWRMcG9GUU5pTkc3MEV4VjdmWlJWRjlCYzFmM3ZRcWdrVk8wRDFv?=
 =?utf-8?B?QkFoQjI5aHNFT01GOXVQMlJ5NzVHMDJtSmtvaCtScngwQzRIQTlaM0lUUVdV?=
 =?utf-8?B?Y3dtREszYXZ1Y3BUUXZ4K0RYaEhtZ21QYlJ3a3lpc1VodWVwdlBRQ2NoVW5B?=
 =?utf-8?B?WTRuQmpqanlMbFhscThNaCtaemRHWTE2cnBPNEwzWjQ2QlpZZ3pxNDUyTjVZ?=
 =?utf-8?B?bE03NnVsNVM4VW1pdWdCNFZ5NnRoMURYYkxpeFZsWkRDY2ZOQW9ZdWhRekNw?=
 =?utf-8?B?OEpmNHpvRUx1bk84TUMzZ3VCaVBrajFoMERTUU53aytWRFRJRGY2bDBEQjFk?=
 =?utf-8?B?RjN0Z25raXl5YUlPaGhzdHFhaFRlR3dUK3ZKN0tlVWwyZUhraXVmbngzSG1P?=
 =?utf-8?B?MFJLdHhVZkNaM242Z1ZxL3dXRkI1amtXbkZsSEdDWHZiQ3B4SnkrMXgwRFJN?=
 =?utf-8?B?SjdzOU9YN3hLN2VmdEZjQUJKVTd3dDZuVU1NdlBDQlBiZHkvSWdaWm85Nk9h?=
 =?utf-8?B?azBrV3pjbVpwVmpNM1RnMEQ4MFU2cVY5dEVrbkRmZXBvdVRnZVpaUVdNNVhl?=
 =?utf-8?B?eEZSRENiSm4wbWFwRVdEV1g1QjhsRkRRdkxqcEYwcUo1b0hjTFRveGZLZlFm?=
 =?utf-8?B?SWVuUmhqU3Y3OUVUQkREVFU4RTI0V2lhcWs2bnY4UXlyR0FxQkh2Qm5IZy9S?=
 =?utf-8?B?SjJNcTlWUW16cFk0WENtWlV2Z1pnVVRtZFVYL3F1b1lyZ0dDbGZ4YWx6SFBW?=
 =?utf-8?B?eTVzYUJnNXdhVFplSlY2Skp3cEMzMi9tZmZHUzdHUFo0QjBTS281WE5EWHZS?=
 =?utf-8?B?RTFMZ0NaUkp0L054RStMdTBmbmZkQ1dVRHI3NDVSLzVqSVdrM0UweC9zVHZ3?=
 =?utf-8?B?Z1FPVHdBcDBMeXFxVFZtbUZTRTlkdUdVRCszVHdVbDRqOVd1MmZnaEVSQmxJ?=
 =?utf-8?B?OTlqWlpoTlNaVjZlUEsxU3dKNjdMNkRLM0JVV0Uvd2NmUm1Oa00rM2hIbTRP?=
 =?utf-8?B?ckJoekUwYnJKOGN5YTRiT2xsQ1d0aWRCd1MxblVkYmVLWmF0dWVZVTV0eHRw?=
 =?utf-8?B?MngwYUFtcllScHoyS2s2THpFTWJVZ2U1b3ZVYXFWN25IeVJXa096WUZZeWkx?=
 =?utf-8?B?VzIyMEVTbFJXT2tVNnYwK1l6RXZ5b21pUFBvSzEzZUlHMmV0TTdMZS80MmhT?=
 =?utf-8?Q?zkhFFCiewoIFDFHrm8HZ0uRNB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f72934c-dcde-4015-cf7d-08db5b8139b6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:31:18.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7wFSsDTLDwcGMsLZ5oqJxWvh0v9KqmFAdchDr8xLodaPhtgDv1+t9cKe9bVz334xmLoD8JDWe2+9F2/B/l6jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8586

Let's have assembler symbols be consistent with C ones. In principle
there are (a few) cases where gas can produce smaller code this way,
just that for now there's a gas bug causing smaller code to be emitted
even when that shouldn't be the case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -83,7 +83,7 @@ register unsigned long current_stack_poi
 
 #define SYM_ALIGN(algn...) .balign algn
 
-#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_GLOBAL(name) .globl name; .hidden name
 #define SYM_L_WEAK(name)   .weak name
 #define SYM_L_LOCAL(name)  /* nothing */
 
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -45,11 +45,11 @@
 #ifdef __ASSEMBLY__
 #define ALIGN .align 16,0x90
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
 


