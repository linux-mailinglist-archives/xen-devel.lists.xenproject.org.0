Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB66531DF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467911.726980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zFL-0007DV-0V; Wed, 21 Dec 2022 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467911.726980; Wed, 21 Dec 2022 13:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zFK-0007BA-TO; Wed, 21 Dec 2022 13:34:58 +0000
Received: by outflank-mailman (input) for mailman id 467911;
 Wed, 21 Dec 2022 13:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z7j-0003Di-Oe
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:27:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29cc5943-8133-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 14:27:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:27:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:27:05 +0000
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
X-Inumbo-ID: 29cc5943-8133-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVBYdeP0b0vu5GDPEmIxp52blEfH7yDoGx/+aaj+prhwyYdRO8Yjqnys1vmnGC/KZAB/rCABgEegYcByHDNE3/cdcxa/CqOba3Jn2xOfG5btznojXHlpz/UECpJcZzbuv1Y5GGlUAZ8Y+zcFspjL9wYioh6JitsMvjfOkoa618Ou7UnEbm4ciXAk2oLE3HJh3qAdELgLFLnOvWJjJSUz6xLq2ra3Jl1dqDFqaS2zLe6YJso5G+mBiSzumAXgG2IErXmg9KT+1b1JcQa0LfHvAIKwEarlWRSIsyoaEY4KoUgSbMNHR4DXQSD33dkT28wHbxshy1LsSiNbQ2ffbap7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPAPBzI9r0Pqf/DLCl5qsysEb208XfAwkfak1FQmFWM=;
 b=QmRsU/yCwgLfZ/bfqg6j/gaG/B7VZzRjk9a+2oAl+5jOaTSIf7Qc0lJU7dbVROUQJ3J2Nh90cRuD5D7Rx4kanXDETUsVDlPwPfv01K/b3nTYboxd1iyOgSsH2vHg9sn9yLh48/bSiNaDTVOgVmVVyJgMVFZTMmYxCEkQ3GD5s3dYguADDn7rpoeLdimngg1Igo3+VWKZ8a2gEsmzjevZXisupiNophqFBonD2InGeecON2olpXiA12ZdDKDHlvqWVONEZIgOaaXrviDR5/VpOm+SnTC+s9zUYS/H0n9ePZ4kYiSdlmCxKSwOrhBuGVqO60XQg9h2qAtXL7RYWC3GDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPAPBzI9r0Pqf/DLCl5qsysEb208XfAwkfak1FQmFWM=;
 b=Qh1yIfZLHgeJRCEnASb5c8y4OWP9Z6OHsqqXNQCwQakml0y7KMqCVsKYb3LibO0oiybB2FKuSIXwt1ZsSMGEIcm2iqIdMRXCrmv9gcaxKKOj6lJzuK0SNLrGC7nbr5QcPAxgRGOzyMzDbxdgEd2C0BiCHUZyG1CUWJAXK7Ajxwv7FT1FuAN7+lzohnw1cUBAJhOx5m808DTwGW9nSdsjBkJ8I/rVxAN6nQ1mOL03iY5XeUcjLjRVpHjh3LzkE+oksb70PZItJ8TydzJWCq5FYmZqJh7S2a0CnXKpEHy91m2zoCl090x5CdGyky0+hJWgWkSbAgpaxzIZ8KqOU5nUAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9a5dc15-d761-9ddf-5c93-ec00218d147f@suse.com>
Date: Wed, 21 Dec 2022 14:27:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 5/8] x86/PV: drop dead paging_update_paging_modes() call
 during Dom0 construction
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1f6eb9-3ea9-42b0-f76b-08dae3570d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Be0MpNX/2ClCniKXEKqwM/8jk/HfDPqhWcQjXWi2SyevVQLJ8uNr+LRcCDopcM6d28E2ReG8NlsGMTYZ2AOF8CqQcoLE0cwbDOXcxPnhumOUq03CA88D1RNreuKt2apVW0wz0mgXYbWzJWTAN+q+uLT1UEWQUA8F0RbIbEO+1rA8EcDFgGkhndKToPK4EdS+83uzKRbDjiz260aYqg8M6LZktG3XaMl0MIgCR8tA254FV68LJDaQNC7p5Slmk/RZX6QTeSwj4cSEV6qANXAaQkcsne+bb4Fs6fpcYNduS32qXfkOCrTEpbouVGRtvUE2r85p5fyrYNmBaUm48aOxGTG7izmOfbIcnkZzS3NVre8LsTRyR1ammKCnRKcNUZ7PkiGSyKCdSnRO6ycnligj2Vq8ftYb93hwdja7AReRsFC87d4Z7OFpoi70c8eM25D/OUehhY8EMERk0SPC9pOBQ3buwJgd69qWC6KVkaN/ECqXpki4/KFzO+gsV/LUa2IZn6jETPriXfx2e/5XllbOQlzhe5CsI/2tVAYJVl1b7X1nhZZ2We19qce+DHIt8aV3PFok/O0KKih0Lw+ZeOZip77MyJnTu/Gj+VUnKGyS3BL2JMGI5ZSLwQ7Hd6tNu43H1BHEa2WTDkG7Bqvmkvw68U4lmDYR2SPKJDCXG1ye5Vbuu7Sir6kDatSnqrEaHsyHyZpzVNbAno8szCSMCr9R+0KbqANW2id5DVcLMaUwwE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(83380400001)(86362001)(31696002)(2616005)(38100700002)(36756003)(478600001)(26005)(186003)(6506007)(6486002)(6512007)(66946007)(66476007)(5660300002)(8676002)(4326008)(316002)(6916009)(31686004)(8936002)(66556008)(41300700001)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkl2RXlpNnQ3SXU1NWc2ZTI3dG9SUzVHMFBEekFWL0RJSDRMOFZaMmNjTEdU?=
 =?utf-8?B?NGs5R3RBK0xORWhqZ3ZUMmNUWHhkVktxb2xIbFFPRmtaaFRzR3dwM1hXc2J5?=
 =?utf-8?B?TlpITGtVTnJYc3MwNUxmaXBoczdaQ1Q0Y3BoUHJsb0VGT3h2TWZaaTFleUtu?=
 =?utf-8?B?MXh2TmhVRmJidE5UNFpYSDZNRXoyZmF0RDNJdGZTVURZZDlrdW1hVWVqaXlU?=
 =?utf-8?B?QXRqNUdqNlpiSlNWT25aOFM0UFNGenRVYTZ4TmduTjY5eUQzcTUvS2o3Z3lV?=
 =?utf-8?B?UllnRnFJMWh1WU1ZYktacGlMQVFnM3YzZG5icm1UNWRid1V5ZUpnYWJYU05C?=
 =?utf-8?B?N0x3S3NyYmxCdWExdHd3SGNLL202RVJHVFlYZXhOZHB1eXVyTjV1cFl6N1Bi?=
 =?utf-8?B?cFc3NWhkeWJUWFQ0YWlNbllCREliRlFIYjlFdlB0eDRQRThEN1lkK0F4aTdK?=
 =?utf-8?B?V3dIYmZvSkV0RE1NZnh6SWlnVG5vd2F4NDdLL05hdERKeEYwRkxjekdVQ0NK?=
 =?utf-8?B?RjA1UGJ4a0dlOU9tKzI2Mlp1bjVQVXV4S2ZZTk9TTi9RQzZ4RHRtNWxvbjVm?=
 =?utf-8?B?SXVxNDYyYnZJTTdwcENDRGdabWtnV2UvTWdVMVN3YzhDajhISVVUMnh4cHpt?=
 =?utf-8?B?UU1TOFp4MGE4M3krVklqbitXbTZoUEcrTTFDWUFEcHhBQWdNWFpnenA3bERo?=
 =?utf-8?B?V3JLNGQvMThSTjRTWnR5TFY1ckJwMUNWOTZCQUNCMGcrcGMvYllmb3k4bEY2?=
 =?utf-8?B?dGZqVlRKcXg4Z2pJMFFBTDZyeVJaZVpvdkpMTkxTM0RzMU51cnh6RzNwTUlt?=
 =?utf-8?B?VHhIdmd3Skh1U2lnakZsUVFGcFJ3ZmtEbkg1cVFwb0N4ZzN1SDUyS2NPcStp?=
 =?utf-8?B?em11UUJOK1JYc3A2c01qRVVEWkZOK00vNnUxeTVob2ZoYmtJRFNWU2o5bHNp?=
 =?utf-8?B?Znlsd25qUnJCMWh6WEVWRm9XZUo0U2xpZGt4S1BWMHFzbGpvRHMyejYwUFFq?=
 =?utf-8?B?SnM0aWswTE1xNmhuYTQ3TlB3REZ6YVpuTEdvYWltbEFCbzNVbzdsY2YxQStz?=
 =?utf-8?B?YXpKYVpmUXYyM3FmQlAwamFtRGExaTd1OXhibkZ2WGZUeEpQZzY0d09odU9B?=
 =?utf-8?B?SnI1aHZQUlYrYlBkUmJiVng4aWpnUjBtaklTbVYzWnVqSFZoeGp4Uk1NUTAv?=
 =?utf-8?B?cUd6MlhkRFdET3Y0Yk1GdlgyU3VZYlVJVktrOWJ6TVVzaVhBVkpCb24wdjgw?=
 =?utf-8?B?TS9XSDNnSEJzNkVvUmRDbkZHZUdYNXdxOWNOMGVEdk5kb1pabTJuY010UzR0?=
 =?utf-8?B?a1RaV0hqTHYvTnZxaVhBYi9FR0hnWWM3MzBxQzI3TS9iY3FkVUpBeTJlMXBv?=
 =?utf-8?B?UTVRbDVCWXdvYjgzajNSYzJBMEUrdTZLV1JaMjN6WGtEVDErczZqYVJiTGJp?=
 =?utf-8?B?dVp2QS8rd3RLREhHdXNCTFZaSjFjck9udEM2RjNRODJoQm1ubVpQRXRJQ2Ro?=
 =?utf-8?B?cGczM2RIU1NCd2h5MVRCMFZCSmUvTWZ2L3BzTE9ZS05GdFR4RlZlNUdsaWJQ?=
 =?utf-8?B?VHp0VVV1d3FydG8rd0FFZGM5TmdzRjdiR2FBWDZlcmhjNWpOR1dSUmkvZGh6?=
 =?utf-8?B?aERIUmsvUXdKVlhQSGJEQ1hZNkRPOE9od1N4WXRhYWliYnRVSjZDVXZYMEZF?=
 =?utf-8?B?UnREY0c1c3IzZ3dFUjBKQnFkbzJDQ1BNM1dXUkZBVTlCSS9GZmJVcU5sRUN3?=
 =?utf-8?B?VXhFc3RHN3g0blR2UGw2MkpQTm1ieGhPREV6dURJQ3dFdU4vOCtRZXdtSGh2?=
 =?utf-8?B?eFRLVHJrcU5lWE9vK1dtMWlJOVorRDhkUjcxSUFadVBxT3o4ME1NUkxPMVlG?=
 =?utf-8?B?RDBUL1dxOS9HRmpkVmRRWDg4cWg5d3hhZzl5STROeC9iaGtLQVNYSEp4b0l1?=
 =?utf-8?B?MkM0ZXlzNHRMSzYwbFBBblhLdm5GbEtwVFJUK3NMeVJUYmpqZUhRMi8vYnRD?=
 =?utf-8?B?MGs3VEFuQzV6VGYxdXBWWTVMMjc0RGtXUXVMNnVkMGFlS3U0SmhzNFF0TGhq?=
 =?utf-8?B?WjNJNW1pUXdZNW9TdDVwM3lGWmpYTjlpQjBKM0FianJPMHd4TGlSb05CUXFF?=
 =?utf-8?Q?VTgGYz/T0ML1EpxsAzk3pwA4N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1f6eb9-3ea9-42b0-f76b-08dae3570d80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:27:05.5343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I21aga143y/Q2Z2gdSj96NYdu8SH1khvmveIpvmdy4XVhk9IK6XfyEBYUXWvPWFosNZq3pEvmT90dh5P38DC4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

The function won't ever be invoked, as paging_mode_enabled() always
returns false here due to the immediately preceding clearing of
d->arch.paging.mode. While compilers recognize this and eliminate the
call, make this explicit in the source (which likely 9a28170f2da2 ["pvh
dom0: construct_dom0 changes"] should have done right away, albeit even
before that the call looks to have been pointless - shadow mode enabling
has occurred later virtually forever).

While there also update an adjacent partly stale comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -10,7 +10,6 @@
 #include <xen/init.h>
 #include <xen/libelf.h>
 #include <xen/multiboot.h>
-#include <xen/paging.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
@@ -804,11 +803,8 @@ int __init dom0_construct_pv(struct doma
 
     d->arch.paging.mode = 0;
 
-    /* Set up CR3 value for write_ptbase */
-    if ( paging_mode_enabled(d) )
-        paging_update_paging_modes(v);
-    else
-        update_cr3(v);
+    /* Set up CR3 value for switch_cr3_cr4(). */
+    update_cr3(v);
 
     /* We run on dom0's page tables for the final part of the build process. */
     switch_cr3_cr4(cr3_pa(v->arch.cr3), read_cr4());


