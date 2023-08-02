Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4376C757
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574763.900345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6ZU-0001Cx-Lo; Wed, 02 Aug 2023 07:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574763.900345; Wed, 02 Aug 2023 07:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6ZU-0001Ab-IV; Wed, 02 Aug 2023 07:47:04 +0000
Received: by outflank-mailman (input) for mailman id 574763;
 Wed, 02 Aug 2023 07:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR6ZS-0001AV-G5
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:47:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe16::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3c88916-3108-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 09:47:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6831.eurprd04.prod.outlook.com (2603:10a6:803:135::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:46:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:46:57 +0000
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
X-Inumbo-ID: c3c88916-3108-11ee-b25e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0zPL0yEK4l8cgjLTQPuk4pjf15gYTy5TbwXnN6F/gCxAdhtWOPuqnLjDeeDeoPsucIsaOkOU4yLpH8t/moUotEbl35FsQYUXGpYSEIwx0HcE+7n7VtfLrW1DhU56rWIJ1A8M8uvZdhAEkjqLVrtmg1wQwcHKfJtBMiQ9mDZN8YLiGirCf73MFUSFeMaU/mDUbTxrkrXq8dfYcGLfjdlqdGXgszEtzqSw9XFq3nsj8YfMW4Sr+XbX2NckI1rS1+JaZjGPS1Nrac/rqbk/xj/ctCsgLTX+FShtGfvsfpIsUXxeyODSNW9NvYOyLaUEvL9zSyD1Fd+lDtbqLSFIjR64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s7bvAesuRkdCPN/OC5YevGNnXHQrUja18fb/4dflmA=;
 b=FNFWm3tGa+78Z9xxF2YxFGAniUXeSPIfCfnVcjNgtTcCzxJy1Kc6eFE9Z1e+00bjisR/zF2tbEgv4sNckDSYTCh7H5zPtg4HL5c6Za+GcJYO4CtyMGix4QFMKAI5kx4JOFj0vQvCpc62qC1I9Wo9N4Fnfq3zrUyMA3SVipuMMTdOjHZU/uFOMifGsD2HjMBaRJzfNLhkIhR2eojXvsSjuem7qt+Nu98oUpZRRRTORzibfDj81cETRIHavXfUju1/+Fyv4AlOsYqxEmHJZlE5AaK1bx+LAEyhwpqNMnYHb5ynI7jxVy5gexemJb8XtppmQmasI4Sjsbpk6JOr4eSWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s7bvAesuRkdCPN/OC5YevGNnXHQrUja18fb/4dflmA=;
 b=oQuPiYvki1z+gQ8rtBv60E7cKtTqWdnCV0zP1X6lt8uHlydu4CXncuetO5fGNT+7inqQJukqcdvhSrk362BEGSAcQB9Zadj78UyM2ya/brNUbCFcFtKz0jM/0WzCY6wfKYXaqn9ZGwiNA0N4MZKGcdHvj/QfNj+6An9TVGwvP+gCYr1PfmHaIelLGTz66pj7sl13F1eEUsor/83ICGG60Tlrsin8PuQ7s7y7a4Nc6TW9jBXr8zNjPGHfb3GfT0BWow0JBiEokvZJWvJAEhxYnInOHs5j8+DH8YFXDAaHH/2WUYJRbo6aNYtDFkIaWnqJ98LVcEgbjgO260FYuPc3TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa9799bf-1a74-48a8-f4f4-3d2c563f0b13@suse.com>
Date: Wed, 2 Aug 2023 09:46:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org, xen-devel@dornerworks.com
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801202006.20322-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 9823530b-271e-4e24-88aa-08db932ca58c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/NKRCnT7KmyRL5xCPQs+f6zA4a/XS6dBaJ4xwpjDNJP4cxVhSVrJkPWJJajX/7wVvXhwNLIDJlmjRi+Xuu9bTW1OmRsJ5aLZP/3FQ+TbcCwE6IlvnUo9wqzKO1obodSe73nuc0Im6AO7ibvluzHW3qaPK5fXRzlv9WdAcFqR17X+L302XSbbe4QwEEeY+3L5o7ghOH7p7UU+c1WdRI2RxWFXjkW8l5j5cX9jXjy2ZImoEf0Fm181nHOfWD8Y7mgz10TOHWStUiacoQuEgp5xchA0OYGS+6GTMkomAZy0DkDmKWcO9v/lpV/IxrpA602nuhvkADPhg4JlvMuOBBXgCM5klIXXp090/RvRx32X45Q60GwPNG3ldYHkfhya9QbT2XDUlYtJwzWrczBGt8bHtsamGLRPs1QYFLYh85A78BoyhjT19qKjMptA87wSxhFIWnSL0ghRU6ErN3WuP9YxEraIvUAAf+BAFncGxNTzfq432hd+0/mMUc5JiJhZVw3T+IUbnO2him0IC96YOJ1qDEW721PXu4lonROP/X7/7CbeBlHRVZ0JbD/0kMwfmDKPnwjTNyjiElNVquP7eZY/alSztHkqi4LvuOIgH1GNlPEUvSL2FawL/FAa90VsJyfwR//Eih7wCmLX9+swRsY+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39850400004)(346002)(366004)(451199021)(2616005)(186003)(6506007)(53546011)(26005)(4744005)(316002)(66946007)(2906002)(66476007)(5660300002)(6916009)(4326008)(7416002)(41300700001)(8676002)(8936002)(6666004)(6486002)(6512007)(478600001)(54906003)(38100700002)(66556008)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHRrNzFuZ0hqc24wV1h0cDNaSDFGOUphWFdqMzNocjVaRnNCbkQybVNoU0VT?=
 =?utf-8?B?VVhKTkRTZXZqcTVvdjgyZFRvYUxGaS9MTUFNL0VwVmp4eVVrZXRNWTliSEc4?=
 =?utf-8?B?OU1EM2cxZzNZWGZPZ3A1Sks3Qm51NVRaL1lGc1pNd3kwNmFRWjR5VlBBNGhE?=
 =?utf-8?B?K0UzYmhJenhhL1VlSjMxUXJ0MzMyL0JNTDluN3R4K0gxd1hRZENwNlcyajlM?=
 =?utf-8?B?QUNIOG1zRW5sNHBaVkNJUmFPSUExRkU5bG80dkQ2eTBydXhWdUJwRnFIcS9P?=
 =?utf-8?B?TDhBcS9ldGF2bG1WUXMwTVFYckFVdVNlMUltWTBROVQrMGdSZWpZUk9iR0Vj?=
 =?utf-8?B?anpOUmxxYjVvL0RJOTBrNHFhY1VCeGVuMTFZQWpEMmNFcnM4ZUkveFVrSXVH?=
 =?utf-8?B?TVc0dEh2cXZZeHpoaHNqZFpFbEFCMFZEOUNpOE5GZjg4Z1BpVk5BamVqKytN?=
 =?utf-8?B?NiswSzVpSnJKZWYwZGRwc0svMXdwdEtSYXRDYjhCQWtRZUQ0NUVRc1AwMk1q?=
 =?utf-8?B?RThGVDNCK2VPYnBDSDduMER3QThqd1h0WlE2SForaytLazVlMzVMdGQ4U0Z6?=
 =?utf-8?B?QUljcEpnYjBIcjYrN3YvTWxGTHZOWG5kSVkzSVVvdWxYUVJMb25BNmpUclJU?=
 =?utf-8?B?NHpHVDZiZFNUUkozYkludm94N0tjcEtNYk5DZzhRMUYzS25saXY2c1YwN2lU?=
 =?utf-8?B?UWdMcldJdXhiQVFLNmg1cjZzS254a2xVRmI2YlVMb05oeTBBd1dTWHVEeW52?=
 =?utf-8?B?Y2xrQVUrRTZIUjk3cThxTjVKeWRXWkJIN1c5MnF0cmN5NitaVXRiSVdsNDlh?=
 =?utf-8?B?NFpCUXVVaDR4K1pYaVhPUWxQb1daTWVHdnhIZ1hEUDJMTHFEZTFwL0E1RkRZ?=
 =?utf-8?B?S2NLY0JWSnd1Q3JDblhkUTVwWFRHOEhJOS8zUHZYMDYwVXFaUVNpT3cwMzFN?=
 =?utf-8?B?d1psQUdsQW1rNXJlMEZOQVRCSmdMSzF4MXdNKzNOZWhKSWJjT1FHekh4S3pl?=
 =?utf-8?B?NDhYKzBCOVYvdDhoQUEvdUlRYkd6OFlHT2I3aElYUXhTSHQweXY2VzJNTFR1?=
 =?utf-8?B?eU9UMTdWNnRBdlg3ekFYUkZoeFo2NzRFcDhiMkVBaGRDYXVSSE0yZEZzenA1?=
 =?utf-8?B?RE14RVUwVXMwcUd3enB4THY0eWVUaEJYTzlJRVZBZnpzV0JJeC9NenE1UU5I?=
 =?utf-8?B?cWRkTmhiWGI0c29Xd1dBZFFwYmwwVjRSZWVkNG14L3pDdGxNM2dDKzBjUmRX?=
 =?utf-8?B?VWJqNFhRUlFZRDZUd2tIT3ZJNXJoM1NnNnQwL1VQUnlNS2ZmT0VBZGxncy9D?=
 =?utf-8?B?aFFaOWZ1WXZZYlBTMG1MTWUxVkdiVTkzZlUwQi9CckpCVG1ZYVhoL3lNL3g1?=
 =?utf-8?B?UWZ1UUJNRHJJM2h5SDdaWlFTUFg5aEVFa01aNTNLeWlnaHNMY1J4TXJJRjlX?=
 =?utf-8?B?eGhkcnQwVnJ3N0dEa0RDVWV4cTJ1U2JjeFlqSTAxUU5tNkhnWjBBbTdLY213?=
 =?utf-8?B?M1Qvd0MvajQ4WjQ3dlRzT1Z5bWVZc3RvSmZuMkJRTldXQlZuZmlWcVB4UlpJ?=
 =?utf-8?B?SkM0UUVMUGVRVUdVVTJqSnhMUFN6M2lCK3BaTmNDYW9ndDdhN1ZIZXNlQlpG?=
 =?utf-8?B?Z2xBNm50N1ppaytLSXFvMytRaFNhOUxEY2oxcmtlOWdFOXY3UXAxb0YwZ2ZL?=
 =?utf-8?B?WGhDMXNkRC9WS3lhSGZiTVg1YjQ0by9tU1I4cEpWc0NOaDdoQ1QvdDRNNzBt?=
 =?utf-8?B?OGFwQ3VEY0IyRXdsaUdraC9SeG54K0dBMGIyVVc4djRwd2FldFFPRklHRzVV?=
 =?utf-8?B?Y01haVgyeXFXbDBZT3R3b1IwdzY2WSt3NnJVa2haQVNCWGJOek1NODhCbTg3?=
 =?utf-8?B?M1duYU1Ib2JKdlAxWXlzdGp0YnY4ajlwQkRxam5XY3dSWCtzNjRwQXRLU1g3?=
 =?utf-8?B?algxNHZIMFNVQnAvOEhrMmI1aURMMVlTVnpXRkNTUStPYno1R1U2UFdGSWZp?=
 =?utf-8?B?cjVCb041em9QZ0szNU5zSmNrdlI0dFRWVTY4ZFdHTkQvWC93R1JaQU1WNWZw?=
 =?utf-8?B?a20wSHlqd0FJSFVhN3Q3bDB6ZEs3dldHdmw5bDNDaTlXYlB2enV5QUIzdi9I?=
 =?utf-8?Q?ChWJHXHwex9wWrgmSjxGpT0YU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9823530b-271e-4e24-88aa-08db932ca58c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:46:56.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShRE0KPKVAkn8/k9JjdLfGC83Smt7YmJrE+8oFpYMkZNLepWIXDsofQUMSyKvGL8Yr0ylRmoC5hBu0Nt+B0nIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6831

On 01.08.2023 22:20, Daniel P. Smith wrote:
> A legacy concept is that the initial domain will have a domain id of zero. As a
> result there are places where a check that a domain is the inital domain is
> determined by an explicit check that the domid is zero.

It might help if you at least outlined here why/how this is going to
change.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>  void watchdog_domain_init(struct domain *d);
>  void watchdog_domain_destroy(struct domain *d);
>  
> +static always_inline bool is_initial_domain(const struct domain *d)
> +{
> +    static int init_domain_id = 0;

This may then also help with the question on why you use a static
variable here. (In any event the type of this variable wants to
be correct; plain int isn't appropriate ...

> +    return d->domain_id == init_domain_id;

... for this comparison.)

Jan

