Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FE6A5923
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 13:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503321.775551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzC5-0003ay-Jg; Tue, 28 Feb 2023 12:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503321.775551; Tue, 28 Feb 2023 12:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzC5-0003YU-Gp; Tue, 28 Feb 2023 12:34:57 +0000
Received: by outflank-mailman (input) for mailman id 503321;
 Tue, 28 Feb 2023 12:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWzC4-0003YO-2B
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 12:34:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ca5a30e-b764-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 13:34:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:34:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 12:34:51 +0000
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
X-Inumbo-ID: 4ca5a30e-b764-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZi6ftKGaHcnNH4jgXTwSKejPQX60Mm/upBFHHeOtwyR8T/C9efABzahkTYT2OMlQECa2+5u1cJkz5Q0orpYqwfsyy7P8vBTWfTbFBGpHoEiXDASUIZ7buZwHHqgI+fzl6SyAToGUYk/qP7LRaxRCCIeQ1v9arWRP2EKN4FcsR1rpLlU3M2ygn7tjo6XNTFxU6pyIIAKwHzD/JcoBUE3mNTa2T9PZ/g0b1pt/v0iD0Y4IYWs/Eaq9y7YCIAXTlSA4kK314MrqCnuJnvxRv5956PIMVl6H0LT/FxojjLRramniZwoGtWJQ8A0YsX3SkAPPryomwpTm4tC4tS5ZeQtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHoImyOEH3Jag1SAWKnN+mf8f1/U72ET2yhEoZDlipk=;
 b=EZDhDWs45MwtDSG8qRve4D6gsPp11PpZkJIA1YUFOqWP9NzWDzRs0AxxLGXE2H9O+A1/cVDuH/sIwr8UOQnpwHXMxv6AvHt+JBY/mSfyFuhjtiKFnq142PU8zWZiA8zniFRoGXvedL76qmJu8WxAcYzPSIAuGhVLXsty+Caz6ASL5FDhp8qiRfjJQ65IUDBG3E7NAuEWF6z29PgZEWYwovp5psjv+7ljWs49+5xeVV4CkshlXaufSnJcqeyO1abOlZKU9T3vGGFWf43ysZYGTh6XFAtk8Bu5isio4KxXZOXpabvZCGg4HSsPktGuaA8OEfMmjAKGSPkvpjZ3cxYRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHoImyOEH3Jag1SAWKnN+mf8f1/U72ET2yhEoZDlipk=;
 b=1MrRi78+nv9g+dpxv1KVPoBB0vl2jWoux7qmPEkd3q81/ZjV1PtiNmCtc7Iw3/gvitigboL2vtIkh3rimqnybF8Hr0Y5m5cLy5+SOUuM2TJ8REYV387O5I6AGpAkdapauVCCslOOQB4EzyENxTXoaxE/QvYLOFQU9kWJQBmkN/h7l35zJnru97MecKepRyy+I+7m1CRquimV54tatqZo2kiK/SSYY0g1vwDVSGqjeqhoCW1jZAe2d+jyRyG7IlLBGy7C0V6zixyQpoB6y/ucrsEDtup3C1K/8nCOHVROzOQDKVwk4e9F3m42AJ2VTz7M9YUxoPPQYzl6dcg/t5pKrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a2ee9fa-df29-6665-771a-970c00c58838@suse.com>
Date: Tue, 28 Feb 2023 13:34:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] core-parking: fix build with gcc12 and NR_CPUS=1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fb8b88-0d86-46a8-ec3b-08db19882fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PtFSZY39xHPl280gScyWgi65WwkHMXH42dtHnqBCu2OYBZ3P4oDzCH3HYjATXXCwRK+/T46a+DiZKGTbQfzEVYFrsowxkW9HLJUnUi1JWgTylDfY8847zOiIazK0PXma1Vvit+AvITq/uM3DeGevFA0O+xNLQ1czIZ5DwgCEjDTy28HJfxsTUtnNfDTxSaOi8AwpJxwTQO9cY7zl6UBQbdVt14x4qAkckMkOMzy07Edn5notig0zqfw/paZhLGK6DH03Ua+qH7AVZmbvagwEuhFd8zc42Kj419eawKH84/073b9L9EBAu6UhFz1Gpz2NumVQwuWGsxybIHpriDF3HLAZxUDmKRSE7HMiG33CsOQWZO7NNXTO/st9WB2e+3+yV/OD6b6sfjGi/nYJ86p34SFBx+SKrHKlfWEy7ch+H6V7FXlx3YZGAPhbPtYLNRJtLVBtUvtRIK3m1xHeJCQZG4EyEaftJV6j8vurjJjUJYYuXy1vhsmSf2tcxqVuMMbeiBPPSfMQXA5WUN8eIq/fUniEeDp4c8mDfaEfZ+pIwv82Z3LbJUUpLDpN2NNku3Zb8i+D7JQLDUebyH9rejg2m7FFRw3+yGnCnIST5v6u1agI4wC7y23V8BLIjQ4tm13t0/oJFmnlsFZUFA1Nw3BliKujFHSp07vNbNwaGHb0bYQQ6pvJEjlOQeDJZqIzzNpOPv/dAgebVoQ0hIDijEWM+TBLbXFZJ82D+eUuk/KC2Xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199018)(31686004)(83380400001)(316002)(54906003)(36756003)(4326008)(6916009)(38100700002)(8676002)(6512007)(2616005)(478600001)(6506007)(6486002)(186003)(31696002)(66556008)(66946007)(66476007)(5660300002)(86362001)(2906002)(26005)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjJEbE9VM2QyQkt3aDIzcS9aRldNaEhoVjJIOExNL2ZWSWhpcFlKMVoyem1Z?=
 =?utf-8?B?ZlNzVkg5R2E3T2lVeXBvWUFaamZlQXhsSjRTSkkwS3R4UHJuZUVySFlIcVY2?=
 =?utf-8?B?a1hYbUFyVkwrWHd6SHY4bzlLeTNjd0xuOTVSbFNFREFIK1gvZ2lDak9xWE0v?=
 =?utf-8?B?RTd4ZC9TZzRCYXpGVlVqb1RqUmNackUyWDlKZjBzV1FmS0czNWJSSFlqSnRu?=
 =?utf-8?B?Yy9BTzdjME9rNnNOMFYrTiswajdSZHNQNlZPL3RORG9uYUhUUzBlbXFtcUFH?=
 =?utf-8?B?a1V0TVBXc2dEU01uUjBQd0xRVTVmSU9yc2VJczczMUpNa2gzZ3JJSk5kY3p5?=
 =?utf-8?B?TGExKzN6SUJlU3gxM1VhbnptMXExRzhYR2pSbHVOTFlQbmwydTZacGROWEpu?=
 =?utf-8?B?ZnEvcjhCRmlXNTI0cXZZV2llWDh2OE82cjVTcFJ2dzRjbUJZL1ViS1hjOUd1?=
 =?utf-8?B?dXcyTndaNEFvWHF4NTlneU5wMmZVKzhmK3k1MmtoWllrV3F6ODNzem13dXFL?=
 =?utf-8?B?RTVRd1Via2JmSGc3NWpxaWlxaVliUVQxSEtKQWpXYm9aK0hFOHVLdjhTM0pW?=
 =?utf-8?B?dnVHZzFHMTFkRnBKN1Q5d2F6NGVEN0IrL3B1YmdJUjJPL0FOcnRDSjBRcEtM?=
 =?utf-8?B?MVVEb1NYU1IvNDY4TDNTZ1k0eTdDZ3NBeHBYWUl5dkkvU0xCQW14ZWQxbS9V?=
 =?utf-8?B?RXNXUUorNURZbCtMYTljRU8zSnppZytSTEE1TVZsTDd3WVF2LzV4MmNkUzhC?=
 =?utf-8?B?L213SWI2VWx2YTVZUTFnVUxqaURzR1ExaUhRZVJFQVlBSWdZL00rc1dNVTkx?=
 =?utf-8?B?RlF2eHAyWkFZditzTDhybTQvbTZFVEwzL2RWWjRqbHRmTGFzR2pWdXArajF2?=
 =?utf-8?B?VXJ2SHZDcTZtSE9HN3MzZy9OMWtQWUtOb0J0OGNFTEtUUk54UjU2VkdwMFFL?=
 =?utf-8?B?QzkwaXRZYmN0S2U1WnNkOFh0bUxzZmdNbjZ0V0ZFZGlGQklCMU5pL1hITEVH?=
 =?utf-8?B?bms1Qzh3dTR5OHJObTFHeGtzSW5uVGFMVnR1TDMvci9BaTAvL1I1QjBHSmJw?=
 =?utf-8?B?V1IrWXA3aUNGQm42UzNtaERIS3l6anRZUnZpMHIvZWcxSGNrSHdrWXVlaXY5?=
 =?utf-8?B?QlRmcXlwRU8waG1VUWVDd29lWXJpZFJ6THlFZEJtWVhreWV6SG5IdTRyRjh6?=
 =?utf-8?B?SHJ2Smo4R3FVTFdZWVIyYjZzMWVaQkVZYXhESGttNWVhMGdFNHlyMjlwajlK?=
 =?utf-8?B?Yi9FdXZWNERkYThhcmtsdlpHNDU2emwybjZBdFEyTC83ZGxua0pVU2RmR1RS?=
 =?utf-8?B?cDFZU3dVNnZ1dG1ESGlTM0Z5L2ZUS0lTSjhOUzhCMkdsRkJUOVZPNTFFSVhV?=
 =?utf-8?B?Q1RCa0ZYOXdta2xtZGVQUnZJUEF1MEJIWmtGeFRMTDhLQmhpNEFRdkNZTUJs?=
 =?utf-8?B?UlhXTGVZbkJMYS9sZzVBc0VQSVhPUmttY1lvYTVtT2VuNUJGUjYwS0hmaUY5?=
 =?utf-8?B?ZFI2Q2RaeEJSNkprNmp4cDd5Wm5Kc1p3cERvdzRLbzBLdTQ5K2w3RzBqUmFi?=
 =?utf-8?B?andZRmpyZ3ZQQmdkSmErb2dtK2x4TnBhUkc4WEJOdVpNOWNwTytMWW5UV3VI?=
 =?utf-8?B?cXZWY3pqMU0wU1Qvb1RDc0hndFh5a0xOdHRwTjVZNEIvOWZFcEJobTVRSTZr?=
 =?utf-8?B?bnBiNWw3K2VEZGNYbDZnTWZQdlVTTDY3Zm9GMzQzNkoyT2pTcFRQL2ppa2JL?=
 =?utf-8?B?UU9QU2toZ0NMbk9nOXh6SDhBbDNDS2ZIM2NYeWl6c3FnYk0ydU01ZXB4cS95?=
 =?utf-8?B?Z2VZWVBPVUFPSnQ2UUdiZW9NbVB2dGFhbDZ0ZjZVQXYyY3B3clAyWFBPTmJC?=
 =?utf-8?B?ZmpQdjAvU3c0cjkzYXp5emZvbEk0YUdkQmFYK21jem04SjkyTytPRW83bjhL?=
 =?utf-8?B?ZHZac09POE1zcEhLQWk3dkdZcnQySE1BK1V3VUhtczlSNjM2ZTBtWDVRYlVp?=
 =?utf-8?B?ZGRyN2QvVERyNzE1L2cybmErcWc4Vy91UjAzUkZScFFxRGxhMVU3QWdFMFpo?=
 =?utf-8?B?MTJ5Q3BxaGw4bS9oR01GL3h1OEdrU0k5bEl1NEdDclIwUEVBNHVrZ2VnbEtk?=
 =?utf-8?Q?1xrKCbepoQNRc8AfOg3TcJkb1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fb8b88-0d86-46a8-ec3b-08db19882fe7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 12:34:51.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RejPLGW8Z8cco/2Myq4gt0cWI5HR2y9ewZuTzf+Znym4DsfRsoXN3qNZrbaSQ832s8YnSz5XXMMyNsrm+D5b3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

Gcc12 takes issue with core_parking_remove()'s

    for ( ; i < cur_idle_nums; ++i )
        core_parking_cpunum[i] = core_parking_cpunum[i + 1];

complaining that the right hand side array access is past the bounds of
1. Clearly the compiler can't know that cur_idle_nums can only ever be
zero in this case (as the sole CPU cannot be parked).

Arrange for core_parking.c's contents to not be needed altogether, and
then disable its building when NR_CPUS == 1.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Restrict the arch_do_sysctl() change.
v3: Use "imply" and "depends on" in Kconfig. Adjust the arch_do_sysctl()
    change.
v2: Disable building of core_parking.c altogether.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,7 +10,7 @@ config X86
 	select ALTERNATIVE_CALL
 	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
-	select CORE_PARKING
+	imply CORE_PARKING
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -727,12 +727,17 @@ ret_t do_platform_op(
         case XEN_CORE_PARKING_SET:
             idle_nums = min_t(uint32_t,
                     op->u.core_parking.idle_nums, num_present_cpus() - 1);
-            ret = continue_hypercall_on_cpu(
-                    0, core_parking_helper, (void *)(unsigned long)idle_nums);
+            if ( CONFIG_NR_CPUS > 1 )
+                ret = continue_hypercall_on_cpu(
+                        0, core_parking_helper,
+                        (void *)(unsigned long)idle_nums);
+            else if ( idle_nums )
+                ret = -EINVAL;
             break;
 
         case XEN_CORE_PARKING_GET:
-            op->u.core_parking.idle_nums = get_cur_idle_nums();
+            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
+                                           ? get_cur_idle_nums() : 0;
             ret = __copy_field_to_guest(u_xenpf_op, op, u.core_parking) ?
                   -EFAULT : 0;
             break;
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -178,6 +178,9 @@ long arch_do_sysctl(
                 ret = -EBUSY;
                 break;
             }
+            if ( CONFIG_NR_CPUS <= 1 )
+                /* Mimic behavior of smt_up_down_helper(). */
+                return 0;
             plug = op == XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE;
             fn = smt_up_down_helper;
             hcpu = _p(plug);
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -10,6 +10,7 @@ config COMPAT
 
 config CORE_PARKING
 	bool
+	depends on NR_CPUS > 1
 
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT

