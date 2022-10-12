Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9695FC5E5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421139.666321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibQ4-0000ki-FO; Wed, 12 Oct 2022 13:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421139.666321; Wed, 12 Oct 2022 13:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibQ4-0000hj-B8; Wed, 12 Oct 2022 13:05:08 +0000
Received: by outflank-mailman (input) for mailman id 421139;
 Wed, 12 Oct 2022 13:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oibQ2-0000gX-QT
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:05:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d3df7ee-4a2e-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 15:05:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 13:05:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 13:05:03 +0000
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
X-Inumbo-ID: 7d3df7ee-4a2e-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+jqd7oVkMRzUR+TScJsTt35j+ecBiOv1BR+wBMXP7RdLeceEtRtaBWKkOApnJbBSLFjDzJ9y4fv0o8YGLgBzMBQOHbryBSx18baSD3kv6rN+R000878PWdx9mOOSHHAM7VbfKhm0R1I93vUjRwCyYn4HF8kIALCsB65GcZg5MSZAFlD6jhY/5hrxeBtIyDh1Bgi1TUF/bGn7FCFyHDSokSn1cd8Pe0mv9kT/YHegpELOPHjc6yLCxkwsG6ut/nuVBUIubKRm5a+4xKJpvgw402envLKMvJcofKoy4lZuPw/hcWYXiBzdRA9nmDPNLlMr65SAxAoLzdJO6uSCx1xmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2sXbvaGhT3VwITSLxnrPr1tyc6+JoIMGDhu4msM+tc=;
 b=DSL8XjEli1hDoo96iGppZ5L5NyQ1DJvSXFzhGyo0AoPT79JExUWuMNNqURL3ycpGxpsJT/fE9lL8Ia1EBV0SYdNccEv/tA4YStPiStFjMN56IH7/Xo70DzZ5UmE942o5S4DJbUDtgs+PNI+8MRvSZpCYaNdVN65Nwk9JBqa/aQDu3D5HEeP/bBWQ0eWk1z03ZaM/QmX/TBLkXpqq/OQ4yAf4MJpr4ejQr0cyCIIyKNiIkr+Jqm0AGIaKlaG+IyBKPI1hXVLUhUO3MZMk0AwmQsMsjArYzislwJGZTRg9VADo9GPB326nj/PDMjx643oLSwFUAQ8fiAsFBaXe+o0hVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2sXbvaGhT3VwITSLxnrPr1tyc6+JoIMGDhu4msM+tc=;
 b=VGnWlGnVT7/QIMGUlpJluaWLDvCrtReg/9D+cz8J0fmQ8q0Yyhrbv8sXsRWVliqlqurwHucbzxBGI4Ay5aFphGEAZLJjsZPTdvVaDO5wyrwbUnloX6GWbMOCtKgt4E5Ksc/S+IBYLh2Q3f4LaIx2ilqXKvyX2JEy4AyhnTi/bsOYlvqxKeGir7yP+Pg2KRdrDAjKdo5q1uggOf5Tnx/W4UEH3KI3lQq8ZDPT89L62nn3bDtFiqCFUJvx8cMggSaFaGmrHfmwK5CKlOid/I3eHKKsqFZ0zW/PrexvjyY/AptlN3mom5xKKiYXDfsxMzXba2Z3LMPDUSm6xcYKx2Gpzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <805d66fe-e116-254f-015a-59a760639653@suse.com>
Date: Wed, 12 Oct 2022 15:05:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation to
 fix build
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0274.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdd2d74-38c4-47e7-2d41-08daac526083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4FjmLVCuFsZBjZdJ4hyD4xyxTlI2hhKUUdeCenNKqGUBtHExASRdT44M9dQa6kc8eB7mG7mSlf1UlJW8rEzspnOBD+0e5t8/eJ30RxtH2qeIgTu/U3N6AYLShSp5tJXHNVnXvxLE3aRs1v3RgAhtSszbQZqz3vDnsC08ZFQiaft/XSxxmQckJXavomtxqgi34T1C9FjI6i0WPrsSRlFeXixZQTvkvaiOwDPHQ0aY1/YnT/sa3a+XPpme2gZdCNgeQKEiZpNH7g6swgwj3Nshc/DnqHs5n9us8syFCf0m2HTxLtGNORu2adIlnrPbORLB8imp/BcZ/9C6stms1Kl9J27e6A/trLwXzOud4UFnUadqoZNgUqUzCpoTVDsB94il7YR9855fF1Sbp/a9s12xJGwBpxG1g9wP7z0efA0u/lvdNaaTuhIluxJMw+tTtgChZj0vZq8Ht8xZfW2D7ZzauzXFk1pGjTYMHWtidwAzjry/M68gnV0c7m/KRUv/uY47u6Enz3fXk1FLxFhKk/G68COqrCo6LVKOamwxj0f5l+D4OgYEv6HmEWZjbBDE062h6Oyzvwm8UEGei1PbMGX6zjER+xrA/xP0neNOCTmHKidoDm3oqFiO/Imu3N96+hTPwPdOXJS3HQ6oTmsfeC8GaiY45D53PVvm/quh6IOa/0fiFplI+YkCa8WC35EC8MSGi7qrW2mSi+9+yoGLkn4sryM1sI+1tCR4f1sgeE4Hubdd96ecysHB01AxlrEGNr574zJIxP4ECD965UyQDX/kqsavnc8VSyjBPIiWY5txAF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(54906003)(6916009)(316002)(66946007)(8936002)(4744005)(38100700002)(2906002)(4326008)(66476007)(41300700001)(66556008)(8676002)(5660300002)(6512007)(6506007)(186003)(2616005)(478600001)(6486002)(31686004)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkxJOWxKTU12TU1FK2g1U0ZNajN6WFlNby83VnJlb0dza3VITVI4V2JSTkF4?=
 =?utf-8?B?UnhpRzlhWkc1ZnkyOTBhTEJLVE50Wm1JTnlHamU0bWNub0Ztb2JJRE5CTlZY?=
 =?utf-8?B?dDhzcDFrU2U5aFhsMmFqRWhhZHdld2p3cXFSZk9nbnlkbmp3REpYKy9BN09s?=
 =?utf-8?B?RlZ2TmRHKzNLMUlRK3F1VllwSVUwSkJYR3d2NWlka0dXRlNkOW9PL2kyRnor?=
 =?utf-8?B?cS9VUzFlZk1zWGV6VU1PcnhuNFlKc2ZJWVltUTZod043UGpZRHdlYVcwRno4?=
 =?utf-8?B?VVRlZk9wOVVFb1Q2OVpxeHhINWdBeldjL1p0aEo2YnEzYnZwSmN5QldseVhy?=
 =?utf-8?B?WVgzczB5TDJpYXZLYWo2eElBcFg0THkzZ2RCZEdxTURPWWs3TmxDWEVkZU1q?=
 =?utf-8?B?WUFWNE5ETHpINVRiQThzd2YwZXJVaHVKUGEwZUhuSVIzQU52L3pqMUR5eTJV?=
 =?utf-8?B?RWtPbTNMcWwzZ01Ncy9rZDhOVWhvR1h0Uk54OEFueUltOW12S0RjL1NIS1h4?=
 =?utf-8?B?ZCs1V3ZFeUFMR0ZVeVpreit1bndmUEhONDhQRC9WVXZYaUhFeVFSSmd6NlhY?=
 =?utf-8?B?L0hKUXRKOWJEdkRiaUlDZkE3T2hzQWMwcVZYN0xDZ0hvbkppL09vbmI4S0Iy?=
 =?utf-8?B?N25YS2tobGVZMXl5Yk1UdnQ0ZkRyU3pSbi8zQzN6K0FBOXlCV1o5bExUM3Bp?=
 =?utf-8?B?Umcydk1hcWwyYWwxNEc1NDV1TWFPNE5QRmtVRmY4dTdEYTY3Rk9XSGMyd3Uw?=
 =?utf-8?B?aVdHcFBkdjlTeitwbUEvcDhwZXBnUVM0QWM4cUJwL1ZSd201NTJnaXVSdmxY?=
 =?utf-8?B?cEZxRWpnVldQcERDa1U0UFR1dExGaCtTSW55b24yYjZja3RQUnVHRlA3OVNx?=
 =?utf-8?B?LytyeVJleVV5UHdiM1F5UnBrZlJsT0FGTFowYXNlYzhrV1RHdUdwbEl4cHor?=
 =?utf-8?B?RmRmdUJRMVd6ZElrTTc2UVhvRUxDWTU3QXppQ2QraVpLRlhtU3A4MFFiNnhl?=
 =?utf-8?B?NUI3SHNnN0s5R3NzcXBod2luN1FNcTFleENxUTZBdTFRSGNoMEdvTDB0SUI2?=
 =?utf-8?B?RmxvU0tick90UjhFcFpiMnVkVzB4Mi95TGtTaGk1MU9jZUNoNFcvZ2RGSzA1?=
 =?utf-8?B?TlpmSTNQYVdaeXE4MmU3L1pLRnpQTkE3aUx3bEJRaHc0cU4xbDNJS2ViSEJ4?=
 =?utf-8?B?MUVvMFpPc1FKZmIzU0ZLdVhpeXZPNVFkamxXaEVlL04vaTdreVFOaVJwTDg4?=
 =?utf-8?B?UXU4dW82VHhmZE1YNFc5ZlBWUFNXSVZ6NHl5YzMzTmpBdEg3MmR2Nkp3dlJm?=
 =?utf-8?B?Uk9Ra3pVZEVqaGgrQXpBY2NnaEkxeHBSaGJBNmdQcmNNY2hDL1M4NzNKR25o?=
 =?utf-8?B?ZkxKckt6cUFmRWJabWFraU9Nb1BPV2Z1RHpGYnVqNndNT2duT2M2ZnE2ZVNZ?=
 =?utf-8?B?MkNtWW5MUkMwZk1TYXV3WWdEZStGZ3I4c0EzUm5qSXV5ZTBFVjlNTGZwWXJC?=
 =?utf-8?B?NnYzWEpzZGRidnVXRCtEWG95M3YwLzhEWnVNOWZyeklEUlc1QW82Y3dtaVBo?=
 =?utf-8?B?OEJRTFhuUjE2dEVrQ3R4YVY2QjZZU29aeWF1eEFmU0NqbVA5bUJUS0VsekVn?=
 =?utf-8?B?U2Q0UU9Ed0k2ME9HWFZHNUlwdEtpeGl6akVodzVYKzdWd2ZFREw1aEV5ajU5?=
 =?utf-8?B?QlV0WUgxUlhBVjVVRUhiTVpSTkROMDd2RFcrd0V1YU0vS0ZDZ0w0V2JzR0V2?=
 =?utf-8?B?eDZCNFQvNGNubFFHTGJwYWtPVVVIMC9iOXd1cGMwUjFza1UvdVZxZVJLN3p1?=
 =?utf-8?B?cFRvVjlvbEZ2MGhVUDY3SjhsZEIvOTVZYm14UitKNVVPRDJhTTg2amNEZEU0?=
 =?utf-8?B?Z2hiTXcwdGdhbitEeU90dEJQT09hZ1VTTW9DRmFxVGVHUVZ6c2VtS2Z6Nklh?=
 =?utf-8?B?NTNKVzdmMWtUa0pFb29BZFo1YUhBYlB1ZFNNUzRTOFdIR2Q2QVV6dkdWQlF3?=
 =?utf-8?B?UGtvbHJGQmIzcDVXQjBmbGxkazlXTWR4UlpSdkZwRFA2UHlKWGtmckVtdEsr?=
 =?utf-8?B?YkR5dHozU2N2K2g2RVd6OWphK3RxL2ZVVVhwMXlLRUV6VUp1VTYrb0Q3cHA0?=
 =?utf-8?B?dlR6QTVmT1k4dzhqcVc5ZjlWejNOMjFkeUR6STdUMDRGM2FDWWNQSzFpTExC?=
 =?utf-8?Q?AsehQpzCrcQPHrBOovwj+GJRFjBkLKsoXW7eUG/qkhFX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdd2d74-38c4-47e7-2d41-08daac526083
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:05:03.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+i2ccRDaBfMPofw/Ztptfd0R2XeJiI6HRNljSmHPSD/iu+HriAGN2BHVY3dLgLh2V0SKEHB0QJ59c6QoIVG5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283

The backport didn't adapt to the earlier function prototype taking more
(unused here) arguments.

Fixes: c5215044578e ("xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Also applicable to 4.14 and 4.13.

--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -136,7 +136,7 @@ int libxl__arch_domain_create(libxl__gc *gc,
 
     int r = xc_shadow_control(ctx->xch, domid,
                               XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                              &shadow_mb, 0);
+                              NULL, 0, &shadow_mb, 0, NULL);
     if (r) {
         LOGED(ERROR, domid,
               "Failed to set %u MiB shadow allocation", shadow_mb);

