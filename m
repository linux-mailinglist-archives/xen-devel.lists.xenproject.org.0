Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AB792555
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 18:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595787.929406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdYb4-0007nj-Ry; Tue, 05 Sep 2023 16:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595787.929406; Tue, 05 Sep 2023 16:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdYb4-0007lR-OG; Tue, 05 Sep 2023 16:08:10 +0000
Received: by outflank-mailman (input) for mailman id 595787;
 Tue, 05 Sep 2023 16:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdYb2-0007lL-IX
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 16:08:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65efabe6-4c06-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 18:08:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 16:07:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 16:07:36 +0000
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
X-Inumbo-ID: 65efabe6-4c06-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDGykEMxi1nlVPRWF8kvs2TUYZeYPQfWUAkTsYspcgr/qEmN5CMVv4rYBTOD8Eer1kC0u5uz+Jg+pG9uegONiBcBI0KYQB+aTUpTuMODSyr89MoWthxHLN770XfTWThJsKviRZVRfR2e56rScZOycU8vHojJ2CG+N5FrQ5e3Gsd+jGCLZA+tgnziNFLFIIY+cL3x2TCvVjPr2YzXZv9NP5quKeWDYcKV+rCfdMF9RJt5P0kXI6t7iZkBswDWZn+9HCIBFlwh4WrpyBfAUduqZdkWpJHScSkh9Mt2B+Z/J18mFjJiCSGscLmqHm+SUN2MB4txsUEtQrp/REltQs0rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHfTW3hgPWNG0Dmze3x2GP18OR4yBlIjNhdQN13rLbI=;
 b=QZCwoFW/fkGXTrJIVdTXnLkFm44oGYW9xBFCH+v/+YgSfLFD0LjY+MfTuzomYr2cgscSTIt0otHUSMraJJX8ubGqd3R+GAhLkInk/XjvzzYCi3PUvJv/MphBiVD/8+RPUA14nZKobeFg4N8AcqmovbpcpBDbOSBR/ixwDKW95AhZbwyt6irCTTMmk4zi0l7csNN8+etbKwhUP0XUPi1jSDF9Wil034PtWLfI8wdwNbvCaAyrQHiJTxFOtGdhvgGABD+ZAmLzNrlShpVsxYb4eO5w5FwS19J5K/HCnWaRqIr5b/njKrAAgjGS3eT02/j7FMZBMl2Gj1Gez0ztYByHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHfTW3hgPWNG0Dmze3x2GP18OR4yBlIjNhdQN13rLbI=;
 b=yq6RPreF5K8uH+fgx5TQtYLNTBhJFsInpvh2RdFJ+3Fr+GJVA+CQWPviky85cKnvLEqPNUftwdOP6eBlNK3B2uJtKGONl4HVbWcNkBDOmw+ikMM4Yh6Ez20Hp/fGGeoXaVgUclV2/wALYmCpdY+ScFOV8hStmcolMdSQ9GoMQFfnkiLLh7kioE9Gm8jYXmRiJ045AdUQiPulQrDsynoQKEDNuS6VpyQ6uyy+PZC/97V0Rn6dYhgNOCPos51/PEsjmzyOqa8kPs8tMtO9AVXcP0UPj756z6gd/WW+XclBdXrPhPzXT99jJtR2QPjg1aAGtMe1tR1lTAylmHpZSguzfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <332a7462-d0cb-154e-415b-e7f40b9b1421@suse.com>
Date: Tue, 5 Sep 2023 18:07:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/5] ppc: Enable full Xen build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1693590982.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: ea548520-22e8-44f4-d4d7-08dbae2a38a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BPpD3lfD8XynkKlRPLrA3vzxSLSBecNthM9xqWsjITlhAstMrP1l4zVtP8nSje6YNp0WZF0zr20CAy2N938oNd7l32j8wjXGwgMR2qiXQvksPWaQNvQkIy6rMPnv49+bm0o4DuV0/+MtDY7l1nusWXuI3oAETXu+n2CDLw46u/ibZqN6h/TvcCo9undz++yATxJawFQyTeirp1dN2i7NcGwsY5K2YhjVqliL1hj2PJfeXz28Q7LvAxx7dnUIC8J62PBQlBVkeqr/8J+Mzz3nSL8ccuyI6na3laA7biIZ2GRDW5xehburknuRGcdCu7qy4fH/pfjh9A0qpDwidC4CCCeugmto5Og1lN7wY8W++TPnJa87pE0fw0kujltErIOzM5Ow5sRM8NMo7PiDEHUX3aEOfvkEXCYOOMJR8tMZYhs0z18w8WLgt+K2JdySFKWieOzzblPiFh7uh0Xd1T0wzaf8dswaO4CnkD2T7TvM/o4YJSf+/mrxoij4yEKmvQW2yPDGO2Wk24MrhiaB8iy2czKWYpSBLvlQYxFxqO3vhzATiYg98h2qPTrAVcao3jgc2jJG6ESHVwuVfhFjxMSEK0HnQMTSeg4gVTUWJYIN9yYE/qSrq3g0fFPFqmKLrceQdqaTRZFBzH9lBL3l2ehYPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39850400004)(346002)(136003)(186009)(1800799009)(451199024)(26005)(6506007)(53546011)(6486002)(6512007)(38100700002)(86362001)(31696002)(36756003)(2616005)(8936002)(966005)(41300700001)(316002)(4326008)(66476007)(6916009)(66556008)(5660300002)(66946007)(31686004)(8676002)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RSTGJhbjZmaURJWkdzK2M1Rzk4WlQ5OFAvUllIQkh2NUFhaXpLVXBsMjgx?=
 =?utf-8?B?YWVpaENQbTkrOGxyZ3BwZEpsTDBna09pcUVCVDY3VHZ0TG1naGpubG9NOWJP?=
 =?utf-8?B?QkR3VE02VzcwZnV4NEFyQjcxTDBNMGx5UEFJV2hJSWZDK1RORHpxdGIyalF0?=
 =?utf-8?B?TE9JTzV5OTlrV21hSlk4a2RTeWxUK2hnYkdOV0l2aFMvS3ZFT3NvNStlQWx1?=
 =?utf-8?B?RFFYY2hiK1dZOUFBZ3g1VGV3N3gyczJGQmdTZVlSS0VZQ3ZuY2c2eEt4TDFn?=
 =?utf-8?B?Um5VNHRIVk5SeC9pa3hoVUc1UU9RcHM1N3dRUmFHaUtJUjYwdHF5M3dsOGlQ?=
 =?utf-8?B?enNOa2ovVEw0RERlbFpFMzRlV0NCbDQrbm1uU3B3d1grMW1TcXFxeEpySXFs?=
 =?utf-8?B?QkZqenJ4dFl3L25DNXNodmxNMkloRmJBWmtJVjdKenM5b01mVnN2Q1k5L3Nj?=
 =?utf-8?B?emp6TXYxY21WUytza3BmK3FaQXl4Q3p5SlpydHVnL0Q1MSt4ZHNVMUk0eEZC?=
 =?utf-8?B?Q0hQcFFRMklCeEdYQ1ZoaTgySitQdStTNElrZkh0Y1pBVzZoSXFiL0haS1pj?=
 =?utf-8?B?Y0RjdXoyT1FBSkM3VjJFelZsMnFhd3lLOERqRnRuRzltdjNzdTV3aGR6R0dN?=
 =?utf-8?B?S3FvZzFneFdEOEdUdGxKU3h1K1RqWS9Ra3ZQU1BlRUh4UlpSak51TGMrU0Q2?=
 =?utf-8?B?Z01wY2tvS1QyMGV0UFZ2enNyL3NObjVMUDF1cHZpVkZmQmxvRlV3NG9EUlpD?=
 =?utf-8?B?S3IxOGY0cElSRlpQYW55czZGcVpoUUxoYXNhMnRzMEhZZ3ZyelVpVFU1REpR?=
 =?utf-8?B?R0VEajZZNmoremZqc3l0ajQ4OG1heTVpZk1Rd2V2T2VYUnpNRTBRRTBxb1A2?=
 =?utf-8?B?VFR4TkV6akdIbWJ4dU5WQVpNazdleUFNRnBKdnM1MmZ2Tkgra2hTTEJZeWxP?=
 =?utf-8?B?KzlnZmdjQytzMGpGeDNOcVlBVEVzdFRWTm1PRVQwc3V5MXNJUW9HQVE2bUV1?=
 =?utf-8?B?MTRIb3gyb1BNOVdtTXkyYkhhL0dkcUhKUDU3NHlxTndJc0FJRHdWd2E3aFNj?=
 =?utf-8?B?WkQrdDk0QmV0dG1LTy9Cb0xtSnBpUUN0d2J0bVYzQ09uVVUxRm9YZmdWNUxa?=
 =?utf-8?B?ODhXeDl1Qyt2aUVVQ3ViQ09vbFZETmtJK0YwTzAvQ0FwMEtJT3ZFUFM1czdF?=
 =?utf-8?B?eVR6RkMxSWNKYXNPUW9pWjZnR0dmcHVsdENmKzExNjJwY3BjODdURlZPb0xJ?=
 =?utf-8?B?WUdJSzZWeFNvTHkwUHc4OUE1YWJDUGVod1ZKSUl6NHQxVUdJcHU3Y283UUpT?=
 =?utf-8?B?L291RHpuR25jK3I0VlAranV1SU5RVU5OK0lmSWVMM3B2SFYrajJZYXYwMUFy?=
 =?utf-8?B?andqamx4VXBSdHNqbHBGTnM4N2xwcjJaVzNybkJMQWtkUUdTSjRWUnJNM0lN?=
 =?utf-8?B?b1Nobk50Zkh3eU43cStzeHhRbFdGaWI4U2RCYWw5dUp6R2cyYW53bXlCK3dK?=
 =?utf-8?B?Rk9DdTFDbFBuMzM1dUxvMUpUY011OGRWRXFBdWQ0WHFadG92TlphenM2KytJ?=
 =?utf-8?B?RG40d2g3NXJrUExKRnJ4UW9FeDFacmFsV1J4TDBEUmM4bW1MUGFSRC9aS210?=
 =?utf-8?B?SzlSSXVwLytzVTQzT3lORThGLzdPNnFnSi8wMS9iZ0NzWTVoanhXM0k2alpl?=
 =?utf-8?B?T2dTSVl1citEWktobnlFa3FMNkJnWWxFQnZia1I4Y3lGUEpoNVlxc0orbFh3?=
 =?utf-8?B?N0xNbG1yeGlQSlN0Y0p0ajhxaVBia1dIYnUxRmNjakRrT284WFNvRDFob1dX?=
 =?utf-8?B?TlFCTTA1bGYyYUhaQ2JSdmRDQ1lRMkJaRi9OR3F5Z05uOGNnN3hPeEtyNWVu?=
 =?utf-8?B?K1YxWTlGRElndGtmemZHckZMdCtsOU5LNVFjWktlOXNab0JGaHRHQ1ZKekxY?=
 =?utf-8?B?QWxTeUcxMW5RRW91cUdES3FVdFpSMjZNYmR2alpMbXNNRTVnK2JBQ3NqR0xm?=
 =?utf-8?B?MXdITUx5QVVaYmRoVGpmdHh4ZlNHSG15eVhBVTdYZUx0R1VMbDluS0V0RDh5?=
 =?utf-8?B?bmFxdEZHKzhWSFdmY1VRR0RhZTQzQjFPMkVkZXgzTXh1Zk1hL0g2SklWTDFo?=
 =?utf-8?Q?v/U+OKoeV4+0nBwrKrC53alDp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea548520-22e8-44f4-d4d7-08dbae2a38a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 16:07:36.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLTHQkW6tgHiwKBsW8yKUJYHf2uZVKvzGMR/Y0URSts+u0k5ygAA2hqNLMiNwwaT1YtYmQrPAVC0v1aEWmXVuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416

On 01.09.2023 20:25, Shawn Anastasio wrote:
> Hello all,
> 
> This patch series performs all of the additions necessary to drop the
> build overrides for PPC and enable the full Xen build. Except in cases
> where compatibile implementations already exist (e.g. atomic.h and
> bitops.h), the newly added definitions are simple, unimplemented stubs
> that just call BUG_ON("unimplemented").
> 
> A few miscellaneous changes were also made to non-ppc code as well,
> specifically a few missing header fixes in common.

Nit: This is stale now, isn't it?

But what I really wanted to mention here: Something's odd with how you
sent this series. I received 0, 1, and 3 as one thread, 2 and 5 as
another one, and 4 entirely standalone. The list archive [1] has all of
2, 4, and 5 as standalone mails.

Another thing I wanted to ask: Would it be possible to configure
whatever mail client you use for sending patches to send plain ASCII or
UTF-8 text, not quoted-printable ones? At least for me, so far having
shoveled in most of your patches, that encoding gets in the way of
running a pre-apply-test with plain "patch --dry-run -F0" on all
patches (from a script I use for committing). I can help myself with
plain "git am", but sooner or later some patch will end up having a
collision with something else having gone in, and then I'll need to
manually clean up after the failed / incomplete command.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-09/threads.html

