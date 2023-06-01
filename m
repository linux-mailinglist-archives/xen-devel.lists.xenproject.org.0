Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6A7196AA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 11:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542349.846099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4eRR-0004Kh-6G; Thu, 01 Jun 2023 09:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542349.846099; Thu, 01 Jun 2023 09:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4eRR-0004Hc-2W; Thu, 01 Jun 2023 09:17:57 +0000
Received: by outflank-mailman (input) for mailman id 542349;
 Thu, 01 Jun 2023 09:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4eRO-0004HU-NP
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 09:17:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e697985-005d-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 11:17:52 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 05:17:42 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6974.namprd03.prod.outlook.com (2603:10b6:8:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 09:17:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 09:17:41 +0000
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
X-Inumbo-ID: 2e697985-005d-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685611072;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mAKXB4QuJFfeaiz5/vA/KdxQE9JPM6cp6wr6KCV8R5I=;
  b=BxSFosLfyKCdA0WweAaJhS+shHOzU/SSGHzaj7iNDT5S466hOZ3w+Zw9
   Ip1N01wW1YVD5uEecj8YzSGkHBrjnt4A4rlSrS06IFyNwe08MTZierJ00
   IasKfCQY3XxARQwXEdD1/WZ4mgXlatSlsiAPtkk9JbO2KialOnero58hE
   o=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 110525702
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gwpj3aqzWogI6My/V0Qp+I8QlV5eBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmGOfeDNjaheNggat+x8E0C7cODm4VnHQM+qHxjRCMRpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzyBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABEJaxuAgeWJ+quYb85sufgeN9HxJbpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYSFEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtKSeflqaYw6LGV7kUzBTsvZ12Um6ma1VaPYtVcD
 1Ik1QN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFNJ7Svfr3pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Zf6PqqN/C3dKEcBcTmKjsMiBIKoaSvp037Eqv3oBMSC9Afbo8f
 xG+85rqiMc6QxhJE3I/OruBEDuewK/yXcY2/hqAV7mZniahILqFvAo0WKA+UyEJ8SdzJ8/6U
 46Sdk3NDSYNzET5qyWjGfYc+rIguP3i5xA7t2uqEuFIzsaEp2Ioz0JbjpyRSZNNXh7LKt8MJ
 Kd48pBqX6EeW4LB/7LTEXtCNKz2eHjpdbeehgBCAcg6A6SyR2VyJOSKWnr4j4uFwpVx7Es6G
 7ElBG8wJ6CnbWU9j/wvlWjmqi/vrPau6x+7Qi3+7tlXgnEu0KRTqRnRrGYuzgxydvfmGrCiO
 O86ivIIf4DnU/sQg==
X-Talos-CUID: 9a23:jSCJ02x3NWo4qeUSQ82yBgU1HsUucXva803JAGqfCVlVdaaNU0aprfY=
X-Talos-MUID: 9a23:x9FT2Qt7L1NQtIuP6M2nrRFvEv5a5YuUWGNSiaQ/vMqgKxxfEmLI
X-IronPort-AV: E=Sophos;i="6.00,209,1681185600"; 
   d="scan'208";a="110525702"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZa1YI6bpyAitJJUWW2v49X1KhWoCIYiqJpckculC7fUa5Y4hdMe4pSNDzk5YyvxySjpjUyx4DhU7gDiI/CkjjIiEJlXiXnWFIQSf2CuulbIPNKJHPDSTIpU0d+S0sxN8ksMgLocvVAO7Grru9sk0KM0Y+haoGKGT4zHYD2a2FfK/9s8C9DKArvSCjrQh31ufwPYzhdNlXXtJGa2T3CP+Sgdlnf2xkmlnpZ19F80GdQbEdkO25KTq6ZdEaggGLbbnHjUdBElx85HObUVR+c8l/cStAVtigJleeGvmnuF0BgxWrydxtC6hogmLm+ctTzdSRqHfQq6LN3p2kyrRdeK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGL5vgFCFkEo1TBsGjhXa0fOE5fjQn/XNu5TL3fgRpw=;
 b=U+rgKQOI2Qg4L4wNUpflV1ZqkG0+llwRMzEqocWJkU3o5Bgk/qE4FDD8Yb0YyK4g5Qui80jODd0qJ7bgQmkqqBW1kqFUbyt9K8lp5a3cwJb4htzua6GmBZ6FzyVk9y+QNucz4ykP92n/Frhx2lFiocZwdR5Aggs57eLqPM+kHK+2YCYfF7L7W7Z+RuE6Qbqtq7hl5EMP8Rv0sORMSxwMS54NXXdETXbcATlaadZFqzoY1JbGYsBKFyT4gXvtVY5TEpDaGjCZMuI73XAhOk/l0Kiqmy8tj5xBJD5mby4QQmAvIOym2SQheJgkhtPRJj+944fiFUUG4t+skYL8I+DHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGL5vgFCFkEo1TBsGjhXa0fOE5fjQn/XNu5TL3fgRpw=;
 b=cTCRqWJGMAT/TUbsiuUigyCjR+jSPpVZeRQUpNwcR04GXVjMiWQNlRgSm8YPxBwo+UkmROQ0GCsE2AR4ee9dJu/uuA83A1XQAE2QMhhbzQAeuezkKIx6dJC+ajur2Kx+6UqqShX+klv1rSDnMlHEsbJ4e50RBpCgI+Q13Ut3YZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 1 Jun 2023 11:17:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/vPIT: re-order functions
Message-ID: <ZHhiLgI0oL7jvKNc@Air-de-Roger>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
X-ClientProxiedBy: LO3P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9e2460-e902-4b16-ff64-08db62810c9a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PUn2pqis1OXPuVLtV6ZEKiMpRVdTY5Dmp5Gylq+OKXR2IurCspaQwjncczBHd17XIWX/ezKfpSr7tIDJEhtJjZJZpFm6Y5E++sdVhSvyCGW3T9P3d0QfjvrntmyXw15speB3Jg1k2rMCGV2NnD0SH/S82NrvOZddWw5f0taqZ16nQSgsVb6xoZTmJan5/eAANokCr+Tx4jH9t8vsmyxP2ttA29Mu7keOgbJQ7cipfkNJJjGsXUnmiXfnSohrs+zOui4er3aDEBZVeYb2FQkm2hpEve0r/iZrvu2j1YH3HZR9XL5PbKZpvQivJA2edUQM8SeBKfm9h+QQ75OnPtNw2KpbKBZWmHLA24hs+ewstuyzSAhMMdD9siTJH2wapPYjeQ+e39Uq17D2P/hzkdAJVgng5RUpX7oaXrfyzUpYBHcqpWb7QozhwZTTMVxOdkZhmMb44YxLBf9gq0L1BhJdeL7/brb3gkVL3RruJo7blbX2x5JtqX4vEmul/VQo2noGEO0FPCdYNvHaE+MC7wfPbfhsOepAOBIEpxyVdt3YiVvNd7Mn7++DTbgK7EVEgpGO/nV6UgpfxoUzogSw9IOWrZrYLo2jRPpBTYwibxjuca0CSmuBwb/uK5pzacb9u4em
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(83380400001)(2906002)(4744005)(186003)(85182001)(82960400001)(38100700002)(33716001)(8676002)(8936002)(478600001)(66476007)(66556008)(5660300002)(66946007)(6916009)(4326008)(86362001)(6486002)(41300700001)(316002)(6506007)(6666004)(6512007)(9686003)(26005)(54906003)(169823001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVdWNWtyK1hYKzB2N3FKbS9HRjR2QWR2Z1hGZzQ4Q3NtUjZwdnkzbnV3UlZ3?=
 =?utf-8?B?V3haVmhSQ2VGVWNOVllURVMxY2FzWHJzcVc0dzJnSVNMdVJZRVBmenFsUTlp?=
 =?utf-8?B?ai9VVHRZdUhOb3c2UllEMWtVcDNFU2JvQmFsMDFoNmZsWVdCdE1pMGltTkxL?=
 =?utf-8?B?YUY1WUhONzJIVGpYc051eWZnN1ZQSFFrbVB6QzhqYWRjZmU5b2dBYzk2WVFk?=
 =?utf-8?B?ckhydzRpM1JOS0xEWkZGYitRNThDQ25odzRDdDhid1NFMDU4cC9nVVpNeFIx?=
 =?utf-8?B?bjh5UG9YVGdhc0ppRHFVZ1dMRjZ1SkttcE1hMlBROXlMR3YxM0lsTjhtaTUx?=
 =?utf-8?B?dGZGbEh3MDR2MmZnOGljZElyTC9yVHVUeGF3VVRGR2dOaWJXZXJSWGt1VmZB?=
 =?utf-8?B?SExlbnhKSDg1Q3JidGhvNG5udUY3MU5wc2MrZm1JcjF1cXlIZGt3aVc4Snls?=
 =?utf-8?B?UVoyQkp3NEpaWVNad2FCcHo3QmNPNU1Id3I0RG94M1MxUFZpdzhkQi8yeElO?=
 =?utf-8?B?dkl3Yi9mWUdyMHVIV0xTZDlYVFpZbHh3dHZnMUpwcGF6eUY4Wit2Zm44RExj?=
 =?utf-8?B?REhrL1lEREQ0QVN6UGNwVXFMUGlzczNnQklLQXZydXQ2Z1pDQVQ2R3ZpR0Jy?=
 =?utf-8?B?RXZXdUV4OFlvSFlFY3psQTkweURpRWVxWFV2dnptZVF4MG0yZldHQXAxSUQz?=
 =?utf-8?B?YUNTdVQrQkhpQlNVbFI0Q0RuSVUwVm1HdVpyQWtKTis5U0kzbC8zanpsdi9n?=
 =?utf-8?B?UVdCRGZ3R3pBK1JJYUNBTzVUSkREUlF3WDExSDViZG9LVGhVbXRBV3ovYkU3?=
 =?utf-8?B?dVF6OWZzSkhwRzFUNzRIeFFSTlkzVkJWYml2TjBaTjlGVzVBSWh5cHY0ODJT?=
 =?utf-8?B?dEs4ZUIwUU9wVzdjcmlic1R2NUFRb2pIR2ZxQVJMc1JPSDB6WkxzOWVQV0J3?=
 =?utf-8?B?UHRHT2lCZmFJZlIyRzM1SEVIR2lhZHhKWU1EbmhLcWFwdW5WMDl2ci9rUHBP?=
 =?utf-8?B?ZXJxSU1seUpxakNpUWdQSy9QRDZtc3BQYjEzMWVNRjVSb2grbGVvRVdGOU1D?=
 =?utf-8?B?L2pmcVhCWHpUUmQxVHBieXpDV2l1RUFVaG8ySk4rWVZwenlLRGJIRnFiS0Fn?=
 =?utf-8?B?U05QOGtSUWZZczROS25vcXd5THBOWUpWYUdqTzduS1Y2SEdXRTVsT2I4Y3Jq?=
 =?utf-8?B?ckM2Nk5TSUtvVCs5dUI0M2dtVHoxY2l0bVJicjNEcG9GMmFnUFFJdmx4ZlNm?=
 =?utf-8?B?MlBBOWRMdTRZUnlNZHU5TGlwUXJwbng2SnY0Ym9ZVGt1UXdyRXBtY0QzUmJM?=
 =?utf-8?B?QkJMc1JQQTBid2FQV0NlQUtDTUdMUHA0T1RERElxT25KMVVsdTRHblJnZVhm?=
 =?utf-8?B?U0xMOG5tNFBiZEJyQ05qMVoxVTdYVnBFUnJiUlJXaEoyczlnMWwzMis4WVFa?=
 =?utf-8?B?NmUwVzI1ZU0xNXNVV2tCdnUvUFdqMWJMMUJWT2ZkTk8zTEoxQjMxOThISFdh?=
 =?utf-8?B?MUFkM2tQamdJSThEY3VVWitwTndPVjAwWEtlZFVEYUVYcmNpbU9IdU16b2RZ?=
 =?utf-8?B?NlZnTzhDQ2drZXd1R3N2ZFZkbGJJUVh3eDlnN1RYSDAxSUN2MnhnR3JrYTdo?=
 =?utf-8?B?RkNuREoxREJ6Nk5lMS96K1hFek12NXZvSnMzV3dSWGpZZFMyNHpVTWlVR3Ju?=
 =?utf-8?B?OGRNMVU5NjFrYVB1cU5TZDdnbDExck1SNUVmWVI3dzZHSjBHQTM4NmxpeE5T?=
 =?utf-8?B?RTJCWmhLT2VxbTNJNjNYY0JFTk1lSnFaZ1VDSUcxTW9nVW9jaFRXdkdhbUEv?=
 =?utf-8?B?TFNIYzFwZFdSTUhMcmpnMU9EM21sVGRxdG5aYk9SbDlpZGNPU1l3S2VVNVZH?=
 =?utf-8?B?M1ZEOFdqS0tqajBJQVllandFMGdVNUc0bWlvejFVRTRRbEhHN0VWdjJpSGlG?=
 =?utf-8?B?ajVQeW9UWkZSakp2Sm1vdTRtODJFa2hXVW4xT1FaUVora2xQMFVRcFEyRzgw?=
 =?utf-8?B?aWZZazhjVTJNZ2NESEdMKytZSFQvVlFtNjJMUVdIUEMyL21VM0krazg2UFdw?=
 =?utf-8?B?NFUxcEFmNnN4MzlaUGtYMGZEZHllbWpsVHdMQ3NxOElWWU45a1VKNTB2dGpn?=
 =?utf-8?Q?B0fCUda5jk2tdWpE2U2T/6APS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ioVmy+hkpLVi3AHngaQKDi2zbggwkCzrpMPW5PVnTx8o0yq80MtUU70XMCz1UvGKcqFGgMjFyXptQUKVR1Yo+R9HaSo1XqEq6sNzXcSOu3T3BhZdfE2gJp0bDGM79qcaoxHtKcZSr1nuoPhdh26i/Vu4d5wdLp7d+L9jM0tdLb0uMvM0WQ58wlGuUMHRHNiw71Dm+5p6H6kBDObCjzCk8vP44ZgocWy/LwJSbmPc9/0le2hdH7k+Mg/rBLqlvgTsyvNtsfE2+tUUjxMuQMsnzwmKra0Sr1rDN5DAjp/3y5CYDB0jGlh/rjjnnnwdAHBKfGOTmLfQ7uStDB8xosdvsQCJqZBZHPlEL7mQvdFepOwxomqZ0DVYw3IsZFkDX1jDRr7nHmykWQIg/OQiXzt/t80Yk0XVn/MpjkJleqEu/BmJvR/Jat3UnykYD7Rgfmu591LPynuImIjeGs69tRe/sfZC6Ve2VhSK18iV3J7ERdoL8wRIm+mFvxe++dt+m9Z29liYIBD07BZxOKr/GpvP5sA68vh5WfsqYFuI5aKhUxviMGn/mDuaLCFujBZlbRFCVU7l1TeLJuNRez/935SgT1R9Pw873gU5k5QophtXQL/MnGZI69nU6R0nbxcQPKaZfxdtDsPhrYK+gy5LwhpZDRvTMFIcx15N09fHVtYvYs7PjJd+3pZjlMsnTDq1acWwA40ims9UJsdb3ddaHuy4hF14/mHgpdCtynVCx6zSaUTwLsI5+lADr3OjKbx+hmBQzVb/mAr4tkq/gCISQauhuGKGZ+xGSZs6fzOcC3O4hJyqANIdictMwsmpwKDFFTjQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9e2460-e902-4b16-ff64-08db62810c9a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 09:17:40.8184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eTIJQaSfdcFrAAWaZiroRLf7MLwfHHgvfUt5A0bURO4XP3B+GM9XOVwVzRJNFMhd2d9IvZLitS9Qj77BEnoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6974

On Tue, May 30, 2023 at 05:30:02PM +0200, Jan Beulich wrote:
> To avoid the need for a forward declaration of pit_load_count() in a
> subsequent change, move it earlier in the file (along with its helper
> callback).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just a couple of nits, which you might also noticed but decided to not
fix given this is just code movement.

> 
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -87,6 +87,57 @@ static int pit_get_count(PITState *pit,
>      return counter;
>  }
>  
> +static void cf_check pit_time_fired(struct vcpu *v, void *priv)

Seems like v could be constified?

> +{
> +    uint64_t *count_load_time = priv;
> +    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
> +    *count_load_time = get_guest_time(v);
> +}
> +
> +static void pit_load_count(PITState *pit, int channel, int val)
> +{
> +    u32 period;

uint32_t

Thanks, Roger.

