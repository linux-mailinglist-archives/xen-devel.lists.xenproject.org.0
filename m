Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A8D4A5B3A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 12:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263537.456257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nErOs-0005GZ-S8; Tue, 01 Feb 2022 11:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263537.456257; Tue, 01 Feb 2022 11:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nErOs-0005Dy-OS; Tue, 01 Feb 2022 11:32:42 +0000
Received: by outflank-mailman (input) for mailman id 263537;
 Tue, 01 Feb 2022 11:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nErOr-0005Ds-Je
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 11:32:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9bda09e-8352-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 12:32:40 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-ZdIFo7EnP-yASwmizFIUkg-1; Tue, 01 Feb 2022 12:32:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4548.eurprd04.prod.outlook.com (2603:10a6:208:74::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 11:32:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:32:37 +0000
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
X-Inumbo-ID: a9bda09e-8352-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643715159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ej4bwyEhVMsXF8OM7gFSoKdRZI3BJFNV/DPDRWgXBSE=;
	b=b7iQm9LPetgrCNJNzBQPrd8dmejQgzUX2T0wWzWRhPf1WoVPx09360LBVYgjwKAcR2YRsc
	3WCn0aaECELOj1cPl4b0RU4afS5FwC8SPUn156Qu9xguv3C9zI14AEuQ0M3Yr5WIEyd3a5
	caL9seKauuYovMjs9SXRtYOO7TyJ/sI=
X-MC-Unique: ZdIFo7EnP-yASwmizFIUkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiU3BALktKdxUgpfNudqE/rYJPe5+mp5qCxl76yUB5Irt/kTKCmKBqxxQgjSnnnudesNLrevfZrg7t6+uScO3F2hJkjEWxmwuhZUsC+EZuOQT9Af0ZTgrSsunHBeEzgWAYkV2H4v65/RL4Vj2PVkfzcu03mF/602jD7HRQQEf0K6N/yHc+wlkSNGSmePTQhp837JUmq0pnhm97MILgGdBCFaqrNtQlCeU6rpjBxvLaNytYPbdd2vJCFIYBQyFsoTN+bdHwqaE5Quwq9ZOzdD3+XzMjRXRq6VTxW2p6cyniklXQtTiSL5FRb1tKLsPXqC5BRoxFSjsBQpUSWkAsk9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqCvhSF9hIsv92JKdx86mYpexlREtkPCXNGioNF8/Ts=;
 b=j2aeBngcidVpe9/PQU07SoYBRzG3qzlTpO0t/ml2C2gfFfRONrR37aCQT1mwGedA2HrL2XmQJKDWpsff6jnbadjdj5HsiZreWUgv6MQ80xyMMu7ngdfP4FSdhfzkFgvK/Qbdxgf34AIxBxSyXxFRmV84lyGHqwjh2jQygbMyBiYCPsa/rB99b1c40UtOJHDa3Ufum9wZ1eZUosSrZGjsV7RIaXRXK0npZcYsLeL6BbGGfiyx3P+DjTuboF4K+1AzXpJv3byiJ6VqnF4LsTx2MisvqDdPc41w1HDMSxZTFDoHghyMEUbiGKf0S4iyYt2mNPrD3AOYyAgQfB/bSuqqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4568b11-88ec-18cf-f0ec-7a2dbbd50a80@suse.com>
Date: Tue, 1 Feb 2022 12:32:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] x86/mwait-idle: enable interrupts before C1 on
 Xeons
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <379483c7-fe7d-16ee-454f-8f8dd001dc48@suse.com>
 <YfkPcm3GFI3MNoH3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfkPcm3GFI3MNoH3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4089152-27ce-40fd-bd43-08d9e5768c39
X-MS-TrafficTypeDiagnostic: AM0PR04MB4548:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB454809D4BD061FA445A5AA1CB3269@AM0PR04MB4548.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yev7rHXlrcsMVPqV4gamoPx/UVV4AXyXIC+2ACfPJ2PUwijJJbc2d75XN1RRzf9n13BmyTc8p8RSVD9MNA1bSXM2T2EUqvbstVs62drXoTv88y1WWs+1szq8UaMb9uLBilTEBxYIGoeOZ2yrne1SxDPq6tDioAEO0W9XZC0VOqxu5IJefaV6p82foZn/ZHONQsixF6QB+Vc2RIs6FN6V19QBfcdhOUMG5Oqn/bu6ItCrx5VGpubhezrf/LtR9HQfabNAaQl0oqUJZVEOfxizYjLsqW4jyCAzZtHXqhtPumBI4MTOteZnQrMv9KTxhE6CANeEMy2uuG8Qx/CKhi7TTSvyiOiUvrafhxCDfzmerSAOeZ2jnQF27QBcqciEif0ouD+K0mfSBIFvtR+TZGPWSvIFxfJDK3OAWzeJBQJHjkSovXwsYbjkcjO8g02JasJWEHwCiSPGRkO9djJiCZ40P761KVqB2xizzLA4hOuw+r2nwmzOY2tWGJ8spedBrBIDhc5ea9z4+7gXmzxX4sAi7Rn8EhisGglWcour1jMnxqJPVue8/ZA8ShgEPAebNi69f3mkRyfxcH/Q+1ysfZKoKeyWM4/cSH6negbfr/fo8hCcNk9OFSOnWUA1mI+ktCTLdbQPAFGHHnQ5SKWtJ/5ra4QeoM9KRAB0ZXkmLTJnL8Dqb3lHwTkMyjDMLc6F93xKiVCYKlvXr77e0LzNoOpFVvLHYrZ/XQLvH/EpllzoOnGHl+wy5oIODF9nE6aWOWiKzLerY7azZcI2RvNqZWxlsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(86362001)(2616005)(6916009)(26005)(54906003)(31686004)(38100700002)(31696002)(36756003)(316002)(186003)(83380400001)(53546011)(66476007)(66946007)(6512007)(6486002)(66556008)(4326008)(8936002)(2906002)(508600001)(5660300002)(6666004)(8676002)(21314003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eBPQLAmac8eZgFVlhlVVoVdnkfIIHuDZY3x8IPqgMuPjeYX0bEYgU6ygiyee?=
 =?us-ascii?Q?qxsob4ldpZQnkyznSIxKITboVI3WAME5UpTSAM3FYAizmLsTDPEwgOSUBnQO?=
 =?us-ascii?Q?TdcJ+rFPqZOM4TxvxYIp5a2VNbe0V7GsYwiA6+YztkkTKBzDLJyTcadeGA/Y?=
 =?us-ascii?Q?Qbs/k60+wsb1RmVc/XD46y5LctMzPy4hGuIn+/meF9gfL+We1rKLWgdV3WMR?=
 =?us-ascii?Q?FnpY5+mzN8K8AKvj2O5QeqH8A9/L6EZY1oWym5lihlo/tGrLnghO3t5O3p34?=
 =?us-ascii?Q?8xAPVMZV4DMbP6NEQb8abHp3v0FbeiXkXtwiXqvQPbk6drWn0+wVlMe3q+ZJ?=
 =?us-ascii?Q?qMwF+Ut8fNJ8PWcg/5kuCqjeFczoOs+NNXuM+nYSfoxfwPMTes1qGrq1EyAT?=
 =?us-ascii?Q?NeT2G3bpDm0sBXzxT6tSlp0n0gMXoKVMw2x1fhzZ8e5EUR9U5Oyj/D+Yrh4u?=
 =?us-ascii?Q?xn7NA6Xn/EmnBLUr0FqfG0Ci66kBfk5ueFBmc+5MxZCCDW/fsI+j9oGoJYY8?=
 =?us-ascii?Q?2tIjLNBx5xqxGn+2pEH0r5iRIKxrTugFiZqbPiH1gZP07CO2Yf4lkZM/qseQ?=
 =?us-ascii?Q?B2gp1PVt2e3ruDg4eyj+/9RCt2k/UirUhZas7J1DtqaaBggMT8HuNGM86jXo?=
 =?us-ascii?Q?doZl2Qdv7hAp988DcFY82aUOS5cI5q1VfUL2IawJnY/xNJrcbfEGo0m12FKP?=
 =?us-ascii?Q?az452wXMCE4TzfnRH2A8TL82h36lljmd57XCOP6dptm6IjhdIETD1boflOBD?=
 =?us-ascii?Q?ikFKdLSRBnQ9vr66U3tOb5fW3ndQ7DHtPyGXiTJ0kHUEGsMeoQoLwWIHrHwz?=
 =?us-ascii?Q?Rd6wAa2wIwfImQpaYhdKqeKr61dyzobZ0bIUJfYNHiPplYCnDceXW2i+Q34O?=
 =?us-ascii?Q?f3A0gWUzY6pyOoji1PNP8hhWTQtSan739ykKEonnfgYeI/NNvZk5YRG18K91?=
 =?us-ascii?Q?l07KIugL59/EjGRkRDLnMfnc0X5U7lzcoAZ6AmVb/lTqNxtQmyEpU/tB7aYY?=
 =?us-ascii?Q?2LrZ+jvu6Fjua/rXnO+zRvIP10CHesbEDo3taYXuhFQgyNCcyMUFPo3AuZFV?=
 =?us-ascii?Q?Hg32npx+K7bfgXu2WsWLJf/OaPvXDeCH9MAnSQWqx2R78gKoE5tq94OUJ9n0?=
 =?us-ascii?Q?0PfLIYPMvhKKrKY+LlSvlzZOwhLznweDuhXeEIJ/aCAFaBF0572OR8PUnYVE?=
 =?us-ascii?Q?nSnWChxjSMWGBtzAn3IdZ4XtGq+rIMs73HFy4hKYEq+dxMgHTyEg3hZBZXmD?=
 =?us-ascii?Q?yFwbhhPpC4ZuV5G2fgjCfr01W2sYHpkkmlQoqg0CdcroURv7Cd4zeHgmBCG+?=
 =?us-ascii?Q?A4ZDXExcAdJeWtHgqM3HNr0NeWHbY7vvRCd3g6frLY1hR8Z5FzxLUE9JgSWY?=
 =?us-ascii?Q?HFj+hfZrq/gu5iP1VoVJUBWEyPvPsqlAH+fhbMscGHE7Gvcw7UDl2sG8v5xh?=
 =?us-ascii?Q?mokVyCuPWHrJergE6Nl8J4wrSo3I6OCrA/0LCCVyDdrIz/PYOBEAbs4iXVkk?=
 =?us-ascii?Q?E20TT1nqVe2lqFROew2kch5Q3tLW6Jt/kTUr2ojwcloS3LgiKXMIeni3duEA?=
 =?us-ascii?Q?72ffTpkkI6022Sm/kyX6fu/TwZeyMDG2P4cVfEh+cDExA4PKQFLucRL0RAe7?=
 =?us-ascii?Q?okcRkmBFE8TqSw1hrJssdn0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4089152-27ce-40fd-bd43-08d9e5768c39
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:32:37.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lprYAYV7jQmAEI4232TSBpKMTM/B0fxwZMQCi5uarmEbAuER88xBp8hbmeRETHi6LXrUoskhCP4iR/baqAj5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4548

On 01.02.2022 11:46, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 27, 2022 at 04:13:21PM +0100, Jan Beulich wrote:
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
>> To compensate, propagate the flag into struct acpi_processor_cx.
>>
>> Unlike Linux we want to
>> - disable IRQs again after MWAITing, as subsequently invoked functions
>>   assume so,
>> - avoid enabling IRQs if cstate_restore_tsc() is not a no-op, to avoid
>>   interfering with, in particular, the time rendezvous.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> RFC: I'm not entirely certain that we want to take this, i.e. whether
>>      we're as much worried about interrupt latency.
>=20
> I would assume taking this would make it easier for you to pick
> further patches.

At least a little, yes.

>> --- a/xen/include/xen/cpuidle.h
>> +++ b/xen/include/xen/cpuidle.h
>> @@ -42,6 +42,7 @@ struct acpi_processor_cx
>>      u8 idx;
>>      u8 type;         /* ACPI_STATE_Cn */
>>      u8 entry_method; /* ACPI_CSTATE_EM_xxx */
>> +    bool irq_enable_early;
>=20
> Should you use a bit field here and limit the field to :1 in
> expectation of maybe adding more flags at a later point?

Well, I had considered doing so but then thought we can easily
switch at such future time, leaving it consistently witout bit
fields for now. The more that there's still a 32-bit padding
field left to put stuff in.

Jan


