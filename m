Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BD4982A8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 15:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259883.448622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC0aa-0005a1-Oo; Mon, 24 Jan 2022 14:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259883.448622; Mon, 24 Jan 2022 14:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC0aa-0005YE-LO; Mon, 24 Jan 2022 14:45:00 +0000
Received: by outflank-mailman (input) for mailman id 259883;
 Mon, 24 Jan 2022 14:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC0aZ-0005Y8-Ek
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 14:44:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1debf62c-7d24-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 15:44:21 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-gIpL2EPYO9ChijnAKFK1Ng-1; Mon, 24 Jan 2022 15:44:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7265.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 14:44:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 14:44:55 +0000
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
X-Inumbo-ID: 1debf62c-7d24-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643035497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsFpz1ehcck1STWTR0X8l2Y91c6v2u8cpJnsNI8KoJs=;
	b=TOErV/49DDRZDg7zAPbrkcigZZYSwHppQB3lT9kBcLM/Dj04aV1lvUDCiBnR1K4Gc6Ps+6
	uzq0iBfWlbc8UKYJivkgm9gi2luSBIyBsqROE1r8GWI/bN7mU5cr2jR5Iq/AkrCkja+4nN
	UFFsEUGDCa3MuHoowr6jqpj/CbnsyzU=
X-MC-Unique: gIpL2EPYO9ChijnAKFK1Ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiAqQnWhSTJtqJh+0srzu6OiGh5MX7TIwWcMlNKn1IhgKHysrEvXtY4VT2iMinM39HkJwQsgT/JP5NFPWi1D5C/C69jB31d9rkm4MTJEPvzr6G9FfasH7HDCFQHgftB8L/S5+iCjczawsxXpabKZs4B/kcZcw0THZIj2J61xIUGWoa13F7U9iQB13nCNhbwp6n+JBwE9weNG+koFSCGr3dmaLHydDcUHkEpYR/mDjnXtEQ0Wv6G4qDeNFxpLKfczqAsJt39A+SxO8r8iiObjOuUsaZ3zPGZL42FbuctN6IiwOjM5njamoCD8zMb6xS/KVH2p3xRBRwRixb6XcT8GCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4+fybkFc2AnaWUMWMFb+tk6x0VEPNJDIHJxJdzkr9Y=;
 b=b3ztk51BbS/RZUb/AIJIJWD9uiDgEllt6PLvo8WUZIj9i+9zYp+Neg+blOiQJzogyhqNSkITiomhq35XbH/7sl4DDN2b+nqTbUbPeXDUdwR1/NBYrLNJzdY3JiSSti6ikeYzDIGmJrPsStirRQo10VsySFoES/yd9mJgN8illrNzj4vZHI9YHchs0HCl3WCHbNL8/sWTxO/QDe/v6oo+raScAtZEcx2QdOT9/MpueLlnQ6WUTCu7LW0PPPuhWXVJgcxj1CsfuU+8YSYKnnam3k2ycvhz3awVBeYcFFHI9/cKqxDRgYEAHpTeiReWKC6eVfZc825K+oVZkY36eXORxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ccff255-630f-2805-b5eb-013aea666cf7@suse.com>
Date: Mon, 24 Jan 2022 15:44:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC v2 4/5] x86/mwait-idle: enable interrupts before C1 on
 Xeons
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <a0b3c3f6-2abc-353b-92f9-367fa57af8ef@suse.com>
 <YemFRFaKRanqgpSW@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YemFRFaKRanqgpSW@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0199.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3ddd7e8-cfdf-43d1-31d0-08d9df481612
X-MS-TrafficTypeDiagnostic: AM8PR04MB7265:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7265175D451BC853796B2BB5B35E9@AM8PR04MB7265.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oxXrAbKYYnVCJViu2mfaTSiVTo5GFH8UTGK33yxf+MblchAqRJoXdmwrLtkvi9Fqj2ZVKuUmGJq2EOUuAYtRrUMtuyqF9fv0ehfYTUdY98tp9n32eXK+R25c5tCTs5uiwcCV7gzcn7GBB9qNB/OPPFbTZm73zN++6AKuzYnv+03v6rrErXhfOV1T/Lzzw8eOIKwfWAJAX50g2vaRkoB9OGzzy9K2WR9nm5b3A6WPrNfKx+ttQCSnhPWmOwX2t15vOKPd6jMCuHgfX2s5M4mXKDHYka0nRlprWIlosj8WvP2DnSLmS1eRLrDQKsY2mlibjaybHT14iWAeFs7nLgexQRJib7FUm0vs6UfkDWztJtEBoAZqSBXbjlvDJjHOeJmeZbn9QYqiq1XGJxrQOJOap8/Q9AmFVwC1+KBluHLH+sW54N1iuBNylp/Szvf+SM5TQlBE/Ut1sBOV7+IOriUeFBLJKlcCqMHzdxk6FYG7A8qyzlURYf2+Gl2L4pAu9zhpTPeU1J7o5bw7CvpIF7Ke1jXnHNWVFleMQs14M9BxPNtC+7PhDsR3iKbXXpPpPJSMr9An3KoMt3WistFl4g015/msN1cXxopMJXZrQO3pkDfyCHGYftgAMk6YEPOHxlDJN+2M3r2oqyL8X4OPtVDCAjHIcDYj1Hgx3XrbPwPB+sh0eOBxH94O3l4PAFZs/vq249jZG6GkZGlwLz+vL4lJQqiSKDVHoNl/hLZbtKP1SQ3cPuoGH/F2dzgUd/BGnwwC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(36756003)(316002)(6512007)(66946007)(6506007)(38100700002)(54906003)(4326008)(2616005)(53546011)(186003)(8936002)(83380400001)(6486002)(5660300002)(26005)(508600001)(66476007)(66556008)(8676002)(2906002)(31686004)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mx3pmzqk7cDz3CLOdMSZDzfx7pOLMbESC3Ff6ehTFRxAxBSps4837CQxs+XH?=
 =?us-ascii?Q?sma9Qp9o3AgYXkMJhiLaMET1X3jR5kga8tsmC+O/FQ5VvHOuTnyaI+Dv5fy+?=
 =?us-ascii?Q?tf/pyOTD+ZrR0c4V9/vAjW0uf2W4bV6Wli7FA7EoWPxhUxIEhZKvO3PFPZ/K?=
 =?us-ascii?Q?XUeheYtNaYwni7uVi+4B2gVLducbJEN9M0qX4lmADchtrVQyz2NNsZr7kkCy?=
 =?us-ascii?Q?wYn1bi0fXZTBRHWuqXbaWP0lhqEq5C2CDZkV/mYZKslt7jI8ICNoSeOwa/sF?=
 =?us-ascii?Q?RNgOnP/EXVa+bU+CMqGx92SBDSb8chvfKwH1Xk/vAV3WHwfHec8YvdVKyUbB?=
 =?us-ascii?Q?6lLo2j1dDJnhnofcdr3URNRAQEQpTBa1eCqmM760JwmpivaR7JrqCjCD2Fvq?=
 =?us-ascii?Q?yGmCp2m3VY2x1iRYyU1JrYQfHnk/fufXzgN4Lu/qF6AfThr8vxACzT6MQGYW?=
 =?us-ascii?Q?uoRRmIdupn96H8FSKWeGdBHfZCAX0EUewLM3JY4GGhcnzzWClYiWnRmeiV53?=
 =?us-ascii?Q?Hu0XlgE6yHlzzRz+WqF+Kl6i1i4TvpN5C4+R8UCOtSI1e99jRBqk06LW00GR?=
 =?us-ascii?Q?F8o3p9G8nf1GzurFA1d+GOsWFQevEbRnZQ8EXAO3NAD0y3fZ7zUq9QemkmZh?=
 =?us-ascii?Q?mCdwcTSTxj7Sh75Hb5C2vClYtcb92Z0BgWDHjUTIhbnnCzFNO22hEhflpvnh?=
 =?us-ascii?Q?YqYy6f7vpKVFN7c166vCngBw5sRPt8jJ9qwbFXhxIsgtnti9B2SELKigKaEm?=
 =?us-ascii?Q?o6qSt11oK2u8JkL5/RcS0ebbfm+zoO2lvBkDgEqcR0Wj6t7NcjJPwp4YG5BD?=
 =?us-ascii?Q?wy+FR6dsoLYbtbZbZacD+05ft4E7z7RTKFGoPMrX74FTy8+ewXrErD5BA1Nj?=
 =?us-ascii?Q?0h2Wrl4oCGt521CQ4K+stH2AtNg4+VcZa7HPhUo6IkxOL7kNChKuO7RrwxYn?=
 =?us-ascii?Q?jGm5wqb+UQAEDVCLvbnnwMy8+Hnf7oeX3CUoVNEMFeHZpmD4ClRfwFqtOY5t?=
 =?us-ascii?Q?oW+f4lhZSIj+f4IX0ut/gyMxg0+FaxDISKU9V8qLpeqsl4Pr6DkIVXch5FXk?=
 =?us-ascii?Q?UjH+zRhVTDjvZ4tftCp30PrFp2AkS1jG5uCzoKbHHDb9gqTNenOWYq+Vh549?=
 =?us-ascii?Q?Sg4bF7UVbJKSr2RjqulrQtEvgwZbdeWi9CH6QPwU7keVwGZuDYG/zx9K+MQ1?=
 =?us-ascii?Q?KALaneqHNdMujBH5ATVLfEtBUtbQ6TwEoDjkTQYHCnyCnbYhgNmdGluHmiN9?=
 =?us-ascii?Q?t9a/K6fYQ5txVgvtdXu0KURESeKwOxaXZiuyf7JPSVWusoL0e6yLT5EsybBs?=
 =?us-ascii?Q?g2wJLRJAX1nQPKwebwe/AVr81taNQYjq3QWbu4OEOftTDakwDXXSKil+RzPf?=
 =?us-ascii?Q?yJ3hKdCbjQMJBTfDUUqtuwteT99Wmcr7XJ4qj7v1mPepO2+jGNIjChH6Fksd?=
 =?us-ascii?Q?Ia8aDFsPJL/4nc0XkNmLe/VELdooNtMQL5kNbple0cXWFouE9KyEgxxons7o?=
 =?us-ascii?Q?6u18obOfw3twZQaYkXVBegXq2/FhCZJGT+ZHrguZCvShlaMLhmZ5BPbCpIm8?=
 =?us-ascii?Q?Iv/BS1Z9x+YIUkd6ZYZQVuDszOSfDWWV8FP986xLI0jX9J3pAgD7zmRxwpyg?=
 =?us-ascii?Q?6EYz0B0E5DZXKoq/SPE2mB8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ddd7e8-cfdf-43d1-31d0-08d9df481612
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 14:44:55.1945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9rzZIY6n6chNcGYZdDgDSSPD31wFduAy88UC5FyH0bUG1xAZG3knVowr5m89mPrL28X8YFJu1xozTDrrPMZaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7265

On 20.01.2022 16:52, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 20, 2022 at 03:04:39PM +0100, Jan Beulich wrote:
>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> Enable local interrupts before requesting C1 on the last two generations
>> of Intel Xeon platforms: Sky Lake, Cascade Lake, Cooper Lake, Ice Lake.
>> This decreases average C1 interrupt latency by about 5-10%, as measured
>> with the 'wult' tool.
>>
>> The '->enter()' function of the driver enters C-states with local
>> interrupts disabled by executing the 'monitor' and 'mwait' pair of
>> instructions. If an interrupt happens, the CPU exits the C-state and
>> continues executing instructions after 'mwait'. It does not jump to
>> the interrupt handler, because local interrupts are disabled. The
>> cpuidle subsystem enables interrupts a bit later, after doing some
>> housekeeping.
>>
>> With this patch, we enable local interrupts before requesting C1. In
>> this case, if the CPU wakes up because of an interrupt, it will jump
>> to the interrupt handler right away. The cpuidle housekeeping will be
>> done after the pending interrupt(s) are handled.
>>
>> Enabling interrupts before entering a C-state has measurable impact
>> for faster C-states, like C1. Deeper, but slower C-states like C6 do
>> not really benefit from this sort of change, because their latency is
>> a lot higher comparing to the delay added by cpuidle housekeeping.
>>
>> This change was also tested with cyclictest and dbench. In case of Ice
>> Lake, the average cyclictest latency decreased by 5.1%, and the average
>> 'dbench' throughput increased by about 0.8%. Both tests were run for 4
>> hours with only C1 enabled (all other idle states, including 'POLL',
>> were disabled). CPU frequency was pinned to HFM, and uncore frequency
>> was pinned to the maximum value. The other platforms had similar
>> single-digit percentage improvements.
>>
>> It is worth noting that this patch affects 'cpuidle' statistics a tiny
>> bit.  Before this patch, C1 residency did not include the interrupt
>> handling time, but with this patch, it will include it. This is similar
>> to what happens in case of the 'POLL' state, which also runs with
>> interrupts enabled.
>>
>> Suggested-by: Len Brown <len.brown@intel.com>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> [Linux commit: c227233ad64c77e57db738ab0e46439db71822a3]
>>
>> We don't have a pointer into cpuidle_state_table[] readily available.
>> To compensate, make use of the new flag only appearing for C1 and hence
>> only in the first table entry.
>=20
> We could likely use the 8 padding bits in acpi_processor_cx between
> entry_method and method to store a flags field?

When looking there initially, I thought it wouldn't be good to add
field there. But looking again, I now don't see why I thought what
I thought. (We actually have an 8-bit padding slot there and a
32-bit one.)

> It would seems more resilient, as I guess at some point we could
> enable interrupts for further states?

C1E maybe; I don't think anything beyond, for having higher wakeup
latency anyway.

>> Unlike Linux we want to disable IRQs again after MWAITing, as
>> subsequently invoked functions assume so.
>=20
> I'm also wondering whether there could be interrupts that rely on some
> of the housekeeping that's done when returning from mwait. I guess
> it's unlikely for an interrupt handler to have anything to do with the
> TSC not having been restored.

Actually this is a good point you make: We don't want to enable
IRQs when cstate_restore_tsc() is not a no-op, or else we might
confuse the time rendezvous. (I thought that I would remember
TSC to stop only in deeper C-states, but maybe I'm mixing this up
with the APIC timer.)

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but as per above - not just yet.

Jan


