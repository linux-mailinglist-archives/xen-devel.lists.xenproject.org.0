Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C86BABFB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509989.786833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNJT-00060N-9u; Wed, 15 Mar 2023 09:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509989.786833; Wed, 15 Mar 2023 09:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNJT-0005xU-5L; Wed, 15 Mar 2023 09:20:51 +0000
Received: by outflank-mailman (input) for mailman id 509989;
 Wed, 15 Mar 2023 09:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcNJR-0005xO-A2
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:20:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abad03f6-c312-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 10:20:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 09:20:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 09:20:45 +0000
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
X-Inumbo-ID: abad03f6-c312-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URNNY+NSxLTPSIi6yFrtfKIb/VYXVxXhr5fi4+BGLC6M9IDbfYtQAZn0Qv2E2eO/vX7yWIbfLVB7uELU0zvyoTByRgZI2kqOVzmw8LvY32BbGRDFXilkQup9rqqFcU+kv4TSY1qWzpTwhA5KX/zRbJ3nimpmZya4Skp/elNNfQmesvrrwukYNvsCV73+GrU/B1Vux7pzGzqW4z7rWlE+/qhFlXcrA+lBJTZxIeA1MhPTgMkPZCgmBLzK0fuq3vAOhaM0arxzZ4/CV/I5fSPt/vpqGO0Ig4Iy0sWJpbM0JWXrNiKy/UkbeXSy3o8fJPbBiR4PanPLRhbkH4fbKjFGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7dbUSxHkY0cgDrV/Kwj+84iT+fsdI0HB6f/O2/Grx8=;
 b=eLIyBWOJ459xs2iMUVx8MA196kbKk3/CfTvmoLXwkPf6dGKO285AUkKNSR/Nm++1azgN0H4Lg4sROIhO8WRB5N/6aYw8Mpw0Ys2N/P45cuyRG5/0YLZjze/jgV64Y7Rduph9KBlMxhUmcVOXIawurKV8nO948F1+SA+54aVoj9ckBlLgfjbTCi8p+MfnJf3MbUuOi7cTcIiZ7DVUz9t7Qg7HqUYqLyzgPJWbrWSxKppoGWaoTjJIvV9E/lL0Gj3yE+2pTVMUwRqa4rPm35xnAxoBISq1cxzqgku12LZ6kVQDKHosxHfnpqv1RzSbGX04KZIQ5Ux+UA2RoVIkRvyH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7dbUSxHkY0cgDrV/Kwj+84iT+fsdI0HB6f/O2/Grx8=;
 b=rsA60ucXBztdxkdJtxBorHAbSb05qfBxUKbBpQcCPp/ngknFVkEqEWGXfEyHlVy4sghd5Zc15R93pic/agzN81yquC5P6bOz1fZ5A7YnJ7gyOOsxzn3KnLbbV2sFGb8ftcELEpR3q2zJaW3ENUmHDDYlrhZoCiltz2np70y23nj58uHsNUpvsOlQ5LAOP5/RfEqvya0Dqi2ItTxsQe5XVxEWDwvzxifFI3SKRW/DCZjw67ueCk1XMvtAvhWccXq7hOqtodbBgnSQ+U2v0OyM/B69iNOQDagL2RCJ92NWvslGxseQn3j37tnMWQ6Yb/CSAXrNS6vd3b99GeWU6hwHWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e154f3c-1daf-1979-12f9-2baac097d292@suse.com>
Date: Wed, 15 Mar 2023 10:20:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/10] SVE feature for arm guests
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230315090558.731029-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230315090558.731029-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2d6c10-1875-472f-65b8-08db25368e45
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VrpdipJrnmsxpDt+cuaYQyu1BQu78NVEACcaD0MUBLTrdn7RqB0xw/rB9cCBx+T0Z6iy2/Nh60b5lxUiG5d7BoINSHaJdxt0x8/IQALk75o5fVwKjpRHCl9PcHJdAq+UqgJ72n2UWS315RJg3hk/QrWTKgflu7/poYr0pv7S6cBc2in+gIDxq/TvJw1siIm1LrsT9q3pMyDW4kq9fNKxje79NyPSeZ581wpnNaHH8ErC/r9IgAD+OrYFZbWbVn5HKh3OCM0N+BvUeGswBXwukZZt0BO/BHoDV8n+Xage/MzkoJ9tR1B6Uu8JBzXnQoUJsiqoNYCOSvapQ6iiICtnIInXAyXYcX8/Z6GUkkstmb5MLGk14N0n0fpnznsV/5qtEIUQSzJLCdyfVzmmAvt0jgmCnJAYXIAGCT+n/xr6qmRUFzJS23e94QIa+6yAEw6PxJYxuX3P8SIpdEJKIReBBmosBphx9e1JumJGbvfUuAJmRBEw6mJpcWpA76tVtPaXm/0+GTaaHXPbMyJ50bfaVSIv26bz6tj2TVL2T+XsK7uzeRaJGGff5hIwhiuqMLiSWHrdCf+lrbwCHLsGl3SjfSc9RH2UG9SKxCLCZ/1ieuEUeIm4OpTMx+EQ+GyP6qxAsRfMDK/lnUePBVN/Cfln8oaHcXtfPUQvLbbSR724vaVK1UkW4ScxsghcL83j3ihe+JYjiocqO1YyvmbogKETp/Ngu1SqB4WGczb6wIgExIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199018)(86362001)(31696002)(38100700002)(36756003)(7416002)(41300700001)(8936002)(2906002)(5660300002)(4326008)(83380400001)(26005)(6916009)(316002)(186003)(6512007)(2616005)(53546011)(6506007)(54906003)(66946007)(66556008)(66476007)(6666004)(478600001)(6486002)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXkrdSt2Vldwei9JT3J2MUFXOHlmd09KWnFFQXpvWW0ybjdsMDN4cVVncWRl?=
 =?utf-8?B?T1pFaFVLUENNQjJId1hkL01iNGlWR1BkMm16bENpZEM5K1lZc3Fsa00zZEV5?=
 =?utf-8?B?c0I0djl4bmZ2UjBzbzlUQ0F1aVZEK3ZMdTlEdnhRcFNIV09uWTdEUDhoSUZL?=
 =?utf-8?B?RlBibGJFSXUrN01XSTRKTmdSejRLS1JQc2pvQnRIdzFKSWJrTzVLS2tVaEsy?=
 =?utf-8?B?RDdoSmdqUTZ2aHdMUVlIK3d2OGZGb2hWcGRrZmpSRWVvVGhOdmR4cStnTklO?=
 =?utf-8?B?VTVmOGhuWWRWRGhQcVJZUHJYY2tacUlQR3BGQWFKK0hkd3dpNWlHN014eHd2?=
 =?utf-8?B?WDk0RloxYXhWU0RvUEgyaW5mTkx4ajlheHVtY1NacUpwajZHdW9oL2FNTTA2?=
 =?utf-8?B?bkczU1NKaENvUHkzSGdPMnBvSDdWZmI0Vk5XOTZjWjhXSFl5WjV5WHFISm9R?=
 =?utf-8?B?TW1SdGdlVmdyWjc0c1hrTlNkOUJ1Ymo5eWhGM0UvQWRpR3JjcnJjTDcrYXVQ?=
 =?utf-8?B?blEyVURnTHZsaERXZy9nSmpxS1gvaC9UbElsVGdYSjhUSEQ5aVgxR0JFRVQ3?=
 =?utf-8?B?Um45QWpDWDBkYlgvb0lrWEdLaE1UK3BIZkIxMWxIcjgzTnk5V294dEJQUjZw?=
 =?utf-8?B?dlRXdmV0c01vKzdTR2pkR1JGSkhmQ2JVc2lIcS9IbzZjK0RId3lsdkFiZzdy?=
 =?utf-8?B?MGw3dGo5QkY0SS9EOHV2Yy8rb0FybzZDZ0hMQzkxRFpCb1FlVVRsdjE1c2xv?=
 =?utf-8?B?MWkvbjh5Q3pvY3lRYk9uVE1uT0R4NlpVcWtYd0N4SHdYQk16dHFUMUFGV0o1?=
 =?utf-8?B?czVQVmdFeUpyUVBsMTBrdjFnKzAvRndGNG1DMGxkTHhQUFdRYUdvN05rOVd3?=
 =?utf-8?B?Rkk2ckRveVlNZDArd3ZPQXlGbVdlRTlJamhPeDBHdXRPRXB5VUZVWE5hTkIw?=
 =?utf-8?B?cHVpU01MOHRpTTlmTjI2bDhqd2drSVA3Y0RuTmhOR2txdXdMbzBNQmFJU2w0?=
 =?utf-8?B?Y0RUc3kwS1hkN1cvTDd6Ty9aWFQxOHd5RFVoN2lsOHVIb29HbWRVbEFFWXg3?=
 =?utf-8?B?NVpjVi95SzlwTW9ybVU2NTc3dE9hMytrM05tTVVWWllRVjFUcURYY1VrQk96?=
 =?utf-8?B?cUp3K2hzb1BzZDVmeGxWV2N5U2FoSzE1ZllaOXJtU3FHa0JwRzcxUmlnTnZi?=
 =?utf-8?B?TFBlcWplMUNkM1pqb3Uxc0J1K0NyN0wrZ2NwSE9CTVN3Rjdaby9TQm00b0R0?=
 =?utf-8?B?M3BqYyt2OHNxaWRyWCsrTUxHelgrRTlSeC9qRDdWTXo1Mlp4Z0hTejhMQ1Y5?=
 =?utf-8?B?UFlPcWNTKzRGTDVGVlc2QlFraG5peTM3TXRYbkFMelk4aERlNFpyU1JYVjNR?=
 =?utf-8?B?Y1NFbTNiRHZiNEJMaWE4ZmpmR3I0N2VIbVRxL1IyQlVMODdtRm1GUExQbnAw?=
 =?utf-8?B?NTg5VDN6aHJQS3k3Qm5lVWFkanY0SU5CSENRU1FjcmZ2SW1BVlRMOW9ISFF6?=
 =?utf-8?B?NEZ3VEZzZzlXYldXTVkzREpTWGdJR05hdFAyVVNZeVJRSmpuTE53TEdjZk81?=
 =?utf-8?B?cUUySy9nVTFlcExSSEFVSWRkS3Eyemo4R1dSL2JWeXA2VEhINWwvNEJEOTJ2?=
 =?utf-8?B?WDdsTDNWOHVmK0pYMHFsNUpVM0JVMDdwa1B1SHdqWmVXSjROSGpyY3A4bGQ4?=
 =?utf-8?B?VEkzTmUremNtSTUwcThOcThVTGYzY0VsbG9nWEh2TXMwRGt6aEN2eEhRcERk?=
 =?utf-8?B?RnNZeHFSMzJGMDhEYkJVMlI5MWhleVphOS80Y1VNQXFxUWsxSmNkeWJmNWlE?=
 =?utf-8?B?czd4VjNyREg5MThPZHprTjhKZ0l5Y2dxa0VISWRGaHRvNGx0QVFCOUlQblRo?=
 =?utf-8?B?M3AwVUZvdlJ2Z3dLa1pLMmxISkR5c2tOZE5jaS8rQ0ZqWVRIT0IwMHo5THRP?=
 =?utf-8?B?REpEcjVDeEFVQ0h1LzFyY080bEV4anI5N3FydW12YzF0QXJKc2p1czJwbkZU?=
 =?utf-8?B?bVJFR2R5L0xQNVdvMkF5QWpvaktwaHkxVUlJRis4SWZvdGdyeDZSOURUQXUx?=
 =?utf-8?B?K0xhRG9WS1ZwejFId05pK1JoRmRlSktodkdRRUpYV0FSRzdDVE5WNzVlZ0FN?=
 =?utf-8?Q?+x5cwColRtXO7HJdetB89F2g1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2d6c10-1875-472f-65b8-08db25368e45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:20:44.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vjp0W/JLsiDHd3dVa2ir21+EWcDHkN1ouBaBq5WmZ9ZlQM03bZK4diRXPjTWWGSD9Ba5M16xcf6atNL9n2YUiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308

On 15.03.2023 10:05, Luca Fancellu wrote:
> This serie is introducing the possibility for Dom0 and DomU guests to use
> sve/sve2 instructions.
> 
> SVE feature introduces new instruction and registers to improve performances on
> floating point operations.
> 
> The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE field, and
> when available the ID_AA64ZFR0_EL1 register provides additional information
> about the implemented version and other SVE feature.
> 
> New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_ELx.
> 
> Z0-Z31 are scalable vector register whose size is implementation defined and
> goes from 128 bits to maximum 2048, the term vector length will be used to refer
> to this quantity.
> P0-P15 are predicate registers and the size is the vector length divided by 8,
> same size is the FFR (First Fault Register).
> ZCR_ELx is a register that can control and restrict the maximum vector length
> used by the <x> exception level and all the lower exception levels, so for
> example EL3 can restrict the vector length usable by EL3,2,1,0.
> 
> The platform has a maximum implemented vector length, so for every value
> written in ZCR register, if this value is above the implemented length, then the
> lower value will be used. The RDVL instruction can be used to check what vector
> length is the HW using after setting ZCR.
> 
> For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so there is no
> need to save them separately, saving Z0-Z31 will save implicitly also V0-V31.
> 
> SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie the
> register is added to the domain state, to be able to trap only the guests that
> are not allowed to use SVE.
> 
> This serie is introducing a command line parameter to enable Dom0 to use SVE and
> to set its maximum vector length that by default is 0 which means the guest is
> not allowed to use SVE. Values from 128 to 2048 mean the guest can use SVE with
> the selected value used as maximum allowed vector length (which could be lower
> if the implemented one is lower).
> For DomUs, an XL parameter with the same way of use is introduced and a dom0less
> DTB binding is created.
> 
> The context switch is the most critical part because there can be big registers
> to be saved, in this serie an easy approach is used and the context is
> saved/restored every time for the guests that are allowed to use SVE.
> 
> Luca Fancellu (10):
>   xen/arm: enable SVE extension for Xen
>   xen/arm: add sve_vl_bits field to domain
>   xen/arm: Expose SVE feature to the guest
>   xen/arm: add SVE exception class handling
>   arm/sve: save/restore SVE context switch
>   xen/arm: enable Dom0 to use SVE feature
>   xen/physinfo: encode Arm SVE vector length in arch_capabilities
>   tools: add physinfo arch_capabilities handling for Arm
>   xen/tools: add sve parameter in XL configuration
>   xen/arm: add sve property for dom0less domUs
> 
>  docs/man/xl.cfg.5.pod.in                 |  11 ++
>  docs/misc/arm/device-tree/booting.txt    |   9 ++
>  docs/misc/xen-command-line.pandoc        |  13 ++
>  tools/golang/xenlight/helpers.gen.go     |   4 +
>  tools/golang/xenlight/types.gen.go       |   2 +
>  tools/include/arm_arch_capabilities.h    |  32 ++++
>  tools/include/libxl.h                    |   5 +
>  tools/libs/light/libxl.c                 |   1 +
>  tools/libs/light/libxl_arm.c             |   2 +
>  tools/libs/light/libxl_types.idl         |   2 +
>  tools/ocaml/libs/xc/xenctrl.ml           |   4 +-
>  tools/ocaml/libs/xc/xenctrl.mli          |   4 +-
>  tools/ocaml/libs/xc/xenctrl_stubs.c      |   8 +-
>  tools/python/xen/lowlevel/xc/xc.c        |   8 +-
>  tools/xl/xl_info.c                       |   8 +
>  tools/xl/xl_parse.c                      |  25 ++-
>  xen/arch/arm/Kconfig                     |  10 +-
>  xen/arch/arm/arm64/Makefile              |   1 +
>  xen/arch/arm/arm64/cpufeature.c          |   7 +-
>  xen/arch/arm/arm64/sve.c                 | 119 ++++++++++++++
>  xen/arch/arm/arm64/sve_asm.S             | 189 +++++++++++++++++++++++
>  xen/arch/arm/arm64/vfp.c                 |  79 ++++++----
>  xen/arch/arm/arm64/vsysreg.c             |  39 ++++-
>  xen/arch/arm/cpufeature.c                |   6 +-
>  xen/arch/arm/domain.c                    |  48 +++++-
>  xen/arch/arm/domain_build.c              |  11 ++
>  xen/arch/arm/include/asm/arm64/sve.h     |  72 +++++++++
>  xen/arch/arm/include/asm/arm64/sysregs.h |   4 +
>  xen/arch/arm/include/asm/arm64/vfp.h     |  10 ++
>  xen/arch/arm/include/asm/cpufeature.h    |  14 ++
>  xen/arch/arm/include/asm/domain.h        |   8 +
>  xen/arch/arm/include/asm/processor.h     |   3 +
>  xen/arch/arm/setup.c                     |   5 +-
>  xen/arch/arm/sysctl.c                    |  11 ++
>  xen/arch/arm/traps.c                     |  40 +++--
>  xen/include/public/arch-arm.h            |   3 +
>  xen/include/public/domctl.h              |   2 +-
>  xen/include/public/sysctl.h              |   3 +
>  38 files changed, 748 insertions(+), 74 deletions(-)
>  create mode 100644 tools/include/arm_arch_capabilities.h
>  create mode 100644 xen/arch/arm/arm64/sve.c
>  create mode 100644 xen/arch/arm/arm64/sve_asm.S
>  create mode 100644 xen/arch/arm/include/asm/arm64/sve.h

I think I had asked for this before - can new files please use dashes
in preference to underscores in their names? Underscores really should
only be used when other possible separators aren't available because of
having other lexical meaning.

Jan

