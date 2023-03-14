Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A746B9C28
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509760.786177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7s1-0004de-24; Tue, 14 Mar 2023 16:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509760.786177; Tue, 14 Mar 2023 16:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7s0-0004ai-VU; Tue, 14 Mar 2023 16:51:28 +0000
Received: by outflank-mailman (input) for mailman id 509760;
 Tue, 14 Mar 2023 16:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc7rz-0004aV-GT
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:51:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e54e64-c288-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:51:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7119.eurprd04.prod.outlook.com (2603:10a6:800:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 16:51:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:51:22 +0000
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
X-Inumbo-ID: 74e54e64-c288-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa+NG87FK0ZOTqlUbmvfwvgJ8f4KTZOY/Yyy8rOC34uBTAa7B1iRXAEoz/7sP8qylo/az5rCKgE8R7qrR6Hw0abuVLC0petqUvLMlh9MKz7WnyYZRXskuqUX18SGVgNPnZEWEl20n3tjpzryoIFZU8pPKJxX7AChj6lUY+/mpzKjTb1OwR9mr3yzNY0S0bQJK8Gw+eeudihOPQ9x1NwgSdaYNVLy0/zt37b4A7zR7nd/tNHvSzo5l9w1fT+3tcE6VudXPlZaCoo24KCmUiA7aZqe4ZpdUkTJUMUlWRSJpMgm34OnmlDTYOzh7Z4GsQd5ccyDdUtzed1h0PPOApcfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9bbwGVxemod56A7K+H+ymolx5Qk9ubg6kOAD9ibcZY=;
 b=J92okkjHe8oaGTw0lG7CpbNXdl392OIwZItkSoybjHNqTs1xt11vqMnAcKSJRapq1aSPip8X9pQVTRWUwnNX7u02UFVKYb9SV2i+q3p7olz3VAh5+UOHvIGZIzPAsPLJkMD3qO7TPTMVnd9Hmb1Morw6MAq/9DR5dIU6peU1fA3gXg//wjRVTaUs4J97HrlbRnsXd8C08GTGjDtfX81zabd8niSYj1iL1MQFrTbaAMksNKAer6ODLv32ZWd8V2JYK1S1F/dWaGNU7uiNqp6Yqj0sHphcyrfWT58Z3cj4uzfC/n8g+cYHh4r/MMbB7kZiOUnZOVlLlQsV+0+iM6sjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9bbwGVxemod56A7K+H+ymolx5Qk9ubg6kOAD9ibcZY=;
 b=PzTEfJWJ56qrqz9p5T5seUJxoN5x+Wtel1WanIcfAKwwPqzrFyEf9C81M0n9tkn2v/SWDAhXwg8uKUwy6WVeWwQk8JY9jTkFTtA82hfbV5IZ9Fz0J/yKCrQy5bXWA13Pqxp4QMHRIecAOVEgCnjwNe4EIaFd2LyNOv66o4vBgFPhveFalipzl00oGwjA4W2stacl33g0z4zk/X1Hcll5XrkjcCb2P3/ZmwXQnBVyLSv68gtqAaADUTBOguSvS38OHv9Mo3K6zxgakZOFfCmFmHuPSfpQkxXD4WAvkKc3BstbTQ2a+E6kLTy3NgWslCHozpY4ku62zuZGJXv171RBaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0237e12d-f306-8273-15e3-b0233747ac32@suse.com>
Date: Tue, 14 Mar 2023 17:51:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230314101331.4194-1-roger.pau@citrix.com>
 <d22fabea-5821-075d-07be-7e9378be1b5c@suse.com>
 <ZBB8ejEi4mBktBpb@Air-de-Roger>
 <69fdfa84-cec8-6e76-8b1a-ff4de835a908@suse.com>
 <ZBCiH+0wXvO98lEQ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBCiH+0wXvO98lEQ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 986b5df9-cff7-4160-5835-08db24ac577c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGwxgjhtKniBRG14Gewmyh0lcg0+Dp1BTuuF5DlNhHHWXgI/uSDtqbZ3k6JDIX4Mez++SFgif76ZG56HqPyIt2rdWC9tg3nPKHp+QiKl2PyRW8JcR+UcZqnREU4+S9URO8v+lPraAamSDn2a3OIyz0As3+CY6jnGP8mtmq/AKKfD4J8c9VTU4QpajUkxYerFPldR5yFRFDR+n9kvlA/LLjTk7csheONpId8pnzHNcrJE5ue3a/ay+M2oL8DhZgvTAi8PPXVCcmkV2w4nwUzRTi1b4GBslu4Jj7Zin3Cui+qh3Po/TXhezhefy6b8QqC/hhw8uSD7yhiAS4UFuQi3dMv/nKUoikpp+5bM53qZCCxS2mhOxTxZsf8O689DJk4tOcfbnluxgCD4lzOjf5glEFoi2plT5qnpAKnm2X73caiHvUT8Cq8XbyGD7WJbxN/7F54HqgLVi78w5U2Sj7v9ohvTx5x5cluAcYZhFpk2ZHC0tivY/GUtCnlHnUweqeSv63QMUAzVbvt7vr3nmtWCt02R3bRywvMIYFiHKbfIRRX1GDjhiC98+8lbqq8NxaGhkjQut4po+GAOs5V3qFTVIyOujKAWZl9q/cTyq8lxTiumQtMw94AYxRWhCbyIyN+jqLA8Yefi8JuYEcNR9AGnHnJSBppDEfsXZ6dndKZUwWDOQD7yvqKPkKnC9cyqYktXcHH9057aVLq++ynl+N7iHcyO1dZ6dKKXNY0g+IbpGUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(66899018)(31686004)(41300700001)(5660300002)(8936002)(2906002)(86362001)(38100700002)(31696002)(36756003)(478600001)(66476007)(6916009)(66556008)(8676002)(66946007)(6486002)(2616005)(4326008)(316002)(26005)(6512007)(83380400001)(186003)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFhOFYzMWFKbVNNYXM4N2IzdlcwQktEOUNWT1lPYXpQK29KM0l5cGp5Z3RX?=
 =?utf-8?B?RTB6SlJraTVXUGVyREo4bG1jZGJtQ1ZBSXNTWXlUbXY1dklwV01yN0lGejRi?=
 =?utf-8?B?cG5oMjl3NXhzT25JNEU4VzU4SkoxeWszNE9QN1MxMnIxZ01pN3BzQkRKbXov?=
 =?utf-8?B?dVNuZ0ExSWRLeE8rQ1lwdjM1OUM1NVVQYkdyTjVEbk9PaHZwT2Z0QURsNC9u?=
 =?utf-8?B?QW5SSmxhdG1sOXFCdEppSnNJYlNKRk1tMXNRZytvSW1hTWVSQi9hRzJIQlha?=
 =?utf-8?B?eGl4R3BMN1U2ejN1cXVJbzg1ZllJd1laNU1CTWo2cEVFQlJUa0wzOWg1OEFw?=
 =?utf-8?B?N1JURkw1akxYVVlZL1d0ZVRrbnA4akU1U2M4VDJvSDZkVWcvOVRrYldNMGFY?=
 =?utf-8?B?RFRkMmh2enJVQ3VmNk1aQS9MQWxzRS9oOGRuVmlsSEptcURWUlZmbjA2MHpw?=
 =?utf-8?B?RTRKN2V5NGhTc1dMSEM1K3ZEbHJRVFJtUDJqKzRxWnRkVmF4M2svZ0h3SFlv?=
 =?utf-8?B?NDV5azBodnUvZC9tOGxhL0tlbk11NkZDc3ZPRnhwSFR3dGtKNVdCVU1yRG5X?=
 =?utf-8?B?WFFER0lMV1FDbG5XUXc4bkZzaXBHU1JjQ1BML09CT2ozVlZCN0dCcGx3R1B2?=
 =?utf-8?B?TEd3QzBTVXlVVGZheXNtRitBNGlzK25wRW85TWNMcHE5WitLVEw3cG05YjA1?=
 =?utf-8?B?djhLRlNwbUdxdnBSOWJ4UkhONUdLNzI1UzFoYkgvMTFKOWxqdUJSVDFhYmJV?=
 =?utf-8?B?VW9iRnV3cWF4SkgyakRNTkRkcFdtMkd1Wm1ORDlBVlF1cFRCdEFLOGppbm93?=
 =?utf-8?B?NGVjSGtyMXdENnN0eWtMenhoTlRBUCtRYTJKUkRsOUczelRTMXhKWEtiVTVm?=
 =?utf-8?B?MXFwREdxekhuUkNqNUFJdGpoZ0ZIcWJ2YVZ2THNqc3VJM2Q1K3RBVm1ZellY?=
 =?utf-8?B?OEZEejFLR04vNVhWdDAxWWRCdm95ZHoxVXJJRzBUWVBKTFVOR1pzU3M5UFZB?=
 =?utf-8?B?UFFVbXlTQVdoMngyVDM0ZkRoaWhUYVlSdHNCd1YycS9HZzdMQ2MxZWZTUUlX?=
 =?utf-8?B?WUhWOStWMXQ0ZVBsb3FYQmdKU0JGdm4ra1I0aDFkTWw4YUg2SG9mUUpySEw1?=
 =?utf-8?B?VWxJTzJQLzFacC9nTjJ2cFlTY0JWTVE1WVU1dEZoNGlNMVJzaHhBRUFCZVVk?=
 =?utf-8?B?bXN0Q0lwQkg2MjdkWkxJaDlnV0I1RUM3UjJJbEVNS3kyY3NweU1VbUZjQzBI?=
 =?utf-8?B?dWtOeWVCU1FONTVDUUlVTGFaRzNpb0VGcjM5QWdMdFpIaHBjRmN5aldOc1pB?=
 =?utf-8?B?MVhveUNjUy9YU2F1VWVza2pyTTJBSlVMYWNXWU1iN2Z4UjR6YU9wMDRTSTRl?=
 =?utf-8?B?VTVaV1QvZmd0dVVjK0Rkclh5YjhKTjZwRmhKQ1I3a2dma0dwamRvU09NSEhp?=
 =?utf-8?B?bThwTTd5VDY1TFphT21LVDVIR2trZXBzMU9aTktIY2hCSzE5RkNaWDZObjNz?=
 =?utf-8?B?OHhJSUEwZG5yNkw3b2tWempHNWk5aGZyUXhiVm9BcnlxRllaRzB4OUU1Ykx0?=
 =?utf-8?B?elVDNVlMWnVwbUJNMVdrYnNKTzIrNEVrOTk1VEJHOGM4NDRmVFRWb3lDUVk1?=
 =?utf-8?B?VVg2L0RtbDNaby9WcTZjaThNR09JNnB3dW1sZjVHQmlyNFluTjJEbVVaMDRK?=
 =?utf-8?B?NmRlZUR5SDJsb0pNcGRub1l4dkkvSS9Sd3ZhN25IZnZGODBuQUZKWENPRUk2?=
 =?utf-8?B?WkFOR2NUejd3RmRGVjJrelg0b2dId3liZUdqZzB4djdrQVJTNXJ4cnBrc1JU?=
 =?utf-8?B?R1JtTjlzazFSNmUrVUJjZGNOaUNLdDBhNXl4M1Nsd2Z3ODJWV2twa0t3aGxO?=
 =?utf-8?B?ZWljclI4YmhVK1FzNGx2Z2NxRnV5L1IyL1NhdWVBKzFiRy82eFBkZXVLNUla?=
 =?utf-8?B?NFF2VFROcldoSGVDSUQyODEwV1Z4UVJRWnR0OHFqSEU5RXNVRVNaREpIU0sz?=
 =?utf-8?B?eCtIUWMxM0xFYXBlRmZFWUxBbm55Z0RPK3NFcnkvQWl1ZDdNRkRDcURvdU8w?=
 =?utf-8?B?dm1yRTRDVXppYmhNNTVuNmdSYUFXaHovTjlpYkkrRGhXcUxiU0p1OG1KMWFM?=
 =?utf-8?Q?uXGqd+JjDV4rYkKxsXkok9Ysz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986b5df9-cff7-4160-5835-08db24ac577c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:51:22.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVGBA/yv9r/PCaN1pWFaz4bXzhAZeuid9PYnwkUA/EE+q4m2/rD7ewyRVtioe7S8yw17ksmQVm7Y3SYm2jzVDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7119

On 14.03.2023 17:34, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 04:46:19PM +0100, Jan Beulich wrote:
>> On 14.03.2023 14:54, Roger Pau Monné wrote:
>>> On Tue, Mar 14, 2023 at 12:56:33PM +0100, Jan Beulich wrote:
>>>> On 14.03.2023 11:13, Roger Pau Monne wrote:
>>>> I'm also concerned of misaligned accesses: While we can't keep the
>>>> guest from doing such on pages we don't intercept, depending on the kind
>>>> of anomalies such may cause the effects there may be contained to that
>>>> guest. When doing the accesses from the hypervisor, bad effects could
>>>> affect the entire system. (FTAOD I don't mean to constrain guests, but I
>>>> do think we need to consider splitting misaligned accesses.)
>>>
>>> I was also wondering about misaligned accesses.  Should be allow dom0
>>> any kind of access, while limiting domUs to aligned only?
>>
>> I guess the code would be simpler we we treated both equally. As said,
>> my goal is not to refuse misaligned accesses, but to break them up. To
>> keep things simple we might even use purely byte accesses (and then
>> perhaps simply REP MOVSB). Special casing Dom0 would only add code for
>> no real gain.
> 
> Hm, I would be worried about then breaking the requirement of some
> registers being accessed using a specific size, but again we are
> dealing with misaligned accesses to a region that shouldn't contain
> registers in the first place.

Well, you name it: We're talking about a specific-width access which
at the same is misaligned. That doesn't sound very likely, and imo
wants caring about the earliest when such a case actually arises.

> FWIW, the device I currently have that has registers in the same page
> as the MSIX and the PBA tables is fine with limiting such accesses to
> aligned only.
> 
> What is it that worries you about Xen relying unaligned accesses
> instead of just the domain itself doing it on any other BAR MMIO it
> has directly mapped into the p2m?  Any error generated by the device
> in such setup would likely have the same effect, regardless of whether
> the access is in Xen or domain context.

It's more that doing this in Xen doesn't feel well. If I should provide
a contrived scenario, I'd point at #MC potentially being raised for
such an access. If further we'd assume we had better machine check
handling, then dealing with #MC coming from a guest can be expected to
be more likely to keep the host alive than if the #MC was raised in Xen
(and e.g. - didn't check here - possibly with some lock held).

Jan

