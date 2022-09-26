Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838A5E9E78
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 11:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411601.654570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ockss-0001uS-9O; Mon, 26 Sep 2022 09:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411601.654570; Mon, 26 Sep 2022 09:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ockss-0001rG-69; Mon, 26 Sep 2022 09:58:42 +0000
Received: by outflank-mailman (input) for mailman id 411601;
 Mon, 26 Sep 2022 09:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocksp-0001r7-Ss
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 09:58:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cad988c3-3d81-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 11:58:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 09:58:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 09:58:36 +0000
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
X-Inumbo-ID: cad988c3-3d81-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAhhpU49CiiEA/hpGbGYkjPjuYIWVKo67mcNGy8azsGBlEWvpG7WEqLbeS6oD9xXQmUSVgNEJwJAfg1oIiuKOFJnZfeWlQXds//GsUHqIDOyMGdeJ0600kGLut9oPV8sN7Enw+ts/ExaIW79JFd6l4CDToCHypAasDC8ekt1yyJmxFv+kT8tMRGCg7wWqLzDb7HgAjsv8tvm1FAW9aHbndxTScmUTuFPq1o5exKFyp2BORvdaPq0/foWWV9iOuFlAO6F47MKuAbwmZ+zaIGi+il0dGU9xdQEeDM9gVxscDQUO1XE0mzPGsNR9FbhQ1wjWRmRyzRr7sIPGM7L7vHISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG1kP516La+OAzARTQ5ACya5NLlvwv/VYaKgNln1Ry0=;
 b=Jpf7fVMYQlQ2EFTTFGTnGzoKSqwM5QueEKNgB/OI7bP9gyhhrjL5gLx5tbtmzxIMTyySJYhCw7uLJ9Mui3qb1YA+P/QXYzdeDOsmR1SxLqvyhD68CJ21brtFXABzRfk13whSOazoAMJsTw2d/bzuZTAWwtCsW7ki+qb5WmV5m9FwhYwYySegmcNxsjnCGUbXPnxSn6dvhijLbfeanEpNGpUUu46hG+7KkurwcN2QGCLXkGMWwBdNAxKi3uK9EqJP1YqJARA+x0Yg7N0RcH8ONZHNKW6yqXwTOK1FLnRvB7B3pXLxefQRuJxDF/LGBr1PKjbE4dkTMR0IS+6Y8J1CCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG1kP516La+OAzARTQ5ACya5NLlvwv/VYaKgNln1Ry0=;
 b=kC7yu82RR0d8j/5Erq80CHqxR9Q/NtYY2D+CT9VSzQqLkXImwv0h9cTb3d9fvQdqmywVROD3EZR+jzRtN9ymuD3maEd+DiF3dK9KpzpuQuXHyH90M/vdCRhGBAakMLJy/9c4Sgob93FbmqM+GwaAdshGI4zC9BC+mbbGuwR9n+7qUo5vz0XL97mf0T3eHiqdq+W+KyMMhaMn5xQqR97HyrzXPGqtBG5/Gsbjbx0NS6q1Dinx/auJ4UgnZXBDTNpUaekUk735yB34LsHPT4COj7RIxAM8SHNDb+AWgla2LbeDxq9vEjJUtRY/p4uoBNWOtbE5U9U8DYadtvXRtiQ1eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59767cf0-8b1b-4418-db31-6b711518c044@suse.com>
Date: Mon, 26 Sep 2022 11:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PVH: restore VMX APIC assist for Dom0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jane Malalane <jane.malalane@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c4ff8d-0948-484a-f8b0-08da9fa5ade0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EkyetDn9/OzktpsBAzxxBzsZcUyVzrtuisCfUzPBnhvDcJfNb3zz/z3tpQnSAI+x1yts+0oO4wzRlSLmKvxsgxwWE8OU4AkXrZ2VPdx3U+8HlQxv7cWHX40IkqDUB/OWRRclMHy+8jTns3Ud/Y2QDddcDi3w8mUg0wKxntiRXdArT8Um4yDnj/QpzC4Efd20dazzlcf0LYz7bHoD7kktC9DGRqLSenNswDKprWI4BdS6PgzzY6KkAADEbXUlFzaM1krbBsy3NnOQCBX+KCKfFEvQsnqqqNELOrJqQzHOGUDgSAVxN3qUmzSYDj0FYxMg0bZmkxh/55Y+IZ/htLVbvB6TrvBWcKg9Fnlz/1bIHe+wb2FamtSYcgo9/p25LhuLaQFH50PITma6wiR0q/fJ/8WycgEv7PRN+8joN8rbAItuEu625Dj2zj9iVUehnjOS1y3Y/0QMMrDUo+wz7DYm8c6r7OvoyXYkco5fBb++yeNThqLb7iAKloFqnt+E0+kQ6TLEoSqPHfKnavWlJuqLFe+r6ith8L7PbaplZvsG5tvsZRqtGQ5GR9xOAnl9oKp0kqfNoXZi3aERqZ+dWpi161mhp9uBVAIg8Zu4aLAgVwG1mPx2DEKF6uzgvqfuIPXA/mjVKMqRpdYSHqA+cqfLh2B8keEKi7kelM3wPuZU4EtQS3pkK81oeXUCDrhNDZid1bHczHNFTrZd+gYL/zpZtjvSMOAA0MClsLqlcevKercCQe3teJ3vK02ywjP/aWkJdDcOvbmCfHqphPXe79WEKonM11T7BuPGe4BYGm8j8z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(478600001)(6506007)(6486002)(41300700001)(83380400001)(2616005)(186003)(26005)(5660300002)(2906002)(6512007)(6916009)(54906003)(66476007)(8936002)(66946007)(66556008)(4326008)(8676002)(316002)(66899012)(38100700002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnNDUmFJS3RWN0k2RTlURjNEMTBBOTBHVStGdngxRGg0eDNMb1F0UHZVY3Nj?=
 =?utf-8?B?a2ExV1psb2JBNHk1eUozWTBick90ZThUMG5LZEM5bnBKY1E0K0laUTNWZ0ZG?=
 =?utf-8?B?bEZyVC91b0hsa2RqMGVYOWRnYU1tMFhydEMrNnIvc0tlbnFJL2tBTmVrOGVW?=
 =?utf-8?B?V1p6TFhjYUIrendwRkpCN2NKVnBXc3AwbVpsWUVSdjl3ZUQ0RFlPRTFFSGg1?=
 =?utf-8?B?b20rQi9NWTA2ZUNsek44dC96SjhBWmYzV0t6UnR1TXNRcnVDeGRzcFVIL0pJ?=
 =?utf-8?B?clFKYUJSMEVVZFF6U0tWRngwTVphcXZVMkxMODA5WmtOYWNYUFFHQkZ4Mk1R?=
 =?utf-8?B?UTFOcXJLN1hVVTdpQUZ5VTcvL0RtN2Y5aGcvd3BuWlFQSnM5V2JkZCtnSG81?=
 =?utf-8?B?dEFzQWlVbkdTL0IrSGUvT0Z1cVVSbGF0LzEyUlFxakVRYUlTTEU3NW9YN2dr?=
 =?utf-8?B?bTBUOTB3bi8zU3FDVCs3MXhkUitzTHFkWnNkRFJvTHU4TWdqY2d4QjFhRHR5?=
 =?utf-8?B?dHBCdEFNeDl1NTBwcktpb202ZFQ5ZWloZDUyb0hidWx4VTJhS280Y2ZBK3Qr?=
 =?utf-8?B?dlVielNDSms4dU5Pd1VWUjlidUR6cjB3MGZja0ZUcUJ3QUFUMW9IVzdhM3NW?=
 =?utf-8?B?aTZrYTA5RTNkTnNGeTRTL1IxeERWeWpXeWx2Wm1VT1ZYTkR1azNKanIrMkpG?=
 =?utf-8?B?c09tTG5pYWdDV0JqSnpzcmNMeW4rZXlUcksveGJmbVZ6ZWt0L05BaTRNTG05?=
 =?utf-8?B?OGpYaDlPV3Y2bFBRcS9IZHpYR0xWbmJXNnFHdmVNaFVtU1ZPTHNJWHhXMlIx?=
 =?utf-8?B?SitCVDY2WUFmTHMyNGRVN1R2T2VZWVhHeG5nSTlXUUVVMmxXWHg5K1QyVDFw?=
 =?utf-8?B?UjdTYUplc3hOZWZ0UnhXVmxlMkduTHRocTIzbDJoNHM5elpNVGRYSDd1ZVZC?=
 =?utf-8?B?ektHNnBnRXN4S2hQb3h0dlpVaTFoMUpyZ052UHRUQ1dLTUt2b0g5MWpKQTR3?=
 =?utf-8?B?SUFYQkp0c0trVmNETHVTeHlXRytVN2g1QU51WlNRL2FpYmVzeVE1dHJ6R1o4?=
 =?utf-8?B?djRTWDhsVGJmaWcxSDVsZDFoQWY2N3hLSmpMVjdiNHB0TFg4R281R09scGI3?=
 =?utf-8?B?eUlQTlZJYVYydXE2eTgrc3UxWW1FRHJST3RiWGxiYU9Md2FaUFVtaUdUVFhl?=
 =?utf-8?B?eTEvSlhNcTV3ZFB0emtSbjBhbm9iWHI3UXU1azR5eDBIbjdIQ2IrZ2dLc0VF?=
 =?utf-8?B?anNLVWtFYVdXbE0wMTZKUjVLSVlTcTdXQjBKOWdzUXhnMFhOYVFhUFdQeVdi?=
 =?utf-8?B?TzdQMlovOE9objd0UXZVak83c0JDMnpGT010QWpCa1B4UTF0dTFWNmpHTHpz?=
 =?utf-8?B?eWNJdnU0cUpjbkJreFVOYTRORWZhRUpEd3JEeC9VZVQrU1hyd081eEFWTzNM?=
 =?utf-8?B?dkRuN24wNGFHOTJlc0MyT2EvWG5Rck1KRnMreFY2MTFhSGZBbjB5SnZqRndm?=
 =?utf-8?B?b0JwR0dUZzR1U2hoWndzczA1L05hT3FiZStualg5bTNVTWhWYTRMUzNNTlRR?=
 =?utf-8?B?aFhlZzlSYlRWMHJnNTBXNG90blE1WndJTklVNFBEVmFZTktHMXh2RXpyQ3JD?=
 =?utf-8?B?OEZ6N1VwWmUrQlo1U0Z6TC80cVJrVmlleGJUUVFCN3RjSkdVZHloTzF0MWZm?=
 =?utf-8?B?N0E5cHBHN2U5a09GVkV3NjZHZVdZd2tVR1UrSEVDV2RyUzIvOEQyVHhHSTFN?=
 =?utf-8?B?c3ZpTDlobjhxaGJHZUFLYUpBSzBPV1hEMDkvL29JYnJ0MkMrdklMei90NG9U?=
 =?utf-8?B?NGwxcnd2R0cyS2w2dHJ3YUliZjNsZlc3Z0UvSW5vVUZwUk9GcFhxY2xvN280?=
 =?utf-8?B?VUxqbUhmaUVoOHhROVJWNDVIWSsrbFJxUTkrL09RbFh4aTRQczBDaFZvbnFk?=
 =?utf-8?B?clBTT2JDa0dSVDd5YXVDdWdtanhCZFJiV2VrQytSclFFNHltYWNoT01hTjZl?=
 =?utf-8?B?R25PajhJNU40K3RvcEFTK3YrWG1zWllPdEtpVXFqZWt1VXhuMDBMOWNURG9m?=
 =?utf-8?B?VzZkQk1aVGFSdCtucWkvTnIrSXNJUzNmS0lPYm5VcDg2cENYTGg2aWtKYUFU?=
 =?utf-8?Q?V/WgUSx1jT1sWofjQt+B7UBUO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c4ff8d-0948-484a-f8b0-08da9fa5ade0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 09:58:36.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryBjusqwl14WXCDigurlHChDcNbMWagNWB1JYoruxAc+FfVqw0vRltqK/YKTqR1lXlu/X+cHQeMISzbK4KB/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326

I don't expect it was intended to default PVH Dom0 to "no assist" mode.
Introduce command line (sub-)options allowing to suppress enabling of
the assists, paralleling the guest config settings for DomU, but restore
the defaulting to "enabled".

Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Guard the setting of XEN_X86_ASSISTED_X{,2}APIC by assists actually
    being available.
---
Besides the issue caused here (the manifestation of which appears to
correlate with the other fallout Andrew is trying to deal with) I'm
observing further warnings, but I guess these have been there for some
time (perhaps forever): When parsing AML and encountering the objects
describing the CPUs, Linux would find entries with the original APIC
IDs. If those don't match the ones we assign in pvh_setup_acpi_madt(),
the kernel will wrongly consider the entries to describe further CPUs,
which it therefore would deem hot-pluggable. This again results in
warnings, this time "NR_CPUS/possible_cpus limit of ... reached".

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -767,7 +767,8 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool>,
+                assisted-xapic=<bool>, assisted-x2apic=<bool> ]
 
     Applicability: x86
 
@@ -828,6 +829,10 @@ Controls for how dom0 is constructed on
 
     If using this option is necessary to fix an issue, please report a bug.
 
+*   The `assisted-xapic` and `assisted-x2apic` options, defaulting to true,
+    allow disabling of the respective hardware assists.  These are applicable
+    to PVH Dom0 only, and their effect is limited to VT-x.
+
 ### dom0-cpuid
     = List of comma separated booleans
 
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -293,6 +293,12 @@ static int __init cf_check parse_dom0_pa
             opt_dom0_cpuid_faulting = val;
         else if ( (val = parse_boolean("msr-relaxed", s, ss)) >= 0 )
             opt_dom0_msr_relaxed = val;
+#ifdef CONFIG_HVM
+        else if ( (val = parse_boolean("assisted-xapic", s, ss)) >= 0 )
+            opt_dom0_assisted_xapic = val;
+        else if ( (val = parse_boolean("assisted-x2apic", s, ss)) >= 0 )
+            opt_dom0_assisted_x2apic = val;
+#endif
         else
             rc = -EINVAL;
 
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -55,6 +55,9 @@
  */
 #define HVM_VM86_TSS_SIZE 265
 
+bool __initdata opt_dom0_assisted_xapic = true;
+bool __initdata opt_dom0_assisted_x2apic = true;
+
 static unsigned int __initdata acpi_intr_overrides;
 static struct acpi_madt_interrupt_override __initdata *intsrcovr;
 
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -68,6 +68,14 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
+#ifdef CONFIG_HVM
+extern bool opt_dom0_assisted_xapic;
+extern bool opt_dom0_assisted_x2apic;
+#else
+#define opt_dom0_assisted_xapic false
+#define opt_dom0_assisted_x2apic false
+#endif
+
 #define max_init_domid (0)
 
 #endif
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -784,6 +784,11 @@ static struct domain *__init create_dom0
 
         dom0_cfg.arch.emulation_flags |=
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+
+        if ( assisted_xapic_available && opt_dom0_assisted_xapic )
+            dom0_cfg.arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
+        if ( assisted_x2apic_available && opt_dom0_assisted_x2apic )
+            dom0_cfg.arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
     }
 
     if ( iommu_enabled )

