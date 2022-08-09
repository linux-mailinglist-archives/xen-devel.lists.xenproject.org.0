Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523F58D3B5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 08:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382781.617811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLIfe-0000Z7-84; Tue, 09 Aug 2022 06:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382781.617811; Tue, 09 Aug 2022 06:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLIfe-0000XJ-52; Tue, 09 Aug 2022 06:24:54 +0000
Received: by outflank-mailman (input) for mailman id 382781;
 Tue, 09 Aug 2022 06:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLIfd-0000XD-5r
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 06:24:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60074.outbound.protection.outlook.com [40.107.6.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f55a73f7-17ab-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 08:24:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5781.eurprd04.prod.outlook.com (2603:10a6:20b:ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 06:24:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 06:24:47 +0000
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
X-Inumbo-ID: f55a73f7-17ab-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtNktvMEMN3G2NSsJw6e0G5xuzHsf1g8ejQN6YVULUml/UmacyG38GOWBP7mUaBqF925mw7F0GMI9iPeqgKaVxOUqaXOFvNuJcAjpiKcdeTR+S7NWfmGmsmUi4LYsF77zt+y1X26ztgRebgS3JPRVleGhJeSR7qnvIJCQF7VFhRtzkX5Req+wpZSEQJEtwyOncPkjtukytRVsTwkEmCXiqV17HXYvXbMfOZTZBtrKXLP1UEYQySOWatRF7ozErrZo6HBiLddbbeAQo0+9xPlDIBmLJF6U5ejPQv7b1SUbaa6ibPZV6cV9Fn8fW8HLl9JVb1JbYjbMMnr2wx1emlzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3I7wrC6uIm93pblMo/mskVh2+IQUPsBt+7EVIrcxyI=;
 b=OlakdCmAMIdMvnetFM227FCrbPdAwLr9f6kBQqo/NLYTv0nXjGus2bKjz+ntPKS5X2/oKklxkxI/AI5pn9shHRr9J0YoOAlkwgtMVZsOZgX2hsvdNeLev+31FVGDodmpNnORColjVqmm4WoO5e7sySGobFWg3UmPtBvaw3YJTnGodjgdwKYInKsAij0uybETS836SbATC89IiRGj56U4cRtslN8UogmhgIh8k5lQYfTzo23UxLfcmOpun0Vpzn5kPIcGJ9CVEN/CDbOXbL/EUoITzprm0mPZMRumSgaDMQWrfpnaXns16jvB6N4mNDy+TAavv3ZutMX+3KhE8GLUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3I7wrC6uIm93pblMo/mskVh2+IQUPsBt+7EVIrcxyI=;
 b=DpoLdXGJ01uhsmUCnPzvzhHxTh1jHOTJi4RwBlDWuNd0XzvCAr/rInvhVMEl1dE48uZCJMxan/d3ZTmG5/Hoqo7O/WYY4Eg72nYEsaxdOrgUV9zgPEinMvvfCvWwDqJ4S5r1fySlJ2dGB6r9MC9JGi9EPg1nyvm2LNqwnJoqW4wnxDBrVY9Aoy0Ie1LmzseTEYWGBNkTA9Bf/w9ltcaE1yQdg//W/dFadRHIPpUS20ACX9uiQNKIDd45ZiDgJLexxXtKRRGwOe3uSvFQHwTtfxAR9L5MUkNpZn9q1U/CAFFV0DsbMwl+HKOJ+ORwNthiimT3BbusHbQg7iihXoSWpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <950ad8d2-93be-dada-131f-1c2757c2f125@suse.com>
Date: Tue, 9 Aug 2022 08:24:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 09/10] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <dcbe3f53bd6d88fbf2a20970d4fdfe93479a5f59.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e98ca967-8ae5-3aad-6449-c3689e88bbe8@suse.com> <Yu08ItSlvtqALMvS@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yu08ItSlvtqALMvS@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e251ca00-0155-4109-8377-08da79cfdb90
X-MS-TrafficTypeDiagnostic: AM6PR04MB5781:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jQEDT6QaCtB/5RiCt/eT6bDcyfrfIX/IBQvfPlmV6QKkzNvUYchHLIlX3EgViBHmfTLjLtIRkeJhLlgUrS9YAtszPbOl8W+tRS1RpB8oQe2RwxsnTt3pjAgi13HBKaNOKqOfW2b7nT0PjeKjutc3yjz45Eco2f3W/p5yq3Xw/WwQUEveC/IMWLKa/wro//H5rbKt5Ol7CZDoRKxx244MloKVeUMHyQ5WSLfRYVK2VPqrAf1eL7VZNrknDRRhuqU3dqSags2WgKA7IktECd89289c36OkTbp018hsxF8bECR7lXWvlnNjR8y46FZZcEibdF69e5lhqGhacf9yZj/T8ypG7sNT0mnwm9WnadVrgwY91TZP0bhcvhXWU5iV6Gk9nloPWN9PhhMnfwKWgioJ9pBmUlz7tBYeM62lpA4bXHEvxZhmgTX2Doomd6LIp/IZxoxCfryl/ZZ8U42o30A1vwKQYh2dAni4R8uY3alJuu/U7uhv/YVI/Z47XkTgaGeiXANYaY3PBW8pcyWyC2e0EvRd5wArJnCcaN8Y/kCQ6ER3gnA1rg1dlaAE7xkFlNdUBLqcYKzZJwUayoB2nXoVjX4kF5A3TGHe0ZUGJF2bwO70go5yfaPxdqsVBebRLBx/OxCrM4W4oyI1TDpjBzDjjNmC0Dh8bF5cLPNWxwDSlS+7RPKt8lamFl+GDgDTFFnqqxcy/SamvdmZ3CoSG5wequgqCqWJTfIVzEC1Nrpgycrj8sMuTJpEMlON5LaHJRm5XDJUChndMkq9GzaUgdVhRF8R8Qq/FIBUkurbijCq9l0kwjkmDIIvO1nNSb0Mz9ZU1FL503yjCKHXmBEptM0BIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(39860400002)(376002)(136003)(31696002)(86362001)(36756003)(31686004)(26005)(53546011)(6512007)(6506007)(83380400001)(2616005)(66574015)(186003)(41300700001)(6916009)(316002)(54906003)(478600001)(6486002)(8676002)(4326008)(66946007)(66476007)(66556008)(8936002)(38100700002)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXo5VklqVVNxWEoxNlJtTmF2bFhGbmVzZ2VnRy9sNkVKN2FRVEFkaWRWTC9m?=
 =?utf-8?B?MEo5bEVkZlRTcXNiMWlxYUptcEZXVldiU0ZGZXdJZFB4NW45cHRoUXJsSWxN?=
 =?utf-8?B?RzdkTkNzWUZHWlBNWkVmL010VXNCVU9RdTNhRWxtU2p0UlNsM0xCVXByLzA4?=
 =?utf-8?B?aFdSR3ptaWRUK0JwM0NxaUhqZWZZc3B1Njdmd2Mrb1FuMkJLMWUzalR3M2xR?=
 =?utf-8?B?bFJkRUpXeElLL245WUNVamRmNlhDdkdXcjFjMzhoY2NBQkZ6V2NFTDNtYStR?=
 =?utf-8?B?RkpJT01WQnVTalFhVjl6UGVLRXVJcWRWeXI4SDZQeXBGQWErK2p0Qk1GSThy?=
 =?utf-8?B?b0ExeDhPdjR5dXZPVEh3ZlJBTzNManpvYWEvdDlSbnRDaTJMYkNobUV4THAr?=
 =?utf-8?B?QmhQK1VjT3ByeHBRWGxVeHE5b3VxYVNqTm5JMXJHZVFwZGEreitoS2E3cEZh?=
 =?utf-8?B?MzBRUm9pb3hDMlRZZm02OVhzc3IxdGI1M0QxcFVTaXRwK1JiS1A4ZFVnajZQ?=
 =?utf-8?B?Y0hyQXhrS1dvU0RaMCt6RGhBZUNhMWJmNE00QmppRk1rODY5SXJkdlFVdzRv?=
 =?utf-8?B?eTIvVCtZR1dtWjErU0dOcjViaEUwUTJra2VacXZYYWw0cWNlUEM1bVd6MndM?=
 =?utf-8?B?WDJHd2RjbFd1N1pScEhiSEJrckFIamJ4dmNUcGRDS1Y1b3d2cEx4aTBBdldj?=
 =?utf-8?B?THJaV1Z3WmtyTHF4a1o2MjZsWkFSWFh6Rmh3UGxyNmZsTHdZNGNmbE44S0ZC?=
 =?utf-8?B?L0s5OWprQWF3OGdXbzNVZSsrT3VsR1dtTUVrS0pwcVpZbUgzN2VNOHJlT0VG?=
 =?utf-8?B?U0dFckh4SU5JUFgyMFNWSlYvUng5NjlMZ290Q3ZnMHJQZStmRm9QbjBFSElP?=
 =?utf-8?B?YnpPcG51OSsyK1c4azl4RmVWdW9JaFBQRmMrcTMzR00zTVVzVlliZm8xKzZm?=
 =?utf-8?B?Sks4alE1K3gzR3ZqY2kxYVRsa29IOGEwN2JRN0oxSlRJZGhEcWFQS3F6Mnpi?=
 =?utf-8?B?SzBvelJ5WWM3Tmpxa0piUHhqRTdBMVd5ZEdLSFp3Q04rNzZkaHhUYUdmSDRY?=
 =?utf-8?B?cEU0UHNDbU13UDlQbzVqSElZVC9rZHMrT1B1VzFiTzEwQ1crRnhCV1FWd3Rq?=
 =?utf-8?B?VDZRNjFpSFJwZjNad0JxTW9lejFHdmFvbnRrcGxRaGFtMzBsdjFPRXJzcDdZ?=
 =?utf-8?B?QjIwZW5ORnN0Y1Q4Nyt0QkJHOG1DRVNMTEhucEtad0JGSU1ueUZqdmhyemEr?=
 =?utf-8?B?R1Erd1lhamJpekUxdFFNV2JNSVpMU3Y2R1RVZWJvZ05SN21nOXc0QVh1b0U5?=
 =?utf-8?B?OUxLcGQ5VFpzVlZmWlVNYXAxZkVHRW5JbmRWWG40NjNrRE5BL04wYlo4eVls?=
 =?utf-8?B?WWU5SWd0cmZYc01ROFV5MlZNWVNVOWg2dHhSUTdkd21oK3FqZzBFMmdlbzdN?=
 =?utf-8?B?dzhXVnAvckd6S01hazFCQmUrZXJlaVJmL3ZwMjhtN3A4T3R0Uy9lajNOT1ZI?=
 =?utf-8?B?bSt2WE1JRzM4bmlENThLelZ0R0FVMGM1Q0NsK2x2REpOSnU1R0F3SVJETmxP?=
 =?utf-8?B?ZUdsK1pnUm42dlNBWUZIb01pcGtza05Lenk3MmgyTWlNT2dTV3VITS9PdXZZ?=
 =?utf-8?B?eWhsZlhrT0QzRkdtVit0RDFJUmtJNVhCbDM4T3QwSnVFUmxxN1ZFVElydmhP?=
 =?utf-8?B?RlRXdENiTU5HOTVGVmhVQWFETHpUbDlyTUZzeFdOTnFFNG1Bb0hRcmZzdlFn?=
 =?utf-8?B?azYzbE85OGhoR3NJRmZMMEd6cXArQkpaUFREeXpiNytFdWZ5akV1RGdhekJp?=
 =?utf-8?B?ZHZhMGIxWURrbDc3bkY4RjlCN1VVNjhqR0RTTitZNVlzc0NncFdpWVRtMEFj?=
 =?utf-8?B?RkwyTDFPd0RnRVF0LzRxN2ZTbmtoclFINUdaTUN6K0RVMWkxZVliZ2F5Y1JD?=
 =?utf-8?B?UzVCWmN1SlVQVExvZVBqdkV6Z3Z4RVNiNE5rM0dZQ0hmTEVBWFpmaGdTZ2k1?=
 =?utf-8?B?UG9QL1QwalNZUCtpTDh1Nm5zZmM5WThrRE92S3p4SEk5RkpLSUlzMUwvd3Ja?=
 =?utf-8?B?cW1iTHRXSVpubG9aajVPam11YmNOYmRQRXZnOWc3OHQxbDNtQVFQOWJpTDI4?=
 =?utf-8?Q?Os8ws1AlVO2FN5r2eX7Kene+v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e251ca00-0155-4109-8377-08da79cfdb90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 06:24:47.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUpkBj/ZXFLAVgSuoKRa+OtN6orqmFpUvdPMibsi035TLAIqggqhDdOkrLjuqhwtgqqHyjgelYhpls5ZSdhMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5781

On 05.08.2022 17:49, Marek Marczykowski-Górecki wrote:
> On Fri, Aug 05, 2022 at 10:15:59AM +0200, Jan Beulich wrote:
>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>> That's possible, because the capability was designed specifically to
>>> allow separate driver handle it, in parallel to unmodified xhci driver
>>> (separate set of registers, pretending the port is "disconnected" for
>>> the main xhci driver etc). It works with Linux dom0, although requires
>>> an awful hack - re-enabling bus mastering behind dom0's backs.
>>
>> Which is one of the main reasons why I view DomU exposure as
>> going too far, despite recognizing the argument that this would only
>> be done if that DomU is fully trusted.
>>
>> Furthermore - what's the effect of this? It would seem to me that
>> while bus mastering is off, the device will not function. What happens
>> to output occurring during that time window? 
> 
> If no reset happens, the controller will continue sending the data after
> bus mastering is enabled back - no data lost in this case. If reset does
> happen, data that was already handed off to the controller (TRB queued)
> but not sent yet, is lost. But data that is still queued only in the
> work_ring, will be sent after controller is re-initialized. I did
> several tests of this, and I have not noticed any data loss in practice.
> 
>> Rather than needing to
>> re-enable bus mastering behind the owning domain's back, can't the
>> disabling of bus mastering be avoided in the driver there?
> 
> Linux disables bus mastering when PCI devices are enumerated (before
> xhci driver is loaded at all), and enables it back only when xhci driver
> tells it so. So, if xhci driver in dom0 is blacklisted (which is the
> case in qubes by default...), the console would be much less useful, so
> to say. And I don't think Linux maintainers will appreciate xen-xhci-dbc
> specific code in core PCI handling...
> It isn't an issue for EHCI driver, because EHCI debug port
> interface does not seem to use DMA.
> 
>>  As we can
>> see from the EHCI driver, there certainly can be communication
>> between Xen and Dom0 for functionality-impacting operations Dom0
>> might perform (there it's a device reset iirc).
> 
> Yes, I can see how controller reset can be coordinated this way. But
> also, I see it more like a future improvement if it deemed to be
> necessary, than a strict requirement, as the controller reset is a quick
> event that in practice does not impact the functionality in any
> significant way (with the current code shape). On the other hand, adding
> such synchronization feels like several more iterations of this
> series...
> 
> And BTW, if Linux crashes in the middle of controller reset, with such
> synchronization you would not get the crash message at all. While
> admittedly such issue is rather unlikely, I see it as a potential
> downside of coordination here (you could still avoid it by
> `share=none`/`share=no`, with all its consequences).
> 
> Generally, what would be your minimal acceptable version? If support for
> sharing the controller with a domain (including dom0) requires
> significantly more work to be accepted, I'd much prefer to drop it in
> this series and have it possibly introduced later (and in the meantime,
> possibly carry as a downstream patch). Unfortunately, I have limited
> time to work on the series, but also, I think having this feature
> upstream - even in partial form - will be very useful for many Xen users
> and developers. Especially, I'd like this series (in some shape) to be
> included in Xen 4.17.

I think I could agree with such logic as a temporary measure, i.e. marked
clearly with a FIXME: or alike. The Kconfig option then also would want
marking "experimental" (or maybe it already is).

>>> @@ -1005,10 +1050,32 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>>>      init_timer(&uart->timer, dbc_uart_poll, port, 0);
>>>      set_timer(&uart->timer, NOW() + MILLISECS(1));
>>>  
>>> -    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
>>> -        printk(XENLOG_WARNING
>>> -               "Failed to mark read-only %pp used for XHCI console\n",
>>> -               &uart->dbc.sbdf);
>>> +    switch ( uart->dbc.share )
>>> +    {
>>> +    case XHCI_SHARE_NONE:
>>> +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
>>> +            printk(XENLOG_WARNING
>>> +                   "Failed to mark read-only %pp used for XHCI console\n",
>>> +                   &uart->dbc.sbdf);
>>> +        break;
>>> +    case XHCI_SHARE_HWDOM:
>>> +        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
>>> +            printk(XENLOG_WARNING
>>> +                   "Failed to hide %pp used for XHCI console\n",
>>> +                   &uart->dbc.sbdf);
>>> +        break;
>>> +    case XHCI_SHARE_ANY:
>>> +        /* Do not hide. */
>>> +        break;
>>> +    }
>>> +#ifdef CONFIG_X86
>>> +    if ( rangeset_add_range(mmio_ro_ranges,
>>> +                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
>>> +                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
>>> +                       sizeof(*uart->dbc.dbc_reg)) - 1) )
>>> +        printk(XENLOG_INFO
>>> +               "Error while adding MMIO range of device to mmio_ro_ranges\n");
>>
>> How can this allow use of the device by a domain? Is there some sort of
>> guarantee that nothing else will live in the same 4k range? I can't
>> infer such from xhci_find_dbc().
> 
> That's a very good question. From what I see, it lives on a page
> together with other extended capabilities (but nothing else). Most of
> registers in other capabilities are read-only, but there are some
> read-write. It seems Linux driver works fine without writing to any of
> them, but it sounds very fragile...
> 
> The main reason for this code is to prevent Linux initializing DbC for
> itself. But AFAIK Linux does not do it on its own, it requires explicit
> action from the system admin (a write to sysfs or kernel option).
> I'm not exactly sure what will happen if Linux will try to use DbC too,
> my guess is either Xen console will stall, or they will fight each other
> by re-initializing DbC over and over. Neither of them look appealing...
> 
> Would you prefer to drop this part, in favor of documenting it's the
> system admin responsibility to prevent Linux from using it? In that
> case, I think the default should remain `share=no` (possibly changing
> only after implementing some coordination with Linux side).

No, quite the other way around - it being there makes Xen's use safe,
at the risk of breaking Dom0 (or, for your purposes, DomU) functionality.
The latter, if necessary, would imo need restoring by way of emulating
all write accesses to the page.

Jan

