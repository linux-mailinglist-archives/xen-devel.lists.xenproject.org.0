Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A444E2A94
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 15:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293027.497702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJ01-0003ld-F3; Mon, 21 Mar 2022 14:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293027.497702; Mon, 21 Mar 2022 14:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWJ01-0003iC-BG; Mon, 21 Mar 2022 14:27:09 +0000
Received: by outflank-mailman (input) for mailman id 293027;
 Mon, 21 Mar 2022 14:27:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWIzz-0003i6-7Z
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 14:27:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb88023d-a922-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 15:27:05 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-qRpLYQ9YNbqpIOEk5MjgLg-1; Mon, 21 Mar 2022 15:27:02 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4614.eurprd04.prod.outlook.com (2603:10a6:20b:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 14:27:00 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 14:27:00 +0000
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
X-Inumbo-ID: fb88023d-a922-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647872825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nwF8ZkQijh8KmoexSo2KCHR0pN9MhvySp0PIvPM7TY=;
	b=UBnXNeDVx6EsSSUGx36JQ2lz2JcYvqJ9aOdoeU9EqYNTEgLRRL7TlsMlacYIaz63R22VWB
	MFAaHDavUIRT0hsy4pBlrs5p/ENRBExS4jIyAMCkrnO7WspNbpBLMYp4g6+JOzPgJbmcuA
	fq00tHv5JXFbIMxLNN57kgdjOPIKEcE=
X-MC-Unique: qRpLYQ9YNbqpIOEk5MjgLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD11Gb3hoeNHBANIT2jyprQdIEe9WwSaDZQ8W08ymsHv5fvc/c/IthQvY/UqDxryKYjQwd5uvT2PIJ3Z4Oi6uUfjgQCZMt3MBgtiLTWGw+YGMaJ5y0Ds3qcktss/O+zhpUI1hKem2sV6252IZ2xLMaRPlFcytTkYUjjxP57gjwteeIi+y+Cw8Mt+FlQCZ8tVHoSjwZfwo2ZcrtxdNYGAADGaQko2InwR9Xt6DphBdbQNZRtKDczjm5gkCNlIMjcl9q7d1DMjJXrUg1jI2XJRzezwK/28DWNcekCCdylP5sWBMlKuG8Rm9yf7iLnHfkbcU7ORKKsBsS2QofpT1aIu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nwF8ZkQijh8KmoexSo2KCHR0pN9MhvySp0PIvPM7TY=;
 b=h5HKZcICpDi2qk3P7cIX7f+bHDxy4SBolnDMY5GCO5JIOw705Bkh20OmvgQ2epqpqODnS6rclBx9feMKP9ua7Ml6sQPuys1PKeCz782vbBOuatdVALhRPEh3aaDimgc627ZpRlxKoe8V3snJwK7WgVhHzvHoM8p9bwtUvY9gUUNekyv2goHh4FR+iS4cLfrMpp7/HDVIHsNnT75addc1GlfCenP5AaqQVDnn3NFibWQa/MnefTtECTcskNBm3yqPSVIwfdnsAHdS7iuvT2CG0dwZgkFHpVgeASqfxUPI2piuqzqOiJOBtSq9fplanEyPlNL2LUhXfh/nOBAlbatFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3a49994-db28-5976-579f-b94c1c6d9339@suse.com>
Date: Mon, 21 Mar 2022 15:26:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/apic: Fix function typechecking in TSC Deadline
 errata check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220321141207.18422-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220321141207.18422-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::40) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c782b81-f4b4-4ba7-b3a7-08da0b46dc59
X-MS-TrafficTypeDiagnostic: AM6PR04MB4614:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB46146FD5668AA6DEBD0429F6B3169@AM6PR04MB4614.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o13IaYLx8vwgr6fxktF/xcT4j+AZ3nW/QU87dsQSwhFYscPxtvYe8WfeqyYgIy5T+9S6d3KvltNs49IYcbedVUVr//QvvdKAZTsZO11q+aWsozt7J3/7Z6hmy7bdwdfPoggbzdHyY0RoZc+jHbAxw/pqVyrzZTmQKWbGlISRiNC8URPTZ+h/1SY/kWTGb8KeB+rbYXJ5KPPGaROM4jqyKtw2UYV1hjrNr7f8MMiMN0KRrD4lt5dKh3YBJX1rMGtVT3c7psBxGkiI6mFr8lO2YxAaABfNNN1GplGcd7GCKsHl8EXyzFDAGyJ5X9nPqtTIpeioHfV1vRHzKm3igRGqULdvSInDE2DEu4HmGXYXavIgCAVJ6XetC6XLiXRtV2maGKDYfgU7l+ojON56jLkf621KG4p0Ye0nrZB0w7ZSjk4kU6E7ClkHjwv00VBBJvv0px2QwrJSvUxzFeyg3iyRVsjeR5s5bg/TcKH7/mxIjIGB+omnupG1VAYWR8ct3uZg2Q+u6WTcoBWWIYhKsFQWwnVof4PdxEuQGh5bm9ZiRHnBK3xOvw9CXrrUvlgN00JFZAi2HhJzO/At47hhq4FvgHOiHynl+jlmBpCxMBtfiGWQphIpb3PiPY6yPlzp2H8ZswazO+4AMiMPGyXr77N9Ba6Afor7ituYzOJWS7wAMP2p9UnWZngUuTwjiYyKl6YfyJN607IKKNFtSiTYbnU2Kr8PxMtCn5ybeyrFvn79T3tf8yJ/2NisyXZe8tC/FOBs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(84040400005)(53546011)(8936002)(186003)(6506007)(2906002)(2616005)(26005)(6512007)(36756003)(83380400001)(54906003)(66476007)(66946007)(6916009)(4326008)(66556008)(31686004)(38100700002)(8676002)(5660300002)(31696002)(6486002)(316002)(508600001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGFzRGxPMzJyME5pVlBLdW5XRnozSStjYUdjOVZUUDU1cHozUTlVdTBwL2M5?=
 =?utf-8?B?dS9SeHpkOS96NGViNEgxeGszd29FWXhMNFFsS0txNmloWkJlRkRZVmhkblB5?=
 =?utf-8?B?ZFYvSm5UbnRDRTFaeS9ibEdqVGFyaVRpc3NmWXhnQXFITm5iaGxOVmp3TFpU?=
 =?utf-8?B?NGo2eXNHbkJST3ZONW1jWWMzZlFtRjZJOEZCM2d5aG1SRE1McHdnRnpLVnBH?=
 =?utf-8?B?UksrZGgza1lieWtIQnBzakFPbkhEVGZBVXYrWXdFRkdHb253UkNZNjJqTFg1?=
 =?utf-8?B?R0Y4S0FMckJmc0RJWU50U29pYmIwM3BZL05qNEQ5NGRYZHk5VURwWWt5U0lZ?=
 =?utf-8?B?aHcrRHZBT0drek9Ea2JVeVlYWEZqZDNEZisyVGVtaU96OWU1S2J3Q0F4L015?=
 =?utf-8?B?azB4WVJDS25ZK1g3U05WWDZySTNNVmZadWs4WXJtd3RPaDRFRnVzazY1L2Na?=
 =?utf-8?B?ZjZ0aDlvTXgwR3Y0SlBKbUUyUmVQdWRPWEFENFp0ZjdhWW5xcDVDYU1NdmZs?=
 =?utf-8?B?V1J6d3lMc1ljWU5jVWZXeHlwcmVtMEVoZFJzVlV3MVl3RUZvR0RRalpJM0R2?=
 =?utf-8?B?OE9FSEMyemxlbEFpbUdPRUJjdDFXVE1vZExRaE5Ic1RTdkUybkRaVEtZRUtk?=
 =?utf-8?B?aWNtcHRWaXNoZ2FQbjFrOHVDT1JhaFhPdGVZNE5kYWRFZDhoWm9RTTB5UGRX?=
 =?utf-8?B?Q1hoNk8wZUVlNGxSYThOdVVtcTVBelFEWnBNSjh2eEZLZm5yWGduTFd0MEda?=
 =?utf-8?B?Nm0xUmNDenJ0bmNlbEdkdTZYcFBXVmhoUTlPUDcrcGdpSjgwb0xZTFdNeHU1?=
 =?utf-8?B?QVZYaksrV1AyVWZjdEhleGsrZjYvNUp4RVk5MG5wcWRWbk5YOGg2ZzJ2ZGFI?=
 =?utf-8?B?UjlTNk13RlhlVXlaNGJsSzJCUEFPeW5EM0NZSmZPM3NDRXBqMEFLcUhqc1Ez?=
 =?utf-8?B?azJ3NEsvUTIxQnBxdXJOWXFVc2Z0QUg1YnNuOGFuS2pNVHlFUDM2ZUxmS3Bz?=
 =?utf-8?B?NWtFVW5WdGo4U2g0dU9TZXRqTGxEU2xYdk91Q1g3UjlRSWtGREJGRTdiZGtv?=
 =?utf-8?B?Y3B0M2pLSFFtK0dyd2RHTk9TSEFPbk9CVVdEMlhRMGN3L0s1bWsvbkpWT2M4?=
 =?utf-8?B?QjJGbFBjQlNjdWgwVEdYek52eTR2TXdjUkNJeHk3MDNmMEw5Y1R0YXBIT3hO?=
 =?utf-8?B?bW5kZy9EODF4My8zOVZmZ24rMnFvOUMzTHZZcEJzVGZ6WERCbUNjTFR2cjBv?=
 =?utf-8?B?MzBnSTVXWEtoUHlVSDdua1NjL1RiYTJjbnhGSFZqVkFicGNiWTJ0cXUwSHNV?=
 =?utf-8?B?OGJZcFRUd1FXTU5CKzFncjNjUlhITWpYeDNZOXE1NnEzT2JrRDd6SDVrWVhn?=
 =?utf-8?B?T1ZzWEJtaFFHZEpxRms3V0JjM1Z4UUtYQmRYSndoNzg4MXROTGtpVnFzRkE1?=
 =?utf-8?B?Yk9lM25qNjE3VitHYitGSW9zWFdmTFBHTmhERHhoRVZndGpPbzFjN1N6c2Fh?=
 =?utf-8?B?NUNNSmZSME9DQ3prMCswTmRGQ1NIUGR6c3VJVmVKS2V5QkJpMUR4aTBOQ3hu?=
 =?utf-8?B?akpEaXFEVFBJb3pJU2RsVXh4clRDQ3UyQlZlbVNoUHZ5cEtMU3dzYlAzSmYx?=
 =?utf-8?B?cjdoTzNEdnZFNkcvdkdqWVFjQUlNMFN6UDR1SW5VTVFsMDNFVGtqczBFbFps?=
 =?utf-8?B?MUF3Q3BLK2J4bVdsb2tSZDgwdjVDaVJoY205NlRSb2FDVWI5VE00Y0VvL0JF?=
 =?utf-8?B?WlhHb2tIdVFJYVhpdEZBbWF4cFYrNGZaMzlGTTFYN2tpaEE2WDNvVWh3STFY?=
 =?utf-8?B?eWdaNWY0M21yK0l0bEV5OUIyOTZSZHhmUnZxVVpBQUNXQlE5N0w4aFFNZG15?=
 =?utf-8?B?RVBqQkJKT0xhS1BIOVZpeGtqYlRuZ2tid2ZFaXNhVEhGcDBGdWt1MFBQSjQy?=
 =?utf-8?Q?6X2k+T9QKRjqzMYho2Gg/ncJ15JXeZpQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c782b81-f4b4-4ba7-b3a7-08da0b46dc59
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:27:00.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA5fv8qCPdnZaNSv5+kMgWZF26cwQBCeg8Bhi5J+0x8MPvtmWlH2dpCTiAirGCq6p9CPgGXjtxfXZYGbkTymHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4614

On 21.03.2022 15:12, Andrew Cooper wrote:
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1092,12 +1092,17 @@ static void setup_APIC_timer(void)
>      local_irq_restore(flags);
>  }
>  
> +#define DEADLINE_MODEL_FUNCT(m, fn) \
> +    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
> +      .feature = X86_FEATURE_TSC_DEADLINE, \
> +      .driver_data = fn + (0 * sizeof(fn == ((unsigned int (*)(void))NULL))) }

Are you sure all compiler versions we support are happy about +
of a function pointer and a constant? Even if that constant is zero,
this is not legal as per the plain C spec.

Also strictly speaking you would want to parenthesize both uses of
fn.

>  #define DEADLINE_MODEL_MATCH(m, fr) \
>      { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
>        .feature = X86_FEATURE_TSC_DEADLINE, \
>        .driver_data = (void *)(unsigned long)(fr) }

As long as we leave this in place, there's a (small) risk of the
wrong macro being used again if another hook would need adding here.
We might be safer if driver_data became "unsigned long" and the
void * cast was dropped from here (with an "unsigned long" cast
added in the new macro, which at the same time would address my
other concern above).

Jan


