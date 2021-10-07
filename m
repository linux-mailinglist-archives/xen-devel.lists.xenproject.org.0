Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64491424F53
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203424.358554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOrJ-00035o-Rd; Thu, 07 Oct 2021 08:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203424.358554; Thu, 07 Oct 2021 08:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOrJ-00032T-NW; Thu, 07 Oct 2021 08:34:33 +0000
Received: by outflank-mailman (input) for mailman id 203424;
 Thu, 07 Oct 2021 08:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYOrH-00032N-OA
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:34:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bbdf677-40fc-4431-9fec-cc96791c08e6;
 Thu, 07 Oct 2021 08:34:30 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-GtOQHS4jO0OQr-5ZjCOrmQ-1; Thu, 07 Oct 2021 10:34:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:34:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 08:34:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 08:34:25 +0000
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
X-Inumbo-ID: 9bbdf677-40fc-4431-9fec-cc96791c08e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633595669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzAwO/q8NGF/QYkQvZ2mKhY4CNs6AwIi9h56az5ci7A=;
	b=dXbFgr07MJtst7L/hNikZW+w6q20QuJDj0ipPT50+AepQ+RfCvwmIHesZprJ9lWQjS8nhn
	4rofVMbc4V1L9ZcapRNn92XviUIocyyTi2br/tTmaOdSS/V54xSefkvRsZ3dkOk1lK768J
	xYJ9cjxdKcX7GVksxVTIDC+GvfG/gn0=
X-MC-Unique: GtOQHS4jO0OQr-5ZjCOrmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heKOglbsjamSSuVueQkCtVWhFBXuAIUzuxZHbC2Vb2RE5J0ZCPRCdH8S9k98Tr1HD/6ziY4AcAw1uHXOju3nMj2gZtX7BOHh9eZeDgovPE7O3r4DSawvmL8QCn+SuBfjVgRjaIkDmvI93zXFhnytWqb+2YtYVHARTdc0JA+y+/ZNM6uOsHjbCFXSUfj1o9WJvkRFbMjQf0hOofo21prk62cy2GD/vg6IK9T+GCXXVlknvtxv7oLWl+jeK6vgb87++LIkq/669I4U7RGwP2y92Xn6tIvNj/0D5PfpVW7RFQ35//a7OmvlmBSxB+3ifkoIb2bOhYnNAmMjFCByy/AzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzAwO/q8NGF/QYkQvZ2mKhY4CNs6AwIi9h56az5ci7A=;
 b=a9Mh1U2B7bjmv1Ef8h1oj6VaPcpmuRudI4O4O8yM0LC+0z4OrR41IwvbqUYct0CTarLfMJgxg+rq/m6hqI61MgSQS/BqV9EtBru1qV7f4706URn/YmqMr8h2HcbO1ptgOk5FWb0eSxHwgO6y2aUqPUmQh3nOAjAcBRf+IUhDrvHHsqYZwFbWo7/R5htCKu936hPhf975WInISd8p8+FWNPYdzZHWzbzKXQ2lX1EfUyqAmCaaeQ6Hnh75mi1YyN95huUXfODR+ACZ33egDmZz7NSri+JExHpbORaNkV1qe81ntZHACBVnPUyby4+uCbifHZDlcUWJB1OizH56QSpVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/3] xen: Expose the PMU to the guests
To: Michal Orzel <michal.orzel@arm.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-4-michal.orzel@arm.com>
 <45bcc00d-95f1-fe20-a68b-de2eb793dc5e@suse.com>
 <8682dadb-cb7d-8291-33eb-4988d0d2227f@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fbf6e5d-2802-6a3e-93d5-a3dec051fddc@suse.com>
Date: Thu, 7 Oct 2021 10:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8682dadb-cb7d-8291-33eb-4988d0d2227f@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5220fdcf-4623-4c8e-7efa-08d9896d4588
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392FECEF58E788D6A6B130DB3B19@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PWRHJB3Or8duiyPgmjRMFx9DBCrdiYsWEj1F1xwABAklFp1EXfBALD78nxKLruCjOubJLUqacred/ka666jwoaBvVP/jzOLCHzcaWVASadV1gDFjPFwT1ZQlG6YHJJBbgVyQgbD56cJpe0Rm6ACg9MlAvGlOfmEs3p3nTn0rQngpg+OTK/pJWSRImWoLieXUMvRGokSUMNLg+fV2HhtOHil+6MTecvHdvKDDNucFuo3DW9xENoyw3coiRyFa5zwicxlcBpOJsa++XkHWYe2VNCpomvP2Gw70FgJDnxx9k2tT+Qs6RR5qz1UlRZ9Nmk3X/T4aFzzofi3M6KwFpB4vqZWkZ4LLhiN4O+3rvRMiYtU7F7Sjowgkap7tncE9D7wsc0w1gaY3FqwZ3EarJmvZm0yqBkVN1WjH9Zw5VHCA+dTinH2Ec3p1Mrj/TgnZdCl0kCeNguzdiY5M7/r3qsJ64/eVGW1V1Hlu2VYk2rIAdeHq7ndlFIYGH/vD6SEJAqqVQ+Dg0YbxMLpsOxyHUdVS0Z33uHWrE44xlWLxljBPtwtqwxB0WDGLQdol/Chi8XR7y6hULTHgS8MCCsIaxq+WHs13hD5sYg8Yqzaj4rLsLxOrN8YM2uK+yeHOmEHaW8tUwcspZA8FZ1H/Gr9GvAHOPgJI9fKkl01Iqgs237UtWJK3DODpyeOt93bLvDLg6S60db5aXpwLPiQLUuxnjABgD8wOzsSAdQ4/xXVlA0mrmCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(31686004)(6916009)(83380400001)(7416002)(66476007)(66556008)(6486002)(53546011)(66946007)(8936002)(4326008)(5660300002)(36756003)(38100700002)(31696002)(508600001)(26005)(316002)(2616005)(956004)(8676002)(2906002)(54906003)(16576012)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNwQXp1QW5SNXYwT1BNL1JmM0RPcDBTbGhXTDdnbHZIRHdUQ1N5ak5USG4z?=
 =?utf-8?B?VGwxalpPeDN6SVMxYzRYU0lIY2wvOERZWTVXY05nVEs2NEdVVTkzdXVLUzln?=
 =?utf-8?B?ay9zbnN2RGpjcWJCNHVyNTYvZEFaMGdSU0hHZDAwVDBRcDVmUWlncksxQU1Y?=
 =?utf-8?B?MlhpYXc3V0w1bUxVSmxvdVhjU0xDT0VlakJpdHN2OVhkNlhEUUg0ZlRhbnlj?=
 =?utf-8?B?S0RNTVQ5MzdSYmYzQi96OVZPUDRveDBzaDYxTzg4R2NVc2hEVnNKR0hYUDlx?=
 =?utf-8?B?cHVxWDlDQlRhM3o3VjAxTkpWQUJvWS8vUDcvRVpJUFVmMjNJTkRzWWRib3pp?=
 =?utf-8?B?N2RRUnZFak1JeVZSdGZOWHJrMk9PWmtMeHkyRnA3TXpJTm0vMjd0L0ZibytZ?=
 =?utf-8?B?Ti9TaHlmVGlDZ2xTdHREOCs4VzBVOE5lTXcrZURiWDdDenRsY0xFQlFYeUtK?=
 =?utf-8?B?MWd6Qjl2azMvVWhOV2lhelJld2N6SmZZOXRiYjEzdVFwTHNUMHpWdWhrbDFP?=
 =?utf-8?B?TmlHcjV6L29hRHZ0Q3hnekpadDhiS0U5bEhGbWhxT1pqdEp5cHUwVXhOaDMx?=
 =?utf-8?B?aVRML2VLOXF4TllEbU5ZZFdnb3NVR09UanowVTFXellQOExzbjM2Z2NjVHdF?=
 =?utf-8?B?T2ZXOXhUNkh0N2FGUFJGNFVBczg2dkI5WnU5SFRpNXZJTFJkcjgxQ095NTEz?=
 =?utf-8?B?NElmQlVMTDl5ZEFQZm1jZnlnWm56OFA1WmFWTXg1S0RFTFNsb3M3eUVvMjlX?=
 =?utf-8?B?bEhrcDdXRnZvSkNoekxPeDdEOXdJOVQzeUgwS3ZBYjB3ZHhLQ29vUmNrcXV2?=
 =?utf-8?B?OEFKTUdmRVVLeHV0NjdHL1pnd0JCWlJSYjRUbHppbzBQSFd4ZEMvSlF0Y1pt?=
 =?utf-8?B?RmJhaldybkNDdzd4d0trUlpRb0o0NU9DTDd4UGV4MjhHN25TaDNXN0tZVzd2?=
 =?utf-8?B?djlEOUVIVzhXbUFSYVMzcThlQ21XRElrdUlXZmloUGRKUFNaTGxEVVYwYnJW?=
 =?utf-8?B?RjBwVEtyemtSLzdOd0tRdGNjbllJaFBpeDVrWWoxWXRBRlIwM3JSZWtsQVlG?=
 =?utf-8?B?Si9qcTlXa05uNE1EdVBxVnpiU0N4VVJHaE5oakt3Q05nNFJ0VlRGZUVYUW4r?=
 =?utf-8?B?NnY5bzQvSzBETWpadTlZTy9GSUUzWUZ6MWZ5L3ZBaExTcVRLMnRncnFNcU5p?=
 =?utf-8?B?WlRPQkUzcG50cW0ybFZGWlp5U0FwcDc2MVFlbTNublN3akZWaWJGa0c0S0xt?=
 =?utf-8?B?OVRmTlhOOVIvSk5OY0JqQ3JpYWgzTEt5TmVvWHZieWJtNkRnbGl6eEM4S2Fn?=
 =?utf-8?B?Sk5qZzhneFBmRTlHZ3VCY05tc3VBQ2ZoYmJXZmRhWnVxemJneDEwQTRweDgz?=
 =?utf-8?B?S0JieXFRbm5scDFYZzQ2TXhxQ0w1SFlvNTc5YkFxWlVxTmRRNmRabGNVM1Rj?=
 =?utf-8?B?dExzL3NTSjBWWEpxRWZGVG9vR3l3RjNFZlNTTU5hOTgrVkMwOEJ6UzhqQVdW?=
 =?utf-8?B?NTVnMDVuT0p1dlFBaDRCRXJ5c3Z3NzJkeGdDWXcvQ0pwVzlFNnNaSE93Mkhz?=
 =?utf-8?B?Vmo2YjVkUStpRFpvb1NQWFF2WGFMU3IvYlFYMEVOWTVSVFdORDZOV2Y0Z0Jx?=
 =?utf-8?B?cTdrSkZqZ0dhTnEyK2FOYVllWEdRRmE5bU9ROCtZU3cyOFR1UVZ4QnBnbFZZ?=
 =?utf-8?B?NmJhNm9pRUZxeCtkOG1pdktqM2xuY2djQ1pvMGtTZ3BBTnVtNkdKUzhpMHBF?=
 =?utf-8?Q?X30vj9E5NwiEV3nzzhD8qH6kqtz6lo0tAFL4tAE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5220fdcf-4623-4c8e-7efa-08d9896d4588
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:34:26.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AQe9fIaJ5SkCQgfwl2G3HVtp3I5rhluT+WVaiN1nlSz/AWfP/4RXsg/Yb+owHQ+G2T+yu24l4NO3kxTxY5+Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 07.10.2021 10:21, Michal Orzel wrote:
> Hi Jan,
> 
> On 07.10.2021 10:03, Jan Beulich wrote:
>> On 06.10.2021 12:58, Michal Orzel wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -692,6 +692,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    if ( config->flags & XEN_DOMCTL_CDF_vpmu )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "vpmu support not ready yet\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> I consider this message potentially misleading (as x86 does have vPMU
>> support, it merely doesn't get enabled this way). But isn't this redundant
>> with ...
>>
>>> @@ -534,6 +535,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    if ( vpmu && !vpmu_is_available )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "vpmu requested but not available\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> ... this? (This message is again potentially misleading.)
>>
> Ok. vpmu_is_available is false for x86 so the check in x86's arch_sanitise_domain_config is redundant.
> I will fix it. When it comes to the message itself "vpmu requested but not available".
> Does the following sound better for you?
> "vpmu requested but the platform does not support it"
> If not, can you please suggest a better message?

While it gets a little long then, appending "at domain creation time" would
disambiguate the text. Or maybe "vPMU cannot be enabled this way"? It's a
debug-only message after all, so its wording can quite well be developer-
focused imo.

Jan


