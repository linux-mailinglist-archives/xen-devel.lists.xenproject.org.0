Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938C4F95A4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301500.514543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncng4-0002ud-6Q; Fri, 08 Apr 2022 12:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301500.514543; Fri, 08 Apr 2022 12:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncng4-0002sQ-3E; Fri, 08 Apr 2022 12:25:24 +0000
Received: by outflank-mailman (input) for mailman id 301500;
 Fri, 08 Apr 2022 12:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncng2-0002sK-8Y
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:25:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4dcd3b8-b736-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 14:25:20 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-p4ZjR1-YPfuizrTu6gUkmg-2; Fri, 08 Apr 2022 14:25:18 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by VI1PR04MB5120.eurprd04.prod.outlook.com (2603:10a6:803:62::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 12:25:14 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 12:25:14 +0000
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
X-Inumbo-ID: f4dcd3b8-b736-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649420720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+aBgUDsMue/9QuwXh0YTmAd1VbyoxChf6uGobDPAO8=;
	b=DGlTbvYK7MNR9w5mCrY6+lYYGmGzY3nhU0Pn2arhT9ImdePitQh0izv3sPWN8AbC8WvDrv
	fLRKeXRjyrg+SmeFG1jkeG8qFdDii9FfnT7s4O3DahGeVjmSWwDuXt5664WpnjqvujoszF
	yqGp8cAXSnaixOYAW1cDQgiKTH+1Ye4=
X-MC-Unique: p4ZjR1-YPfuizrTu6gUkmg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIqpgUPYDF6UNqgE745Wl4O/aHqg4RFoD8eO6NHTnDii7HUtr1VY4mM/p6hEeuSV16QpYPwjcuyEfscONqiLRMcg+oISC0yYzmsWWC+5k+u4mrMOt0ibEY94LYocYkiffTMBBkfwN1q7lnZajXQlwNOH1y/SZUWsNI+Eun2PQs9kOuj729QLeOBqlHjeDWPr2awzLxcIGD9cq6T+cTqgMq0MuhDS45q1I5Zv71ls8uULwmvhI6ooPY21Ti27gh5CUp5cujjVWISfMsN8sIsPbUp8JQ0BmMi9J09ldPSEL0W6KdHSXRl/fFSLTAcxgs9RMaWbVjaJRtced58jV4Q0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+aBgUDsMue/9QuwXh0YTmAd1VbyoxChf6uGobDPAO8=;
 b=oboNyuHI+4cHLD5MAvI2fDyvxDjJ2tZ9o++XKMjnn7pJjaPFz1scWTeQiKOKb10VfHhAvCF1v+OLiIaKlymCT/FLzeG21NrCm4LsrtIu9cIbctEPqNnjnN8AeVfvwjIaBu+Ph5HApZmsVy6mH6pvfj5Isihz/9ISg6/tBJ9euY+XCTuqyPpbnYAVOvBu+RiYTzwlCLWtAsOo9bGGdUjmVX9tXRmUc+bc5veyTSPHDQgJt3ssXhfjvXkQIG0mutSkU7h+KnJL9alFG+SGwNKX19hsTVfsMWBcAYi7G2BWNoD1CLihAn3bi3awuoMUYl5CQxOOF6EsLveCAggcLszLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3217803e-16d5-6e2a-bde7-ff9a1237dd39@suse.com>
Date: Fri, 8 Apr 2022 14:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
 <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0187.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::21) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ee6404f-60cf-45d1-6176-08da195ad516
X-MS-TrafficTypeDiagnostic: VI1PR04MB5120:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB512056AC83C26DD7E736A447B3E99@VI1PR04MB5120.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GYmZdRhz9WM0t1rz4vR0BXGW89LXz488f3xmMwKpNwoxtVXD1YEmo/avB0/R5BQaYFIzS+B9EDBBqj0DHqDwhtOKZIbL71TDnPAaq2HFE6WY5tGKFKAvdXpU7Ljw06l1UubS8/AwOVu2ztwOP1JpbNJ6fLKy318u0w1sRtnGAVJYVW/Ml5obizRaIoTthnFBDkh5AVDqaGcsKMUevtu5LZF+Bs2eST6fGlHEhkUxER0sLhChvgYzQP8kjnihF7wgkc71fBpM2DvtbbjO2nJKtnDl7XDyxbLgkQKB5vr1Y37xXHP85BP1ECsCLLZ2eBB4xYTyhmoiefrz4Jus+9Iz9GAnpvUeOYuKO1yj2ploHPwYvfYkPix86ItrUkOmqaqDC9DGjTk8HXFLt/GsGmIMNI2EHj/QOJp2T2VIicAV8t0+6uC44af3n+Fnw7HOdTJylf1aAT1Pg2wrrOBcwhEclocItfPdbvGpoMfZKsaYb+/Ex8VJz0TLDRQm5yfAs2LvaTuSQFiwYD7YSrk1/sNO+X7F2aXrN5dWtRA6wJ/SdTgHAMc5zJG5Au1HtlOYginXMyFbfeldhD0H2rqE4dR3avPW1NByRMMSAw/r0Ox3CAYmf17W4GJL3gG94/LQLS2ES0pZaOPOO2CIzn4BlmqBmz/tTpOQIZkqlh7hC86Xk1Htm3R1VQj6TJ6ekxIzgrO++uzb12HFROlLTYZ4NUYtnFdDSn6HLLFtxxGG42RaMTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(8936002)(83380400001)(31686004)(86362001)(8676002)(53546011)(66946007)(6506007)(66556008)(4326008)(186003)(26005)(6512007)(36756003)(316002)(2616005)(66476007)(508600001)(38100700002)(31696002)(5660300002)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzcvZU4wajVoaG5CRStOQ21TUSt6S0dFOG40UnBYNTVJSGQrMEZDVGYvalZW?=
 =?utf-8?B?ekx4a2sxQlczbDdZOTUxZkIvRE8weHpGcDNxVDdNVDg3Ulg1anJvOWkvQ2NN?=
 =?utf-8?B?OFowVHEyUklSWXVaS2JKSUlwbXZxOTBPREJUZUpEbVFTZ3hJRklYellFUjRv?=
 =?utf-8?B?enVsaWludkhrTGxDdkJIbXlzRlNTNDFqTURxTE5DTlVzcGMyTWthY2prdXpX?=
 =?utf-8?B?b0twRkFzeGVES3JTVVo2U3hEYlZvbk1BS3lVQVBWWFRWa2Rsb01HYXNCczNy?=
 =?utf-8?B?QUlTM0pFbzA4TFF1cU5EMXYyM2trYnlXVmMzVnFmSzJVcUN5c2gwU0R3VG9T?=
 =?utf-8?B?MmFDd0F3SWVjelI1Qy9tQlR5Tkl0akZlYW5jM0YrRStUc1RrQWdYOHZZbytF?=
 =?utf-8?B?ekd0aUNraHFPTkFKSWVFWC9pSzcxODU2Y3IycHpZOUU0bW5GZUYvTmlVNk5Y?=
 =?utf-8?B?MnRoSmZBc29PTDFMNjE2VWo3cTlDcVFZSGVoUVZuViszKzNjdkdJZFEzcmR0?=
 =?utf-8?B?NEFmS1hzYkRqbWpkWlM5RU1lUm93MXExRkFJVlVsd3hnVURXWDhlUTNKUnVr?=
 =?utf-8?B?anNBcTZJOEE0anNUSitFcHBqWmdsWE11QStVZ1ZMS21zTGZIUTNXK2wxUlZo?=
 =?utf-8?B?aTI0NkF5VGJSYmR4UEQwL2xBdCtCZUlGKzkzYVZXT01CLysrVkZiNDgzcG9m?=
 =?utf-8?B?QjhqZjVxVDBTcGNyblFYSGxqSXYwS0hzT3dZUlc3dEpZRmtZeEpyTjl4cUJa?=
 =?utf-8?B?czNOMDVGYzRMdEpFdHM1eFRKWkJEdm1QOVQ4WDc2TCtCVjdmYmZJTVZNUU8z?=
 =?utf-8?B?OHIwaDBrTXpjZWZISVMvcUd2aW9wRWlUYkZ2UUFWb2RjRkZISkRDOFNacVBU?=
 =?utf-8?B?V2trdUNxN3ZnU3J5VFVPNUNBaTR2SUJPampjbEkvWUxWSVYySTdjUlhmWTM4?=
 =?utf-8?B?NUdxMit3NkVVTW9ZTEEwa28wZDRKQ3QrcXZiUjNjQm52UXkvM3JIcEtLekda?=
 =?utf-8?B?QlErckp5UnJSakN1d3QwZHh4ZTRLdXFtZm05MkNFTEVBMEFIWDlsTkZocDR0?=
 =?utf-8?B?bUdlMVI0QURhN0Vza3pDTjkvamZYaVBMMWZLTlRlb2NpQkt0T29vR29waGZK?=
 =?utf-8?B?VDVVM0JsVC9jdjdxcHR2cTFFdzFJcC9UV0JTaURpN0FtTW9IMkNHWTNnbm1N?=
 =?utf-8?B?RkVwSjZRb2NPU1dCRkZ2RDR6RGh5ekdRTzJFbTl2WjRhZW1walUwbHdoSFJI?=
 =?utf-8?B?KzNCVHg2Y1M3anlCM0srR2xWUzk0Z0NDZFJjajRSNlMwaHd5UjV0Z014UlhB?=
 =?utf-8?B?NlNjZGNoRnExVGkwUHkreWkyMHBQV0hyWFYrRm40aFowMmxkTGZKWkFUenRl?=
 =?utf-8?B?RVMwMFBYY0h5RnFoRFFBTU5Jb1d3bEJiZEQ3cWlwbGo5dysrSmVBRGNoNGha?=
 =?utf-8?B?V0R2SlQyUVloQ2ZxVFZyQnRhakszTEJWMnAyeVhwUkp6dXJ3Y09oS1lSdVda?=
 =?utf-8?B?Wi9EUWJJd0NrVDlWUkRkbUFHamFYTmorMXVMSm1KWVh5dEptRFNlYUE4U1I1?=
 =?utf-8?B?NU9xQTAzNlgrZU94S3Y4U3VhQjZtQ3Q1QmYyZEltSnFONXQ3SmhwUjlqRk9U?=
 =?utf-8?B?M2U5OVhvcERRL2VqSi9FbXBWTlQ2alhDTXN0YjIvOU4vVDNkTmppZ1NKMmtM?=
 =?utf-8?B?QW9OaGc2VHBBQ3hTTFRLTzhWVHY1M2w3NkFrZ1RrTklkcEd2QktCZWZBaVll?=
 =?utf-8?B?YmE2M3Ivbk1yc2hLTGhvTGwxc2c5dGRaVERSOHM0OE1STEZBM2RYaFY0MWJX?=
 =?utf-8?B?Qkpiek9LUk00d05uL3U4ZVJlS3hwM2JscElzOXVja3hrZmtzbWJBMmxtYjVa?=
 =?utf-8?B?cFFxYnJqM093eGFlUFdUZW14MUFVaTErcmJJTWI3TmMwWjRjaEhTNU1Md3VT?=
 =?utf-8?B?UHBkUVBIVFE0K2lTSnYxYWZsLzdjbGtvek1Cc1NZYlpGNjZpNGFFNGNmQlE2?=
 =?utf-8?B?Qkw5ekw0TkFqeHNXY0FKS2NSd01Yc1c0a243bEdwR1BpTTBlNnA0a3ZaakZr?=
 =?utf-8?B?MnFJWUF6NmFFVUMxNk5kTVR4VDlmTTk2c3Z5MWhMbnlKSVAxTzV4UTdBUHdi?=
 =?utf-8?B?QUJ3ZUVYSFdYTUNzU1RNQU00Y3hVbW1URGl6a0E1bjVMeDBWMk5qanZ2aWly?=
 =?utf-8?B?VENjeDYvZzd4MDcwbUZwYnZnZlFJdEJMOVlWdUlHK0d1UVY0NldoMVg1OUZD?=
 =?utf-8?B?SUVlUFNhOEhLY1lqRW0yNHZtbk1ScEFQU1hHRitEQmRCS3dBMndPNjl3S2o4?=
 =?utf-8?B?UDFxK3lGSS9wU0ozMjNCcEdtcFJDdE8vOER3bUUrdk80cWdBOG1Cdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee6404f-60cf-45d1-6176-08da195ad516
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:25:14.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rQzEK5vL2x9fKJuSaH9Rxvwyj4Johvu5TyLjRxrYHRV6d0Pf3TXOHAwSfW2OMb527eb5WMGvflkm6OuSzF95g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5120

On 08.04.2022 13:02, Julien Grall wrote:
> On 08/04/2022 08:16, Jan Beulich wrote:
>> See the code comment. The higher the rate of vCPU-s migrating across
>> pCPU-s, the less useful this attempted optimization actually is. With
>> credit2 the migration rate looks to be unduly high even on mostly idle
>> systems, and hence on large systems lock contention here isn't very
>> difficult to observe.
> 
> "high" and "large" is quite vague. Do you have more details on where you 
> observed this issue and the improvement after this patch?

I have no data beyond the observation on the failed 4.12 osstest flights,
where I mentioned I would make such a patch and send out as RFC.

>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>       unsigned int port;
>>       struct evtchn *chn;
>>   
>> +    /*
>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>> +     * contention, check for an empty list prior to acquiring the lock. In the
>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>> +     * until the vCPU is migrated (again) to another pCPU.
>> +     */
> 
> AFAIU, the downside is another pCPU (and therefore vCPU) will get 
> disturbed by the interrupt.

But only rarely, i.e. in case a race would actually have occurred.

> Maybe we should revive "evtchn: convert 
> domain event lock to an r/w one"?

Not sure - the patch was rejected for there, overall, being too few
cases where read_lock() would suffice.

Jan


