Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C3757CC4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565215.883178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkPS-0001Lq-4K; Tue, 18 Jul 2023 13:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565215.883178; Tue, 18 Jul 2023 13:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkPS-0001JN-0p; Tue, 18 Jul 2023 13:06:34 +0000
Received: by outflank-mailman (input) for mailman id 565215;
 Tue, 18 Jul 2023 13:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLkPQ-0001JD-VC
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:06:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98200f1-256b-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:06:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 13:06:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:06:29 +0000
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
X-Inumbo-ID: e98200f1-256b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVxI7K4oAj51WXEcyj8XS4K+rW2HmOL5BaB2lp3L9Lzeu45FWvLVAeIicKm5Zp1GIGoQJYd3DAkbg3lwNB0w1ME1cSccjE8UVR07QcpEJANzWqqGsy5EvljSz6joT70/kz+zLI5R1W/61IX040XP3lAg+GYTOhwlYCLTxgJme06sroUB30qHT4se8eQnWZCXuUWsIocfJSZteAJdV5sdiY4IROyza3JbODT5ej2wKEcXE7yyqf7DoivD+YFog2UE3RH4+4oAIC4aPrW20ceU4kyUpCmSbt33QkMyqAj+rUg7ona94ObO+pTw1RvSaJBcP3gXGu4NOx2s4VTO+kCTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPqPgoT4k8wL5qzUOiHnxa3r8psJx3xRHU/IoqRD888=;
 b=TPZDX1v56VuRSIqwsYQlWFKGaAQjnxCygwj6Z8Sl7s7U3q1gZp7hr1hAJ6FcsheBsFMr9QofAGABTzHoE8hdej3/H0B7Y+39w/+Z/WSmcNU2QFzUJ5/+lRx8HFyoxhEwsg3TS24L8qn3LKlB6otGZHNM0omSH3zeuR/tVLK1GnPKZgW6dDJpLGrQ8IKKYip4DOiOm9yJcjsiL+Fz0vXWDdXcgNNug4Rbmm67Gn5qSaPA5hdG8Sv75IeKnxAMeFNvr87410mdmQr7QYCPYaxOBsKhWvH4uubOK0/hSZOGUh+7kcEhJYb8/3jkFORQyspSX3utWlArn9jErI63DN2OfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPqPgoT4k8wL5qzUOiHnxa3r8psJx3xRHU/IoqRD888=;
 b=Yonv/fRbCCyWjFJNomytsSaiVlsti0U8sNFg+4bxLvSTggpgMPUjLZUeVsD4suTx3vumzmRscYCb92JToLCYanWmPo6hbv0rGFQyilBi7FXErO0AbG2Cx6rjLM6yzEZlDOs4m5WA+tH4og7FJarVlGD/KiwEmne3tV8YhihpiUs5PWLbhfIqZX+UKIuHhOI29pMNjCIVWlUsSxB5RM8UqMv2Tm0JGgXx1TF6m488zVd5noGiWN4ljks3+qySONLr68F9ErhFvgoTtMSDjGrdIRFP46EbDYZtprrQaGz1fGEXex62HVoWObYf67Qd+M+lvB65Pr5WdsTSDRdH62/F0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <119404f7-8e6d-a3e0-2d29-d34ab78a6a2d@suse.com>
Date: Tue, 18 Jul 2023 15:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] Make PDX compression optional
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <7ad1dc72-3b1b-fa7f-8ce4-dd7973c8da93@suse.com>
 <64b68c65.170a0220.b0fe3.40f1@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64b68c65.170a0220.b0fe3.40f1@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: b232bc3c-b73d-451e-4e91-08db878fccc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Q1uwdjynsD4e5IS0P3AxnfKWKPRBpsay35dA1vvgUCU2CZVWAmZt9srJQG09BZtPl3mSk+8lCpiwVlSjpjDUfX8x+73zf/iI9KnF4h7fMunIp1vtqePFkBmmSlcNRBK3JDxAR15vy7dY9ezBasf+unBVnNgxtcl7lHPrvI/gLmNbOJMu6o9svLswlU899RJpzABVsxnCLuQrO8ivOMaz2GUeUVGbwC/7LEK2JgVbYmbeRrC3YQtnCpsIXrSwnVZw7SvktnOKIqsH5ThVc0udQZ1+maX7Om21ujMSCHtBbNahZiN8YlgzX5bFwCbRV1uEJzSCIP32U0uEZgRYzmnYlWfO/2T9z+HJ1P81WUm1Da4d5slVThcG7Ny8EOPyklxpHGVXQWEZ021ZrIjUBKuCyWhXTCwP2R3J+lRv3jTeNKJQAQqPi2pKGxs38TFvA9jF0OTjOae1E0Q494xsGuGL7rHeaL+zRiXjsSxRnuozwuDndye2hOCjLLSK/O+3jr2bqIseM0ClCdLZwrtry4yCVVt2byLNozyYNoGmZe2F+xpjTb9JHgjxH9kjPfK8z4YFAYXFz+qU10ga79dKoQ7JLIZqTKn4wH5uNSrtolD+8gxVtzlrKQmBBspxJbs1Co8i+A119JeQ8bkemVoZ1oSiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(38100700002)(8936002)(8676002)(4744005)(2616005)(2906002)(36756003)(26005)(6506007)(5660300002)(31696002)(53546011)(186003)(86362001)(7416002)(66946007)(6916009)(4326008)(66556008)(54906003)(66476007)(31686004)(6486002)(6666004)(41300700001)(478600001)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCtwUCtteGY5aDZYRUJ2N2dUQVZ4dXJtR1hsNjVhb0JIZW9LY2lad0xyZldl?=
 =?utf-8?B?OXRWQ2ZOTFRIdTJleWVOeGRVQkZqeHBpYTAySzhwU2R2bnJ1Q2NrUjd3azBr?=
 =?utf-8?B?UHNZdGNMSzkvV2x0eHF0bGJSbm45aDhub0xmYUJVWWo2aXNyR0kyalA2UTlM?=
 =?utf-8?B?VENqdE8zOThHRGQzMDhLTkgxS1llRWVDZGpjaDFPakUxMTFScXAxdVV3cmV3?=
 =?utf-8?B?SjNEMUxQMHdqcHd3OUlqRlJhUDlZTnFGdFVrd2JTRDI5MDkrVEU4YXM3bTRR?=
 =?utf-8?B?UUdudjdxbE0yektVL0o0US9jUnAwcTh2Ymsvc0puVlBNa1BlWGhUb3pDYlcr?=
 =?utf-8?B?ckdrbU1meHg4MEZOVmRzZWFEQWZCd1huekxWOS9kQlcxU1dqUWhBbVFSaTBo?=
 =?utf-8?B?QThHUVFCNndCc3Q1a1dCczErb2psbHBpaFpla0orUU10Z3cwc1pTU1VFRzNm?=
 =?utf-8?B?cWw2ekZsRjM3bnE0WFRyVW91c2thaEkrNlptM0FqckxFaUxBbVJaU0J4dkVy?=
 =?utf-8?B?RWhDU2w3MmFSTE5EeTdWVEYwVVBOVHJDL3BwV3kzL2V6WnYyWllWUU51RFNV?=
 =?utf-8?B?WURTeHZuSk9DakJxRUVjS3c0Q3dvdkwrTnpiVGdIT2dvZGV5UVREV3FTd0FZ?=
 =?utf-8?B?YUZacjNTd1ZlOWdBNE5uTUdMZFVvZVF1aDlQRjJucmpsZlVjN1lIdzZkMjNW?=
 =?utf-8?B?TktYUzdSZ0NlN3dwQWI2bVozcTRlT3AzRXZtVTJ1b0t3d0FDRGpBWUxsOG8r?=
 =?utf-8?B?Sk5lYi9KS2pzb3ZmVHhaOW04MXAxdjA4VDRMSS8wbVNpOXZoVWZlUVVZQ2Jr?=
 =?utf-8?B?QncyR1RyZlBIOTRUM2RpcHJGcjRqTFRCNkVoVzBtb0NKaW5UZjd0RVFjVVhW?=
 =?utf-8?B?RkZ0Wit6cDdWSG91cUVaV2dKNm5oR2d2Q2dlaDNaLzVHYnM2R24wcFptNGs2?=
 =?utf-8?B?YUtoKzlLS0hmS1M0cjZkTEpUUlZUd3pkRXp2T3g2OUhrcG44OVBjMWlCaHNG?=
 =?utf-8?B?dGZ6dXJCMzFCdCszeWtSOG5Hemo1UGtvcFJCOUJIdXFaOXBMTWdjdHR6WVpZ?=
 =?utf-8?B?dmdIalNnVk04S2I2WUNGZVRhc1hVVnlwY05LTkZsTHMreTd6Z2ZzODNoaENi?=
 =?utf-8?B?Sm1qazk0MXBrYU9ETmN6STFFREhDVFFZV3dzc1pRaVNGN0s2SFF4a2Zwa1Fp?=
 =?utf-8?B?Z3ZtMjZ4UHJhbmJLRW1TcXpDRTM3SlJrcDluYjVkQy9Ca0xrZUVnVEpidC80?=
 =?utf-8?B?RkhHUG43RXprQTBIYkUxUC9HWk5DaEpqT29oTTIybnlUVnBJczE4VWhXYnhk?=
 =?utf-8?B?alh6ZjIxZUVOTXRNNHVTem9FdjR4SE5YZUFnSkFRRGJBOGYrRVlYMWk1MXN4?=
 =?utf-8?B?T1lnbmhuVWZFbHJnTThmc2VtcGdsRHZmRTNpWjJsajA1Tnpzc3dPMm1ZVUtX?=
 =?utf-8?B?TXViblVRdFIxeTdiNHI5MlJRbEJKWUpubUNMZ3lNNDVVVUhOWE1aUXN0dDlw?=
 =?utf-8?B?L2thSFRpY3dzbFk2SngrTUVnWjBROTVwaWhaQytUVGVaSUl2ZnBWeWk1T2N5?=
 =?utf-8?B?aEtQZUpZb1gwd0xRck93TldTU1FTMXRhMEpKNWhLbWZOQTRWc3dnVW9mTk9V?=
 =?utf-8?B?N1BMZzAwRXovVFdLUXVZZWFLVjFwbS9oNEhrem9rMVN5ZExYSzFBaExscjBX?=
 =?utf-8?B?QnpQd0ErYkJMTWJjVHdLSys4cERST1hoWlh0U0lscDFuMzhrZ09Va1NSMTk4?=
 =?utf-8?B?d01nSGNZTDdLS3ZaVUcyYXZjN3d3Y1o3MEx0dUtIeklRMTI2RWppWDB4dm1X?=
 =?utf-8?B?Y0V1YUpJSm5JWk92TlVMNk1vcFRaa25SR1loTG5TNFJ4alQ0eDd3YVIzMXhJ?=
 =?utf-8?B?ZlJCclVWcCtLTVdLZDF6bmQrUkdoQmlMcDc0Q1hQb1NtcnNSZk5kVUZSMVY3?=
 =?utf-8?B?V01kRE9oK1UydUxidUxRbEF2cWdKS1NlR092b1hUSm1MOE1SNUQ0VzRObnZ6?=
 =?utf-8?B?YXVsbldRUmpJOFJDOEZicW5OYURuSHBhN2JqdU9VNWN4cU8rdGMrTGlhSFFn?=
 =?utf-8?B?Ky9JajRoNko3SmxOUE1GVzNKbGwrcWFQUDJKMFNHR2ZFMDRJL3BvcEVoT0JB?=
 =?utf-8?Q?xXURd1N6r0GUaLhJ0C0MJf7OB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b232bc3c-b73d-451e-4e91-08db878fccc4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:06:29.0672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC+e0i+lxJ/xPB8sZiPqNC/CBinU+hvYhwi/jEeP/QoJ9MvBmzsw/FB2xEUGIEi389BNJN0LscHlL+boSqTA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564

On 18.07.2023 14:58, Alejandro Vallejo wrote:
> I believe the burden of proof is reversed. Features bring complexity, and
> complexity increases the chances of introducing bugs. It's the presence of
> a feature that ought to be backed by a proof-of-requirement, not its
> absence.

The feature was introduced to support hardware a partner of ours was
working on at the time. Xen wouldn't have worked very well there
without these additions. It is beyond my control or knowledge whether
any such system has ever made it into the public. So at the time of
its introduction, the need for this code was well justified imo.

Jan

