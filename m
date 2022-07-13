Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E6572FAE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 09:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366259.596971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXAr-0008Mj-P5; Wed, 13 Jul 2022 07:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366259.596971; Wed, 13 Jul 2022 07:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXAr-0008KE-Ll; Wed, 13 Jul 2022 07:52:45 +0000
Received: by outflank-mailman (input) for mailman id 366259;
 Wed, 13 Jul 2022 07:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBXAr-0008K1-2C
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 07:52:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60075.outbound.protection.outlook.com [40.107.6.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a79953-0280-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 09:52:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4574.eurprd04.prod.outlook.com (2603:10a6:803:6f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 07:52:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 07:52:40 +0000
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
X-Inumbo-ID: c6a79953-0280-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idKraY9MTXwsb508N1TMlisKsOzDa2b0VTsx4zA7GZ/2SvMvwLzEdSujBw37KGumCOV+FprrVhpggPKviZ9Ag5K0FUwfep4c5rH9g+eCrqa3sQ+Ham7RHKnsYuONENQubw2fZv/FYoOvBTSjelZT0vVLivzQt2XODObe8YO5XR4lvZbKAaIiexCQOivrJI0WqcSkwTup7/A2mHJhfPneFNETth8jc5gQ92dQZVCzCzND19frecfDwnBXimRmj6oEcXJv7t+BVuwMNIPgI1wnCZaRC4gm306/y/8aAjadOnwoL2YYVrNRb4Rs+FcEdfhVsT04aIiPBh3B1dsO8rF09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOiGbfV0z5lZIUjOxHbBoyRhAmtUY9YeW/L9Ese30/k=;
 b=GZ/VZE7aYcBNWY647LWd8Lo4fvIUmD6w1Fo+/bB+uRKq9+BkpAWSJizZqnL2Lx3kxnGM2ntgtVYdFX73AQITFCf/xZtSNgHfkNp5t0/T/9pSqRBRbthYNVfIR7LIbyS/wbIPYDMOFA8cwCguqFVxnRkPODK6MUw0CZ61EHV8mrdYNkD2Nt+JxC2ZWtYaYEvUKH1+2GRrnn4ecZvSNioEduSia0snmmUjGvbdkoZw+d0OCwt2v5/QvF3zHatSJiN26RT0EvOS9/DUzLY88IhJDzvOrul8Zc2e7q9CPND2xQsbA7yXJ7LZi77exqd76S2eyn5Dwf68z9IAEPdeBVGBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOiGbfV0z5lZIUjOxHbBoyRhAmtUY9YeW/L9Ese30/k=;
 b=s5CRLeWwXAYdKtkcL7wUXU1jSaUH7dFA7i6KdxBbJARImjVU6a7Yh1M0IE2NO2SYlRHT8QmgVxf50eSzB5qQ1aFgc2kym4V6JcUjzcIEKDzI+DVYnH6RS2/m+RyjZxwYGRQtZ1nxeOi8QH03HYveYgmK9EcBqnEhzwZbRIoRUX/VpsAzk4p3jPJHmHYi6BBqTsnO6wk1X4x2J+aE82XvwMUtTGeSwbXQYEF2OHE7ezvTCZROP0S3bHwgAodPYvfLtpKNQXPo6VgGQw35fyCdVn9mmGtKos1F5p5leJup+IJ3WKP3P+3liij1QVfyAssMRw6efQ8SvVCTsPmfjkNlYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e99cb53e-54da-55da-23a4-13e445f5b7d0@suse.com>
Date: Wed, 13 Jul 2022 09:52:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/spec-ctrl: correct per-guest-type reporting of MD_CLEAR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 116541ca-4daf-43d9-3482-08da64a4a979
X-MS-TrafficTypeDiagnostic: VI1PR04MB4574:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5EIDAZt5GmOJhIMfra9+U7mZ5wtbYOV3Ko7hXqm+fD5YOTmFPHPN67R149OB6+R4+TROtFoVxJYVzlzEeIrNL7AWfjIGGQPdVud8QEY6DQ6R4ZMah1tp4D3eHoW2rw6/QSrWJRWhkl+h3qnmelbvm30nb4D/HiMUeDJ6bm4/9LhlWouBnPp4qKQ9iYTgI+brSSEW0ClB0FRfHSUN+YDc+znnclrWaIiVA6fJAre6GkHkn7XiYfqpe+L4q8i0wZic7ygY36ZbPCOVEb1m2VXOM/ukWjbfxSAGNDIA9rFwv7HWvggOVoRQbXDDsya3dqNB8NSUB/r9wSRRzIFkXG77uD+2JE04KLDFNrrH6nqwannyBIuZx6MkiQq9w3BAFfT/BRcPu/kQk1NtYQ/y0DZwfCW+ljPctyp8OdFlpt93jQEdXYVAmoZDiGZHuFOtGdXLQ+ogtzeAJbhQILtChnVxxhXzUMEctVKVC8E0vXNL2EP0Fl6Y6o9RWGMDDb/exgSkCBFFZH93g0vjqoloEBE/nH37TtWTBm0p9NdhSdJUd+WjOPIKMrh4fx1WiEI8yjr9N427bEHSJP7APbBcDwR79mmbCgvya+7tZ+JI4N62+vygyMdsbk3CcE2wJPtF1BcESTLqVEEaQKI1WGBzaBiBNsPf1XXdZHpL4x0AtRs3WOcht9t0/HhZfacBl7mAtJX/F9clrgiqwSh8Iu/1aeib6x3ceWMTdbZnA5NSLdb2MhnsHvshtMAo+XnojauivvZttzaNISV+yv5jzZv1Xc+/3HD3gK7/5T0Gq1QfOMYIP4mfI0l5K2iSmZ9pCMXef7t8CB87ZRCuU0tlk4o6ACTB/gpijHgEnSMywEc/NaxtmL8XdwCZFFcEVBXutPoOo3r1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(186003)(316002)(6916009)(83380400001)(38100700002)(31686004)(66556008)(66946007)(4326008)(8676002)(36756003)(66476007)(6506007)(2616005)(6486002)(41300700001)(31696002)(86362001)(2906002)(5660300002)(54906003)(26005)(478600001)(6512007)(84970400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGFEMnBjaTVnbi9BSTJiQzc3NGFUWXNOT0duKzltNzNHemZSaDJMVGVYTkEr?=
 =?utf-8?B?L2ZsV2FnWjR5a2lka3JqM3VTM2s5VWV4R2FuVzFacmlYWm9UZEF0WE4zWU9m?=
 =?utf-8?B?a3pNQThCNHRwK3pxNkExck9Qc2l0MEdXbGgwTkV5QW5CRHlMTGRXMVFEK09i?=
 =?utf-8?B?Y3Q1Yms5TTVIWWs0eTJUVWtXV1hWcGZoQlVaT0NxeXorME45NjQ3ZXU1b2R5?=
 =?utf-8?B?NVA0blVpbmlzT1dybTJHbkRHb2dJU2dJNE93Sm5weWRIcUV3dW5wTmhkMG5M?=
 =?utf-8?B?ZUZUUmxvUWNTa3Y2SzU1eGkxRG84UWc5azBhYnUzYWhQTTlxSHJxV3ZQVzJM?=
 =?utf-8?B?U2hVSkgvTjJkRmhleEFrWlBocjFaSTh6WEFKUTdZVUJNeFZrNG9ITHcyelNj?=
 =?utf-8?B?SjRGWm5Vd3BWMUtqVjd6VXZGWUNDT25vaDREL2JSTCtUNmtVazdYUzFjM3hl?=
 =?utf-8?B?UUZib1BCYTkrT1dTSUVQbG11cklnQVdWdjAzSDF3cndwNytjYzNTQ2JSZGxU?=
 =?utf-8?B?Mlhob1NHOWpweVcwUnBxN2F6dVhXajJpc2Erb2tlQkZtRFljWlpBSTFValda?=
 =?utf-8?B?dFJOeDVJLzExalVHRHpIcDJKVURWTDdMMlNzQWxJM3hyZEl3aks4TWxuak01?=
 =?utf-8?B?VTNwWVNPMVVPWVIvd1hTcVo3MVc4MVlHSTFCRTFaUzB0QmJUaEY5V3FpYWZy?=
 =?utf-8?B?OW9oTHBEMDdKZVRIejFZSGNkbWZuMUYrTWF6OGQ4ZmU5UjJSbjJTS2NLcXY2?=
 =?utf-8?B?UU8rMlV4b0thekZCcU54cVRoUmZCSmVaZWNpTUNxaGFYZ293Q2VlbGRoekhu?=
 =?utf-8?B?MDVOb3JDKy9VWFlzU0tKaHBGSVVMbU9zSmxkMHBaNm1sSFY1TGhhVG1wWnVG?=
 =?utf-8?B?NnZNK204N1V5d2luK2tMWEpqS2N1YlA3dVVucHljRGppelRkQTAxdG1IUTB1?=
 =?utf-8?B?eU9NdC9OSlJ6RGpGR1ZhYVZSZGpkWldldlJZV2IwbXhKZ3NhQ0hGdjVPaFBI?=
 =?utf-8?B?RjFTNSsycm1lZXhHb1RaOGdVRHlOSkowUTZjMkF2NnZNd1owNGUrcE9rbHFw?=
 =?utf-8?B?eXh4c212Rkgzc3J0eXpGRTdlT0NDSVFteWRKTG9FS2VtcDNJRkhGVVJNZklC?=
 =?utf-8?B?Uk91VExmbjdmTnRnY1dQMzlIc09jb09vOHN2Rk5VZnlDOUhPenB6TFJFRk1V?=
 =?utf-8?B?Rzc3RHArdlZSdnRiYlNFOFFzN0JRVFIvQW9iSTEzQ3o0UXdFRXF6Ym5mNEZW?=
 =?utf-8?B?SXc2NWlma3ZxOGhydkI5UDd1WW5rNjE0Rmo5S0RtVVIrdG45c2F3ckhseVhL?=
 =?utf-8?B?RzduY1JSRVc4UmZNVkpYZFFBTzhxR0wwLzhoeXRRMkFEd2h4U2NhMjM2K0hk?=
 =?utf-8?B?Ykt0TGV3L3E2MWR3YlNsUWpTaGQ2QXZydWJUUytpS05yRXNIa1M3RnlrZUZ1?=
 =?utf-8?B?ak5tL0VUUU5uMUdwWW96cExtUzhDekdFaDFZTHZyTGVieGlxSTg5L3FPYWZQ?=
 =?utf-8?B?Q1dNMDFMOW1QNTJIVkp0bFpZWERqWkU2WkhmdWpKSG5jZ044M1J3aXRVdjg2?=
 =?utf-8?B?dUhEV2pLZUFpdEhmaVRtMEdtN1JsQjFZVmlLMWJXVmFDSndvcWI1RkhyeGN2?=
 =?utf-8?B?blFzZFNyVVNCUytyYk1wN0luTkdValpCWDNiV0JSQm96WVdFZmMyVzdxMFcx?=
 =?utf-8?B?VXZaZ1RIRkllanlHUmJ4bGxNdFhSbWgyQnNuUDZtSVExbkJIMjVIcm1Ybis0?=
 =?utf-8?B?SlkwU3FMalVwT3FzbFJPN0NiRE93SStSTTZHZkVNVlYxOGkxNmgrY25rcC9j?=
 =?utf-8?B?OXhjc2JpbUlRUFhaNnVJemwzMDE2RlRwRVR0YUZNMGFvN01jWkNvWEZRc2pv?=
 =?utf-8?B?cXRVYzlyUTNGK28vVThzOVdobXNsRHlsS0RNV1BrTHNmdjRqRTZrTk5ZdkdH?=
 =?utf-8?B?VjAvZk50bHZxeEl3cmlEK0U3UkxJTXZMUytxQ204a1R6UCt6aWtYdDI0WkZ1?=
 =?utf-8?B?OFVGNC8vTUJ6cHRPTkdpc2RKRzNUdDFZb29Fd2hsT1RUaytIelMyOWFDYkp6?=
 =?utf-8?B?cDZQZnNJWFRMSmJTR2dabE1WK0tkdUpLUUJIV2NUeTh4ZGVqV2Q2dkJxQVA1?=
 =?utf-8?Q?uBdtPZKiMUFv4X2wR+ONaUCjh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116541ca-4daf-43d9-3482-08da64a4a979
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 07:52:40.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hMB9AoHQEvEM3ZQZMu5At7SrRDgBJOYjtOh3pWTYes+rdAAgNUO25hWaK3wdv+I0LopjtvRjaKkQUGL9KfsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4574

There are command line controls for this and the default also isn't "always
enable when hardware supports it", which logging should take into account.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/arch/x86/spec_ctrl.c	2022-04-13 14:29:38.000000000 +0200
+++ unstable/xen/arch/x86/spec_ctrl.c	2022-07-13 09:38:44.012913760 +0200
@@ -511,13 +511,12 @@ static void __init print_details(enum in
     printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
-            boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
-            opt_eager_fpu)                           ? ""               : " None",
+            opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
-           boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "",
+           opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "");
 
 #endif
@@ -525,13 +524,12 @@ static void __init print_details(enum in
     printk("  Support for PV VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
-            boot_cpu_has(X86_FEATURE_MD_CLEAR)  ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
-            opt_eager_fpu)                           ? ""               : " None",
+            opt_eager_fpu || opt_md_clear_pv)        ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
-           boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "",
+           opt_md_clear_pv                           ? " MD_CLEAR"      : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "");
 
     printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",

