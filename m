Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92F6A6E19
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 15:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504067.776576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNEH-0002h2-FA; Wed, 01 Mar 2023 14:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504067.776576; Wed, 01 Mar 2023 14:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNEH-0002eU-C1; Wed, 01 Mar 2023 14:14:49 +0000
Received: by outflank-mailman (input) for mailman id 504067;
 Wed, 01 Mar 2023 14:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXNEF-0002eM-21
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 14:14:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ad57354-b83b-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 15:14:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 14:14:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 14:14:43 +0000
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
X-Inumbo-ID: 6ad57354-b83b-11ed-96a6-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT4HYdvsoxogJ/GowwguXLde2BnLiQ9eti0nXH8/Yd9sKqET5QB9Rnr0N5gidcYZ2D4fS5xhjn2ubOlLPKrUTV4C+6vs1NddCpiJxw+7cHImlMh54btHJzOrfj0Hj2owAi1cDv0BOrwKlLuObI99SssgHxGxbiD/Ej1xnp49zlTCme5w7iJuMzQmWKqVvco/SuIp+cRkcAceXcV5jlIOz6iibHAZUCWyXurh8zlmvD0xpzPIQamEnR9etHnv5rbM0RW14l31YNQjcVVBH4HY792zSsPMDCzA5gMkBB1D4xOf9n94MxLxYOB+f91xiX+BzITQCc+bkOEsh9aKbuHPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyqpzDT7ddgLuTyJ8LCdvZqSXAQOB28REr3pHpSd2aU=;
 b=P4MuBvvpK1eha9CROFA/TquIX/O1KeEHJpEnBoPQNd1tJtVhsxUIM1+PJX127KHZ1udszJq54hrZiXndoFStSzSTuJr9QMtOaUJGV5vdA9mWXb6ITYIPij81B0x2tphpxZfMBaiA9CYCwrEdQXQWuGgAneCW61wh98kg2OTP7193CoXDZ/6flwZI7tIVIkc9Anum2aDt0rdJ00scOlM6JHjM1utBZ9BdCOn0xyAoU89fqk3NWKOgRXi++1aZtiUaBabtLUQftzdpAI500HSZSKJ9uT2a4vobixDqCP18TtLSt231+7d8ROw1bUepzoGzTNS3LOTEdnXMoC8o5uYYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyqpzDT7ddgLuTyJ8LCdvZqSXAQOB28REr3pHpSd2aU=;
 b=ipvdC9VenclI3pJ7h2epFuswFRz/uh0tM68rNZ/vYmIRpuZF+ecZ3uVav/VqSg4rDnZDjkpicPMsK1bBqu01ojHDdivsL+q0UxosDm3OF+pbPFn5gMTm1dYa5EpM0Iewe//7OQjynOxgMOsUmN+hb5AEB8cxKfdQ+W0b9e6Wy0teKiOEVkDZtnHfL6cRD1ilGJu23kwisy/2Yn78FiQ6TMvHSa6402q7WYETI7L40ePmIZ8yNpyhOrQJT9V6gshYT8Kdx3iI9FCdepEya12SIhbT8Wbs6oD7/Y3qkv53bxQbBjN7BHFL4ok/mT+A5kuqD93qsXV7jusFhk4N84JpdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efeb5546-f82c-c038-9852-e8903edf8006@suse.com>
Date: Wed, 1 Mar 2023 15:14:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH v2 2/4] common: reduce PV shim footprint
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
In-Reply-To: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0fad32-c784-4608-97f2-08db1a5f4dc2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ti/N2lUMM0+izW/CaYIOELoQX6GYYuy6akcEOqBdEVYZMcMj+Oon7057st99F5GmVSLAPmnw3ZTWPgPI7Xn8FmlB3TJ+2gW4QPKuLKI+4kdQAoDTNJWktsiHKju495Bf8EnxwiyKF+F63CmvB5qrFjbkBcXqPMB/PuHK+Op1lI/ROzshFDUvX7HLXRUzuPxGChoxGugMHMHI3HlG6k8AdFy40g/pv3tmI27uVvrwNs5TYiLQTusnsd0xTXLwbdWCLTKWSg+31xtCoNfqnA9z+1AEDKPOQBybTJlRMX4MdDfHQhbsvTK5FCH5jwU0TpnYjfl+trkaeNd5isTcp72edb3FxGS5lNQiGYaM1jpcfFteGEQUstUm6Mnj4dbn2G05j8euL5Gfc/rGCECX/pWYZrqK1/+QRDckrCpEw5FvYFSrDZ3DUx9mH9Roa2qD/9y0wka2dxAgCXwotMNH6fNtgJL77mpJlp1SSofJJC78fSDaeTl4zd/iY5+YrM5vJBpQcN7X4GqkjVmoapnvpNMx915O2Z1GLmLIJuh0WfxE6ZVyciO8V3YLZDeXuhtTTNaZOzPdXuunmkdzxuKhEBh6B5p3+R1914AhRJ11Lp5rxSz4dVhO86lDIVgPRQJ9m70GIfzv07i0Vp4Er/n7/gxoA4wjvffpXrL1wHm+ufZEDuAfMa7z9AnWvGnhVN9vzxdq0KSORR0XlggylCkMdKpk7gI1c4EOGsw8WzZIffdyPA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199018)(38100700002)(36756003)(86362001)(31696002)(2906002)(41300700001)(66946007)(66556008)(66476007)(4326008)(8676002)(6916009)(5660300002)(8936002)(2616005)(6512007)(26005)(6506007)(186003)(83380400001)(54906003)(478600001)(316002)(107886003)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZRK2VUSE12NlF2WVdpRkNNSE1Cay8wUU1qaFBraDJneXpLdUtaK1JtWS8x?=
 =?utf-8?B?ak9EcGZyOWJPUFpRNXc5UjdSMWlCMjNuaEZXc3lJQVlISUV6UG5iMkJlSE53?=
 =?utf-8?B?WW9lVXlzcU1ldHZmd0FzeHQ0YVB1Sm51azJhUjlSWFdFTHl3M21iODJsL25Y?=
 =?utf-8?B?ZnZpNXJLMkQxNzU5QkpUeUt6LzNYRVFWeVpZdTVEcnQrOWZBR3VybnY5QUlC?=
 =?utf-8?B?TUIwTW5Ha1dhSnI0QmY1VWx1a3NSa05UM2hmSnlIT2U2Rzk3SFhrZHhMT0Ez?=
 =?utf-8?B?N2FTUllkRWdTZHhSVFI5RWZSMXdmdS9uZ2p3ZXBiSmY1dGtQclVYOEI2WWZX?=
 =?utf-8?B?VHgxVWVDcUtOSUN1RjRiOFRyUDNScnVwS0dVOGVHL1l6eFJiL2lYeEs5Z3Zp?=
 =?utf-8?B?UjhsVDVTM29ZZWljUlpiREhWaFhqcitFZUdtNXh5WnlrRzlSeHZUaXlOT05h?=
 =?utf-8?B?TENacVRBT1ZTbVB3a29YUjZGZGExRDVFUjdDdFFqWC85aFgrYjYrRmJsaHIy?=
 =?utf-8?B?L2JZRVdBS1VsSlhsYVA3NnltOFNUQVgra0c0Y2krcnNVc1d0L2pDL0JLVnNt?=
 =?utf-8?B?eWVLN1d1L1pVV1pQaTlkenpQMFVPYlJ2N2dYRGdPcHZFZjR2cjlzWEVVQktI?=
 =?utf-8?B?dWI0ZUg1cStsZWhXbCtGODFhZFQ2TlhkeEV3bmJ4T0VVNFFsYkxNTG5idTZZ?=
 =?utf-8?B?SlFBd0dOSWRLcS8rajNUMy9nZzBPWVZlamNXaDFXQ1hLVjkxR3ZVbXhSRjJw?=
 =?utf-8?B?TUV5ODZieGNDeDhkNkFVbVcySFNCVW9IT0ZwUU1tWWVEb05lT3kvMU9Kc25t?=
 =?utf-8?B?Y0x6dzhKdFBsQ1B1V29ac2l6QUNZTEQyZFdURXRWSHpZd1VqZUY4THpNajZ3?=
 =?utf-8?B?SUZldkZpYTdpRUlCYlUwOFFqK1hXTzZObC9ocVBtRWozV1BJSGdIOVZvRWZX?=
 =?utf-8?B?OGZhUWNOMDRDUVBhYUUwQnljNXhiYjgxSU9LOWsxMHFUQU1hMGFkVXJiVURz?=
 =?utf-8?B?VENrY1dyRkRoL1NUNmFINHVTbURyV0pLeTJ4OSszdjJIKzRjOVllNFAzUEhT?=
 =?utf-8?B?azNNRlVyUThaYzlZajY1MDAwbFc1YXFaL3ZaWDNqbk9Tc1QzOGwrYk9ZelhD?=
 =?utf-8?B?R3FsNm5TVEhMSFBQaWRpSFIzQ1BocHlOaTR5Q3B3ZGJ4Rm13YW9MSUdndDlG?=
 =?utf-8?B?SWZ0bUZockxUNzJmWHdYYTg3aXJOSnExS20xc09zQjdnbUZNejdHZUFRczNE?=
 =?utf-8?B?bDhJbzZzRUlZSmc3MFlyTk5RQjFxYVdRSGhId1lpdjVrL0hDZUN5UHdBYWhH?=
 =?utf-8?B?Y2VKWVk2amlFYUkxRUJtYVl6eFh0UmJFUE5XNTdxa3luZWZmQjhsR3R0QjVz?=
 =?utf-8?B?b3YzZ2UwdDV0aFZ4dWkvc215SG81M2V6dGdrTUNFd2FBL2JYcWRrVWJpOTJI?=
 =?utf-8?B?V3FLQitBeFpTSDE4MFkzTWM1dzN2QzZkenZrazArRHlzZzRtckFadm1TVDly?=
 =?utf-8?B?b2c5VEJrb0NuVENLZHI1RzdKcGhxTTNVMnErR29jUUs1a25zbmJSV1JRdThC?=
 =?utf-8?B?WWtpYkJiekhZVktuNk5GdE1xQks2VWl3ZEc5bytxRUE4ZkIyQUkzL0NvVTFo?=
 =?utf-8?B?bVo3V1lEVEtFbURod1dXdDBQVEFyRmdmazRRT2tUOHZSRSt5OEM2cUFEZXNn?=
 =?utf-8?B?SUdmUXBvd2VPck9KZ3JzREpNMXdxOGJ4NllXbWFTSEwwWFdNRjFYSU9uYWE1?=
 =?utf-8?B?MFNaZEVxSGpvdGt1R1UxZDAyeDJZVkRJQUlyRWZoQitVOEJGdDhEazNSRjZE?=
 =?utf-8?B?bDVaQ1VmUHBrUWc3Y3FSVEJHSWl6YVVGbUVkKzNTczZLb1dZUk5FbmptNTJp?=
 =?utf-8?B?RlduVy9lUVZMS0JZNVp6dStZOHpORVFscDFSUUJUQVU0N0RrNzZEMWthZG1E?=
 =?utf-8?B?cmN6ckNKK1crYTF5N1lFZU55Mi9WSHNlWlppSERpMkZQdUV5WlRxSWd6TVVk?=
 =?utf-8?B?dVRraGR1UmE2b1FacE5LWWFjWGthYlVtTFNsSWx1LzJoQ2w1T1AvdXBkN3g4?=
 =?utf-8?B?bmN0R3MzNVZZWlI3NjVNSlhURTludVdyRTdhd1JSMTh4eC9kc0QzYm4wdk1U?=
 =?utf-8?Q?f9axrODe019/uC3B03dqHRAYf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0fad32-c784-4608-97f2-08db1a5f4dc2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 14:14:43.3277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbCmtVGt8H4kUR+kpF/4cprwVOg2N+Dzec0Mhtd3rhTqxfNFhnKmRCeWlaNz0h+DQTTWqz01FIwDhBDFSpyFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

Having CONFIG_PV_SHIM conditionals in common code isn't really nice.
Utilize that we're no longer invoking hypercall handlers via indirect
calls through a table of function vectors. With the use of direct calls
from the macros defined by hypercall-defs.h, we can simply define
overriding macros for event channel and grant table ops handling. All
this requires is arrangement for careful double inclusion of
asm/hypercall.h out of xen/hypercall.h. Such double inclusion is
required because hypercall-defs.h expects certain definitions to be in
place, while the new handling (placed in pv/shim.h, which is now
included from asm/hypercall.h despite the apparent cyclic dependency)
requires prototypes from hypercall-defs.h to be available already.

Note that this makes it necessary to further constrain the stubbing of
pv_shim from common/sched/core.c, and allows removing the inclusion of
asm/guest.h there as well. Since this is actually part of the overall
goal, leverage the mechanism to also get rid of the similar construct in
xsm/flask/hooks.c, including xen/hypercall.h instead.

Note further that kind of as a side effect this fixes grant table
handling for 32-bit shim guests when GRANT_TABLE=y, as the non-stub
compat_grant_table_op() did not redirect to pv_shim_grant_table_op().

A downside of this is that now do_{event_channel,grant_table}_op() are
built in full again when PV_SHIM_EXCLUSIVE=y, despite all the code
actually being dead in that case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Sadly I had to restore the two "#define pv_shim false", for Arm to
     continue to build. Originally I was hoping to get rid of that
     #ifdef-ary altogether. Would it be acceptable to put a single,
     central #define in e.g. xen/sched.h or xen/hypercall.h?

--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -6,14 +6,23 @@
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_X86_HYPERCALL_H__
-#define __ASM_X86_HYPERCALL_H__
-
 #include <xen/types.h>
+#include <public/xen.h>
 #include <public/physdev.h>
-#include <public/event_channel.h>
 #include <public/arch-x86/xen-mca.h> /* for do_mca */
+
+#ifdef CONFIG_COMPAT
+#include <compat/arch-x86/xen.h>
+#include <compat/physdev.h>
+#include <compat/platform.h>
+#endif
+
+#if !defined(__ASM_X86_HYPERCALL_H__) && \
+    (!defined(CONFIG_PV_SHIM) || defined(hypercall_args_pv64))
+#define __ASM_X86_HYPERCALL_H__
+
 #include <asm/paging.h>
+#include <asm/pv/shim.h>
 
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
 
@@ -33,10 +42,6 @@ void pv_ring3_init_hypercall_page(void *
 
 #ifdef CONFIG_COMPAT
 
-#include <compat/arch-x86/xen.h>
-#include <compat/physdev.h>
-#include <compat/platform.h>
-
 extern int
 compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -49,6 +49,22 @@ const struct platform_bad_page *pv_shim_
 typeof(do_event_channel_op) pv_shim_event_channel_op;
 typeof(do_grant_table_op) pv_shim_grant_table_op;
 
+#ifdef CONFIG_PV_SHIM_EXCLUSIVE
+#define REVECTOR(pfx, op, args...) pv_shim_ ## op(args)
+#else
+#define REVECTOR(pfx, op, args...) ({ \
+    likely(!pv_shim) \
+    ? pfx ## _ ## op(args) \
+    : pv_shim_ ## op(args); \
+})
+#endif
+
+#define do_event_channel_op(args...) REVECTOR(do, event_channel_op, args)
+#define do_grant_table_op(args...) REVECTOR(do, grant_table_op, args)
+#ifdef CONFIG_COMPAT
+#define compat_grant_table_op(args...) REVECTOR(compat, grant_table_op, args)
+#endif
+
 #else
 
 static inline void pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -822,9 +822,9 @@ long pv_shim_grant_table_op(unsigned int
     return rc;
 }
 
-#ifndef CONFIG_GRANT_TABLE
+#if !defined(CONFIG_GRANT_TABLE) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Thin wrapper(s) needed. */
-long do_grant_table_op(
+long (do_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
@@ -834,7 +834,7 @@ long do_grant_table_op(
 }
 
 #ifdef CONFIG_PV32
-int compat_grant_table_op(
+int (compat_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -56,7 +56,7 @@ CHECK_gnttab_swap_grant_ref;
 CHECK_gnttab_cache_flush;
 #undef xen_gnttab_cache_flush
 
-int compat_grant_table_op(
+int (compat_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) cmp_uop, unsigned int count)
 {
     int rc = 0;
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -32,10 +32,6 @@
 #include <public/event_channel.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_PV_SHIM
-#include <asm/guest.h>
-#endif
-
 #define ERROR_EXIT(_errno)                                          \
     do {                                                            \
         gdprintk(XENLOG_WARNING,                                    \
@@ -1222,15 +1218,10 @@ static int evtchn_set_priority(const str
     return ret;
 }
 
-long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long (do_event_channel_op)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
 
-#ifdef CONFIG_PV_SHIM
-    if ( unlikely(pv_shim) )
-        return pv_shim_event_channel_op(cmd, arg);
-#endif
-
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -45,10 +45,6 @@
 #include <asm/flushtlb.h>
 #include <asm/guest_atomics.h>
 
-#ifdef CONFIG_PV_SHIM
-#include <asm/guest.h>
-#endif
-
 /* Per-domain grant information. */
 struct grant_table {
     /*
@@ -3563,17 +3559,12 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARA
     return 0;
 }
 
-long do_grant_table_op(
+long (do_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     long rc;
     unsigned int opaque_in = cmd & GNTTABOP_ARG_MASK, opaque_out = 0;
 
-#ifdef CONFIG_PV_SHIM
-    if ( unlikely(pv_shim) )
-        return pv_shim_grant_table_op(cmd, uop, count);
-#endif
-
     if ( (int)count < 0 )
         return -EINVAL;
 
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -40,9 +40,7 @@
 
 #include "private.h"
 
-#ifdef CONFIG_XEN_GUEST
-#include <asm/guest.h>
-#else
+#ifndef CONFIG_X86
 #define pv_shim false
 #endif
 
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -24,6 +24,9 @@
 /* Needs to be after asm/hypercall.h. */
 #include <xen/hypercall-defs.h>
 
+/* Include a 2nd time, for x86'es PV shim. */
+#include <asm/hypercall.h>
+
 extern long
 arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -19,6 +19,7 @@
 #include <xen/cpumask.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/xenoprof.h>
 #include <xen/iommu.h>
 #ifdef CONFIG_HAS_PCI_MSI
@@ -38,9 +39,7 @@
 #include <conditional.h>
 #include "private.h"
 
-#ifdef CONFIG_X86
-#include <asm/pv/shim.h>
-#else
+#ifndef CONFIG_X86
 #define pv_shim false
 #endif
 


