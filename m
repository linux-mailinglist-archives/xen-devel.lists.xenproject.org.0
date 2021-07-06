Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F13BC6B6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150747.278691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ejz-0000ew-Dd; Tue, 06 Jul 2021 06:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150747.278691; Tue, 06 Jul 2021 06:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ejz-0000bv-AT; Tue, 06 Jul 2021 06:39:31 +0000
Received: by outflank-mailman (input) for mailman id 150747;
 Tue, 06 Jul 2021 06:39:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0ejx-0000bS-GQ
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:39:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e90e28ea-de24-11eb-8475-12813bfff9fa;
 Tue, 06 Jul 2021 06:39:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37--aJ3qt7uOOiCKHZ2FSAb0w-1; Tue, 06 Jul 2021 08:39:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 06:39:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:39:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 06:39:21 +0000
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
X-Inumbo-ID: e90e28ea-de24-11eb-8475-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625553567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvWQDikLgE2iDToynKipJWDFqS3lsRtRHFnNr1/61FA=;
	b=QT4n/h1j1P2j4Ow4Jl8+cvaS5akTs2UKCFL0JoLMhUWY4EbmFXf/9zhUdX4dP+91yvU75B
	ktxTsa1jYLAPTqggmc3xsnwtgQnRjVrZvGG0ge+BToimJ3/4DgxpfqLA7lBrumxZ4OpqgV
	MGew5VIO3T/91uROXNIsKxNMWvbGoV4=
X-MC-Unique: -aJ3qt7uOOiCKHZ2FSAb0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgUnw/9kfJbENPqh4Jl2uEDEJJ46FxZozJdcISDOCcNiqfQPgOHJiX+z011COrevKltjAtB/3Sj5LtVp9skuEGSv7w0WjYFLbLVASidKdNJ3AP9csP8nNgpCEQ9xo9ip+h42koUmql9JHEYHSztbB4HJa15yFGVmfJhhywt5HlRN7DME0SR67R6c6nVi+IUfvjKGOCjwetF4V0v5A7sVbtC2LkdnGpfuxAqOjlVdL7NavEd3ZHx5wRC4NX2UU1QDckbTbgM/K2W+kIhOMZKXdvCAkrTwWryxGMgFm2Y6VmH1bbEs+HrVbiEL+4Hy6ws+6bYfUdmZWUvHlzbcX0xXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvWQDikLgE2iDToynKipJWDFqS3lsRtRHFnNr1/61FA=;
 b=PK94WwQj8fPTXNcbBhfzCb0/LH6AxS92NMwEd4fZz7v9tKUcPaf27k3k8usD+Vd2mfNA0iGhxoUxe30QlrzEpvqzI9POtRY0g4894ybK6B1raeOOOAB05Y3kMpjiflfwWAxnSKf67ZGGeUlOuzteI2zNc4jtZ04nhU+GMl1vaHCmm0mosPrj8PQ21WUYaagnk3Sx0SvL9DXaS5b9hYS8OumFWO8ASvNQUB0z3YiIr7/heGV5rUyDH4MtrAwcRqlkYoRwZiGPx3xbtnj2QmB4YoDyyLdzCNzMmxZGG7VAuV1uGK+HNh6XRdL0/v1tttpLhDZIv302sBrYd3EIGAs4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
To: Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <20210705192612.5cf50887.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f70be58d-99f0-0631-2b01-436e3e94e5ee@suse.com>
Date: Tue, 6 Jul 2021 08:39:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705192612.5cf50887.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a13038e5-7b35-4dea-3128-08d94048ca1c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333DFDCE6DD26559B004231B31B9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nbdGlxlCWTDnjC/iixqFM/3ScYYach+cRA/YnJGClOeDwSPtBSrM/8kAOK6hgsv9WvBgwgotpt4cKgAvYleXQpcC4OUBZFCOVBa/nuhW8tw4zp8eqDTGZrtE4OOt4bLcCebUPKpayqSRWKC8BllQR8g4Z7NoYn+rg9vsOAKu1q4u3rmSO256J9KJeUQ/ryk9VsOY8fqRKPuXaOp0vnXftsk5uA9uNpfTSbWO0l4jn1bg3WJ64VCIfFx9nHy3SvYVNQDZyzU6ZYDggDY5pAtwdQVtAglI8ZCv0UoUmMG52Ba2KWI5z6Axv/mch2PS4fe7vBsJs2MmFuesLU74OkjZIlowXnJZJOiF9qn+w4hZ/JtXvn1cDnWzd1fnosFlahhTKe7rsu3lrl1tUgiQw7151akaRtKKnoK+Yz6/ffoiiX8YNsGvjnWCqOre2yTmJTxh+Yjzcd5QUKZE8Qg4YwQ30a5jNJ1zkXBvPJ6JeUnZ+tP3w8YXdoRHLokVkaplN8qhGub7jHCjNoKyMJoqdSz0KpPlXuQfOmtvoW2Dvw4mDSBKOFOMN1pUqXDVDi3lUplUrIYtinhwMQQ5YTWqqv0RYGe1KoJIYI6sU/UJf0N1Wd/0v3PaGyBC010VxABejOJFRbYE4WRSh00YPyA8Y+u0caCPzm7NALl6pc8PkSTO3g2hqSfx0jAwevejP2xYiF5fVys3vgnozcDrR9GaAho4axNxP053VJ7W3OJvpG+zsGeirt54DloC880Svt7cT5MFXMnpBrCw/e1rJshcXzmkWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(53546011)(6486002)(31686004)(5660300002)(86362001)(478600001)(8676002)(36756003)(8936002)(66476007)(66556008)(956004)(4326008)(26005)(54906003)(66946007)(316002)(16526019)(2616005)(31696002)(2906002)(16576012)(186003)(83380400001)(38100700002)(6916009)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFhBN3ZWVTZVaW9VNWpldS9BeHJISC84bXdyTjFlYU1BMGRKdmdFS1pUVW9s?=
 =?utf-8?B?V1dRcklBNEVET1B6RUhFZEF0d1VNdTd4Yk15QVlyM0twMVFRbkZRVlZGdG42?=
 =?utf-8?B?WXZlNWQzVVVIakp1QnBlR0NLTFdRRUo2cm5CZEdha2tTcWlzZ1FDS2VzaTMy?=
 =?utf-8?B?WTZvTFdONDBKK29aQVd2UjFLWVZQbTFDRWhBNGpONytsQU1QTDFpdnRvbjEz?=
 =?utf-8?B?RW1UYW9LM3lxYUJ4Wi92dkg5MUgzOFFQM2RvR3MwZzNBUDV2SUk1b3AzSUVj?=
 =?utf-8?B?WDllWDhKUHRXZUxpeXNsdjRJQWh0aHljaml5cGlhd2ZNMi96RldqZTRvalVR?=
 =?utf-8?B?bXBTZWE1bnBROE5kZzJJU3pLNEpxd0doT1VvdCtaNHFseFpYcmhwK3VyT3Zs?=
 =?utf-8?B?OHJxS3JpNkFHSzc4UW5lcm1lelZiMWczOEUxQWdyQ2w4T2htZzIxOVowN21T?=
 =?utf-8?B?L2V1VkZyK2JsMDZhLzR6Rmc0MGU3bnJVSDBGT0ZGZXBHVzg1c3Q1OVhVekNw?=
 =?utf-8?B?SUNXUEdPQjUramM4aWhiNXVYZXd4c3RGREsxTnVNWkR6TnU1NGJaaW9IZS96?=
 =?utf-8?B?QU43WTVBZ3hGa0dJa0NBVnVjZ1QvUTBUMWhqZ1BzdTVkVjU3WDdPYVlHZmM0?=
 =?utf-8?B?dm9VeTRuTmVtTFdvcm9WZnYvRldINmhGVktxMnExMXNINTJISjVzWWVNaW1P?=
 =?utf-8?B?MDUxZU9OZVdxYkhkN2dDODVKdE02bDJpa3FuY281QlR5cHZybExSTjJWdFR0?=
 =?utf-8?B?RDFvMWdRYzBOaFdpblVuYmZ4c1JoZ0pjamx5aFRtL25kRllTbml3bi90aTV3?=
 =?utf-8?B?T0FxUnR2Wm5NcEhKMXlLR0FVSmEzSGlTMzhtMGtLYlFINjJwTUlqclFvS2t6?=
 =?utf-8?B?cWRiUFJvT09vU21YNGZweDhzYWlrWWF5Q25ydDdzcjh4VXdORVUzdFg3dDdL?=
 =?utf-8?B?WDhoMzVXcVJuMlFXcW1vWENrUXFoTEdvbFhxNUltR3JKN3pONTZUVFFuQys2?=
 =?utf-8?B?MXlrK2dMN1hibFlsRmlQVUZTTWtBZ0duc2ozVUdRZHRNR2pDejl1MlpLd3VI?=
 =?utf-8?B?QjZ6WEwzdEJsSlMwQjFISURPekwyRGp1QzgrblcxM2VadkpRcmFVcFc3MzFH?=
 =?utf-8?B?M0tLQUV3VjJBVnJYNWlwUkl0TnBaMFl0V1FyVUlCQ2VZaGFSYW9PUEwxbDlQ?=
 =?utf-8?B?d1N3ZldURXErV2pQNDJVNHdNY1cvRGRFYWUrZ2QxR2l1L3BjVm50QzBKVVZy?=
 =?utf-8?B?UUx0WmRNRlp6ZUp2L2UwQWJZQmFWVmYvMUZRQkVsdzNIS01NNHM2eUNKWjVw?=
 =?utf-8?B?UXRDanFtWDVmM2ZQSmt4d3hrQ09weHl5RllWN3hoa1FZYmJIZityRERJcUYx?=
 =?utf-8?B?bUNWZWdzZERWUHkzVjZnQXNuSWZnSWhmMERCZUZWNXRqQXBjOGZCRUZwczJt?=
 =?utf-8?B?NmllV1RwZ3RBL0IrbFFnZmhicy9odmFNSUxpWUttMkpUZ3FMRVkzTC9nUFZL?=
 =?utf-8?B?NFBSbXNlOFVFS2t5ak9Gd0MwWWdQU1pSaVFwZzNKTzJWSU1RYktySno0MzBO?=
 =?utf-8?B?MWk3VTF6QXltT3hxUTRyaEJ6QWJCQW1WTWRLdE5sUHpBYVJPKzBEckt1M1VT?=
 =?utf-8?B?TkRpY1hZZmU3WG1UYTd2ZElEaC9TelY5TWxWVzFkdUh2a2RlQ2dRZTlGOUt0?=
 =?utf-8?B?aDRGY3kvcUM1dy8veUdoZGhQS21HRFdFZDU3QnZwc05ZYWZVNTlMK1JiYjYz?=
 =?utf-8?Q?fW0nuW9FhJCOOaWsvO3+5Adub33iCnafOcZJHbo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13038e5-7b35-4dea-3128-08d94048ca1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 06:39:22.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBCse2uV/vv+KuoMlBI/n9SCq+AEIFmWXkj4JyezfKC+4IVYXtzK8H2z6M3yXs+RMuSLSQwJN7fRRbXgcNdnlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 05.07.2021 19:26, Olaf Hering wrote:
> Am Mon, 5 Jul 2021 17:13:28 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>>      ctx->save.stats = (struct precopy_stats){
>> -        .dirty_count = ctx->save.p2m_size,
>> +        .dirty_count = -1,
>>      };
> 
> As said earlier, a consumer of these data may now be unable to initialize itself properly. Without the patch it would be able to size its private data structures properly to p2m_size. With the patch it can not know in advance what the upper limit might be.

And as said before, besides the intention of this being usable for
sizing purposes not being spelled out anywhere (instead it is
explicitly documented that -1 means "unknown", and the value really
_is_ unknown at this point; p2m_size is only a wrongly assumed
upper bound), this is useless information as the size may change in
the course of migration. It is a present limitation that this isn't
handled properly, which I think would better not be baked into
further places.

> There is no in-tree consumer that is affected, and I do not have an out-of-tree consumer that might be broken by this change.
> 
> Just saying..

Sure, but (as is the case for Andrew's replies) if you want me to
change the patch, you need to not just "say" something, but provide
convincing arguments. So far I've provided counter arguments which
weren't proven wrong or at least inapplicable.

Jan


