Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E574C6D00AB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516566.800886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpCr-0006qE-3a; Thu, 30 Mar 2023 10:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516566.800886; Thu, 30 Mar 2023 10:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpCq-0006nd-Vk; Thu, 30 Mar 2023 10:08:32 +0000
Received: by outflank-mailman (input) for mailman id 516566;
 Thu, 30 Mar 2023 10:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phpCp-0006nX-6x
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:08:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d137657e-cee2-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 12:08:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 10:08:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:08:27 +0000
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
X-Inumbo-ID: d137657e-cee2-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzdSW5jFU4HDicnU0GHiyxZEqTgaHZ2SMuEKpZbYUdP2Th1MoVXYdxCA3az+2Mw4HAZ0V28FHfXRF7DwbzND5okDYndW9zGNg40p7NMJQuwpFl+SiX7NBmzhkQzEi59zkUMIUBnTr+0WMRoZtRBw4DzMMrRySiQbAit0nbAZujVNONDaLrW+OH8tj2A1lpPIczXUn0buaveHYwpnCP0IEKdzNjWvF5WwoEO5p3+Mo44nbwXu9/htVdRANRl2Lg2tbxWm1CHAljtVjxeQ/NJaIxdWgEag8FaDGWHuWOWUQGScKaQquQ8wZg/MBDF+u0cgfPXRFHL16MIuMORbhhG4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/NcKv16TIQD/oQu6LVYAoa5sDgcXoU6q3RNTFBkg4c=;
 b=C/nB1ABjk1ZsFihBycm2cMJlTT4RQL80JAdzZmuB3pliZuB+0bjP7fkaDoAuVO/Mf+KuoQffdrm60TfzNUVllaag3DBxov7xyGxC/RsphxaXHKFSo7n4xlbtCYuVi2t/s8sf/TRwLOp937GKSzTXa7WLcmap3zazDnSgzA3D00ft/7CV0usOCfII0q+EJMazB+7Zh5+AOunAhdvQw+A4sk96ADySmyW5b4DJzPV3mfLx7/ktuPDHCzedzGrX9Y1gFjL5FLWNajYYAhZFYbQT4inowgcAnEz09m6eEsQ7drdSeoNG9KnB0XqRgJT23WqPF2l66gytSzKLRydyQ3Isgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/NcKv16TIQD/oQu6LVYAoa5sDgcXoU6q3RNTFBkg4c=;
 b=UwiIWYfbCUPEmUq1LP26/itRPfsppqTE5ocvHPWfmpFh/cmnxuYu1iSNMvY1gqMC/4vVEVWoXrynsRDtx3zB6tZpMw9Uj/+/moFuwVnONnsAkAmfIMmyiGJK78Gi9KOnEDeu+kF8H6F9MvF6Ms+on0s3IKseqHk5lmGK3LNXz6hapWQJVr0uOjtgJSji+0tUNUMtuVSV6cZ8lL39KN3dfeq/CXszxBqbMyZ8yfTkuL55qqeaE8eOnzsUPXJx1WxiyKXUbF1AM4wSn3N/YdtD0ZdfQkQU9AX/8cy5sVdXLZL1Ija1p5bgL9kDLhbKjpFWaSeh7WpWA1iI83ljfyKjcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03feb32e-4318-37cc-cb08-16402d4ea430@suse.com>
Date: Thu, 30 Mar 2023 12:08:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 8/9] x86: Drop struct old_cpu_policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2cc44c-2398-4fb6-44d1-08db3106b4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2bROTUaTCE+nm9BWhNbzfHhO3c/vGMCtB9wQnzpD8CBiE9/Ib6DK9RnoCeRh1RXmj+QLQ1+XFWon945U3anMwUKSNobA1gKyYtS0qfavv87w0u+tfFlRhelYIwbhigkl7ke+ixYgBMISuHsyJh6hc1Ge2vpSem3MtX+GbHMbxQuT6+OIht7ZQWMLKgMLOsHmlByzRZ2pQMUXbszFK8KP1CB2Lg/+LPgPEcanu90zPz/XCbr9Otbn7QgQbfX2uok5KEe1MOXTReQCoMTPUhFfgjqzXwb6mjqY2Fu6hRdnq/mtantHCHzL9OaDGp8EVb3bbHQ9INQFdNiSnHEEY9plaS07htDE586ZmmEwgmHSVuDasNT3aH7EkBJxx7eqm/FDAI+QxUxbPHaA4FRhcIJXT8+JZgykF39HTWt/7NMQos2TPd4CMDq1llRh24nVyl+CceRmcg6/wadx3ILQdAi0sNddArv/tORxJnySr73/ZIHs4Xq0BW5ZSenegOVUobldETOsdnZp5pMKXxpEl3r8tqZDLcf7mlGdux2VSxLrCbd2Uo7GJ/3aL1er6i8qvIRVWzpjQV8KRs299hIJcS5ZjC+IKNiT/bpbqmx5JLV5I7tEAhy55fs7yq1RKJg61VDoTbJ4uFayo+msWPHmVSnbBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(2906002)(4744005)(31686004)(66556008)(66476007)(41300700001)(6916009)(4326008)(8676002)(66946007)(316002)(2616005)(54906003)(478600001)(6506007)(6512007)(26005)(53546011)(8936002)(5660300002)(31696002)(86362001)(36756003)(186003)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW9WalRoMGJUc2NTNVBvcnJEdk5TOXRPVHFZbFViSTFGRndURTZ1dWZYalRs?=
 =?utf-8?B?RDZndWU4TW8vNmNWRU1UalppUXhxOHl6NGRmampjd0NaUTJub2Vad0s1cmRp?=
 =?utf-8?B?b3BVUy9jcWtVdHNtTzU2RFR0QlZUangrTndBZ2pzN1FibWR0alJlUFpZcTlC?=
 =?utf-8?B?eHl4eXBlcG1CdTV6clh6MGdXQk4yZW5DaTFvNGI3aW5Kc3JSdWNRQjE4cjlh?=
 =?utf-8?B?VFFKTGN1aE9pWTZ3RzZ6eXBSdW9HYVVMcjZiNXR0dHQvOWRGNzhMYWNuUUJv?=
 =?utf-8?B?SXpvRnM2UERBWGtJcnlVMjBQL2pXRXM2bTRjd1doQ2FpeUNYdmtUVDZEenFl?=
 =?utf-8?B?Zm1JRG5HcGFaYnI0MkhjYm9sNkhPSGowUWIyK29tVUVoWVJ3dHJaV3RZRGtY?=
 =?utf-8?B?T295MEZacEpZaDVnbndjS0JOVG1HUEo3YUpGanJlcTNnTE1ieitpOWM0aGhB?=
 =?utf-8?B?VC9LY3dSRjdOYUFvTWhVRCtSd3hBa1JaT05tNUpTdU90c0lpZXJzUlY2QjRG?=
 =?utf-8?B?VWsvcDdhZzZ1M0Q2emxSSVJITEdnREdaczZaS2RDVWNMMThvYnI1VzExZ3g5?=
 =?utf-8?B?blEvTUx3NWE5WnA0eTJsbmx6ZEhZZFVFbTE1b2FVK2xPT1YvSmNIQmpKMlpJ?=
 =?utf-8?B?VFBqTDlyL3BiTHpvZFhyVkEwVzB5MGMxNW9RcHFxdDA0M0Z4T3Jjcy92aUhL?=
 =?utf-8?B?MjV4alVBbCtnSDI1MHBBbVZhN0FRcVV2K2FtUU1yOGpHeko4eWtRQWlodEh4?=
 =?utf-8?B?K0t4a3dRTGxYMlFVME9Lakt4YzZ0QURxbmhqMGJyZzE4OHpFUFRIcVc0aFJM?=
 =?utf-8?B?T1NOZE1waWF2bzZ6bGdaUzhQa2tOSjJLeWlzOFBZNWxOSFpLSmxacDU5d01Z?=
 =?utf-8?B?ZHJyMkZyVnRsOWwzc2RIOWc0QW5rWWt5RUNxUmxaaWU1OXVLSnA5ZVJEOGJU?=
 =?utf-8?B?ajhFMGJmYm5sMkYxeWNBTlpqbnJiYllNR3B1YWV2MXplOTFIQTcycE5zSk4z?=
 =?utf-8?B?Ujd2WXdVVGpxTFUzNFZXbzY0L3dsUE94NEEwVHhrcW5XbkpkM2puVSszUGtT?=
 =?utf-8?B?bEZ3V3Bhb1ZCSFBYODRhQ3VyUkZ6TDNYajIvQlRZejNPMGlBSlIxY0xnTkRv?=
 =?utf-8?B?N3NJcWx4MytFRitFRTR4RXUxblJFaUJuaWhXNWluUVBva0piUzhTU0k3cDJ6?=
 =?utf-8?B?UVZKL2NJY0lVd2dPQmNiMXdZTjVPUURGVDZHM0ZlT092QjN5all3VkFZRE9Q?=
 =?utf-8?B?d1FQMW9RZ2c5d2s4aENjUDhBOVRnbUFBaldmbVZlWmRrOVNFNytJLzlkOGZZ?=
 =?utf-8?B?ZTJUZkdiRWtaelIrR0FkaXJoMjlsN29XdllnZDdqdWRFUWUzeFBHbHMyYW9m?=
 =?utf-8?B?YndZNGRKWXZQYlAxUFhyRGhycEZISGZ6aVEwRm9aYmFoT3NOZCtSRjE2T3g5?=
 =?utf-8?B?UmtEN1BjQU4vY1JqQXNmUzNPZ3pRbFViRlllSUEveWJFRWVHZXQrVERlYWJa?=
 =?utf-8?B?cDZnZ3hFb1R3Y0s5TXRObTdmaGVvOW1rUHJpOUwzOEVidyt1ZzdVODRvV0ox?=
 =?utf-8?B?RUZibVdBaklxM095UWxuRkxadkhOaXBSVGlFMjdqU2k4ZkQ1NzhmOEpKTXFC?=
 =?utf-8?B?dWl1VnNzNm5JNzRWRGZkeCtadHBXM08wTjkvQVN2c1hRbHVDQ3ZrOXRXd3J0?=
 =?utf-8?B?K2ZEaDRxd243T3VpQXNRN2l3WmJjMy9XRVJQVGFyZ3VJUGVLM1FOUzA0V1gw?=
 =?utf-8?B?ZFhXQlpJMWZxQkIyQmRROHl4SVRwc1p6TkcvTGRCdDFDL2gyM0JmemRwNmhF?=
 =?utf-8?B?QW5BYkJDV3g2bW5iT3lrNmdaeG9tZ3RqTWpFWEdrMVlIWFNrZDNxbmlGUkJW?=
 =?utf-8?B?YjYybEJReUhkejRhUGNKOTd2M2FPUS9Wd0pEVVlpWGRhcUkzaVVIaEpzRUF6?=
 =?utf-8?B?RTB4TmxOMVZ2a0xZVythMFVXQjJ2YlM0d1RjSUNTS080OURxeTlGMWFjd0xG?=
 =?utf-8?B?KzJyeHlEUVMzZXUvRHRRYm1COVhvZjc0SnFJcmxrR2xxT3gwOVdRV3ExNWFK?=
 =?utf-8?B?T3ZTTWw2c0FNaVo2NS82Z1RMcWlydW8veXF4WmVrOUhMa0VNMFdRd0pSMXdE?=
 =?utf-8?Q?w1QFGTMZeYId6VVpr418Ya3/3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2cc44c-2398-4fb6-44d1-08db3106b4ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:08:27.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHV6I8NMJsMpLrNHwORgJURL6o57uIfZ2gjXyI8olJ/44VRx49jRkFbuHya2mVYIRlzN8CgDGKs3KhDU96iiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

On 29.03.2023 22:51, Andrew Cooper wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -868,9 +868,7 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>                                   xc_cpu_policy_t *guest)
>  {
>      struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
> -    struct old_cpu_policy h = { &host->policy, &host->policy };
> -    struct old_cpu_policy g = { &guest->policy, &guest->policy };
> -    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
> +    int rc = x86_cpu_policies_are_compatible(&host->policy, &host->policy, &err);

One of the two surely wants to be &guest->policy?

Jan

