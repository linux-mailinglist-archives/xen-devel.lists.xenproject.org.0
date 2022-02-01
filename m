Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D74A5C88
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 13:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263583.456332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsXd-0006s2-2Q; Tue, 01 Feb 2022 12:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263583.456332; Tue, 01 Feb 2022 12:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsXc-0006oZ-To; Tue, 01 Feb 2022 12:45:48 +0000
Received: by outflank-mailman (input) for mailman id 263583;
 Tue, 01 Feb 2022 12:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEsXb-0006oT-2c
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 12:45:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe21553-835c-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 13:45:46 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-ly0RBg74OzS2w5TFB3Cq_w-1; Tue, 01 Feb 2022 13:45:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5282.eurprd04.prod.outlook.com (2603:10a6:208:d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 12:45:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 12:45:42 +0000
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
X-Inumbo-ID: dfe21553-835c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643719545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgCSJWhP5AbkvFJXUdUqd4BGuTf70dTzqNd8fgF6Kzc=;
	b=IyupGeH2C8ZtJMWz3vJ6aHGv/p0ZZHLM6BgEaw1dKt9bcqqkQEU4kEUqPVdXToTxT5d0da
	hmAFdWGHkKgooIPM4AQWSSGOHbYo0l5IrFStSMelTbWlLk96xciwsXidzldNH3J5aC76XM
	fQcnpV3TqaQ5S4a4wThJtQKqkOd7R30=
X-MC-Unique: ly0RBg74OzS2w5TFB3Cq_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8IIROI257uPdoo9B39Zot2v3If09AZSKZILx2PTOAKpwS7mvXh7ZYd/OTW0dB6iVYjWvuu4RcBsjFVXaPTUkgLHslTYaCgtWKU43OrdxIYj63pZa2j98dIDwdAOp4BoaCsbbi/KKH4vu7bMs4s1kiLcMTBWp0Aq4dsiSRBz3/Mst0e2Gf8awm93Eh9/6MOwr8uJldIKYtfAoaWBt2pWmk4v7LY8YYRd5qVAVNALtW+XZH3bPRhXj0ro+TsUvTaGeZazfLMKmu7FWDqk64BMfUmE3uOEYUc53hiGNWLG9xd0ArZhAYNmY2prlvoHwNMuBekOU7xl8TQMUQQOKPpXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzWQu8Yey2mGbU6hFumi3h2Cej8BlfX6CCzHEdk10pA=;
 b=LiNtpV8JMoeoVeBXZL5cDTGQHuEtfGRW0gAWlwlYeFPKqEm9HyZEyH6t0+CegA6OsIIdUWTZal33j3elt0uIOf/d/ZOzrtPtUcjs3bWkYPKN1RAm+TCpnn+7uSlPOVDatfb/XrAAGc8CsodlFLYdafDWB+yFdBZuCFTXmDyfWkS6FvFXx+PoQiDbGVkX6a3Emkw9KL6XuJQj3wgpZawokqlkLPFITv9kaY+BC65yTA9OS+UFY/kov6Jeba9uHBIgtHi4LXTDMhDXY2eTTVAQKTD2o5K5WH0llPRTndsIUROgw1wHDq2WyGcBYl6pd86hW1NpRKIeYJvBAKXr9VpDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <482fa978-d5d2-a069-ecdd-23a212bae57e@suse.com>
Date: Tue, 1 Feb 2022 13:45:40 +0100
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
 <2c6129b8-87ed-a3fa-f819-6318909bf2e1@suse.com>
 <YfkqvddlvAELr0ng@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfkqvddlvAELr0ng@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feb505f1-8d6d-4b3a-5c59-08d9e580c1cf
X-MS-TrafficTypeDiagnostic: AM0PR04MB5282:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB52826343241EAA85FFF72383B3269@AM0PR04MB5282.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bNIvzYCGDOckeaD6lFzuIU6h3pTwL6p/0kbCs8NzDIra4hfAuOHYFRx2PMy+smNkgTJW5u18ha9Hscaq2okH04FPyhE1BN02k9p4oMb+5PM2TzaqQU71qQMt0dSFLAjzOJih0m4LlMKXYPohKbAbnfOWtnrHNkgNPGquRxJCbFkQMELV1PMAiU2WuRlUdZVEmj9D/fShn/Jf8T9v8/n6rwAIFz1aEsVZHXe1SaO/0JclXUgBE7+9i/N8eMSNha9n6Thf14VYANINpMRLq/GboAJEqRFBx6iuaHpFOIJS/T3bAdTpUHsAYP4kbaUvLsuvLdmaOGe8jb4fmPytacpHaNs88vGIjV185YEbIqkgJgIpFCd+WhPXN0WbRcLXnk9zQl88CusW2ZKydcDfHaC43hq+U2SErpPX/UQ+pBzqT2vz0hTEbjej2GkNc48h9Qj8eB6wwmkAwLm4fzodJSmdzF1F0VKsTsYEiob260dH1FzQwpZ6wurxuphxg5wFLrjMeItnwOmgUEIfE/R+i9VH2HSE2RV1tMK95aIW2wUMmQKZZICu1NHoLT1svwKw0ABvvG26gfGTmcJsdiw7gAfjjEAWtVvamCcKt/quF20PFp2XDgUSijvmIE3DgJzjequrbjCfts5pF499l8chaFQ85ep1OUXiRhxi+5U3E2I1QxgmspVSzkaFpuCt138J3c3t1odWW02Hui3yCm+kggjU3JLwI4RoNv6GWNxeRHiU9MVAzMv1jXQeS5o9OyOAAppn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2616005)(86362001)(31686004)(6916009)(54906003)(26005)(31696002)(36756003)(38100700002)(186003)(316002)(8676002)(66476007)(83380400001)(6512007)(66946007)(6486002)(4326008)(66556008)(2906002)(508600001)(5660300002)(8936002)(15650500001)(53546011)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?anmngWsknCRnE8KUyZ2a255g35IFiXicAM5smlLkq/XJNdso+MsYfFydi5P+?=
 =?us-ascii?Q?TNdJfrEnbwCpyAaNHxkrnopt9MeG5slYfmCqUkvqvs6TG6BZvDhN/Rl/aiqq?=
 =?us-ascii?Q?pQkxRYmP/FvhSStcxh3LPZuVrPLQYcimia2knhdtUcfTYGi1Ix6jk+cyiDdj?=
 =?us-ascii?Q?hIVX2YSG4qxD/Up/IbY8Tg0vRy9Gh674HUtBZXJnTBO6XQvccPrN36m9Dz0f?=
 =?us-ascii?Q?UUhx8nhwE30hTE5B4DFNC+mA5iKSM8SB50qQ/7tCy56c7cOlHUfk3Ed7PyKY?=
 =?us-ascii?Q?U64vbnzHU8DOOhKINHy/mrsxCDYLtSyO+1sfKackxvZjdowRKUZA3AgYrBz+?=
 =?us-ascii?Q?98L3QZ9SQeUkanHfyEqjY7QuP63/pgpkyoikTPo/6xx/PYa2Nz0MiEKprSJB?=
 =?us-ascii?Q?Qliy+b3IBmDJit+nOH5X+y0jZspA5DG+FG23kwCqqDGWF5YeTV3bAHpUADh5?=
 =?us-ascii?Q?i4sDeb+wP9WQuH+0HektD2MKrD2LQ5qVmQacDZakAzrbD9BmlVpyFqwYLsWS?=
 =?us-ascii?Q?RPLi/cCg4vxUR5ESEsAsPkdA/2VcsrYYVJYLrKQA53KStuPjuUBgHo+Gr82Y?=
 =?us-ascii?Q?AL9j3ZZYZiUVfm9PNTNsoXVlsYOHSVDnv403A1+JvFPwK3Fms2xHd5DAwk25?=
 =?us-ascii?Q?zktDyYIkkmazMCuJUJph38wkSP6ONYOaz8HIJc/0rc93drG7LIOY7+2sOBxY?=
 =?us-ascii?Q?7izP9QqL+MZKLBlRyrlMYMVbfyDqicqlWfNX5ArmhBSduLiZOBQCtCZFzOIs?=
 =?us-ascii?Q?pDf/8utBQJcaLetK9SlkVbVvYKOL+gNa1lCik8aG3OGIDhvQCPh6aFBVyukg?=
 =?us-ascii?Q?bHtnW8VlKEdNo+zQPLC7RuC7sAbFAl1UBeCkRa+6qiLDWqV+Eqw2ohUN2POf?=
 =?us-ascii?Q?a30l9SXRgVaUAir4xkgJw0yTLDyGO5ocFYz3fOt0oWeCDM/gsI0dnswWr1qs?=
 =?us-ascii?Q?sTX2o9qsMyQqui4IS1eMKpYAZq6TzpbnRoEtWhJU+J1GLj/sLOT9GIuV0lSS?=
 =?us-ascii?Q?P1jW83mydOmxxxh9bG4zlzeg/t1LqgUwC7jukMWg+sj2cfNBBnuuN6SPwPHL?=
 =?us-ascii?Q?1+XQVf3ePItvByWDpKeYC/y5Tsnk7SRkOuoHm3HkJINFCCj8CyFKN0AlHRZ8?=
 =?us-ascii?Q?oFLvG1WZz7OzsTk7VU5+sIMew9tjg+WuRYLynb6+bX99KNQCkMR78w60BwXg?=
 =?us-ascii?Q?Kqa0FJvEYWAq8Q2G1j3oUDiTLcJRgXIvi+NvsQjEIxfGprgBNMsOHl2k6/fg?=
 =?us-ascii?Q?WXuaSAkRfrBeaz+eOSYAwIp5pVf+8xszkhIntQczcj8ABwuoF6VOODbB9D8M?=
 =?us-ascii?Q?IDyRJx2l8sjN+pydi4fQUIrhcN+nJ9ssh+A0svKONg528e9FWoybNlil8ZpM?=
 =?us-ascii?Q?84hrrmT/jQJpGCkoMRbgKRWbRtRIc0vLr//kZbFEZxIw+MZ4yeT+WUlvgPtd?=
 =?us-ascii?Q?CK5yNH1TiJlUzHTt6IGc1qX9+gvkSkVpuTPQsvRYmkrkrMyDaUQSv9tWZiFx?=
 =?us-ascii?Q?N8JWTaC4APRBL3GsebT6/3Dyq4KNhoeQPh/+/CClQkxoI/SosXjjGJXnl2O/?=
 =?us-ascii?Q?EOys47/vT2XTOX9w8Bog58ACcAsACtoM422N4wfirDnweLvRXeD0J26Hl/Jg?=
 =?us-ascii?Q?+uMpbl1jPnfKGVr6VOsRPY0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb505f1-8d6d-4b3a-5c59-08d9e580c1cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 12:45:42.0740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azTkfmoKFWwukpduvzUcRpZRFhDKAmhG2Tx6LUviOhZHTvZOLlnzc9NahQmwgiYarp2i84pqerLOQKv4C6kfzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5282

On 01.02.2022 13:42, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 01, 2022 at 12:37:27PM +0100, Jan Beulich wrote:
>> On 01.02.2022 12:04, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Jan 27, 2022 at 04:13:47PM +0100, Jan Beulich wrote:
>>>> While we don't want to skip calling update_idle_stats(), arrange for i=
t
>>>> to not increment the overall time spent in the state we didn't really
>>>> enter.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> RFC: If we wanted to also move the tracing, then I think the part ahea=
d
>>>>      of the if() also would need moving. At that point we could as wel=
l
>>>>      move update_last_cx_stat(), too, which afaict would allow skippin=
g
>>>>      update_idle_stats() on the "else" path (which therefore would go
>>>>      away). Yet then, with the setting of power->safe_state moved up a
>>>>      little (which imo it should have been anyway) the two
>>>>      cpu_is_haltable() invocations would only have the lapic_timer_off=
()
>>>>      invocation left in between. This would then seem to call for simp=
ly
>>>>      ditching the 2nd one - acpi-idle also doesn't have a 2nd instance=
.
>>>
>>> It's possible for lapic_timer_off to take a non-trivial amount of time
>>> when virtualized, but it's likely we won't be using mwait in that
>>> case, so not sure it matter much to have the two cpu_is_haltable calls
>>> if there's just a lapic_timer_off between them.
>>>
>>>> TBD: For the tracing I wonder if that really needs to come ahead of th=
e
>>>>      local_irq_enable(). Maybe trace_exit_reason() needs to, but quite
>>>>      certainly TRACE_6D() doesn't.
>>>
>>> Would be good if it could be moved after the local_irq_enable call, as
>>> it's not as trivial as I've expected, and will just add latency to any
>>> pending interrupt waiting to be serviced. FWIW, I haven't spotted a
>>> need to call it with interrupt disabled.
>>
>> Okay, I guess I'll to the larger rework then.
>>
>>>> --- a/xen/arch/x86/cpu/mwait-idle.c
>>>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>>>> @@ -854,17 +854,23 @@ static void mwait_idle(void)
>>>>  		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
>>>> =20
>>>>  		local_irq_disable();
>>>> -	}
>>>> =20
>>>> -	after =3D alternative_call(cpuidle_get_tick);
>>>> +		after =3D alternative_call(cpuidle_get_tick);
>>>> +
>>>> +		cstate_restore_tsc();
>>>> +
>>>> +		/* Now back in C0. */
>>>> +		update_idle_stats(power, cx, before, after);
>>>> +	} else {
>>>> +		/* Never left C0. */
>>>> +		after =3D alternative_call(cpuidle_get_tick);
>>>> +		update_idle_stats(power, cx, after, after);
>>>
>>> While adjusting this, could you also modify update_idle_stats to avoid
>>> increasing cx->usage if before =3D=3D after (or !sleep_ticks). I don't
>>> think it's fine to increase the state counter if we never actually
>>> entered it.
>>
>> I did consider it but then decided against. Even leaving this aspect
>> aside the counter only counts _attempts_ to enter a certain state;
>> the CPU may find reasons to never actually enter it. And what we have
>> when before =3D=3D after is still an attempt, albeit an unsuccessful one=
.
>=20
> Right, in which case:
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but ...

> Not sure whether you would like to commit this now and do the lager
> rework as a followup patch. That would be fine by me.

... no, I'd rather do this in a single step. In its current shape the
patch is actually moving us in the opposite direction.

Jan


