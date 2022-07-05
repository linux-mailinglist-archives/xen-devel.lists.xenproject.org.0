Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C1567253
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361415.590921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kIw-0000Q2-3d; Tue, 05 Jul 2022 15:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361415.590921; Tue, 05 Jul 2022 15:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kIw-0000OH-0p; Tue, 05 Jul 2022 15:17:34 +0000
Received: by outflank-mailman (input) for mailman id 361415;
 Tue, 05 Jul 2022 15:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8kIu-0000OB-Db
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:17:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130071.outbound.protection.outlook.com [40.107.13.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96aee83e-fc75-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 17:17:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4145.eurprd04.prod.outlook.com (2603:10a6:208:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 15:17:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:17:29 +0000
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
X-Inumbo-ID: 96aee83e-fc75-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dODqLNb418uyHRTES+tBzVqPzp20y8uVZnoJsPJlNblPV2FMfV9XRySEUmpt1XvhVnmeO20puU5pHqasHaFHOoMUCJJT0IiOySfmCRfGDYh7aMtycetCQb7yGj6hd62Cyoj1oEu/5BzrV1qUjgcWX42iuMqytSQvRYj1ugb/SSPcatthWBC6+JDB5g2lznRIas2StBItBzY8pVJ5Mh+lL8XezUQMTqiPl/m50faUnPAIj6OtRM6eLwQ3V5rX9OGRaDTMzyFp5PbTL4+D3NIt04w4foHmNT3qiypkNzzAuXAwjXdIGSZ3xFiU8+dPe6eJ2ZU4PJFe/oQrnMI0e9VU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usbEfZzNOLvr7RyaAHO1ybkqAzyYaYrE75GvVWP5K2A=;
 b=aD0ZIuJ7d0CNxQ4af2UcOdYUGeEmxgB61dtQr4dd6Mis+/ig1Ut9kTzkEXns7uNkxLMPRo3+8KOm8hiplZvB5Uug7vi/UrDsYF7iTtFSxiOI98vrkQn79srU4j/eCNDpssPXfvBhSMlQwAJzhEHAi1QiVy5UY05N0c8iNb6Am2Fc5ayfrg1aiN9g6CZqT7j8E02RArhrxDzwd2BL9LkKLppVCD13K6jYxQXGDe7SYCjARy9ztOkGpVHvCHAd8G98dsOJyCCcIiqY1EpsrReBQ6/7KrJDiXo36ni0svCWJYyL77BpCHFlN5J2JHyHtl4wsZeKyONnGefyGYuuq9Yo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usbEfZzNOLvr7RyaAHO1ybkqAzyYaYrE75GvVWP5K2A=;
 b=qkbanPS3V94J+UBjcTDz3LJgDwjwM0ZWzHjKnwDlWtOkxEObiBtaR5sfx3k3VxJtaPllU5UsmsTK5Hhgxhc4RsgnYG9Hi7xArd8ICnxRU57Qk5UklOCY7Bli7Jl5ucbWJH9bajpm8ClqATiyf8q7o3qO9dZHfPv8+Z/XsG/BnpM8psf/wlrwYa1a2N0taO1bAP5quqKMtbMXkt+CTG6V3vxgq8CcthGTpaIwD/1aqCH2vrMpC/7Rs1AWyLXj67jHcFg8MYM31EawOWzo7MHp+OSXp39syKIHjS7nRKqtoCQTyA3D6NUgjY53t5zoE5DJyH+VOKgOh6BCbuTnWKBdgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <377801cf-1948-eeda-feb9-b9996bba5d47@suse.com>
Date: Tue, 5 Jul 2022 17:17:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0061.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::38) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 384b4f04-a870-450a-673e-08da5e9979ef
X-MS-TrafficTypeDiagnostic: AM0PR04MB4145:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gIjrIWc9L/HRCbdGZDoJVhxfO+Es0VIYAxxrOCCKMHVFtgk3yFqagfw1ngE3t1pRHLzEZ5BlbRX8m+HZrkx7ctnB3d4JQlpAMuvucPJxTshlBYE0tg5ax4AWXWMUCGqTw1/toRFHD9Q4Jau0ko6AKW5ODZ21MdO2bs6yb2GrJN58PomI+6GKJzDLwR9iGx5NXOa1JynqCNNdO2Zn5ar/HXzs+VGArHqstl/TH1/sYsy+9MPjoGMNfQuXYjPtoQTCmWaPBvdmN6HpSnfqxBKUY0e6actgTgfiaMq7qb3eIvWQPtpj6hV1Pts/r5obqox1ghIrkQrtglKaubGozVHJ18nHfG+jAVTmcXR7Cl+mAbroSJaU6/hq3q4hLsZzuzf83+cmFtOR6/Y7ULgQUzyYqHGmMBRKSEXKxblKFEHA7et6whjev0MJvl4z6Y7IBJAtd5LCfjb1yHVbHLePvCWNxESALUQP3a38Ek5FaFe63mC9Ril8EvBRY9t+iSe7rR8UlzK+u9MHpxFC6aL9RVFH/A5Ja5IW9h4c4V7iON9fVAmQsYK0q6t5oTWMvGp4bztC7jQsVFSXtmh3+nR4/8BkN1KKt21Qy2fBBqrQ9uT/4Xoz8dTefOfU/731b4F/WJG0RwalOL7BrYVdFrqB09Q0GFp702Njgx9m0KUk+PxVARUoFgWp7DHhbZudbnvhRvRnAA/r+gUmgYGdSxq/SwZ8lcGdYFmjttMssolf0AAkIeYt0TJSw569453Y/I7by4zf9X/ZLIh4mxEHwh75M5IUjoBaQwPSN4LtWsXvKLLKBiF3K/voAfZFKpXUg02sBUjSGBBmHvOnDUud1fsBabkzGSVym1FL97FMG5Cb6zPgDjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(366004)(39860400002)(136003)(186003)(83380400001)(86362001)(31696002)(38100700002)(41300700001)(53546011)(6506007)(316002)(66946007)(26005)(4744005)(478600001)(6486002)(54906003)(2906002)(66476007)(8676002)(2616005)(4326008)(36756003)(5660300002)(6512007)(6916009)(31686004)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkJ1Zi9NZmNRK2tTbG1yOXcrT0V1RTdyQ1hTTGVudmdKUlZPY1ROcWl4WWk2?=
 =?utf-8?B?S3NLa05XOU4rK3BJK3plcVprbVBNYloyVnMwUnpZREpkdmN3ZVNDakI5TEZT?=
 =?utf-8?B?RXM0Q0lCWDRRc1IwSHd0NVhiemxpeFVzckRieml3ZEZmK1ZHL3NtSUZTemtL?=
 =?utf-8?B?dWZleWhrS0ZEQW1uV1ZwaWFXYTl6MS9ieExLb253d09SOGFYQ1FnbDgraSs0?=
 =?utf-8?B?WXZGNi9mNmJPdXRVSEhzMEtnYlFNazA4bitDV2hYczl5S1N6Q1E1Y1YzM1ZU?=
 =?utf-8?B?cjF1QWd4eFZ0WXd0ZHJldVczNnh6amluQ3RjYk5ta3QxOTNOTERDdWVWc3hl?=
 =?utf-8?B?MlhHa1YyOU9oLy9EaGJXejg5Q0JVcWoxa1RGT2Q3K3JlQXIxTnE0cmQzQm5C?=
 =?utf-8?B?ZVdoWVpNelB0THdPQ0ZXZDZNU2p4T2JwMVdWeDJyZFhnSTlBKzVYakVMR3c2?=
 =?utf-8?B?ckk0T2dXQ2lYdWc2K29LMTJVZXZZUVBWcER3SGovamdnemVaMmJNUDlsa0M5?=
 =?utf-8?B?MlpBRUd5d1Q3NXJsMjBZam1jT1Z4YWNDbUxqL1o4d0xWYUl1cC9kOUlxWExX?=
 =?utf-8?B?RUMySC9ldmZ3blhnbDNYVHRJVzlIOXp2eWc5K2d1bmRZckdiV3BTbXhERFlQ?=
 =?utf-8?B?TS9KdE1yeUprM1JEY3hDNTFvQ1JLU2ZlMmdpdndxNG1uMHVoaWFmTkMwV2JO?=
 =?utf-8?B?OE5SWnU2TXRtN0ZXY3lNRWUxZytCZE91MmxHWGFseXZ3MHJqZUxlWW1YSi8z?=
 =?utf-8?B?bHhZRXo1SXF4b1lLMlE3TDlFa2ZIcWtBcjJYdEJOOHZnNVlrS0ErU2hqdHF0?=
 =?utf-8?B?SWc3Ym5pOE1OR2N4UTczR3ArdVMvbGhSQjFhODNQcjlMWSs5ZExkeWk5Rk52?=
 =?utf-8?B?SkN5M2FxODB6ZlZFdE9KQ3FVRE5HbnN2K2hIRDZMa3dSK2dVRVZDWlJrMEpX?=
 =?utf-8?B?MFBSdEZrMEwweFR4Sm1rZlNsK0RYbFBVaTNZOTE4dEJLTGt5aXV2QzZFS01J?=
 =?utf-8?B?NWFOcWhyUGlTb2l6YVBINmdZUitSQlhKVENGNmFvKzlKL0oyNXVMMTk2ZWty?=
 =?utf-8?B?di8vdjRDelZrV1hJTSszdVRBamVpL0xVdFpkdkkwUURBTHMrQld3bnFxaTFV?=
 =?utf-8?B?cHo5dTRPY01JN2JGdUdBNlZkU0RGalk1b2FYOUE1UkRVU0hMd0RhZGVTMnpw?=
 =?utf-8?B?YVQrVUlzeTQ2MG1ML1RNRVZpRzlzRzMvUlNIT3dnK0pPOStTamlQREVvLzdU?=
 =?utf-8?B?dmRzekhYTGFndHVTNWlpOVF2WHRYeStSMENZbFhHdmphamxoVXRLVktMZUFN?=
 =?utf-8?B?VEczWCtTQVBOZU9VVzdqNHVveFIwelpuL2pUak9KdlZYM0x1U3dWcFJiWkhD?=
 =?utf-8?B?WTd4MUpiWUU4TTRTc1J0Z1E5M3RsTFBTQS9EV2NOdGUrK0RrbWJ1R21SNThR?=
 =?utf-8?B?V0VQSmhyQXVJTS9SQWtoSUpFTzJ0dHNzek85L09VOXBMR1JDOXNXaGNUeU1O?=
 =?utf-8?B?aW5sQzB0YmJ3a3Yxa1VuSzVpdGltR3R0ejBtQ3V1REJUQW1xRkkxR2VRd05W?=
 =?utf-8?B?M0g0VE9xaVBkRXdJamZ3TFoyS1ZOWHZTQzVZOU1OaFMxdnJVQ2xKVExBQXlo?=
 =?utf-8?B?azZ5TmZyU0FZbk9oSk9WaWZIUVk5MFNRbXpRRUNJWDVGcEwvUVhBRkNQWEJv?=
 =?utf-8?B?eG1WdmJqcW1xTWtHU0tFQ2NiY1BKVEtQL2V4ckVXb0VUemM4bU9GaExmN2lY?=
 =?utf-8?B?UlF2RS9zMU1HYTMzVXZ0SkhkWU1iaHZRenh2Q2gvS2phdU0wM3NtUytuWmlX?=
 =?utf-8?B?SnVMcDJ4NGZjNEsvcml4a2RobkFrNVJENE5IbnFNeEZwSTE0blpRd095eDFx?=
 =?utf-8?B?VVdYR1UxWHVDUjNTVzFWK2VkYXl0Tjl5Y2ttaEVydjJNNkNpaEtXSm1WVklO?=
 =?utf-8?B?WnluZ0lxQ3kvWDNVTU1WVmswV3ZBblErbFBQYjlzRUQycVMrRVZ2RllPRVFs?=
 =?utf-8?B?U1RRUy9PMTA5NmlPeFNSaThIRGErdDEyR3dQRjNoNXcydnlFZEJwTjd3RGVv?=
 =?utf-8?B?c1VTYlZrVHk2bkNXbHhyeTVza2ZEdUpvV1NBQlhBeSt4U2RnNlpRY1lsQmNv?=
 =?utf-8?Q?V905q4rtNr3F3e2AINkavZcko?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384b4f04-a870-450a-673e-08da5e9979ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:17:29.6023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjEkP4BbZylvFVWSkirt3QmTa2kRRDfP7I3HpvaXt+wGABdmLrr+hQRLLnJa0mBTvS1Su4fjm3z21f9wt0yfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4145

On 22.06.2022 16:38, Rahul Singh wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -119,6 +119,7 @@ struct evtchn
>      unsigned char priority;        /* FIFO event channels only. */
>      unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
>      uint32_t fifo_lastq;           /* Data for identifying last queue. */
> +    bool is_static;                /* Static event channels. */
>  
>  #ifdef CONFIG_XSM
>      union {

_If_ this is the behavior we want in the first place (which I'm
unconvinced of, seeing your discussion with Julien), then please
be conservative with growing the structure. There are available
(padding) bits, so you should first try to use any of those. If
that's impossible (or undesirable), please at least briefly say
why in the description.

Jan

