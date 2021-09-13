Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C940857C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 09:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185489.334174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgZI-0002SD-6Q; Mon, 13 Sep 2021 07:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185489.334174; Mon, 13 Sep 2021 07:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgZI-0002QQ-26; Mon, 13 Sep 2021 07:39:56 +0000
Received: by outflank-mailman (input) for mailman id 185489;
 Mon, 13 Sep 2021 07:39:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPgZG-0002QK-Qp
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 07:39:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd821b7a-1ef9-4da4-8a97-da4f494b461f;
 Mon, 13 Sep 2021 07:39:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-XPGbhdddNJ6x0kzj5owdZQ-2; Mon, 13 Sep 2021 09:39:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 07:39:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:39:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0068.eurprd07.prod.outlook.com (2603:10a6:207:4::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Mon, 13 Sep 2021 07:39:47 +0000
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
X-Inumbo-ID: dd821b7a-1ef9-4da4-8a97-da4f494b461f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631518792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hX/RP9X88cA+nkyIzwgkGoiOgzdc/4idb4/dybz09Wk=;
	b=GB+z4jRTCuHmZE50LP/R+jiNQ8x0AwS9b0fuXWJM3w1jPWF06LWrmGagSYEOsUsumeYeDd
	TrcDXtfoZCTE+KDRvrXG5HNHVw1oNY4STz327rzC0qyAr0wNrYLdikreCN9JhZOYlVlabh
	T/lS1yf09SubyOF7ux4YXh/aj0lzqMc=
X-MC-Unique: XPGbhdddNJ6x0kzj5owdZQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEVnXl4dangeuCCTWbhI5/sAdrpXi+bo4ei0g4k7Zyy6BZuxliLRGZd3S0oR3kzX2xfEmmGDYykb/+8FxrlWZnqoU02X905R4df7rKN/zrj5rhTMm0noAk5+8BkCoP2VcBOytaGKF+VHDfD2ZcpYraroXrXv2IsfOlRMA0L1R8Y7VKeWkYYvoDz4IMmkI8loJ0OXGxV4RrFYxpUoFfx4pUFHY6D6GxKNAJAe82wxE4fbIRK+zf2toyRl+eqqSGVFFOAMuS4WVdDLnfpoYSvJuMwJ/hGfyVJLFkuhcxvHRe24EZFeX40Eu0ou/QT6zB2w+W7IZ4Dicc4aFL9Kc39LhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hX/RP9X88cA+nkyIzwgkGoiOgzdc/4idb4/dybz09Wk=;
 b=JVP0CfIm51EQ8uscUZ5F2Loyy6ruubpNTw7KoDPp2FsxlxgY975dOBYEkNJ5s1Z0FwUdb/Bd71ZMasRRSlOI4d6faF07M/gVd21tQ7bsOzBe56TWQizI7sonu9ytolkOiJSmylI9ND2ykLAMA16MYtm5R2QkM80qnuMEh9xG9nOb+CFyG39PeaYSnDMnAzRnG6erMtxUAn+cFmOIgAwfmrKNqfR1476KvmpjXRGwXSMATMuAI4Z+N6YnPakhVTEqMoCSU+0r/NnxOiANoFFDekU16+Oh9A5hNpsR/IsjPiVWzi1mGQlpL7qnn19V7JsXFaQi9MyrKn+bcJc7DpTFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
 <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
 <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf072c09-1a71-5b95-76e6-d10c9c9d1cdf@suse.com>
Date: Mon, 13 Sep 2021 09:39:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0068.eurprd07.prod.outlook.com
 (2603:10a6:207:4::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c4caecf-fda8-4369-9409-08d97689a9e3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53265B236EAF729DEF51C155B3D99@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5P8b5timFjT3R0QAfDbUIR6IVdk3XlUVRuert0HG8nSbUMnz/Fy9xAFwL2XTi9KJgxR89mRogWDFff9pnVquehwRWB5gfw/nJ7uFoitP+CGzAzZrJj1/lOE1GyBC59Q7SeB9dzS9PyiZNEkZLbBYLjdQw5uaPTmsvyovqfvKHZ9xCwuvpE3up51hE1ZXXDTLS0PAI86XkGQrs1SrAYFjrdH+xiSzAjtw/R5xhLx/+QPJjN37VxlFEVR02QLzu6985MqvzryEZedULOqNrck06py5aRC4kmn40WO7RbqOOLUyIBM3UPnVTRnijWlbB6eTRlXPiF2E2jRTLPN408QFsWJHaU7c2eC+6xHg1M9dLDGP4jvUS1o29QF/w/8UuA7oVckTn0lztdL+Vyd9v8JVQfGhDnguufWka7iIPb5SrkvS5y2QzAwdXpMPru5n5w6ugzQOmvpnKUwjAaTJgJu7mjDitJwuUlHn42b37z/ds7MDk5v+zk/3aGH/lorHDLqwcaOG3mu9YjN1ZDihCglmT9u79bF2Bn8TsGlGHxH1KzUCkxffoV0rxoSCDq+19HUwLd7pJG30yVjDgqW2lCzMqf9gGzgzb83jGj6ep0gidM2XEcqNZowNVLPYsbDvl+dzKicxfjU3W83bgJy0Kks+6RxXbYivkKB16TWHTsffhvH0DcA2lr23zUl1hNZcT/lUXtyXytItdkEPnxvjXujMjMeOuHIMXHP6i5Vrzqbbu2kuN/rBQEt1BrjVZ1vAwDTu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(376002)(136003)(396003)(86362001)(37006003)(31696002)(6636002)(478600001)(956004)(2616005)(83380400001)(31686004)(53546011)(26005)(186003)(5660300002)(66556008)(66476007)(66946007)(54906003)(8936002)(6486002)(8676002)(316002)(16576012)(36756003)(38100700002)(4326008)(2906002)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXpvTmZOTUhzanllbXJLUDlvWUlXeE0wckNUOVpDZ2o1cHhlSk12WkRsYnI5?=
 =?utf-8?B?N0crT3dBWWphZEZpTDRyUlFNcWY0dERhVm1JUThabDZ4MXJqZUtobFlJV1o3?=
 =?utf-8?B?SmVhaTd0Z3FUd0ZRMlJHY2p1STEweEVlOVhaSys1MlBuMUluNXh5Zzl0bmg4?=
 =?utf-8?B?Q2xzM0phaVpCaklGbTRJZnFWalRwMDNnS21BUk53TUdTd3FEUlJ3Y3RjTDl1?=
 =?utf-8?B?UUdjZkM0R2hlOXQ2SWc2MjVCUVQyd1FFTnU5c2Zza0lSOVk0U2JHL3hwK0NC?=
 =?utf-8?B?Y29CbWJ3SXo4MHk4dnlhNUNjZllEZ3B4eG9YUnZHVjJWdSs5dENHaURDeFow?=
 =?utf-8?B?L0NRcU05VW43b2tSVlJTZUJrWGd3NkN5eElQcDR1bkp1SGYxbWk5YzBUQXBa?=
 =?utf-8?B?eW5RSDZES1hvWmhONCthcG92U2g0eGo2MlgvcSt0bEp0OHA0Ni84T1hka2Jn?=
 =?utf-8?B?WGdRSGsvYTRMQnlFbElKaldJVmczZkRrNldrRWYxODBNSE9VMDcyTTNFa2Qw?=
 =?utf-8?B?eVdqM01ySnlKY3hHazF3V1EyYkhyc1FnbUtJeVArSlY2bmpFTDFrZHE4ZkRl?=
 =?utf-8?B?T2VSaHBzdDJobmxtOTduenhEcmF1K25TZEFqVmFnNmx0UVc1bThQaVRQTVli?=
 =?utf-8?B?Kzd1U1E1OUNHUExmS0dXNWc2YTVZRzFoNkdTaWg5TDZ0ZlVFYzRvVjVWeFdm?=
 =?utf-8?B?a1ZzVmsxblgwMWZmc2RrTERUSi9LdlFhSzY2dEZRWUhVN2NZSnlRTENNYlJr?=
 =?utf-8?B?MkpVNVR6ZlN0dUtiTWlueUZyOGFDakRyM0JBbE92czQrQ3ZqYWQ3MEo5K1RI?=
 =?utf-8?B?ZElXYjJZOGZLeWdNN040OXl2ZUlsRlkxM3FNWHMyMEZZRnJ0SGxOcG9WeE1q?=
 =?utf-8?B?c0pVdmQ3OE1RT3VVei9pTzhRK3hPVHcyTE56eVBoYmFSK1ROczNUR0xXaEk2?=
 =?utf-8?B?UldNdWFEYk51ZCtKbWdqaTltOEJJS2JXYW12bHJEbjhHdmhKRnd5TU5sNE9q?=
 =?utf-8?B?L2xqZlcyNDhYYUk1RGRVM3FHVGV3V1BsU0hidDhQeFQwbGhnK1B0SXFZTm4x?=
 =?utf-8?B?V0hsa3Z3QjRJV0w3UHNTK2RUWkZtdkg3RjBvYUFuZE1rb0J3MjNJNDhCR0hO?=
 =?utf-8?B?YnYwYzZDVlNIL25NTHVqeGJPMUtSUkVXbXpEYlBnNW8rZGI3UDNWbGVSYWhw?=
 =?utf-8?B?Qm1zUFdRK2ZjRnhSRXdmTThJTUQrRlRVMWFyRW4xZWFmNVVDb2QvWFVtSlhz?=
 =?utf-8?B?NmpmbGc5NmRFb2pPMjk2akdaUFRWU0VqcFdOR3BjRUJpWkR1TTM2WjRFaDdG?=
 =?utf-8?B?eHNST0M4Tm80emE5NW5VUlZiWUNlUXIvL1psd1Z6THdnSjEzR0dpeGZuUU5W?=
 =?utf-8?B?VDltSDlrazVidnRuVXBOTHhTTU9pSHFZK3VQeFI4T2E1QmJ5UlpzMzU2dHFu?=
 =?utf-8?B?L0p4elIrTi9hRkR0YzlJaG1nR2NXTmhPaDdMcE4xVjdZNlRnem01dzVrTXc3?=
 =?utf-8?B?MFdsV1JWM3Y3cm8rNjFQeVN5UGQvamllcnBDcDRTWUIzdVZPT2N6TkFteThQ?=
 =?utf-8?B?azFTUkxWOHg4dWJjWVQ2Nk5QTnpTV3p2TU00NlRZSU1zY1RZdlNtODZZVzBs?=
 =?utf-8?B?SDZycVpTZ3g0RlFGMHlsSEMrOHlnWUZzR05XT2RXSEY1TVBadC9OQ0s3TnFS?=
 =?utf-8?B?ajNZS0wzVVlQMndveW1ZQW14Zkp5NmNXRnlKa0NTSnBsVXFNaUdQL2JXTkRw?=
 =?utf-8?Q?LEtYSXKxskqh5fbSwX0m5+2LxwhKA5Asar/4izT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4caecf-fda8-4369-9409-08d97689a9e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:39:48.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47cuR7nxBeBH3zKimenFpJwZyCr/OSSgI7pKCdhYK33QNZqilGPsVT78GgJUTKZJnBM/yj8mp8GxECEQRWIl6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 10.09.2021 15:46, Juergen Gross wrote:
> On 10.09.21 15:22, Jan Beulich wrote:
>> On 09.09.2021 08:27, Juergen Gross wrote:
>>> Today Xenstore is using one unstable interface to retrieve the state
>>> of a domain (existing, dying).
>>>
>>> In order to decouple Xenstore further from the hypervisor, a stable
>>> interface should be established. This new interface should cover the
>>> following functionality:
>>>
>>> - get the needed state of a domain (existing, dying)
>>> - get a unique identifier per domain telling Xenstore that a domid
>>>     has been reused (today Xenstore could in theory miss this)
>>> - provide a way to avoid having to get the state of all domains when
>>>     a state change of a domain has been signaled (there is only an event
>>>     "some domain has changed state" today: VIRQ_DOM_EXC)
>>>
>>> I'm suggesting the following hypervisor modifications:
>>>
>>> - Addition of a global 64 bit domain sequence counter. This counter
>>>     will be incremented each time a new domain is created.
>>> - Addition of a sequence count to struct domain. It will be set to
>>>     the value of the new global domain sequence counter when the domain
>>>     is being created.
>>
>> This looks like an "extended domain ID", which I think we want to
>> avoid unless exposure is extremely limited. Since we can't easily
>> predict what future usage this may have, I would suggest to seed the
>> global with a 15-bit (or wider) random value. I'd like to further
>> suggest considering to not have this be maintained by simply
>> incrementing, to make very clear to consumers that the actual value
>> has no other meaning. This could be done by multiplying by a random
>> odd number larger than 1 (determined at build or boot time). All we
>> want to guarantee is that numbers don't repeat (earlier than a 64-bit
>> value would wrap when linearly incremented).
> 
> Fine with me.
> 
>>
>>> - Addition of a global bitmap with one bit for each possible domid
>>>     (resulting in a 4 kB page). Each time the state of a domain is changed
>>>     (domain creation, shutdown, deletion) the related bit is set.
>>>     When the VIRQ_DOM_EXC event is being registered the bitmap is reset to
>>>     have the bits set for all existing domains.
>>
>> This page, as I understand from the subsequent item, is not intended
>> to be exposed to the domain running xenstored (or any other one)?
> 
> Correct.
> 
>>
>>> - Addition of a new stable hypercall ("get domain state") returning the
>>>     following information:
>>>     + domid of a domain having the bit set in above bitmap
>>>     + state of that domain (existing, dying)
>>>     + sequence count of that domain
>>>     The related bit is reset in the bitmap as a side effect of the call.
>>
>> What I'd like us to consider up front is whether xenstored is going
>> to remain only entity interested in this kind of information. The
>> entire design looks to leverage that there's only a single consumer
>> in the system.
> 
> Right. I'm just writing some RFC patches, and I have coded this
> interface to be usable only for the domain having VIRQ_DOM_EXC
> registered.
> 
> The alternative (IMO) would have been to expose the domain-state
> bitmap to Xenstore (and/or other interested parties).

Right, but then a simple bitmap wouldn't suffice, would it? What
would be the criteria to clear a bit there? All interested parties
would have to signal that they've observed the respective state
change.

Further, while - like you - I'd prefer to avoid sharing the bitmap,
the question remains whether such further interested parties are
conceivable.

>> I understand the caller would iterate over this hypercall. Is there
>> concern about this iteration never finishing, if e.g. a guest gets
>> rebooted quickly enough?
> 
> No. As a reboot will always include Xenstore activity, there is no
> chance for that to happen.

Is this really the case? I thought that was an implementation
aspect of the tool stack(s). Take an XTF test: For it to be run
(no drivers, no qemu) is it really necessary to fiddle with
Xenstore? If from an abstract pov it isn't, then the hypervisor
should not become dependent upon such. IMO, that is.

Apart from this - how would Xenstore activity prevent this loop
from becoming unbounded? Is this because you expect other
operations to be serialized with running this loop? If so, how
do you prevent starvation from this loop taking long?

Jan


