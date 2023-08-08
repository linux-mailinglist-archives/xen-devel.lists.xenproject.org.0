Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB7773A98
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579957.908188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNC7-0007mZ-Gn; Tue, 08 Aug 2023 13:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579957.908188; Tue, 08 Aug 2023 13:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNC7-0007kh-D0; Tue, 08 Aug 2023 13:56:19 +0000
Received: by outflank-mailman (input) for mailman id 579957;
 Tue, 08 Aug 2023 13:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTNC5-0006gQ-Ca
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:56:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57452b1c-35f3-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:56:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9884.eurprd04.prod.outlook.com (2603:10a6:800:1d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:56:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:56:13 +0000
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
X-Inumbo-ID: 57452b1c-35f3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8lgDNbi+Q/dqs2X+Q+MjOGiHnI2+EOd3LCRYbaIAreCsgg3ClBWXG7UvBz4HM4oI07tax9cCPPoeKsJN+3LwLav9asELMh6sOMldteMammlbng0bMb8UdrBZcuKgmnfuYEGDz/GaeYXgyD8bCGNqiwx6RX3hebEnGaIgSR8F1ovHPYeKKUtxPt8tyUx8vU2HGDHsVSSjMUEkaTXk8Uckgw22OYZpvqjAgdbRVus3glgB43U36vN4wwzokaoE1kmgLcW7wXX3t82mAQ+s3haf2ENOLPDgL4XpoV72P69QUS7KfH92tikidkxpjiLIvg+wZCiBLCK8Y1WabH4n3lfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz4px8UJT1vPWJRglAC0NI2xRKiOs91Y99XgwbTNFIE=;
 b=HWoBoKvA2+9M/Lm+qGBDMjNfsDF18deWjK4u2ybPdRz72LrgvSlOFat6TF0+ZZ95rO/fK6oLXVelDFGvfAr+ubqQqntBzH3mD2edEnavoDD1A2aWaH2CFyxqUl9xdrkU6TZoEsaLp8d6Rh9ZocQElkZfUrxSyphUoBFWTKONwdenKmuvOVD9v5IMXsTHQb5MAYaa4Xrq21dAueqUSwj5b/cQm4ZeyyY9/dDaX2mAdp21uQzWIbiGUrlxpY4ZYJuxqZg2YoX11zlkxLzoMZegQY/GOnf++kGQF1r6YnJzAcQxkxpt3EFPwhTQjHd6QfX0oZPgzJU9fg1/4vDFqGFTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz4px8UJT1vPWJRglAC0NI2xRKiOs91Y99XgwbTNFIE=;
 b=FtPg8GMrcGhFOdVfK8d9aJFESt4Xf+cregp87njxE5LT2VqwwQPDMee3JhCP56pWj2S2TfTqF4zq3P/olssCFm6zeCkJznJj1zG5/j2DOoBqq+RqRqf69Ij1f/8j8BGDZ27TvxXn0v85dnXqiqvrn6x/MBdJBcgNSPx7oNXjkto9sPZrasaZTK0xpHxJJ4VyMiqOyUM1U4cvZRy70aup3d1NkLypheAI/U2HRjQ6M6VaPITdCJ6ioSghQjBvtZ1Tp7WyO5rY+gFSFYMOcqVqA8YuFHCW6gjHAqKb0yTdWyvy0sqApVlb2UdT9m7V3EItEygziiZ44x71yYEkHZfDsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <391b07ba-5004-6236-5296-efaf06720371@suse.com>
Date: Tue, 8 Aug 2023 15:56:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 2/5] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <27631ba28fc6f47095fe0db3f8ee2cd87de616ed.1691492441.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27631ba28fc6f47095fe0db3f8ee2cd87de616ed.1691492441.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1f1eea-6cbd-4633-2e79-08db98173a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k5qEUsSQ3XHua7j1X/WD8wa/OokSiRvIQV8BTTFKUyARUX24m/TC5cKBEp2Qeqx8b5zZuozpwHuRQdrR8bgQf+CPWdT44ZHltMz5iLudTJhTWIxOvXf+Kv8JanZtP6rJ6tKyuV7i795DQxbnfRq/oYF2Dj1ZEECubtiQOo0vZABXJFIdfLCEduFiBtCbEwJkFNBvh/x3emx3Y/cm4up2k8YCtdHc3oBHyfF/j6pMWwoLZ9u9Rr62iq9dSBYfEzi7U/1UkApuAUrwrZfr4/k7jhi7ETkiPO9pI/pmSFq+XCs58BG25ubewysT3N/+SJ+9+FtBX+8x4sbuF/pmiGRhrjgRpWVA8JA3F9oRM+AVL7KF9ej+FUClUsIALd+89RtZKkVb8eSCiKVGIVGG7Z4b8kbInWYVCDib0A1Pv6l3hZg7v9gAPI1UKQoy+asLgelZTZ+BXZdruHfYrnL3itVpofNAJk6i2SH8PAEurYrcT/UQfqvkBBrfSj+u3GAfvUV91A2i5Ym6rItVnupn5YQSXsjISjkKRmlEsskv3P/jfg8JeSyesvvpfPCwe+rO8mqVgFcbQq/5ryOeinzEBUhpmlaPzOtIRoLDLo7XZsa7tpWIx2zppFb69iR+am9MvuwNvhV1fft17MAUXGaldoIQuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(1800799003)(186006)(451199021)(478600001)(31686004)(6512007)(86362001)(6486002)(6506007)(66476007)(26005)(6916009)(66556008)(66946007)(53546011)(4326008)(38100700002)(54906003)(316002)(2616005)(41300700001)(4744005)(2906002)(36756003)(8936002)(7416002)(5660300002)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTV0V1BSV2oxVzRldUNwNzkyclQyeFRFbG5PdEVpNklqWFJoZW5relJwWHd2?=
 =?utf-8?B?Um1Eb0xCMFU5MXY0QUJmbHFuT1Qwc1dESTc2TnZibU4yOExZQXZvWVVJQlZB?=
 =?utf-8?B?RloyUnJFTHcrbjA0bmN6S2F5WDlIdm1kdXNaVUE0R2VlNVBwZlpVOTdSM0xa?=
 =?utf-8?B?c1huM3I1R011bytyeU5HSVgzbW5rZmtCbGhHdjdjZHhSb096dDhLZzF6cFpv?=
 =?utf-8?B?dy9ObmpzTStqMnJNbFBNanZFN0RtMjVkZkpncnh3cUxxZGJkVkhPdXNxZFVV?=
 =?utf-8?B?bk9hbEZGTS9ycEoyY29mK1YwMDd2ZStsaVBTMXNYY0hkMGNlcG8vallGdVdY?=
 =?utf-8?B?bXZLN0cwUDNrblA0OGxXeVdEbHVWa0trNFVpZzI3ZHc1ak5KZW82cU1jNkpU?=
 =?utf-8?B?QTNLY2FVSFl3UHl3YVJrTURPYmZmM1dOM1pHV2F0Wk5lYmswTkl1ZDJEUzNa?=
 =?utf-8?B?RUwrTmRIYUNIWHdSS3dDU2NRYnJMK0oxRkxVekdDa2k5dUp2eFFRUnl6eTFu?=
 =?utf-8?B?SW1KeWlwbmpDQmtDdHpTamNiTFNqT1ZGVEQ4WXRvdTJzbXJxM2ZPZWFqYzBu?=
 =?utf-8?B?c3NqOXpkbTZqRk50Z2VRSHZ6ejdrOG90cDJ3elhsc1RTbWpTbC8wYTR6TkpO?=
 =?utf-8?B?Tkx1eGI3cHdoNHlxZDdNMkpocFNmbFZ4QnJ1UHJPWis1YWxCY1liSkhWcjMw?=
 =?utf-8?B?dWdDS3hhNlpISi9hNXFtT2I1MkdlUnQwOFh5TitTd3pFZFhTQTgzUmpqZVg5?=
 =?utf-8?B?Y0R6ZjFtNEtHbk9KVmROUnJrTW1rbkhWeEtoZnQ4czJBTkYyTjJZTDh1YWR4?=
 =?utf-8?B?YjdrVXBEeVZPZU1ubzZOSkVHSWZUTS9kS1NpWmRVMHNDVFZBTzBZeGdxZkI0?=
 =?utf-8?B?M2V1WVkySWMvU2RXQ2Q4Nko2ekEySFkwaVdVcHIyQkhjWmpoVm51TldWQk8w?=
 =?utf-8?B?cjFkc3dvL0VYUGI2dHdBem1ScEJYSVJZZG5BejdrUU9DRzI4M2hESmQ1VzJN?=
 =?utf-8?B?UEpicnRMQzljQkRQQXVSRDNZQVR4ZVNEbmtrOU9SY1M3V2hlSTVTTE00OG5o?=
 =?utf-8?B?eVVRdFd6d2lJT09CZS9NRkN5dHVOZVE2QnZ2VWQxSEl2bEMybkRNa2pjWkx1?=
 =?utf-8?B?MU96MEFGZDZCb2MzZUpsQ3FXQ2M3LzE1cnJqbnJ4V3FkelNncGdUZVlXbVFr?=
 =?utf-8?B?bHFvbXArTXpWM3NjSExscmRXaEdiNWZ3Y29UaHRTcmZYTFY2MC9ocEVIOExj?=
 =?utf-8?B?VEcxODFrNlpHRlZLZHpSZ1F5WXBETHhGY3lZYkQyK2Q1dVhULzczbjNodTdH?=
 =?utf-8?B?eThKaUQ0dW5vem5tN08xS1Jna1UxVmZnc2xESUs1cjRRcVdxd2RSbzhoUmVy?=
 =?utf-8?B?REJXamtlYU9iRW9EZWlvUDBpcU9zZk5jaVovcUVsS3FBdUlMTnZDTzEzc1JM?=
 =?utf-8?B?djE0Z1FNais0TFp1OFNLKzJkYUIybVd1RVdlb0RVN3FhK2MwNzd1SHFkcDVa?=
 =?utf-8?B?SzcvVUJhcmdySEg5a2lVR2NxWXFwSGxRK2U3M00vS2tLWjdDM3lkL2pxeTZ2?=
 =?utf-8?B?c2tQVmZ6WGVZeVFPMTNyTG9UZmVtZTdxVHVDckpMSzRRUFZQRktvMUxBNzVX?=
 =?utf-8?B?bWdPVkFxUnJLQlpud0Y0TDNpUkNaWVZka0hGZGJsdG1HUSt6RVlqNUpEYXdG?=
 =?utf-8?B?SVZUY2VFd1pRN1dKRDFRSGJlMnJ0ZkRpbjFQWnVOZDBQU1BOZ2plK3o1V3hL?=
 =?utf-8?B?WFlRV25maFZDclpka2FLZ3p1bkdjcmpQNzdtaVBJeUE1SlZxRW12VVJWQ1B3?=
 =?utf-8?B?cnl4Y1VyeVNDUDJEZmJFUk9ZcjFJbFNsSWdoclVReWlJbzJKQmw3cWNWN0JG?=
 =?utf-8?B?ekphV2RWTjlqbExmY2lBekQ3bHh2UFFhVUgrdUszWlZkUWo4R3ZWdWhWRSt6?=
 =?utf-8?B?cSsxc3IvTGRIcTdGeEx2YldkY0wyMlRxdVM0QTI1SXg4bXdRM0U4OGVhSGdR?=
 =?utf-8?B?TzBWRlgzUjBZS3Q3WU91NFF2RE9tTnF6dkw4eWREMXVTU21ieFk1b3pBNlpF?=
 =?utf-8?B?eHBsazIwWnNaM0xKa3lBTkFUTjJ0anVPT1lDUnZ2R2E3amRUUTBQQm9oaWdT?=
 =?utf-8?Q?IWywY663kc43yU0Hk/84aB82P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1f1eea-6cbd-4633-2e79-08db98173a76
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:56:13.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktdFf6mvQHJBZVTSVN4oIQr6bBBMKqgkwCJLMdGrNOSQHiN8WI0L1J/IcBjGHlsDOWH3LBVrrJywUY45zGWHtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9884

On 08.08.2023 13:08, Nicola Vetrini wrote:
> --- a/xen/include/xen/delay.h
> +++ b/xen/include/xen/delay.h
> @@ -4,7 +4,12 @@
>  /* Copyright (C) 1993 Linus Torvalds */
>  
>  #include <asm/delay.h>
> -#define mdelay(n) (\
> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
> +
> +static inline void mdelay(unsigned long n)
> +{
> +    unsigned long msec=n;
> +    while ( msec-- )
> +        udelay(1000);
> +}

Nit: Style (blanks around = and blank line between declaration and
statement). If need be I guess this again can be taken care of while
committing. With the adjustments
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

