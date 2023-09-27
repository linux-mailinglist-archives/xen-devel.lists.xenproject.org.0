Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61657B0217
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608872.947648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS0M-0008Ud-OX; Wed, 27 Sep 2023 10:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608872.947648; Wed, 27 Sep 2023 10:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS0M-0008RW-KX; Wed, 27 Sep 2023 10:42:54 +0000
Received: by outflank-mailman (input) for mailman id 608872;
 Wed, 27 Sep 2023 10:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlS0L-0008Ha-IC
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:42:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b765daa-5d22-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 12:42:51 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 10:42:22 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 10:42:22 +0000
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
X-Inumbo-ID: 9b765daa-5d22-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGbrm3vrVISwmdRh5PfDZDO6YsaiAhEP3apU2/5y2/rh5h59wxNLzQGUtFttmfr2xnAeyZMBXoHOwQeaooqxdxXNCjaiaRn+5eLT295NL35LsL8cS4ZQmC1qBpCIlM4zil9ZkAkYnaPonUPi8Gpyd+/6ph6CgIrXye/qy7XWcUvMMhCse5I3t1w7JtBB7QI0lgIbq1PLDPjoYzJAlupJVSublBy3Kt+iwKMteRUF7ltngmF4q5n9nlm5PHTxYPORNn2RwZZszFXjDOMOvHbpMXc/uO5uh/IcupGn090e0/00842zYN+rHHaERsqUatp/lfG/dVUzbLeozK4jj3YlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omkVjQfeBv81Qnb7mWu3p+UblKFRDxvjBwxiZYEpSf4=;
 b=IQtXE4qknaAhfI8qj9PMhUHTWuQsiAhV6rjRxFx4YDkRy5q98iuR1sqZ4rGKaEy+Ald1dSr+jKNEalf7REfSMS/jI4rLD7jlKo6yHz0UxPLjRd4DQzPXSjf3Vu0JLztS3jp+teUDgJtY4Ld/+s+DED3VA0V9U+EQq/ngORmiJJcWHPlf2a9Y54PCmQotuYBCbRex2hD1B6QE1dFrf5Hilhh7Nwg9FHaOOj+rFeBcYRojEQKhNI7Vdl6/tmVVzFKBph/3jySyuVrAKGkaA9hciNtqQUcGXI2j1TzYCsiPIf9UaFuN1fFxNIPWhBi+a9hXzdkHk1PUm+rcWM/6OIsdAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omkVjQfeBv81Qnb7mWu3p+UblKFRDxvjBwxiZYEpSf4=;
 b=E+odiOI2uhLpoz2VSR2AnsRx58t0EbIOMOT9D8nRKDcW+a1FD5kN1hOqPiaHz95O5q7rnnYIl3Vv65GdPbdWBHfbPqGasw3xpd8iD8PFI8/mSGsgLuFWA6iNfBezqizmQ8/QjYeQtvqkXKO4wG0ves7XTuy7MVwUbQ8QP+pH+Ca6z8rwksOS2jb6kBvHhNHV4EI0FKA3wCw/Xl6dHkOU8mOSTxh+zsUzRoK605kio0IL69RSCVGSAkjZgyNUxXeR3gPkh0TT7EQyUY2flgMoc3tnsGyosj8f0zJacLGjRYFBdWgn+oK0xYfOpaLUOArWp5z6T7I8ModzgZUO+jQbdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0846e69c-22ec-0cc2-de5b-b895ff20e860@suse.com>
Date: Wed, 27 Sep 2023 12:42:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 for-4.18?] x86: support data operand independent timing
 mode
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0ade53-2782-48b9-120c-08dbbf466e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZovxUWyveolH0v91Pku/tag2f0p341T1jna6bSgkdsklh6rzAdQmCDy5cJty7m1Vz/ZhNNv5doKj+7JDmVS2C4GtlhxY7m79iJpm+ZQDrHXHyiHuAyF93ea56DA0ucHrwjNDT5Y8ZblDlEk3/K7Pxz9gymtkkXJAEKovjELtywH3bi5L2HvoNJxcCUjBT4mLgWu6hdi5FqPj7JG0eO/m+9l0iYnIKxVUqGDOPiH4RDpcd+x7WHoPyMdF7bYk5qNlVl79e+Ys043r0G9f4laLyn9Xq9DJPKODVVaMYZEusZv6uHw1dZBnXvKJB7DQQKhrLxRfm2gExKc5EnE5cngxHDhoEZtozldUzsOYHm+FD0qnQqPp0TTbBkkSVyjcuxPxe4svby6rnM0ysQkbzsbJHJJUlknjqG+W+E4fN6GwPCiSsaFtYVOnbArs23+HSJwTGE/U15mFKqaUaMDblbBVmkMdPF6buHsKRxm6nf0wmjulggf81gtLMlmq0rPo4TAVlvrDB7UgMoz4XiF7jghgAKtzkL/plolCcGRo5k7E9A2QuU83snxos9SsHvVf7Va5KG6yzav8U4jFCN9Q3PhZIGMfBPY/BMGJFYXPuL9cDEXkl/PmoHMMqXJNOphudYB7RYQzEShW2KY6GjW0QJvIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(316002)(83380400001)(2616005)(26005)(54906003)(66946007)(6916009)(66476007)(66556008)(41300700001)(8936002)(8676002)(4326008)(6486002)(6506007)(6512007)(478600001)(966005)(2906002)(31696002)(36756003)(86362001)(38100700002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JRaTRxN3dHeVo3VzJXMU51dUg4U0JRMUE5VG1iVWNudmlTcmlDQXYvYVFq?=
 =?utf-8?B?SUQ2N3ZzTWYyUDhCbmJGTWhCMC9GSUpsWkZmMEVYSWxoVHVROHJzVmw4eENO?=
 =?utf-8?B?alBKcWo1b2NVbVlFUVJiOXU3M3Blcm5EL0FEY1NjeSt1ajkrQ2pBRjBaUVhQ?=
 =?utf-8?B?UW9qVlFqZG11aWNEN2owcnVTa0dkM2Y0dzUxeGJ3QkVaUVJjcUVJR0M0Z2VR?=
 =?utf-8?B?RlhISit5OGNpR0JicWhXOG1kSWpTUGVYcG81Z1YvSU9LRC9TRURtNEhvc08x?=
 =?utf-8?B?WThyTDBYUEptV2tVRnZYclVUZHpQbHZVV01GTXF2dDhOdEF3UUhBTlkwMGRD?=
 =?utf-8?B?RUVNeVZpSDFQTFV3MFlOdnZnN1Y4YkRpRU1SOHNiWE92OWQzYUh6VWczVG1S?=
 =?utf-8?B?blhocm1lTkM2Um43ZFJtNzYyK1JPOGpiWHVDWGJxVUcwWjcyblZzQUh6cEgz?=
 =?utf-8?B?aE92Wk9xOFdMWG9XMFJxN0ExOXZXV3BhZGEzcENhVDhJVHpzZXMzV0pWbGxQ?=
 =?utf-8?B?TFMrdGtYK1hKUnR2QnZDZFhpaXA5SVJYd3lsRFd1aFA1VXl2RE5UMmwzcU5S?=
 =?utf-8?B?Y0g4bnlDNnNzK2xWa2dYejZzSytHTjNBMWhiZnJYRjZkeldxaUYyeFRhdDR0?=
 =?utf-8?B?UUg1cmpMQnp5QTAzSCt4SlpLMFpEYyt6TThRQ0hRczkwM2tIbGNoMWIza0tl?=
 =?utf-8?B?RDRPOWJkMStEVXJYS0VVSEdnRGRmajNFQmFFRisrclNkTkc0QXRaeHJ3ZWVC?=
 =?utf-8?B?aUl6RUhrQzZ3d0JVNmp0ZnVFeThRN3U3MkQ5R0NsRGlDZDhQVXA5a3QvSEc1?=
 =?utf-8?B?dTNHY0lnV0t4RGhXQUlCajZVbktQODJuQmp1QXd2Qi80TTJOMTduOWJ6TGto?=
 =?utf-8?B?Z2pCYVI1TVliYVBEUDdiZEJpQVdoa3diQnRRcWl2ZU42ME1kcmh3b0kvMGs2?=
 =?utf-8?B?OEFra2JYd3VDT3U5L2x4QUMrU2srS085KzV3NnU2NXlQcDVYUDdTTzdST3RP?=
 =?utf-8?B?TWFhM1A3THlLTldvOEtsR3FXSlFCY2M2NDZoRGIrdGx4dzRQUHdCYzlCR0pR?=
 =?utf-8?B?RzhZUk9QdFBKRjZsV0RVMlkyL3FwQ1FPNHFUN1NOMGs0aWVCUFFFRFIrcWlS?=
 =?utf-8?B?OCtDcTY0bHE0M0hMS3dQLzRoTERwOEJiYWZvY1pQUy8xRTF0akNsclNmMUpq?=
 =?utf-8?B?a0RsSEVOTURQa0F3VlpKM2cyQmFDbVV0a2NQWFFOZm5DMkhTdVVzWXFMdG01?=
 =?utf-8?B?dlh1cy9FNXorQVFCMzh0MUZpWXh2SzgwVTlFMFhySk5rRjF0UENNOVlZeW1j?=
 =?utf-8?B?VVdTSHZqZTZjRmU3UGl3cVV1WU5DQlBuUVErVzBNZ0dTV1N2S3htcDVYVjRH?=
 =?utf-8?B?S3pZTVN0M1JJVlc2SWhuSmFERzRGQkxVQUE0ZytGdTFka2pyS0pOTkowVDE5?=
 =?utf-8?B?RzlSZXZRNThwWFEzcjBiYTVGWERKVkx2QXkyVk5qR0Q0Vm85cGVoRW1neHhw?=
 =?utf-8?B?azhXWFVmUUVVamQ5NzkwalVWWEVlQURRbkJOTm9KOUtCQ1JNZG1VenFFTmxI?=
 =?utf-8?B?VkJ4OU9URDN3OVI2dElQT2QxSTFGYVJVdXl5MXAwbkhSenQ5QkdERDJCZEJ1?=
 =?utf-8?B?d2QvMndwNGlJM0owRUJsTkxUV2lYc28zVFF4Uy93Tyt5dlIxNFZuNFlhL1ZC?=
 =?utf-8?B?azlxNkw3L2xUa2pZeHFuRytKNlI3Z1JFOG5oencxNVJKc0tYTkI5YjQ0Wnov?=
 =?utf-8?B?U0ZadmhiT3JKeGdROUR4TG5GandLTWlMWkRWLytPUlF4NlE5R0owd3A0ZEZX?=
 =?utf-8?B?ZnplSmd2ei9NdzIzbXh3OHdCUEJOeExuU0ZxYXFVYUdXYVZ0NUIrZjFSMVlN?=
 =?utf-8?B?dGovNVNLekVWMFFONEJWUUFXNTVWQmZqRGw4aDJZeEhnRzB5OXdhMnpXT1Bk?=
 =?utf-8?B?R3g4S2VBbEdrRTFxU1RCRHNycmNoTU1BcE1DdkIvTVd2WGdkTktrcDhySnQ2?=
 =?utf-8?B?dndRaWVrU1dsK1Z6TmNhcXo5akZtR3o1QmFZSFBpOGlqTUptdm9kbE15RTVh?=
 =?utf-8?B?NTFLR0pvRjFscGIwNnhGdXZvcjBDa1dNUDFRc3Jkc2NqSi9uQ1VMWExpRDBq?=
 =?utf-8?Q?W4diBngxGxlRZZLBvDxMYl/Na?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0ade53-2782-48b9-120c-08dbbf466e3c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:42:22.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhA7vOFcv8UP2hl56UY60U5oWGR7E1LsWxsSOe/lSJ+ZLmwtTgbbrI/1EaNFVPon3x7hqdu/XW1BJZoDxsW1hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

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
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
This may be viewed as a new feature, and hence be too late for 4.18. It
may, however, also be viewed as security relevant, which is why I'd like
to propose to at least consider it.

Slightly RFC, in particular for whether the Kconfig option should
default to Y or N.

I would have wanted to invoke setup_doitm() from cpu_init(), but that
works only on the BSP. On APs cpu_init() runs before ucode loading.
Plus recheck_cpu_features() invoking identify_cpu() takes care of the
BSP during S3 resume.
---
v3: Extend command line doc. Add changelog entry.
v2: Introduce and use cpu_has_doitm. Add comment "borrowed" from the
    XenServer patch queue patch providing similar functionality.
    Re-base.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog
  - Add Intel Hardware P-States (HWP) cpufreq driver.
  - On Arm, experimental support for dynamic addition/removal of Xen device tree
    nodes using a device tree overlay binary (.dtbo).
+ - On x86, support for enforcing system-wide operation in Data Operand
+   Independent Timing Mode.
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -788,6 +788,16 @@ Specify the size of the console debug tr
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### dit (x86/Intel)
+> `= <boolean>`
+
+> Default: `CONFIG_DIT_DEFAULT`
+
+Specify whether Xen and guests should operate in Data Independent Timing
+mode. Note that enabling this option cannot guarantee anything beyond what
+underlying hardware guarantees (with, where available and known to Xen,
+respective tweaks applied).
+
 ### dma_bits
 > `= <integer>`
 
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -15,6 +15,7 @@ config X86
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
+	select HAS_DIT
 	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
 		alternative_vcall(ctxt_switch_masking, next);
 }
 
+static void setup_doitm(void)
+{
+    uint64_t msr;
+
+    if ( !cpu_has_doitm )
+        return;
+
+    /*
+     * We don't currently enumerate DOITM to guests.  As a conseqeuence, guest
+     * kernels will believe they're safe even when they are not.
+     *
+     * For now, set it unilaterally.  This prevents otherwise-correct crypto
+     * code from becoming vulnerable to timing sidechannels.
+     */
+
+    rdmsrl(MSR_UARCH_MISC_CTRL, msr);
+    msr |= UARCH_CTRL_DOITM;
+    if ( !opt_dit )
+        msr &= ~UARCH_CTRL_DOITM;
+    wrmsrl(MSR_UARCH_MISC_CTRL, msr);
+}
+
 bool opt_cpu_info;
 boolean_param("cpuinfo", opt_cpu_info);
 
@@ -589,6 +611,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 		mtrr_bp_init();
 	}
+
+	setup_doitm();
 }
 
 /* leaf 0xb SMT level */
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -201,6 +201,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_doitm           boot_cpu_has(X86_FEATURE_DOITM)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 #define cpu_has_gds_ctrl        boot_cpu_has(X86_FEATURE_GDS_CTRL)
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -41,6 +41,9 @@ config HAS_COMPAT
 config HAS_DEVICE_TREE
 	bool
 
+config HAS_DIT # Data Independent Timing
+	bool
+
 config HAS_EX_TABLE
 	bool
 
@@ -175,6 +178,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
 
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
+	  they act upon.  Choose the default here for when no "dit" command line
+	  option is present.
+
 config HYPFS
 	bool "Hypervisor file system support"
 	default y
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -28,6 +28,11 @@ CHECK_feature_info;
 
 enum system_state system_state = SYS_STATE_early_boot;
 
+#ifdef CONFIG_HAS_DIT
+bool __ro_after_init opt_dit = IS_ENABLED(CONFIG_DIT_DEFAULT);
+boolean_param("dit", opt_dit);
+#endif
+
 static xen_commandline_t saved_cmdline;
 static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
 
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

