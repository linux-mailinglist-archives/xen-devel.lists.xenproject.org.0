Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6366D665D28
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475378.737069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbbR-0008Nq-4d; Wed, 11 Jan 2023 13:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475378.737069; Wed, 11 Jan 2023 13:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbbR-0008LF-0Y; Wed, 11 Jan 2023 13:57:17 +0000
Received: by outflank-mailman (input) for mailman id 475378;
 Wed, 11 Jan 2023 13:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbbP-0008Kv-Ik
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:57:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2046.outbound.protection.outlook.com [40.107.6.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d904d9cd-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:57:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8073.eurprd04.prod.outlook.com (2603:10a6:10:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:57:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:57:10 +0000
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
X-Inumbo-ID: d904d9cd-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkxdgB88KE20zyOORVTy4RosbNtgrxGjpkEM4pysQbT6Xyuok9jeYshiM5nlk1quYhhnR/AfPYh+iLgpZESwSSe0eTOtGfz+cEimMVJEnSRjIy8t4wAMp+z0OgQDDLOAk2vDr7NRSa/MfljoqUB/7I8Wj8LPHO9PPvFd3N35vkppXmRQPNURGKz7m4SbjKz4CTvW0RlHD58+Ye1QaR2uSdszSG3RpNUpWF6P8/BKJanme3WMkc171FwXK90CDfktz08xJj30uslkkx1cedVju1E082c5NVM8hPnvwj5Ea5y1OXOQbhfeEVP3gIryZ1YINutue9mRIb54p6mkPL5Oaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uJicMk7KMO3J5OufWXUur+3R2HmbLQ7mvJAVkX8lh8=;
 b=oMaoI6rCBCF4h4BIMNx5AZVZaysitmIpl4TslSq3cA9CRJuaJGk2K1hpEbet1TY6Ww2SYu4QXKUkA8994sbkVYCBbCQFi0rK1ye6W9Mzk77h9zpO3zWFx97KSDdl1Pl5KDOz4JTuc0REUnlkhA9ir0NGxThmGwGYIGPW2Mdjz8qA6bhXKvM3OPj9IojyY2iCHBbrSj9LxCxVPeHBCfPeJjczUozxgUjNHSPAzEESz61nk7sKAXviTYM9xjOv0HabjZV5+okcXg7pouU6IBDkY+SD9tkhq5jtvCs/KeRhxqyeQy1PHp27dsfzb2j8EE457wduSTwBHauezRNEYUPGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uJicMk7KMO3J5OufWXUur+3R2HmbLQ7mvJAVkX8lh8=;
 b=nqmqe3S8mTfCKPnKooPJn3xO7qpQ2zgZehLK8bKuRblnamQ4eY2+ube8v+U3MCnVCpySm83FwL4HNEW/bJ4adUvaIhvHGOBeCTp44bBSsjd/zslBzK2UfljntcWeVIgjz3n08Xaqmd2T3Kei62q1umZ0ypAILWfY0E9+KlIhRviEbqBmewGlaLmPPd4CkLEIwlk84SbPtN15FQkxjjoqP7CGvu0uG13ZDvi2zr/lgOfpkW+SZc4Y1BxOLd46s6lpYBAOTcEUhettJzN6waR0HjTlSXy9HD8IQdQX985Qz1E0AV9RiFFuB0yrAvBs/XBdzAMyL+/NQW7V22i1bwb/RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ed7a628-f64e-5512-efdb-4116a7b88a1d@suse.com>
Date: Wed, 11 Jan 2023 14:57:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 8/9] x86/shadow: call sh_detach_old_tables() directly
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e7719b-0f12-4f63-25a1-08daf3dbbbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZgIDrbmRswtSGvu6MoAAcu7vvOSz/wPQRTry08dJSX3634u1ry+j3My45I9rbrN8h+cYbw+JkOoE7FEvS5jcIwWc9vdviTyT+9+oBWj6XV3Ngbc5fq7EqluLonco25s3apsYZ4jO1BvXC/DjH62lpQ7QSJfA02D1axIsluS17jXRnPwsA/XDrrQSCANTsKcMCavjfaJwcZBoQGHtNtXB/DOw42bwMAi3/7GZ8q5zIalYF9ENQUwJqyiIp/Ed+HmrbFc9B9hbjQIyHSaXlcfOV+vGc20a1uOzJKJCRknaQvFLWKj4NYXL2jIKuAZaeg5eW4mQ2J+huNtXdS/saTeGUQr99gTSwNRBZ3pFz3LMi1/R3vbO6g1Bs/pI+3o99sHJsL6qqojXUTribFiZh+R7XMmOpZ5LiukOcmnmeqIKKSe34M/owp1EizLyrc6kAnQVLl8NcjCcOQaBDwxUfMpazEHJytXzaWjuTgXFQFZVa/21R1zDEqZA9Bfd0ykzgUwfxGNVqItNQPWb/GKX0e8D4zZhESYo7ipJ5wheM3OlybAwo2+kv0tu4De48TsehZBRWg9SCoOywZUbRSeCuTx2OI3l3kFVfimbs5DRvd7rTyelb+6aM3GHUYricboHX+yXgQuE2OnYvD9K99xCejeVOP0E3LEfUJ8/NcIgnzcVkVgzi2yHUFyH+eL+yqmyPzr3eNTPNA/yU3xdS8SlEo4yoZuEu3k9tIhnQlmWlCvj8tY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(8676002)(66946007)(66899015)(31686004)(41300700001)(2906002)(8936002)(5660300002)(36756003)(6916009)(66476007)(316002)(6512007)(66556008)(54906003)(478600001)(6486002)(6506007)(4326008)(26005)(186003)(2616005)(31696002)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZktyME1BTHMycXhOSTJtSTJvNXdzYnhmSWc5WlhxTlBZQzFrTE8wMzVwRWFl?=
 =?utf-8?B?d0NtaU9JOGRmV05DZTh6OEdSdmVIQmwyeFUvVnkxY0piSmZPQStXcnlFUnkr?=
 =?utf-8?B?cFNTcGVCY2drUVNnN2pEWUlWRU1wYmxCNnM5NndMUFcrTE9Va2VzTnNVa3lE?=
 =?utf-8?B?aVIwUUkxQ1RMdkhtOGhzUXZ1OFhzZ3NkaHJ2Y0MxM2kyZTA2QWprVG9VZS9v?=
 =?utf-8?B?NGh5YnJmcy9hREdGNG5SOWl5M214UDNNL2ZjazhXZEZKR3pMV0JJNklCNjU3?=
 =?utf-8?B?cDBIYUZpWmU2Skw3Q1NnYmFnOU5HOTRKM01mSDMxbzQ0eXNuY3A4VUZ4cFBz?=
 =?utf-8?B?Umc1NWdsU21PU09ONWE1dGdpVm1MOXpXSHEwMUx0QjVyMEtVSlFHT1JOQ1Fj?=
 =?utf-8?B?LzlIK0hZb2FYRWVXVTRkSlJqTWdPSnpFcUZteEp1dGNyZXVUajl3SlhCWHlh?=
 =?utf-8?B?S0JvOGZLM0Z4bllURUUrUTRGbmxUMC9YalhTWktjVUlMRldpMUVET3VTR3NE?=
 =?utf-8?B?dmdkZXFwMlI1a2d1UTF5RngwNklmUlV3eUhEWVN0UTlMTEtEdFc3TStURHRQ?=
 =?utf-8?B?dWdReWdWeXVaQlZxY21GM1ZMd2JrNFlpU0pkSTdRcC9aM0lsNnNINysvVUJo?=
 =?utf-8?B?WEI0ZFpnbHVJT204d29LekpGZVdCaHp3WmdNRUdEMXdrSDZoYWZCNnVPV3Ev?=
 =?utf-8?B?Z09DejlGWHRZOVl2ZlFkbXViMHh3N0cxaDlSQlV1ZElTSis4ZTdZRHJ3TGl3?=
 =?utf-8?B?amU3bUNYZHJIMzFIN1NpRE13Z29NbHNLTzVlbkg5Z3o0NTNXN2R4NVViekxh?=
 =?utf-8?B?MzhCM0VKM1hOWVQ3WkVrSzlseGtrQzJOc1g4dWxYbzI2aXJxVVVudjU5QzZB?=
 =?utf-8?B?a3JaSkM4RURYcm9mR3o1UFpaNFVQZ2Q4QnRqbGZwQko0Z0RGSEZOZ0VDUlVq?=
 =?utf-8?B?N05jSG1DWUZ1djg0dDNiNlpmSEVvK3h0dVdzTGUzK1ZmTG0zYTl2eXJwc3pV?=
 =?utf-8?B?OEdsSVVmcy9kVTFiTGh3L3Q5UW9OcW5ReGY3UWd1Szl0QWdHaDJUSkNDa0Z5?=
 =?utf-8?B?bVBHd0NzWVJ4NXZ2L0phWXNTdExBMW9aOE13Nkplc2lrMVROOGRKajNCUTZB?=
 =?utf-8?B?R3BEZjdpZFJhcklDM0hzdUpCRkhZSytLSzZ2NWFnNWdyYWx6b0VHQUIvOW1R?=
 =?utf-8?B?VHR5OVhVZ0JMdGRKTGQ5cTJFVEJYWjFvTVE2Qk5EWTNnR0svUjdTRzVER1Yr?=
 =?utf-8?B?TCtQWms0Q3FVUVY0VitJUXAwNlVvUFQrL1JuWktNaG9SbHRPbkoyL2wrQW54?=
 =?utf-8?B?Qm9DQkFvWEtzOWNaYVV2Z25DYVZhVm8xcXFlaW95TGtyQXdtYzFOUnd0cHQy?=
 =?utf-8?B?TSt5bjNVMk1KN2hUaithMGE2WU9vRVpucElHb21JbGxHT1FUSXRSVzZlMXIr?=
 =?utf-8?B?b3JZM1pIdk9MNytyQzNhWDNwZnFzOUZCa09FcUxaODFnQTVoN29JNmlKUGJl?=
 =?utf-8?B?UDJJUUtCN2RycWNSRndKSmJaWmYyNkt3VFBta3hOQlF5V0FLZW9ST2JGbDMx?=
 =?utf-8?B?V3ZGRUQ0WHBlaXQ0ZFBkeDRQL2Q4OHlOeUlSemxlM1kxRzMvSUZRYXUrRkdi?=
 =?utf-8?B?ZFRLYlRBZUNsZVRkU2ZzQVkrYTVZNWhIVVR2bTNNNDBzSzVxVXJRcTltOE94?=
 =?utf-8?B?RjNCY3ZuOERUVnptR2VLYW1qdmUwVU1zUVQzN1VHK0JyRTlmOTVlZlZyd3Na?=
 =?utf-8?B?RzVTZFRXMnp5M0VRb0pTZGdENG5saEs3MFFDa1UrYitWWStoU2g5bU9sRDV3?=
 =?utf-8?B?VEx3cUhnbXZ3bnNkclJlZG1xbVdWU1hETlU3S3ptOENDVEhFSWVEeG1xbUFp?=
 =?utf-8?B?OTFPaDhUTlUyei8yWjdXdnZOWHdBemVEeG90N3M2cmVZZ0FVZkNlL05Ic2VG?=
 =?utf-8?B?bm1aVTEwRXBEbTBkeEhBTnI4RW1pbHpYVFo5RkxpaVorZ3Z3RHRsaWFJSFNx?=
 =?utf-8?B?Qzk1ZGUyWmdFNkZEaXJEREFpazRyZjJiNEZiRmpuUDZpczg4K3JBWUxWbWt4?=
 =?utf-8?B?dGE3UVVuTjV2SXgvUjhkT1pCZW1aSWFMd2ZSOGROUVhyVlhacWQ2VHFxbFdv?=
 =?utf-8?Q?rlnuLGjl/kkkMqVKnBFdTycSf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e7719b-0f12-4f63-25a1-08daf3dbbbb0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:57:09.9710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Vq5kjVN7hzmzI0kfPp2Xo60nZXLZRWRwkdQFhwAZ+gM4VOpt2VsS7kUEHIVAUs+Jf4so/fkWL3tyupUAX3Z7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8073

There's nothing really mode specific in this function anymore (the
varying number of valid entries in v->arch.paging.shadow.shadow_table[]
is dealt with fine by the zero check, and we have other similar cases of
iterating through the full array in common.c), and hence there's neither
a need to have multiple instances of it, nor does it need calling
through a function pointer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I've retained the C++-style comment in the function as this style is
used elsewhere as well in shadow code. I wouldn't mind changing the
comment to conform to ./CODING_STYLE.
---
v2: New.

--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -98,7 +98,6 @@
 
 struct shadow_paging_mode {
 #ifdef CONFIG_SHADOW_PAGING
-    void          (*detach_old_tables     )(struct vcpu *v);
 #ifdef CONFIG_PV
     void          (*write_guest_entry     )(struct vcpu *v, intpte_t *p,
                                             intpte_t new, mfn_t gmfn);
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2264,6 +2264,29 @@ void shadow_prepare_page_type_change(str
     shadow_remove_all_shadows(d, page_to_mfn(page));
 }
 
+/*
+ * Removes v->arch.paging.shadow.shadow_table[].
+ * Does all appropriate management/bookkeeping/refcounting/etc...
+ */
+static void sh_detach_old_tables(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    unsigned int i;
+
+    ////
+    //// vcpu->arch.paging.shadow.shadow_table[]
+    ////
+
+    for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); ++i )
+    {
+        mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]);
+
+        if ( mfn_x(smfn) )
+            sh_put_ref(d, smfn, 0);
+        v->arch.paging.shadow.shadow_table[i] = pagetable_null();
+    }
+}
+
 /**************************************************************************/
 
 static void sh_update_paging_modes(struct vcpu *v)
@@ -2312,7 +2335,7 @@ static void sh_update_paging_modes(struc
     // First, tear down any old shadow tables held by this vcpu.
     //
     if ( v->arch.paging.mode )
-        v->arch.paging.mode->shadow.detach_old_tables(v);
+        sh_detach_old_tables(v);
 
 #ifdef CONFIG_HVM
     if ( is_hvm_domain(d) )
@@ -2700,7 +2723,7 @@ void shadow_vcpu_teardown(struct vcpu *v
     if ( !paging_mode_shadow(d) || !v->arch.paging.mode )
         goto out;
 
-    v->arch.paging.mode->shadow.detach_old_tables(v);
+    sh_detach_old_tables(v);
 #ifdef CONFIG_HVM
     if ( shadow_mode_external(d) )
     {
@@ -2935,7 +2958,7 @@ static int shadow_one_bit_disable(struct
         for_each_vcpu(d, v)
         {
             if ( v->arch.paging.mode )
-                v->arch.paging.mode->shadow.detach_old_tables(v);
+                sh_detach_old_tables(v);
             if ( !(v->arch.flags & TF_kernel_mode) )
                 make_cr3(v, pagetable_get_mfn(v->arch.guest_table_user));
             else
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3207,30 +3207,6 @@ sh_update_linear_entries(struct vcpu *v)
     sh_flush_local(d);
 }
 
-
-/*
- * Removes v->arch.paging.shadow.shadow_table[].
- * Does all appropriate management/bookkeeping/refcounting/etc...
- */
-static void cf_check sh_detach_old_tables(struct vcpu *v)
-{
-    struct domain *d = v->domain;
-    mfn_t smfn;
-    unsigned int i;
-
-    ////
-    //// vcpu->arch.paging.shadow.shadow_table[]
-    ////
-
-    for_each_shadow_table(v, i)
-    {
-        smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]);
-        if ( mfn_x(smfn) )
-            sh_put_ref(d, smfn, 0);
-        v->arch.paging.shadow.shadow_table[i] = pagetable_null();
-    }
-}
-
 static void cf_check sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
 /* Updates vcpu->arch.cr3 after the guest has changed CR3.
  * Paravirtual guests should set v->arch.guest_table (and guest_table_user,
@@ -4211,7 +4187,6 @@ const struct paging_mode sh_paging_mode
     .update_paging_modes           = shadow_update_paging_modes,
     .flush_tlb                     = shadow_flush_tlb,
     .guest_levels                  = GUEST_PAGING_LEVELS,
-    .shadow.detach_old_tables      = sh_detach_old_tables,
 #ifdef CONFIG_PV
     .shadow.write_guest_entry      = sh_write_guest_entry,
     .shadow.cmpxchg_guest_entry    = sh_cmpxchg_guest_entry,
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -236,7 +236,6 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define sh_unhook_pae_mappings     INTERNAL_NAME(sh_unhook_pae_mappings)
 #define sh_unhook_64b_mappings     INTERNAL_NAME(sh_unhook_64b_mappings)
 #define sh_paging_mode             INTERNAL_NAME(sh_paging_mode)
-#define sh_detach_old_tables       INTERNAL_NAME(sh_detach_old_tables)
 #define sh_audit_l1_table          INTERNAL_NAME(sh_audit_l1_table)
 #define sh_audit_fl1_table         INTERNAL_NAME(sh_audit_fl1_table)
 #define sh_audit_l2_table          INTERNAL_NAME(sh_audit_l2_table)


