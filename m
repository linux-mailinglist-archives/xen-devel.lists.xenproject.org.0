Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD64A5B4D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 12:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263546.456275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nErTa-00062B-Fz; Tue, 01 Feb 2022 11:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263546.456275; Tue, 01 Feb 2022 11:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nErTa-00060H-D2; Tue, 01 Feb 2022 11:37:34 +0000
Received: by outflank-mailman (input) for mailman id 263546;
 Tue, 01 Feb 2022 11:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nErTZ-00060A-5B
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 11:37:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a1d25e-8353-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 12:37:32 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-tOKrJZYUNieSYNZmWcLV5g-1; Tue, 01 Feb 2022 12:37:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3133.eurprd04.prod.outlook.com (2603:10a6:802:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 11:37:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:37:29 +0000
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
X-Inumbo-ID: 57a1d25e-8353-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643715451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHKge63IFJxDzlpfEKA6T4FB8qoBO9BdhvFyYE6CFi4=;
	b=ah/GK2QwRXJkKgm/jMhVFsLz7QLJGJ42zA2jrAZ5E4tR9wVipdjk8t6U/BVrzbB2yzVFHy
	Z195tiuLQG37wZ6yuGS8ygQezLppg61odyoz3gWf7VSrLCaUnffQJtbx27zmaGaY+/iQPO
	iWlvaETzhDgndSggyuPgkJfuFdpYs5g=
X-MC-Unique: tOKrJZYUNieSYNZmWcLV5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzBpVLTNmbWGU0rwl6vohCMkjckFOdyvQlWCaesiW2XDwl3YaDG1Va3SZtSQs7HnLeqMtTjlgCGwakEGCXVpgu80OtBtMl2xURRQAiHR/xcXmHxdsrPsrXzThIgi/HFS5hcEbyqcf8Sjqq/AVM9V8Nxf4SbrLMWSbMCOK5hEbrSUFeTiIgV0uqY1vw/5X49d4Fqa0mtNxjC3jYZFaICqMry5VQPaRL7Hg+OnBTw+qHmFmZvG1oQc5F//n/+JL7AI90PaqwbUNd4hDuMElARurtKcqPZ13FoVtqCTIQkJKXPauPw+ldES6Mh65ZJ/spxwySyiPsSo+jKEkh0esnvRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97EzxWkjILbC2ZQT0LZkqcNBN6bfE/NJI7hPdxi0FZ0=;
 b=iMAsvyGwHhDMrwWXmCu/PxPfUrUfNLWC4yQcObIebcvGyPj7ifzqcW8z7Rn/mhGpUwJzof/z+Eso8b2cT/UCc6vILEjXgj4gnFRZvdXqqWdvKAT9prrwAtDdCx6vFyPq+XO9g6w5c4WFmtjfJaZOlmEizI65TiJO314mYaq3ZvCRhgAW2a3UcasQH2jrHtXtvCyAUSP1m7iLFsCQPf5CB8sL2L5POdZ++Q4iNeJeIvP9WrWMs332pkxUGR8RDCGCrffRyYfF1UjFj+0n8q4aauIlNPrZo20zdywlxgo8IwsRIAd4/Nd7wh4yUvimoEUbQ/d4WGvkR59x5hRaVHNzGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c6129b8-87ed-a3fa-f819-6318909bf2e1@suse.com>
Date: Tue, 1 Feb 2022 12:37:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] x86/mwait-idle: squash stats update when not
 actually entering C-state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <6a9152e5-1a7d-c569-3483-66f022027597@suse.com>
 <YfkTt1k4XLnZtaJj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfkTt1k4XLnZtaJj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0092.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e33089c-3d3c-4f05-2705-08d9e5773a8a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3133:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31338D7898F1102A997061E6B3269@VI1PR04MB3133.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iDYbACFxWYzIrkYHEJr/qU3FChxEPNPDj4dF+rp16+9RCk7Ef+W9TVoFOFkxwKdc3jl5PDR27lbebsUg+SoJAROa+ny38zxR4SsgS5UroD9q2FJGAris7PV0Q0dDyHgUg9AVBn90BFSyW2swstMMbtNWAMvXhhEhKJSAW86Jd04rlbKPE7/zPlQumKj8FL6DQziA9MlzO0B8Y18w5XIB8CaOE1gRl3wYon9DYNJTNCXriBEYZ+K6Me/3v02KWvLWBBUO3Sln2QNDYOopbS5d8pyfP0JsxIrf+owwZA+UTcdAyN+BDvFMumzCluptSBOzozNpQ3hztX7s0UpK2eqen+M7c/FB0jsKRBJjdOrnJ/32cYeVMeKVeUNe8VVaDOZjvQRcNDITl8Oc8W8qj67WHN3z/sC+Yhp2GFKpLKSmE86TibVClV4GS+N31sVNaG+D16R/mJkLs5mmMX8X8PRZnUaL8Fgthqai7OwQxub4Mr7I5XkMFAP+hzuQjMK+pSFhYvGsz5Qx3/mPNtLBVL1KavTdEOJnQyfg7+xxeQD793ceIQfvm2QYVsKAkEcjfes3+u4zrhBf8NYzO/QdCt4DODeeSCW1yA0Fupv9GDggMeZ8Q5MsypxviRyWJUT0ZvNjIaSO4g0uDrk+A9/qljvFsT8XxqKe5vvu2YbzjL2oKAddsOVt9Et4wpjOaLRLQBZzbcJ/55XzD8XjrephpJeKKmpcoPe9WviOGplNZUo5feganUi1Ftg7rula+TuwaUNU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(66556008)(8676002)(8936002)(6512007)(6506007)(53546011)(508600001)(6486002)(4326008)(83380400001)(186003)(36756003)(5660300002)(26005)(2616005)(6916009)(54906003)(66476007)(66946007)(86362001)(316002)(2906002)(38100700002)(15650500001)(31696002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jzvk77xJiQsAvT61cV9ALK5nErH/KS1L/FF/M1LtgI2e388ZyB6qmPwxa6Wm?=
 =?us-ascii?Q?pVva+L+9h655bJ+3ujuW+tFM1goj/Lm4N+VWkhZ5bTwR6L+SlPNLsxa5mqqp?=
 =?us-ascii?Q?SQ1WBvjPy6tEMHkcK7HyMijyE0YtVj2XJfV3uqJiLVsBtHuCIOfhdjUgC2wh?=
 =?us-ascii?Q?734ey9FAvLCIvQrcnehd/vTdsF3r/MEG9tDa4q0sZMjuQYQYeHGb/qs6aBts?=
 =?us-ascii?Q?3qB+vHGIw/7HW8TZwmrZnxKeIYjTMG16iFCeoJ0O/i2ajE8f3SVhg+3FQKUS?=
 =?us-ascii?Q?BriFltAAV0P8vsIIE8HABPxsx129dFOkoVBlLxwmZX6tEAXKkeyuGdBdNr5B?=
 =?us-ascii?Q?F2vw9bSm1m4AOO7fNgnNlYh0IxvG+QEJk3FdXzTztv9pmg6uT8HeTMlVNRBp?=
 =?us-ascii?Q?fqBvsVqQ5YTf5+zw80H+onWOzIPLcyHwwjTgBy50JJOyt2123g1LsZNgP4OS?=
 =?us-ascii?Q?PkFGYaAtGAEtEI4nlBlCOI6h/VpO+VEZaUov/gCVtdgt42tAaNnaXjFGZB92?=
 =?us-ascii?Q?/LbGIJng3rViwz7wSOpBhFRKpr0pwDsDu9+2Uf4LTCfXX4IvVfxcy2vTaWXf?=
 =?us-ascii?Q?kztN+wLnYgraVhPNlr8wg932rLXlp2uWJseNpSPV6fpsLA8+IdkuPXd+BK0H?=
 =?us-ascii?Q?fEUz2z0x4oPtfkPcg6hkq2sKXD1UwbOLo1t6ib1j8tNfD/bIlyDfL/sZWg4u?=
 =?us-ascii?Q?D/vTcICBhOdjMVzd+Q0vjgHdWFxr73LmV+YEYQ95oK9GYfHb1CLBrg3JBOMK?=
 =?us-ascii?Q?C3HIBE+24yfd1owrhnhKyBYKXTSl7ZRoa4ORRxava4Qw7GUnfHf8C72r/Eoe?=
 =?us-ascii?Q?JnTSSE7OpxuLz3U1HoI593Y1bjjWmkebhNoWDAdKa0S45Yr+inOM48wBSLui?=
 =?us-ascii?Q?+nsPx5MnKbmljkI4XHw7mg2r0b+FqKR+MKygN1n4U7wtkrcGMlemtKZ4CeWd?=
 =?us-ascii?Q?euARf9ly3sCnTmD5TNSJRsPLWQrcOSuZ3aJfSdT0KCDyOcvXdN3w/aZFIg1u?=
 =?us-ascii?Q?rQZw+I3AAZ/yLv42NJ5JFlSeiWNvpsaBCrmX7Or+HJ1/Q2G9WVLX/XTL5uQ+?=
 =?us-ascii?Q?LjKTq5CxVWXDOLDulAa2w7n1VR0x/0g3w+Hl4Q9AusuzOX4qF2O9NjfsYwHx?=
 =?us-ascii?Q?TOMs0+73faWYEX1FBijF99RWlH0sD5v7dB+aWxgcA+5UglY4coGrUBEgxe8G?=
 =?us-ascii?Q?5tb9BoEh+HEgwX8dh5bISyKVXgfuiB9Q5jI0JZnqbqhLRPBCVcJ5HhvMt/IF?=
 =?us-ascii?Q?f6YgrqToCnkjCRrvFs3m5Tf3lqJWgfplXvzpb0V6OI9B621ylB2ScED6hjKQ?=
 =?us-ascii?Q?qV1V33AMvg1NPkvfSlDCZbiahnQl7002PFpSAJiLLw6sECRZnqJai5zR0pvV?=
 =?us-ascii?Q?J/Coya/8XSLQ13YwxWA7tgDsoQbLFZHYH8tBwN3gPlvaFmPbLZOiqFdb8JdX?=
 =?us-ascii?Q?Pw6ihY13Xt5ZRq2GnvqWfqkpIs38QSMJPr9/v0ItgsUPn5SP78rE+24zGHM9?=
 =?us-ascii?Q?hf3OyHoDqSd50MtfgIQzJLWxRDrAdeAFuQrQSdJIP5/RqrMUHRUuX/pOWqoT?=
 =?us-ascii?Q?A5kVqIMD5fwEm7Dg7G2uvZqt77diW7+y1Q7Z8LyyZ5Ab7kPtYoV159FhulSP?=
 =?us-ascii?Q?vWB4q++xiZm0E4UJP8+F0mo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e33089c-3d3c-4f05-2705-08d9e5773a8a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:37:29.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIZ5zNvWXfstZCKr4E9qxuUH41bEVXcLmKgN01Pwf4M6qbRmOdW+MISSpRqSM81hkxOHWD02xIBTGf84RyGb6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3133

On 01.02.2022 12:04, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 27, 2022 at 04:13:47PM +0100, Jan Beulich wrote:
>> While we don't want to skip calling update_idle_stats(), arrange for it
>> to not increment the overall time spent in the state we didn't really
>> enter.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: If we wanted to also move the tracing, then I think the part ahead
>>      of the if() also would need moving. At that point we could as well
>>      move update_last_cx_stat(), too, which afaict would allow skipping
>>      update_idle_stats() on the "else" path (which therefore would go
>>      away). Yet then, with the setting of power->safe_state moved up a
>>      little (which imo it should have been anyway) the two
>>      cpu_is_haltable() invocations would only have the lapic_timer_off()
>>      invocation left in between. This would then seem to call for simply
>>      ditching the 2nd one - acpi-idle also doesn't have a 2nd instance.
>=20
> It's possible for lapic_timer_off to take a non-trivial amount of time
> when virtualized, but it's likely we won't be using mwait in that
> case, so not sure it matter much to have the two cpu_is_haltable calls
> if there's just a lapic_timer_off between them.
>=20
>> TBD: For the tracing I wonder if that really needs to come ahead of the
>>      local_irq_enable(). Maybe trace_exit_reason() needs to, but quite
>>      certainly TRACE_6D() doesn't.
>=20
> Would be good if it could be moved after the local_irq_enable call, as
> it's not as trivial as I've expected, and will just add latency to any
> pending interrupt waiting to be serviced. FWIW, I haven't spotted a
> need to call it with interrupt disabled.

Okay, I guess I'll to the larger rework then.

>> --- a/xen/arch/x86/cpu/mwait-idle.c
>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>> @@ -854,17 +854,23 @@ static void mwait_idle(void)
>>  		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
>> =20
>>  		local_irq_disable();
>> -	}
>> =20
>> -	after =3D alternative_call(cpuidle_get_tick);
>> +		after =3D alternative_call(cpuidle_get_tick);
>> +
>> +		cstate_restore_tsc();
>> +
>> +		/* Now back in C0. */
>> +		update_idle_stats(power, cx, before, after);
>> +	} else {
>> +		/* Never left C0. */
>> +		after =3D alternative_call(cpuidle_get_tick);
>> +		update_idle_stats(power, cx, after, after);
>=20
> While adjusting this, could you also modify update_idle_stats to avoid
> increasing cx->usage if before =3D=3D after (or !sleep_ticks). I don't
> think it's fine to increase the state counter if we never actually
> entered it.

I did consider it but then decided against. Even leaving this aspect
aside the counter only counts _attempts_ to enter a certain state;
the CPU may find reasons to never actually enter it. And what we have
when before =3D=3D after is still an attempt, albeit an unsuccessful one.

Jan


