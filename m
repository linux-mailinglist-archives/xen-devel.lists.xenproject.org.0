Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037554C53C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 11:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349813.575979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pnb-0001Vh-Rh; Wed, 15 Jun 2022 09:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349813.575979; Wed, 15 Jun 2022 09:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pnb-0001Tb-OQ; Wed, 15 Jun 2022 09:58:55 +0000
Received: by outflank-mailman (input) for mailman id 349813;
 Wed, 15 Jun 2022 09:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Pna-0001TN-NN
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 09:58:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1daba6b-ec91-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 11:58:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4298.eurprd04.prod.outlook.com (2603:10a6:5:17::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 09:58:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:58:47 +0000
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
X-Inumbo-ID: c1daba6b-ec91-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WExqJqpMkVjwnRekNtmxgtQxc9xNnxHCGT/yXmNYP5sqIHiAldW9dg7yEKQEJRJ3dtqs3vMTPKmIIqfUxm+hVaMd/Xm1hfh/d3pYhfO5DyLkuE/Y56CYfx75t1r+9C7kvfFiqqvuewmbeVIxlPwoTJm4nb2ANApGF6yj5VjvgpWzzy8pM/TVUMpWwrqwpaf6Gjw4Pjo0fQmekX2jjU2rQFG9nVUEFm8F3K2kkPeQ+xT3CKGIRvqxL3YArrY3dWvHYiRgoDMQm2Pww5NhAOhwb/04bTxuLB3cbdrFANRtiiEhzMyXm1aKnxSqzQ5VeDYyDGxzW1HMKN1HelNTTK+TgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI43HshyVfkehmcEm8x8RCVyx8U9QvkUor1Lh6s7XuE=;
 b=f3MuB7Oomhlddy/cNCMSO+aFhzG1/nOakmGEl+rGs8p7OjAFH1BuVpICuyNZ4vnW587rJmurw4tnYPgXUMCL3hUk8mWrJOEtkSBANll+5uyCVpn0IYqPM9Zoz3cASe3KVVcvZDnfQjq42BQd78TXhek720+bnHkw/gDq0wkUIgoW6WUdTeXKqh4JiXRJoewrnJjkjLmc2QkGybrPyoZDDw1QiheD2AdGETa+7/N25k6MNTVkMh/re8MwGh10r7s79ZPjINp5v1NNzfCVP1WPB80sU0+Sr49/Fj8SfoK524qqQo6BPdPx+pHnXXVkwZkiCg7LOdqr15zVqPcmR+KWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI43HshyVfkehmcEm8x8RCVyx8U9QvkUor1Lh6s7XuE=;
 b=bZPK/3jF+HPnTMrF4SHqFWFTzK5wf6xhj1ewBSnWvFkFlIWJth6x7kH9FO73owFMy5stLUu4FWA6QZFlpdUhGdQgUgDSC6UDO6V0VZTcKPjaLzhrumdO1ltUvl5pP3qFQX2v8EwosDvUyZYzyWUNqi/VixZWx7ZBAevogMesf8t5bOkkV24BF6Ab/k4n7hz8AImuEYP/fOoFyxVwSrguGbiS5icbSfPmLoyQkqr+hgv2ROQvE/8R3JekBZk0r3A57+hQpy9ZAJJ0HJNi1N1PsZDJunssSK3IVO2/VpbPK/q2FfbISdMjsVlwHx6GlCE6DGIZEyVqoGRnF5WbQ3eGCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8ecf582-2c1c-ca41-f289-b6a6a080061c@suse.com>
Date: Wed, 15 Jun 2022 11:58:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 1/8] x86emul: split off opcode 0f01 handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0183.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffd05215-d701-4374-0e86-08da4eb5a422
X-MS-TrafficTypeDiagnostic: DB7PR04MB4298:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB42984947B9D8E2302668E3FFB3AD9@DB7PR04MB4298.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X05yqCfysAVJXKv0RphYsIp/w54+m+urqrCIcLXj44tCZbzuIyRtoJDP3dMEenBvG/NjXb6KqX4LvXI9cDsKeev/IRuamD2YkqTejrwaaN0QJfipnTZco3/uSs50/b7kcK35RW8omlf7GHmW3Vk8Ul/KaxeUjo+ggTwwK6sDqcn2A2oNNxlNXckkI6DPkYFHhG7OqMalxmN4ad8WsOOVXkTzhsDwRhCBGii7Ht/LSEiioMmaB+u57/AtOkIGaxaau8I+WAd1lLGbrnEwp4wae/2s43a3jZgKOmWesX1gCG76BiBk5pO4DrHerOIpt8uf0xfRij4F5eugVAZUV5V84LPBxwYM8c6Qlia51LqPnb25NX5W460kE2B8uiCQ0yn/v07ahXm1Zd1Cbj/lk/EH+Pymxw10kM3uRZa4v9mJNPxMLUDX58LMSEEFi+HOc8cGZ0fwsp1fJBBXS+O6e1OFYk48zreeE/CHSq7mKdvu1a/tbwg0qW2mSsqBQ5uB45gjxkEii9UsXezyp3L4RWo6pLEt/OlJqZcxeweDOpx0VtWAU7fGSzqGGhWviM9Wl6mHkJmk0CxEqahHT1cTnL3e3yAeg3763Gy2ng7XQem8U4ZcdOkF6xFi8NZFcQ+P68q+ltDh+b4NnoLXubp4k9qHz1++sfRhINlZRc2PHLgeFMCVMYau4K14x7TkbON5/v7fGLYktVlRD2KK+ym+MN9ogSINIuh9NYGTOIUaax95prUP2jmMUGEsno2emfxt0XmLxGC2NDIy5gDnPUBvda5kfBGx/0k5XFimJTPpQfImCLr+EKK6HS2Ti9MC6Gq24TiZt+clt8hqA4/36IYdf4b5Qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(66574015)(36756003)(54906003)(31686004)(186003)(6916009)(30864003)(83380400001)(5660300002)(2906002)(316002)(6512007)(2616005)(66946007)(66476007)(66556008)(4326008)(8936002)(508600001)(8676002)(86362001)(31696002)(26005)(6486002)(6506007)(38100700002)(2004002)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXlKbG9jenZncEEyRTN6OHRKRENYWVlRMUlJd1hFT24vRnNQWjk4bXlHV2Zy?=
 =?utf-8?B?VzVlN1JDNHVlLzdnTU9Pc2FacXlQcEtuS3RBU2IwZDlzVXE2SWRvVkltUUtl?=
 =?utf-8?B?Qjg1VmZBWWJJRzBSTXZMbFZ5TjBNUjBBbmg3aExVNW4wSTZhNElQSk55blU1?=
 =?utf-8?B?Rk1PT2VRZ0ZBMEJ4UXBxYW9JYUxWTDdnTHlnQ2Mrc2tNQTdqMDIrZ1B3ZHJL?=
 =?utf-8?B?REpEMEc5UGI0Q0RNV3VQazhhS2c5cjVlVzRqdWpLd202TmQ1Sm5XRnQxMGNy?=
 =?utf-8?B?eFhoU21Fb3RjZWJldkdDOHp0YjBBbWpQaEtkRzVVRnBhcXV2bDNtREVNRnpr?=
 =?utf-8?B?SzlwNWNjMkhCQTlUb21pa21hcFcwL0prUXBicEwxOXZYaWljTnlMSmJlT0U5?=
 =?utf-8?B?MlI4WDRFWFVrM1FCcTNRWS93WS9oNEkzb2JFZmo0UDFtaXRtSzB5UVdtL1Fr?=
 =?utf-8?B?b3dLNi9MazZnSWJwNWdFTzBLSTVBWmxrNE9McjFYNlFPVGhIaTM2MjhSdEdZ?=
 =?utf-8?B?dEpsWnBSLzF0YURHeUl0ZlZ3Q3AwWmJ5SEpyZnFMR3pFUEw5UVJlZlowQjVP?=
 =?utf-8?B?OEhCRVZwS295b2V5YWhQVGsrVWgwc0d5MFFVUitvTURBdjBobUpRYVFORjZv?=
 =?utf-8?B?VzV5OVBqZWMvU1FiZkh0c05oSTB4TGtnQktzaGtPeTA2VXJTaUdnaDJicnNI?=
 =?utf-8?B?Z1NPUGZqaStOa2VCQkFyc0tqcWtUVHlsM0htY292OFVCQk1FYlpBTXV2NFUy?=
 =?utf-8?B?Z0lhRDJNTzFXaHprT1hiemNsYXpaZndKQWdBVnBYV1VZd09JQXBWd0huTUc0?=
 =?utf-8?B?MFBNOVRUWm1sa1JoOVFuWEloWjJZYW1vT1Y1UDR1VUNoKzdsODFQUXcxN01B?=
 =?utf-8?B?OG8xRmpsZXBhMmdoTW41UTg5U2RaRVErRWZnQXhpVUw3S3BRRzN6M2pkNWxn?=
 =?utf-8?B?UFhYRDQzWEpIcExpcFNVOVNXaUxEdGlENDI5VmhsNERmRzBxd0l3MUdSNDhk?=
 =?utf-8?B?Y04wZ1ZjY3R0T3FtSi9yNFltOXI3OXBoL1lFSnJ0M1JPNHRjQmtTenZsZHpS?=
 =?utf-8?B?MVZwTWd6TzI3R2hTNXl1anZxeTE5OVZHWXpScjFZckVZbGczWUwrZzBZb3pJ?=
 =?utf-8?B?d2dpZjhkU3piaGowRnBQT3ZWUk01T0VaOEtjRXlPYWVuQ0RPYUIwMDhuQmxO?=
 =?utf-8?B?QXErZGx0RklabzBWNTVySXJ6Rm5mRDNPMGZKaDZOdkttVDNhZ29rMFZ5dml6?=
 =?utf-8?B?UjJFQm15a3ZIZVlvbm5Hc21yZzZDSDZ6QitXRXpESEsxUjFjZkpNR0xIcW5T?=
 =?utf-8?B?L1kzQ1Ntbnc4bFk5SmcxWlhkREFIenZEWjNDQWU2MXNRRUdmL1cwbXJvZGZU?=
 =?utf-8?B?Y3NKU1crTzdyYlg4WEFSRFB6YkFpTWJRY3Z6aTBiYVhjSmNnMklBaTNFc2hx?=
 =?utf-8?B?QzlMTjhBc1RRT2ZUVXNaZGVsZWRKQXMrbHZMSTBIU3dCdXJBYnZJZzNRSUxE?=
 =?utf-8?B?ZGxXV3N1U2xVNXRpVlhESzR6djZTS2Rpb1FndDZEOEthL2tQbjA4RjkwZUNj?=
 =?utf-8?B?NlVTUUNobVQ5RUU3VGh0S3BuaFFjMVdDYTh1T25ZOTVYMGV3VlJybjFGdXQ3?=
 =?utf-8?B?elBYU0svY1luZ1prdEU0NHAyWms1UnNYN3R5MkxqSmpzOVY4cHdwWVo0eWo3?=
 =?utf-8?B?OUNJY3BHcWw0VWFWcE53V0FNZzJzRDJEcy9VZjZ2c1hTc09mV0xBS1dZb3hG?=
 =?utf-8?B?S3llOXVOS1EwZHRIVXZZS3p5Y0hhRGNZQ0dWenJyMUV1WUZDelNLTHF5Nk0z?=
 =?utf-8?B?NUlML2ZIZThXcDZYMnZFNk0rclZDWDE4Ti9RVklCVXphSHYyS3B6L3FxbDJo?=
 =?utf-8?B?TkxpNFNoajBaL0lKTlZrZmp0MUczT3FKMFRtSUUyY1BXSjBmRk5JZmJtYnMy?=
 =?utf-8?B?UkpUSzFUZmppWFN3b3F5NVFQVUpRaDlxUzlGSEluTW5WM2RmVTluUHBJS2Zn?=
 =?utf-8?B?YXErN3RtVUpKM056NXh6RjZOMVJWbzVUN3NFKzFTL0lwdTFLSGtabTFWdzR5?=
 =?utf-8?B?b0VVUVdJcVRMNXJKeGk5TzR5MnR5RVp2N2tEc0RlUXJ3QU52UjNubDlZUHBW?=
 =?utf-8?B?VVpPM2g4clkrTzIyd1UwRjV4QlYvZy90OGxpRFB2b2NZa3YvZERrTmRoS1Fx?=
 =?utf-8?B?OTRzRDJGOXVDQURnWlFSM3lqV2F1MFVqdEdTQ0NzZTBNQlYwSWN3aUFFcUhu?=
 =?utf-8?B?dVV3c3dvTVBUditVcTFtSE1vTnFiRndEQ0hhc2dBUW9VdFhzYTR1TjN3VU9V?=
 =?utf-8?B?eTNqa3FGQTArUk9mclgxamo3R2ovbXNKOFlpVTdySTcvUEI4dkt3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd05215-d701-4374-0e86-08da4eb5a422
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:58:47.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppR0wZv/kXfP4NqyU3x3rBKwicI1S0fKnJJAOb7B/Y2nkDT318rez2SEoEnkXkyZl1tEFAfS+gVDT1GWGrbMnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4298

There's a fair amount of sub-cases (with some yet to be implemented), so
a separate function seems warranted.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -11,10 +11,13 @@ endif
 # Add libx86 to the build
 vpath %.c $(XEN_ROOT)/xen/lib/x86
 
+.PHONY: x86_emulate
 x86_emulate:
-	[ -L $@ ] || ln -sf $(XEN_ROOT)/xen/arch/x86/$@
+	mkdir -p $@
+	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/
 
-x86_emulate/%: x86_emulate ;
+x86_emulate/%.c: x86_emulate ;
+x86_emulate/%.h: x86_emulate ;
 
 x86-emulate.c x86-emulate.h wrappers.c: %:
 	[ -L $* ] || ln -sf $(XEN_ROOT)/tools/tests/x86_emulator/$*
@@ -31,18 +34,27 @@ x86.h := $(addprefix $(XEN_ROOT)/tools/i
                      cpuid.h cpuid-autogen.h)
 x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
 
+OBJS := fuzz-emul.o x86-emulate.o
+OBJS += x86_emulate/0f01.o
+
 # x86-emulate.c will be implicit for both
-x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h)
+x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h) x86_emulate/private.h
 
 fuzz-emul.o fuzz-emulate-cov.o cpuid.o wrappers.o: $(x86_emulate.h)
 
-x86-insn-fuzzer.a: fuzz-emul.o x86-emulate.o cpuid.o
+$(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c x86_emulate/private.h $(x86_emulate.h)
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -o $@ $< $(APPEND_CFLAGS)
+
+$(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): x86_emulate/%-cov.o: x86_emulate/%.c x86_emulate/private.h $(x86_emulate.h)
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) $(GCOV_FLAGS) -c -o $@ $< $(APPEND_CFLAGS)
+
+x86-insn-fuzzer.a: $(OBJS) cpuid.o
 	$(AR) rc $@ $^
 
-afl-harness: afl-harness.o fuzz-emul.o x86-emulate.o cpuid.o wrappers.o
+afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
 	$(CC) $(CFLAGS) $^ -o $@
 
-afl-harness-cov: afl-harness-cov.o fuzz-emul-cov.o x86-emulate-cov.o cpuid.o wrappers.o
+afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
 	$(CC) $(CFLAGS) $(GCOV_FLAGS) $^ -o $@
 
 # Common targets
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -29,7 +29,7 @@ OPMASK := avx512f avx512dq avx512bw
 
 ifeq ($(origin XEN_COMPILE_ARCH),override)
 
-HOSTCFLAGS += -m32
+HOSTCFLAGS += -m32 -I..
 
 else
 
@@ -250,7 +250,10 @@ xop.h avx512f.h: simd-fma.c
 
 endif # 32-bit override
 
-$(TARGET): x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
+OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
+OBJS += x86_emulate/0f01.o
+
+$(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
 
 .PHONY: clean
@@ -274,8 +277,10 @@ else
 run32 clean32: %32: %
 endif
 
+.PHONY: x86_emulate
 x86_emulate:
-	[ -L $@ ] || ln -sf $(XEN_ROOT)/xen/arch/x86/$@
+	mkdir -p $@
+	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/
 
 x86_emulate/%: x86_emulate ;
 
@@ -287,13 +292,13 @@ x86.h := $(addprefix $(XEN_ROOT)/tools/i
                      x86-vendors.h x86-defns.h msr-index.h) \
          $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
                      cpuid.h cpuid-autogen.h)
-x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
+x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h x86_emulate/private.h $(x86.h)
 
-x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o: %.o: %.c $(x86_emulate.h)
+$(OBJS): %.o: %.c $(x86_emulate.h)
 	$(HOSTCC) $(HOSTCFLAGS) -c -g -o $@ $<
 
 x86-emulate.o: x86_emulate/x86_emulate.c
-x86-emulate.o: HOSTCFLAGS += -D__XEN_TOOLS__
+x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
 
 # In order for our custom .type assembler directives to reliably land after
 # gcc's, we need to keep it from re-ordering top-level constructs.
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -22,11 +22,9 @@
 
 /* For generic assembly code: use macros to define operation/operand sizes. */
 #ifdef __i386__
-# define r(name)       e ## name
 # define __OS          "l"  /* Operation Suffix */
 # define __OP          "e"  /* Operand Prefix */
 #else
-# define r(name)       r ## name
 # define __OS          "q"  /* Operation Suffix */
 # define __OP          "r"  /* Operand Prefix */
 #endif
@@ -265,12 +263,12 @@ void emul_test_put_fpu(
 
 static uint32_t pkru;
 
-static unsigned int rdpkru(void)
+unsigned int rdpkru(void)
 {
     return pkru;
 }
 
-static void wrpkru(unsigned int val)
+void wrpkru(unsigned int val)
 {
     pkru = val;
 }
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -1,3 +1,6 @@
+#ifndef X86_EMULATE_H
+#define X86_EMULATE_H
+
 #include <assert.h>
 #include <stdbool.h>
 #include <stddef.h>
@@ -129,6 +132,9 @@ static inline bool xcr0_mask(uint64_t ma
     return cpu_has_xsave && ((xgetbv(0) & mask) == mask);
 }
 
+unsigned int rdpkru(void);
+void wrpkru(unsigned int val);
+
 #define cache_line_size() (cp.basic.clflush_size * 8)
 #define cpu_has_fpu        cp.basic.fpu
 #define cpu_has_mmx        cp.basic.mmx
@@ -206,3 +212,5 @@ void emul_test_put_fpu(
     struct x86_emulate_ctxt *ctxt,
     enum x86_emulate_fpu_type backout,
     const struct x86_emul_fpu_aux *aux);
+
+#endif /* X86_EMULATE_H */
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -9,6 +9,7 @@ obj-y += mm/
 obj-$(CONFIG_XENOPROF) += oprofile/
 obj-$(CONFIG_PV) += pv/
 obj-y += x86_64/
+obj-y += x86_emulate/
 
 alternative-y := alternative.init.o
 alternative-$(CONFIG_LIVEPATCH) :=
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -0,0 +1,349 @@
+/******************************************************************************
+ * 0f01.c - helper for x86_emulate.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ *
+ * Copyright (c) 2005-2007 Keir Fraser
+ * Copyright (c) 2005-2007 XenSource Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+#define ad_bytes (s->ad_bytes) /* for truncate_ea() */
+
+int x86emul_0f01(struct x86_emulate_state *s,
+                 struct cpu_user_regs *regs,
+                 struct operand *dst,
+                 struct x86_emulate_ctxt *ctxt,
+                 const struct x86_emulate_ops *ops)
+{
+    enum x86_segment seg = (s->modrm_reg & 1) ? x86_seg_idtr : x86_seg_gdtr;
+    int rc;
+
+    switch ( s->modrm )
+    {
+        unsigned long base, limit, cr0, cr0w, cr4;
+        struct segment_register sreg;
+        uint64_t msr_val;
+
+    case 0xca: /* clac */
+    case 0xcb: /* stac */
+        vcpu_must_have(smap);
+        generate_exception_if(s->vex.pfx || !mode_ring0(), X86_EXC_UD);
+
+        regs->eflags &= ~X86_EFLAGS_AC;
+        if ( s->modrm == 0xcb )
+            regs->eflags |= X86_EFLAGS_AC;
+        break;
+
+    case 0xd0: /* xgetbv */
+        generate_exception_if(s->vex.pfx, X86_EXC_UD);
+        if ( !ops->read_cr || !ops->read_xcr ||
+             ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+            cr4 = 0;
+        generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), X86_EXC_UD);
+        rc = ops->read_xcr(regs->ecx, &msr_val, ctxt);
+        if ( rc != X86EMUL_OKAY )
+            goto done;
+        regs->r(ax) = (uint32_t)msr_val;
+        regs->r(dx) = msr_val >> 32;
+        break;
+
+    case 0xd1: /* xsetbv */
+        generate_exception_if(s->vex.pfx, X86_EXC_UD);
+        if ( !ops->read_cr || !ops->write_xcr ||
+             ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+            cr4 = 0;
+        generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        rc = ops->write_xcr(regs->ecx,
+                            regs->eax | ((uint64_t)regs->edx << 32), ctxt);
+        if ( rc != X86EMUL_OKAY )
+            goto done;
+        break;
+
+    case 0xd4: /* vmfunc */
+        generate_exception_if(s->vex.pfx, X86_EXC_UD);
+        fail_if(!ops->vmfunc);
+        if ( (rc = ops->vmfunc(ctxt)) != X86EMUL_OKAY )
+            goto done;
+        break;
+
+    case 0xd5: /* xend */
+        generate_exception_if(s->vex.pfx, X86_EXC_UD);
+        generate_exception_if(!vcpu_has_rtm(), X86_EXC_UD);
+        generate_exception_if(vcpu_has_rtm(), X86_EXC_GP, 0);
+        break;
+
+    case 0xd6: /* xtest */
+        generate_exception_if(s->vex.pfx, X86_EXC_UD);
+        generate_exception_if(!vcpu_has_rtm() && !vcpu_has_hle(),
+                              X86_EXC_UD);
+        /* Neither HLE nor RTM can be active when we get here. */
+        regs->eflags |= X86_EFLAGS_ZF;
+        break;
+
+    case 0xdf: /* invlpga */
+        fail_if(!ops->read_msr);
+        if ( (rc = ops->read_msr(MSR_EFER,
+                                 &msr_val, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        /* Finding SVME set implies vcpu_has_svm(). */
+        generate_exception_if(!(msr_val & EFER_SVME) ||
+                              !in_protmode(ctxt, ops), X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        fail_if(!ops->tlb_op);
+        if ( (rc = ops->tlb_op(x86emul_invlpga, truncate_ea(regs->r(ax)),
+                               regs->ecx, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        break;
+
+    case 0xe8:
+        switch ( s->vex.pfx )
+        {
+        case vex_none: /* serialize */
+            host_and_vcpu_must_have(serialize);
+            asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
+            break;
+        case vex_f2: /* xsusldtrk */
+            vcpu_must_have(tsxldtrk);
+            /*
+             * We're never in a transactional region when coming here
+             * - nothing else to do.
+             */
+            break;
+        default:
+            return X86EMUL_UNIMPLEMENTED;
+        }
+        break;
+
+    case 0xe9:
+        switch ( s->vex.pfx )
+        {
+        case vex_f2: /* xresldtrk */
+            vcpu_must_have(tsxldtrk);
+            /*
+             * We're never in a transactional region when coming here
+             * - nothing else to do.
+             */
+            break;
+        default:
+            return X86EMUL_UNIMPLEMENTED;
+        }
+        break;
+
+    case 0xee:
+        switch ( s->vex.pfx )
+        {
+        case vex_none: /* rdpkru */
+            if ( !ops->read_cr ||
+                 ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+                cr4 = 0;
+            generate_exception_if(!(cr4 & X86_CR4_PKE), X86_EXC_UD);
+            generate_exception_if(regs->ecx, X86_EXC_GP, 0);
+            regs->r(ax) = rdpkru();
+            regs->r(dx) = 0;
+            break;
+        default:
+            return X86EMUL_UNIMPLEMENTED;
+        }
+        break;
+
+    case 0xef:
+        switch ( s->vex.pfx )
+        {
+        case vex_none: /* wrpkru */
+            if ( !ops->read_cr ||
+                 ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+                cr4 = 0;
+            generate_exception_if(!(cr4 & X86_CR4_PKE), X86_EXC_UD);
+            generate_exception_if(regs->ecx | regs->edx, X86_EXC_GP, 0);
+            wrpkru(regs->eax);
+            break;
+        default:
+            return X86EMUL_UNIMPLEMENTED;
+        }
+        break;
+
+    case 0xf8: /* swapgs */
+        generate_exception_if(!mode_64bit(), X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        fail_if(!ops->read_segment || !ops->read_msr ||
+                !ops->write_segment || !ops->write_msr);
+        if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
+                                     ctxt)) != X86EMUL_OKAY ||
+             (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                 ctxt)) != X86EMUL_OKAY ||
+             (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                  ctxt)) != X86EMUL_OKAY )
+            goto done;
+        sreg.base = msr_val;
+        if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                      ctxt)) != X86EMUL_OKAY )
+        {
+            /* Best effort unwind (i.e. no error checking). */
+            ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
+            goto done;
+        }
+        break;
+
+    case 0xf9: /* rdtscp */
+        fail_if(ops->read_msr == NULL);
+        if ( (rc = ops->read_msr(MSR_TSC_AUX,
+                                 &msr_val, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        regs->r(cx) = (uint32_t)msr_val;
+        return X86EMUL_rdtsc;
+
+    case 0xfc: /* clzero */
+    {
+        unsigned long zero = 0;
+
+        vcpu_must_have(clzero);
+
+        base = ad_bytes == 8 ? regs->r(ax) :
+               ad_bytes == 4 ? regs->eax : regs->ax;
+        limit = ctxt->cpuid->basic.clflush_size * 8;
+        generate_exception_if(limit < sizeof(long) ||
+                              (limit & (limit - 1)), X86_EXC_UD);
+        base &= ~(limit - 1);
+        if ( ops->rep_stos )
+        {
+            unsigned long nr_reps = limit / sizeof(zero);
+
+            rc = ops->rep_stos(&zero, s->ea.mem.seg, base, sizeof(zero),
+                               &nr_reps, ctxt);
+            if ( rc == X86EMUL_OKAY )
+            {
+                base += nr_reps * sizeof(zero);
+                limit -= nr_reps * sizeof(zero);
+            }
+            else if ( rc != X86EMUL_UNHANDLEABLE )
+                goto done;
+        }
+        fail_if(limit && !ops->write);
+        while ( limit )
+        {
+            rc = ops->write(s->ea.mem.seg, base, &zero, sizeof(zero), ctxt);
+            if ( rc != X86EMUL_OKAY )
+                goto done;
+            base += sizeof(zero);
+            limit -= sizeof(zero);
+        }
+        break;
+    }
+
+#define _GRP7(mod, reg) \
+        (((mod) << 6) | ((reg) << 3)) ... (((mod) << 6) | ((reg) << 3) | 7)
+#define GRP7_MEM(reg) _GRP7(0, reg): case _GRP7(1, reg): case _GRP7(2, reg)
+#define GRP7_ALL(reg) GRP7_MEM(reg): case _GRP7(3, reg)
+
+    case GRP7_MEM(0): /* sgdt */
+    case GRP7_MEM(1): /* sidt */
+        ASSERT(s->ea.type == OP_MEM);
+        generate_exception_if(umip_active(ctxt, ops), X86_EXC_GP, 0);
+        fail_if(!ops->read_segment || !ops->write);
+        if ( (rc = ops->read_segment(seg, &sreg, ctxt)) )
+            goto done;
+        if ( mode_64bit() )
+            s->op_bytes = 8;
+        else if ( s->op_bytes == 2 )
+        {
+            sreg.base &= 0xffffff;
+            s->op_bytes = 4;
+        }
+        if ( (rc = ops->write(s->ea.mem.seg, s->ea.mem.off, &sreg.limit,
+                              2, ctxt)) != X86EMUL_OKAY ||
+             (rc = ops->write(s->ea.mem.seg, truncate_ea(s->ea.mem.off + 2),
+                              &sreg.base, s->op_bytes, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        break;
+
+    case GRP7_MEM(2): /* lgdt */
+    case GRP7_MEM(3): /* lidt */
+        ASSERT(s->ea.type == OP_MEM);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        fail_if(ops->write_segment == NULL);
+        memset(&sreg, 0, sizeof(sreg));
+        if ( (rc = read_ulong(s->ea.mem.seg, s->ea.mem.off,
+                              &limit, 2, ctxt, ops)) ||
+             (rc = read_ulong(s->ea.mem.seg, truncate_ea(s->ea.mem.off + 2),
+                              &base, mode_64bit() ? 8 : 4, ctxt, ops)) )
+            goto done;
+        generate_exception_if(!is_canonical_address(base), X86_EXC_GP, 0);
+        sreg.base = base;
+        sreg.limit = limit;
+        if ( !mode_64bit() && s->op_bytes == 2 )
+            sreg.base &= 0xffffff;
+        if ( (rc = ops->write_segment(seg, &sreg, ctxt)) )
+            goto done;
+        break;
+
+    case GRP7_ALL(4): /* smsw */
+        generate_exception_if(umip_active(ctxt, ops), X86_EXC_GP, 0);
+        if ( s->ea.type == OP_MEM )
+        {
+            fail_if(!ops->write);
+            s->desc |= Mov; /* force writeback */
+            s->ea.bytes = 2;
+        }
+        else
+            s->ea.bytes = s->op_bytes;
+        *dst = s->ea;
+        fail_if(ops->read_cr == NULL);
+        if ( (rc = ops->read_cr(0, &dst->val, ctxt)) )
+            goto done;
+        break;
+
+    case GRP7_ALL(6): /* lmsw */
+        fail_if(ops->read_cr == NULL);
+        fail_if(ops->write_cr == NULL);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        if ( (rc = ops->read_cr(0, &cr0, ctxt)) )
+            goto done;
+        if ( s->ea.type == OP_REG )
+            cr0w = *s->ea.reg;
+        else if ( (rc = read_ulong(s->ea.mem.seg, s->ea.mem.off,
+                                   &cr0w, 2, ctxt, ops)) )
+            goto done;
+        /* LMSW can: (1) set bits 0-3; (2) clear bits 1-3. */
+        cr0 = (cr0 & ~0xe) | (cr0w & 0xf);
+        if ( (rc = ops->write_cr(0, cr0, ctxt)) )
+            goto done;
+        break;
+
+    case GRP7_MEM(7): /* invlpg */
+        ASSERT(s->ea.type == OP_MEM);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        fail_if(!ops->tlb_op);
+        if ( (rc = ops->tlb_op(x86emul_invlpg, s->ea.mem.off, s->ea.mem.seg,
+                               ctxt)) != X86EMUL_OKAY )
+            goto done;
+        break;
+
+#undef GRP7_ALL
+#undef GRP7_MEM
+#undef _GRP7
+
+    default:
+        return X86EMUL_UNIMPLEMENTED;
+    }
+
+    rc = X86EMUL_OKAY;
+
+ done:
+    return rc;
+}
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -0,0 +1 @@
+obj-y += 0f01.o
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -0,0 +1,531 @@
+/******************************************************************************
+ * private.h - interface between x86_emulate.c and its helpers
+ *
+ * Copyright (c) 2005-2007 Keir Fraser
+ * Copyright (c) 2005-2007 XenSource Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifdef __XEN__
+
+# include <xen/kernel.h>
+# include <asm/msr-index.h>
+# include <asm/x86_emulate.h>
+
+# ifndef CONFIG_HVM
+#  define X86EMUL_NO_FPU
+#  define X86EMUL_NO_MMX
+#  define X86EMUL_NO_SIMD
+# endif
+
+#else /* !__XEN__ */
+# include "x86-emulate.h"
+#endif
+
+#ifdef __i386__
+# define mode_64bit() false
+# define r(name) e ## name
+#else
+# define mode_64bit() (ctxt->addr_size == 64)
+# define r(name) r ## name
+#endif
+
+/* Operand sizes: 8-bit operands or specified/overridden size. */
+#define ByteOp      (1<<0) /* 8-bit operands. */
+/* Destination operand type. */
+#define DstNone     (0<<1) /* No destination operand. */
+#define DstImplicit (0<<1) /* Destination operand is implicit in the opcode. */
+#define DstBitBase  (1<<1) /* Memory operand, bit string. */
+#define DstReg      (2<<1) /* Register operand. */
+#define DstEax      DstReg /* Register EAX (aka DstReg with no ModRM) */
+#define DstMem      (3<<1) /* Memory operand. */
+#define DstMask     (3<<1)
+/* Source operand type. */
+#define SrcNone     (0<<3) /* No source operand. */
+#define SrcImplicit (0<<3) /* Source operand is implicit in the opcode. */
+#define SrcReg      (1<<3) /* Register operand. */
+#define SrcEax      SrcReg /* Register EAX (aka SrcReg with no ModRM) */
+#define SrcMem      (2<<3) /* Memory operand. */
+#define SrcMem16    (3<<3) /* Memory operand (16-bit). */
+#define SrcImm      (4<<3) /* Immediate operand. */
+#define SrcImmByte  (5<<3) /* 8-bit sign-extended immediate operand. */
+#define SrcImm16    (6<<3) /* 16-bit zero-extended immediate operand. */
+#define SrcMask     (7<<3)
+/* Generic ModRM decode. */
+#define ModRM       (1<<6)
+/* vSIB addressing mode (0f38 extension opcodes only), aliasing ModRM. */
+#define vSIB        (1<<6)
+/* Destination is only written; never read. */
+#define Mov         (1<<7)
+/* VEX/EVEX (SIMD only): 2nd source operand unused (must be all ones) */
+#define TwoOp       Mov
+/* All operands are implicit in the opcode. */
+#define ImplicitOps (DstImplicit|SrcImplicit)
+
+typedef uint8_t opcode_desc_t;
+
+/* Type, address-of, and value of an instruction's operand. */
+struct operand {
+    enum { OP_REG, OP_MEM, OP_IMM, OP_NONE } type;
+    unsigned int bytes;
+
+    /* Operand value. */
+    unsigned long val;
+
+    /* Original operand value. */
+    unsigned long orig_val;
+
+    /* OP_REG: Pointer to register field. */
+    unsigned long *reg;
+
+    /* OP_MEM: Segment and offset. */
+    struct {
+        enum x86_segment seg;
+        unsigned long    off;
+    } mem;
+};
+
+#define REX_PREFIX 0x40
+#define REX_B 0x01
+#define REX_X 0x02
+#define REX_R 0x04
+#define REX_W 0x08
+
+enum simd_opsize {
+    simd_none,
+
+    /*
+     * Ordinary packed integers:
+     * - 64 bits without prefix 66 (MMX)
+     * - 128 bits with prefix 66 (SSEn)
+     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
+     */
+    simd_packed_int,
+
+    /*
+     * Ordinary packed/scalar floating point:
+     * - 128 bits without prefix or with prefix 66 (SSEn)
+     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
+     * - 32 bits with prefix F3 (scalar single)
+     * - 64 bits with prefix F2 (scalar doubgle)
+     */
+    simd_any_fp,
+
+    /*
+     * Packed floating point:
+     * - 128 bits without prefix or with prefix 66 (SSEn)
+     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
+     */
+    simd_packed_fp,
+
+    /*
+     * Single precision packed/scalar floating point:
+     * - 128 bits without prefix (SSEn)
+     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
+     * - 32 bits with prefix F3 (scalar)
+     */
+    simd_single_fp,
+
+    /*
+     * Scalar floating point:
+     * - 32 bits with low opcode bit clear (scalar single)
+     * - 64 bits with low opcode bit set (scalar double)
+     */
+    simd_scalar_opc,
+
+    /*
+     * Scalar floating point:
+     * - 32/64 bits depending on VEX.W/EVEX.W
+     */
+    simd_scalar_vexw,
+
+    /*
+     * 128 bits of integer or floating point data, with no further
+     * formatting information, or with it encoded by EVEX.W.
+     */
+    simd_128,
+
+    /*
+     * 256 bits of integer or floating point data, with formatting
+     * encoded by EVEX.W.
+     */
+    simd_256,
+
+    /* Operand size encoded in non-standard way. */
+    simd_other
+};
+typedef uint8_t simd_opsize_t;
+
+#define vex_none 0
+
+enum vex_opcx {
+    vex_0f = vex_none + 1,
+    vex_0f38,
+    vex_0f3a,
+};
+
+enum vex_pfx {
+    vex_66 = vex_none + 1,
+    vex_f3,
+    vex_f2
+};
+
+union vex {
+    uint8_t raw[2];
+    struct {             /* SDM names */
+        uint8_t opcx:5;  /* mmmmm */
+        uint8_t b:1;     /* B */
+        uint8_t x:1;     /* X */
+        uint8_t r:1;     /* R */
+        uint8_t pfx:2;   /* pp */
+        uint8_t l:1;     /* L */
+        uint8_t reg:4;   /* vvvv */
+        uint8_t w:1;     /* W */
+    };
+};
+
+union evex {
+    uint8_t raw[3];
+    struct {             /* SDM names */
+        uint8_t opcx:2;  /* mm */
+        uint8_t mbz:2;
+        uint8_t R:1;     /* R' */
+        uint8_t b:1;     /* B */
+        uint8_t x:1;     /* X */
+        uint8_t r:1;     /* R */
+        uint8_t pfx:2;   /* pp */
+        uint8_t mbs:1;
+        uint8_t reg:4;   /* vvvv */
+        uint8_t w:1;     /* W */
+        uint8_t opmsk:3; /* aaa */
+        uint8_t RX:1;    /* V' */
+        uint8_t brs:1;   /* b */
+        uint8_t lr:2;    /* L'L */
+        uint8_t z:1;     /* z */
+    };
+};
+
+struct x86_emulate_state {
+    unsigned int op_bytes, ad_bytes;
+
+    enum {
+        ext_none = vex_none,
+        ext_0f   = vex_0f,
+        ext_0f38 = vex_0f38,
+        ext_0f3a = vex_0f3a,
+        /*
+         * For XOP use values such that the respective instruction field
+         * can be used without adjustment.
+         */
+        ext_8f08 = 8,
+        ext_8f09,
+        ext_8f0a,
+    } ext;
+    enum {
+        rmw_NONE,
+        rmw_adc,
+        rmw_add,
+        rmw_and,
+        rmw_btc,
+        rmw_btr,
+        rmw_bts,
+        rmw_dec,
+        rmw_inc,
+        rmw_neg,
+        rmw_not,
+        rmw_or,
+        rmw_rcl,
+        rmw_rcr,
+        rmw_rol,
+        rmw_ror,
+        rmw_sar,
+        rmw_sbb,
+        rmw_shl,
+        rmw_shld,
+        rmw_shr,
+        rmw_shrd,
+        rmw_sub,
+        rmw_xadd,
+        rmw_xchg,
+        rmw_xor,
+    } rmw;
+    enum {
+        blk_NONE,
+        blk_enqcmd,
+#ifndef X86EMUL_NO_FPU
+        blk_fld, /* FLDENV, FRSTOR */
+        blk_fst, /* FNSTENV, FNSAVE */
+#endif
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+        blk_fxrstor,
+        blk_fxsave,
+#endif
+        blk_movdir,
+    } blk;
+    uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
+    uint8_t sib_index, sib_scale;
+    uint8_t rex_prefix;
+    bool lock_prefix;
+    bool not_64bit; /* Instruction not available in 64bit. */
+    bool fpu_ctrl;  /* Instruction is an FPU control one. */
+    opcode_desc_t desc;
+    union vex vex;
+    union evex evex;
+    enum simd_opsize simd_size;
+
+    /*
+     * Data operand effective address (usually computed from ModRM).
+     * Default is a memory operand relative to segment DS.
+     */
+    struct operand ea;
+
+    /* Immediate operand values, if any. Use otherwise unused fields. */
+#define imm1 ea.val
+#define imm2 ea.orig_val
+
+    unsigned long ip;
+    struct cpu_user_regs *regs;
+
+#ifndef NDEBUG
+    /*
+     * Track caller of x86_decode_insn() to spot missing as well as
+     * premature calls to x86_emulate_free_state().
+     */
+    void *caller;
+#endif
+};
+
+/*
+ * Externally visible return codes from x86_emulate() are non-negative.
+ * Use negative values for internal state change indicators from helpers
+ * to the main function.
+ */
+#define X86EMUL_rdtsc        (-1)
+
+/*
+ * These EFLAGS bits are restored from saved value during emulation, and
+ * any changes are written back to the saved value after emulation.
+ */
+#define EFLAGS_MASK (X86_EFLAGS_OF | X86_EFLAGS_SF | X86_EFLAGS_ZF | \
+                     X86_EFLAGS_AF | X86_EFLAGS_PF | X86_EFLAGS_CF)
+
+/*
+ * These EFLAGS bits are modifiable (by POPF and IRET), possibly subject
+ * to further CPL and IOPL constraints.
+ */
+#define EFLAGS_MODIFIABLE (X86_EFLAGS_ID | X86_EFLAGS_AC | X86_EFLAGS_RF | \
+                           X86_EFLAGS_NT | X86_EFLAGS_IOPL | X86_EFLAGS_DF | \
+                           X86_EFLAGS_IF | X86_EFLAGS_TF | EFLAGS_MASK)
+
+#define truncate_word(ea, byte_width)           \
+({  unsigned long __ea = (ea);                  \
+    unsigned int _width = (byte_width);         \
+    ((_width == sizeof(unsigned long)) ? __ea : \
+     (__ea & ((1UL << (_width << 3)) - 1)));    \
+})
+#define truncate_ea(ea) truncate_word((ea), ad_bytes)
+
+#define fail_if(p)                                      \
+do {                                                    \
+    rc = (p) ? X86EMUL_UNHANDLEABLE : X86EMUL_OKAY;     \
+    if ( rc ) goto done;                                \
+} while (0)
+
+#define EXPECT(p)                                       \
+do {                                                    \
+    if ( unlikely(!(p)) )                               \
+    {                                                   \
+        ASSERT_UNREACHABLE();                           \
+        goto unhandleable;                              \
+    }                                                   \
+} while (0)
+
+static inline int mkec(uint8_t e, int32_t ec, ...)
+{
+    return (e < 32 && ((1u << e) & X86_EXC_HAVE_EC)) ? ec : X86_EVENT_NO_EC;
+}
+
+#define generate_exception_if(p, e, ec...)                                \
+({  if ( (p) ) {                                                          \
+        x86_emul_hw_exception(e, mkec(e, ##ec, 0), ctxt);                 \
+        rc = X86EMUL_EXCEPTION;                                           \
+        goto done;                                                        \
+    }                                                                     \
+})
+
+#define generate_exception(e, ec...) generate_exception_if(true, e, ##ec)
+
+static inline bool
+in_realmode(
+    struct x86_emulate_ctxt *ctxt,
+    const struct x86_emulate_ops *ops)
+{
+    unsigned long cr0;
+    int rc;
+
+    if ( ops->read_cr == NULL )
+        return 0;
+
+    rc = ops->read_cr(0, &cr0, ctxt);
+    return (!rc && !(cr0 & X86_CR0_PE));
+}
+
+static inline bool
+in_protmode(
+    struct x86_emulate_ctxt *ctxt,
+    const struct x86_emulate_ops *ops)
+{
+    return !(in_realmode(ctxt, ops) || (ctxt->regs->eflags & X86_EFLAGS_VM));
+}
+
+#define mode_ring0() ({                         \
+    int _cpl = x86emul_get_cpl(ctxt, ops);      \
+    fail_if(_cpl < 0);                          \
+    (_cpl == 0);                                \
+})
+
+#define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
+#define vcpu_has_sep()         (ctxt->cpuid->basic.sep)
+#define vcpu_has_cx8()         (ctxt->cpuid->basic.cx8)
+#define vcpu_has_cmov()        (ctxt->cpuid->basic.cmov)
+#define vcpu_has_clflush()     (ctxt->cpuid->basic.clflush)
+#define vcpu_has_mmx()         (ctxt->cpuid->basic.mmx)
+#define vcpu_has_fxsr()        (ctxt->cpuid->basic.fxsr)
+#define vcpu_has_sse()         (ctxt->cpuid->basic.sse)
+#define vcpu_has_sse2()        (ctxt->cpuid->basic.sse2)
+#define vcpu_has_sse3()        (ctxt->cpuid->basic.sse3)
+#define vcpu_has_pclmulqdq()   (ctxt->cpuid->basic.pclmulqdq)
+#define vcpu_has_ssse3()       (ctxt->cpuid->basic.ssse3)
+#define vcpu_has_fma()         (ctxt->cpuid->basic.fma)
+#define vcpu_has_cx16()        (ctxt->cpuid->basic.cx16)
+#define vcpu_has_sse4_1()      (ctxt->cpuid->basic.sse4_1)
+#define vcpu_has_sse4_2()      (ctxt->cpuid->basic.sse4_2)
+#define vcpu_has_movbe()       (ctxt->cpuid->basic.movbe)
+#define vcpu_has_popcnt()      (ctxt->cpuid->basic.popcnt)
+#define vcpu_has_aesni()       (ctxt->cpuid->basic.aesni)
+#define vcpu_has_avx()         (ctxt->cpuid->basic.avx)
+#define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
+#define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
+
+#define vcpu_has_mmxext()      (ctxt->cpuid->extd.mmxext || vcpu_has_sse())
+#define vcpu_has_3dnow_ext()   (ctxt->cpuid->extd._3dnowext)
+#define vcpu_has_3dnow()       (ctxt->cpuid->extd._3dnow)
+#define vcpu_has_lahf_lm()     (ctxt->cpuid->extd.lahf_lm)
+#define vcpu_has_cr8_legacy()  (ctxt->cpuid->extd.cr8_legacy)
+#define vcpu_has_lzcnt()       (ctxt->cpuid->extd.abm)
+#define vcpu_has_sse4a()       (ctxt->cpuid->extd.sse4a)
+#define vcpu_has_misalignsse() (ctxt->cpuid->extd.misalignsse)
+#define vcpu_has_xop()         (ctxt->cpuid->extd.xop)
+#define vcpu_has_fma4()        (ctxt->cpuid->extd.fma4)
+#define vcpu_has_tbm()         (ctxt->cpuid->extd.tbm)
+#define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
+#define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
+
+#define vcpu_has_bmi1()        (ctxt->cpuid->feat.bmi1)
+#define vcpu_has_hle()         (ctxt->cpuid->feat.hle)
+#define vcpu_has_avx2()        (ctxt->cpuid->feat.avx2)
+#define vcpu_has_bmi2()        (ctxt->cpuid->feat.bmi2)
+#define vcpu_has_invpcid()     (ctxt->cpuid->feat.invpcid)
+#define vcpu_has_rtm()         (ctxt->cpuid->feat.rtm)
+#define vcpu_has_mpx()         (ctxt->cpuid->feat.mpx)
+#define vcpu_has_avx512f()     (ctxt->cpuid->feat.avx512f)
+#define vcpu_has_avx512dq()    (ctxt->cpuid->feat.avx512dq)
+#define vcpu_has_rdseed()      (ctxt->cpuid->feat.rdseed)
+#define vcpu_has_adx()         (ctxt->cpuid->feat.adx)
+#define vcpu_has_smap()        (ctxt->cpuid->feat.smap)
+#define vcpu_has_avx512_ifma() (ctxt->cpuid->feat.avx512_ifma)
+#define vcpu_has_clflushopt()  (ctxt->cpuid->feat.clflushopt)
+#define vcpu_has_clwb()        (ctxt->cpuid->feat.clwb)
+#define vcpu_has_avx512pf()    (ctxt->cpuid->feat.avx512pf)
+#define vcpu_has_avx512er()    (ctxt->cpuid->feat.avx512er)
+#define vcpu_has_avx512cd()    (ctxt->cpuid->feat.avx512cd)
+#define vcpu_has_sha()         (ctxt->cpuid->feat.sha)
+#define vcpu_has_avx512bw()    (ctxt->cpuid->feat.avx512bw)
+#define vcpu_has_avx512vl()    (ctxt->cpuid->feat.avx512vl)
+#define vcpu_has_avx512_vbmi() (ctxt->cpuid->feat.avx512_vbmi)
+#define vcpu_has_avx512_vbmi2() (ctxt->cpuid->feat.avx512_vbmi2)
+#define vcpu_has_gfni()        (ctxt->cpuid->feat.gfni)
+#define vcpu_has_vaes()        (ctxt->cpuid->feat.vaes)
+#define vcpu_has_vpclmulqdq()  (ctxt->cpuid->feat.vpclmulqdq)
+#define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
+#define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
+#define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
+#define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
+#define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
+#define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
+#define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
+#define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
+#define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
+#define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
+#define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
+#define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
+#define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
+#define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+
+#define vcpu_must_have(feat) \
+    generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
+
+#ifdef __XEN__
+/*
+ * Note the difference between vcpu_must_have(<feature>) and
+ * host_and_vcpu_must_have(<feature>): The latter needs to be used when
+ * emulation code is using the same instruction class for carrying out
+ * the actual operation.
+ */
+# define host_and_vcpu_must_have(feat) ({ \
+    generate_exception_if(!cpu_has_##feat, X86_EXC_UD); \
+    vcpu_must_have(feat); \
+})
+#else
+/*
+ * For the test harness both are fine to be used interchangeably, i.e.
+ * features known to always be available (e.g. SSE/SSE2) to (64-bit) Xen
+ * may be checked for by just vcpu_must_have().
+ */
+# define host_and_vcpu_must_have(feat) vcpu_must_have(feat)
+#endif
+
+int x86emul_get_cpl(struct x86_emulate_ctxt *ctxt,
+                    const struct x86_emulate_ops *ops);
+
+int x86emul_0f01(struct x86_emulate_state *s,
+                 struct cpu_user_regs *regs,
+                 struct operand *dst,
+                 struct x86_emulate_ctxt *ctxt,
+                 const struct x86_emulate_ops *ops);
+
+static inline bool umip_active(struct x86_emulate_ctxt *ctxt,
+                               const struct x86_emulate_ops *ops)
+{
+    unsigned long cr4;
+
+    /* Intentionally not using mode_ring0() here to avoid its fail_if(). */
+    return x86emul_get_cpl(ctxt, ops) > 0 &&
+           ops->read_cr && ops->read_cr(4, &cr4, ctxt) == X86EMUL_OKAY &&
+           (cr4 & X86_CR4_UMIP);
+}
+
+/* Compatibility function: read guest memory, zero-extend result to a ulong. */
+static inline int read_ulong(enum x86_segment seg,
+                             unsigned long offset,
+                             unsigned long *val,
+                             unsigned int bytes,
+                             struct x86_emulate_ctxt *ctxt,
+                             const struct x86_emulate_ops *ops)
+{
+    *val = 0;
+    return ops->read(seg, offset, val, bytes, ctxt);
+}
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -20,39 +20,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-/* Operand sizes: 8-bit operands or specified/overridden size. */
-#define ByteOp      (1<<0) /* 8-bit operands. */
-/* Destination operand type. */
-#define DstNone     (0<<1) /* No destination operand. */
-#define DstImplicit (0<<1) /* Destination operand is implicit in the opcode. */
-#define DstBitBase  (1<<1) /* Memory operand, bit string. */
-#define DstReg      (2<<1) /* Register operand. */
-#define DstEax      DstReg /* Register EAX (aka DstReg with no ModRM) */
-#define DstMem      (3<<1) /* Memory operand. */
-#define DstMask     (3<<1)
-/* Source operand type. */
-#define SrcNone     (0<<3) /* No source operand. */
-#define SrcImplicit (0<<3) /* Source operand is implicit in the opcode. */
-#define SrcReg      (1<<3) /* Register operand. */
-#define SrcEax      SrcReg /* Register EAX (aka SrcReg with no ModRM) */
-#define SrcMem      (2<<3) /* Memory operand. */
-#define SrcMem16    (3<<3) /* Memory operand (16-bit). */
-#define SrcImm      (4<<3) /* Immediate operand. */
-#define SrcImmByte  (5<<3) /* 8-bit sign-extended immediate operand. */
-#define SrcImm16    (6<<3) /* 16-bit zero-extended immediate operand. */
-#define SrcMask     (7<<3)
-/* Generic ModRM decode. */
-#define ModRM       (1<<6)
-/* vSIB addressing mode (0f38 extension opcodes only), aliasing ModRM. */
-#define vSIB        (1<<6)
-/* Destination is only written; never read. */
-#define Mov         (1<<7)
-/* VEX/EVEX (SIMD only): 2nd source operand unused (must be all ones) */
-#define TwoOp       Mov
-/* All operands are implicit in the opcode. */
-#define ImplicitOps (DstImplicit|SrcImplicit)
-
-typedef uint8_t opcode_desc_t;
+#include "private.h"
 
 static const opcode_desc_t opcode_table[256] = {
     /* 0x00 - 0x07 */
@@ -184,71 +152,6 @@ static const opcode_desc_t opcode_table[
     ImplicitOps, ImplicitOps, ByteOp|DstMem|SrcNone|ModRM, DstMem|SrcNone|ModRM
 };
 
-enum simd_opsize {
-    simd_none,
-
-    /*
-     * Ordinary packed integers:
-     * - 64 bits without prefix 66 (MMX)
-     * - 128 bits with prefix 66 (SSEn)
-     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
-     */
-    simd_packed_int,
-
-    /*
-     * Ordinary packed/scalar floating point:
-     * - 128 bits without prefix or with prefix 66 (SSEn)
-     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
-     * - 32 bits with prefix F3 (scalar single)
-     * - 64 bits with prefix F2 (scalar doubgle)
-     */
-    simd_any_fp,
-
-    /*
-     * Packed floating point:
-     * - 128 bits without prefix or with prefix 66 (SSEn)
-     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
-     */
-    simd_packed_fp,
-
-    /*
-     * Single precision packed/scalar floating point:
-     * - 128 bits without prefix (SSEn)
-     * - 128/256/512 bits depending on VEX.L/EVEX.LR (AVX+)
-     * - 32 bits with prefix F3 (scalar)
-     */
-    simd_single_fp,
-
-    /*
-     * Scalar floating point:
-     * - 32 bits with low opcode bit clear (scalar single)
-     * - 64 bits with low opcode bit set (scalar double)
-     */
-    simd_scalar_opc,
-
-    /*
-     * Scalar floating point:
-     * - 32/64 bits depending on VEX.W/EVEX.W
-     */
-    simd_scalar_vexw,
-
-    /*
-     * 128 bits of integer or floating point data, with no further
-     * formatting information, or with it encoded by EVEX.W.
-     */
-    simd_128,
-
-    /*
-     * 256 bits of integer or floating point data, with formatting
-     * encoded by EVEX.W.
-     */
-    simd_256,
-
-    /* Operand size encoded in non-standard way. */
-    simd_other
-};
-typedef uint8_t simd_opsize_t;
-
 enum disp8scale {
     /* Values 0 ... 4 are explicit sizes. */
     d8s_bw = 5,
@@ -670,45 +573,11 @@ static const struct ext8f09_table {
     [0xe1 ... 0xe3] = { .simd_size = simd_packed_int, .two_op = 1 },
 };
 
-#define REX_PREFIX 0x40
-#define REX_B 0x01
-#define REX_X 0x02
-#define REX_R 0x04
-#define REX_W 0x08
-
-#define vex_none 0
-
-enum vex_opcx {
-    vex_0f = vex_none + 1,
-    vex_0f38,
-    vex_0f3a,
-};
-
-enum vex_pfx {
-    vex_66 = vex_none + 1,
-    vex_f3,
-    vex_f2
-};
-
 #define VEX_PREFIX_DOUBLE_MASK 0x1
 #define VEX_PREFIX_SCALAR_MASK 0x2
 
 static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
 
-union vex {
-    uint8_t raw[2];
-    struct {             /* SDM names */
-        uint8_t opcx:5;  /* mmmmm */
-        uint8_t b:1;     /* B */
-        uint8_t x:1;     /* X */
-        uint8_t r:1;     /* R */
-        uint8_t pfx:2;   /* pp */
-        uint8_t l:1;     /* L */
-        uint8_t reg:4;   /* vvvv */
-        uint8_t w:1;     /* W */
-    };
-};
-
 #ifdef __x86_64__
 # define PFX2 REX_PREFIX
 #else
@@ -748,27 +617,6 @@ union vex {
     } \
 } while (0)
 
-union evex {
-    uint8_t raw[3];
-    struct {             /* SDM names */
-        uint8_t opcx:2;  /* mm */
-        uint8_t mbz:2;
-        uint8_t R:1;     /* R' */
-        uint8_t b:1;     /* B */
-        uint8_t x:1;     /* X */
-        uint8_t r:1;     /* R */
-        uint8_t pfx:2;   /* pp */
-        uint8_t mbs:1;
-        uint8_t reg:4;   /* vvvv */
-        uint8_t w:1;     /* W */
-        uint8_t opmsk:3; /* aaa */
-        uint8_t RX:1;    /* V' */
-        uint8_t brs:1;   /* b */
-        uint8_t lr:2;    /* L'L */
-        uint8_t z:1;     /* z */
-    };
-};
-
 #define EVEX_PFX_BYTES 4
 #define init_evex(stub) ({ \
     uint8_t *buf_ = get_stub(stub); \
@@ -789,118 +637,6 @@ union evex {
 #define repe_prefix()  (vex.pfx == vex_f3)
 #define repne_prefix() (vex.pfx == vex_f2)
 
-/* Type, address-of, and value of an instruction's operand. */
-struct operand {
-    enum { OP_REG, OP_MEM, OP_IMM, OP_NONE } type;
-    unsigned int bytes;
-
-    /* Operand value. */
-    unsigned long val;
-
-    /* Original operand value. */
-    unsigned long orig_val;
-
-    /* OP_REG: Pointer to register field. */
-    unsigned long *reg;
-
-    /* OP_MEM: Segment and offset. */
-    struct {
-        enum x86_segment seg;
-        unsigned long    off;
-    } mem;
-};
-
-struct x86_emulate_state {
-    unsigned int op_bytes, ad_bytes;
-
-    enum {
-        ext_none = vex_none,
-        ext_0f   = vex_0f,
-        ext_0f38 = vex_0f38,
-        ext_0f3a = vex_0f3a,
-        /*
-         * For XOP use values such that the respective instruction field
-         * can be used without adjustment.
-         */
-        ext_8f08 = 8,
-        ext_8f09,
-        ext_8f0a,
-    } ext;
-    enum {
-        rmw_NONE,
-        rmw_adc,
-        rmw_add,
-        rmw_and,
-        rmw_btc,
-        rmw_btr,
-        rmw_bts,
-        rmw_dec,
-        rmw_inc,
-        rmw_neg,
-        rmw_not,
-        rmw_or,
-        rmw_rcl,
-        rmw_rcr,
-        rmw_rol,
-        rmw_ror,
-        rmw_sar,
-        rmw_sbb,
-        rmw_shl,
-        rmw_shld,
-        rmw_shr,
-        rmw_shrd,
-        rmw_sub,
-        rmw_xadd,
-        rmw_xchg,
-        rmw_xor,
-    } rmw;
-    enum {
-        blk_NONE,
-        blk_enqcmd,
-#ifndef X86EMUL_NO_FPU
-        blk_fld, /* FLDENV, FRSTOR */
-        blk_fst, /* FNSTENV, FNSAVE */
-#endif
-#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
-    !defined(X86EMUL_NO_SIMD)
-        blk_fxrstor,
-        blk_fxsave,
-#endif
-        blk_movdir,
-    } blk;
-    uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
-    uint8_t sib_index, sib_scale;
-    uint8_t rex_prefix;
-    bool lock_prefix;
-    bool not_64bit; /* Instruction not available in 64bit. */
-    bool fpu_ctrl;  /* Instruction is an FPU control one. */
-    opcode_desc_t desc;
-    union vex vex;
-    union evex evex;
-    enum simd_opsize simd_size;
-
-    /*
-     * Data operand effective address (usually computed from ModRM).
-     * Default is a memory operand relative to segment DS.
-     */
-    struct operand ea;
-
-    /* Immediate operand values, if any. Use otherwise unused fields. */
-#define imm1 ea.val
-#define imm2 ea.orig_val
-
-    unsigned long ip;
-    struct cpu_user_regs *regs;
-
-#ifndef NDEBUG
-    /*
-     * Track caller of x86_decode_insn() to spot missing as well as
-     * premature calls to x86_emulate_free_state().
-     */
-    void *caller;
-#endif
-};
-
 #ifdef __x86_64__
 #define PTR_POISON ((void *)0x8086000000008086UL) /* non-canonical */
 #else
@@ -1049,21 +785,6 @@ struct x86_fxsr {
 #define _BYTES_PER_LONG "4"
 #endif
 
-/*
- * These EFLAGS bits are restored from saved value during emulation, and
- * any changes are written back to the saved value after emulation.
- */
-#define EFLAGS_MASK (X86_EFLAGS_OF | X86_EFLAGS_SF | X86_EFLAGS_ZF | \
-                     X86_EFLAGS_AF | X86_EFLAGS_PF | X86_EFLAGS_CF)
-
-/*
- * These EFLAGS bits are modifiable (by POPF and IRET), possibly subject
- * to further CPL and IOPL constraints.
- */
-#define EFLAGS_MODIFIABLE (X86_EFLAGS_ID | X86_EFLAGS_AC | X86_EFLAGS_RF | \
-                           X86_EFLAGS_NT | X86_EFLAGS_IOPL | X86_EFLAGS_DF | \
-                           X86_EFLAGS_IF | X86_EFLAGS_TF | EFLAGS_MASK)
-
 /* Before executing instruction: restore necessary bits in EFLAGS. */
 #define _PRE_EFLAGS(_sav, _msk, _tmp)                           \
 /* EFLAGS = (_sav & _msk) | (EFLAGS & ~_msk); _sav &= ~_msk; */ \
@@ -1223,36 +944,6 @@ do{ asm volatile (
 #define __emulate_1op_8byte(op, dst, eflags, extra...)
 #endif /* __i386__ */
 
-#define fail_if(p)                                      \
-do {                                                    \
-    rc = (p) ? X86EMUL_UNHANDLEABLE : X86EMUL_OKAY;     \
-    if ( rc ) goto done;                                \
-} while (0)
-
-#define EXPECT(p)                                       \
-do {                                                    \
-    if ( unlikely(!(p)) )                               \
-    {                                                   \
-        ASSERT_UNREACHABLE();                           \
-        goto unhandleable;                              \
-    }                                                   \
-} while (0)
-
-static inline int mkec(uint8_t e, int32_t ec, ...)
-{
-    return (e < 32 && ((1u << e) & EXC_HAS_EC)) ? ec : X86_EVENT_NO_EC;
-}
-
-#define generate_exception_if(p, e, ec...)                                \
-({  if ( (p) ) {                                                          \
-        x86_emul_hw_exception(e, mkec(e, ##ec, 0), ctxt);                 \
-        rc = X86EMUL_EXCEPTION;                                           \
-        goto done;                                                        \
-    }                                                                     \
-})
-
-#define generate_exception(e, ec...) generate_exception_if(true, e, ##ec)
-
 #ifdef __XEN__
 # define invoke_stub(pre, post, constraints...) do {                    \
     stub_exn.info = (union stub_exception_token) { .raw = ~0 };         \
@@ -1301,20 +992,6 @@ static inline int mkec(uint8_t e, int32_
 })
 #define insn_fetch_type(_type) ((_type)insn_fetch_bytes(sizeof(_type)))
 
-#define truncate_word(ea, byte_width)           \
-({  unsigned long __ea = (ea);                  \
-    unsigned int _width = (byte_width);         \
-    ((_width == sizeof(unsigned long)) ? __ea : \
-     (__ea & ((1UL << (_width << 3)) - 1)));    \
-})
-#define truncate_ea(ea) truncate_word((ea), ad_bytes)
-
-#ifdef __x86_64__
-# define mode_64bit() (ctxt->addr_size == 64)
-#else
-# define mode_64bit() false
-#endif
-
 /*
  * Given byte has even parity (even number of 1s)? SDM Vol. 1 Sec. 3.4.3.1,
  * "Status Flags": EFLAGS.PF reflects parity of least-sig. byte of result only.
@@ -1655,19 +1332,6 @@ static void __put_rep_prefix(
     ea__;                                                                 \
 })
 
-/* Compatibility function: read guest memory, zero-extend result to a ulong. */
-static int read_ulong(
-        enum x86_segment seg,
-        unsigned long offset,
-        unsigned long *val,
-        unsigned int bytes,
-        struct x86_emulate_ctxt *ctxt,
-        const struct x86_emulate_ops *ops)
-{
-    *val = 0;
-    return ops->read(seg, offset, val, bytes, ctxt);
-}
-
 /*
  * Unsigned multiplication with double-word result.
  * IN:  Multiplicand=m[0], Multiplier=m[1]
@@ -1792,10 +1456,8 @@ test_cc(
     return (!!rc ^ (condition & 1));
 }
 
-static int
-get_cpl(
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops  *ops)
+int x86emul_get_cpl(struct x86_emulate_ctxt *ctxt,
+                    const struct x86_emulate_ops *ops)
 {
     struct segment_register reg;
 
@@ -1814,17 +1476,12 @@ _mode_iopl(
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops  *ops)
 {
-    int cpl = get_cpl(ctxt, ops);
+    int cpl = x86emul_get_cpl(ctxt, ops);
     if ( cpl == -1 )
         return -1;
     return cpl <= MASK_EXTR(ctxt->regs->eflags, X86_EFLAGS_IOPL);
 }
 
-#define mode_ring0() ({                         \
-    int _cpl = get_cpl(ctxt, ops);              \
-    fail_if(_cpl < 0);                          \
-    (_cpl == 0);                                \
-})
 #define mode_iopl() ({                          \
     int _iopl = _mode_iopl(ctxt, ops);          \
     fail_if(_iopl < 0);                         \
@@ -1832,7 +1489,7 @@ _mode_iopl(
 })
 #define mode_vif() ({                                        \
     cr4 = 0;                                                 \
-    if ( ops->read_cr && get_cpl(ctxt, ops) == 3 )           \
+    if ( ops->read_cr && x86emul_get_cpl(ctxt, ops) == 3 )   \
     {                                                        \
         rc = ops->read_cr(4, &cr4, ctxt);                    \
         if ( rc != X86EMUL_OKAY ) goto done;                 \
@@ -1900,29 +1557,6 @@ static int ioport_access_check(
 }
 
 static bool
-in_realmode(
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops  *ops)
-{
-    unsigned long cr0;
-    int rc;
-
-    if ( ops->read_cr == NULL )
-        return 0;
-
-    rc = ops->read_cr(0, &cr0, ctxt);
-    return (!rc && !(cr0 & X86_CR0_PE));
-}
-
-static bool
-in_protmode(
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops  *ops)
-{
-    return !(in_realmode(ctxt, ops) || (ctxt->regs->eflags & X86_EFLAGS_VM));
-}
-
-static bool
 _amd_like(const struct cpuid_policy *cp)
 {
     return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
@@ -1934,107 +1568,6 @@ amd_like(const struct x86_emulate_ctxt *
     return _amd_like(ctxt->cpuid);
 }
 
-#define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
-#define vcpu_has_sep()         (ctxt->cpuid->basic.sep)
-#define vcpu_has_cx8()         (ctxt->cpuid->basic.cx8)
-#define vcpu_has_cmov()        (ctxt->cpuid->basic.cmov)
-#define vcpu_has_clflush()     (ctxt->cpuid->basic.clflush)
-#define vcpu_has_mmx()         (ctxt->cpuid->basic.mmx)
-#define vcpu_has_fxsr()        (ctxt->cpuid->basic.fxsr)
-#define vcpu_has_sse()         (ctxt->cpuid->basic.sse)
-#define vcpu_has_sse2()        (ctxt->cpuid->basic.sse2)
-#define vcpu_has_sse3()        (ctxt->cpuid->basic.sse3)
-#define vcpu_has_pclmulqdq()   (ctxt->cpuid->basic.pclmulqdq)
-#define vcpu_has_ssse3()       (ctxt->cpuid->basic.ssse3)
-#define vcpu_has_fma()         (ctxt->cpuid->basic.fma)
-#define vcpu_has_cx16()        (ctxt->cpuid->basic.cx16)
-#define vcpu_has_sse4_1()      (ctxt->cpuid->basic.sse4_1)
-#define vcpu_has_sse4_2()      (ctxt->cpuid->basic.sse4_2)
-#define vcpu_has_movbe()       (ctxt->cpuid->basic.movbe)
-#define vcpu_has_popcnt()      (ctxt->cpuid->basic.popcnt)
-#define vcpu_has_aesni()       (ctxt->cpuid->basic.aesni)
-#define vcpu_has_avx()         (ctxt->cpuid->basic.avx)
-#define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
-#define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
-
-#define vcpu_has_mmxext()      (ctxt->cpuid->extd.mmxext || vcpu_has_sse())
-#define vcpu_has_3dnow_ext()   (ctxt->cpuid->extd._3dnowext)
-#define vcpu_has_3dnow()       (ctxt->cpuid->extd._3dnow)
-#define vcpu_has_lahf_lm()     (ctxt->cpuid->extd.lahf_lm)
-#define vcpu_has_cr8_legacy()  (ctxt->cpuid->extd.cr8_legacy)
-#define vcpu_has_lzcnt()       (ctxt->cpuid->extd.abm)
-#define vcpu_has_sse4a()       (ctxt->cpuid->extd.sse4a)
-#define vcpu_has_misalignsse() (ctxt->cpuid->extd.misalignsse)
-#define vcpu_has_xop()         (ctxt->cpuid->extd.xop)
-#define vcpu_has_fma4()        (ctxt->cpuid->extd.fma4)
-#define vcpu_has_tbm()         (ctxt->cpuid->extd.tbm)
-#define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
-#define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
-
-#define vcpu_has_bmi1()        (ctxt->cpuid->feat.bmi1)
-#define vcpu_has_hle()         (ctxt->cpuid->feat.hle)
-#define vcpu_has_avx2()        (ctxt->cpuid->feat.avx2)
-#define vcpu_has_bmi2()        (ctxt->cpuid->feat.bmi2)
-#define vcpu_has_invpcid()     (ctxt->cpuid->feat.invpcid)
-#define vcpu_has_rtm()         (ctxt->cpuid->feat.rtm)
-#define vcpu_has_mpx()         (ctxt->cpuid->feat.mpx)
-#define vcpu_has_avx512f()     (ctxt->cpuid->feat.avx512f)
-#define vcpu_has_avx512dq()    (ctxt->cpuid->feat.avx512dq)
-#define vcpu_has_rdseed()      (ctxt->cpuid->feat.rdseed)
-#define vcpu_has_adx()         (ctxt->cpuid->feat.adx)
-#define vcpu_has_smap()        (ctxt->cpuid->feat.smap)
-#define vcpu_has_avx512_ifma() (ctxt->cpuid->feat.avx512_ifma)
-#define vcpu_has_clflushopt()  (ctxt->cpuid->feat.clflushopt)
-#define vcpu_has_clwb()        (ctxt->cpuid->feat.clwb)
-#define vcpu_has_avx512pf()    (ctxt->cpuid->feat.avx512pf)
-#define vcpu_has_avx512er()    (ctxt->cpuid->feat.avx512er)
-#define vcpu_has_avx512cd()    (ctxt->cpuid->feat.avx512cd)
-#define vcpu_has_sha()         (ctxt->cpuid->feat.sha)
-#define vcpu_has_avx512bw()    (ctxt->cpuid->feat.avx512bw)
-#define vcpu_has_avx512vl()    (ctxt->cpuid->feat.avx512vl)
-#define vcpu_has_avx512_vbmi() (ctxt->cpuid->feat.avx512_vbmi)
-#define vcpu_has_avx512_vbmi2() (ctxt->cpuid->feat.avx512_vbmi2)
-#define vcpu_has_gfni()        (ctxt->cpuid->feat.gfni)
-#define vcpu_has_vaes()        (ctxt->cpuid->feat.vaes)
-#define vcpu_has_vpclmulqdq()  (ctxt->cpuid->feat.vpclmulqdq)
-#define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
-#define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
-#define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
-#define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
-#define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
-#define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
-#define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
-#define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
-#define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
-#define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
-#define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
-#define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
-#define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
-#define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
-
-#define vcpu_must_have(feat) \
-    generate_exception_if(!vcpu_has_##feat(), EXC_UD)
-
-#ifdef __XEN__
-/*
- * Note the difference between vcpu_must_have(<feature>) and
- * host_and_vcpu_must_have(<feature>): The latter needs to be used when
- * emulation code is using the same instruction class for carrying out
- * the actual operation.
- */
-#define host_and_vcpu_must_have(feat) ({ \
-    generate_exception_if(!cpu_has_##feat, EXC_UD); \
-    vcpu_must_have(feat); \
-})
-#else
-/*
- * For the test harness both are fine to be used interchangeably, i.e.
- * features known to always be available (e.g. SSE/SSE2) to (64-bit) Xen
- * may be checked for by just vcpu_must_have().
- */
-#define host_and_vcpu_must_have(feat) vcpu_must_have(feat)
-#endif
-
 /* Initialise output state in x86_emulate_ctxt */
 static void init_context(struct x86_emulate_ctxt *ctxt)
 {
@@ -2081,7 +1614,7 @@ protmode_load_seg(
     enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldtr : x86_seg_gdtr;
     struct { uint32_t a, b; } desc, desc_hi = {};
     uint8_t dpl, rpl;
-    int cpl = get_cpl(ctxt, ops);
+    int cpl = x86emul_get_cpl(ctxt, ops);
     uint32_t a_flag = 0x100;
     int rc, fault_type = EXC_GP;
 
@@ -2481,17 +2014,6 @@ static bool is_branch_step(struct x86_em
            (debugctl & IA32_DEBUGCTLMSR_BTF);
 }
 
-static bool umip_active(struct x86_emulate_ctxt *ctxt,
-                        const struct x86_emulate_ops *ops)
-{
-    unsigned long cr4;
-
-    /* Intentionally not using mode_ring0() here to avoid its fail_if(). */
-    return get_cpl(ctxt, ops) > 0 &&
-           ops->read_cr && ops->read_cr(4, &cr4, ctxt) == X86EMUL_OKAY &&
-           (cr4 & X86_CR4_UMIP);
-}
-
 static void adjust_bnd(struct x86_emulate_ctxt *ctxt,
                        const struct x86_emulate_ops *ops, enum vex_pfx pfx)
 {
@@ -5703,317 +5225,8 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x01): /* Grp7 */
-    {
-        unsigned long base, limit, cr0, cr0w;
-
-        seg = (modrm_reg & 1) ? x86_seg_idtr : x86_seg_gdtr;
-
-        switch( modrm )
-        {
-        case 0xca: /* clac */
-        case 0xcb: /* stac */
-            vcpu_must_have(smap);
-            generate_exception_if(vex.pfx || !mode_ring0(), EXC_UD);
-
-            _regs.eflags &= ~X86_EFLAGS_AC;
-            if ( modrm == 0xcb )
-                _regs.eflags |= X86_EFLAGS_AC;
-            break;
-
-        case 0xd0: /* xgetbv */
-            generate_exception_if(vex.pfx, EXC_UD);
-            if ( !ops->read_cr || !ops->read_xcr ||
-                 ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
-                cr4 = 0;
-            generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), EXC_UD);
-            rc = ops->read_xcr(_regs.ecx, &msr_val, ctxt);
-            if ( rc != X86EMUL_OKAY )
-                goto done;
-            _regs.r(ax) = (uint32_t)msr_val;
-            _regs.r(dx) = msr_val >> 32;
-            break;
-
-        case 0xd1: /* xsetbv */
-            generate_exception_if(vex.pfx, EXC_UD);
-            if ( !ops->read_cr || !ops->write_xcr ||
-                 ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
-                cr4 = 0;
-            generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), EXC_UD);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
-            rc = ops->write_xcr(_regs.ecx,
-                                _regs.eax | ((uint64_t)_regs.edx << 32), ctxt);
-            if ( rc != X86EMUL_OKAY )
-                goto done;
-            break;
-
-        case 0xd4: /* vmfunc */
-            generate_exception_if(vex.pfx, EXC_UD);
-            fail_if(!ops->vmfunc);
-            if ( (rc = ops->vmfunc(ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-
-        case 0xd5: /* xend */
-            generate_exception_if(vex.pfx, EXC_UD);
-            generate_exception_if(!vcpu_has_rtm(), EXC_UD);
-            generate_exception_if(vcpu_has_rtm(), EXC_GP, 0);
-            break;
-
-        case 0xd6: /* xtest */
-            generate_exception_if(vex.pfx, EXC_UD);
-            generate_exception_if(!vcpu_has_rtm() && !vcpu_has_hle(),
-                                  EXC_UD);
-            /* Neither HLE nor RTM can be active when we get here. */
-            _regs.eflags |= X86_EFLAGS_ZF;
-            break;
-
-        case 0xdf: /* invlpga */
-            fail_if(!ops->read_msr);
-            if ( (rc = ops->read_msr(MSR_EFER,
-                                     &msr_val, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            /* Finding SVME set implies vcpu_has_svm(). */
-            generate_exception_if(!(msr_val & EFER_SVME) ||
-                                  !in_protmode(ctxt, ops), EXC_UD);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
-            fail_if(!ops->tlb_op);
-            if ( (rc = ops->tlb_op(x86emul_invlpga, truncate_ea(_regs.r(ax)),
-                                   _regs.ecx, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-
-        case 0xe8:
-            switch ( vex.pfx )
-            {
-            case vex_none: /* serialize */
-                host_and_vcpu_must_have(serialize);
-                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
-                break;
-            case vex_f2: /* xsusldtrk */
-                vcpu_must_have(tsxldtrk);
-                /*
-                 * We're never in a transactional region when coming here
-                 * - nothing else to do.
-                 */
-                break;
-            default:
-                goto unimplemented_insn;
-            }
-            break;
-
-        case 0xe9:
-            switch ( vex.pfx )
-            {
-            case vex_f2: /* xresldtrk */
-                vcpu_must_have(tsxldtrk);
-                /*
-                 * We're never in a transactional region when coming here
-                 * - nothing else to do.
-                 */
-                break;
-            default:
-                goto unimplemented_insn;
-            }
-            break;
-
-        case 0xee:
-            switch ( vex.pfx )
-            {
-            case vex_none: /* rdpkru */
-                if ( !ops->read_cr ||
-                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
-                    cr4 = 0;
-                generate_exception_if(!(cr4 & X86_CR4_PKE), EXC_UD);
-                generate_exception_if(_regs.ecx, EXC_GP, 0);
-                _regs.r(ax) = rdpkru();
-                _regs.r(dx) = 0;
-                break;
-            default:
-                goto unimplemented_insn;
-            }
-            break;
-
-        case 0xef:
-            switch ( vex.pfx )
-            {
-            case vex_none: /* wrpkru */
-                if ( !ops->read_cr ||
-                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
-                    cr4 = 0;
-                generate_exception_if(!(cr4 & X86_CR4_PKE), EXC_UD);
-                generate_exception_if(_regs.ecx | _regs.edx, EXC_GP, 0);
-                wrpkru(_regs.eax);
-                break;
-            default:
-                goto unimplemented_insn;
-            }
-            break;
-
-        case 0xf8: /* swapgs */
-            generate_exception_if(!mode_64bit(), EXC_UD);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
-            fail_if(!ops->read_segment || !ops->read_msr ||
-                    !ops->write_segment || !ops->write_msr);
-            if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
-                                         ctxt)) != X86EMUL_OKAY ||
-                 (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
-                                     ctxt)) != X86EMUL_OKAY ||
-                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
-                                      ctxt)) != X86EMUL_OKAY )
-                goto done;
-            sreg.base = msr_val;
-            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
-                                          ctxt)) != X86EMUL_OKAY )
-            {
-                /* Best effort unwind (i.e. no error checking). */
-                ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
-                goto done;
-            }
-            break;
-
-        case 0xf9: /* rdtscp */
-            fail_if(ops->read_msr == NULL);
-            if ( (rc = ops->read_msr(MSR_TSC_AUX,
-                                     &msr_val, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            _regs.r(cx) = (uint32_t)msr_val;
-            goto rdtsc;
-
-        case 0xfc: /* clzero */
-        {
-            unsigned long zero = 0;
-
-            vcpu_must_have(clzero);
-
-            base = ad_bytes == 8 ? _regs.r(ax) :
-                   ad_bytes == 4 ? _regs.eax : _regs.ax;
-            limit = ctxt->cpuid->basic.clflush_size * 8;
-            generate_exception_if(limit < sizeof(long) ||
-                                  (limit & (limit - 1)), EXC_UD);
-            base &= ~(limit - 1);
-            if ( ops->rep_stos )
-            {
-                unsigned long nr_reps = limit / sizeof(zero);
-
-                rc = ops->rep_stos(&zero, ea.mem.seg, base, sizeof(zero),
-                                   &nr_reps, ctxt);
-                if ( rc == X86EMUL_OKAY )
-                {
-                    base += nr_reps * sizeof(zero);
-                    limit -= nr_reps * sizeof(zero);
-                }
-                else if ( rc != X86EMUL_UNHANDLEABLE )
-                    goto done;
-            }
-            fail_if(limit && !ops->write);
-            while ( limit )
-            {
-                rc = ops->write(ea.mem.seg, base, &zero, sizeof(zero), ctxt);
-                if ( rc != X86EMUL_OKAY )
-                    goto done;
-                base += sizeof(zero);
-                limit -= sizeof(zero);
-            }
-            break;
-        }
-
-#define _GRP7(mod, reg) \
-            (((mod) << 6) | ((reg) << 3)) ... (((mod) << 6) | ((reg) << 3) | 7)
-#define GRP7_MEM(reg) _GRP7(0, reg): case _GRP7(1, reg): case _GRP7(2, reg)
-#define GRP7_ALL(reg) GRP7_MEM(reg): case _GRP7(3, reg)
-
-        case GRP7_MEM(0): /* sgdt */
-        case GRP7_MEM(1): /* sidt */
-            ASSERT(ea.type == OP_MEM);
-            generate_exception_if(umip_active(ctxt, ops), EXC_GP, 0);
-            fail_if(!ops->read_segment || !ops->write);
-            if ( (rc = ops->read_segment(seg, &sreg, ctxt)) )
-                goto done;
-            if ( mode_64bit() )
-                op_bytes = 8;
-            else if ( op_bytes == 2 )
-            {
-                sreg.base &= 0xffffff;
-                op_bytes = 4;
-            }
-            if ( (rc = ops->write(ea.mem.seg, ea.mem.off, &sreg.limit,
-                                  2, ctxt)) != X86EMUL_OKAY ||
-                 (rc = ops->write(ea.mem.seg, truncate_ea(ea.mem.off + 2),
-                                  &sreg.base, op_bytes, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-
-        case GRP7_MEM(2): /* lgdt */
-        case GRP7_MEM(3): /* lidt */
-            ASSERT(ea.type == OP_MEM);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
-            fail_if(ops->write_segment == NULL);
-            memset(&sreg, 0, sizeof(sreg));
-            if ( (rc = read_ulong(ea.mem.seg, ea.mem.off,
-                                  &limit, 2, ctxt, ops)) ||
-                 (rc = read_ulong(ea.mem.seg, truncate_ea(ea.mem.off + 2),
-                                  &base, mode_64bit() ? 8 : 4, ctxt, ops)) )
-                goto done;
-            generate_exception_if(!is_canonical_address(base), EXC_GP, 0);
-            sreg.base = base;
-            sreg.limit = limit;
-            if ( !mode_64bit() && op_bytes == 2 )
-                sreg.base &= 0xffffff;
-            if ( (rc = ops->write_segment(seg, &sreg, ctxt)) )
-                goto done;
-            break;
-
-        case GRP7_ALL(4): /* smsw */
-            generate_exception_if(umip_active(ctxt, ops), EXC_GP, 0);
-            if ( ea.type == OP_MEM )
-            {
-                fail_if(!ops->write);
-                d |= Mov; /* force writeback */
-                ea.bytes = 2;
-            }
-            else
-                ea.bytes = op_bytes;
-            dst = ea;
-            fail_if(ops->read_cr == NULL);
-            if ( (rc = ops->read_cr(0, &dst.val, ctxt)) )
-                goto done;
-            break;
-
-        case GRP7_ALL(6): /* lmsw */
-            fail_if(ops->read_cr == NULL);
-            fail_if(ops->write_cr == NULL);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
-            if ( (rc = ops->read_cr(0, &cr0, ctxt)) )
-                goto done;
-            if ( ea.type == OP_REG )
-                cr0w = *ea.reg;
-            else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off,
-                                       &cr0w, 2, ctxt, ops)) )
-                goto done;
-            /* LMSW can: (1) set bits 0-3; (2) clear bits 1-3. */
-            cr0 = (cr0 & ~0xe) | (cr0w & 0xf);
-            if ( (rc = ops->write_cr(0, cr0, ctxt)) )
-                goto done;
-            break;
-
-        case GRP7_MEM(7): /* invlpg */
-            ASSERT(ea.type == OP_MEM);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
-            fail_if(!ops->tlb_op);
-            if ( (rc = ops->tlb_op(x86emul_invlpg, ea.mem.off, ea.mem.seg,
-                                   ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-
-#undef GRP7_ALL
-#undef GRP7_MEM
-#undef _GRP7
-
-        default:
-            goto unimplemented_insn;
-        }
-        break;
-    }
+        rc = x86emul_0f01(state, &_regs, &dst, ctxt, ops);
+        goto dispatch_from_helper;
 
     case X86EMUL_OPC(0x0f, 0x02): /* lar */
         generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
@@ -11332,6 +10545,24 @@ x86_emulate(
     unrecognized_insn:
         rc = X86EMUL_UNRECOGNIZED;
         goto done;
+
+    dispatch_from_helper:
+        if ( rc == X86EMUL_OKAY )
+            break;
+
+        switch ( rc )
+        {
+        case X86EMUL_rdtsc:
+            goto rdtsc;
+        }
+
+        /* Internally used state change indicators may not make it here. */
+        if ( rc < 0 )
+        {
+            ASSERT_UNREACHABLE();
+            rc = X86EMUL_UNHANDLEABLE;
+        }
+        goto done;
     }
 
     if ( state->rmw )
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -24,8 +24,6 @@
 #undef cpuid
 #undef wbinvd
 
-#define r(name) r ## name
-
 #define cpu_has_amd_erratum(nr) \
         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
 
@@ -54,12 +52,6 @@
 
 #define FXSAVE_AREA current->arch.fpu_ctxt
 
-#ifndef CONFIG_HVM
-# define X86EMUL_NO_FPU
-# define X86EMUL_NO_MMX
-# define X86EMUL_NO_SIMD
-#endif
-
 #include "x86_emulate/x86_emulate.c"
 
 int cf_check x86emul_read_xcr(


