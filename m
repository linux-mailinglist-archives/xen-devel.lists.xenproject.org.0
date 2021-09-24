Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CD41756D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 15:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195387.348062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTl8Y-0007FF-FX; Fri, 24 Sep 2021 13:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195387.348062; Fri, 24 Sep 2021 13:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTl8Y-0007Cw-CT; Fri, 24 Sep 2021 13:21:10 +0000
Received: by outflank-mailman (input) for mailman id 195387;
 Fri, 24 Sep 2021 13:21:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTl8W-0007Cq-KR
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 13:21:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46609bf0-1d3a-11ec-bad2-12813bfff9fa;
 Fri, 24 Sep 2021 13:21:07 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-FncHXj3yOk6ymIOP23IG3w-1; Fri, 24 Sep 2021 15:21:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 13:21:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 13:21:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Fri, 24 Sep 2021 13:21:04 +0000
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
X-Inumbo-ID: 46609bf0-1d3a-11ec-bad2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632489666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHgElt4qryXv37AnjsR2C/8raSqMWtIc6kDlGJKdS64=;
	b=YPelb7Hxv4vj1nMiHSowuO9ny0X5gWD1hHJkF7K1gartbOxO9hGBZkCkYnszzsYBueI53T
	nd0/0xRsawZplH6aadFcD2Z5oLWkpubrfUD9Z1VbkE6qT1YG5rIAgPIZu8TqziHxYVCrEx
	UCVRZuABHP8lGKenVIVWPMXJQVloLNE=
X-MC-Unique: FncHXj3yOk6ymIOP23IG3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKULslxvj4CBOp419bNWYTikUaUkY3MH5w8QOaKbikqEGHyM6SnwOeqHVOhw0+TqB4Ehcg35ZGo8WCNaNF9piPScW/cltxWaXX6QqlCxTTWdK7SIqBWsI3bpYZXsZ41+kAPeXcefpBVudZTFnu6KD1/j2J7QD+mEfvyMp2/vAYMUm5OTatVZk2bZoaCFM3M+aVKSyk44WtB0aVFjpEFZ54Z/NUr0g2T5uml0binvcnaK3spflwqe0s2/olYlTZxu8V74UIh/7IIQllHrQG9Z/wMR77ZDZlgwp2qEmZwzTMQtpsdM/07K8nbuRkyKK7xrm0Vw4HPseK93+w3h/306Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fHgElt4qryXv37AnjsR2C/8raSqMWtIc6kDlGJKdS64=;
 b=XfS1BC66p8onJc3u5+0JWaBSPzMwXK0RVukSuXoMT8KY4yDUTGQ57BIFvQU4TffSgBGKhLIRF6ri43x0vED/rjHX/V/oLRRf8jES0i2VZ4uRoPMEQPbZjsI8MYxAIg5XZFu+FAZSJxRBImE0r2bX4SSnAfC62GI9AlMsu/dNJjFFdtqQIhw1Ynt2n0E8ujpUNdscDN+yrW1QO3yTNZY5Kb+1gtYykQ8MFe0uL32C75D2Np2ZKn/DzKE8XpDaAg8WRw+3kgjqfsxkenSRMzOHQ4xO2J36Indtvu9J9rr+nGW1W6s+UMKjKmhLm54l1/P1q9qtP8axd4rbftGne3tm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2.1 13/12] xen/trace: Introduce new API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920192939.16483-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1eb8dc32-8e52-f165-b691-4b04de059318@suse.com>
Date: Fri, 24 Sep 2021 15:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920192939.16483-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bac5440b-55bc-45f7-968e-08d97f5e2921
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484654F89BDE2D0122B56317B3A49@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zNJbHSJfHrmBfPiJg2Qjv1YqXwZ7hfHc6eHv9M+zsZZ3Al6aaGYoipmfzW78SvxB+QK7lJ2BH2COUKPy8kqzJauueikQdqFQb2vBgkBQI0BIGmVA6PAon9sLRt0F5Nlr9mO52GSymrbI5zgPsdQT2ZOHFtcXGRe040Ah1/YE0RV6NOJ0C2sFSmDDbU+2LQiB7lAIxsjliumBxHoAAPXk0sn/3EyB9815qe/ZaiE8VEVzuUba+Tm8yES6moiByvhTa4mDzBBSeTYMi6hEOQgMUCxv4Q4pBIEDvjgMk6snksduFamNayxJzkVEixUN2RRVPH9V5mWd4EKh75QYeHdPbqlb5YcCjbYbJImLRcjToNcm1d0x3v/4xgIqT4leILpuqQFbVwLlwi69cJ4VwFUrC4sv3jjZW3DB2Au721V9tioN6VLoEXQHi/BlW7EZbSuKdWjs99T3imxIh9djTGmnWXOjZV2lAPCQ99isPvTP2qWd17cEyouZm6yaml3NpQrUYSY8xBR0b2Ots4OoqcdcUN6ZfhsSoymBDLbUixxPjChznaJsqlIMe1KiHAVl1JtZbLQQUTDrKwWY80vtoSUALm3azo9GMvDG59Z/gRKWv0b6ofyyeLTQtEY8QWaVeJwNCSr6Beg2gMR/eZwVl55zd71zlPzC7CbGNl/CoZTirdK4JJKFjn5v/XOjiRc0WmS7EV7qGN/dW2AEpwP8fOkvRsdzVOJ4uvsr/KXTRgjUha0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(956004)(2616005)(86362001)(54906003)(38100700002)(31686004)(2906002)(316002)(83380400001)(186003)(6486002)(53546011)(6666004)(36756003)(508600001)(26005)(66946007)(66556008)(31696002)(8936002)(5660300002)(8676002)(6916009)(16576012)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTR3aXc5bnNDSlZDMkxvQnVqZlp5anlPWmhoNXo0eFF5T1VUWk5HOUcyNElh?=
 =?utf-8?B?L29mdENJS0xCblFyTEV0T25pNFNXYnR2aytITzFCNEN5T2VzT1UrRDdQVzlw?=
 =?utf-8?B?UDN6Y1pNOCt6TEY3MEY3YXk4cUM5bXY3a3NHa3JWWVdKTTN5ME1EZFVKUVN4?=
 =?utf-8?B?UlRGSnJ2OTJkU0xmZmlqZG8zcXU4d3piam1PS2dncEM2b25ETjBacW02Rm82?=
 =?utf-8?B?SGgxSmNPM29KNksreWRNZDVaUk0zZDVPYnB3Rnk5UGxwZzhOdEI4dTVGK1Mz?=
 =?utf-8?B?N2g0WGZIbFBCSlAwbGNrc1FSdExNLzg3Q21ya3czNXBTM1plZ1lMNzR3OEo4?=
 =?utf-8?B?L0I3amF5TUtycy92clFJNkh6VjczRDFxWlduS0RXVzRoNk5CMUo2dU80UnQ3?=
 =?utf-8?B?VnBPNmtKeUhMUFhDMjZlYkFlK1Y4eFRIT2dQbnRBWTdpR3A3RWxoMTB5bGhS?=
 =?utf-8?B?VTJoOFVPbWQvc3ArdDAwdmV5ZkIyczFIM3ZWQVFzWUpBekFFRWEwOE55RWVB?=
 =?utf-8?B?aEt4TmQ3QnBTbS93V2FpWGNKVGtUQTBNYUkraVRTbkd4bVJqRlBHeG9QNlJD?=
 =?utf-8?B?c2d4dmVyV2lVRHRzNGpxK2xQWGlib2FzREV4eEZ0VEh0cE5MV2Z0RUh3WElC?=
 =?utf-8?B?Q1ZydHVmVEo2TDJNUHp2dkI1N0FTeWJWLzRYM21vTGU3SThkN2t5eHIxK3JN?=
 =?utf-8?B?NFM3ZjZieEt1T2JhU1JFNU4xZFVjenNKbXFNQlNZNE1RMnlqYjR2Y254Um00?=
 =?utf-8?B?Ym0rQnpIWHBUd1BORlNhSTNiaVlhT3lCSUFDTTVibTlaV3BBOHM1Yld1VVlQ?=
 =?utf-8?B?Qy83bmJFTklvbGpPN3JPdmdNcnFoT3p5N2VSRkhTM1I0R2hiNjRkVWZLNElF?=
 =?utf-8?B?TXVtRmZoR2hPRDg3ZHE4Qkx1Rmo3c1lZM1ZaR0d6YjNUd0VWWE1ZMHUvWkwz?=
 =?utf-8?B?aXhvZDAzRHpvRVJxUlA4VjBKbXJKa0thM2l4K0RFaDArRGFYMjBRZzhmUDNJ?=
 =?utf-8?B?RmpIazR3VmZDVG8rSFFlMHNXSlEvRW8zcnRtNG15QjRxNW5ZVHZGRHF2ckhW?=
 =?utf-8?B?WldIY1hFWlI0U3hHRjV1Zml2cXhvOW1PODJ3bTdsYS93K2R0TTg2ZkxEMmRN?=
 =?utf-8?B?Uk9mUUJRMVBFeElMaHdBYVpKUzIrTllYOHFqaEo3cHowcDk3N2VYcUxpdmhr?=
 =?utf-8?B?bXROVnc3MkVLbGhmNkRpMGVJTUMyOUlXVEJyanVqM0lsdHNrNkJNc2kxL05I?=
 =?utf-8?B?NStqcEtKdFhiVitEeVJJZVRqSWFHdFRHK3d6cjFTd2svREVNWU1PVEZ1eUJL?=
 =?utf-8?B?SGY2TlRNMkFzdW91QVBoV1Z2SHptNDMxWk51OWJJM0xHS1g1UzNrYXV0L0ht?=
 =?utf-8?B?RFRhZUxTU3Q4bjRtWis3QjBxM2RGQ0ZsemhENTErSEZvT1ZpYW9icFdiUXhv?=
 =?utf-8?B?STViaEdGTVNMME5iMzBrTDNmVmp6Skw1Ti8wVldjclVBRGJIQitSMlhzay84?=
 =?utf-8?B?MXlVcTdWZmxGbmhDMkxvVlJablpGNkRMVlJsaSt2YitqRllBWlEwRkVvcUpl?=
 =?utf-8?B?M005V0p1VmY4WGoxMTFIOVdOMWhtT1VwbGpPTlQxMCsvWXZ3eUhET2dFYXls?=
 =?utf-8?B?VzNHdU41UUtWLzZRRDA4QkQyVWJXMTJuRHlYbTdXTTVycnpCRlczOHRiSENK?=
 =?utf-8?B?SnVuK0ZFSmliWDUvc0RsNWJMY1FwcjR4VlVMT3NoM2pGb0VwV1haRzJlZ1pS?=
 =?utf-8?Q?JBe7nX+kHioVLDyvlP7DAX6AjfVHW9GfR6cLexX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac5440b-55bc-45f7-968e-08d97f5e2921
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:21:04.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+I6nyyD6puD/CRxoSV8aKlvpzyVCj3NIy3OWi6NHUOzx8LAY7tfOEyxC88sqpy9f4hRCqAz1yg8KYG3xUhhQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 20.09.2021 21:29, Andrew Cooper wrote:
> --- a/xen/include/xen/trace.h
> +++ b/xen/include/xen/trace.h
> @@ -74,6 +74,30 @@ static inline void __trace_hypercall(uint32_t event, unsigned long op,
>                                       const xen_ulong_t *args) {}
>  #endif /* CONFIG_TRACEBUFFER */
>  
> +/*
> + * Create a trace record, packaging up to 7 additional parameters into a
> + * uint32_t array.
> + */
> +#define TRACE_INTERNAL(_e, _c, ...)                                     \
> +    do {                                                                \
> +        if ( unlikely(tb_init_done) )                                   \
> +        {                                                               \
> +            uint32_t _d[] = { __VA_ARGS__ };                            \
> +            BUILD_BUG_ON(ARRAY_SIZE(_d) > TRACE_EXTRA_MAX);             \
> +            __trace_var(_e, _c, sizeof(_d), sizeof(_d) ? _d : NULL);    \
> +        }                                                               \
> +    } while ( 0 )

I know we sort of disagree on this aspect, but I would really like
to understand what you (and others) think the leading underscores
are good for in macro parameter names. And if those went away, I'd
like to ask that the local variable also become e.g. d_, like we
have started doing elsewhere.

> +/* Split a uint64_t into two adjacent uint32_t's for a trace record. */
> +#define TRACE_PARAM64(p)    (uint32_t)(p), ((p) >> 32)

You don't have a leading underscore here, for example.

> +/* Create a trace record with time included. */
> +#define TRACE_TIME(_e, ...) TRACE_INTERNAL(_e, true,  ##__VA_ARGS__)
> +
> +/* Create a trace record with no time included. */
> +#define TRACE(_e, ...)      TRACE_INTERNAL(_e, false, ##__VA_ARGS__)

Is , ## __VA_ARGS__ really doing what you expect? So far it has been
my understanding that the special behavior concatenating with a
comma only applies to the GNU form of variable macro arguments, e.g.

#define TRACE(_e, args...)      TRACE_INTERNAL(_e, false, ## args)

As a minor aspect (nit) - iirc it was you who had been asking me in a
few cases to treat ## like a normal binary operator when considering
style, requesting me to have a blank on each side of it.

> +
> +

Nit: Please can you avoid introducing double blank lines?

Jan


