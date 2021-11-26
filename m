Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D356545EB03
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 11:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232476.403067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqY5o-0004qi-2W; Fri, 26 Nov 2021 10:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232476.403067; Fri, 26 Nov 2021 10:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqY5n-0004oP-VI; Fri, 26 Nov 2021 10:04:31 +0000
Received: by outflank-mailman (input) for mailman id 232476;
 Fri, 26 Nov 2021 10:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqY5m-0004oC-4L
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 10:04:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e4052ab-4ea0-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 11:04:29 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-A1XQrRQbMWK1z4XM3QrVZg-1; Fri, 26 Nov 2021 11:04:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 26 Nov
 2021 10:04:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 10:04:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0087.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Fri, 26 Nov 2021 10:04:23 +0000
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
X-Inumbo-ID: 3e4052ab-4ea0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637921068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcudEqs7iYh3foiGqUp+NPkmuCZIOsFGT8lRli8M/0I=;
	b=lIp3KTT/74DE22/EFuM390n/hICv1+4TbBQ9TNb+n9bC1P57xH/QYTWP1D4IJkRHM8v76S
	8S0zRxiQUH9AlYfIFI0T5ngazkaBxk0YUa2as6D1ZEwC+wu7pVoDGBgTKswWnBUYWA7Cn3
	GpqK5n59NyKsnqHtBKP4kXrAD1y7w9g=
X-MC-Unique: A1XQrRQbMWK1z4XM3QrVZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLLtBkyNsCTT3w4IuMGgfgyQNVGN+vMHzQnTSb807Veh5XX7SUPBaVUPfOLcJrSCYjdROSqB7bcoWEEzNM521ya5dcuCVSiySy28Sp8QWTXg0LzOHsZJ0bkr23oHUtSzsF1IObcgT6qYJvgDM4a4NQSyIkQVYQm4VmW5xRN/hEaPSYms4IcWZwFxA+71quLMV2bxL8WiheYI1IKsm+biiv7GS/seAXypJCqSvQQkWbQoszJmmnlv8jTgPrfv3v0WgM9/AxBzwCcwF1CMO6Q9fwjOM6ehchaXeOX2079QZEn2uYtzBi9VXOphltgjh/PppVlueMqt9uleDtZSLeEOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcudEqs7iYh3foiGqUp+NPkmuCZIOsFGT8lRli8M/0I=;
 b=Vqys0SYbDeRG9DTiZrQ7I8EJmYdWUR4nAN93OBda+ipl5K70jVVXPPEWC6eVaJDpOmIGtLuB3zxLoqp9KdpQeO2wY3PR278a6W1b0QUC0nBpID3BSnqsgqPRXslUUcgl8b6W7THC8W8/jz2VAy8uPPd5l+4co3BscVPVaDL/RuwyeamCO+CuBZxqTHa39shTlQ2pa/LPz8d+S7MRTjx0UzjoOOiSjpHcm+Qlm8kH2Rxit4wovFx4onb9kDEJdXIreaour9mzLPb1Ug1fyKyy+fCXUpyhQmd8DYIXA2p+lScVEGqolPZYKEFEX8k0KKArQAYiZnxulzXLQrcbHpGCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f839869-dd5b-8db8-4928-ae8299d32942@suse.com>
Date: Fri, 26 Nov 2021 11:04:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211126065547.22644-1-jgross@suse.com>
 <4afcdfb2-cdab-a019-7541-598917bc4592@suse.com>
 <66843af2-d653-39ef-504c-46342507faab@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66843af2-d653-39ef-504c-46342507faab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0087.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23e81f45-93c8-441c-b710-08d9b0c41fb2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3535937E17F9201FC06465AFB3639@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	COIpHnSEonQVVNYUZAyAqWefqKm3/6htAeQ6bPj3vcPf7dKb5xVPFgI6gBYpEo78ZxkrcrAl+cz5ZcpmaiwKDdeHTQLQAiAIi6c/Gm36oHwwtqC5d0WlIubEwfiL0q7/V+W4sboQsOIYJfhdfafr4gWT79mTrI/SvgRHePyX5GRucLrEZuseW2F0HCzkBmPY04PO4fZS0NPLAmW5fwa+EumgjzCljsC21fNJPHycY0+599GVlwn5siuhBHLV1k1LPpg9v5lehJxVmuSOEgwXaddFiuS4GIZbNYmnCPXtzHSrPjHdcPRh8tmHteVJdmv8kzlQen1NESQmioZYkHHpwDWFpS4/bt6uxjtvbupOJ5cnhxlxwvzK7dE0HJM3aXslNZ2mayXeJmKWDhZPQXWXDUagd8zllmJ/Vml845zyEFNWPWk5I2KJtyaljvlDlm8JZuvnA+5/VjWisubLWC5Ks7Fuh0k00oQlw5KBKA9yXY059EE+mfrjTRN5hZWGaiQH5ARK2mzz6twZYEkKRNyf8Gaam+ht8AeyFfUr2M6dVdu70zLXpwwj6fLGogasWkX8CVRIYqmBZsAFHjb0CVau7Gx/rch3eCoL8Ykq8ltUrP+kDmywzhiuzOqBwijQnLi7b5/JNNdrLzQz3J1wchMQneXys4dihD2UMuTZ3slbPDhzU/27irv7le6onwB9l04kLLMoGo8W23apQj6nLgaURpAUxwvfp9K5SR8IBRClOn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(8676002)(508600001)(66476007)(37006003)(36756003)(38100700002)(66946007)(2616005)(26005)(186003)(4326008)(53546011)(16576012)(6862004)(31696002)(6486002)(316002)(2906002)(31686004)(6636002)(83380400001)(86362001)(956004)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVQY1IzRkl3YjlPT1N4UituK2NTQ3kwVFRrWng4Mi8weU8vd1A3L0pMZWdR?=
 =?utf-8?B?aksxZXJPejVoS0YxRmJKY3JjR2w2VVBJd1FvaGcxc1ltSTRCbm5rcEdEUmdS?=
 =?utf-8?B?WFJZTEIwTDVKbTk0dld2WnRyL2FaTXJkVXQzdUFzOTBEbWhEc1BDbVZuVllZ?=
 =?utf-8?B?N2ZiYU54S2thWC9VcUZaYTQrcEw3RTltSEIwb1RKNVlpSTdhMVJqbzMvaW9O?=
 =?utf-8?B?TU1jU0FRczRmTTZSWkUrSDE4WDdzRjJmalhvL1dKNzg5SHJmcWN6K3VBaHh1?=
 =?utf-8?B?V2N2b291c2hUY00rM0M0Q3dmTzlndktrYW5PT2hVOHhaVUlmODBWZ3QycnVK?=
 =?utf-8?B?UithR05wU1YxdjNadm9qUUJkTU1Bdm5hRjI3VzF5SS9NNHhvbk9XNmlFMzVm?=
 =?utf-8?B?eTZWVjY0UkN2QzFoamhYdm4wWFZLZFVxZjREMjNKN1h5M09rKzByRm5oQzRN?=
 =?utf-8?B?Q081bUlqRHFzbWxBNlBZM0lweElHRjBTcTdRaXQ5ZE5LdUhtSzhoUkxkYXhw?=
 =?utf-8?B?SGZEc0MwUGtOYUN2dHB3SkN0Q2VxaFRrV0ZBd0gvZHlsOW9SeEk4YUozRldr?=
 =?utf-8?B?Uk4zMVVzaCtyTVU4ODU1M25ZaWpzY0Jjdzh1a1V2S01xK1VFbWNuTis2eHVM?=
 =?utf-8?B?M2syWGFWWXlhK2FCa3Q1Y0lEaXhmdXhNOXV0SW5DWTI0VW5qUURTUTVSZ0ZG?=
 =?utf-8?B?UjJPQnV0YjVqYk9lVVpiNlM4NkNMcXJjeFZURGtWekw4VWVPL0ZyNmpKMmoy?=
 =?utf-8?B?anFqODZSSjh6WjVJWXFCd3hJdS9VK2hMMmQzRTFlcmJHWXQ3amJBN1lUd2hE?=
 =?utf-8?B?ckp1dHU1VWxEVnZmVnJEa1ZZRDRMcGlUNVI2cE1tR0Nhc3k1UjBoZCtDYTd3?=
 =?utf-8?B?RnAwblNTUENQTUJGNGpORU9PK2t0alB5UXNOQmIzQ2xtbDk1bEJaSDJZSkRm?=
 =?utf-8?B?RmhCOVRnVTU5K2ZURVZ4dFgxRU90dUgxYmJtOE5CSy9IK0R6K3F3S0lvdDRL?=
 =?utf-8?B?OGc2VC9LalZkbzBTd0JVemptdEE3bU1SOHZ6cXlnS3FFbnlYYTRMWVFJbmdX?=
 =?utf-8?B?UUF1VTZ4TkRzZWR4cXo1UzlJSWdSTFlNdFpqM2VVNW9rRkphNHZzQVQxWTB6?=
 =?utf-8?B?alRMRkVuRVpqek43Y3hFSFJJYitBUFhuNDc5RlptWEFFcVFWZ1NDTXFxSFgy?=
 =?utf-8?B?ODIvL1ZudkxvNlBQL2VsbTJMWWkxTU56SStJRzlvcEV3OEZjREkrNU9vNitK?=
 =?utf-8?B?dnVrRGVzZlpieUx1czR1VE9pRDMrV1dKdDQ1ckpSTDU3SXRPdkREUExmbW9l?=
 =?utf-8?B?SENrajJUWnlDQmtTbjRiK0lTMWxLb3FCOHRmM3ZzSEZobXNqNUsyNVZ0MlBz?=
 =?utf-8?B?ZDNtVGNLV1J6L2NiZmRBcE9PTC9SQUhYRUFSTnRnTW5tZVZwWXJMcEJQVng5?=
 =?utf-8?B?YW83cytIMVpCbU1qRGx0NUtjRFRBRzJIYXpYNUhuUGlBRjdhVE5uREVqUUty?=
 =?utf-8?B?aTRMbERRWGdPV2NVUzRpNndGLzN0MGtuUWQ0T1N3ekRXQkU5NnNvUlFEWk8x?=
 =?utf-8?B?RWdWT3BMREFqQU5SNXZ1bFB4b2pXWE9WUnNkd1ZUczNlaGcxSVFieEpDVmtm?=
 =?utf-8?B?c3ZCWEFXQTBqT09vM2lBMmpBTkNpMytvbU45SjNLRkluTVo0M1l6bGU3Ykk3?=
 =?utf-8?B?ZkUyam03Mk9rbWI1M3pYY1VuSjhPMXRPSEU1OXJ6UURsSmNPOGxyQXYrYTFG?=
 =?utf-8?B?ZUZsOGV1Mll3cTIrdUlCR1dqM3poYjNKWUd4bEpDWFJLNXFGRVM1VHM1blUw?=
 =?utf-8?B?YWs2dC9SYWlVaUtETVRMRTJnWHJjRTJtOHVxeEx2dHBLa1hESE5vQWdWdE1k?=
 =?utf-8?B?NVVib21MU3ZkcUIzRTJwOGZGckpsK1VlVStOU0F2dm1WeGs1eElyempTOHRx?=
 =?utf-8?B?bzhDb1hHZHc2alAyMzlrN1FCZTlCQWpPWW42cUFBTXVKL0dSUzJuR1BXdVJq?=
 =?utf-8?B?Z1FkMmg2WjZBejZxUEUxVmtTZlZwTDZsK1pQSGkzbmhjZUEySXc4TXdKT0lE?=
 =?utf-8?B?dHN3K1gzQkI3QU9Sb21RTTBEQWZTSGVpSU9MRlBpcklaZDhSaXR6U0lnbmtZ?=
 =?utf-8?B?V25TZ3NBYnpRMHBVRm1oSXQ1azByWkw3bFg2YnRnK3d3NHBQUG02MVNaYlE4?=
 =?utf-8?Q?9u/WvTrIS82X/Pue4ShF1GI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e81f45-93c8-441c-b710-08d9b0c41fb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 10:04:24.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4pW/Fi361YwM2A4Ni7EbS1Ofr5fCk7Mc+8p2Q1uARcUVjej9mmZUYKT55q4t4iqcMQL/MUp1enjBGzsqZDgBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 26.11.2021 10:21, Juergen Gross wrote:
> On 26.11.21 10:17, Jan Beulich wrote:
>> On 26.11.2021 07:55, Juergen Gross wrote:
>>> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
>>> unconsumed requests or responses instead of a boolean as the name of
>>> the macros would imply.
>>>
>>> As this "feature" is already being used, rename the macros to
>>> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
>>> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
>>> future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.
>>
>> I don't think we can go this far; consumers of our headers may choose
>> to do so, but anyone taking the headers verbatim would be at risk of
>> getting screwed if they had any instance of abuse in their trees. IOW
>> I think the original-name macros ought to be direct aliases of the
>> new-name ones, and only in Linux'es clone you could then go further.
> 
> Fine with me. I'm inclined to add a comment hinting at that possibility
> then.

Indeed, please do.

Jan


