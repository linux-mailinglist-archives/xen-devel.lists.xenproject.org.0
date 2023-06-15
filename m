Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A926B7319D2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 15:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549597.858205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9muU-0007O0-AQ; Thu, 15 Jun 2023 13:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549597.858205; Thu, 15 Jun 2023 13:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9muU-0007LN-6k; Thu, 15 Jun 2023 13:21:10 +0000
Received: by outflank-mailman (input) for mailman id 549597;
 Thu, 15 Jun 2023 13:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9muS-0007L1-B5
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 13:21:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b26232f-0b7f-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 15:21:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 13:21:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 13:21:02 +0000
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
X-Inumbo-ID: 7b26232f-0b7f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dckts8ly34m1e07NR0DcGADDdCtPrk86CiNL/c/P6IDSg5uf0rqWECUG4dmJCCeuEHkKNqM2c4HJ7aSfwoqv+3zbk3AK8yWcIXuG2ONnD6h7MDYkVM3WQf+PRgOTEtumTOCDDZQENub+hxyjrMEnNzkWn11eyPfyVWrUzjMisHPxu8SMMljdRR2TBkOLzFfmIGB5P7ylY31nkmTxhO5+4HAbRfefOu9+V3vfFnsNSSym2ogoejemZETlotnDz1mTUWwNSr3knYj0/QhhEaxmL1lUaosXfp1mkOGanB+8JV5KFaaka9VxyIbHLK7HxMqkZz4ACWna01nV7PKSf9rEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6w/X1faUS+IaYNpp6Kv691yIk7tfGh0yQQ6AgYPbok=;
 b=kMqhMLbUGHcdsgVDQGPBdrrmByCLAMz2hf5shUm33Bs7+nbxR+EH09uq4TAUC51KNu4bZ0ywu8ORoeD07ZftxdrAHhkRvYXD6RXTdJFf99A3iHT2TRNvF02IXdDF83vNdk4HldWkwf4OKkOmqfY8TsQAqEQ8Q+BxRbtmlSK//PgPnuuHjQB6EoXhkL8yYX2feYKv5USHJ7+LyGlF8uM8ftDV8gxmZ288EF32yTn0kGGTJpibMSp6k6gAqZ24ICI4Ijgs93nf9XEGqbgqpL3fZ3n1KvAC4npy93j2XZREUKQyKWbMyPYzSs/1LnpNeTR81CvTpR3eKvtEJ8I4U2FJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6w/X1faUS+IaYNpp6Kv691yIk7tfGh0yQQ6AgYPbok=;
 b=18bIHEI7sOQheca9zPkgLgGdwpm5+3NPH0RSYCEMSiUQsoBARkV/Ep5x5tWrsQ0Ck3CeMb5shNhIlfc9xIZZAWmtAaYa5n12tItRb0g6pZXkLF9dzFgT+GVNu3U5Q+NrvIk4l15Fv44JamS2ZJ6sQYvOtXYsFGdklxuXp06Y6ux4xY0KeRLv3WUDlb9W2q/R/h/nCU+N0E7gNVPhXJiszo8a8myXVcrCx68WVTBSeRsdkGSjAaNCswmmxqXn9RQANEKqcaBFC2jTpQSjsZWiPEb7Nfx8hNO5BBjf7f9txd1wbjc2aZZxXgMFuuvsl4cryhgQPtFZ26vukFAiyyYIkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71c1d8cd-8777-e913-5a9d-93696dad3740@suse.com>
Date: Thu, 15 Jun 2023 15:21:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 01/15] cpufreq: Allow restricting to internal governors
 only
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-2-jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc96e9a-4bdf-4fa9-56da-08db6da35d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P5c3DULP9cwRRbaZIBTESVrTgmCx3r63YExtuqHerGfq/+xVWCM/JLNwmVOP03kICcVAsSak2FnUy89QGgByulsT5HneMg7Z1MajI3ot4jcI1ocyDUL5ZGIKcVbYqiK5OpF2Hwa5ibxRoVSLZJ8D3Gmc1Zn1bkeDgdiAcx+XyQ9nD9UdIg47RTaz1dmVyFY7xuUJIGIoRLa2FjGVmZQSYmK9Z9UCiL1X+UJVmMoMe/D3y9o2iD4kOgzdYgwfiRMeYxwNmzzHLsNqX4CFf4Ga/CBFw66adW68ZvkGO8/hoqCAYX30/VyGl4qqJwAjazj+9DDihU4v2QQ0jnQFL5zZ+pb9OAM8ziSi1X4XHdm8fPkiFLw0r7z8et/gadaVu2vpSOxPVRZxOxXYRgtAuLaSRbtZ+iHeRDyW7xSuGqq+L6KpbidzaOXF72xHpOxSFo2B+rZO+AgoJZcR7pW3E/lrCadlhFLLBI4jhdDpoJSiVQ6OAUCErUWa3xQePe2nKQ4NJLeAc5ZUODOxPXVPEIjlFTPoagZ+jMCDtXXOByl3N2tBFIbBPjz26Czd/44j4+RC86XutcPF3NPvUyTqm4bp4pd+OGFXlHpVTdFw30jBWTdKEQ917AXqQvUlCqe4Vifp+VeoLGQZ668fhiJwvPVMaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(4744005)(31686004)(5660300002)(2616005)(186003)(26005)(6512007)(6506007)(53546011)(2906002)(6486002)(8936002)(8676002)(41300700001)(66946007)(36756003)(38100700002)(316002)(6916009)(478600001)(66476007)(66556008)(31696002)(86362001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUxXZjRWb0RWK2JlV3dsWHZ6OXV1WXFYT2RVVGhlRWR3ZXBpRDhVcFZtdGlh?=
 =?utf-8?B?VlJGMnVObitHN1kwWExpTUdKK21rRCtGNFFjSkY3ekErbElTTEN0aEpqaUdY?=
 =?utf-8?B?QzV5ZEV0cGhVZU1pZS9reUJZYXVwbHRFdXZFNEVzQzBlcFczdGFlSjZaWHBp?=
 =?utf-8?B?TEY0b1Z1K092bFZ1NXF3VjJnRzJWTWZER0dGOStSWFd5R2pPZDBoVFhidGlo?=
 =?utf-8?B?VlFIbkVEakwvdHJwKzJsSmZCaWF3bzYvZDdrNFRRSlFJSCtvSjE0RVp6NXJy?=
 =?utf-8?B?TExYRjhiRmJWUkphTExoQkg3WXJYQnMwZ05SeXlWUGxiZ2ZiY2M0dUcwZGRn?=
 =?utf-8?B?U0cwaDFscFgxOXZVTHU3bEJJc2hsVGF3MXFlVWxtbFJCcjRSZVpLakdscDdX?=
 =?utf-8?B?Ym4wOENUaEJCcXV3NWJBY2hOMlEvRnBqbDQ2SVcwOWt4bVBXdWl0RGJQRWtL?=
 =?utf-8?B?cktLSWhqZEpRK1ZNbm94TWQ0NWYvQS96ektOZmVHVjdJdVNHNTNRMWpvN2Jx?=
 =?utf-8?B?eWg0QUFmRjFKRmtzVG1nUFg2Y3d3YVJSaEhud2VIaFJTaWlMWlJCWTB5Y0s2?=
 =?utf-8?B?UE55dC9wNlRIU3RJTGhCeGZKWHkrTy9LS29rby95anNwaXJDK0RXWHhqYTc1?=
 =?utf-8?B?NTYrSjFTZVlyVFl2aTMvUXZvc05RNGFKL1ZBTHVDZnFuYzlYUXUvdmFBWGRV?=
 =?utf-8?B?aDFzdURMMlh3MTQ2aUVVYldDdnZVd1pmMnFRWUZEeFRUeDExemZaVFhiMkpU?=
 =?utf-8?B?M2R1cThRdjl0R1ducE83M2cvTnplbTJIN3N4Q1puSG1oT1NBYVc2eEk2ZFpn?=
 =?utf-8?B?OGcxSFRaZmQ2R2RCc0tGTXBjK0dVR1p1N0E2UklUcGhzNzFPT2c1QXlsY2tW?=
 =?utf-8?B?WlFkNUZ6bjFiVy8rU3RxL1ZqekU0NENrcDNWUHZ1WmN1andoRjhRaGhCbTNm?=
 =?utf-8?B?UHFBbXdCRXFoSWxWVnF3VGErVVhFd0NVNnBvRTl0M2svalh6VHJ1WmUrbmhP?=
 =?utf-8?B?UTU2alZqVjFreGJjUjBVcUhsSzF1QWp3Vml4NFF2dU1kSTUxOFRMOTh3dEtD?=
 =?utf-8?B?clBXT3FKdithSEhQY2NOQ3BGdWVWc1VjOW9PemRUSTJSV2VaeDA4c2xwc1J3?=
 =?utf-8?B?NDljYUgvRlJPRnhWMi9vTGtrcU5Dazk4R0VacDlXM3pwclhVTzRTM2RQNmlo?=
 =?utf-8?B?d3JFNExTRVlDcGtuQVJLczYzQTNMZnhGTlB4WTlVRlRVV0kranFFdmptWCtL?=
 =?utf-8?B?dXRIOXp4MDF4VnZSQmdHMzA2ZXRVcWt6K3F6b256K0sxelZ1VmJYTDdNQ09t?=
 =?utf-8?B?ZFRHRVF0OWY1Vm1vbUlCQ2F2dEJFMkRWRHVZT3lYbHRHTUczYXd4WW5tWXE1?=
 =?utf-8?B?RlpMbTZLL2dpTHR0K2syRG94aVpuWkkwaDJzNGZndEl1aHByLzdTbE1aUEcx?=
 =?utf-8?B?Y0NUVFdjcmg4azdEMVdHREk2b0JHY3U3czlrUlBKbjFXWW1WLzE5ckFHZ1VO?=
 =?utf-8?B?ZVU3cVBLY3dkNUFySDZSSUdmeUdMV3VnOXk4MDJ4alh0ZUhRWTJuYWt5cVRp?=
 =?utf-8?B?Uk9nMFI3Z0hnc2d2c2tYZFNxVHJHZjlHTFZOdzczU0VlVGR5YzhycnhCbGxH?=
 =?utf-8?B?ZTlzNFl0TkV4UmVYR2F6a0lVMzA0MklRMjBINGRrdWRRN0RwbjN6TkRLWmNk?=
 =?utf-8?B?WUo3S3JjZmV4NCtkL0hobm1TMmpWaFByN1RFc3ZFSG1UZlczUzc1NTRKWmsw?=
 =?utf-8?B?THlBTlh4ajZwcklsVS9mZXZCVTlWZndUdUxsZ1lGdmY5VWFzL3hoTlhNbnhy?=
 =?utf-8?B?NVFjVUFacGdUdklSVG9qL0lIZS91U043a2ZnVVBCZGNBcmQ1MEY5cThaM3ZD?=
 =?utf-8?B?SmordHRsVjZIeXB6QjJxR1B3M0FOem96cVgxWTRGb2UvcEFyRDFKM3ZNaXR6?=
 =?utf-8?B?SXB3M0gwT2J6ZjNRdkdTZGJXbGtZME1RZGtOb2VvZmhoTHQ2dWNqeTBoOTRL?=
 =?utf-8?B?RndiTDZ3TTU3ZXhsaC9pY3dZVUpNb3JDb3pBSHdnaHlhL21UVjZYTnNYSDFK?=
 =?utf-8?B?QjBKeGxpWTdSKzlMblEydlJuVUh1eUliQmRybkZIQjJjSncrdUNWbkE0UzZV?=
 =?utf-8?Q?Or/1nhrOEM0s6zEwTMq00XTy6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc96e9a-4bdf-4fa9-56da-08db6da35d79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 13:21:01.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WG2FsFhPraibJpOEPcCDgGC2jVzwYxgr+GT3MISpDpZA3YARDJ4aIBI1G933+RDjzjDH3lAXElnp1aJlTAfBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664

On 14.06.2023 20:02, Jason Andryuk wrote:
> @@ -121,6 +122,12 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
>      if (!governor)
>          return -EINVAL;
>  
> +    if (cpufreq_governor_internal && !governor->internal)
> +        return -EINVAL;
> +
> +    if (!cpufreq_governor_internal && governor->internal)
> +        return -EINVAL;

First just a nit: Why not simply 

    if (cpufreq_governor_internal != governor->internal)
        return -EINVAL;

?

Yet then I find this approach a little odd anyway. I think the
registration attempts would better be suppressed, thus also not
resulting in (apparently) failed init-calls. Especially for the
userspace governor this would then also mean / allow to avoid
registering of the CPU notifier.

Jan

