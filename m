Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5386D65CC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517922.803923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji26-0001bB-Fa; Tue, 04 Apr 2023 14:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517922.803923; Tue, 04 Apr 2023 14:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji26-0001ZB-CQ; Tue, 04 Apr 2023 14:53:14 +0000
Received: by outflank-mailman (input) for mailman id 517922;
 Tue, 04 Apr 2023 14:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji25-0001Yx-5r
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:53:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe02::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b18823a-d2f8-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:53:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:53:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:53:08 +0000
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
X-Inumbo-ID: 6b18823a-d2f8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhnS7sPADdHjgqtZl6OY5N1VFd7TcKOoBUKAX5Wj7HYTQr0lRr6dNea8hpaLZJqAUB93Uu/mKBhDmSrGeqIug0TrqSafATODSiVfXbVWhK6EGrkK1F57nl19RFyCW9wgkRRQZg1MTlzbw1nZhX2hlioGNJ+Oz0dIkAXH8l2F5+rma3aMG80MBzwWU/UXES7yqM69ct5ENwFhvq1D5NN1xlPb52G/XnzI2V5H+LEpywQY+sbbnuPnp0BsonrEgV0m9+HD2jRgAaC9ROz9UUyIgZ52p1KydKEqOOy9X9osP1hOFSGwyQCurOHPR4N+UqsIxaR98UMp2HJkd52mDhZbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OsRmeonhBRsTzr/ndz1lxvEmvcIjQIblEBSSAV+qJQ=;
 b=iKBBzkhVmSNBmPbbVZtt/9+Bvf6t+CJ5i7fZKksYGXexRcH4AI79VsMXIrWuR10Z0d+Qjgyl8fXOsECQKY2LpLKyLjtmcknw78FkcBPc2wj1Iod5CsYU5Xy+0GN5Wn6EC58XpjWHUZ5FbvmBCrVhd/fB1o828GfDscH5/1cOExqb8pCyDwpLkdsNkCm2j5+aldUNOkuq5+yC3cOCBczbfAjUaw2rNw/mynZqgAXacRJCv1+u1ogtdEpRwPnCitLHbM/HjkC+oqFDeeQZDf7mbKwadV6TZ40dDO3mycH9cgEYWCwKbhorjLLl3Nqwp8/DsoMLM/OTGdw5BKSIB74IzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OsRmeonhBRsTzr/ndz1lxvEmvcIjQIblEBSSAV+qJQ=;
 b=H/+BzYGQyJBpRTkddsQ7Le2xgcpf9Fj4QhoI4ex93pTNEYhTBcFk6kmQQ6yxRPFgqGOxYNv8mi+u6M0gUlnmhtuH9euoloyQl0abjiHczMfyjUHM0H/jF5I+CnQQwYax2RDjSTt38Yss+FydQht5ubZxBgUAKulhBgPzIvVUQHK9Qg7Pb/W5u/7bQJlorxJNVk5JeadsS6+zozmbcyRX3wvRiKZ486kFodccav4Yw2ttm+hHFutDjkLnwSa7vwqqCwkbnEnIqn+WpfMapbe++RlGcrEl5wEkgUsJlhqyUqPlI9MNcD/AjKq2EIQhdmQIiGbpwf80jAlutKtNgGrExA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9c212a8-8c63-91e0-eb07-8c927b62c1ca@suse.com>
Date: Tue, 4 Apr 2023 16:53:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 5/9] x86emul: re-use new stub_exn field in state structure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
In-Reply-To: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8fae01-9a9b-4b73-bf58-08db351c4dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0fcJcWaMjcAJuGfgmgwQCc8hYlnF/F4r4Krnj/w3y+AQyAHYAzKXvpwvAqS47/6wpmlbaW3FXi9nhrmLQcDntR/h7pU5gH8270T6ZypJFpVzKPzYLPwteLvUdG8yMI7frfBNb4tRHjWcUII0D5y/tlchRCpZ3nSboG2DmlxwY4h8v691qjYsly8mLFswK++ToFmyaFICWPYHzkWDXDUt6/LE/NWbaUzNegvaR7ozQEdiBY2cD8XAMDCGaX7PxwSo/z6FpN3U7GPTEUMFGVouOLEG1LYKy9F9WeEua2lrsiEWlSoDc+hNlaepTceJ+GqWfLQFnPw4YTcPZaBSezePYecgrDtz4JjMbOmos2aVEa+12Tlpzg3iSzA07WgbpwhV5//Kwq53FNJHweb6tOFfaLCTmypcOLKXr+Nr4+fqDRZyG+4/kAwGzX6k8VBGQ1JKjdSkqVJAXH1oCgv+9pE1YoM1JOOldi3JOSiZFl4gCl1TOi7RZip01OBxZCq94AUE5gGyDd26xeOcY6NIix9jsq4i+Ikrs+LZFZLsMO3IqEfRMF1H8OjrPQlwEiv7pPieVgPnaGcvNapUJBkpc4J2sZi5c+UA+Aa0CBWTKb33E4LzGHE7/GHvLpM6mV4Lw1i2iQbt55W/rinGAkgsuIqpgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(66556008)(41300700001)(8676002)(4326008)(6916009)(66476007)(66946007)(316002)(5660300002)(8936002)(31686004)(54906003)(478600001)(6486002)(26005)(6512007)(6506007)(2616005)(186003)(31696002)(86362001)(38100700002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enJXZmhQZ2ZaTmZXYVI3V2VUQmNLaG9MQ2EzREdaRlZCbVQ1T09yWk1PZ3Rj?=
 =?utf-8?B?c2ZweHA5b1RWYnNzUFdQK2JEclMvTTlwaU9JT0J0K3d4MW03K0pGVktHZjZS?=
 =?utf-8?B?cm1QQ1JmTnd0Sk9heHhkbVgvczdVR1owemhZSUNXeVQrT0ljMDd1bS9ZSEJX?=
 =?utf-8?B?d29FVFM3OHpZZjJkRko3NEI3UDh0dUpIU0ZvSUpEYzRKTDdpejZhNXR2cEla?=
 =?utf-8?B?WURTN2RpcDR5UWlFTFVhelF5dldGZTg1Q0hqSHNWNmtzWld5SVpseUtWWVVW?=
 =?utf-8?B?TlJVNFdGTENadUNZSWtOdkpsNnBuRmhuQW1FQU45a3RPbnZhL1dOZU9BdGV0?=
 =?utf-8?B?V2F5Z2g4T0oxMStGRTdrcStKUm5JcFdRM0FCNmJTSURTZHJZbEh1REJKaHhj?=
 =?utf-8?B?Z0lMUkZjZnM4Z0xNWTJOU2dSejZDbW43VGw5bmE4OTNQeWV3bytMRDFGY1pT?=
 =?utf-8?B?TzlYZjlUMEMyblhBTk4wdlFPSHBWZXcxbE9BLy8vZVR3Qkw5TVV1V0hDZXoz?=
 =?utf-8?B?N05OOFk4MUlGYTFDZXpZRXZMVUhxWlpJOUo5a2JOVXI5dU1iUUY4U0tSdmJk?=
 =?utf-8?B?NmppV3pIejAwWURwSW1QbzgzSlJGeTY5aWw2cUxYZm90TUNSTW5qTVZKQmQ2?=
 =?utf-8?B?MkRmUHZzb0Fnem8zUXM5MHRIV3dXQmpucFFMc3oxeW5zNEFma0czL25XRUpQ?=
 =?utf-8?B?Q2ZiY2d4K1JvNnJiNkJ4Kzkrb0dpcUJyc0VNaGdVY3RSeUIvTjdsQ0RpeDZp?=
 =?utf-8?B?RlpSVFBPQlhaYVQyMi9qVWFsZ0NxNXQ0N0tpMkJqMldDdHQ5dTl0LzVxZy90?=
 =?utf-8?B?bVpCTTF5b3RZR1M5MG1xeXlEVGdGdFE4WFY3RWdVdW9RYTdrYk0zWTY5OGgx?=
 =?utf-8?B?RUFqeUZXVGFlM2JHNGxOdDBtZUJTcUI4bWtkYjBLQ21hY3lXYnU0dkFjQkxI?=
 =?utf-8?B?OHhTdGE3UVp5b1lqRXc1WmIrOCtyUk41a2Rpb0JOekhZMk5JaFp4NDVzbWlY?=
 =?utf-8?B?S1ViZzZEY2REcjMvRmRSbWgwQWl4MlhkMzBDay9kbDhBL0RkYk0xMnhDNkFN?=
 =?utf-8?B?VFVIRU1XdTRZNWJNSzJLL0tUQXRESUxjUTFtQ1ZmZHBFTlpRQ2l3K1dkemE5?=
 =?utf-8?B?cnpoMmQxQXdHQnBoa1V6b2U1QnQ5U0xRYktEMlFHR0V0UjNEQm1jSVRCQStH?=
 =?utf-8?B?eUFvYk44T1VWbEZFUDNBTkVCd2dOdEpRUVYzZm15QW4xbnlRWkYyWFZpbFBq?=
 =?utf-8?B?cWhGR3NvYVE3elVkZndrZ3hYK3dPZjlkM1lkL215NFZGb28yZ1dhcHVOeGpy?=
 =?utf-8?B?NnpKOXhEeEdBVmx3eDBrbDhCS1hRY3FFUWJpby85ckhseWx4S1JseGFROUVD?=
 =?utf-8?B?TTFvN3ZsU2g5a3hicmVKWnNjVmJqaUQvaWR3OFQ4MXRpU3dLczNOZkkreVBq?=
 =?utf-8?B?TjBaRjZpREcySFU0aG9RR2ttN2VkM05tbHBRdERvckZqelF4QW5jSkZLV2lx?=
 =?utf-8?B?bHBxTlcyY1NUSG5FbTNNTTA2c0dydHRYaVlpdFlIQlJ0cGR6SHNzZi9Eekov?=
 =?utf-8?B?ZkdobURTMFRxc1h3Rzc1TmFtWDVVa0E0N25hQmFva0wwa0ZYT0tjd3BhaXFr?=
 =?utf-8?B?OWFVWGJyTm9ERitjbDFRU1NFcjlaWXk0ck5oZ2pFdUUydURpTDhOeDBoaE9V?=
 =?utf-8?B?cWJRN3hRK2RqSmQxVEpLdndEZENVMzMwZXZleE1JdkF1Z2J6NlZtYkg1OGRt?=
 =?utf-8?B?d0pOOUlrSENUc0Y0T2hzMlcxZldHdE9IbDdwK29aQUQ0Z25CMEgweXFHQmNk?=
 =?utf-8?B?TXg0VUJWL3c4WFR4WVMwSDBaYW5VeUxoak85YzV5b21PY2JnaFVmVHA0SCsy?=
 =?utf-8?B?Yys2V0NMV1BBNHJIOVZqZ2lFRk42cWtQSUVPU1Frb2E1K1JCMm02Mi9VWmRW?=
 =?utf-8?B?UFdIeUJCZFRMQmVNdldLSTk5U1o5R1VXd3pMQzMrZm9MYWdrdWRXZ003L3dR?=
 =?utf-8?B?ZTljM05rNG5uenV5eVFzVkxzNmFSZnNmbHpqKzVtcGR0L1RsYTRiRkhFRnd4?=
 =?utf-8?B?RStIdm4zK000WnVGQzFXa3QwaC85S2ZkNFZ4UW9qLzBKNWFyVXRCTVBsQjBq?=
 =?utf-8?Q?ktn84LU4ppiEZIbwUArGrqL5a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8fae01-9a9b-4b73-bf58-08db351c4dbf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:53:08.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIV3jWri0WyKkPAbshbCihh7ZvMOOVJfD0Xqe9/yRCL3UUDycjWRE2eBLdrpV+NiwvSt9MsGBr4LTYQGzd0eWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

This can now also be used to reduce the number of parameters
x86emul_fpu() needs to take.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We could of course set the struct field once early in x86_emulate(), but
for now I think we're better off leaving it as NULL where not actually
needed.

--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -90,9 +90,8 @@ int x86emul_fpu(struct x86_emulate_state
                 unsigned int *insn_bytes,
                 enum x86_emulate_fpu_type *fpu_type,
 #define fpu_type (*fpu_type) /* for get_fpu() */
-                struct stub_exn *stub_exn,
-#define stub_exn (*stub_exn) /* for invoke_stub() */
                 mmval_t *mmvalp)
+#define stub_exn (*s->stub_exn) /* for invoke_stub() */
 {
     uint8_t b;
     int rc;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -764,7 +764,6 @@ int x86emul_fpu(struct x86_emulate_state
                 const struct x86_emulate_ops *ops,
                 unsigned int *insn_bytes,
                 enum x86_emulate_fpu_type *fpu_type,
-                struct stub_exn *stub_exn,
                 mmval_t *mmvalp);
 int x86emul_0f01(struct x86_emulate_state *s,
                  struct cpu_user_regs *regs,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2058,8 +2058,9 @@ x86_emulate(
 #ifndef X86EMUL_NO_FPU
     case 0x9b:  /* wait/fwait */
     case 0xd8 ... 0xdf: /* FPU */
+        state->stub_exn = &stub_exn;
         rc = x86emul_fpu(state, &_regs, &dst, &src, ctxt, ops,
-                         &insn_bytes, &fpu_type, &stub_exn, mmvalp);
+                         &insn_bytes, &fpu_type, mmvalp);
         goto dispatch_from_helper;
 #endif
 


