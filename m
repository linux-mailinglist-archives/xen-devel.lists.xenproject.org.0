Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C909637763
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 12:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447925.704574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyADL-0000cJ-Pp; Thu, 24 Nov 2022 11:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447925.704574; Thu, 24 Nov 2022 11:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyADL-0000ZS-MB; Thu, 24 Nov 2022 11:16:19 +0000
Received: by outflank-mailman (input) for mailman id 447925;
 Thu, 24 Nov 2022 11:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fS9R=3Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oyADK-0000ZM-Va
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 11:16:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0b6ef8-6be9-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 12:16:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6905.eurprd04.prod.outlook.com (2603:10a6:10:113::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 11:16:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 11:16:15 +0000
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
X-Inumbo-ID: 6a0b6ef8-6be9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dunz+1tp/+zkCW7g90RJH7LIJ3/zvUMjvIw0n/wB4EfSy73wXrkcqP4OBvYwu57rhHGfWSzx26rmDmL+4oX7iD4INm7lGf7AQpyo5dowzmbljkFDgn5plRvRu7JrkL6I9s79MXUStzj81vTRlCSx8zVTxFX8lAa0TLIYZyigUqR8Y/dxKmJQBuEoELLKat3qmlHya7H6Rqx+yk6L8r83OYO8nMIC9aOHaZQtL33V8W5BKJvBKs8Al67bugHvFpuRysLxnggmkkcRfbhjynU3kDQABYWr3yZpxx2y3SDDhdF4YhBHbdr3aiqbKubdUxpe3IZ5sdi2WDpFzU/LzYIlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYLvJv8c1QzvbrN7mngdJKjyEXMyfKc3fLzObNB1AIU=;
 b=BrNBe32/f9gCum3QvokiO6WnF8CzRe+NOv3fCxQtapEGCwsq89NgArZW0w6ZN07koEE4fCoSXRbLFF+R43ivYW3dwk+gPgWeexxMFZ1Z560OH0RdzDa/yGzIlzcZ8PykzXQAf2QheZZ9IjlAJJCx95CWpcjrk6VCv6+1cGIp83lmfT/AFDJesvjVlQjG4RlXVrwT8olx2e7YziaiHDndr5q+puHvb+HZVF+9EMZuh4VMGBib7T/snww0+q3efhvJgRBsjIx+S4HuVI5LNP+SRUAvzbxffM/DEPrzdfUYIOs/tCLVn0UnbtbQeW25+Ri94W0NWTvhHyohZQQPEnJdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYLvJv8c1QzvbrN7mngdJKjyEXMyfKc3fLzObNB1AIU=;
 b=GzmufkjqG6KI9satukWBpBQyfjzeowCov4u036QT9AAo4DorEyepTRbg47KfrD1DbMz8Qybv8iTtP1zaJ2RRgnLjOI/QBunK0Q3eaIvBAFMn2G+cwPmC/7oNVqXhFktOIv/xeiEiRC5uCiNaKIx+mkTQrDXibcS6k7C7tvcSC94CkKgsDWRtkEoCdpRFC//MrTBBX7+aDaAbWwLszlFcIHxpxgD8gd4DC+9zk0A29huziTG1cOI2SCJ5MdVlIQ53MvLMWvCW0DcPvsH1FFB+FUwsDiPWRBSBguXlQ8GlxaypeuCANVGII8oNZfntTL8DAExHcXIAjrbal2fiHabYaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f3bced7-62e8-4ff2-655d-aed222f343a9@suse.com>
Date: Thu, 24 Nov 2022 12:16:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger> <Y38z/h4aEkzh5rCG@Air-de-Roger>
 <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
 <Y386hoiAovoACjEG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y386hoiAovoACjEG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e79c7f-9499-475a-cdbd-08dace0d4d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+o8QJJV1pGh3lUEUQd6MUU79wDOTNiiwyVU/+kOi6JMBZ0K5myMKJIWMZ5HFbfo2G480p131zxbw69tauER2StoReb2AI0giXfJGF6xXkdiPUiCrnIDtRmZQocoSMmsJK8UOcoc8VXNPI8IrlakphR2X7JnOCzn9E72re0xxToX4cOspKSzC3XzWSU2crAu/80Nlm/zZoliP3zG5ljwY7JFLBPGgT6ReS4ayEqKBapOAMrNL6JPqB/LBYSD6jATAVCnPtnYqX54rvdY806FLorGgDcEB23wn5w4G5TQ0XeAOHyr6yMxrgY4CDyuEAI7yYaY61B8wwlSor0+cX6LGsJhevfETccif4ptBSggO2fSheHvS6vgZ5y/eijO9JJdp5XXWLN7gr+wHqIs8xUJH/loGszZrwP0jQ4iPdGtMBUIqTs2EKJsOOYELv9AViYxjkMwIHBCUGxz30cCRG4ssnkJjeDGZi8n5E5gxvPhBBfdsqlobUo6lnXfna7EOc6HwwRZC0UfU5UzSuEkshM+jO7nFklJpzcT2kHrXpocVOEyWjEBU0YWkaA/0qmPBWV2s4e8qwzza9YtbjrPzc4b9EhxlA1guC5UNWInhzwNDGWhA2fqvV+PlHoW//4oVAkHDnnhvnGhbmMpJHM8x2f5vWIw/pqZLekcCBdV7Ha/HLrJL9O3GgMjlKRtFFr+Y1c5DpU64MysmW4eri5wGM4WlrnYQPHLWTSjgWwg0+ZwetWddVZlVOIEwLiPg906R4AlfW7YCH1CIcifvMFELneJ8bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199015)(316002)(6916009)(966005)(6486002)(66899015)(54906003)(31686004)(53546011)(26005)(6506007)(6512007)(4326008)(66946007)(8676002)(478600001)(66556008)(66476007)(5660300002)(186003)(8936002)(83380400001)(36756003)(2616005)(41300700001)(2906002)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVVEMUdlV3FjNldndElUSnA2c0tQNGQzcmFla3RRaVhXa1JidzJQTndZQ1dn?=
 =?utf-8?B?TU9CdVdFczN2WVlCblRhSHpmaDh4dXNjcytlWFlHN0Z2aWpCdFczMkc4NFBs?=
 =?utf-8?B?eGxuUmlqQjNPVmVHK0pKNGdIOFE3eHk1Nmxqdm5FVStGVTl2UmpxNDJNaUI3?=
 =?utf-8?B?dmswYitOck5HcDhhd1FZd3RZY2t2Q1ZPZHYrMmlWN2wvOFU0T1MrenRNRVRN?=
 =?utf-8?B?U0IyZkJaWGU1UDlkcDRlRC9LYzAzamdrUnlMNzUwazRlZzVUUnI3ZDc2Nmly?=
 =?utf-8?B?N2dYUjNYU3RMKzdKNDlvQW00NDRVdDFKNElaM0FpQlFieFhuS0RNcmNDd01C?=
 =?utf-8?B?L2RiYlcxMmpjQjQrMSszZGo1MTc3WFltcXlLMWdVM0M4QmNsc0h4bHRiRTht?=
 =?utf-8?B?MlFxK0p2c3pyYW8wM2Vrd3c4RW1pSHUzRVY4cVNBVTVnVy9kVDJYaEprUEVp?=
 =?utf-8?B?SEV6Umo5Q2FZc2xNelkrSng2K01xenY5L09aZDdIMFZKbldCVmJYR3lkajZT?=
 =?utf-8?B?bk13MTRBbk1VSHlEM0xlVXhvb0lVUVdvdDA3andGdGVKcVlwYW9KTVQ3YlJz?=
 =?utf-8?B?bHF0bVgzQ0diVEs5RGliVmNyTk04dVE0QXVJSDVlcjFlcmJrVlRPL0lNbFRG?=
 =?utf-8?B?cnRuVWkwVmtsMERlcHpuYkl0T2JmS0tpUUJVcyt2Wjdla2JNVnVCOE5jbW9z?=
 =?utf-8?B?VzV5Y2xnSC9NQWVpR3ViN1BUc2VFWXhlRGlFVEp3bUVlRHdmaHJKMXBWRi90?=
 =?utf-8?B?VEl2VWFUSHFEcEViMEVLQURIdTN4azA0dFZFMVpJRDNYMytIdmNpbTR3SDdp?=
 =?utf-8?B?eFpxSW0ra1lTbU1xRkptb3psNDBMUXR5S25Ca3pEN1dFbmo5RURIRjJIV2tI?=
 =?utf-8?B?U3lHMjVHNDVDMkVJUnJmU09HSFN0c3VFTHlMQmE4THZoa1Jhcy80aXpidEov?=
 =?utf-8?B?bnJacDY2RUZLTmF3RG5SOUhNci9ESVpkVXZlUTJYLzZ1bUVUNnZtbHFuUjZs?=
 =?utf-8?B?MUlFZUs1bkNFUzF4S1laNjJ2R0lYRzlmb1NQeUM1Z1l1QTdPanFIci9FdU1X?=
 =?utf-8?B?VDFMNWlldlB4QUJjN3E4amdSdDBqZmhrTGlWU0RvUlk5WnFjOVc4N1Z4Wko3?=
 =?utf-8?B?SFQ5elRDMUE0WGpjWTFaYUtxS3BHemUveVpMc2tmaytZMjZZeWhsdWtLZ2pj?=
 =?utf-8?B?SDdxYmtzd1ZPWjR1V1VBS0I5cTkzY2JZWEs0cjAyM09mV21waUNvM01HUjJq?=
 =?utf-8?B?SnBNYmVzbmZkcFVOa25kMzljbStRTi9sUG5ucUVVYm1zK1RxSm9TbERqTkVY?=
 =?utf-8?B?aGpibE9ZRXd2TW9ybFVQRXp1TmtqQ1NRelhBemF0NE5naUVrQVI4OGtiUFZQ?=
 =?utf-8?B?V0k3MDRJQmtLQ2pMTkl6bTdtMlpBNmlFbkJqSWJpbWZ3dGlsazd3bnRPMjdQ?=
 =?utf-8?B?SlNZQjIwRllhZUJHNU1jZkNhdUNyTVVrRXhkY2ZKZkpnSVRjMUhLNlRZZ3da?=
 =?utf-8?B?NG9ZcVdBTEdUai84QVQvVFlkOE0vOTdXOG1URUh6RmI2Qml2c1J4Ylgzc1cx?=
 =?utf-8?B?Y3ZYMHBoelllQk5XdUtrZjZIeGxMZWpPWDBjYm9SUUdKVDBXQS82WmdDSk5K?=
 =?utf-8?B?VHhCYXExVkNHMkh3bkpQMi9nSXI0L29MUGRUeFdzekN6SDBLak9PUmZDRDkx?=
 =?utf-8?B?QUk1T3lGMGxqak81ZndweEhHR3VNOS9JajRIOUlUQ1RpVmtScENiZDB6bmlD?=
 =?utf-8?B?bE1reXpCbG1ISDRQUVRLVFJIVlB4clpWUlhkTFhSeWFKOEdQZmtxMW5DOEFD?=
 =?utf-8?B?M2JnRTArWkVDSUJVS2FFTlBwN05VcWRvY1NOWnIrNjZpSmtEU04zUktObWlR?=
 =?utf-8?B?VXg0QXpMVVBFbjRQemc0a2xEdjkvTGN3MWpqanVVRXdiWkt1bHJaaG1DVjBk?=
 =?utf-8?B?SUxFbTVJc1FnT09aYTlGWDM3ZFc3cTNjR1JxT3hvZCtlYkxDU2ViWDRveEFG?=
 =?utf-8?B?Yi85b3JxUXg1U1VSd1BDQmVJdGVhRitzUllaL1lpUTdMQ0cyeHpyOGNQalkv?=
 =?utf-8?B?cmFrZGlNNmdXbnZBYXhHSlpMV0UvcmdzVzlKQmhVeTNPTjE4VXdQVEFCcEdi?=
 =?utf-8?Q?Gya5kZf2NbQhh0F4zvRMo+7qg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e79c7f-9499-475a-cdbd-08dace0d4d1f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 11:16:15.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M35xIi1SYHj+sDK9Qtrbt2onDdWIiUlO06tI8hOyHEBJ0brqVmkZbV21K1/rdyDQX8vZM890TjlBiTlmaWx2wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6905

On 24.11.2022 10:33, Roger Pau Monné wrote:
> On Thu, Nov 24, 2022 at 10:11:05AM +0100, Jan Beulich wrote:
>> On 24.11.2022 10:06, Roger Pau Monné wrote:
>>> On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
>>>> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
>>>>> - problematic wrt evtchn_upcall_pending, once set, preventing event
>>>>>   injection later on.
>>>>> As you may have inferred already, I'm inclined to suggest to drop the
>>>>> the is_vcpu_online() check from hvm_set_callback_via().
>>>>>
>>>>> One related question here is whether vlapic_do_init() shouldn't have
>>>>> the non-architectural side effect of clearing evtchn_upcall_pending.
>>>>> While this again violates the principle of the hypervisor only ever
>>>>> setting that bit, it would deal with the risk of no further event
>>>>> injection once the flag is set, considering that vlapic_do_init()
>>>>> clears IRR (and ISR).
>>>>
>>>> That would seem sensible to me, and was kind of what I was suggesting
>>>> in:
>>>>
>>>> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/
>>>
>>> Another option would be for vcpu_mark_events_pending() to
>>> unconditionally call hvm_assert_evtchn_irq() regardless of the state
>>> of evtchn_upcall_pending.
>>
>> I think you said so before, and ...
>>
>>>  This will create some spurious events.
>>
>> ... I continue to be afraid of s/some/many/.
> 
> Not _that_ many I think, as we can only queue one pending interrupt in
> IRR.

We need to be careful here - the kernel treating it as "edge" (like
any other interrupt coming directly from the LAPIC), it ack-s it
before calling the handler, i.e. before evtchn_upcall_pending would
have a chance to be cleared. See Linux'es sysvec_xen_hvm_callback().

>> This event delivery is meant
>> to be kind of edge triggered, and I think it is a reasonable model to treat
>> the flag going from 0 to 1 as the "edge".
> 
> Hm, it's a weird interrupt model I would say.  In some aspects it's
> similar to level (as the line stays asserted until it's cleared), but
> we don't get new interrupts injected into the APIC.
> 
> Maybe the right mode would be to treat evtchn_upcall_pending as a
> level triggered line and keep injecting interrupts until the line is
> deasserted (ie: evtchn_upcall_pending == 0)?

As said above, and as also pointed out by Andrew on another sub-
thread when discussing the (dis)similarity with IO-APIC connected
interrupts, at the LAPIC there's no edge/level distinction anymore,
as we're not dealing with "asserted" signals there, but just with
messages sent on the bus.

Jan

