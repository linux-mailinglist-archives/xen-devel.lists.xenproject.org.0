Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B4E3CD1D2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 12:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158292.291487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5QSQ-0005EI-Qa; Mon, 19 Jul 2021 10:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158292.291487; Mon, 19 Jul 2021 10:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5QSQ-0005Ad-MS; Mon, 19 Jul 2021 10:25:06 +0000
Received: by outflank-mailman (input) for mailman id 158292;
 Mon, 19 Jul 2021 10:25:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5QSO-0005AX-H9
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 10:25:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b586be02-3678-45c4-bf6e-829aecba0a72;
 Mon, 19 Jul 2021 10:25:03 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-MNDqJgpeNYWbLXDEobEF5w-1; Mon, 19 Jul 2021 12:25:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:24:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 10:24:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Mon, 19 Jul 2021 10:24:57 +0000
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
X-Inumbo-ID: b586be02-3678-45c4-bf6e-829aecba0a72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626690302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POn8hIB2H4ihf9wSYMF//Q2JeeVDaGgoYKaiTYjrByc=;
	b=edS43cB5PYBVuDz+k6JCEFyen+odxsVY03lBbj56F6VrR3Ku4LheNBODfm0nTEl3qKJ5NF
	PqDclhYyngC8DnNROl4b0IRYLKhYtlBpRz7cTfF/CstmPK9wJBzy5GNLnJeUAyb3Gj38mj
	jxhU1ygJ83aJkfhD6uAruJpbILsWINM=
X-MC-Unique: MNDqJgpeNYWbLXDEobEF5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImwkhIYAcMtE3YK4BYHcupWUMhBesd3UzPJo68DZ4FM0yhA8LeocaXzFaQFMK707Ff6PCi/lGbQdNKTBUcJ/ULiDzxSNJ8AuwivDNGS9mx3Jqblh28gafLF3MgaKCGG80Q/wEkE8RBJ4MeNl41rDWFlO2WVZgdzdTM3w59GFPlNcfKDgnzNNoALXw8157D/tGamGhDppPwNCJvlo97xUYbfKFR6GBd3B0nWVXUnmthJ/ypGnWS4GkaIOrMVFxghHuyEzNeD+gpOcGGpfC7z5CyQ5Z/5haig/CuyKricyXkeshIBpWoK3WiwS8Q4hctpwHD0R/MyaxXe2pGLRdO7zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POn8hIB2H4ihf9wSYMF//Q2JeeVDaGgoYKaiTYjrByc=;
 b=Nm3TwVtfMJJ3yq8v5z6UfJHzQYEpXxStGceXuxEy2g52oV8rCyLQWQ6B2aRcCo09rxjb5nGasnZBWtUn1G61qkNk5vMB50t2YFz0oci+MLFkLR3aEYhyjhWbI6c2yG8/u2jbaOhThiE+H36EmZW8GpI6Yx+J9XUvFADjFNpT9kOh4LHXdEF9gN3QwGgpRdKX14KusrJbsWtFd5n8j/4mL1YSP40uHVsFXEP2/vz2hOEbERDtseLc1hAWFdlGmSXqhQOp4t7NKd55/ThQmYJMwlYYh6rx3OMtLhXRN4bIRtI5kf3jQtG11Oe4blu1CvAicRgqpzcI1tA+WRrfX43TXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 06/10] xsm: enable xsm to always be included
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-7-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4aea947-ae36-7791-dd95-94ce0e60a62a@suse.com>
Date: Mon, 19 Jul 2021 12:24:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2175454-c25f-4437-f5cf-08d94a9f756d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59021F9367C5E6BC6BD4DFE1B3E19@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RdCUeKldJH8XJ7hCRXxu+BKN9TnaXkSiKdfHAOLcv1nSnlqsZIIWPEcyeGB+ikkstD3Tjrn0en7sh734nLu9MvMUN6WPo9cEmlHHiiDRGhLjmq5M4+mtZnQIgB3RklJaeN+dzTaSgV3tKqkJq+0aEe/gFtV2OZL/dy2c6fuyyqAmy2BO4eh+SQQtiSafgVgijkn3q32t8y2j3gtOc5T0lBK8lBXJF61TCaltD54eIlZD/n9DYU9fQD9AIQeoWTd2QXBMRgvivaR5vsxhHWyWgWjSkm1dFuHisB6TVAwjicUE7PTO98I/kvhfmc45Zvw9humabsJp78hcgL0g3XaflWtRlde7irxsKRPVR7cYwHiroEokVGgNROVK0FTPewbLumF7cSYHOQCrUMQqB1zkM4cjOPE8cMGqWCwlvZw7LiQZ8ojkcG4uSL1MxYkXguEHXeZSBWQPIPfW4ilzjxc9sdSdmx6AQmUaksKnYYo5Omm8eEeiE36gCb88zbE80XYRQaxIdCleFrYcE3g0KM9k6PItV/JtXFuvWaoqHx+vokhymBvQDjBGk7fSx7/hgM2pztZsopD6H96F7bWtrSpiphzQ3Z74K5PeyFn334WW56g9dhIlXl6ZVQGfZBqPfMIDoDE5jBRCAFPMPYnwwTrmus86aaoESHnHPKtCrmVFbvSAKy7Imc9deyN3Jing2jJF2h9uCm7X+ht8qh51NiijD3VKp1O8CCn9+b2QeOEW2U0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(39850400004)(396003)(376002)(346002)(31686004)(36756003)(86362001)(8936002)(5660300002)(53546011)(8676002)(316002)(66476007)(31696002)(4326008)(66556008)(83380400001)(66946007)(16576012)(6916009)(38100700002)(956004)(54906003)(6486002)(478600001)(186003)(2906002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak1HQmRRYXpmaUd5RVQxaDNOR0VseHN0T3UxL0ZNcG02SnVlMEw5KzI3QTcw?=
 =?utf-8?B?aXM3bGt1VmF1RndVdEZreFp2REZWNHM0L096KzFKSHZWKy9PVC9hVE9KOElv?=
 =?utf-8?B?bWU3QjVsbmM0V3kwUUxLYlFHaFBYUDFVTytkbEt1MzFpaE0xRWljeDVKbjdI?=
 =?utf-8?B?OWZmclFxendnTFJ0OFREdmpuWjFVZUFXcG80cWRZZWpjQys5UVRJajdDM1ZJ?=
 =?utf-8?B?S0lFWmtxMjRiaS9LeVN0bW9nU2lrSEsxRE5zaVcveDUvODFCYkRFOTA1a1Rs?=
 =?utf-8?B?UzFZOXROOXdOTDhDS056NEhVNWYzTjVNOWZzV2hMV1ZVVkRFd2xsYStGTnFs?=
 =?utf-8?B?alNIL295Y1NQN2ljZDFvSUo0Y2tLbVBNaWZzNEkwZWVESzY5VlFnT3NuTC8z?=
 =?utf-8?B?NkgvSW1xVXBLblNnOWl3TXZZWFpFWEV5aFNPOEQzUGQ3VVZ6THdyUEZYVHFy?=
 =?utf-8?B?L1VqZkRkNmg4VFZuVlRUeEk2MTNWRmxzK1RzeHBWWUlJUVRNQ1M0UVhjN0hN?=
 =?utf-8?B?NVVXNG10dTZINlRLYnU3WElBZTdNbmF2MUtqWW05ekxLdTlOblh5ay9NaERy?=
 =?utf-8?B?VENIM0h4TWxWcHVCalQ0VHJEMUttVTk1MEtwS3Z5VEU1YXRFc1lWZklTZ1Fm?=
 =?utf-8?B?Qy91VENieUp6YTRlME1JMS9tbzBFWXRoUVVQNHF3dWFTQ2VhT2JZN0hpeEM5?=
 =?utf-8?B?c0FibWpsY2p1Q2xFcHJWTDJWNXlLVyt3ZlByTVJ3SzJlOW5EKzU1a2hDRlpv?=
 =?utf-8?B?NXl1OEY2czRPRmcwOFFMTGwzT2cwMi9zQTh0Tjk1WElMTElUVUlGUEV2WWsw?=
 =?utf-8?B?bm9VbW5WMjNuUUFtVXgzeWN2akF3YjB1dEoyc3d5Y29RWmZLQi9zYlRwZXMx?=
 =?utf-8?B?ejVQeEczN0ZVQ3JHSUZzVGVtMDAzaWZkMEpCVDdYdThlaHZtbkhIaytpdjcz?=
 =?utf-8?B?WHVkcTlpMnJoZjkrdmdXWVFnMmNueDd1c3pGZmZlZ2NoWW5IaHZObHlqeHpl?=
 =?utf-8?B?RDhqQjlONSt6MEEySDRxU2VPa2swTWs0V3JmaTdSb1Awa0I0bTBVYTcrcTRE?=
 =?utf-8?B?R0dENjR2d1FTWFJ2cTlXWXhOVkZKekhDU3F2cUdPcjB1WXJ0ZWFMVzhxenNv?=
 =?utf-8?B?OVhGdUV3Z2tnMnpGT1pPSHRtaWR2R211Y0tZd2JCSU5Rcmh3SUJxWFR6TmZq?=
 =?utf-8?B?N3dvYzVzYUFXeWRhZlhod29Cam92RXVxVUwzeER5NE1nK2piU3lpMkFKNVdo?=
 =?utf-8?B?ZU1pU0JLdnIwZGtHbHdNb1BabjI0QS8wT3NuazJwaGRlTEEwV2dObWN2VkFn?=
 =?utf-8?B?amNsdjFQVll3QWcyWHYrcThYTVFkbHNqNVVYNnE3amhZajZxRXFIY1RPMGtL?=
 =?utf-8?B?K01Zb3IzbzU4RHp5RGxCVmZTU0xCMjQ5YUg3UUYxWDU2KzU4aTg1bEROYm9K?=
 =?utf-8?B?TFlySTZEL2VvdjFZNlRkYjlUWkZQR0xrYTMvenB3RnpJeXhHdjdkcEJqWVg0?=
 =?utf-8?B?WGFvb2JhOUlkdG1CZUNCeHhmazNMNWgrbW1RRmREdGF6UmMxVGloOXo0TFdi?=
 =?utf-8?B?cUc3OXNIankyejRSOGpRWmpJNUFlTkQzMDh0Mm9yWXVWaVZMMG90bUxzbTBU?=
 =?utf-8?B?R3hUaGVqVGZyTnNEaXZPYlExeWVjdXpHRHM1NURFb3FLNStUU2VJdTlZM0tP?=
 =?utf-8?B?SzJDbWx1VHdYNnZnckdUK1VOT1ZUdjl2SHJQUjZCWDdRTEZGS3M5TlVuV0lS?=
 =?utf-8?Q?yT8IMw9p9UnQRVbVQXMTIs4v6Xl1bPw460koOXy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2175454-c25f-4437-f5cf-08d94a9f756d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:24:58.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ww3JKSOhypuIZOtDghyVlYCr7l1uLBSPqFAB+XTZLqnSe+Yu+LYBbG2EyDzDjI/DYiBiVpGdsY79EkwU9JUekw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 12.07.2021 22:32, Daniel P. Smith wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -200,23 +200,20 @@ config XENOPROF
>  
>  	  If unsure, say Y.
>  
> -config XSM
> -	bool "Xen Security Modules support"
> -	default ARM
> -	---help---
> -	  Enables the security framework known as Xen Security Modules which
> -	  allows administrators fine-grained control over a Xen domain and
> -	  its capabilities by defining permissible interactions between domains,
> -	  the hypervisor itself, and related resources such as memory and
> -	  devices.
> +menu "Xen Security Modules"

I remain unconvinced of the removal of this top level option. I don't
view my concern on code size / performance as "unreasonable" (as Andrew
did call it) when comparing with the current !XSM configuration, and I
also remain to be convinced of people who had to simply answer 'n' to
the XSM kconfig prompt being happy to make an informed decision for all
the (previously sub-)options that they will now be prompted for. As
said before - it is one thing to re-work what exactly !XSM means
internally (and the conversion away from inline functions may very well
be a win; we simply don't know without you showing e.g. bloat-o-meter
like data). It is another to require in-depth knowledge to configure
Xen that previously wasn't required.

Keeping the top-level option would then also make it unnecessary to
alter some of the (prior sub-)options' defaults.

As to Andrew previously having said

"There is no such thing as !XSM even in staging right now.

 All over Xen, we have calls to xsm_*() functions which, even in the !XSM
 case, contain a non-trivial security policy."

Yes, this is one possible viewpoint, which I simply do not share. I view
the xsm_*() calls in the !XSM case as simple surrogates, not anything that
deserves the name "module". This is actually supported by the help text
of the XSM Kconfig option saying "which allows administrators fine-grained
control": There's nothing fine-grained with what currently is !XSM.

> -	  If unsure, say N.
> +config XSM_EVTCHN_LABELING
> +	bool "Enables security labeling of event channels"

Does this really need to have a prompt, instead of simply being
selected by the module(s) needing it? IOW what do users gain when they
answer y here but n for XSM_FLASK?

Furthermore, if the prompt is to remain, then I'll have to again
raise the question of ordering of options: This way, via e.g. the
"syncconfig" or "oldconfig" targets, I'd be asked for the setting here
when, if I'd then also set XSM_FLASK=y, the question was in vein - the
option will be set to y anyway.

> +	default n

May I ask to omit "default n" lines. I'm unaware of anything good they
do.

> @@ -265,24 +262,26 @@ config XSM_SILO
>  	  If unsure, say Y.
>  
>  choice
> -	prompt "Default XSM implementation"
> -	depends on XSM
> +	prompt "Default XSM module"
>  	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>  	default XSM_FLASK_DEFAULT if XSM_FLASK
>  	default XSM_SILO_DEFAULT if XSM_SILO
>  	default XSM_DUMMY_DEFAULT
>  	config XSM_DUMMY_DEFAULT
> -		bool "Match non-XSM behavior"
> +		bool "Classic Dom0 behavior"
>  	config XSM_FLASK_DEFAULT
>  		bool "FLux Advanced Security Kernel" if XSM_FLASK
>  	config XSM_SILO_DEFAULT
>  		bool "SILO" if XSM_SILO
> +
>  endchoice

Nit: I see only two consistent formatting options here: Either there is
a blank line ahead of "endchoice" and after "choice", or there are none
in both places. I don't mind which one it is, but I do mind
inconsistencies getting introduced.

Jan


