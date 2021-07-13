Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE943C6CB1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 10:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155176.286544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EAY-000684-S6; Tue, 13 Jul 2021 08:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155176.286544; Tue, 13 Jul 2021 08:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EAY-000650-Oa; Tue, 13 Jul 2021 08:53:34 +0000
Received: by outflank-mailman (input) for mailman id 155176;
 Tue, 13 Jul 2021 08:53:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3EAX-00064e-73
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 08:53:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb31bd58-da21-4765-9c3f-449cff17f262;
 Tue, 13 Jul 2021 08:53:32 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-GdrGRXzoMRyPKi0cwt5v7w-1; Tue, 13 Jul 2021 10:53:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 08:53:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 08:53:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 08:53:27 +0000
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
X-Inumbo-ID: eb31bd58-da21-4765-9c3f-449cff17f262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626166411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgMfnghc11eKjaG5/zPcZfPSSKlkqnJnpmhblcTbWZ8=;
	b=PUbiRjf6cMPOb0Bl8p6amHu5d/YvfCtrdrNygA0N/a1oBdG/dV7tlL2HXJL4cBXSrCdYmt
	z/XvukP4KmTZBNFMWrLdO+niPjjQVavIe1flpvtDWNKxNtQuGMy/ZK8Foaiy/mWCitNxZT
	9EyyszShh6TZmiWQp4wsEeafiZwdjEo=
X-MC-Unique: GdrGRXzoMRyPKi0cwt5v7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK8/eoQ3cXS4BTSJLP15MxtmC8yV8h/CgA232e0s/Nb240pj9CnW5M42UewHsGqehzbCuGJjQ1OmhdI0q4Rld5tzqlLbqUr8XBQ96AnOF56yoWb9nMWygb9SOcH8PGpG7tOIu70/n/bSwFmdZqlBSZ+xesp4SXUS9eNKGL5e5AK+59RlIcR06SwKwMbpXSkrCE6aiZfnqovhSQpH/BtCWJQWUVMbNperGXg4nuw8L25JB394jQCo5SZIVhAMlvgL6Ljejc5U6pXF0wLhecZsIek5b7iLK8c1bK251Vo/SXb2L+r8Ju0rHhz5ukInxt+P1FuARThYLiMz4oEIs8xAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgMfnghc11eKjaG5/zPcZfPSSKlkqnJnpmhblcTbWZ8=;
 b=Dbq+R8ZeKeZ382RABuWEgFvcKCzyWlPpVqpxYpK8SBc2A5smLRW3rzB7sFvm3om9ALkKeuM42EXvPhLyYD39WpeqTJvEKgbUtQVJg2necvhEtmzA1j87K5jJcAaFpT0MnYfPMHwisAQ99xrsUAbOUM4n5kfwuUoLZYs1R6QqBd3QXEBKKuUMNPnGlFmV4bK/+rtN7cDtz/kDsaP75keIW9RSH9uWk01QfXfqWtOdMca7t1HR17kfjXiEQCDq+cgv7kDH6xIS7U4S1BmhkPmARLGlUwaSeO0LpoY0z0joZArNSRufp1SDNECl4sQ4QJUjKFdMVOPUCD7JxDqaslyAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 01/10] xen: Implement xen/alternative-call.h for use in
 common code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-2-dpsmith@apertussolutions.com>
 <2a794038-f4f5-1525-5af8-d89b687a8043@citrix.com>
 <4a55dc14-5d02-2594-38e8-f732ead164a6@suse.com>
 <a95650ec-1bd0-d36d-8a76-43c315fb620e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <278c7192-d3d2-c0aa-bac2-49e62d76db81@suse.com>
Date: Tue, 13 Jul 2021 10:53:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a95650ec-1bd0-d36d-8a76-43c315fb620e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f77eb52-115b-4adf-9141-08d945dbae7e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB434996B800E08E15E866ABB2B3149@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kwnc1ga6ra+6evsJFz5MswlVWuAdGlCvdNBSMOwI0a2XV4AwYLgwQex/DDiFX3TCwiFKbp4QtNA/S3ltL9AxBvscs23AfMcIOZ04L9Zz2c44H+j9yNz+CamwIjdB+O+TCpGiGVwCY6GTzMmZbAK69X+H3waEQkNDZmEY3oGgqXfL/Rsym0dq3vy3NebVs2RNZeQoVq73aqm/yC3j9uARohXFVtZ+FoV5OvUmfCMpGvVWvpRknPIQeAoFYsZdHBZ7EtKzECoeH5gXAkqM7ZeIdfLjec6eZhDfcUbo1nqUUNrmAP7qgMAsV2ZGbJONXzCV2S0/PvfsoJGWZWZ600u8kugxPYwmtvqI483btkXH0zHsUZ7u9TrYQoXOEhbgUVSA8B964/gqa+ZyIsEU44Exsft3cD+GuIsW7tGxe1/i8tCYEeH38pD99x0LaCGdx/8iR0BHxdEoIbK0o+8wtmqmsXS6KOGMvvr/5g0181lb/CZHSbp8h6GHMhKQCxv0A67KyK0wuxY353Vs5KSZiqSnm1266CBfn3TFw+1XMdetfspT+GmPkCrKqi2YE7XDFzffUs1mrpY/dQiY1wXASZvavtBwWNe156vC302nTTLuOE+V70Yo6HtvJZDdIn+XWfU1M9LDlV3zOCZVeYW7tFwBg97HGTRhGLkfw7jwMfLIQuBjV1LiTf/6kWWE1RO0EpBgR1cNOXu0fUZcaFLLLk52uVwCU3JtFW0UNdbVO7YhJ34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(366004)(376002)(346002)(6916009)(478600001)(31686004)(66946007)(53546011)(6486002)(38100700002)(54906003)(16576012)(36756003)(31696002)(4326008)(86362001)(5660300002)(8676002)(66556008)(956004)(316002)(66476007)(2616005)(8936002)(26005)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEYvOGF1elgycnhLMk1ZWmh2S2R3Zm1CdE5TcmRIbWlyTWFuWFVsbElpbXJ0?=
 =?utf-8?B?VTJlNTNIZ1h2RU01K1YySlorVXQ2NnZGbU10MlVwUkZLQ0pkT2EzTjlhcmRH?=
 =?utf-8?B?SXlTbXlDY0VlTHpYVHB5b1Mva2ZFRnNiTTE4d0Q4dGlDaXl1WWJqejNVTGxT?=
 =?utf-8?B?dUdCaVkvL2t2TWc3Ym1FMXJlNkN6bU9ENGg0TWhMR2ZoMzVmN0hPMGc0U0Rv?=
 =?utf-8?B?WW1aSm1CSFN5MDZvditObE5KbEZNY0tKNmhsTTd6dGlaWXpJMk9xQ1YvKzhi?=
 =?utf-8?B?RCs5VHNRbmdRNDBmazNnQUNraHNWb0JyTksxZmVub3JzTG1iSXg2a1BteGNK?=
 =?utf-8?B?eTlza0l0NFdKbVlNQ2lJUW1ZTUpad0EzVFZHY1lNc2RPd0phZUtoeDlDcXRN?=
 =?utf-8?B?cGtIdDB5YmF0YkFWcDIwbkd6VS83bDg3UXJHeFF5enYyRXFqK3JvaXpBS1Nm?=
 =?utf-8?B?c2hERWE1ZWhKc3FMMXJabU5yaFVTNDJIVG1IWHNaYWYzUXhORE1iVjFteE1k?=
 =?utf-8?B?TGpsQzFwYy9kRU13a01OR2FjYXhUYnA3V2NIUlEwN092Z1Z4QmFCY3ZKL1Uv?=
 =?utf-8?B?V00yM2tsVWdLU000eUhGSzhZZjc4MGIzQ0dqclphd1RHSXJaeHE2S214bDhB?=
 =?utf-8?B?WEJxUzdxOEF0c1BWeS9EaUw3OTFDaTlaN05laDk2dTQ5cS9mQytjQjZ6aFg0?=
 =?utf-8?B?RUQyMW5WcXYwWG1wWWlUSVpwVzFKYWUxTnUzNmVwbEx0VlRsWlJQM0FQT20v?=
 =?utf-8?B?R09waCtzbDE4TDM3NmcyQTVIWGZFTTFLTEp0VTNUdm5KVXpRVzQ3WDdQRCty?=
 =?utf-8?B?YzdVZWZoUnN3Q2l0Ylg0N1JkRnBzTkpkZENXSDFHU2VScSt5OWxweU9TNngr?=
 =?utf-8?B?bHhhME9ZSDc0UEVQSWZzNEtGaGsweThtN0ZoMlpRaUNobm1iMXNMWkgwbjY0?=
 =?utf-8?B?S3l5TTFkV29ZQnc3czg3cE1tbWdUbDU0Q3VYVzcyZkRGcUtiWEp1MXRSTCtM?=
 =?utf-8?B?dXZPUEdnZ2xBeERxOVR6NEpYdlR4d2IvZTdUTWhkc1RYczd3SDFsK3hpRk9K?=
 =?utf-8?B?MWJJRFJTMVp6aVgrMVNEUHgwS21XYUp1cU00RnZMSUk0aGNsUDVoWTNTUkcr?=
 =?utf-8?B?Z3dKYlJYcU9pK29hSFpuTXc1K0FJY01NUHUxeFNPajlveWc4b09oZkxHbWpE?=
 =?utf-8?B?Qm9WTVA1Qi96S25uTGhBVVlPOGxBN3c5WWFOZy95M29GRk9pazJMOUN2SFc4?=
 =?utf-8?B?Qk10SnlQLzNEZGVvSjY5a2VPTUZVUlNGeitvOUVoL2VMR1Z1b1gxOWJjYXVP?=
 =?utf-8?B?WnZ0THQxdWdPMWY1K2ZDT3VuWmg1QmFiWE1STjlhcUsvRU96VGc4NGU2SWt2?=
 =?utf-8?B?eEd4SkhEWHJ4a3VLTDBKUmd1ZnQ5TWxBWnlSWW16VmFjajFEWDdPemNvTlhJ?=
 =?utf-8?B?cTltWCtOMXE3b2JYUUlVNUI0VUVQZFlEd1lubk1kY0gzRjFlTFRCZ3RnZTF6?=
 =?utf-8?B?TVN1TEd1Q01Zd3VrdThodHNqemZIdGdFcFlJdEI3R0FPUmFBR2FjSHpGbXVo?=
 =?utf-8?B?Nzdta0hpVi9YTEZuRTFEMEVPVnQ0emc1RnlQNEQ3ZlhwalBWbVFwWFBYbjVm?=
 =?utf-8?B?eTAvcHYrOEdkMWJzT2lIZ3hlQUJFTHhOdjA5YUFFbjFoOEJOOUdYSk4wNGx3?=
 =?utf-8?B?MWNxOUNhOE5NVW4wRU9MaCt3VUFwQ2FTcFpRVHZzcmZWVXA0STZVczhvUnBj?=
 =?utf-8?Q?LxEWlRyHs7Ki9L93Sf7io4nRrmmSyb8qztkoB2C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f77eb52-115b-4adf-9141-08d945dbae7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 08:53:27.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ1Kv7ZBX4dtFIpi7TKTsYSGvf8DvULDeMKuF9wq3X/mnvjE+ClRntyoYerruKPm1+t+iLIdQ6+EmTrisQ3PqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 13.07.2021 10:36, Andrew Cooper wrote:
> On 13/07/2021 07:28, Jan Beulich wrote:
>> On 13.07.2021 01:48, Andrew Cooper wrote:
>>> On 12/07/2021 21:32, Daniel P. Smith wrote:
>>>> diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
>>>> new file mode 100644
>>>> index 0000000000..11d1c26068
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/alternative-call.h
>>>> @@ -0,0 +1,65 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +#ifndef XEN_ALTERNATIVE_CALL
>>>> +#define XEN_ALTERNATIVE_CALL
>>>> +
>>>> +/*
>>>> + * Some subsystems in Xen may have multiple implementions, which can be
>>>> + * resolved to a single implementation at boot time.  By default, this will
>>>> + * result in the use of function pointers.
>>>> + *
>>>> + * Some architectures may have mechanisms for dynamically modifying .text.
>>>> + * Using this mechnaism, function pointers can be converted to direct calls
>>>> + * which are typically more efficient at runtime.
>>>> + *
>>>> + * For architectures to support:
>>>> + *
>>>> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
>>>> + *   requirements are to emit a function pointer call at build time, and stash
>>>> + *   enough metadata to simplify the call at boot once the implementation has
>>>> + *   been resolved.
>>>> + * - Select ALTERNATIVE_CALL in Kconfig.
>>>> + *
>>>> + * To use:
>>>> + *
>>>> + * Consider the following simplified example.
>>>> + *
>>>> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
>>>> + *
>>>> + *  2) struct foo_ops __alt_call_maybe_initconst foo_a_ops = { ... };
>>>> + *     struct foo_ops __alt_call_maybe_initconst foo_b_ops = { ... };
>>> It occurs to me after reviewing patch 2 that these want to be const
>>> struct foo_ops __initconst ...,
>> __initconstrel then, I suppose.
>>
>>> and there is no need for
>>> __alt_call_maybe_initconst at all.
>>>
>>> The only thing wanting a conditional annotation like this is the single
>>> ops object, and it needs to be initdata (or hopefully ro_after_init in
>>> the future).
>> ro_after_init and initdata can't be alternatives of one another; ops
>> (until be gain ro_after_init) need to remain in .bss (or .data).
> 
> Once alternatives have run, the ops structure is no longer referenced by
> anything at runtime, and can be reclaimed.

Oh, right - if all pointers have been consumed for patching, initdata
is of course fine.

Jan

> All the x86 examples are weird because we've either got extra data
> fields which are referenced at runtime, or we've not accelerated all
> function pointers.
> 
> In neither case does modifying an accelerated function pointer after the
> fact do what the programmer expected, and conditionally initdata makes
> this far more obvious.
> 
> ~Andrew
> 


