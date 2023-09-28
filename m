Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C47B14B1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609330.948375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllLX-0002j7-GC; Thu, 28 Sep 2023 07:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609330.948375; Thu, 28 Sep 2023 07:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllLX-0002hH-DE; Thu, 28 Sep 2023 07:22:03 +0000
Received: by outflank-mailman (input) for mailman id 609330;
 Thu, 28 Sep 2023 07:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllI0-0006Ef-EX
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:18:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3579f611-5dcf-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 09:18:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 07:18:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:18:22 +0000
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
X-Inumbo-ID: 3579f611-5dcf-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSW9KEgqBO+SWH32jJ4Eccxs48NNvf1VhDfFCnezm2+Io+UmO4FOLuLDfCWT2jqm+NsQXZtd2XKIEnpzjaBdNqLw7jkmO3ah0ekzetrW9dGzGpcVEKp7rf/5YfoOGZK+/VQlgF6kKvPNV+onET44tt9Kp1qaOBrtRW/YWicmFErgNff7fr/U3lXgvabFu3YrjM0HiPP7LWoz8oIqKQ9TPwI5OYPOCFYTqhEVuT5VpZjrkVzawohPR1O1wnhrlwAHwzZbiNlMWhyUQFN2LVyIYZapFRCakwo6nTDdUpuloFn2Fmsx9bIyjoP1lO6YWeUycAo21fxQkA0Zyl/GNbionQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6heSYFw3PZWXqBzIsXffgtlNiPmiim8ZkFs/SFPCFs=;
 b=gysA0cNKlbKivDWhRxGfOYCmbiXbd/m4xj+b7KyKyZTS52XuT7uAKFtPRDX/elURjGqHFe2pIb8Fo7o6NRbTt5Q80BAg2inVhrhVR8TL9EVQuZOoCKYXaqUwJQdsPLNHbpKgfsMLUjk961dIO5F8aQcEUKucNDp2HuYsX0yvXerw/eVMfbTK4qidlhxu2ay83aL20NBAIpWSi2QJaeDHxbYO9kbPaDqq0ZGambpAClLP2g6Q02JWCw2MGgxWK27/00XJbEbcVvCrcC7gYn0TtlV6mve6Q0MtT6vz1RED8Jr77GvMUfffla50yEQPxSOQOqyZMP3kodD7SA2MFXDonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6heSYFw3PZWXqBzIsXffgtlNiPmiim8ZkFs/SFPCFs=;
 b=o5bf5PNj6onGkKiC+FYf2tLtKGhOBDmw2s+1wUKLA84o3VqJn1dl7k88xopnuMvHz/1RnmIK1mKuKqf95haRvKXp01FqWmMJL8Vefr1ZhH5SB7AwcyXSIFurCCpGTfI+nwqrI1I5i7cFj3WhBC2MGky1MRb4JDV59Q7vMxxQPBukFLlzajkKN12bwsN4eQbsrkxnN3Mg0HFddvyBYPVGW2xbdUchOoKZcODDxsxadUSv/NXx0fLnauGloJqv6PxO1hkCl22APngZY749olXqPXnDHyvmx3heORSwIB7wxu9bn5eWQpEFru82+5JERoxr7F+44QodB3wQdu8helaP2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e8c1577-783b-ece2-3302-b1a85a2f53fb@suse.com>
Date: Thu, 28 Sep 2023 09:18:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 9/9] common: convert vCPU info area registration
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: bfda5261-4595-48f0-0a90-08dbbff318e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nDxN0hqlgVbkRULRYvsnh/lYwr16uuYUcxKyN4xFQ6pvfun8UJIu3a4UlEl3+lPxamp9xuzrX+AakXkZNoPyKrS4Lcdluy14P91eAzTZUfy9h1Hsl0NV+CxZUJvbQxDHuKmHzwT52sS/K/Xza4XThp0H3Mkmf0wwGYRbwJ28Mjj8YKwkJbCJg/Q5ZQcBny4RCpw2oe5VK9pHH/0HhyQUgMRFKqaCt3CtWbR6srX1i/m9+ucHqGe770RABRF74DYMI24N1U3Mlv7fWIdqG9mKa4H0qXIm35vZ7Va4hpQogze9Z93TnrFFW5m/5d7Pz/x4bvMHEm0cj0kV0yRrqDR0LHN0HqxzotmxfSNCh6b+MFszppGEC0R6puphoETws9jF0cWb4UyTB+Bwkke5ikzd0u1f05MOESYSiwe4hdHtTkW6dOdPXtKJ1lqrQsPzKu6zs104u3vLyAtYGzc8wIU7yn/TsqJ9Nx4fMILeD9sugHT9H6FIYm2k7JJe8K4oJENs9v+7vwDc+XzqNRtxXOjyM3p6cunLoQm8Ho8/ygFTTt+rAm7AfkM3geeS7gF6AyzYqP1aAKpQHDOYy9dqw+2JPKaviMcFaRoAt3YaucV9oy7W/ACP8zk6LzDt2+aDflrST3hwXCW/ULiINg2YD9z/nLlVmi3vYPSkVhi+vtz12Y1Jtro9UlEQVkW2dExBC946
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2616005)(83380400001)(26005)(31686004)(478600001)(36756003)(6666004)(6512007)(6506007)(6486002)(66946007)(66476007)(316002)(66556008)(54906003)(6916009)(8676002)(41300700001)(8936002)(4326008)(86362001)(5660300002)(31696002)(38100700002)(2906002)(30864003)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnhaTmpDK3g0OURjZ01FVTBYRnVSN2NZWG9kVUMrVUlHNGhNN0xBVHI1dEZK?=
 =?utf-8?B?WEJpSHFxMmN4OGNDYW9EeUhITEdFQUkvUEQvT3p3S1V4WkdmTmZVNXp6Mk15?=
 =?utf-8?B?dXJMd2pKbjZFRlFiK2lmMkdmaWRUNlAvQ1o0YnNUQ1c4YnloSFExc1ZFVm1V?=
 =?utf-8?B?ZjlIZEdLMG12cXEvZ3p3RHpWSzJ5R3RLUzlsTW92c3pBeGdWUDBHSitHeHZF?=
 =?utf-8?B?Q2EzU0JQMlFIY1dFdWEzclZCaUV5bms3SnFKcXVjN0hrcGxoTlRKMnZHZUcy?=
 =?utf-8?B?NUlQUGNac2M1eUpFc3BXV2YxKzRvdlBoaXNxQnpRMmpmZXY0SllxZ1RLMWov?=
 =?utf-8?B?bUlpWU1NbDFvci82KzJLd1JCY1ZjTE11Q0h6WU0wbE1CaFE5MENYcy94WmUv?=
 =?utf-8?B?aTQxRklVRkJQNURoeVNHa0lvaFY2czVqSnd0Wm1KZE5mUEVUTTZXY1c4aW9q?=
 =?utf-8?B?UDl0UVQzd21OVWtGNjRndU9rTG4zTlNubUdoSTNWNUJPTXk3aUhYaS9JVFpi?=
 =?utf-8?B?ZTRSamNmT29iRnlBVlFBTmRjRnZWRlgvaDFaQnRZSUVWZnJQQzFZK3N6dHVJ?=
 =?utf-8?B?TmdWakQrWkNhVXF6NEZOaGVyWnBlOHR2aURxUTRDcjBIMVhESFdMMjVIeHU0?=
 =?utf-8?B?a1poSm9xYW1pS3ZvYVJ4Qm9acUN4TzdGZWZtd1ZNV2docjYvMTB3Z2VTcS90?=
 =?utf-8?B?MHArQWZlaVZVd0ZySy93dk8vUWJhK0k2clF0c1lkV01iZ3B6Zk9ydUZIRFBW?=
 =?utf-8?B?bmhGZ1oyWnl3ZXBQazdUMkJkNzlpMlA1bUxTeUF6eGlPRDJJZ0FmQWRIcm9i?=
 =?utf-8?B?ZXhQdG5zZ0RCRzcyOGc5UnpZRDJWWnFmbkJRM3M3enlUUjNzUy9raHMvbE1h?=
 =?utf-8?B?MmlJazd1aXIwS3hUUmpTZUhPUW8vWUNPalFlUFR6Z2hlSnNFZFhrQWE2WW5V?=
 =?utf-8?B?VVhYNm5PbGFFTDZPbDBOaWltdmNLeFVwUEVDcmN4elBCem9INFljMWtaT1RM?=
 =?utf-8?B?cFlkei95SFF6RFBQTEpHTlpOSUtxSDBlYytoVXpodDE0NW9GUWVucVdIVXBw?=
 =?utf-8?B?ZUJZSkZ3enlxRE1nYWRvNEVjeDZhZ04xTmdEeWNTTXhIMGFDY0NmUjFEWExx?=
 =?utf-8?B?QzJ6c0s4bWZuT3ZjMUdpa3RlaHZWeWw2NVd1VjU3QThtRDM2SEFtbzdRTG9K?=
 =?utf-8?B?MlYvSjNCNkhacHVHNTdvNWVpZ0VKeWp3aVVVQ29IdEhuekJ3NmRjL2tPZzc2?=
 =?utf-8?B?RnBFV3pHS0hMN3FVMitUMndCemhyaVEyN2VVQUNYVjc5dUNMdTNJcHl3Qmww?=
 =?utf-8?B?WW94M0pPTEx2S3o3QjNkRUV1TE5EUjhuV09pSkxLd1IwWkZMK0pRWUwvSXRP?=
 =?utf-8?B?MFZGWHpYalpVcGxUSU52ekZlcWVVR2pmblh1dHE2RlZzRjNzSCsydmxCK1du?=
 =?utf-8?B?T0pUbW9KMy9mZUU0OVhGdENpVWVvS3BWUGlqRmpYQjJEbWFwU3RTRGtzZjg1?=
 =?utf-8?B?UnRoN3kyNk1OZE9KNmI0eVhqWTFIL3djOGhmeEFVQjJQeEdFZFVqcHdtR1dh?=
 =?utf-8?B?UXlESlQ1Tnk3eUNsQkNzV1FuSklpY01DK1JQV1V2OE9GdTRISzVVUUwxaTBG?=
 =?utf-8?B?b29YRWpBYms2NjJBekREVEk3M0lYeFZpSXkvQ1d5bU9BdlNFTFlVRUZqMU5a?=
 =?utf-8?B?M3g2WElhSWt4SE1UT1Z5emZkSEtYcEFtSWRyT1Uwa1BUMzZ5M2h1NWV5bi9a?=
 =?utf-8?B?ZlVlT0x2di83K0pHSU9JNUR2LzNtRVNMaFFWVzUrRWRQZTRPOThmQTBDck5v?=
 =?utf-8?B?VjZWSmxLOEZZN0h4eDY3ZEZsa1hjc1kzQVFhT2VWUlZZOU8yRUdvMmlicTlk?=
 =?utf-8?B?bHI1Y2pnU1MvdGNwOFlKMHhPdUJ0N0Z0dVhPRnl6cWNuWXFPT24zMkNyaU1i?=
 =?utf-8?B?NW1uSDVxVEo0NGV3SUYwSlhGVG1MZW5yWmV6Y3ppN0lUN3dDZTRBUm8xWUFs?=
 =?utf-8?B?VjgrWE1UUGZtNVUxNC9oRW0zaThGN0kvejBNcEo1anNpNkRteDJrYmdlajEv?=
 =?utf-8?B?ZElLV0M1T1pIOEw1aFcrOFRrcU5ZUzhpMnFNaXdMaW00bng1c2JpUmc3VVdx?=
 =?utf-8?Q?McrH/bV0RXIfnFOXKeWPPiTKu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfda5261-4595-48f0-0a90-08dbbff318e5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:18:22.0098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0oxxg3k/dNKwDq0kzhsXNJF99TL+zfgCP4tLJDeQsm6mv1bfDASCdw8PWZol43DzwLGGZHBYq9f2KgZ5TDbkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

Switch to using map_guest_area(). Noteworthy differences from
map_vcpu_info():
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region,
- the error code for an attempt to re-register the area is now -EBUSY,
- we could in principle permit de-registration when no area was
  previously registered (which would permit "probing", if necessary for
  anything).

Note that this eliminates a bug in copy_vcpu_settings(): The function
did allocate a new page regardless of the GFN already having a mapping,
thus in particular breaking the case of two vCPU-s having their info
areas on the same page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: I'm not really certain whether the preliminary check (ahead of
     calling map_guest_area()) is worthwhile to have.
---
v4: Re-base over changes earlier in the series.
v2: Re-base over changes earlier in the series. Properly enforce no re-
    registration. Avoid several casts by introducing local variables.

--- a/xen/arch/x86/include/asm/shared.h
+++ b/xen/arch/x86/include/asm/shared.h
@@ -26,17 +26,20 @@ static inline void arch_set_##field(stru
 #define GET_SET_VCPU(type, field)                               \
 static inline type arch_get_##field(const struct vcpu *v)       \
 {                                                               \
+    const vcpu_info_t *vi = v->vcpu_info_area.map;              \
+                                                                \
     return !has_32bit_shinfo(v->domain) ?                       \
-           v->vcpu_info->native.arch.field :                    \
-           v->vcpu_info->compat.arch.field;                     \
+           vi->native.arch.field : vi->compat.arch.field;       \
 }                                                               \
 static inline void arch_set_##field(struct vcpu *v,             \
                                     type val)                   \
 {                                                               \
+    vcpu_info_t *vi = v->vcpu_info_area.map;                    \
+                                                                \
     if ( !has_32bit_shinfo(v->domain) )                         \
-        v->vcpu_info->native.arch.field = val;                  \
+        vi->native.arch.field = val;                            \
     else                                                        \
-        v->vcpu_info->compat.arch.field = val;                  \
+        vi->compat.arch.field = val;                            \
 }
 
 #else
@@ -57,12 +60,16 @@ static inline void arch_set_##field(stru
 #define GET_SET_VCPU(type, field)                           \
 static inline type arch_get_##field(const struct vcpu *v)   \
 {                                                           \
-    return v->vcpu_info->arch.field;                        \
+    const vcpu_info_t *vi = v->vcpu_info_area.map;          \
+                                                            \
+    return vi->arch.field;                                  \
 }                                                           \
 static inline void arch_set_##field(struct vcpu *v,         \
                                     type val)               \
 {                                                           \
-    v->vcpu_info->arch.field = val;                         \
+    vcpu_info_t *vi = v->vcpu_info_area.map;                \
+                                                            \
+    vi->arch.field = val;                                   \
 }
 
 #endif
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1749,53 +1749,24 @@ static int copy_vpmu(struct vcpu *d_vcpu
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
-    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     int ret = -EINVAL;
 
     for ( i = 0; i < cd->max_vcpus; i++ )
     {
         struct vcpu *d_vcpu = d->vcpu[i];
         struct vcpu *cd_vcpu = cd->vcpu[i];
-        mfn_t vcpu_info_mfn;
 
         if ( !d_vcpu || !cd_vcpu )
             continue;
 
-        /* Copy & map in the vcpu_info page if the guest uses one */
-        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
-        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
-        {
-            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
-
-            /* Allocate & map the page for it if it hasn't been already */
-            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
-            {
-                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
-                unsigned long gfn_l = gfn_x(gfn);
-                struct page_info *page;
-
-                if ( !(page = alloc_domheap_page(cd, 0)) )
-                    return -ENOMEM;
-
-                new_vcpu_info_mfn = page_to_mfn(page);
-                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
-
-                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
-                                     PAGE_ORDER_4K, p2m_ram_rw,
-                                     p2m->default_access, -1);
-                if ( ret )
-                    return ret;
-
-                ret = map_vcpu_info(cd_vcpu, gfn_l,
-                                    PAGE_OFFSET(d_vcpu->vcpu_info));
-                if ( ret )
-                    return ret;
-            }
-
-            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
-        }
-
-        /* Same for the (physically registered) runstate and time info areas. */
+        /*
+         * Copy and map the vcpu_info page and the (physically registered)
+         * runstate and time info areas.
+         */
+        ret = copy_guest_area(&cd_vcpu->vcpu_info_area,
+                              &d_vcpu->vcpu_info_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
         ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
                               &d_vcpu->runstate_guest_area, cd_vcpu, d);
         if ( ret )
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -383,7 +383,7 @@ int pv_shim_shutdown(uint8_t reason)
     for_each_vcpu ( d, v )
     {
         /* Unmap guest vcpu_info page and runstate/time areas. */
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
         unmap_guest_area(v, &v->arch.time_guest_area);
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1542,7 +1542,7 @@ static void __update_vcpu_system_time(st
     struct vcpu_time_info *u = &vcpu_info(v, time), _u;
     const struct domain *d = v->domain;
 
-    if ( v->vcpu_info == NULL )
+    if ( !v->vcpu_info_area.map )
         return;
 
     collect_time_info(v, &_u);
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -53,7 +53,7 @@ void __dummy__(void)
 
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
-    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info);
+    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
     OFFSET(VCPU_trap_bounce, struct vcpu, arch.pv.trap_bounce);
     OFFSET(VCPU_thread_flags, struct vcpu, arch.flags);
     OFFSET(VCPU_event_addr, struct vcpu, arch.pv.event_callback_eip);
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -96,7 +96,7 @@ static void _show_registers(
     if ( context == CTXT_hypervisor )
         printk(" %pS", _p(regs->rip));
     printk("\nRFLAGS: %016lx   ", regs->rflags);
-    if ( (context == CTXT_pv_guest) && v && v->vcpu_info )
+    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
         printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
     printk("CONTEXT: %s", context_names[context]);
     if ( v && !is_idle_vcpu(v) )
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -49,7 +49,7 @@ int compat_common_vcpu_op(int cmd, struc
     {
     case VCPUOP_initialise:
     {
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
 #ifdef CONFIG_HVM
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu
 {
     struct domain *d = v->domain;
 
-    v->vcpu_info = ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
-                    ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-                    : &dummy_vcpu_info);
-    v->vcpu_info_mfn = INVALID_MFN;
+    v->vcpu_info_area.map =
+        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+         : &dummy_vcpu_info);
 }
 
 static void vmtrace_free_buffer(struct vcpu *v)
@@ -993,7 +993,7 @@ int domain_kill(struct domain *d)
             return -ERESTART;
         for_each_vcpu ( d, v )
         {
-            unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->vcpu_info_area);
             unmap_guest_area(v, &v->runstate_guest_area);
         }
         d->is_dying = DOMDYING_dead;
@@ -1448,7 +1448,7 @@ int domain_soft_reset(struct domain *d,
     for_each_vcpu ( d, v )
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
     }
 
@@ -1496,111 +1496,6 @@ int vcpu_reset(struct vcpu *v)
     return rc;
 }
 
-/*
- * Map a guest page in and point the vcpu_info pointer at it.  This
- * makes sure that the vcpu_info is always pointing at a valid piece
- * of memory, and it sets a pending event to make sure that a pending
- * event doesn't get missed.
- */
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset)
-{
-    struct domain *d = v->domain;
-    void *mapping;
-    vcpu_info_t *new_info;
-    struct page_info *page;
-    unsigned int align;
-
-    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
-        return -ENXIO;
-
-#ifdef CONFIG_COMPAT
-    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
-    if ( has_32bit_shinfo(d) )
-        align = alignof(new_info->compat);
-    else
-#endif
-        align = alignof(*new_info);
-    if ( offset & (align - 1) )
-        return -ENXIO;
-
-    if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
-        return -EINVAL;
-
-    /* Run this command on yourself or on other offline VCPUS. */
-    if ( (v != current) && !(v->pause_flags & VPF_down) )
-        return -EINVAL;
-
-    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
-    if ( !page )
-        return -EINVAL;
-
-    if ( !get_page_type(page, PGT_writable_page) )
-    {
-        put_page(page);
-        return -EINVAL;
-    }
-
-    mapping = __map_domain_page_global(page);
-    if ( mapping == NULL )
-    {
-        put_page_and_type(page);
-        return -ENOMEM;
-    }
-
-    new_info = (vcpu_info_t *)(mapping + offset);
-
-    if ( v->vcpu_info == &dummy_vcpu_info )
-    {
-        memset(new_info, 0, sizeof(*new_info));
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        __vcpu_info(v, new_info, evtchn_upcall_mask) = 1;
-#endif
-    }
-    else
-    {
-        memcpy(new_info, v->vcpu_info, sizeof(*new_info));
-    }
-
-    v->vcpu_info = new_info;
-    v->vcpu_info_mfn = page_to_mfn(page);
-
-    /* Set new vcpu_info pointer /before/ setting pending flags. */
-    smp_wmb();
-
-    /*
-     * Mark everything as being pending just to make sure nothing gets
-     * lost.  The domain will get a spurious event, but it can cope.
-     */
-#ifdef CONFIG_COMPAT
-    if ( !has_32bit_shinfo(d) )
-        write_atomic(&new_info->native.evtchn_pending_sel, ~0);
-    else
-#endif
-        write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
-    vcpu_mark_events_pending(v);
-
-    return 0;
-}
-
-/*
- * Unmap the vcpu info page if the guest decided to place it somewhere
- * else. This is used from domain_kill() and domain_soft_reset().
- */
-void unmap_vcpu_info(struct vcpu *v)
-{
-    mfn_t mfn = v->vcpu_info_mfn;
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return;
-
-    unmap_domain_page_global((void *)
-                             ((unsigned long)v->vcpu_info & PAGE_MASK));
-
-    vcpu_info_reset(v); /* NB: Clobbers v->vcpu_info_mfn */
-
-    put_page_and_type(mfn_to_page(mfn));
-}
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
@@ -1662,14 +1557,44 @@ int map_guest_area(struct vcpu *v, paddr
 
     domain_lock(d);
 
-    if ( map && populate )
-        populate(map, v);
+    /* No re-registration of the vCPU info area. */
+    if ( area != &v->vcpu_info_area || !area->pg )
+    {
+        if ( map && populate )
+            populate(map, v);
 
-    SWAP(area->pg, pg);
-    SWAP(area->map, map);
+        SWAP(area->pg, pg);
+        SWAP(area->map, map);
+    }
+    else
+        rc = -EBUSY;
 
     domain_unlock(d);
 
+    /* Set pending flags /after/ new vcpu_info pointer was set. */
+    if ( area == &v->vcpu_info_area && !rc )
+    {
+        /*
+         * Mark everything as being pending just to make sure nothing gets
+         * lost.  The domain will get a spurious event, but it can cope.
+         */
+#ifdef CONFIG_COMPAT
+        if ( !has_32bit_shinfo(d) )
+        {
+            vcpu_info_t *info = area->map;
+
+            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
+            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
+            write_atomic(&info->native.evtchn_pending_sel, ~0);
+        }
+        else
+#endif
+            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
+        vcpu_mark_events_pending(v);
+
+        force_update_vcpu_system_time(v);
+    }
+
     if ( v != current )
         vcpu_unpause(v);
 
@@ -1699,7 +1624,10 @@ void unmap_guest_area(struct vcpu *v, st
 
     domain_lock(d);
     map = area->map;
-    area->map = NULL;
+    if ( area == &v->vcpu_info_area )
+        vcpu_info_reset(v);
+    else
+        area->map = NULL;
     pg = area->pg;
     area->pg = NULL;
     domain_unlock(d);
@@ -1830,6 +1758,27 @@ bool update_runstate_area(struct vcpu *v
     return rc;
 }
 
+/*
+ * This makes sure that the vcpu_info is always pointing at a valid piece of
+ * memory, and it sets a pending event to make sure that a pending event
+ * doesn't get missed.
+ */
+static void cf_check
+vcpu_info_populate(void *map, struct vcpu *v)
+{
+    vcpu_info_t *info = map;
+
+    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
+    {
+        memset(info, 0, sizeof(*info));
+#ifdef XEN_HAVE_PV_UPCALL_MASK
+        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
+#endif
+    }
+    else
+        memcpy(info, v->vcpu_info_area.map, sizeof(*info));
+}
+
 static void cf_check
 runstate_area_populate(void *map, struct vcpu *v)
 {
@@ -1859,7 +1808,7 @@ long common_vcpu_op(int cmd, struct vcpu
     switch ( cmd )
     {
     case VCPUOP_initialise:
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
         rc = arch_initialise_vcpu(v, arg);
@@ -1990,16 +1939,29 @@ long common_vcpu_op(int cmd, struct vcpu
     case VCPUOP_register_vcpu_info:
     {
         struct vcpu_register_vcpu_info info;
+        paddr_t gaddr;
 
         rc = -EFAULT;
         if ( copy_from_guest(&info, arg, 1) )
             break;
 
-        domain_lock(d);
-        rc = map_vcpu_info(v, info.mfn, info.offset);
-        domain_unlock(d);
+        rc = -EINVAL;
+        gaddr = gfn_to_gaddr(_gfn(info.mfn)) + info.offset;
+        if ( !~gaddr ||
+             gfn_x(gaddr_to_gfn(gaddr)) != info.mfn )
+            break;
 
-        force_update_vcpu_system_time(v);
+        /* Preliminary check only; see map_guest_area(). */
+        rc = -EBUSY;
+        if ( v->vcpu_info_area.pg )
+            break;
+
+        /* See the BUILD_BUG_ON() in vcpu_info_populate(). */
+        rc = map_guest_area(v, gaddr, sizeof(vcpu_info_t),
+                            &v->vcpu_info_area, vcpu_info_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
 
         break;
     }
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -80,9 +80,6 @@ void cf_check free_pirq_struct(void *);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
-void unmap_vcpu_info(struct vcpu *v);
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v));
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -176,7 +176,7 @@ struct vcpu
 
     int              processor;
 
-    vcpu_info_t     *vcpu_info;
+    struct guest_area vcpu_info_area;
 
     struct domain   *domain;
 
@@ -289,9 +289,6 @@ struct vcpu
 
     struct waitqueue_vcpu *waitqueue_vcpu;
 
-    /* Guest-specified relocation of vcpu_info. */
-    mfn_t            vcpu_info_mfn;
-
     struct evtchn_fifo_vcpu *evtchn_fifo;
 
     /* vPCI per-vCPU area, used to store data for long running operations. */
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -44,6 +44,7 @@ typedef struct vcpu_info vcpu_info_t;
 extern vcpu_info_t dummy_vcpu_info;
 
 #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
-#define vcpu_info(v, field)        __vcpu_info(v, (v)->vcpu_info, field)
+#define vcpu_info(v, field)        \
+        __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
 #endif /* __XEN_SHARED_H__ */


