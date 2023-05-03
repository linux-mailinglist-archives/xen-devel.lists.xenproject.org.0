Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B576F5BAA
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529346.823690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEsG-0006CM-MR; Wed, 03 May 2023 15:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529346.823690; Wed, 03 May 2023 15:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEsG-00069o-J0; Wed, 03 May 2023 15:58:36 +0000
Received: by outflank-mailman (input) for mailman id 529346;
 Wed, 03 May 2023 15:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEsF-0004ZO-F4
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:58:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b68b310-e9cb-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:58:34 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:58:32 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:58:32 +0000
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
X-Inumbo-ID: 5b68b310-e9cb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bd50JmvKVslpnn3Ed/ZBvSBw54hpjdTregOxwQUs0Xed+evjNrY0L5b5PNLDvoVEsTfg+1f22sXAkJGlPNqyawclBnJOnuo5N7WSK31c1DzxkgzesPk0um0V5dVvMOwEnfv2np5gISrxQkT7RDg0u12y7pA82GkynF5E+BkYjX/0Tfumxuwo5BCOEqSqqKAspkhHrU9u3uqwe24mnK1O0cBmPOdf9FTbYc2/YlLE6V4OALi2cP6pL6SOeQpp4iVxqK16ooY3ZXcn42ilEXHhYVUq+ROaSqEbvHXVAKmj8WK4GA0ACriC8zXoBTHdWFovK7THFj6xPq3nE8TnXEGk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0sX7Qef0nkvc/rC96yOb8shBC/hUhR66PShSaviz8s=;
 b=CU//CzaPs5F3r/iQZE8U1AMY7xIkMw6C9vqo2MPFPiCaC0FTo0b6dHF954rsPSW+tam8LNTYcMZ28kXEwzLa9x4hugHbyp89GH7Zyv2d3J+z7n7VrARQ8kcc21hTnz2xhL2WKIyJm3p5AwSHoeryG2UUhVBF1nQjTRAfupCzbnd+FHutNsBswF/4KlCMA30r7cvZyWzdKW4SoWts+6tr+uUt13B8mraDKNfZHGdfrQYFo1VP5/l/AHLVgS61QrcooHWnBHKEj7NdLdp7PCHiaJau0oxAcSOPMlCsqYENySyagX3hQYmL47MtUs+hEXEHoPb5cKGvxmLRt3XLOzhGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0sX7Qef0nkvc/rC96yOb8shBC/hUhR66PShSaviz8s=;
 b=DWFubvPfRH5sAPn18sEAXiebzjuhtdxWkNQ0fOMc1mlHloNUI4zFbPXUHPYfphnkiHj/y++Eu3d9oU0LVOQAA33brDgLwlMhJ83dSJ/maLQ7Wy5hAVybk0KDKIAPOyTnWfArbI4kdvvaavp4J3PSnCFvFDZMljU9YzkxLAH2AllQ37+HUORb/gZXkxSuJ1A8yl9wjMczTdoVtPlrmBSSi0udFqTLmkOJcklg/ryURfyfzzVSC88kulxOij4kY5f12q2tyHGPSfk0rhMF+VOEgI5uyKe/uP97afxzm0jfejbNEiGKXpTsN/Dkr8BfOR8odX5ehyRvEZ9GGf0iTcND2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ada41793-629b-3864-c2fc-412bd8d0047d@suse.com>
Date: Wed, 3 May 2023 17:58:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 8/8] common: convert vCPU info area registration
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0b7847-74f1-44e7-d870-08db4bef3e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6bqDp2ARKnRgO1KHKF1evwJDNuv6wPzdDaycrBO9whT8bkj3YRMep1PLeEASJFg+29aaEbwnDPBFfB7SNCXwJt137bt8wPS23Sngs91oQ/DwY7Lx7iTzv/Q8acWkx3J31HKeGYQvPhM4h77osqOThjk5VxP/wk8ziwR0ehXWyP92VQ8WWvB9H6wzJesE0YREK0xOMbd73z4shn8mIT8C14XL43BzwqBVS0vxwdd9PqBg4ptocd2W/kjYNmppNotRGVRkMLB+qpH6HDebtfBynNxHEKCnJz4RKnd2YNZSkx1yU1EjXXo+wb7IxVP2NmH2NDhBMrhDgtgFYlY4uH5ydxcmL++hCBD7XjLoxuSV6olhgEyJlZ0Xp2RfJs6v7z3yxnGbHzXnwBoHQrGBKBGvx4DWW7nix0BYtZ8C4YS3jduqyRbXeZFqfp8EXjYagivVsFgEKegM46zkImUZfb+8ZQjmxzSpYbkspqoP9/66hh2zn/XxG+rdEKxLt0TMqE9ysc9RJLKKQXqVFjCwKcVwqTQ1R22bK7jR9p2nStAayiMq7CXPGNtdaK6/axwrnJwGqqgQ/yfH+HckoWN1PQ1fWWJhxws5JBiBYxyh9tQigeIhslg0H6zTgy+nMDMLC5ZmuYkGPDLuK4GGLxii9rkKZq+MI+3Ij51WxRK6Iy1/6fkP8zkir1Je3bARx/Le0UH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(30864003)(2906002)(38100700002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6512007)(26005)(6506007)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(316002)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M09RTzZheWFyMU1Uby91OW5wOEJobmdTcVNEeFkwa21TdFBheHNvaFlNRVVw?=
 =?utf-8?B?Z2lUNW1QUUl6R3VtSHZJYjFJSzFxdUUwMTdpOUV5bFhrWC8vQXcvaHVJUUZu?=
 =?utf-8?B?UmVJTGFOZUx4VXJBcWJwcmVjQkRzUVc4aVdjajdEdkVyQ1J4ZlJaL3dqWVdj?=
 =?utf-8?B?Rm9WSmRKSDRmTnR3SGJjdDV3bnQzS1UxTGlxM0xrNUVWOTNkL3JQeEhLNy9a?=
 =?utf-8?B?Y3IvQVdNT1lrNFhJRStrTUU2Vzh3cDVJYVlxZzhlaStkQlUrU3NLRElsZ2RV?=
 =?utf-8?B?bW9Xa09kbzExa1AxaUJVOFEyV0VVSUhxZVdlampWbjNZR214TG1SaXpNQXdy?=
 =?utf-8?B?MDVyNDAxY1I4ckxSYW5Kc1lSbVVobXZ4akc0SXJiSDVIbkxBdml3bVZCUi9I?=
 =?utf-8?B?Q1RkMCtYRFhob09qTE9sNmNmbHdhWEVCcVRCYld1S0VmaUFmT3FTanQrMnFT?=
 =?utf-8?B?Z29ld1hXa1crc2VMMUdWZzFqNVNvUHN1d2ZPRHBETlFFZDE0bTY0ZnU4d0lo?=
 =?utf-8?B?UzlRazRESy92RzBPeDhpeEcrMWp5OUF6d0hkZS9pQXp2d2JqdHZreE9HWkY5?=
 =?utf-8?B?QXRDYUJKOUtLcE9YVnNUSUZMeHZpbGVnOHFVd2NCVEJ1RjhOcWRaMk1tMllW?=
 =?utf-8?B?Z0NnVHBycENXcnZRU0FkMXMyUU9ObVZ6OFdQZ1c1VUhQS1h3Wm5WYjhsekNK?=
 =?utf-8?B?aFlYWUpXQUt5NkVWQmExMmwxWkkyOHpsUlM5Q2k0b09HYjJESFlXamQzVWlp?=
 =?utf-8?B?UGFyWHc3RHBHTTU5bWE4WjhNaWw1Y2p0OS9neUFKUURzTkdvMlFoZFc4TjZZ?=
 =?utf-8?B?cWFKcHQ4d25NeHRYQ1MxcnJSUzdWdk80Mm9vTEtoamJIMWlheVlKNzZITk5R?=
 =?utf-8?B?c1ZVR2RjWk9wcm5ZeXl6UjBpODkvMC9veGI0WEx0K1d5cVZvSzEzdVcrNjV0?=
 =?utf-8?B?aW9RQklCYnM3b2M5MVNlcVdUanZ0NDZzbVJQTm56ZjZ3NXBkOGluZVBaWFJB?=
 =?utf-8?B?QkNtYTV1N0V0d290OEtRZm92WmZMSXFZRXREV3hrYVU1ZDh0cE45VXBaTUt2?=
 =?utf-8?B?VlBNMWRxMzBBU3pkdTI1bXBRZThscThySTF2ZklPL3ArNExCT2pQaUtqeDZS?=
 =?utf-8?B?RVNHdmZxMVRWTUlFUG10cmpmazlTMllPbVF0OTBRcUl1MG9ncFlob0hoMjBw?=
 =?utf-8?B?bktscWRvRk5ITUwrb3JJUVkwbU1LeGJyN0xWd2JUWjBpNkZteE5XaXUwdy9R?=
 =?utf-8?B?Ti9OSVE0RCtmckxiR2hJampjVG5YUUtTL2oxL0ludC9hMlBkQzluYW5vWjNl?=
 =?utf-8?B?UDBMU1hMTE1DeU9zL3pVREduckxoZk5xcEdtVzFYYmwwVzQ3TDhKemRsR3lF?=
 =?utf-8?B?bU5ZS3RDZytVWXZ4cGc0RVF4b2tZUkljUm94Q2s5NDJpcWZlcmQ0OWxIcVl1?=
 =?utf-8?B?QlNwTHlIN2Jza0R3dEUyeVVzYklXeFhQbzNPeTJRQ2RKVkRJOFhrVkN2TlRV?=
 =?utf-8?B?Y0ZsMVAzc3JQZFZIZmtRK1lpNTR3MTRRa0xEbzl5SW9Lc01mcnNGZjAwbUV1?=
 =?utf-8?B?SHR4TFBKK2lDNnVtMUFxOGhvcC9JZldVejIrd3N0bkQyL2M0NFRMRHFmcWt5?=
 =?utf-8?B?VGVCcGtoMWlwU0lQRjIxd1B2eTgwZktVcWhnQWVWeDNybmJZVlpTazFhSWtK?=
 =?utf-8?B?Q0lia2lHVDNRblA2VFgzSy9PK0hyaWFiN1Znblg5cFgzaVMyS01DTmJ1WHBU?=
 =?utf-8?B?eHJzVGRpbzREN0xqYzA4Q0tDK2ZEb0dTYXVIdGlxRmp0SndTL1ZPZC9oS1Fx?=
 =?utf-8?B?WmdTZUZDcWZkT2dHVVlEcm90eEJJTmw5cERSRXN3VC8zckJia3NZSWFXNVFi?=
 =?utf-8?B?V3J6Wk94NEsvNXpoSlhNYmFBOVAraEV6d3Y1NWdBUEZ3dXV4VS9lL1p4SkRr?=
 =?utf-8?B?WDA2N0dqYWFlUnA4M3ZvQm8xNy9YRFdaT2pwWGp2enZjVGVnVnlUUTVJZW9a?=
 =?utf-8?B?cmxyeWZyOTQrUm1CRWpKN1RJUys3RldSOTBMbHplTnZLSndNRTVIZVp4RWZX?=
 =?utf-8?B?bXczaWx5S05yMVVZbTE1Z01UZTFLaEc1ak8ycHJVNFJmRzhMbm5MejNHdit1?=
 =?utf-8?Q?SaLkKtnIDcYU8e4NL2vYmr6Im?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0b7847-74f1-44e7-d870-08db4bef3e6e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:58:32.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpwZDxQK+7PAdFMZA5LzTU1Vu1oU/aRCEhX5K9XUzBeFls2sjy0/H43+t0JqdyQ+3f5N7Bi9+6cjyeBJuQMR3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

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
@@ -1547,7 +1547,7 @@ static void __update_vcpu_system_time(st
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
@@ -964,7 +964,7 @@ int domain_kill(struct domain *d)
             return -ERESTART;
         for_each_vcpu ( d, v )
         {
-            unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->vcpu_info_area);
             unmap_guest_area(v, &v->runstate_guest_area);
         }
         d->is_dying = DOMDYING_dead;
@@ -1419,7 +1419,7 @@ int domain_soft_reset(struct domain *d,
     for_each_vcpu ( d, v )
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
     }
 
@@ -1467,111 +1467,6 @@ int vcpu_reset(struct vcpu *v)
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
@@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
 
     domain_lock(d);
 
-    if ( map )
-        populate(map, v);
+    /* No re-registration of the vCPU info area. */
+    if ( area != &v->vcpu_info_area || !area->pg )
+    {
+        if ( map )
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
 
@@ -1670,7 +1595,10 @@ void unmap_guest_area(struct vcpu *v, st
 
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
@@ -1801,6 +1729,27 @@ bool update_runstate_area(struct vcpu *v
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
@@ -1830,7 +1779,7 @@ long common_vcpu_op(int cmd, struct vcpu
     switch ( cmd )
     {
     case VCPUOP_initialise:
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
         rc = arch_initialise_vcpu(v, arg);
@@ -1961,16 +1910,29 @@ long common_vcpu_op(int cmd, struct vcpu
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
@@ -79,9 +79,6 @@ void cf_check free_pirq_struct(void *);
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
@@ -175,7 +175,7 @@ struct vcpu
 
     int              processor;
 
-    vcpu_info_t     *vcpu_info;
+    struct guest_area vcpu_info_area;
 
     struct domain   *domain;
 
@@ -288,9 +288,6 @@ struct vcpu
 
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


