Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF004440A6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220822.382234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEUq-0006Tp-1K; Wed, 03 Nov 2021 11:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220822.382234; Wed, 03 Nov 2021 11:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEUp-0006R7-Ts; Wed, 03 Nov 2021 11:31:59 +0000
Received: by outflank-mailman (input) for mailman id 220822;
 Wed, 03 Nov 2021 11:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miEUo-0006R1-O0
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:31:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a5d9de4-ab33-47ea-863c-b3cbb517639f;
 Wed, 03 Nov 2021 11:31:57 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-Y9iBQBXPNKCGRAIquArklg-1; Wed, 03 Nov 2021 12:31:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 11:31:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 11:31:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Wed, 3 Nov 2021 11:31:54 +0000
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
X-Inumbo-ID: 7a5d9de4-ab33-47ea-863c-b3cbb517639f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635939116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOZ9zix25pIhYs5LgQ2U6vdbvm4ZOLMz/g24XSEVLcY=;
	b=hit1HLLogDpv4DdchweugxqjCwuzzfwHgPONdAhPiOVizpxLwe/+7Auoe5Nggek0cqpU52
	u8HCwJTjGJHjZhX2CHViMTHDZgspmRwWL1Laww7AR8pI5yJ0jQtu0uYl7rxq/dUY+JH/G/
	6aiPefuPApNov42dj2lRfAcwACOUI/s=
X-MC-Unique: Y9iBQBXPNKCGRAIquArklg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JccArfTgvOMIbJ05hU3y2fMkhLxfYhLpt9Zpyvxd9R9CWNkrJ3HFJqzK/NRLRyKnAgknemfJ/M05NTRv1lsmlQpS36d4jcJsG2VxAu8D0q3U5utaIUxAV/PKwC7cm0XgmHA28P/ucNddL6lUB2v8GTJLjdUoOCOEhimv9grtc3P5j+B5BRhxUg5mAqXNwvtfj0ugB4LCaes3lwZHZ9DyVVm5YEQvxhIheuh+bg2lDwVaTBHl4KCUHS93rhiq1mPOZUnocyS+ZFy4Kue2ABrM5enmJR/APA7fAnhGFw22MAfUbfeXtxK+SwsAlK20xxu3GfeNty0XHdIciF/yR69t4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFaUUKHe/m98WcOyYuwNKjzxWwkhruFNDgisTRKpvxc=;
 b=ZRshuBsaBUtq2ba/Lkj2F2p4kFPgknlyXjXaW/dl6QTxSxuhkrmJv/wx2poChP9xdmJvGrw5oEpQtyZwv+kS4pA+3a9fgrcr/LUOV+TC4QnJJ46ZOV5dsvmYGquGV0MHdCVpdgfcqHPGG5ySIroXa5OYQocieQmHdKXdEI9fIUWhEKQXIvuINbykfGWkiH1joHfx9VVDLEdbar9/e8BDG6nnLDKDM+Mmys1JD1yEgGNCDj/GpI7yFTqXpGcuvUTH0qXQMooDsVPILdWElTIPQFpP7L3iD+L5M1yJCQRNXkrwfsTDeSwhIBYbhMRTkRssSl0o98RcdTxw5w54klGORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d70c85d3-a93f-79e4-2088-6db06a92f360@suse.com>
Date: Wed, 3 Nov 2021 12:31:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Ping: [PATCH] x86/xstate: reset cached register values on resume
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
 <6adf41a6-8f05-8ead-2b12-e922939955da@suse.com>
 <YXFuuwvFKbgkavSB@MacBook-Air-de-Roger.local> <YX/uYIk/iwf3kAXX@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YX/uYIk/iwf3kAXX@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76fbd2c6-5254-4a02-ac89-08d99ebd899a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484641050C17DEA41D8E9C05B38C9@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6tqhgRh3TxaBra572M24nXi5lCUALkYwfSrFtanoJr6SAkQE9XNzfk8+p9usJMBQqvAHZghnb9MeiKM52NOAsasPARZf2tl9Llpd8SkUb0UZX78/jyHGscSQ3bK9fGmguMSCJ9iYaKR723Cue75SBxBdFm034AUf5bCmX0bH8G1F8I18QVEg+qCLceZn0wU6tUM+KG5YZ6t0xyvr3Wv0Q7+g/RpADswWNev4NyynQiafQ20YSRnjBl2ps61iwwVXu+oHi9SJOzVTuea+P69GZq5UCSV8I8jK/Jsz0QGGArh/x9vDuuz6UDrVSXog4vJxtE++/J9Gu+ICu2EPV8/GaQPpp57b7qqyiqZB6fUAN04D11v1fdSAh/x6DThWZG3WWcRRnLRbtrJRYrT2WA0+uvsTuICenq77Uy6KWULPY7T6u2UKRYxDW3+fkUsYuf8Zr6FlloqUE47qs8lmL41d1FZ+Dm+dT8ho6N9jg4yaLdMPuA1WhqDrzCiVP4KiIq3owi9BKrMBMDLeWNrbTNs3IXH5J5DuEdoMAE/fCDAJfJ2+W9gq1JZx0ipgQUgm7sRvAdhuDv8V5/ppFRkgubvoDmH0Xbts0TpT1LzqKl1un59ahEptL2Tu5voR0LiozLmZF1fuMhYFfdklwyjOTrqdpC4fLwTkGw0G5tZgLv4P/c1+tSJUS+qRaaT3uQK1v7krHiK5rVokFmvKV74TnQSwgJGMflraV8BIacvT5PYbtMngfcMvJ3/BtX5zhUWT63E/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66574015)(31696002)(86362001)(38100700002)(6666004)(53546011)(36756003)(31686004)(186003)(66946007)(316002)(6916009)(83380400001)(956004)(66556008)(66476007)(2616005)(8676002)(8936002)(4326008)(5660300002)(2906002)(508600001)(6486002)(54906003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tvA+viK2EYRaLxrPETYkWqxVv/GqWwKELvwgDGIOdxQMt8YSXW7zYZOqV0xV?=
 =?us-ascii?Q?2TqH9GPQNfmT8p6DFywpcjDQbtEbO/OAXN7lha6BUT6YKIZ8sEO1kE7l2y8J?=
 =?us-ascii?Q?IJ290mHels7pX+MYwCZb7HJtHh8Klc0iQPImC/mPtGIF9aJIb8hhSbCTXowO?=
 =?us-ascii?Q?A2CHPdvw/KsolSNw9cP9zvhazbL2J79mXh27pUsZsr/BTBl2TzQZCdg3C9RW?=
 =?us-ascii?Q?ZovunetyFnkj+5uRgSVkp6YecFFgIuXqXZ2jpjrS/ixZj0qS9un+Aa2XmaYA?=
 =?us-ascii?Q?eO4JB8XrFwNHkSZR2aXNR9zkmOAr9BoVEjTRs5qaIumePPzYMcTjlcLWa6Ot?=
 =?us-ascii?Q?bUaylKq/HcZoGHybOyKkP7JcA9nnNFTuTCgV5rezFX8zdKTPClIznU5/fnPj?=
 =?us-ascii?Q?JexcnvR/ynKh3VMGtyybwFTmpI1O9P2mQzLirTZKanDp4+Y3Zs1FeLXMhwNd?=
 =?us-ascii?Q?ahxcGaAK4PoEQ4lW4aXgIgYMHjB1nq6/b4AcxrEf40WDG9n2/KfXZZVhCtA8?=
 =?us-ascii?Q?iN9rttdqEToX4YdbG0cVrI3QESOi6My5eTZ/RXXX5mNAjfSn9ZTpJ1tLwgGR?=
 =?us-ascii?Q?3cz2rR0Wl5tNDgnnFfm+9hcz2SgIgUo6+YqVN4o1qvOZs7bjM4X+LBCBcn+c?=
 =?us-ascii?Q?RvYMLu1Zfka6t5t3hds+KjBDFtO75b3ToSk7pOpTwrcPikJ3Mx8hVuW+EgGt?=
 =?us-ascii?Q?7oyvGT+GLmK8UmKQh+GqeRpmOvGKXmhy6MIb9E5WToXXfFJkFOade0yYiVyK?=
 =?us-ascii?Q?UN/RV56iMYgQHLaLxFaGq9d+pPCLzfTBD9MoMkFPNOx8asaHWRZ0EqXzVwzO?=
 =?us-ascii?Q?NSPdI6/BR3hNS7FbiJATosSmXCqqeYmzbwgYoa+lxTIRJjpaWsy3ZtxP6oiX?=
 =?us-ascii?Q?R3DGqvBG8smOEt6D7L4a8T7c0nuzPGdIpd/62x8Ie0IRbSGwJN2QXo2ovxsw?=
 =?us-ascii?Q?49C4RGedDvJJrk3dOrN71tPhtchjnnniatpKWqCqAP4mt+8Q0Abtkok02W8D?=
 =?us-ascii?Q?HC6lG3hjvhsZTmOYvVwbZ/OA9vslwj3IcNZyO3q2e/zZE09n80Ox+Sg9wrXG?=
 =?us-ascii?Q?ZX5Cwquq1F28QUW2dAld3aGs+SnT+5iLP+iLIUhy6KxEBlSbk+genIGxYkvz?=
 =?us-ascii?Q?vzz4yqZH3UzRekFiRd5EoBLr4Bzx1g7QUr5PkVPLuQl+vHSehqNWIKbUHfCq?=
 =?us-ascii?Q?DYtT8V/BGuVxAhQuhnR0UQPWQXoFUWjxd84OfjCEhDrjL5sWTtCSrpj7MJuB?=
 =?us-ascii?Q?rgQavcUgpBQc8Ku+JqSUhP2WkqPx9bnDACLYEuTk99NmwMAUb0APWIbV7Yx5?=
 =?us-ascii?Q?F/BDEXE2Ewb3KSAiUoEB9dri5tJYLtdKGYkNmcggkX3Dj0gXSumJijvkCoZi?=
 =?us-ascii?Q?Xj3fvT55mHirAnOOeNeJNueuIeHNu0FSQ9KpYmwrf98tXn4FAHpnD7PXAvsc?=
 =?us-ascii?Q?c/IXfkxegWi5MbQ3E7ycnSDfL5h3HnnqPx14Q7DG9oy73mC5PZXyzpFJfArO?=
 =?us-ascii?Q?DABkoPbWatXpm4JPtD52WhpAgAIRb1zPeHKDXjpMf3JjtGBzSJPj+WMhBPy/?=
 =?us-ascii?Q?8QrY7VPajpJNBVgErAsqFw019m84SjVjyvRpNNcypkhlfAhA87Xtl46mAL7z?=
 =?us-ascii?Q?I/CSEcPyRuV/5iQ643GqVaY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fbd2c6-5254-4a02-ac89-08d99ebd899a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:31:54.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCPLXXSwvZ1c2NrT9wZs8Wv/Lf8X2U0wSNFFXka3TB2eBOmo/1WBMbGdXQned2sir5IGIP0NlA148z5xd40PHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 01.11.2021 14:40, Marek Marczykowski-G=C3=B3recki wrote:
> On Thu, Oct 21, 2021 at 03:44:27PM +0200, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Oct 18, 2021 at 10:21:28AM +0200, Jan Beulich wrote:
>>> On 24.08.2021 23:11, Andrew Cooper wrote:
>>>> On 18/08/2021 13:44, Andrew Cooper wrote:
>>>>> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
>>>>>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
>>>>>> register to the same value over and over. But suspend/resume implici=
tly
>>>>>> reset the registers and since percpu areas are not deallocated on
>>>>>> suspend anymore, the cache gets stale.
>>>>>> Reset the cache on resume, to ensure the next write will really hit =
the
>>>>>> hardware. Choose value 0, as it will never be a legitimate write to
>>>>>> those registers - and so, will force write (and cache update).
>>>>>>
>>>>>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
>>>>>> - set_xcr0() is called few lines below in xstate_init(), so it will
>>>>>>   update the cache with appropriate value
>>>>>> - get_msr_xss() is not used anywhere - and thus not before any
>>>>>>   set_msr_xss() that will fill the cache
>>>>>>
>>>>>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
>>>>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisibleth=
ingslab.com>
>>>>> I'd prefer to do this differently.=C2=A0 As I said in the thread, the=
re are
>>>>> other registers such as MSR_TSC_AUX which fall into the same category=
,
>>>>> and I'd like to make something which works systematically.
>>>>
>>>> Ok - after some searching, I think we have problems with:
>>>>
>>>> cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
>>>> cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
>>>> msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);
>>>> xstate.c:36:static DEFINE_PER_CPU(uint64_t, xcr0);
>>>> xstate.c:79:static DEFINE_PER_CPU(uint64_t, xss);
>>>>
>>>> There is also:
>>>>
>>>> traps.c:100:DEFINE_PER_CPU(uint64_t, efer);
>>>>
>>>> which we *almost* handle correctly, but fail to update the cache on th=
e
>>>> BSP out of S3.
>>>>
>>>>
>>>> For the APIC, I think we have issues with:
>>>>
>>>> irq.c:1083:static DEFINE_PER_CPU(struct pending_eoi,
>>>> pending_eoi[NR_DYNAMIC_VECTORS]);
>>>>
>>>> because we don't defer S3 until all pending EOIs are complete.
>>>
>>> As your planned more extensive rework appears to not have made much
>>> progress yet, may I suggest that we go with Marek's fix for 4.16,
>>> with the one adjustment I suggested alongside giving my R-b?
>>
>> I think that's the only viable solution in order to avoid shipping a
>> broken 4.16 so we should go ahead with it.
>=20
> Do you want me to post v2 with `this_cpu(xss) =3D ~0` change? IIUC that's
> the only thing requested in this patch specifically.

Since Ian in particular prefers to see the full final version on the list,
and since at this point you will need his release ack for the patch to go
in, I think re-sending with the adjustment and tag(s) added would be the
best course of action.

Jan


