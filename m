Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B935C58F7F2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384200.619497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM22l-0003eI-Q1; Thu, 11 Aug 2022 06:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384200.619497; Thu, 11 Aug 2022 06:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM22l-0003bh-NF; Thu, 11 Aug 2022 06:51:47 +0000
Received: by outflank-mailman (input) for mailman id 384200;
 Thu, 11 Aug 2022 06:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM22k-0003bb-3f
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:51:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1025955e-1942-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 08:51:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM4PR0401MB2226.eurprd04.prod.outlook.com (2603:10a6:200:50::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.23; Thu, 11 Aug
 2022 06:51:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:51:43 +0000
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
X-Inumbo-ID: 1025955e-1942-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfU2x8SIsrmavYELMK+8XW6+Pe1q9+DpZxOtSKBZR7I5a6IZWXKOcSyLK7C/z4tj/EBNC+HoZfqqMedO1OO20QFRDYeg4KcNAeC0XCp/5od24GhnPs31vUMustOt+bxcilEI6NYOi8BKyyI3faDjknrXs+/l3Jmz+CkVUWbnywGGGJ3vo7Gra86dBrCrbGcAQ1YL1zayoDCQefpUpxN2y13wTsotjqXzqa86IZpKLDKuYDJw80DeB8HEww7juQED8xVh6OerbX0q2TWWiWo4ylcB1DAvhve/JNg3rdQGaLvxV71xcKwBNMM+xyxcm7exQ6OFfxrKAdHxyb4VKBGTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rfey6qOwf8lMltQak7yNITu4zjUR8SS7R9IlFyIAWvw=;
 b=KYtoQ7lmwGLd9PxmnyrGAXxfqER6Uz2AqVe8wanl2VFO/73PnsTf2K0/o2KK03hkz037H/lT9qvMq5LkMXi9/9nBW8ZKuHCy/0Otk/3Z3b2NbPpkhNcjyJVKuH8K4FfYcdmCidQVQNVuZgyZVuhlWKv54FygaoURIyzHdHdCSoVzqVCGcTGHaCGpUMxlko0prVm0SMo64zBFzGBact5H7RGBsf4hdQQz8eOxdUb/yEHCUmeR3VFILNw+dZvVJqvkPzFx6arrD2T3mpdWPfqszqJplV4Utrqtxg+GMYzZT7Alv4opbiin22/rD1Hr9qxh5cNL31USR1drioJLeufYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfey6qOwf8lMltQak7yNITu4zjUR8SS7R9IlFyIAWvw=;
 b=g3BGzy3pmAs0qWJCLXndSDiTUWP912/w7g5AoHcJL4vDJnLzx3pNnE2zpyMwg7JU6b7cOIgkARTQMSpccKcH7A4romekpXJOHUn3HRDm/jZLczIxb4hfg76X6Gf3cJnpkoZPTxOuSk4OceAnV1FdNP+ek5D1jB1p1iOjMPfj4Z6AgtV5uSbwvSUIBXvZ/zSMIPF3k2ALf+oqPdCH90LVCWEDsw2NXSkSZ/VwfzoaMLfbQdCmWdSSKF5oFTpDZhTHAYPV+uOHGJ4u2gBRUAfkt2tX/HZerwA9P2Y1DFmdTvcT5QdBI05cVGNxbD3Xui71dPyuRJ3WyZgbYym9Ex5kfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dff3fc03-8d94-7ca0-512a-501ed71dcc48@suse.com>
Date: Thu, 11 Aug 2022 08:51:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-14-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220810192944.102135-14-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0063.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d41ade7-b63e-493f-1bcb-08da7b65f33e
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2226:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cEJs/3if4UKMcDZbOnuXaTvFYKj7QXCgqzJKSB7o2glNLLHhOG9agAwLGo1VfYhLIJ1S5NyXGCLJ3LZOos8qgvWKgcTmWDcgO0Kh7eUYHlsf3ii13vWq2fTD/O5trs9CvvmCXZ3DqTHnXGTq8drb8AQePLEkXfs7qdfUjClx6pxcEtUYfMBsmePYbrtH5JD9VZiZDZ6bSq/mLOICOKqThYSprkIo6cLXm7+G+GT8DJWmqPbINJIFX+wyhegzuR3b0uOqQtulrbiS4H4Wrwcie6meX1ZqnpXZ+rmzYQcDbfeZq3Xh1lEEDNgXrxGmePs2lXoHlO37+slJvkOdg26NVnLISSLB6rAhgdmPAa37O3hM0O1ZBBXYHShtZbWgBsx/t4vmFjeOhxomFg1M87ji5J8LR9bgD8f6bpkkgQ1DAz7tR4XBQtcoo49k+nuL2UntPjxFDHS8caugJCUcL3hXxQshK/Sp0b1yPf2wY0SePmTBWc4tRLq4XHdjKayIXWzqWNMwArb4sVNXlwuW10fJHvwZPHKOT1EWZW2089ERqN6hSojD2FdzpQTuortEyXXl2dy8tp7EKh+IuU1oSDJbjyD42nmOynpTBJOZdoTED+3G6Ssyz3yuuQ6SIm1Ky8FZKF6m6QvKeCMRTYjure1O9EASuh6u7tdhG52aZyP8sQvReWC+RNwDGmRgwSfroMuC+GzE58ZlgaQHZ0DT6hHFhWbQ5FIg1Mk8FP+vUj/INvagb94DeZthRzzpm5mee1tjK1YGJUyVn47IoJfEXowqucKTVW9t/DloB2trv1InaHS+44dCoY1jO+zdoAziVUMHyjoF+SFVVmTNvk+MRQZhRgfsAumoGps+bxwUw7IgOiAyKQPTza50MvVfcJdWkTVIAzl3mg9EK/JTmGJ5Tn3Ero+LjKhRr76afGTs4weAXfj1ytZbBOF0uZWIduVsi+vK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(376002)(346002)(39860400002)(86362001)(31696002)(8936002)(4744005)(6486002)(38100700002)(5660300002)(54906003)(316002)(4326008)(8676002)(6916009)(66476007)(66556008)(66946007)(186003)(2616005)(83380400001)(478600001)(2906002)(6506007)(6512007)(53546011)(26005)(41300700001)(31686004)(36756003)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWR2T0VraHpsOUxxQ0FaSkp6ZlFlK3dBek9xSCt6cmR2MU5QUWdUYUZQNlor?=
 =?utf-8?B?VEI4SHV4aTdhdVI2YnBsYm9oZDIrL3E2NVhpMnV6S1FzclJ2SXdaT3NaeWhz?=
 =?utf-8?B?ajBSUW5MSW9FcW1STm5obVc1OUM2S2pvM1U0YkVycDNDTStUTng2R1pMVlZR?=
 =?utf-8?B?K3B3OUJqWCtsTExpTnZGQXZUM3pPblczb0FReFdCNXhDNUlJQVlRRHVHa21P?=
 =?utf-8?B?eXpyeXdxdlQzSGtsWmNzNjZQOEVnYU8xUXZXbjFRdUdvM0N6UnkrSGRpaGEv?=
 =?utf-8?B?Rmd5bWxQMjFpZ0hiUUtZcGFuYTkwWmFFMU4xbTVIeGx3bDlCZEV6SFhkajQ0?=
 =?utf-8?B?QWV3SWpHZm9XWDg3ZDhucm1UYTZGS0hrQWRnT2xhaTQ5eS9DMG5acURVZ0Jy?=
 =?utf-8?B?eUs1YzF1S2dkZkFVUGxzNlVRNnJWNk1RV2RkQzNGby9DY2hmazZwZTZwdlhN?=
 =?utf-8?B?ZVlyODYrUWhxbEVTemxvNHUwck1YWStYTkpwVllGMkYvU3haMVlxbEFXTGVl?=
 =?utf-8?B?K0c1dUFNL2JOZllweWdWQURkRDl6dW1xZDI0c1RqdTh6N1pLTlhUUGs1Nng2?=
 =?utf-8?B?dEVMUFplTXE4ZWRmalV2VC9CN3FxSEpnR1JPclZhcng5Ym9ZYjFORHNHZ0p0?=
 =?utf-8?B?V2Vkb2Q4dHRJSkQ2cm4wa2NhVVhYeXFoalMxTVdiWjRJb0cwMk1EZndSV2pI?=
 =?utf-8?B?TGpSa0JNUmMvM0F1M3lDd05Pck9tZkN6ci9WdEt1YVBrN1RweE9RRWRwb1B5?=
 =?utf-8?B?bW1DTlZvM1RwTzVoakxGa091ZDVmM244UTR4dERVYUorUVpaaW45cmNZVUYx?=
 =?utf-8?B?V2JRVDFaTlpGb0VHT1BaRm1sc1FXc0xUZDkzUy9hYi90TDNvR2FoaVdPVG1s?=
 =?utf-8?B?MkV3dnJQQlBNSm1MN1VUT2JOUGEzUFc2aU9hWUVVV3dBSnpOT1VCKzRvYW9S?=
 =?utf-8?B?SEludTNyUzllT1JqNHh2enM1aE5JbHBhbEtoOE5tQnQxSFY3Ylo0UU1XOG9v?=
 =?utf-8?B?Z3hkTGlqZW9lQ2xaWDNKS1l6YnZkeWlVOTR1Nm00ckVObjZYODVncUFrVFg2?=
 =?utf-8?B?YTkzSEV2RTh1dmw2cUNLUHF4TmEwVHZjT0NEZTFPZHpCS0xtZzc5azFlS1FU?=
 =?utf-8?B?dmxiaFloZWthV21yS245bU1iMmwyNzNIVWNHM29VVE0ybUtXMzNDenprdkdE?=
 =?utf-8?B?azB2L1llSVlscUpwbWRCQ3l4N00yZnJLc0hxNlNhRWY2RFBuckxDYzVTRVVk?=
 =?utf-8?B?VTBTSlhUUndsYzZoZlVocEZHTWwvKzFnMzd5cWxJbjJHcWc0Sk1YMzJBb2JU?=
 =?utf-8?B?bEV4MFZXQWJjT2pzc3UvR2VleTdhK3pDY1RlcnBiaEc2SkpZaEliZnlydVlG?=
 =?utf-8?B?YWNCMnhDeW90LzRTL0FVNG1NZUpINXZxeXVqWXpCQnJ0SVFSZ3lYNlFSTUtT?=
 =?utf-8?B?azhCKzlFeGljQ2JlanpnbDVFdDRDY0RhZngyVlQyempQc1UxM1FYY2dnVTRy?=
 =?utf-8?B?M1hCNERlMWQ1Qi83ZmRRdEo2bDlad2luS0U0bWtrQW1rWXZpRHBTZVJEekVT?=
 =?utf-8?B?ZmNFNnFKcmcyWTM0OVNkSlFFM3NGTUF5a0p0SCtxbms4NkdGTkYzdE1OcCtm?=
 =?utf-8?B?VVMzaGpXVVM0WGlDZ1IvSzliSjU2MlNWM1Foa01xS1YvdmlrVGh4Z2lIemdo?=
 =?utf-8?B?aDhrM3ZqWWZLd2pqa09zbUw0N283UnBnR05zQmtVaHp6VWYzRmpMdGhpWXJq?=
 =?utf-8?B?QVh1MVREUUdJYkFRdmVLUW9DL1BSK25VOHYyeHZ4S3NqUHNiWXJlekRTcVJW?=
 =?utf-8?B?Q0Z3SkJHZWhacksxbW5RZzZUakxOV0FuNEJCaStlTWFBdlFIZWNHdGowNjVK?=
 =?utf-8?B?dUNaWUF5UzEzOVV0NXlxNFBMSk1KSk9JY21RODZaS0pYQzBwaHNpUEhEKzRY?=
 =?utf-8?B?bDlwVjJZRC9wMUF3Y1pNWVZpUEZBOVF3U2NkTEpSNVMxdm5ndXllU2RqUzho?=
 =?utf-8?B?WHg2ZUNhTGxseURpTlJDNGJKeDZKM254ZTlOZlJ4MDZ6dUJzaE9GTVNMS3VJ?=
 =?utf-8?B?aitFYi9mV2RaQ1pVc1YxSndRQWo2ZStJcTFkMUtYRlBQU3B3U3ZUNzdiMk9L?=
 =?utf-8?Q?bSq15J+5X0e/LjxmkwDPDLrwN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d41ade7-b63e-493f-1bcb-08da7b65f33e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:51:43.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdODZM3F2hwC6UWpvDLXt/Il5S3piABqRgusC/Mm9UCJO2zJ46gm5QQ4hgETDdq7sHNflE056PXSnvDkJPWOuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2226

On 10.08.2022 21:29, Jason Andryuk wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>  
> +### Added
> + - Intel Hardware P-States (HWP) cpufreq driver

Note that there already is ...

>  ### Changed
>   - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
>     this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.

... a "Added / support upgraded" section right below here.

Jan

