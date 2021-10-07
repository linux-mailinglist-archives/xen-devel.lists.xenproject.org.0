Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D534B4253B3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 15:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203567.358706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYT8Q-0002Qy-6L; Thu, 07 Oct 2021 13:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203567.358706; Thu, 07 Oct 2021 13:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYT8Q-0002Ok-38; Thu, 07 Oct 2021 13:08:30 +0000
Received: by outflank-mailman (input) for mailman id 203567;
 Thu, 07 Oct 2021 13:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYT8O-0002Oe-9n
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 13:08:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 447bd0ac-3819-4b60-99bd-28a692c75522;
 Thu, 07 Oct 2021 13:08:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-EKiRYr14PsqfOw6SDEgekw-1; Thu, 07 Oct 2021 15:08:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 13:08:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 13:08:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0351.eurprd06.prod.outlook.com (2603:10a6:20b:466::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 13:08:22 +0000
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
X-Inumbo-ID: 447bd0ac-3819-4b60-99bd-28a692c75522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633612106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4cGeZN4m4w5ILM164lNqYQPwXRnKOQN03gFaf3Hb4wo=;
	b=ARHlIpL4PFu1rlsiO2dSL15GvDrN0w69bOzhLVqgh7aRSueEEwn82MXFT9vfYzt2evi21e
	XDLfZzpXY7VPaXHPMpfxhQxecfzuglWY8viLlENsaw8DJk2Wybd8rzTQl+h/1hjquMwy4S
	CdwK6CnGHZaXhui5mUCC9i7cr4pWrbY=
X-MC-Unique: EKiRYr14PsqfOw6SDEgekw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb/gwZYPWqAG8IEMDD5kkWI/Lk51VCW3njjXfit08phzJWwkMkeu2m423x3413KdVG+jzNFq4BeyoDDeOp/Lc2XbwNaLaUDHLRyj+uSgY6CxCOtCErae8gCKUPh9YFiSr90D2sEDou+zio+XUlWFSiVZ4OlxfduSxSbxmpxpfjZf7IuHptn9AGNIfokUmOpnzSMn9ySl/sC489qv9qsmEWl6L/OOgolKXsH6YZejZwBCP4kgu1SUslrsQyno1SDKQoKGHrDiaux+3mLljuePB8rsUislR/A8unNNGqAVGtgORhESOcLkuqbO8bKtW19VJ+rG82GIp0ZyW3mYhMpCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cGeZN4m4w5ILM164lNqYQPwXRnKOQN03gFaf3Hb4wo=;
 b=jWre/a1lFaPFEU1/VGHVHR2rsT13X5kmit1YGwVUUBbhNr2tdepJTvYxl8nGuFA94dj8S5TRtdszXEfzks1I7wQX6bHnZstjEmErA2mXE6EcREGYQEwXRqhlFqB4t+XtRpE6adQs7ak2wzmPbHw2QVDmx5uxn0OpsHgdjOmR8qk21NCd/hpBZnue21U6xT3Hr39cPqADV+CUKLL1grOJWX6ecNy7OM3BiUW8znzRkunxvvJhhcSmrnckQ6IWIqg/mcG+VqwJMplsMq2v8SOUAnkNcrTGPeLKfnrDuvwqcbQv3/mx2hpV06WqNSUmoo55HsHw/Oy+8tj4nVxgOzFu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27489306-058e-aecf-a766-919c9569adce@suse.com>
Date: Thu, 7 Oct 2021 15:08:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0351.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad86d77c-a75c-48d4-be5c-08d989938b19
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479CCDEBC89F2EACAAD5EC6B3B19@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1OnO7WF0fwFQUXuB6pO6+cHJvri4mCWhNb6UBjIup929Y0R53MhTx0Mi4iOXP/J9mrYLQs3ds28plPGrb98XVFO/BccAkL5Us81Si4KfqThSDCyBmKRSkTUvjyTE+GjwQKgcrwIpHN3e+/JoF5/3wqVWS7/bDoCT4lLtx6ktaXr5JCL3vWJQpMqcceKx/sWgNLy6R9HZUcL3nz4x83bTmdOXx4RUxgb4ZTSdT+PjGCLWUGhQzrLFJDrVe7ldLDbRLUZ4rlNl0AVMPqKk/VrLz3MfV3ayOCE2Phtfa1QxqV9aZMwPEJiZLiT9h/SxwtAAZZ8BtqsEykdDmnAXEV4oQQ8rjp89qyZa0uzqZI/iXNieSEg9g+/1fGlKntd7p5fKFmGAVzh+YqgxlsEl9gfrtvLC9oM4cN4efJfmYT7jySluDWwW//t3iSjkWEcIB3oY+jZY8laOvdQyGyRQyARuvCHpoV97rGpYvVpnSNFPecvZs7m2KvYvuP0w69ZpNhxMcnX3ReaKoK0G9nE4XXKrmwo59wxy6x3l7ANCIyWsjppyn7fSVil9I5T65A6Mmix3uZ/0VzPOsBqk2ICgCToN6PnBPkJ94wK4ja/sCJH8H92/r+In3WH3bNT+zu/McKBJxr+asKhUNCncfcWzorhZVwTUfGCry58WSYoLFh3iZspUcE0V9OxdvO/bq73Lvq4AVaB5mV8fvltq4tx+t1uaxgdjARmmZmR/2tYJVndgh6a3Pg7NwI9wZbh8EfwgyYayGaD5foNSxstjQ9jcB6GsXf9qY+1ogglnFohZFvOR4MCHcFcobdIxpwyew+ysVYUe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(508600001)(5660300002)(66946007)(66556008)(36756003)(38100700002)(7416002)(8676002)(966005)(2616005)(31696002)(186003)(26005)(31686004)(316002)(6916009)(16576012)(54906003)(8936002)(53546011)(4744005)(2906002)(4326008)(956004)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0ZQdkJabXBuWTNvSXRyRUdadm8yUDdNZlE5Y09jWTJ2aGNLNlI0OE1vWmI0?=
 =?utf-8?B?cXBONUlYSzAyRk5Vc0lLOXFGTDNzQ04xbFlZQnVsV1JNSHZrTFJmU3V5VDBS?=
 =?utf-8?B?Q2tlUlpjTUhFK201U3dKWG9ETHFEWFZMUHZSenhYdGZqNHRPbFF0aE92WTNE?=
 =?utf-8?B?NUtNeUNGcWxoR3g5Q0FWWHJaTm4yZ00xR2ZIVms0ZDIvVmhrd2g1NUJXSGFI?=
 =?utf-8?B?K0tiZVkyWnRSUmhCUkJvSVBhVkR5UGVFc0JkK3h0SjVFUHl1WmRPRno1N25v?=
 =?utf-8?B?YkREbHMyOS9tOE15WXQxZlJYd0RtSkpOdlQwSWlnUUluc3FxcnFLQVVteXZq?=
 =?utf-8?B?RU9vZUx2eGpGQURIRTRzZ25rN1lLVDJNOTRzRnpyQ2pBNUdhd3RsYzdoTDdV?=
 =?utf-8?B?ZVFva3p3WlZkZGxHVm92VFVxN1dQZGNXWjFwTjVFMExURE9LWXRMd1krK0pX?=
 =?utf-8?B?M1FZYUdDK2xYWmZIeHRuL1lNcVQ4NkthRzQyR1R5MW5sQ0l2NUVEMkRKZENq?=
 =?utf-8?B?K2E5bkNoSmdBam9EL1VNTVc5RXg2dlhIOUJrR1FHVCtlUUV6NDZWSFZHMXpN?=
 =?utf-8?B?S0JRS1ZhdXJoZzdRUW5UeDh4YjZRelNxVytsOExiVzE5OVZubFdiS2J4OGVW?=
 =?utf-8?B?T0daaHJ3UG9SdUVsYVl4SjFGSzRObDI4SzF0SnZJa2w1OU1VK0lLdFdQeDBq?=
 =?utf-8?B?eWxnUksydjFZbFVqTENwOU5vcmFpaTVudnovYUtjSWhIM2NBZTFIc09hejZJ?=
 =?utf-8?B?ZUtjMTJZM05xUEpTSHNnUFNQaW5TcTFiWjlPTkZMVGw2N2NTMXFtVHRLUGxI?=
 =?utf-8?B?c21kQ1pYaUt1YVpEa3pxbmx3V3FLUkVRYXdFNndUK0xuZitpL3dqV25XNW9k?=
 =?utf-8?B?VGtpcXZ4T1JURHFLQmhZNEhEcUVBOTBhekRBZEljSHRQVXJZalp4R1ZKNUF5?=
 =?utf-8?B?ZEhxa3lDNmhOc1VXOGNuTlU5UWRVL1NlTTVlRFJIMUkyRGplTDFnZDVGaXlG?=
 =?utf-8?B?eTgvUUw5ak9jMXBRTlg5dFpvN1R6SUdrQlhjZ3BGVVlHRDEzeDllNmEwVHp5?=
 =?utf-8?B?b3dTelJnK2dXRzhvVmY4cm9nRGE3cUVqVGROU0M4UGdvb3A5bUJvSEZVcmp0?=
 =?utf-8?B?cWNrQlk3R0pQQmI1N1IrUGJMcHFEaEFBcE1GWWJpaE55cE5aelM3TnAwNTdL?=
 =?utf-8?B?NUFQRFdDM1Y2eG84TGVwczZtMm5EdnNaZ1Nkay9IY1JaSU5BMFhvcmU0ak1x?=
 =?utf-8?B?MGd2UjlRL1MzNFl5YmhlYVV3ZEFqZWkrd0QydEdPTU5QT29YL2NER2N4eEQ5?=
 =?utf-8?B?c3diUHlxL2VOcXVNUXlLWS9hN2g2d080ZjhHNnZoK1pDNFh6TXBpcm41Z2dB?=
 =?utf-8?B?dEtqQjBiYThselNibVExZk1FMmlHUE9sR3ROVUdQK0MzdndqTG01Sm55R3Rl?=
 =?utf-8?B?YVlRMDVIZkNwODIxbC8zTmRUQzJsME1uUUJnb0M1dy9lb0FrNGt4cnFpUHhm?=
 =?utf-8?B?dXM0UFpKbGxPR0ZPL1hjQzZrVmQrK2xhNUJRSkJWNjFjSXQvaU91U1Z3YXBr?=
 =?utf-8?B?aFZDQzNhbE03OWk4cnlnbUNCVmpNNmFMWmREajk3RklnZ3ZnWnB1K2dPbXlw?=
 =?utf-8?B?V1hKTkVjc1Z3aitBSUF4ZVhZdlVkaHQyQjluZXM2dFdKank1T3lTYi9EeFVZ?=
 =?utf-8?B?bmQwWStOZ1J0a0RVNmN6YWhreU1OOW5Ic2xjM1B3L0o4L052UlNMUG4wODF3?=
 =?utf-8?Q?sIrG3bgcnFHGjwPEnMr4lcl//bSfmzXon2fcHWT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad86d77c-a75c-48d4-be5c-08d989938b19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 13:08:23.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WusMsMNpdqotQ2VDQOKmCi22YszPtzFs0os7rHJxf0Ryg4QYE5y8kf1MRDKBbN5KyGSKPSAKaTcY3dsI1L4fRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 06.10.2021 19:40, Rahul Singh wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +#define _XEN_DOMCTL_CDF_vpci          7
> +#define XEN_DOMCTL_CDF_vpci           (1U << _XEN_DOMCTL_CDF_vpci)

Like said in [1] here I similarly don't see the need for two constants.
Preferably with the former of the two dropped
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-10/msg00266.html


