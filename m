Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C705B9876
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 12:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407303.649755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYljy-0007Ie-4q; Thu, 15 Sep 2022 10:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407303.649755; Thu, 15 Sep 2022 10:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYljy-0007Gr-1l; Thu, 15 Sep 2022 10:05:02 +0000
Received: by outflank-mailman (input) for mailman id 407303;
 Thu, 15 Sep 2022 10:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYljw-0007Gl-Qm
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 10:05:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db78721d-34dd-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 12:04:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7474.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 10:04:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 10:04:57 +0000
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
X-Inumbo-ID: db78721d-34dd-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj9HG8yQMK9a+F1KEA31lAIYeQyeEquy2wGrqIKF8CY8mHBp0Mjm0CDlfwiaTPz1X6zEX3stuodW9PN2CPxvw6q9nXCwHeDoemJ0CIlFhHmvn9GbCDNEeL73ryK1JcPXgb1nYioSJ21PmWw9japl9v016SwCAoOclUCzhCIXtLuVsLArgR4N2v6DCJjHpzARg0JtpnmKUMmFWCXnz/xqVOGyZLqIIVmSL1vKLxigZhCWIRE97nPVmtuS1vOJe1CHkuDu247O7DffEt92kV2c2ux1QSkCkzvYKBiBur15bkk8tqHqeeKzg3N0XN9cyrouk+uUpzq4IiV0moJrT/+/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI59twKsYmmesU3cRk8rF8XEn2z1DD7sDUYxjZMfDek=;
 b=NCG/+0UqbO8wFX7E/eR2R7uPmpGnQGQCg9WDt3yYC1pPzAia3HrW4MQmp4RfBy3mt8G1UOC1yNveQZae1vvYY8mCRh855k7p5n/DRG5VgshRcdzxW14I3xxOhEbdYALN+FxRkkX2y9fxsNDFrkcle/HvfX7AljfyonlZRcSzgrhq/u9mOBcUxLU5/GCbffJuu3ERKBx1vC8y6aC0cG5pl21u/KSkbUJWim30zH0YSCK3btp9jKhGAev8NiU23Od/3XrXP/Lr9euUmtUGJEBG6rBK/EkZ2dHEn8Wid1am9PWIDwsaIK+YIyuCevu3ZooL6QStyUw6paW4xa+q9lOcKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI59twKsYmmesU3cRk8rF8XEn2z1DD7sDUYxjZMfDek=;
 b=dB3AhVo2PcMiV8goAq1vmwJE4lePJhQNdFKZ1cVGg3CRp24qJq5C0ITIBWbH4J4svmDk/Hoop3D6IIrn/poZ9u1USgQMh1syJKRzH0kxDvcQoqZgtZA+zgzaRQok0qnJZIwEcPSoJiAWEqhp0rrQKn64H/AqaYzoRj4Kqr1KKrrNH7/MmT4mfTbYZwGlR0Sr3Z7/vqCtFPL8gMu5dTVQtODhSTOoJUd9OwLotfYCNRt1bWEUoX9lbzaToiF8Ny28qA8GsejyRSZYB68aC61QCht9ZB5JjGyzctzL6UfXdfDnpTOTMXll+aIK4uk30NDhnKeccbjHK7C6nEVQDQqAkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
Date: Thu, 15 Sep 2022 12:04:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.17?] x86: support data operand independent timing mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: b278b8f7-2b5b-46e5-d5ff-08da9701bea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MfJ6oiGZyXpEHwlKHl4xJKXjhDeiWi3binM6/GxeMX2A+mVQB+ik1XqzTbJwcHVa9hzi0uGgpL6ZgP+o6cWIicNtxczkeL0/E4DbcQytnftLatCfttMu8N8eM3X5Yk3XljG9agMXXkHW7T0lBZc+0VWjfuL/ICuTAPFzs+xeSu1ehApuVW+LKBWvEs54ILcdU9uXQOzIa/hiQZ7vvqetL8jpbDnVnTdPIIjbU684Tj2010d8O9YdWpDGQ4HfN4QstA7WRi1hiXacbEw8NJBPHhLV95VSffVPHqMfzW0LR7AUNvjCm+AVw+/g3uNUhBVX/l8iGWMLHhqhMzLo++pIqsdkkF33PLLzVFlnEJWlXgDZzTcVEPWDvSdxBGwNgB2Cl5zCa/x1hjWZmwwqfbVLZMV7lP0hJRwnDvvHZzp+2EZNDHTCigJeRR5R2AFyGRrDfdNynvPTcny/YdFw05iyFdQ2Qx9L0QEVSJOT0XcDJ6kTLDOek59Wj8H0uohUNpQe7H0PGVH1i2DBq2+LuGlfOkHXQBMLPdxAMq9NUevzJ75yufH7+cwriAuIqO8kzBkFPo/PHcZnHOJ4sj9+AoBMv6sZgT4gHbuEgiqy6L5QquIfjOGJchScYQwOgvVuNdMGjn4GbKmEtFA2+TSB4G9HC2o/NYjuogis+vYzplwteJNFh2gRRxeq4MWJ8e+kV9CVygFDhHuwiQL5UE4FKh1keK1t266Xudm09VADM9cKkjAQfYGM6xzh4eMHkrqsTk9Gwuo4Zf8m1QbQqualmik8JFbGVi+XeTFuCQR9mkEqR0h4Qoh7ribVMO3scVS9PcLixW766630MLYGgG8xeOPW1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(478600001)(66946007)(6506007)(86362001)(66556008)(4326008)(66476007)(186003)(966005)(8676002)(31696002)(26005)(2906002)(5660300002)(41300700001)(316002)(36756003)(31686004)(54906003)(6486002)(6916009)(2616005)(6512007)(8936002)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekJIalJIUTFtdnQxSHU5UjlYRkhISy9TNVdkQmVUYXhicEdIaStWSEJtbVZy?=
 =?utf-8?B?OGlERmRZUnNqMlp2MlEwYTV1ZDZoSEE4MnRkeG9Uemc1QzNkYWpsNk56ZlNG?=
 =?utf-8?B?TmdFd21EaXpPdW9Ua3BVSE1SRnVIQWYzSHk3NFIxeitVV3JiK1ZtdjdHZkx3?=
 =?utf-8?B?RjJ5VmxmbVlrdUY5eXZIcVJaRERLTUsxU09yTkNoK0IyZGtwandnRXZPa3o2?=
 =?utf-8?B?SG93TWIveDltSllYeWpIQXFNbDR1VVl3MStuY0JQczBwNjlpSDFTTkp2NzBP?=
 =?utf-8?B?QkRiTmFjU2lJSDR1bC9Nd1JYYUxCTVc1eTY3SDh0U2o3UUFraWhaWFBlNFRi?=
 =?utf-8?B?dHVHL1ZHa09lTm0zcndsSW00Rnc1MnIyblVRdEswWXVzZldyQUNPaGRqUmJy?=
 =?utf-8?B?Z2V1Q2ltWkFNQ0Q0aUNTNGpka1c5MTNaWk1Zcm11U3E1c1pGMnpOd041cnp4?=
 =?utf-8?B?WWdLOWpWcFVGZi9sckJYNFB1UXdQQnJHVWQvdVpveXN5alQ5TkFFQ2hXbEp4?=
 =?utf-8?B?ZTl2MHBZdVpOVm5VZVl4MDNBUFpKR3U0UE5pYnpydDZZOWhqT1ZMbGtrTytY?=
 =?utf-8?B?QzU3aW1ITXpjK2pJNkFidm8zSmpDdnFHaGVESlZnWldjc2o5UThYNldFaGhp?=
 =?utf-8?B?cjgvcVdkTHc3OGlMalZ2WGptOGg5WlM3ajJic2Nhck5nMklKdWJvcFNyc1lK?=
 =?utf-8?B?d1oxc2FMVnNPYndLWUZSN25SM1RYZ0VxOTVzRDRuOEI5SkRjbnZ0c2E4MUFH?=
 =?utf-8?B?VUdzL1RHVTNjMEc4MndlSDJTUkJhV0FSL2dRbVJVcHlDUlJGV2c2dGRoVFpv?=
 =?utf-8?B?aHRsWEhDa21CaFgwbkh2Vkc0c2kzbEVSWmRvemNUSG50ZjZKTmVwMFdKYTNz?=
 =?utf-8?B?Q3IxUXk1U1BxWG10MENwb2hVbEx3SHJYZkhBenA2eExnSEJid3NMcHFmc2lT?=
 =?utf-8?B?eUJUZHpyR0w0b0VnY2RTRlpaUlgzTVpJTm9HZ2N5SnBQb0cwYUhJMDdPSjFV?=
 =?utf-8?B?cHlqN1paYW0yWmIwTExoSjBxMHBHM1ZZZFB6TTFNQnk5WWt2ZDc4MEdRa1Bh?=
 =?utf-8?B?bEZuMXhFZ0N6cXNtMWxJeFlwSGtuaGtKUnB2RFFiSU0vNTBhdDh6ZDNDVXF5?=
 =?utf-8?B?akdtSWNkSEZpd09rWktjenBKTUpJSnhDVWZPcnh4SUkzMHBQWXgvcitjWHlR?=
 =?utf-8?B?c2FkYzU2VHAxWlM0dHFhc3lMUDBsL05XekFScnhFWkhOREhiVUt4Q0l1Q21K?=
 =?utf-8?B?ZjRzTFREUTZuQ1lCRXluVjBTOUYyQ0VXZWQyakJiNVBZL3pvbnk2NEpCQmpj?=
 =?utf-8?B?YXpReGNLdzVta1BSQmw5SERjN1ZmbndSQVV4WVJTQlhuZFkxVTc3YVRHN3U5?=
 =?utf-8?B?QWs4N3U3S1kvU25nbysyRFRBOGtiQXFxS0RISEVHOWgzbGdSZGpaaE1SdDB2?=
 =?utf-8?B?TndzcGw5bWEvbnVHeTUzRUtscUF1aUV4VkZCRldsTXJPTDA5UmhsbUMrUWNx?=
 =?utf-8?B?N0ZnMVl1THNXRDVFeUgxRnUwWEord20rRWNYTjQ1Vnd0UnFYQU95cVhTMGlh?=
 =?utf-8?B?d09LODlWRTRMcjJJV1JjV25nNkQvMFN4T3pUaXVRMlFlS2VDNkMyRTJSMU9B?=
 =?utf-8?B?ZWNPT3lRcS9GMWNFRzQ0YVFUYTNJNTh1NytlaHhZMDJELzJucXg0VDVxckNt?=
 =?utf-8?B?dFV5U0RuRkJCVUtJNFVRaGVyVUhWUy9HeHAzcVo3Vk1RK0ZFSURoVEcxM2Vr?=
 =?utf-8?B?dGtobUYyOTR4eVB0WkZQZXd5a1o2TnRabnhyZVBGeEVsRGRmZTJTTnZKNEF6?=
 =?utf-8?B?ai9HeUFFWk1yRGR0N0lsU2RtMDZ3cEorZEN1OGlrWnB2Si9TUHJ0c25jQWFG?=
 =?utf-8?B?clVURUc4MDFWM0k4aFNFbEpyUGd1MWhBZjh5ZXRsTnFpWVIydDU2ZTc5czZI?=
 =?utf-8?B?WU8wZ0dEbnVqTXFGUmFUSi9ETUFkT1o3OU5mbFZEcG5HSm0wVGtQY3NmZW5r?=
 =?utf-8?B?U3VXTnVIZGJETnJmaUsybkYzb21YQTg3REg3bTIwVkNzdktSR2NlbnBZMkVM?=
 =?utf-8?B?TlFyVlhzbUYvN3I3SUJNdmxFZ053cUNMQis4bng0cjdZak9BZERaNFZwR2d1?=
 =?utf-8?Q?3IZAg/B7atlZGPf9rA/pjAz2z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b278b8f7-2b5b-46e5-d5ff-08da9701bea7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 10:04:57.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c52ffJPoYHPEnGlIUWdDCLvjwOKAshFp69NI3udwSq/rIufnxYzlbZbQWL75jhJYwVxiUkUGOK7F7NBx46YaAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7474

[1] specifies a long list of instructions which are intended to exhibit
timing behavior independent of the data they operate on. On certain
hardware this independence is optional, controlled by a bit in a new
MSR. Provide a command line option to control the mode Xen and its
guests are to operate in, with a build time control over the default.
Longer term we may want to allow guests to control this.

Since Arm64 supposedly also has such a control, put command line option
and Kconfig control in common files.

[1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html

Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This may be viewed as a new feature, and hence be too late for 4.17. It
may, however, also be viewed as security relevant, which is why I'd like
to propose to at least consider it.

Slightly RFC, in particular for whether the Kconfig option should
default to Y or N.

I would have wanted to invoke setup_doitm() from cpu_init(), but that
works only on the BSP. On APs cpu_init() runs before ucode loading.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -746,6 +746,14 @@ Specify the size of the console debug tr
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### dit (x86)
+> `= <boolean>`
+
+> Default: `CONFIG_DIT_DEFAULT`
+
+Specify whether Xen and guests should operate in Data Independent Timing
+mode.
+
 ### dma_bits
 > `= <integer>`
 
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -14,6 +14,7 @@ config X86
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
+	select HAS_DIT
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -209,6 +209,24 @@ void ctxt_switch_levelling(const struct
 		alternative_vcall(ctxt_switch_masking, next);
 }
 
+static void setup_doitm(void)
+{
+    uint64_t msr;
+
+    if ( !cpu_has_arch_caps )
+        return;
+
+    rdmsrl(MSR_ARCH_CAPABILITIES, msr);
+    if ( !(msr & ARCH_CAPS_DOITM) )
+        return;
+
+    rdmsrl(MSR_UARCH_MISC_CTRL, msr);
+    msr |= UARCH_CTRL_DOITM;
+    if ( !opt_dit )
+        msr &= ~UARCH_CTRL_DOITM;
+    wrmsrl(MSR_UARCH_MISC_CTRL, msr);
+}
+
 bool_t opt_cpu_info;
 boolean_param("cpuinfo", opt_cpu_info);
 
@@ -581,6 +599,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 		mtrr_bp_init();
 	}
+
+	setup_doitm();
 }
 
 /* leaf 0xb SMT level */
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -37,6 +37,9 @@ config HAS_COMPAT
 config HAS_DEVICE_TREE
 	bool
 
+config HAS_DIT # Data Independent Timing
+	bool
+
 config HAS_EX_TABLE
 	bool
 
@@ -171,6 +174,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
 
 endmenu
 
+config DIT_DEFAULT
+	bool "Data Independent Timing default"
+	depends on HAS_DIT
+	help
+	  Hardware often surfaces instructions the timing of which is dependent
+	  on the data they process.  Some of these instructions may be used in
+	  timing sensitive environments, e.g. cryptography.  When such
+	  instructions exist, hardware may further surface a control allowing
+	  to make the behavior of such instructions independent of the data
+	  they act upon.  Choose the default here when no "dit" command line
+	  option is present.
+
 config HYPFS
 	bool "Hypervisor file system support"
 	default y
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -463,6 +463,11 @@ static int __init cf_check param_init(vo
 __initcall(param_init);
 #endif
 
+#ifdef CONFIG_HAS_DIT
+bool __ro_after_init opt_dit = IS_ENABLED(CONFIG_DIT_DEFAULT);
+boolean_param("dit", opt_dit);
+#endif
+
 # define DO(fn) long do_##fn
 
 #endif
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -184,6 +184,8 @@ extern struct param_hypfs __paramhypfs_s
     string_param(_name, _var); \
     string_runtime_only_param(_name, _var)
 
+extern bool opt_dit;
+
 static inline void no_config_param(const char *cfg, const char *param,
                                    const char *s, const char *e)
 {


