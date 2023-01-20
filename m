Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74F674F9A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 09:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481500.746430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pImwq-0004Ur-9D; Fri, 20 Jan 2023 08:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481500.746430; Fri, 20 Jan 2023 08:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pImwq-0004Su-6V; Fri, 20 Jan 2023 08:40:32 +0000
Received: by outflank-mailman (input) for mailman id 481500;
 Fri, 20 Jan 2023 08:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pImwp-0004So-1s
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 08:40:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2073.outbound.protection.outlook.com [40.107.15.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 175c1b62-989e-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 09:40:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8851.eurprd04.prod.outlook.com (2603:10a6:20b:42e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 08:40:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 08:40:26 +0000
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
X-Inumbo-ID: 175c1b62-989e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7/s1tWXcEnh3+PUZI+b9bJkNdJm7Ep27tGJQF0rdYBFPHeCx2gg/nUGjnxte4rb57jX77nizsckb94K/MpGVOD865qEdhsWDaO3yvc1nQbdKCUKzsNeBZRAW9UcYC7z/fZMfzRD/aoMu6R25mlltCafFLkir/f+gyCaTdDg7v+iGOK77Aoc1S2a1D3Saryewhu17LzYH0tjJgAb9yRpxiNh+hqW/Hq5FvxvMPACld4nCLpH7QFbScQ5SWGLZfM7R0UKg/VqB8BAXpE5kfCSywMlfCENoQZ9eM4gZbufq7pibkbZC3Pfpn0kFiAt0HGmXoC8vFH1XFk+pZX5EQcmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aqu6V3CMXWMqPAvcH9eTQ9aMRxMNq1okf+SC9IX8C0=;
 b=lmc3VPl0+NfaVmvqv30Wx5nWoEwUe3Rot7L8xOq/IDbyv9IjLYevvJuDThOu/s/XSgu1MGKR8xlkd4JWQkkC/s915YYbCZAg1S28z5PJRg2t6TP2Tq74GvMYwaOODOlLzw10vMR9k6U2ImtOd0dqc8l7x4i4paJ4EhRnuQVgIjapMUO2tUY5xjXRnk95MoeAOdk+t91Fcjhwj4NJw/ADi8aeYTND7RZOEOB919hLCbUjF6gMEOFjIECAfo+e/smTjdqWSsXTIYyhoc1pLtgUwYBS1Vc3M61uFpu75aFfDCHvj96IH6JN/cp7yFKd+yYnA53xvtt4CahVyN9FGwXjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aqu6V3CMXWMqPAvcH9eTQ9aMRxMNq1okf+SC9IX8C0=;
 b=qsrDuIL2p65AUW+sYLHzBYnuJ03dd1dbzmj2Dyw4c3MenWdby9zIPWGi4BoF1DEta7HVoy9U2uRRcw6OFTH0b1BikU4osKcISrHcpQAHFQN7Sh8Ok9LhQr9Lcks0oLOy9KBN0XpN8roQo5LvGnM5hZrAt2j2+gVLAiYrod21mDuHJXz15gUSk/dTLJd8GMvUSj7IbXiZ676OmtF7MwLYQ4/sMzRTVzBilLmQ+Z3L8h5D79ZjnSrWh1rmjhhLfk0r0Vp+hRV9kIVRlRS96BsgIS+oGJjwCCCB1A2bzlgELeXs9Ldf+zbEevRRFQbO4DbBAZPct6m1SwH8n+IISWqvUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
Date: Fri, 20 Jan 2023 09:40:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/symbols: drop asm/types.h inclusion
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5a97d3-5c9b-465c-f86a-08dafac1fa9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/M6oxcoBL/EOp7QJQZDNeNOBWydxmEasKkON3+qc7LVfu7OMCza2nmOIOm29JyYNbn4kAxyYKLlYz9ltg4MNp8yXlCB8G6yjuzH0eN6yUqYzjjEi34L24btByLkUArDaWsA6IIKO27nGUv/CUaB+sm6drVi7Ch6xyF4FK3xjYz5riTeotvcVq5jMOmoytLpYC5+VKzgbp04btp9/1+1gQyf0X5kmCc08Ovk8qChQPfgysZo2aiR0EspoUpj2ZZQ7Jm53AUgIao/zwDdv2tFP48OPdVYFqxkyYm1jKoLtnqvegyWyxsuVGR9+tAFTUVxMX+phdJo3QWVW7J1mwsmIzjHDoBILq850Perp9uXxZBK1//yhE19i9XkuLmfF/5r9Egs88UtKGNrYEG+9SUKCkAK5NcilN7upeZpBfhBQsPIgTdzqwHBI+yE6Wt9sRxPVR9FSkuOuplF6VYs4QKDPgC/XbQTOhV9u8sygWhiOgdUSX8K+YAsEdOXWY+pr68T0QEyqBfXyqxEP5DWYKVx9LoL4IX+JVy09fveX/M7fJah7kVguGXG4Ar5rIrzdLw5VJ4xfLepcQKO/GFJpr9Mczn4Q7xZdaXSLIFW6tzAC9uCaqih97YLlgLj/MUmhKrvCTp5GbV9BUQfbtP7X2Nfr7sEmQ+rOskkff1LKfDWfi8RFLJQch8pcZ/8dgwO5npwloEPjLfw3qJqwpwDdWNYf4TPAK4KH5+fxK23P94oMdAGZMi6bs6ogWDOEnwRcbAa4NkKr8+5wDnrVA/5Vjkr7/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6512007)(186003)(2906002)(26005)(54906003)(6506007)(316002)(2616005)(6486002)(478600001)(36756003)(31696002)(38100700002)(86362001)(41300700001)(4326008)(7416002)(5660300002)(31686004)(8936002)(66946007)(66556008)(66476007)(6916009)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZFL3k1T0Zrc0RFalVhVERCdG5uTFErdndXSHNMcFZyWXRBR1BZQTdZdG9K?=
 =?utf-8?B?ZG04RGFmZmNleUxtNk9UdjRsT2RhRHl2TjM2UFlSWnRKUHZUNlBsRnBabkZI?=
 =?utf-8?B?S2R5TS9mVy9OK0xJano1REVMdU5yL05wYi94eHV3clZ3bWFyMHRXMEQyODlK?=
 =?utf-8?B?UjJXUmdNazV0b3A2WGRWU2xzMWNNY1o4c0xKZ1NqWHJJUHdrWThKbXNLQk4z?=
 =?utf-8?B?bDlTZTZZK08zYnU2ZEsvUzM0b2l3dUNOTS8rNkIyeXQvN1Z0WndySkxqZzBu?=
 =?utf-8?B?VkZBVDdtakpPQ0p0UklocjJjV2QraFo4bVRlZVBaZjlpN1hJc3lZVldXME5k?=
 =?utf-8?B?TDc5UDVaSFY0WldTUW5lSE5mR3Z2ek94dHJoclVaSmxaTi9FNlJCcG9wdnBh?=
 =?utf-8?B?eXBFQ1NpTUFkZHdxUUt2RnVRaEVsNWtEeTMzSVlnRWtpalJkSDgvWTdrVGN2?=
 =?utf-8?B?VlZqQ1RMLyt2bis4TlNCQ1FaKzA3SWt1ZHRhVjJlb1pKbmxFZGphSkRtUDR0?=
 =?utf-8?B?Nkp3TGppVmxRdFdBK01sZnQ2ZXlOLzIzWXZWbFVIZ3dGL0dhRzBpY3QramIx?=
 =?utf-8?B?YWR0bXNjMVp2VUxFZ2dtczRtZFdpb0s3blU3STg1RnB6dS91VVVpbVR1clIz?=
 =?utf-8?B?c3BTTCs3L0dsQUlseDljd0xMak5IdGV0NlcyNmZ1YTJyTXhtcGo0WUFybWlK?=
 =?utf-8?B?ak04QVVYNC93ZlBlR2NzYUhveFNvOVBvd2Foclpqd3dCQldabnVCZlhGN3JS?=
 =?utf-8?B?Vm9BMnZhUm5WTnhCNDZXeDYzdkx0OFZ4elRRVTRsMksxa3V1TDFabDhwRURa?=
 =?utf-8?B?STRwN3RFcEZYN3VmM20yWE1jYk1ublZrbkdmcGZLSzk1aDYyOHpnNXdFVzc5?=
 =?utf-8?B?MVExNU1GTzdad3F2MjYxbUU2QWY5ZUpENjdNdkJBWjRkazRQTElCVzlBOTJ0?=
 =?utf-8?B?UElzQnlQdWxkZ0JiSkpEUGlsUTFISW8xbXVGVEVBS29uRHNwTzc1cXBocCtQ?=
 =?utf-8?B?MkgvT1ViZWNWbFF4L3FrUjVkbXhlRDBuMDZRQU0vM2hZNUVEMmhXRFdDek4z?=
 =?utf-8?B?bUQwdEx6VjlEWHZBOWhIbkFINXhWWjZDYkZVY2hKR2doT2N5MllUM0V1eG1o?=
 =?utf-8?B?d2hYZTN5V3p6NzJGeDlQcGMzWXd0WmVNbk01TGVxc0x3eklMWWEycnljVWdT?=
 =?utf-8?B?dFczS1FrY0xrczRhekV0bmJwdzBkTkprcWxId1AvRGZvMUlYMzhXdysxNWtQ?=
 =?utf-8?B?bFhmS3VjREhBd1NJazBQMkx6NEJORjZ3RWVqczEzVzBPYWkwRUtvdVdESmwz?=
 =?utf-8?B?WmtWYitMTGNGN043aTVJdExHMUppR09KWmlGdDRuamxWOFpaaEZXRU5GZGNx?=
 =?utf-8?B?RVhTOWpVclZYeTY5ZkdoNGUrM3J5aDUxQi9XYXRPM0xSU3ZHNHBuK3U5SDNs?=
 =?utf-8?B?QmxUOENpV0RaVW13bUM0dEFaK2w2TDBEM2E5QXJiZkhtVGlBdG5hSlE5T0xu?=
 =?utf-8?B?ZmloVkRGRFBGS1dic1huOGpOeGZHY1kxT0p0d0x4WXpYdldOMUMwNjJ1SWFV?=
 =?utf-8?B?dFZocFFLVllPZithdW1jRVZYS3Z1Vk9lZW4xcUxXd3JuQm9LaGZrRnJzWVhs?=
 =?utf-8?B?TkNYNUQzeURJb2dacWM1LzBUeGtKbjFVWUJEaUUwWG1NejIxVmYrMHM2dFhs?=
 =?utf-8?B?c21HdDJGNXh1ZHE3dFNWSnF6L280djVESEJUUUMxOUNNOFBIOTVVcStQVS8y?=
 =?utf-8?B?eEJSS3ozdTJNeGp2MUQ5YjVzbkVSOW1VUzA4NE5EOW0zZ05MNVJCMVlta2M0?=
 =?utf-8?B?Q3VESXk1TUprcHBlNHp4bndNRkdndEpIVXpGeTFnV0Y3d1RVckcvWmh0NXFL?=
 =?utf-8?B?ZHRNcVVJTnpWUlJvdHdYTHZBWTJ4bERBNWZXQVovaHFuR0hyOWlMK0c2ZlI2?=
 =?utf-8?B?Tit5bjBzK1pTR2JYOUNJWnZJN3hOeGtpalIyNXJNejJ2bGhNeHduQVVqOUto?=
 =?utf-8?B?Yk12ZWpWUGs0QlNXQ3FpNHZRclVDdm1yQW5GZjNSbnVtTVJrNEFuV1UwZmpI?=
 =?utf-8?B?cEdRekdWMEs2Q0RlVVczeHFxT2FRTCs3Tk4xV3h6eW5rd1dFOUhwaWN5RTIz?=
 =?utf-8?Q?xV6D7L27bWQSxmN8v2f9j3t2j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5a97d3-5c9b-465c-f86a-08dafac1fa9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 08:40:26.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO5rW2BgVoFZjxhADJdERUmJ2JsSSYyINFm4k6+NQiJ06LuZfPfhLV0wU5uQwDh8gBKH5ZCRB+k7JtI1ua9ddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8851

While this has been there forever, it's not clear to me what it was
(thought to be) needed for. In fact, all three instances of the header
already exclude their entire bodies when __ASSEMBLY__ was defined.
Hence, with no other assembly files including this header, we can at the
same time get rid of those conditionals.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -1,9 +1,6 @@
 #ifndef __ARM_TYPES_H__
 #define __ARM_TYPES_H__
 
-#ifndef __ASSEMBLY__
-
-
 typedef __signed__ char __s8;
 typedef unsigned char __u8;
 
@@ -54,8 +51,6 @@ typedef u64 register_t;
 #define PRIregister "016lx"
 #endif
 
-#endif /* __ASSEMBLY__ */
-
 #endif /* __ARM_TYPES_H__ */
 /*
  * Local variables:
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,8 +1,6 @@
 #ifndef __RISCV_TYPES_H__
 #define __RISCV_TYPES_H__
 
-#ifndef __ASSEMBLY__
-
 typedef __signed__ char __s8;
 typedef unsigned char __u8;
 
@@ -57,8 +55,6 @@ typedef u64 register_t;
 
 #endif
 
-#endif /* __ASSEMBLY__ */
-
 #endif /* __RISCV_TYPES_H__ */
 /*
  * Local variables:
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -1,8 +1,6 @@
 #ifndef __X86_TYPES_H__
 #define __X86_TYPES_H__
 
-#ifndef __ASSEMBLY__
-
 typedef __signed__ char __s8;
 typedef unsigned char __u8;
 
@@ -32,6 +30,4 @@ typedef unsigned long paddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
 
-#endif /* __ASSEMBLY__ */
-
 #endif /* __X86_TYPES_H__ */
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -302,7 +302,6 @@ static void write_src(void)
 		return;
 	}
 	printf("#include <xen/config.h>\n");
-	printf("#include <asm/types.h>\n");
 	printf("#if BITS_PER_LONG == 64 && !defined(SYMBOLS_ORIGIN)\n");
 	printf("#define PTR .quad\n");
 	printf("#define ALGN .align 8\n");

