Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347554C63B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349974.576200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJt-00011P-NH; Wed, 15 Jun 2022 10:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349974.576200; Wed, 15 Jun 2022 10:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJt-0000yi-Ja; Wed, 15 Jun 2022 10:32:17 +0000
Received: by outflank-mailman (input) for mailman id 349974;
 Wed, 15 Jun 2022 10:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QJr-0007gz-H5
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:32:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe02::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ba1654c-ec96-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:32:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:32:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:32:11 +0000
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
X-Inumbo-ID: 6ba1654c-ec96-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ0rTOC+f4B3CdqJG9fMbRrb4NlZOgLt4fJVGvS/8tALv5WBOLckar0s7RPU7Vv0F4IAqh5JPawMbDPCDFDTQLswbTyp5zaklgVUkpx8rW/l3Acwd4ML88DXTLaRFlfNOo5i72QaSXoGFhSSNXuVseAldKzwtGMnt5fobuToNwEzKiXKP1z1oJZ99CPtRoY3lMXXrT7v2gNAcwpzDIrEWKAeqljzGEUJK4kyUF6DAYdw9fr8I+yRi5jTg66N2MH5dPABeoOOew8KXL2gRNcOQC1d9KnwIyCRsdT9SyA53btnjH7NOKVD1waHDGKxZmpPaeJAXH0MZeymUvvUl5aCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1FAw4SWHwB87fUYBwv+opycuFCEYYEsmXkhPZ7XIIk=;
 b=Oy/svtfaSI/DHRRqzUdPXM84mWdl/5Sn8xdVfpLIwoPoEfQoH47gd059aleVQjEOibogKylLRLvo2wHaThSHYlAvO4rZ3tx1PDoADwPNP+y6NiWrfEykJWJAZm5w62RDdbRU2hox6BLmCu7Sa3IEACbYzYyoZQkQJhuHpa04vR2+tx9XgFPdWxG5aHhPa1JFkc8XYY8AiL78bo5/C/q+gQcJpsaC/ih4zF9Ep3CpK8bBgPit5uqwWgFUWoJzGMDjPuj76YwkBT8nBYmisjuCSEF8h0sxxXjhVOzSGGkotHjfz5nubL3EtsyzJ8lv9Dfzuu4lED1VQkSAhOiMInsFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1FAw4SWHwB87fUYBwv+opycuFCEYYEsmXkhPZ7XIIk=;
 b=yAozt7Acu9RsWWisV+PraYciwWtbSqD6xGjiTirNoGo2/2yrJVVwHFkfo1zM0B8nva8luUt+8zY6wi2sMqbX1FFzCsbyRneXn6x7kQEKwtg+i2kSJi8vGmKKNrtsLAQjsunS9D5bCv6ziKMh6MbBefqzJ8IxHweOKyDCa5PcVpeu4Xq6A9fhJLDTJwBiN4/k+EHk1HIOq4eKomAAmFne90PCMs+7+f3Cw1SdlY72cl0iyqG1R8o5DGC6j1r6fuNPcqgCWcmrE/4oyAQIM6c5pdUz2xnQp17itN2d16hOJTOFD17Z6bXmaqQOww4UnCYkcL/1E+Zegpk3ekOrXMEi1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a64d46c5-53ca-299e-a7f7-7f66f6ae871f@suse.com>
Date: Wed, 15 Jun 2022 12:32:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 11/11] x86emul: AVX512-FP16 testing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3512278-6146-4765-2c15-08da4eba4e2e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6876:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB687645F6DE53A08A9760EBE1B3AD9@DB8PR04MB6876.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y8oDrGhWSSkuQ0t/WYAcr4DclOpTCk+PRAkI0nygqMr67Ytm5ktI8XkuJUgPmkGoIqp/w4eNOuNrjKPQH2+dOm/HGwB0BLIOrAkkPxM2/gYG4/23X8UoPdIqdbEsWDjOaK935LCyMQSJSf5MjsZ96yX12BC/MI9sRQu0IHLbTScYLfQrNlGgE2t5WP7qTXDcIZLPIjd2IJP66d9/AqxY9C3G97Iuexd4ODu2bhzrKPHVS4bPKhewJ7CV1BOMbRPfT59/eWJ1rjRzHsDIQdLy46igdXXpDlPk9BkCq2WdqJpfZzQlKziaJP20HtGAQsklaT1FoyYkyNMo0SzwpCXgs8vCOpJgRxV1hhmcdRnLKlpiFoqG9xXVhgobd9og7x4wjGMkfQXNP++CjnOcZA54MWB802t5B3pvJZ96KiOTpgdIiI6z7E3F2b65HCheMtY70pNP6OKFVgfVWKvAhgkDY2hCAOLzkyOfJedctW0srVNdfoQ/BK5JRkY7GQMbWZ7KvXVZyYdaL9pp+VkPlfHReOzJSFDMugYteM0LYCiNHfjRqKe1Dy9ildvB3GL591ql0oHOQ8TaGTiFbnWo1xnyc6ZjvjzJldlN0gh4kf1A1klgocZZ2iEMNuZCuxTxHth6i40hLLolgUw2em8gM+aE40lucIEAzBPVrp97dU8Hs2q+DWKKy2EYb/w75/6JhGtIYEuqZWh31DUavtEWYTFXdN/sPFElRV5MuvS5JcVFhHg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(6512007)(66556008)(26005)(54906003)(5660300002)(6506007)(316002)(186003)(2906002)(31686004)(36756003)(30864003)(508600001)(6486002)(8936002)(66946007)(86362001)(4326008)(8676002)(6916009)(66476007)(38100700002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUdPQ1dKcW5OSStGN1BYdy9wd0F4UGg3cGxJN0JUU0QrenBTejlNQWxtaEpU?=
 =?utf-8?B?WU5UdGNtUmsyZUNBaWVocG5ZdkdlTEY4cFZVTzFLcE5tZW5TbGNSU2dXcXB1?=
 =?utf-8?B?N3RxQkhYZ0NFQytmVXc3TW44Uk5mdXdvdExmT3dZRmRBaUVJMG9CSi95cjVh?=
 =?utf-8?B?TEMxVTVQdnpRdU5GaXdQeTJNZzh0ZGYyRFc2NTQrSUcwQ3g3c1hKd1BGQUZI?=
 =?utf-8?B?L1hZQ001YnhFQ3FRNitEcWVtYm9jZzhqNDFOa1JUTWRWUEZlUWJtRm9PTncx?=
 =?utf-8?B?R2ZyZHd6NEhkTUxKZllzeDdpN05KTkgvRmdsQVNYUHliVWFBK1AvMVlJaUFI?=
 =?utf-8?B?OGdkdzBNeHNjWjgxM3dMeldOYUFUdEFBZHpta0RRUU1rTEREYXRmdkZsRklL?=
 =?utf-8?B?cVAzcWdQTHZiUHNqR3lTQ25US21SUHl2WHd3SitvdXRReGRBTmM1WFhVanJ5?=
 =?utf-8?B?UkpaZVNMWWxXRmhLNHdTMm53alh2Sy9zeldwQW0xZEpMM0dVdUJxdVBabnNr?=
 =?utf-8?B?Wjh2OXpTa01JUko4aWpxYS9HZE5jK08rcFVTU1FDTzRxbitNVzRCeEsyZXR0?=
 =?utf-8?B?emZBalVPMVVXZnFQeEZzNVZSbVBXQTJ0WjVJV1poSFRlV1d4RStHSUhtUTRO?=
 =?utf-8?B?MnFzanZ0azBZWUMvQnNrd0N3ODBnN05ubEc0YlB0THpydFZHV3FWdHZrK1JD?=
 =?utf-8?B?dEtHTnJmSytZYXgzVWhFS2xwazNjdmR4V0tPS1N6Yit4d3FHRkpKbXlmTkJn?=
 =?utf-8?B?dFYrbGVDaWVSRmF1NzhBdE1sRFJybngvclQyY0hSeGZ6NnJpSVVqSTFyWXMz?=
 =?utf-8?B?UXRDa0x3TlErWkZFa2tRUG9sUzBuYlhBK09RN09hbmgyU09PbTZyMGt2SGVP?=
 =?utf-8?B?Q3hzQXA5Tm10ay9ZM0MyaXJWVW9GNzhrRWNXVk8rMlNJQTZKOGVkeHBpS2F5?=
 =?utf-8?B?SnVVZTROTkZMS01SU05oeHdVbi9Pb1ZPQWJ3SjJlQW1KWGZjRWZhL0Y0MmRM?=
 =?utf-8?B?dUhMSnlyMGdBLzFIMFhMVVpSNnZKb2JKQzlVanFGdkJrVjJlMWdOL0pOUU5p?=
 =?utf-8?B?NEo0UG9LMW96TTlMVWVZMVNMRi9QaERVNHpvcERBMDBDanpFa0lQRkludW1w?=
 =?utf-8?B?VWdISkl3dURRaE05NjBPSnVXMDhvek5hNkZ2RG5qSEUwZktjNGdwRUZsbUhT?=
 =?utf-8?B?WUtIZ2JxcFhWK1AzN2IyQitFMzBOa0ZHQzM4RTlPL2taVDJqZVpkRVJDWFNF?=
 =?utf-8?B?Y1p2VnlXb3Y3QXdvNlVLKzA2L2hTYmZUajE0RDB3d2l1NktwWkt5ZTdlVEhD?=
 =?utf-8?B?ejNqZTVwZldyOGh0UHhCSjQrbXBVekJ3ekpNYS9XZ2x1Z2RRRnRzSndmbThk?=
 =?utf-8?B?ZnlvdnY0aTM2NlRjb1RZMlJMSC9ETHI3bWpnZ0piY2NaS1VCZ2J6YnNTQ08v?=
 =?utf-8?B?U05IakNQeU05RHdWbTFUbUw5ZXRCMW5FRGdLOVZmTW9VaCtEWDBTc09tVkYv?=
 =?utf-8?B?MTZoOWVSRlNSVks3b1hva0JrYS9rZWlVcmVETjFUSlB3djdxem5Hcnh2em83?=
 =?utf-8?B?ZVI5ZVVzVzB4Ylg4MkxSZVB6a1NmWGRpaWVzTzVWZnF5NjBWbUgzN2FjR2JE?=
 =?utf-8?B?TzRobXkweWpLZUFSYWt0WjdkZGVUQzNsNFAzcjZKamJBclQ0YVNGU2RqN2M0?=
 =?utf-8?B?d3JGamYrblYzUi9RZGZDRFByU3VSa0FZbXZLRUtJV0UwVXNoK3RRVGovK01l?=
 =?utf-8?B?U1VOaG8rcEVxOUh6SnA5dGlTcG1qSFlsMWh3TElMOFJNdkR6V2MxTi9YYWxU?=
 =?utf-8?B?QmtvOXpzWjZCMk11TG9ZRlpKcUhKeXJWdlRuY0FwbzBUeURSd3NYc0VHR2tC?=
 =?utf-8?B?UDRJVlVkdW1ZdGk4M1FWelFWRkFaMkV6c3oyMU05MXVaS2JHYTlMMVRsdGRF?=
 =?utf-8?B?QlZwaEhOei8wZkk4QWZud1pHazdzZHBrZms1czdOUS9NVGtQTlF4Vzh2OUFp?=
 =?utf-8?B?bzIrd095WGQzMGhnVEIzemtNTXFPc0R1VjJRcmtMMlhPb0tzNk55bmxYZmdV?=
 =?utf-8?B?U0tTbHdjZ1NSQ1pzSFlFYjE1WEh5eGZuMUtoZXNaeldyYUx2RXl1OXppQUc3?=
 =?utf-8?B?ckx3S1JUbEtoekx1b1FJWUJXQWwybzBPSkdvL1JPUzlVcTNYaHJlNGo5clFQ?=
 =?utf-8?B?dkQzQlUyNlYwZ3RLOHp5KzJYNTQvNmdUY2M3ZU10NDFuNUl4SWVBTUdDalNM?=
 =?utf-8?B?UUxJOXZ2ZU56Q1g0R3NwQklxdnVKc1FNNWtyY3E2OGtUU3cvTE1XRGNWNXFW?=
 =?utf-8?B?eU45Z1JieVNUS3haU0Y1WnR5V0I0Q0hqanE4YVBrbkJrelNXWFdTdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3512278-6146-4765-2c15-08da4eba4e2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:32:11.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+7O1iNwpQyUlVvdfqxLvBzCyCaMnjP4MiruGEMHI9cgcp27rYS5QNLUB2CivGA4dEFTdh4t3l0JiNjjwAQrJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

Naming of some of the builtins isn't fully consistent with that of
pre-existing ones, so there's a need for a new BR2() wrapper macro.

With the tests providing some proof of proper functioning of the
emulator code also enable use of the feature by guests, as there's no
other infrastructure involved in enabling this ISA extension.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -spr or -future
---
In the course of putting together the FMA part of the test I've noticed
that we no longer test scalar FMA insns (FMA, FMA4, AVX512F), due to gcc
no longer recognizing the pattern in version 9 or later. See gcc bug
105965, which apparently has already gained a fix for version 13. (Using
intrinsics for scalar operations is prohibitive, as they have full-
vector parameters.) I'm taking this as one of several reasons why here
I'm not even trying to make the compiler spot the complex FMA patterns,
using a mixture of intrinsics and inline assembly instead.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -16,7 +16,7 @@ vpath %.c $(XEN_ROOT)/xen/lib/x86
 
 CFLAGS += $(CFLAGS_xeninclude)
 
-SIMD := 3dnow sse sse2 sse4 avx avx2 xop avx512f avx512bw avx512dq avx512er avx512vbmi
+SIMD := 3dnow sse sse2 sse4 avx avx2 xop avx512f avx512bw avx512dq avx512er avx512vbmi avx512fp16
 FMA := fma4 fma
 SG := avx2-sg avx512f-sg avx512vl-sg
 AES := ssse3-aes avx-aes avx2-vaes avx512bw-vaes
@@ -91,6 +91,9 @@ avx512vbmi-vecs := $(avx512bw-vecs)
 avx512vbmi-ints := $(avx512bw-ints)
 avx512vbmi-flts := $(avx512bw-flts)
 avx512vbmi2-vecs := $(avx512bw-vecs)
+avx512fp16-vecs := $(avx512bw-vecs)
+avx512fp16-ints :=
+avx512fp16-flts := 2
 
 avx512f-opmask-vecs := 2
 avx512dq-opmask-vecs := 1 2
@@ -246,7 +249,7 @@ $(addsuffix .c,$(GF)):
 
 $(addsuffix .h,$(SIMD) $(FMA) $(SG) $(AES) $(CLMUL) $(SHA) $(GF)): simd.h
 
-xop.h avx512f.h: simd-fma.c
+xop.h avx512f.h avx512fp16.h: simd-fma.c
 
 endif # 32-bit override
 
--- a/tools/tests/x86_emulator/simd.c
+++ b/tools/tests/x86_emulator/simd.c
@@ -20,6 +20,14 @@ ENTRY(simd_test);
     asm ( "vcmpsd $0, %1, %2, %0"  : "=k" (r_) : "m" (x_), "v" (y_) ); \
     r_ == 1; \
 })
+# elif VEC_SIZE == 2
+#  define eq(x, y) ({ \
+    _Float16 x_ = (x)[0]; \
+    _Float16 __attribute__((vector_size(16))) y_ = { (y)[0] }; \
+    unsigned int r_; \
+    asm ( "vcmpsh $0, %1, %2, %0"  : "=k" (r_) : "m" (x_), "v" (y_) ); \
+    r_ == 1; \
+})
 # elif FLOAT_SIZE == 4
 /*
  * gcc's (up to at least 8.2) __builtin_ia32_cmpps256_mask() has an anomaly in
@@ -31,6 +39,8 @@ ENTRY(simd_test);
 #  define eq(x, y) ((BR(cmpps, _mask, x, y, 0, -1) & ALL_TRUE) == ALL_TRUE)
 # elif FLOAT_SIZE == 8
 #  define eq(x, y) (BR(cmppd, _mask, x, y, 0, -1) == ALL_TRUE)
+# elif FLOAT_SIZE == 2
+#  define eq(x, y) (B(cmpph, _mask, x, y, 0, -1) == ALL_TRUE)
 # elif (INT_SIZE == 1 || UINT_SIZE == 1) && defined(__AVX512BW__)
 #  define eq(x, y) (B(pcmpeqb, _mask, (vqi_t)(x), (vqi_t)(y), -1) == ALL_TRUE)
 # elif (INT_SIZE == 2 || UINT_SIZE == 2) && defined(__AVX512BW__)
@@ -116,6 +126,14 @@ static inline bool _to_bool(byte_vec_t b
     asm ( "vcvtusi2sd%z1 %1, %0, %0" : "=v" (t_) : "m" (u_) ); \
     (vec_t){ t_[0] }; \
 })
+#  elif FLOAT_SIZE == 2
+#   define to_u_int(type, x) ({ \
+    unsigned type u_; \
+    _Float16 __attribute__((vector_size(16))) t_; \
+    asm ( "vcvtsh2usi %1, %0" : "=r" (u_) : "m" ((x)[0]) ); \
+    asm ( "vcvtusi2sh%z1 %1, %0, %0" : "=v" (t_) : "m" (u_) ); \
+    (vec_t){ t_[0] }; \
+})
 #  endif
 #  define to_uint(x) to_u_int(int, x)
 #  ifdef __x86_64__
@@ -153,6 +171,43 @@ static inline bool _to_bool(byte_vec_t b
 #   define to_wint(x) BR(cvtqq2pd, _mask, BR(cvtpd2qq, _mask, x, (vdi_t)undef(), ~0), undef(), ~0)
 #   define to_uwint(x) BR(cvtuqq2pd, _mask, BR(cvtpd2uqq, _mask, x, (vdi_t)undef(), ~0), undef(), ~0)
 #  endif
+# elif FLOAT_SIZE == 2
+#  define to_int(x) BR2(vcvtw2ph, _mask, BR2(vcvtph2w, _mask, x, (vhi_t)undef(), ~0), undef(), ~0)
+#  define to_uint(x) BR2(vcvtuw2ph, _mask, BR2(vcvtph2uw, _mask, x, (vhi_t)undef(), ~0), undef(), ~0)
+#  if VEC_SIZE == 16
+#   define low_half(x) (x)
+#   define high_half(x) ((vec_t)B_(movhlps, , (vsf_t)undef(), (vsf_t)(x)))
+#   define insert_half(x, y, p) ((vec_t)((p) ? B_(movlhps, , (vsf_t)(x), (vsf_t)(y)) \
+                                             : B_(shufps, , (vsf_t)(y), (vsf_t)(x), 0b11100100)))
+#  elif VEC_SIZE == 32
+#   define _half(x, lh) ((vhf_half_t)B(extracti32x4_, _mask, (vsi_t)(x), lh, (vsi_half_t){}, ~0))
+#   define low_half(x)  _half(x, 0)
+#   define high_half(x) _half(x, 1)
+#   define insert_half(x, y, p) \
+    ((vec_t)B(inserti32x4_, _mask, (vsi_t)(x), (vsi_half_t)(y), p, (vsi_t)undef(), ~0))
+#  elif VEC_SIZE == 64
+#   define _half(x, lh) \
+    ((vhf_half_t)__builtin_ia32_extracti64x4_mask((vdi_t)(x), lh, (vdi_half_t){}, ~0))
+#   define low_half(x)  _half(x, 0)
+#   define high_half(x) _half(x, 1)
+#   define insert_half(x, y, p) \
+    ((vec_t)__builtin_ia32_inserti64x4_mask((vdi_t)(x), (vdi_half_t)(y), p, (vdi_t)undef(), ~0))
+#  endif
+#  define to_w_int(x, s) ({ \
+    vhf_half_t t_ = low_half(x); \
+    vsi_t lo_, hi_; \
+    touch(t_); \
+    lo_ = BR2(vcvtph2 ## s ## dq, _mask, t_, (vsi_t)undef(), ~0); \
+    t_ = high_half(x); \
+    touch(t_); \
+    hi_ = BR2(vcvtph2 ## s ## dq, _mask, t_, (vsi_t)undef(), ~0); \
+    touch(lo_); touch(hi_); \
+    insert_half(insert_half(undef(), \
+                            BR2(vcvt ## s ## dq2ph, _mask, lo_, (vhf_half_t){}, ~0), 0), \
+                BR2(vcvt ## s ## dq2ph, _mask, hi_, (vhf_half_t){}, ~0), 1); \
+})
+#  define to_wint(x) to_w_int(x, )
+#  define to_uwint(x) to_w_int(x, u)
 # endif
 #elif VEC_SIZE == 16 && defined(__SSE2__)
 # if FLOAT_SIZE == 4
@@ -240,10 +295,18 @@ static inline vec_t movlhps(vec_t x, vec
 #  define scale(x, y) scalar_2op(x, y, "vscalefsd %[in2], %[in1], %[out]")
 #  define sqrt(x) scalar_1op(x, "vsqrtsd %[in], %[out], %[out]")
 #  define trunc(x) scalar_1op(x, "vrndscalesd $0b1011, %[in], %[out], %[out]")
+# elif FLOAT_SIZE == 2
+#  define getexp(x) scalar_1op(x, "vgetexpsh %[in], %[out], %[out]")
+#  define getmant(x) scalar_1op(x, "vgetmantsh $0, %[in], %[out], %[out]")
+#  define recip(x) scalar_1op(x, "vrcpsh %[in], %[out], %[out]")
+#  define rsqrt(x) scalar_1op(x, "vrsqrtsh %[in], %[out], %[out]")
+#  define scale(x, y) scalar_2op(x, y, "vscalefsh %[in2], %[in1], %[out]")
+#  define sqrt(x) scalar_1op(x, "vsqrtsh %[in], %[out], %[out]")
+#  define trunc(x) scalar_1op(x, "vrndscalesh $0b1011, %[in], %[out], %[out]")
 # endif
 #elif defined(FLOAT_SIZE) && defined(__AVX512F__) && \
       (VEC_SIZE == 64 || defined(__AVX512VL__))
-# if ELEM_COUNT == 8 /* vextractf{32,64}x4 */ || \
+# if (ELEM_COUNT == 8 && ELEM_SIZE >= 4) /* vextractf{32,64}x4 */ || \
      (ELEM_COUNT == 16 && ELEM_SIZE == 4 && defined(__AVX512DQ__)) /* vextractf32x8 */ || \
      (ELEM_COUNT == 4 && ELEM_SIZE == 8 && defined(__AVX512DQ__)) /* vextractf64x2 */
 #  define _half(x, lh) ({ \
@@ -398,6 +461,21 @@ static inline vec_t movlhps(vec_t x, vec
                          VEC_SIZE == 32 ? 0b01 : 0b00011011, undef(), ~0), \
                        0b01010101, undef(), ~0)
 #  endif
+# elif FLOAT_SIZE == 2
+#  define frac(x) BR2(reduceph, _mask, x, 0b00001011, undef(), ~0)
+#  define getexp(x) BR(getexpph, _mask, x, undef(), ~0)
+#  define getmant(x) BR(getmantph, _mask, x, 0, undef(), ~0)
+#  define max(x, y) BR2(maxph, _mask, x, y, undef(), ~0)
+#  define min(x, y) BR2(minph, _mask, x, y, undef(), ~0)
+#  define scale(x, y) BR2(scalefph, _mask, x, y, undef(), ~0)
+#  define recip(x) B(rcpph, _mask, x, undef(), ~0)
+#  define rsqrt(x) B(rsqrtph, _mask, x, undef(), ~0)
+#  define shrink1(x) BR2(vcvtps2phx, _mask, (vsf_t)(x), (vhf_half_t){}, ~0)
+#  define shrink2(x) BR2(vcvtpd2ph, _mask, (vdf_t)(x), (vhf_quarter_t){}, ~0)
+#  define sqrt(x) BR2(sqrtph, _mask, x, undef(), ~0)
+#  define trunc(x) BR2(rndscaleph, _mask, x, 0b1011, undef(), ~0)
+#  define widen1(x) ((vec_t)BR2(vcvtph2psx, _mask, x, (vsf_t)undef(), ~0))
+#  define widen2(x) ((vec_t)BR2(vcvtph2pd, _mask, x, (vdf_t)undef(), ~0))
 # endif
 #elif FLOAT_SIZE == 4 && defined(__SSE__)
 # if VEC_SIZE == 32 && defined(__AVX__)
@@ -920,6 +998,16 @@ static inline vec_t movlhps(vec_t x, vec
 #  define dup_lo(x) B(movddup, _mask, x, undef(), ~0)
 # endif
 #endif
+#if FLOAT_SIZE == 2 && ELEM_COUNT > 1
+# define dup_hi(x) ((vec_t)B(pshufhw, _mask, \
+                             B(pshuflw, _mask, (vhi_t)(x), 0b11110101, \
+                               (vhi_t)undef(), ~0), \
+                             0b11110101, (vhi_t)undef(), ~0))
+# define dup_lo(x) ((vec_t)B(pshufhw, _mask, \
+                             B(pshuflw, _mask, (vhi_t)(x), 0b10100000, \
+                               (vhi_t)undef(), ~0), \
+                             0b10100000, (vhi_t)undef(), ~0))
+#endif
 #if VEC_SIZE == 16 && defined(__SSSE3__) && !defined(__AVX512VL__)
 # if INT_SIZE == 1
 #  define abs(x) ((vec_t)__builtin_ia32_pabsb128((vqi_t)(x)))
--- a/tools/tests/x86_emulator/simd.h
+++ b/tools/tests/x86_emulator/simd.h
@@ -53,6 +53,9 @@ float
 # elif FLOAT_SIZE == 8
 #  define MODE DF
 #  define ELEM_SFX "d"
+# elif FLOAT_SIZE == 2
+#  define MODE HF
+#  define ELEM_SFX "h"
 # endif
 #endif
 #ifndef VEC_SIZE
@@ -67,7 +70,10 @@ typedef unsigned int __attribute__((mode
 /* Various builtins want plain char / int / long long vector types ... */
 typedef char __attribute__((vector_size(VEC_SIZE))) vqi_t;
 typedef short __attribute__((vector_size(VEC_SIZE))) vhi_t;
+#if VEC_SIZE >= 4
 typedef int __attribute__((vector_size(VEC_SIZE))) vsi_t;
+typedef float __attribute__((vector_size(VEC_SIZE))) vsf_t;
+#endif
 #if VEC_SIZE >= 8
 typedef long long __attribute__((vector_size(VEC_SIZE))) vdi_t;
 typedef double __attribute__((vector_size(VEC_SIZE))) vdf_t;
@@ -96,6 +102,9 @@ typedef char __attribute__((vector_size(
 typedef short __attribute__((vector_size(HALF_SIZE))) vhi_half_t;
 typedef int __attribute__((vector_size(HALF_SIZE))) vsi_half_t;
 typedef long long __attribute__((vector_size(HALF_SIZE))) vdi_half_t;
+#ifdef __AVX512FP16__
+typedef _Float16 __attribute__((vector_size(HALF_SIZE))) vhf_half_t;
+#endif
 typedef float __attribute__((vector_size(HALF_SIZE))) vsf_half_t;
 # endif
 
@@ -110,6 +119,9 @@ typedef char __attribute__((vector_size(
 typedef short __attribute__((vector_size(QUARTER_SIZE))) vhi_quarter_t;
 typedef int __attribute__((vector_size(QUARTER_SIZE))) vsi_quarter_t;
 typedef long long __attribute__((vector_size(QUARTER_SIZE))) vdi_quarter_t;
+#ifdef __AVX512FP16__
+typedef _Float16 __attribute__((vector_size(QUARTER_SIZE))) vhf_quarter_t;
+#endif
 # endif
 
 # if ELEM_COUNT >= 8
@@ -163,6 +175,7 @@ DECL_OCTET(half);
 #elif VEC_SIZE == 64
 # define B(n, s, a...)   __builtin_ia32_ ## n ## 512 ## s(a)
 # define BR(n, s, a...)  __builtin_ia32_ ## n ## 512 ## s(a, 4)
+# define BR2(n, s, a...) __builtin_ia32_ ## n ## 512 ## s ## _round(a, 4)
 #endif
 #ifndef B_
 # define B_ B
@@ -171,6 +184,9 @@ DECL_OCTET(half);
 # define BR B
 # define BR_ B_
 #endif
+#ifndef BR2
+# define BR2 BR
+#endif
 #ifndef BR_
 # define BR_ BR
 #endif
--- a/tools/tests/x86_emulator/simd-fma.c
+++ b/tools/tests/x86_emulator/simd-fma.c
@@ -28,6 +28,8 @@ ENTRY(fma_test);
 #  define fmaddsub(x, y, z) BR(vfmaddsubps, _mask, x, y, z, ~0)
 # elif FLOAT_SIZE == 8
 #  define fmaddsub(x, y, z) BR(vfmaddsubpd, _mask, x, y, z, ~0)
+# elif FLOAT_SIZE == 2
+#  define fmaddsub(x, y, z) BR(vfmaddsubph, _mask, x, y, z, ~0)
 # endif
 #elif VEC_SIZE == 16
 # if FLOAT_SIZE == 4
@@ -70,6 +72,75 @@ ENTRY(fma_test);
 # endif
 #endif
 
+#ifdef __AVX512FP16__
+# define I (1.if16)
+# if VEC_SIZE > FLOAT_SIZE
+#  define CELEM_COUNT (ELEM_COUNT / 2)
+static const unsigned int conj_mask = 0x80000000;
+#  define conj(z) ({ \
+    vec_t r_; \
+    asm ( "vpxord %2%{1to%c3%}, %1, %0" \
+          : "=v" (r_) \
+          : "v" (z), "m" (conj_mask), "i" (CELEM_COUNT) ); \
+    r_; \
+})
+#  define _cmul_vv(a, b, c)  BR2(vf##c##mulcph, , a, b)
+#  define _cmul_vs(a, b, c) ({ \
+    vec_t r_; \
+    _Complex _Float16 b_ = (b); \
+    asm ( "vf"#c"mulcph %2%{1to%c3%}, %1, %0" \
+          : "=v" (r_) \
+          : "v" (a), "m" (b_), "i" (CELEM_COUNT) ); \
+    r_; \
+})
+#  define cmadd_vv(a, b, c) BR2(vfmaddcph, , a, b, c)
+#  define cmadd_vs(a, b, c) ({ \
+    _Complex _Float16 b_ = (b); \
+    vec_t r_; \
+    asm ( "vfmaddcph %2%{1to%c3%}, %1, %0" \
+          : "=v" (r_) \
+          : "v" (a), "m" (b_), "i" (CELEM_COUNT), "0" (c) ); \
+    r_; \
+})
+# else
+#  define CELEM_COUNT 1
+typedef _Float16 __attribute__((vector_size(4))) cvec_t;
+#  define conj(z) ({ \
+    cvec_t r_; \
+    asm ( "xor $0x80000000, %0" : "=rm" (r_) : "0" (z) ); \
+    r_; \
+})
+#  define _cmul_vv(a, b, c) ({ \
+    cvec_t r_; \
+    /* "=&x" to force destination to be different from both sources */ \
+    asm ( "vf"#c"mulcsh %2, %1, %0" : "=&x" (r_) : "x" (a), "m" (b) ); \
+    r_; \
+})
+#  define _cmul_vs(a, b, c) ({ \
+    _Complex _Float16 b_ = (b); \
+    cvec_t r_; \
+    /* "=&x" to force destination to be different from both sources */ \
+    asm ( "vf"#c"mulcsh %2, %1, %0" : "=&x" (r_) : "x" (a), "m" (b_) ); \
+    r_; \
+})
+#  define cmadd_vv(a, b, c) ({ \
+    cvec_t r_ = (c); \
+    asm ( "vfmaddcsh %2, %1, %0" : "+x" (r_) : "x" (a), "m" (b) ); \
+    r_; \
+})
+#  define cmadd_vs(a, b, c) ({ \
+    _Complex _Float16 b_ = (b); \
+    cvec_t r_ = (c); \
+    asm ( "vfmaddcsh %2, %1, %0" : "+x" (r_) : "x" (a), "m" (b_) ); \
+    r_; \
+})
+# endif
+# define cmul_vv(a, b) _cmul_vv(a, b, )
+# define cmulc_vv(a, b) _cmul_vv(a, b, c)
+# define cmul_vs(a, b) _cmul_vs(a, b, )
+# define cmulc_vs(a, b) _cmul_vs(a, b, c)
+#endif
+
 int fma_test(void)
 {
     unsigned int i;
@@ -156,5 +227,99 @@ int fma_test(void)
     touch(inv);
 #endif
 
+#ifdef CELEM_COUNT
+
+# if VEC_SIZE > FLOAT_SIZE
+#  define cvec_t vec_t
+#  define ceq eq
+# else
+  {
+    /* Cannot re-use the function-scope variables (for being too small). */
+    cvec_t x, y, z, src = { 1, 2 }, inv = { 2, 1 }, one = { 1, 1 };
+#  define ceq(x, y) ({ \
+    unsigned int r_; \
+    asm ( "vcmpph $0, %1, %2, %0"  : "=k" (r_) : "x" (x), "x" (y) ); \
+    (r_ & 3) == 3; \
+})
+# endif
+
+    /* (a * i)² == -a² */
+    x = cmul_vs(src, I);
+    y = cmul_vv(x, x);
+    x = -src;
+    touch(src);
+    z = cmul_vv(x, src);
+    if ( !ceq(y, z) ) return __LINE__;
+
+    /* conj(a * b) == conj(a) * conj(b) */
+    touch(src);
+    x = conj(src);
+    touch(inv);
+    y = cmulc_vv(x, inv);
+    touch(src);
+    touch(inv);
+    z = conj(cmul_vv(src, inv));
+    if ( !ceq(y, z) ) return __LINE__;
+
+    /* a * conj(a) == |a|² */
+    touch(src);
+    y = src;
+    touch(src);
+    x = cmulc_vv(y, src);
+    y *= y;
+    for ( i = 0; i < ELEM_COUNT; i += 2 )
+    {
+        if ( x[i] != y[i] + y[i + 1] ) return __LINE__;
+        if ( x[i + 1] ) return __LINE__;
+    }
+
+    /* a * b == b * a + 0 */
+    touch(src);
+    touch(inv);
+    x = cmul_vv(src, inv);
+    touch(src);
+    touch(inv);
+    y = cmadd_vv(inv, src, (cvec_t){});
+    if ( !ceq(x, y) ) return __LINE__;
+
+    /* a * 1 + b == b * 1 + a */
+    touch(src);
+    touch(inv);
+    x = cmadd_vs(src, 1, inv);
+    for ( i = 0; i < ELEM_COUNT; i += 2 )
+    {
+        z[i] = 1;
+        z[i + 1] = 0;
+    }
+    touch(z);
+    y = cmadd_vv(inv, z, src);
+    if ( !ceq(x, y) ) return __LINE__;
+
+    /* (a + b) * c == a * c + b * c */
+    touch(one);
+    touch(inv);
+    x = cmul_vv(src + one, inv);
+    touch(inv);
+    y = cmul_vv(one, inv);
+    touch(inv);
+    z = cmadd_vv(src, inv, y);
+    if ( !ceq(x, z) ) return __LINE__;
+
+    /* a * i + conj(a) == (Re(a) - Im(a)) * (1 + i) */
+    x = cmadd_vs(src, I, conj(src));
+    for ( i = 0; i < ELEM_COUNT; i += 2 )
+    {
+        typeof(x[0]) val = src[i] - src[i + 1];
+
+        if ( x[i] != val ) return __LINE__;
+        if ( x[i + 1] != val ) return __LINE__;
+    }
+
+# if VEC_SIZE == FLOAT_SIZE
+  }
+# endif
+
+#endif /* CELEM_COUNT */
+
     return 0;
 }
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -43,6 +43,7 @@ asm ( ".pushsection .test, \"ax\", @prog
 #include "avx512er.h"
 #include "avx512vbmi.h"
 #include "avx512vbmi2-vpclmulqdq.h"
+#include "avx512fp16.h"
 
 #define verbose false /* Switch to true for far more logging. */
 
@@ -249,6 +250,16 @@ static bool simd_check_avx512bw_gf_vl(vo
     return cpu_has_gfni && cpu_has_avx512vl;
 }
 
+static bool simd_check_avx512fp16(void)
+{
+    return cpu_has_avx512_fp16;
+}
+
+static bool simd_check_avx512fp16_vl(void)
+{
+    return cpu_has_avx512_fp16 && cpu_has_avx512vl;
+}
+
 static void simd_set_regs(struct cpu_user_regs *regs)
 {
     if ( cpu_has_mmx )
@@ -510,6 +521,10 @@ static const struct {
     AVX512VL(_VBMI+VL u16x8, avx512vbmi,    16u2),
     AVX512VL(_VBMI+VL s16x16, avx512vbmi,   32i2),
     AVX512VL(_VBMI+VL u16x16, avx512vbmi,   32u2),
+    SIMD(AVX512_FP16 f16 scal,avx512fp16,     f2),
+    SIMD(AVX512_FP16 f16x32, avx512fp16,    64f2),
+    AVX512VL(_FP16+VL f16x8, avx512fp16,    16f2),
+    AVX512VL(_FP16+VL f16x16,avx512fp16,    32f2),
     SIMD(SHA,                sse4_sha,        16),
     SIMD(AVX+SHA,             avx_sha,        16),
     AVX512VL(VL+SHA,      avx512f_sha,        16),
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -281,7 +281,7 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13)
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
-XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*   AVX512 FP16 instructions */
+XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */


