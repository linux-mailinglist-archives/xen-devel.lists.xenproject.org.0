Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B156714CF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480166.744407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2fu-0007iz-Vo; Wed, 18 Jan 2023 07:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480166.744407; Wed, 18 Jan 2023 07:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2fu-0007gF-SE; Wed, 18 Jan 2023 07:15:58 +0000
Received: by outflank-mailman (input) for mailman id 480166;
 Wed, 18 Jan 2023 07:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI2fs-0007g9-HB
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 07:15:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f451b0-96ff-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 08:15:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7520.eurprd04.prod.outlook.com (2603:10a6:102:e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 07:15:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 07:15:51 +0000
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
X-Inumbo-ID: f1f451b0-96ff-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChHkOpZJ8ufNlTczjrj/I3DJgS/rQ/N9W3DBR4DUPCrVvGkzeRc1yjOCsZYosx3tHt+gGGKIBLNrZw2pWIe/mmqnYxaiJOH1CNqWWBiZ6RSZSZG+Cq1SfghkdfjJps7M57g3JhpBMmduIVegoNQ9Q2MvyIy+if5gDsbF/VuaR3faaaTq0a+5DGYNbCeJrjR91abLeNnfAX3qbX1FLZxDuHMPr11DkFeXQkLNeoci87/M760lARIxhV+DrQOr7FbjFg61EWgRpDCuKHsL1fxleBjkr9U84jqNEcs/kX4AwsT1ZdlSeNPVFyszNexXKECaqCOMG4/0SZHB8Yzkf1JM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRp6zVQ7NYBJCGPeBh2wyoprETQ6CvAi0CYQGPihjyg=;
 b=QnNC1vKS0HKyOHu14bNNPHq6p5WLeY3TiE7axZ4IKGj5N6bpRKWWHJmCeMdPOWbQsg6Xnga0/vLi6vikBtyB5AQ2Uf7sLwX1WrW+2+JfV5LgLJe7CPj+WgBkKgB81O2LooHEviBKsta95K4YahcxtpJvY5lw0OiqjhMI7FF0HMGnZF7ZPn49N7iTKjBAZIxYtHKppEw/Q3G+rujMF4RglZ39gjFP7YUJd6N35DS5NxKrcVPzCGDyn4+uSvTP95DHSfChedq353XP3/zv//PnEqi92yQStKjTgoKR8geFVWg3ZKl246kGh3IFtuHn/ZeCAkqH2DQx71lkGNDUfO6A4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRp6zVQ7NYBJCGPeBh2wyoprETQ6CvAi0CYQGPihjyg=;
 b=24yFOGjtht5bSTE2ILlWslxvVpPxn7wVApj6BhvmKOTp3H8LMFKJOjyHh8ZRgLqwEF+Rokl/tdmIXQB8yyBUrhsVgJGDFoKaWZ4YdyHMf+STkb5dHHZfgzPoMxkENWAwORPGluuokMAjwz05FhOhPznfMO2jv3GJSJ2KkpWzs5hxUTSnVyLRJ61YEBpbW4w8yXI48NJ/nsD/9e+y7WKOhk2gW6yfY9uoCe8EDHdVUpHHSG7ioraBhAEnrt0omGemQ3kh8AaJeorjcITgJGemRU7rN+5QvReCF/hj5MSg6Rn35eqicbEs+53wRnSCKkPo4/9CsZeQ0b4U/siwnR2ZXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd408cf4-bb25-c8b0-b979-340668d4c5cd@suse.com>
Date: Wed, 18 Jan 2023 08:15:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH] Create a Kconfig option to set preferred reboot
 method
Content-Language: en-US
To: Per Bilse <Per.Bilse@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230116172102.43469-1-per.bilse@citrix.com>
 <f7e7b6ea-5bc1-ba2b-5d21-eb431ecff53a@suse.com>
 <348dff00-5ae4-5dc2-64d4-d52409a22283@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <348dff00-5ae4-5dc2-64d4-d52409a22283@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: f502b59f-30c9-4e60-d8f8-08daf923d43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+uW+gutxISe+//RcVShKNA6/YQ4t6hk+jbwVwye1MGE3eMyeBLe6HjXiCYPMGh+Zr8dxZ1PObHNdQ3phrUMGKi8q1AI0FWvW8/U4n3GyMGp+7tLW8vH2a0Fm8/e4jMilnnmRuzg61ZeBLEfmSR5C+yW6/8khtagDLlbks8tiUzqlkXHuiU5kQ4LnOambyHU07VBTTnkT8A/97nlf66eqsah8Up+Qzft5p2ez2V8u/QavTple7XFq+60yP/EAJbq3PDsOIuKRdv4agLNa3JO1Oi06ObH/xOM0zsVQKUvOOe8YTInA4+jEH/XJj+YfsLK5VFRBq1fQIPUekIX7wCwGFwq1n9zpSfRKs/1SlXAw/lVQ6pJEmye4dn/HQfyRB3kn4dCkdMSdMubr6bJg5EPacc6Arn1lFAvF+FdHPoOnHS2BPBJZfcbvP7Jml5ORzfwsKwlDSuyJ12eNLaACgB1GkPcQ56cm6eGVE2O4sx2z3ibw2PQzOJfw693imEwEWhcJJaLnAtysqpPMoc5t4T/tv0e7IpHBgX6ZPidigYHXN3fhGEU+h+2OVIU7taCwPyyiMxk4VSkf+4oVH+UjxfO7SRNwW+CVxyFrKVf/SfPT1SU7Ti0WE+Npy4Ngeb72oGpRRdcw4TgtQfJYtIRuvhDYgn9PiHAGPLtIohzxlWbg0KStZqhrz6gstSXBhp8qkuzDVie5/PPSKp6XtiDswd3c4GG3qgInBZqppYCEmHD0cKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(31686004)(86362001)(53546011)(6512007)(6916009)(66556008)(66476007)(2616005)(26005)(41300700001)(186003)(66946007)(8676002)(4326008)(36756003)(31696002)(5660300002)(38100700002)(8936002)(2906002)(478600001)(54906003)(6486002)(316002)(4744005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZBY2NIdXEwbitqWktJbkFaV0R0VDlQMlB6cVRyc0xMSWFqclVtWlJlcXI0?=
 =?utf-8?B?endKYndiUUx2ZkxuQndGT0NqeUthTmEyVHRmOWROZHdneHdiMldZMWFPOE1J?=
 =?utf-8?B?dktHQU9pTW1RVU9jVzA2Y3RzeUVkSWFqWWsvTndvTlI3TU1mcjdEYU8xa0ZC?=
 =?utf-8?B?ekhOb2NnMFBlYk05R1YrWElYQnVYVjdGWTY2MXBZaWVmTy9ZRTJLWFc0bTBm?=
 =?utf-8?B?VS9IZG84TkVLZjFUZzk2aDF4elFycG1GRkFEajQ1TU9sUE9VdkZEVnNndG5I?=
 =?utf-8?B?Y3BTQTBBcGlISmUxMGhvRjhPR0Q2Sm1ZZURnQm5hTWZSYWc4UDVaYWk0SjJP?=
 =?utf-8?B?bE5GT2ZxTkRWTjlMdkUyZW0zeHQxaFYvR2FiUzhkUUVmbm04ZUJrTUJiTlBN?=
 =?utf-8?B?QjlxTCtaOXRzQjZUekp5eDlpVE1DUHJCVFE2ZkwrazNSZnVOaGpXdXJ4VTdF?=
 =?utf-8?B?bUo5ckxNeTRhdmpWeVpRdUxtaHVkYzkwQ3JiTjc3eWVaK1Y1OHliRWdhOFVG?=
 =?utf-8?B?ZkFJbm1WRmNGNG90VDl6aSt2SnJHLzhoK25mQ0QydVNFR3NJUTdxUGZwYUZw?=
 =?utf-8?B?ZlNDcWdSdEQwV2U0ejV0NDFzRzc2bmNkYUJBNVE2d29NYnlWTXhiTjBaWVMz?=
 =?utf-8?B?Ly9pSmM1eWZpdzlQdXFpZnk4SVRFcjVtRDhPLy9oRDlPdzRBVnFjZnhQc0wz?=
 =?utf-8?B?cHo3TG5jSTdjc1M0dENOSSttMnBlcC9idklyamVCRDV5OXBSWEtob0dUQTRj?=
 =?utf-8?B?QzFaTDJraVRSNElFb1ViVEVFYWJudVRiYlQ1Qzl4a3ZHUTFKZ2xQSTZZOXNP?=
 =?utf-8?B?NVdhT0hYL2RHdDE4NHMxcC9GMzQ4R25QV2h4TzlxOEZHNFZPMlNsWm5wdWkw?=
 =?utf-8?B?NEpDTVRlTDhLWkRWbEw5ZEZEUXJDWU56QndFcGc0SWp6THFHb01ZNS9vcHI0?=
 =?utf-8?B?V052dWFYRXYvL2tkRmo5NjZBSTkwbkNnRVlXQVhMY1RPYlZCU0gyeDBXUTJh?=
 =?utf-8?B?NnJuR0NSYkhzUnlRSlgwOW83MFVDc3VBRXcwckx5cUFiZDYzSkxlaXVCcUps?=
 =?utf-8?B?aWFDU2ZQaGQ5MVNHK1d3UFJrMXdEYlcvODhmT1llbjFxek9yNmg2c1BNK3o4?=
 =?utf-8?B?YWVLYW92WVk0M2FIT3AwMUNtenBVb3JZckpPZm9nam45UldEL2MwU3hBZTR5?=
 =?utf-8?B?OG9seFFNdWdJQ1Q4ZklyOThQdGU1UlJFWE40bnExbWFYQ1R1WXgxTHNFNk4y?=
 =?utf-8?B?KzN2V1p0UG5UaHVWSHUrZklQQVh2SzVkZm1mMmIzVVRlK0h6OE9WWHJPVEtH?=
 =?utf-8?B?VUFtM0xLc3hNNEQ0OWJwVFdGUStkVUxkUk0xc0FoV0dyKzQyT2RIL1g5K2d0?=
 =?utf-8?B?WWNSVHN4ajBPd1BlR25pQW5oRGQ5VHFMTTVld2gvTVEyOGJWM0gvWnlZU0Ix?=
 =?utf-8?B?SmgvejV1c0Y2NDRKNk1uclFwK0FGYzA1em93WEt5NCs4MDlDcXlFRll2QkUx?=
 =?utf-8?B?VmJweEo3dGkxcDlQRThUMVB2SlRoYXZvTlpFU0xjanpYUDl2TE5rbVFqT0Uw?=
 =?utf-8?B?d0ZUU1RYZ0ZHNEJEbVhFV0VSZDhqU0ZyT2Z3dkwyV3VhNGp2Z05VdWRrdkZy?=
 =?utf-8?B?ME5Sa1E4bUNpc2FJckZKVUJQQVRDc0FMS0FMM1llRGdMVFErWVYzRVAyalhY?=
 =?utf-8?B?QWtJVURKcGR4Z2ZEdWROZUZIN1UvazZ5S1h5c1FkZ2JtdFJTVms1a3llSHZU?=
 =?utf-8?B?MVVKK2hCT0V2bDZvdVJtdGtmNFNPeTRHNGsvckcvZGJQSDlGRDVOTm5hSkQ5?=
 =?utf-8?B?QWlTZnVXbVdrTVhTRGN4cElkUm9TL3lBaWVKbUtVT25sb0U3QWV0MHBYandI?=
 =?utf-8?B?RWNjTytUa3Znby9OMkJ5aHF4ZnF0dGJVSDV0ZXBTd3ZyV1p2bU45OXhQQ0ZE?=
 =?utf-8?B?RVlCQTdySkpob2R5Y0RtbjlNRUpRZkNoYmV5bkhET3NmUnN6VHM5WDZNL1VX?=
 =?utf-8?B?ZDdObjFvakVTMDVxRzFKTTl5NS84M0RjN0dKS00zdXBNdzZhdVFOMXpwOExw?=
 =?utf-8?B?R0plTGtTREVQbzhPdmFPQUtBSkNyRTFTUkFIazdJVnU0YjlnSFNLMUQ5MWlO?=
 =?utf-8?Q?5RktyGycHBwV9oSAcwnMnf3ji?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f502b59f-30c9-4e60-d8f8-08daf923d43c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 07:15:50.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y46/7GHbjXSvueF7MkRFU9kY+KETg1cmoQ99PNLiUoQ/1dmuwXAXsqIZ6gPIJyPxyuKPHSZxmYK6GXntjdrhSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7520

On 17.01.2023 20:28, Per Bilse wrote:
> On 17/01/2023 15:55, Jan Beulich wrote:
>> On 16.01.2023 18:21, Per Bilse wrote:
>>> +	config REBOOT_METHOD_XEN
>>> +		bool "xen"
>>> +		help
>>> +			Use Xen SCHEDOP hypercall (if running under Xen as a guest).
>>
>> This wants to depend on XEN_GUEST, doesn't it?
> 
> Yes, depending on context.  In providing a compiled-in equivalent
> of the command-line parameter, it should arguably provide and accept
> the same set of options, but I'll change it.

If consistency between the two cases is the goal, then why not adjust
command line handling (in a separate patch) to "not know" about "x"
when !XEN_GUEST?

Jan

