Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D531A5A1608
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 17:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393496.632490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRF3f-00087x-UL; Thu, 25 Aug 2022 15:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393496.632490; Thu, 25 Aug 2022 15:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRF3f-00085B-QX; Thu, 25 Aug 2022 15:46:15 +0000
Received: by outflank-mailman (input) for mailman id 393496;
 Thu, 25 Aug 2022 15:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRF3d-00082l-Ue
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 15:46:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bda8f0c-248d-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 17:46:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9177.eurprd04.prod.outlook.com (2603:10a6:10:2f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 15:46:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 15:46:11 +0000
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
X-Inumbo-ID: 0bda8f0c-248d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCqEcw5sj86CAujPiDTLuevHNdJe15ue5XmbeGjdZlTQOm5DO8POY1vlrhipdOYHMdGC14kUV8bLLeBu0TPU/RbZ0XpOEiDyVZWZ28HkZnh8EZrG/ZpFYFTzTsTrRY6Cl89THVU1wCYPMcnTVkZlvdNTZbTmb6mdtj52PcSpGBWXBoT5ky3BkH9V2We/6XNTsjpldiUJCxMDkWy6NeEjamE83ZteTi5VCux14LGJ2r6N7uBmumJxCTHWdSAFmPsFU3uLflvrj0PWkdlZRL8kRI6kZopYm7hKU2HrR4KRBMNT6EoUzVoI/LunVEpzPOirEt+WE95sVFtWuFnfNhN3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocOKdxcbMaMPkZz7smLBr+blruA5J4R6RDHZZYPG5Jo=;
 b=GRPFJHOg46caSl3wEzRZLdi61qdTCfM8pXPalLu01ADRFNQxw4PJHmJkdpvpIyuRuFipmxvzJIeiDZp+hQCkFN6M2Em/Trz0AP5cd/WoXi8/fOCFO2uIR2HBgLWm5Ug2Ws4plYQTljIOiDxfaHvduwJ3E7WK6ai+qt3k/t9sCeb+O2tctkC6FLSCj20uh3Qylpk5smUEcOvsUI1+l78NDsPWQkGrmBJ1lQ/r5QKK9+r+Tr53X4nCR4OOTLn2knj4EERJ01I8ErkCBCyC7Ghn08n7W8blbO2/WS+oSDQaG25E988hag/nPgLiwolo378UBSnqjNsa4DwvavOgOFjjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocOKdxcbMaMPkZz7smLBr+blruA5J4R6RDHZZYPG5Jo=;
 b=wQPd6y1YCveLc2rtMOTtzEmWim54gOu5kzCwtCn9ymiuk03PwKrUHvNURJcMfglt9iEwXkrVlG51taOclYp/9KDsIr5C6oaNlH1GiMinrnrJZ6+Yj0Xg805IwiZYs0JdyWqt69sdu9gdIbMDzw/HnekPgnaacMve4PC66xIY5NPznRcRyLlhnZmyei7ESnbScbxGUUlInAooNGdpLfIfnn4cFd8wIyZu1Git51wCtJTL3UBgPbRQN4BJNsDH95L9dD2q2Pr51dQZ7v9bTNRQFtm4KR25a6IgIXkdTbCcsUXnnSge0KYedbuQf1j5O8jFaixwRoavAWoXAkG5r+JSlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0ffbfb6-6cf0-329c-fc97-ecc4ccb2697e@suse.com>
Date: Thu, 25 Aug 2022 17:46:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 3/9] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <3ee5187c066ad12e3717df6fed41de99172271b0.1661181584.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3ee5187c066ad12e3717df6fed41de99172271b0.1661181584.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ceac2de-9e89-4a51-2d6e-08da86b0ef51
X-MS-TrafficTypeDiagnostic: DU2PR04MB9177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3RCMh6ESsMN2U76Lcx3Zt/TYs3PPiyK/623aRkgc8uEaQvnGPSFU9waAHS5h5y3/WekWu5Cxw8QqfWXfm/tp15pTzvfLwdRnHgExbIAeAX2Gt5bErYbY9PY4+5Zu28RcOGGHREY0RW8vCZ/hHy3McSnd/khtg/ieImzLtaHsB9J6vcuwinDeoyZxp5Z12mcMVfEbDnDD/swBtebKXxeDd6gP4QC2XKeejG032cVHy+ock7hKO/PWJXvg+fjpU44gK9Fa4mnyQ3kKR3lIfVq8T8qMbfiDg6Zcl7HkyaIkCSCIiSxMCgSeOnADnbwclLLDTOkdonPDCJ1QqKfqy56X34XaZQaIz308gOkBLKZ2RIkrS4+EFEvsrgLHzH0KEcm+BodXjsOhidVdZYcqKxpVCNel9JbxEQdv0shd6SsVfLRY0+8CVB3fFia3U/t/wgryi8Cr/lZB+Ve8sAJn8BC2JQP/kTSHOrZDv1aeuGQANo/0BDzZD3OFHmlBW1e1ugifcd2e84wDXuwY288oSbSoB1QOBHgCcLMorXak7OPf5sLt8XKaeoo64cKHjgqowaL2Q0oeCT8hARUYqu0l9anOk8+o7SZreJ636M+Zyn2JKuT3ddl3x3WXgHcAATxFJChvPJLYsWGpziO0yBQeY1NTCIOMVuKh9607sUGyNZi7/mC567blcu/nvUh5fpnCpX9+PzdVqSwG2wOj+vS/zytirzrelkG+vPbNLRimCVJfadzgAm7dD+Z0kc8FRgx+rPnJDXYfUMpj4UlqIwobbHCuR1pontN69BFd6rUgpPjxQYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39860400002)(36756003)(86362001)(38100700002)(4326008)(31686004)(5660300002)(2906002)(66946007)(8676002)(2616005)(66476007)(66556008)(6512007)(53546011)(26005)(6506007)(41300700001)(8936002)(4744005)(6486002)(6916009)(54906003)(31696002)(316002)(186003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2pGMkp1ZW1HbHFzMnpXU2lDOXZ2dWFRT3BUQTk4UEppc0M4K3V6djAxcDRm?=
 =?utf-8?B?L2hlZFZ1NW1uV3c0ZGN4aUptMUluMEdPcUNYbkE4N2QvSkhuNGdXK0xsQnhH?=
 =?utf-8?B?T3F5YXFlNWRDSC9rSE51d2VWeVkyT1BOSVM3YWVIckpIQmhxYUU4YXBsOStV?=
 =?utf-8?B?ZTdZMGl5S05OTnF3RXdsdW82bitLZUV4dS81aFJIT2tQNHJGbUxUSjlOUWNJ?=
 =?utf-8?B?d1NJM2NDaThxcWxJaWhyajNLbVNIRjBxd1FYRFdKNWM3V1JDNjhKQnJzTm5M?=
 =?utf-8?B?L05CZUEwZDM2cVNFYlNCZTF1VDM0MGx3NkNxbmRmVFRBSWhyUThzZjNvN0JK?=
 =?utf-8?B?WEUvaTZnbXBENm1IUWZacFNVOGE4cDFMSDgwc2c4MERaQkFrRWxBRDdTNkt3?=
 =?utf-8?B?M0dONnJGM0xhRVI4K0ZiY2JsOGZ2MFIrcENmWHYraDVvdGVGcUNEMTRIUG44?=
 =?utf-8?B?TjIyZkJ0c0lsU0g0WnJmSEpaeTdSaVVsc0NpQ3lHY1hmVXBLTzlRVm9PTllV?=
 =?utf-8?B?Z01ieTV2SHFXeXZmcWRBMjYrZ0N3ekhOTGJNbVVXd0ZQUGRBbUNOaWVxYWZ2?=
 =?utf-8?B?Nkt4bm9oTVlLdSsreXNFTjBxdnRyaitvYjZzSjVPZTNNcEpIRkltZE5zTldP?=
 =?utf-8?B?d3RIN3h1MXRJbjRoOE5YRENURDdvK0F1Ky8xZENXay9wM3J6aGRqQ1pGaXVx?=
 =?utf-8?B?UnRwWklPclNZbmp1QVNpMDUxdlArVzhOQjdQK3FjcnJDMlhIRE1sam1hM3JJ?=
 =?utf-8?B?ZFQ3Q1Jad0hRL2xSQnA0NEpvSnF2K2ZyS3NScmdCeHRiMEUzeDh4SDZhZ2Yz?=
 =?utf-8?B?VlpsQzE4NTlyZDdxd1VRVisweVhnazJ1RG40QmZ4dFVNdW9wZkVGRk50SjBr?=
 =?utf-8?B?eVc2NzhCU0ovOGd0YVVycForZFdEUXRXM1RON2dPQU82T3c3RitrOXMxVm5Q?=
 =?utf-8?B?OVRjWFVTdklDc1lCSkNDYjZXbzdhZUs1ajhNeEtsZWpxaFFrM2JXcU9RcjJm?=
 =?utf-8?B?VHZndlVBQldwMjREcWIrVUIwTFZNa3ZVMkVnV3p3R2cwb0gwVjdWZEhtTm80?=
 =?utf-8?B?Z3BlbzhHQnEyYnJlcnhlZ0dWQkJ4VHJ2YnUyOW04aEMxZElXWDBnTlh5aXAy?=
 =?utf-8?B?bm5UOVE2djM1N3phdzBlUHdtL3R3aUx2amQ3amhkN1BvMGVtcnN2M0FrRHU5?=
 =?utf-8?B?aENIemFLKzZ0M3FpZWgyckNCaVhnRnpuY3haakdwVHhlc21BeFplbW9OQVpq?=
 =?utf-8?B?NUt2UkpvS3I0RDhXZzVqRlVRRENDNGJMbXRHajdrMzE5L1h2YUJGQ01od1BN?=
 =?utf-8?B?Ykg1K3JaZ3B4M2d1VXlqMkVhYVlWd1kwOGhOeTVxb3ZJL252TXNZd3A4TXZo?=
 =?utf-8?B?cmExaFRqbXN2V2g1S3ZaTjBTNCtKajA3OWNNN2N6RlRnYzM2ZkxBalFhRU1l?=
 =?utf-8?B?ZWxka2c0NDNIN2pwRTNDNFhvR0RvUk1DWFZGcm9CTDY0ZXZtaXIvNEx0d0ll?=
 =?utf-8?B?N0w4ZzJsaEdnSkVZYXhWTnRUVG4rZzUrWnB1YkZjaEc4ZmczaG5nUW92MFVJ?=
 =?utf-8?B?SCtNbGJia2wyNjljR1BwVEFKNkM5MVdXQW16SGlEVXZPOWU1V290KzZzdjBz?=
 =?utf-8?B?NlhXcVl3dTB2enVBSS9rVXFhZ1hGZUM1SjE3M2lGZmxQeGN6elFGelFEVFpR?=
 =?utf-8?B?Y2drcHZYeHdWUWtVcXBxYXlnUkgvVG1KT25jbHNNazFkMHJZcXdNeVpMQ1lI?=
 =?utf-8?B?UmlnRjNyRTQ4cDlEd3VJcjRGeDJqTW1hbm01UzBNd0c4VkxEa3Qyc3VXT29I?=
 =?utf-8?B?cHlzT3BKWExXWlRaYU56a0xnYXdXYW9OQStsMlZ4Vjh4d2lCbFczRzA4RVNu?=
 =?utf-8?B?YklDTXlTVWN5a0s2MExwK0FSUmRIQU44RTgrZkdDQ3lReGZGOUlLUzgzK05y?=
 =?utf-8?B?NGZ0MllYYndOektIRWRWYlFKcVVYTkRGdkNvaGtLbERkQ1pYUHN1YS9FT2xF?=
 =?utf-8?B?ZE42WGJ3U2hBYW4xQ3VUL2kxbEthYkRHbmZUTDZ6WmNXbXpDR3BuWWdZRVJF?=
 =?utf-8?B?aGdCa1kxL2xQeHAvaDZ4aTVhdTNqWnZjL0Q3MjhLVU5xQi9paDdjZW9xV1Nh?=
 =?utf-8?Q?+uEMjdSlphKSQyYm2Lb3C5RuV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ceac2de-9e89-4a51-2d6e-08da86b0ef51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 15:46:11.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyJ9CzaD7aLK0UUBWpIeIvjcCGjobk3iNsZcBsKUKfLoADUyNNFpZTfcSIOfAr5pVB0lJ0SQ83Ni/1z0tQl/cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9177

On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
> Add API similar to rmrr= and ivmd= arguments, but in a common code. This
> will allow drivers to register reserved memory regardless of the IOMMU
> vendor.
> The direct reason for this API is xhci-dbc console driver (aka xue),
> that needs to use DMA. But future change may unify command line
> arguments for user-supplied reserved memory, and it may be useful for
> other drivers in the future too.
> 
> This commit just introduces an API, subsequent patches will plug it in
> appropriate places. The reserved memory ranges needs to be saved
> locally, because at the point when they are collected, Xen doesn't know
> yet which IOMMU driver will be used.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


