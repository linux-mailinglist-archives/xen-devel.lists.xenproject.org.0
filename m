Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6121760B11
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 09:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569467.890239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOC3Y-0000nN-RL; Tue, 25 Jul 2023 07:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569467.890239; Tue, 25 Jul 2023 07:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOC3Y-0000kb-NP; Tue, 25 Jul 2023 07:02:04 +0000
Received: by outflank-mailman (input) for mailman id 569467;
 Tue, 25 Jul 2023 07:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOC3X-0000kV-KF
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 07:02:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2751cd88-2ab9-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 09:02:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 07:01:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 07:01:30 +0000
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
X-Inumbo-ID: 2751cd88-2ab9-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw04vWB2m6oJh5BNYRcdx+PZvYzdV3U/QvAPXrti6b/J3GyzkN3nCyQ5qHR+V5bQRQ1U6jAGwF1GQAnInQ13uOpmLOxUYBwbVaMfxuiuU1vOYKyfrcNvkDwl5s/l+gmgXWjazTZ/QDToQUX06r5wtTgq/yhf7paaLtHIalNGYP9f+ZF+HyPgTwrdyOG+3X1NvVOzUtoWUC/WUg8hjiXwoDnFmr8h3UvFnpbo0hsNmRonRQjhKepB5nFWNUY1ePQIRkNzytpphxBU/YZrMcnSgK6s/8iLjakmCycgAfQr77LeP1iCQ/hwnLCuXMnY7ieiSMJdjIegP6uDdtsi++HSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GmQPjoG/bIz6yjmRzHLmM//DVTJdsU9m6I2Dabl8Gk=;
 b=I0KcRwwt3+Lq5lnBCVEgnIfW7gjLNL4wyyRCkKvPFuPr8hps3shTvcxcOp9tylsWGQ3jh2QrkWFxOiL7+7yz8aiQgfT6u5T+62xtDmn9R+A5XAEWm0uFtXJQwbC2YUoKJIFz8nT7umqmRSk+0TGcVylHYByd4HuqTp1FkDs9Wrz8ky7SlhAVEVkrtVAOFl4YKbjWppEAwAEbjEuQuhlLPpmkl5VHGFuODXNI0hsr3PoOH9ZCLAYEsfaqwxfvcdsKwFAUT/eRS3dD1hB6emacqIU9CNms+7sXdrzm92UbAws5x3BftFHl8LQRXUAh6gDtdixPs0/og1MAXwtXEseHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GmQPjoG/bIz6yjmRzHLmM//DVTJdsU9m6I2Dabl8Gk=;
 b=Qv5wBtLPB1h3PU3i9aVRLLGfOnOMqr+a3z9UqynnyZhnMjAWFrrXZIcB2GXqhU6OQIn8Y9luZsqDxYHTuHBdECrMf20GlC9lgCGm+3acB8YSJdzrb7/iDrSuePIPLXD/kcBqij62wWwREZNnSCAczDoO/JNGPWIF/Hxeb6Eo6FWy/Jk67euByHxef2ME8y0QfLqdgHj1cUspF4PfxN4GJyRUJi6mcrWrb2JlVIBBI8f7xWiSaZZtrFeUfh6HFoNGloRbytedRpeUgkl/XiEy5/kdn4qVWU8vXyIrPO3crFavzyLxUFFtaACVuTaf3engNVD3ji/9Go59Q0cMlz0Ulg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e36f3372-b3ba-14bd-63db-49b2e85c08aa@suse.com>
Date: Tue, 25 Jul 2023 09:01:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] automation: add ECLAIR pipeline
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <c3a0495afe01cca1b0caf6e1caa2d0a3451ecc00.1690219502.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c3a0495afe01cca1b0caf6e1caa2d0a3451ecc00.1690219502.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: ff45b5b7-e86f-4e9f-984c-08db8cdcf91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VdKYQjFxjTkDZ4q+l5yovYTiiSVovlF+EhAw+mLUb2oH4G7UYuGDXxn0HqONnHHV2bmGW773XPjgSW7OZYQQgY0KN34BnIm2l9mNne8//lzbRf33K4TKo/GY/gsJh4/CjqPbLIoAE9Nw1ihCxbFUaYVcDuUVli81vVenh/y8orBLmGvmtEpvqOGb7xgrjHX3Q/aholffsDixAOcTqzZ4WqVye04HBnhpigB9ZIFaknKss2P/nLo4fFTjHyE/PkshssekxPpHBYbcNdAKyAVfIt0zxA0Fmmb4acD2s4pxd0To/FUpOs2LzF5AZCP/koM6d+Gg3SSjBAC0omqf1om1/Ui1zcoxDyMQE8P1k6JZPMe7fVKfY/5/0wDS/aX4GB2JPUwkg6FkZPHy8peZGI5XZiDReimysThB1cK3nvVVOBaR3YAtqt9Q+CcjAH5KiwSzNwllxN/znE5RZUXLJEwQ/uPrBUCadqSx+TKzxC2MmB30/Qg7zsbkopGJNS4vdsTgwhHs3W1GHxjyCUjfKf1hcaIGb7j9nvxXY8FPbdEijENjRPOWhAzevAng34DgCrJU83Lc6iPGt8EGBc2LtE2IZQnfTiy4NTOtLDfgVHSWa+Mdvzvp+dTVtD5TM6IW+wMSdt+OhaJ0uxsHoIWxQ6IoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(31686004)(2906002)(8676002)(8936002)(5660300002)(41300700001)(316002)(4744005)(4326008)(6916009)(54906003)(66556008)(66476007)(66946007)(6486002)(26005)(53546011)(186003)(478600001)(6506007)(6512007)(31696002)(86362001)(36756003)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTgrREp1QVZ3ZFBPdXJIclZ6Y1BjNFYwN0hlc1R0SjFadHVmS1VUYWhMZHBD?=
 =?utf-8?B?UjJEeWxVYVlFaHpNdXdwb3RvM016TGhvNjU3ZVpsbWhMMFQ3SHVpWFlDUzhI?=
 =?utf-8?B?Yi9EcXVOK2gwWkJnUm80QWU1bkhxZk1HaFRGVGtPOUxxdDhRUlVNZVJGbFRK?=
 =?utf-8?B?RDlSTWlvMDUvQVF5bEhTRXRROFF1QkVWZUR6cE5XcWd3SjIvR09TcVYxS0lN?=
 =?utf-8?B?d1RHMUlKNnNnQkRWSHNqaHhDNmJBV252MXNZYmh3aWpIM21TOUFQYmdic3JZ?=
 =?utf-8?B?cUpsT3RsWEx4YTAxbHpnY2NJSm95OGRlK1kwM0xVKzFlQWloNkRIbXVSblZE?=
 =?utf-8?B?T2c0aC9ZTHErRDJRdTdNY1BQN2phbldHVlZ2VHVoVEV1cnRTaW1FMnU4UkJk?=
 =?utf-8?B?L1ZTVXJLdGN5L3dyZDcvQkNtcDBBSGd4dkdYem56dGNmQWNGRXdJcnJ6dS9h?=
 =?utf-8?B?U2tWcW1YZ0hKdXp1bTM4bnpVWXVXY2czcEpFSU1LVlkyNkNtNjNnUmZaMlMy?=
 =?utf-8?B?NE9sWHBYR0l5SzRqNVNhRW9xV1Badjd1WGc1bUNncnYxTWpxeVBTdE5BNHJV?=
 =?utf-8?B?STNScy9EQndER3pZdTVoL0sxTngxcTN4RkwyMlhrN2ZKQVhCTXZiUmhHUkhj?=
 =?utf-8?B?THhuRC9QRG9iUnI1c0FhUTZHNnYvVi92NStHK3gwUUN2U0pvRnRqMHBwSFVx?=
 =?utf-8?B?MnZRUUE3bGVuWnYyZGpsSWMvd2ZnclBvVTNIbUI1N01jdEFHdmtEZ0hnd3Bw?=
 =?utf-8?B?ZTFZQldwcG5aK3U5RzZBT0w0V3ZkNDE1QzJ2azVIb0ZRUGFPV29MVmRIckVr?=
 =?utf-8?B?ZzhqbTVjWGExY01ZaFFRL2NQamc0ZVhPcXBDMEhTNUF0UXptaVJ4MXYzay9w?=
 =?utf-8?B?SXh0cGZweDNLRTFlNkp3OVBSaGhqREx6dU1ubHNVWWlwdjZUV0pxbE50dGhY?=
 =?utf-8?B?YUcxQkxleTJTS1plbHozTnVtMTVxRzVzdThiazNFWVZ2M1hqZ0ZtcGhhRDkr?=
 =?utf-8?B?blUvZHpjaC9QQkxjYnMrUk5MNmhnNlBZOWpjZDNQV29nYXI4SnY0bG5uSkFC?=
 =?utf-8?B?TTFYV0hReXpKYjM2YzBkWk1MYk5FVGs5U1dnRGUrcVdhVWlHMkVJQWFYbC9l?=
 =?utf-8?B?bC9tYmRSMnJvZHhpSnVpSHlLaFYxMTNzRG03eDJuNmhicUFEczN1alIzL2xz?=
 =?utf-8?B?cDEybUEvazhFdXJwdzZ5Rm1qZXRyN0cxOVVzM3htR1ZPOWhFYytLMXkvRmdW?=
 =?utf-8?B?dENiWHg5VFF6dDBjTnlkNHFQLzE5QkJZQmk3YnNvVDQ4dXg1RXRONHliUWdT?=
 =?utf-8?B?NWxwRDdkYlhCQUNmSzY1aU1CRjBXTzJKMHlSSU45cEhmczR3QUJEUVZlQ0Iv?=
 =?utf-8?B?dmE0N2J5VEE2SzJOUVFpOTRnMUVSb1BLdGQzUzVpVWV3T2NPbm91WlBJc0p3?=
 =?utf-8?B?WE9jbzYxS0xOWlBuM05XbWNVa0JtQWZ0NTVRVXhoaElsTXU5NmtpRXQvMHA4?=
 =?utf-8?B?NitnRDFzc0IvcE4wNVZDRVFQNzNMQlpybWM4Tk1NeGVPL25EeFMwaW4zSmVE?=
 =?utf-8?B?TjFSRlRiTGJoaFhESmNsTlJSZHIzeWZFWURnVkhPTFRJc3B2bGFiQmVFaU5y?=
 =?utf-8?B?bm45UjhkcDhubjFCTXpDUkVYNk1LMThjaGR2RFoxYmVpVnlmRGRkaitYT3ZX?=
 =?utf-8?B?cm12ejdDY1Rid0FGakNBeWlnLzUyL3h4T2ZVQUdtQVR4ejdsdXdlcU5Zb21O?=
 =?utf-8?B?VG9KS3A2NDVFZmo1YzBPenJGOWhtN0NpczF5cWU4bEdxZ3VEYThhUU11UHpz?=
 =?utf-8?B?L3J3bWZzYVlFc3ZpZ25uTDZpZ2Z5Q1pxVmNja3AyL0xTM2g2dnlSK2NlazRQ?=
 =?utf-8?B?YVBzZ0Z0b3NCKy9jcXA1NHpOUXIya1hQSlE2OWdlR1dRbkpOWC9aTndHOGxL?=
 =?utf-8?B?L0IzWis0blprem1zS1BGV3JhdWZzK2pUSVNkbS9qcE9kTjNUM1p2alVnbkxr?=
 =?utf-8?B?b1YzaXY5Q09jN0QxMmNxTEtBaHZFcXFvZGc3cVZjd0ttRzRXZ1AvdjRncW9H?=
 =?utf-8?B?RjFvMUl3YlFNS1Via2JPUFJNNzhPdnZhdVhhVzFIM1hoek41SkloaUhNdEh5?=
 =?utf-8?Q?NLrkOzZew6rQnKjqCnjfcWnAJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff45b5b7-e86f-4e9f-984c-08db8cdcf91f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 07:01:30.4491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+9gj4tYCETysD8GWxlYpYb+60L83hap13fzPfeEPsZyiNvVKN12zJFfcdBL/eQrnK2pNFvFfueMZ4e0VSfFKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884

On 24.07.2023 19:25, Simone Ballarin wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,12 @@ F:	xen/include/xen/libfdt/
>  F:	xen/include/xen/device_tree.h
>  F:	xen/drivers/passthrough/device_tree.c
>  
> +ECLAIR
> +M: Simone Ballarin <simone.ballarin@bugseng.com>
> +S: Supported
> +F: xen/automation/eclair_analysis/
> +F: xen/automation/scripts/eclair
> +
>  EFI
>  M:	Jan Beulich <jbeulich@suse.com>
>  S:	Supported

Please follow surrounding style (tab padding, not blank). It also
looks as if the xen/ prefixes in the names were wrong. Finally,
following Stefano's suggestion to split - decisions to make people
maintainers of certain pieces of the code are usually separate
from accepting any code changes / additions. Hence even if tiny,
this change may want splitting out and putting last. Content-
wise personally I think we want to start out with R:, not M:, but
this would need discussing among committers plus maintainers of
automation/.

Jan

