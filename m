Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75A7728EE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578626.906219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT21p-0002W7-VY; Mon, 07 Aug 2023 15:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578626.906219; Mon, 07 Aug 2023 15:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT21p-0002UR-RR; Mon, 07 Aug 2023 15:20:17 +0000
Received: by outflank-mailman (input) for mailman id 578626;
 Mon, 07 Aug 2023 15:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT21o-0002UE-Fw
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:20:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e0f949-3535-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:20:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 15:20:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:20:13 +0000
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
X-Inumbo-ID: e8e0f949-3535-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbnsvD/Boyqoq3MKW0QMEt93/cA1fWpa0V7Yua6sC+6fH7k47ArL9aedLuKqZoR7IlhXooSbuXaOXAET+OF7NgLRRaDfsKJ4m+ys7Y3/JbtgxcemzMYLQ6cUXnwt108C+/4Ajg+9N37p5EJJ7bhAbkWQItS+3g50169w12Q+doaqBY/vKkGEkDQitKn832z0ZZ8CMoQyOBpKqdJoHr4COOB/crGvbQREgWCaur7kPWdTzOKlA0231dGIfJ4Mc9mzuo6sVrqJg+eeHPAPtCfJCNBY9aFDm/ixHHK81f7SKmqZ8Ra9ej8Lf/VkBAuYI1w6xCqyLVcRDvlIUZBfLLYHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGOOHP5krYVxVKN7ninHexZbAZk3q9DOBXGn5X6bujs=;
 b=Z3FE96vOcih05YuoHjKx+y0t4yQ2/X5Zehn6DrRHwOB3eD/tQvdJIGEC8GExlHy2gYOF6I/d8HutLN73Z4tGR1pw0MfiLCUErfg5nnMJBIQPsWY0kWNM0itBB1gHsZsQBUMTsxSqUq6JCBlVp9bJh5uxXcVnl9zIo3Gfk8yV83Uw7iTLINriMWotmtL15+wkkDyfiAtjIWhZ7+afEG5uL0Ek36yjCrD51JjygTMRXYDaSkJIOGINbW7wqQq8Usg2uxVxh63CDUMtdU3HAq6mt8WosrmsoQoLtoDNHWHz4+0Zqh7/l3L7rQVGj2Pq576yMDcRVkqvSFsNq6FJ5aRdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGOOHP5krYVxVKN7ninHexZbAZk3q9DOBXGn5X6bujs=;
 b=CrIPPxf06n2QGBdKIzCS7nZ6CTcnaaD73TZrNi06NRlNKA8k79uOq/+cG0S+PekIi5BhQU0V2UiDY9KPDm0nlZMVlpdbkqF0u4pjl1ZMuKdPKBmbwELV1epeWvzmJUt1pFeZY+BbCpj8moNXoeu/zYWSMuYRAmN9iVguurqP7Spg37LD62WMIos5W5K1+SvVUEIRam8Ud+n5tIy2S9EdbUPn9Del/UqdIq8pzcLdMuUa94xGoubOJ7XUJ63HGoqUF+v+pgq5VF4CXe9dX1iB74J8nJMGbOSy9gH4IgJTCZbz3cOWIfo65UOvsSkn0hFdNDjy839UBW6psF7s825qXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7ceac78-c3ba-3f51-90ec-ba7b08196b68@suse.com>
Date: Mon, 7 Aug 2023 17:20:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [PATCH 1/4] x86emul: support AVX-VNNI-INT16
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
In-Reply-To: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 723d360b-97c5-4a33-54a2-08db9759cbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bOE5R/VJNuZWazyd+j6sn0HG6R4WeOlm3Lh5LuGo1FLSaKgU+1l66I40dXVSlznKbdw4/+SCRvjuwpKlFLBQfCcTqeaSfyDzZ8kHbiurYn0dNzNpV8Yd0MN9e48YT6x6pUfI4KtOkmQeUbFvuMpuGqaFPsj8CNKxwiaVQIqCJjB3RDyFqmw/5keVt4ZCXajeiCz1esl/Ob3T3gPnEd6JLHdLXveDgUa5hXGdwjglVs1DCtZiJRla4hLHGUekAXJZLAFjwttYloZqhQ9AhwTX8wG3o66g6FR4TTrMKgyjPEjZyppgIkRaBNs9T1I8Q9M0fztQR/izl2faIgrpgvvYzKPJF/zgppxvCytqDBwUFXOPucz4/3qZwBWtzigAR1nmVXAHHcobJB79LrEwmpF1Ylekr0lJ/o2hq6AKIRmrUF5LoRpc4dwuA7nX1p8hUdynzPTak4POxjbbKkpTgUI7OOBSIeEEmzEI6VyEEYCfWJTUsD4l/DLP+wtUiDm9+oXUDgeVvPL/FSw0m39wi6gxwTY7wKCmvDJYvA0G0X0vrvY3TLQJHrDJoKOHTEMBozQbH2kmrDlWtSJuT6CZCVas6amSpZ9pzCuLSPP5YG09vnQvCq02mYJVJVVrZAuQBxdSUxwG5xrI5x0Kt8SoeqKqyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(6506007)(8936002)(8676002)(26005)(38100700002)(6486002)(2616005)(5660300002)(36756003)(2906002)(83380400001)(54906003)(31686004)(316002)(66476007)(66556008)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1DUTVSTjBGeDdVMTVtaU9GMVo4VFhRbVAzNExyWmM4VlBydXZ4VEJvcldK?=
 =?utf-8?B?YlRBQ2VqZzdCWlkvYlFjRGlxTCt2cWxXOXI5K2VqVXk3ZWhLTWRjRVFhU1Rk?=
 =?utf-8?B?eUJBT29rbS9QdU9mKzhvTG5GVHRocUlXVVNKR0FpS09WaWJQZzl2ZVJWQUtB?=
 =?utf-8?B?aEtKVDlWVWVMVERlalhxb3pORlZaRUlDdEtyNG9mcXZydTJ6NmhQTzJzYzdh?=
 =?utf-8?B?WTVwMUtmdXRuL1dseld0bjd1QUE4SUtLU1A0SFlYbXo2dUhnRjV5aC8rT3h5?=
 =?utf-8?B?MFZXajE4emVQYld5bjc1RjBKZzNvektBK2tyWlVMV0xDaWRFUSs4ZERrNktq?=
 =?utf-8?B?NFJUcGRETUJ6ZTA5NVFNVk1EMzkvSUZKL3dCRWZwSW9FTzh2NGpMSmE1ZDhz?=
 =?utf-8?B?NnovS2JVQURscnhua3EyVm52SkRjenRPRDZSSkhJVGJ6MW9TN09laTZ3UzNI?=
 =?utf-8?B?d2VTbncxRWtmY2d2aVF5eWtMVVhYQzkxZU4xWDZuUm1yYnIzaHpDYTVndnJm?=
 =?utf-8?B?eWtEL2kyTTl2VXN2QnIzOFNVRUxpSW5GRk5FbFNEOXp3Qm5nK3RVMTlZRHpR?=
 =?utf-8?B?cEtpRVpLNlNEUUlUNGk4d29vVFRYRlI2UmZ3T3VvNkpUbUh1U2E4YVVHM1JE?=
 =?utf-8?B?R1k1REx6VzBtM3FnbFFYaXY1b21yaFpGemg2bFUrb01KNGxPdnJmSDlYbDB6?=
 =?utf-8?B?MDA3WkRpTzZ2OVdkNGRRSlVIS3k4ZG1KWjUwNm1DaXlBZDVEZ3h3NDIzd0xs?=
 =?utf-8?B?cmZ2V1pZVHFDMmpPK1hhMnVVQkJVaHg1Z1pJUnV6T0pYWHVzc0hYemlNY3Zq?=
 =?utf-8?B?K0NWZ1NuTHN5ckhQY09lZlROQ0tYMDBxR0RoQWhwaTJUbnp6RnVmalNOVnli?=
 =?utf-8?B?WjVuUm54WHRiR0N6VTh6UTRVNDU3d0FibkRQTXdtWGc0SHdweVZ4ZWxxREJw?=
 =?utf-8?B?RmpwZ1VoY1VhRWRHbTRNRTRLUmhmdUJxNE4zVUM0eno0VkxjdzcvQkQxTzFi?=
 =?utf-8?B?ZXRhNVcwMjhreWwzR2Qya1YrOUNyUk5mSXNMSUp1WS9YenEzdmpxT2U5ZGRh?=
 =?utf-8?B?b04zTG5rLzBJVFdHZC9tRUI1WVpYNFdQZ0pKN0kyeVlPNnNGTU5oNGNNaUQz?=
 =?utf-8?B?a25tZXRJU2NoRkViTnVQZDdTRE51K1NnOHk5cXhGUEYrbFJnU2c5RTU3TUZk?=
 =?utf-8?B?VUQ3VWFGaUpwR2d4M3Y0MHo2QWtGNXhWWEp6T0cxbk41eVNuOUlNY0t3Y0ZY?=
 =?utf-8?B?WEpTZko0NFRCK25ibmhOVXhhMU5Mb2VPa2w1ZEVzelc5ODBPTVNHVXVwZjEx?=
 =?utf-8?B?eTA3OGpveEtMNC9YU3VHQXIzUXRzbWZ3N0FtMDloc3lZNURhaEhQbzVKbUlQ?=
 =?utf-8?B?NVdxZUp1RklNc3ZxWnI3elZEVXZKdFVJZEdESHVBcVZxL25VeG50SjN0WFN3?=
 =?utf-8?B?WE5aYXFVbEdBZ3VJNVlJdGtpc1ZsODdWbXdzREY5YXFVOWJVSXlLMzZ6TTY4?=
 =?utf-8?B?NWNnYnNCSWZtVTM5YVdESXM4ZXU4Q1FrWTh0emFPSHg2Zkw0V0E2NkJNZWZa?=
 =?utf-8?B?ekFoR00ydXk2WjBIck03ODBrQXN1K0RXcVUrS0I3UDRmQmQ3T1h2REZ0Y3VR?=
 =?utf-8?B?bFd4TWhyNkx1L0dBUkRvck1UamwvUDhlRHoxdWhFU1FFVUNHNmZ0ckpsOWRN?=
 =?utf-8?B?Uzk3Q3pEMWxmdlBsYitURkZyd3hreGNmNXhZQlpQSUFuV0YxbThMOTc5UlRB?=
 =?utf-8?B?Um1HcXdHcFJSTVhaZ0lrRUs5NmZXcUdiQWxSSUc3Y01WOGhBVHFkK2hzSWxC?=
 =?utf-8?B?MTl2d0xYb0pwem9tdDJRWll0WS9LVGM0UkI5L0FWR1lwRkVqdkFMWU1rcWt1?=
 =?utf-8?B?K2pJeTdMWUNRcGRKb0kwcVBSOVAzU3RUY0NCUG8ybEtWWmJXZ2QrejVmZTNt?=
 =?utf-8?B?V3gzbHdydmVPQ1BIc0d6OGluWDE1OHR1YUZsbDh3d2pNY3ZJRTFPTzBGdjdX?=
 =?utf-8?B?OGhFU2d0eXlkY2laWmVTc1lyb2dNSG00dzFHb1NWM29GbExLOWYybk94TTRt?=
 =?utf-8?B?SFhBTlpqZkVLQmJkS0o2ZWdDOWFadVhZeTJyNUt6Nk9nN3BnUWFsU0RUTWc2?=
 =?utf-8?Q?/DQZ63eeJxm3Ihg86ide34ya0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723d360b-97c5-4a33-54a2-08db9759cbeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:20:13.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh4BoECcbDA9mF4aSPXGL+oKUYqP/eeEv4cAGIBdpGIhc0AD+MemHwXmC18ZwKN6R4Bw1z1dykNigylhtxpPvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014

These are close relatives of the AVX-VNNI and AVX-VNNI-INT8 ISA
extensions. Since the insns here and in particular their memory access
patterns follow the usual scheme (and especially the word variants of
AVX-VNNI), I didn't think it was necessary to add a contrived test
specifically for them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm actually pondering whether to contrive dot_product() for these and
the other AVX-VNNI* insns, by additionally performing a horizontal add
on the result vectors. Main thing I dislike about it is that everything
else in simd_test() would then be re-run for no real purpose. Yet making
a new standalone simd-dotp.c also doesn't look very attractive.
---
SDE: -arl, -lnl, or -future

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -217,6 +217,8 @@ static const char *const str_7d1[32] =
 {
     [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
 
+    [10] = "avx-vnni-int16",
+
     [18] = "cet-sss",
 };
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1397,6 +1397,12 @@ static const struct vex {
     { { 0xbe }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub231p{s,d} */
     { { 0xbf }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub231s{s,d} */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xd2 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuud */
+    { { 0xd2 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusd */
+    { { 0xd2 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsud */
+    { { 0xd3 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuuds */
+    { { 0xd3 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusds */
+    { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
     { { 0xdb }, 2, T, R, pfx_66, WIG, L0 }, /* vaesimc */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -183,6 +183,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
 #define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
 #define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
+#define cpu_has_avx_vnni_int16 (cp.feat.avx_vnni_int16 && xcr0_mask(6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -183,6 +183,7 @@ static inline bool boot_cpu_has(unsigned
 /* CPUID level 0x00000007:1.edx */
 #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
 #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
+#define cpu_has_avx_vnni_int16  boot_cpu_has(X86_FEATURE_AVX_VNNI_INT16)
 
 /* MSR_ARCH_CAPS */
 #define cpu_has_rdcl_no         boot_cpu_has(X86_FEATURE_RDCL_NO)
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -435,6 +435,8 @@ static const struct ext0f38_table {
     [0xcc] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0xcd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xd2] = { .simd_size = simd_other },
+    [0xd3] = { .simd_size = simd_other },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -593,6 +593,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
+#define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6871,6 +6871,17 @@ x86_emulate(
         elem_bytes = 1;
         goto avx512f_no_sae;
 
+    case X86EMUL_OPC_VEX   (0x0f38, 0xd2): /* vpdpwuud [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xd2): /* vpdpwusd [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0xd2): /* vpdpwsud [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX   (0x0f38, 0xd3): /* vpdpwuuds [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xd3): /* vpdpwusds [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0xd3): /* vpdpwsuds [xy]mm/mem,[xy]mm,[xy]mm */
+        host_and_vcpu_must_have(avx_vnni_int16);
+        generate_exception_if(vex.w, X86_EXC_UD);
+        op_bytes = 16 << vex.l;
+        goto simd_0f_ymm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdc):  /* vaesenc {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdd):  /* vaesenclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -306,6 +306,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
+XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -284,7 +284,8 @@ def crunch_numbers(state):
         # feature flags.  If want to use AVX512, AVX2 must be supported and
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
-        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8],
+        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8,
+               AVX_VNNI_INT16],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


