Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA84C45DF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 14:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279092.476638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaVg-0005x7-Vc; Fri, 25 Feb 2022 13:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279092.476638; Fri, 25 Feb 2022 13:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaVg-0005uC-Rl; Fri, 25 Feb 2022 13:19:48 +0000
Received: by outflank-mailman (input) for mailman id 279092;
 Fri, 25 Feb 2022 13:19:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNaVe-0005u6-RG
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 13:19:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e4ac27-963d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 14:19:42 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-jx9S3igMPpS0NoM3RsG62g-1; Fri, 25 Feb 2022 14:19:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 13:19:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:19:41 +0000
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
X-Inumbo-ID: 97e4ac27-963d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645795185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aN++Ou5EpSV4a6TfcLsWZ6X9vUPYMD3uTVmOZ5boP6U=;
	b=B5LxMU+UO23pWBeHhr+T/IY/xQOlZr00giJU4yuaoOuh2WA6U7zsHS3eLV2/yOkx/r1wrU
	ChcQ7HmkMnHPwqvHXSs3InIi5HNjMMjLN/zzYI34+iGP3GAr+ddCMkaqVfCH4esYwzPB6C
	k5XrXujChD0Z7H0CL5DpDGypxLHtA8M=
X-MC-Unique: jx9S3igMPpS0NoM3RsG62g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBRahlXlXTNKe/wnYXzHSXfPiL4MT4SDa6Exoqw4DfjP9lG9ibxhAmeJDjRrR8Q8mAwirgzpkVkI9rGA+dYXjLAh+pSO+pjNJ1R3VW/vQFDHxh0vI9WtZJHmkhGTYVXC4+hrUW58szlFglWuOu2Bt5oiGu2MRQYJCAaF8dPn7pW/sFqAm1SHKIdKSEZP9itcqaTcqrDnUcJVYsDAbJXGFBkfr1C7hkazwFeepPRwuy4XVrZVNHYQyNsIHZdhbr3keN2ZByy9vsNy5V491paWvZ9tqR63z0z9hITnJBlFO2YMyeeMyFGwjEaDoT3oGQazjbpSFTFOu2BdQ+7KpL/s1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pKluLIw0bhgHTRI9o+lm9WG2x0lqHbv0wNACbT5vRA=;
 b=jawnUa7jQQ4FQIjLayEEnrAbDIwZaAq49guMlkuu1O+9kJo6u5we2cv0kzlnRXzFcKWcQg9SdM3m4IahAvEQr0sMWKvG1Lirnqm2U+NqKQzNOT+7eU95iCI6DFfel2a6tYW2Dk7ar/wSR6aHQKjX3yzK28eGcHAq7YSwRelhKkaN64CX5BDomWlfm4U3muDzrGQTTGx0n2m8ECEe/zFwPL+rs9C9CUfQM4wqLb4nxeOYua8hP6wg0uLKjq5wfmZCpGbW/wtvddsOWXTu6+/dcizFhBEPbjq/ymVeR9s46dsaHbui7aIEDnSmOG/vibgRad5gh2An1yQGlXOnr2mtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
Date: Fri, 25 Feb 2022 14:19:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Thiner Logoer <logoerthiner1@163.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e6d96cc-ea01-4188-e608-08d9f8617b64
X-MS-TrafficTypeDiagnostic: VI1PR04MB6830:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68308AAF3308D795D5588729B33E9@VI1PR04MB6830.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sj0wUJ15RtcCRUu8RvVLUY3vQo38TOjQcjP6Tt3V9QHpacQeyRvJhpARxokHglx1x1XmpXlOqqKFvJkyCDTZWYA+l3Eyo3f19i6QJdG+qUh5YAMXLrVOq9BfHN2ToKos8ljhAPeSTf8vlU1i6do2c1z5M90bkDrofZhFvwGNe3RdtnsL1XUpYBx1fLUMQlfpV8sDs2/gYcwzelJ7i9QI1hm5DQkghKYwCFVeHG8Kfb65OpC75kMgIs7BrmLKBbn1oYlanraO4Oe28Z4aF8scWFxPclvIXbt2aMD/73f/VOjgAaSwDfPWRLO5InlWM99bo3+UtCpsXa5kC7vtRZKrIY+ky5uSLZxrpHeJoTxHfKC3hh6dPriJLOEw27eaAtngK6HdHxVrPrxG80BrTEg1LlYYn9ayIktdr5944Mp8hpOjTnfNjWh81VSv+XKLyysRqdUDglS19jyLZIbdMkWLV3JMTpe5qqQml65ViCp2siDu//JLykU6Jwqp98om+vRPWsyr+2JWwv0mfQ7+pNlA1uxMZh+J73ps9JurmU4DiDjH0vhNaZbYE1RbXkCKCG/vxm8vxGyjqKnuExwHRHDQ0QgCT9Dq4p/To9qP5kEOX2IBVqnVv/H0JWsmPrRs92GD4iwPfLHuID1xt6wPyzNhya4xsUuYL1OxtIGFDHpASwkwh3W92ES02eKcI1hB1y5me5T/dZ7eVwzDgJK237hrXPHoUfO/ktua2Vrbu6wUNbG1uMSLsoYLRaahKDJ7fBVh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(86362001)(31696002)(508600001)(31686004)(6486002)(54906003)(6916009)(316002)(66476007)(5660300002)(36756003)(66946007)(66556008)(2616005)(26005)(186003)(4326008)(2906002)(8676002)(6512007)(53546011)(8936002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p4liVpBNUVo+AH5yhzGEOpYAkyXWMPSYYSvSo1AImteyC+KOuAYAcamlqEDc?=
 =?us-ascii?Q?VfIHCqwyZ/G7v3VO19GKfPOAj1vrs71wmIv2XjYPPHtmEQEPhieRPJHkzuTx?=
 =?us-ascii?Q?fpeVaCZ4/fkcjqvh7b/3OVTHZBUlDRsayjMQNt65xxXGH3HrZk1vVB/DgmqU?=
 =?us-ascii?Q?T1ITwbFFX2YcCzWsloUpWnf2bWIjA6SddtS7wjzl5BCkMjm2/22O0+Uw5IJw?=
 =?us-ascii?Q?bPeyGdpZISEhwReueGIuazMjhEtPXoryGqQh/zPusjPSeaj8YQiKEw1bR1hL?=
 =?us-ascii?Q?jpjo0jgqswqWaknIq56wQv5UveOdp4icak9dY8q8QSHhRSqD1ZF4xhzC3aq5?=
 =?us-ascii?Q?xM/NgDAvAKr1YcyrYIiUZqOu4ySi8iIoVrd6u5Ug/ZSHaGMdLm8yJYpI58z8?=
 =?us-ascii?Q?ZfZstsGJFb48f9/jOx8tWF0noCze6H88B98qaxuQ//Iu8XB0ToV09TKj0iRd?=
 =?us-ascii?Q?Ma/JfYPgQ5cga1LEktBZ8Hm++klA/AS915Zc0MG8iZQGfBIVN3Vb/foBIZl+?=
 =?us-ascii?Q?TSsuFTHXJ9mrsMjBiZ5zEKjGcycF4SbiuNBeB9L3JHrK8QGz7k+hPC6eUE9C?=
 =?us-ascii?Q?eksIybOKDuC2ukri7z+FBNT1QFsfBm3t12i7HgMGh+eiNVP0vTlagSUZtzzK?=
 =?us-ascii?Q?w7Mw48aZqcQC3QXauDl0LvNvKBrC7YIp0rxWRfIy0JASWM7Zy0/2D5VoWW12?=
 =?us-ascii?Q?0u4MW9p9npQ6+zNoXGSJRI+ysVklEZIcYO5dgHTxQ7jsXJDLNgMgCKI3P6xp?=
 =?us-ascii?Q?LkSp2FhDjzPR8pK18p8AJ2LzrvCkwgapLrYnKjSQRiFex2iqrKrvwvPpovyG?=
 =?us-ascii?Q?8jiyZs1T+XWuFVWZCpuQtgv8f+JjmJYo8LggcX0ckBGRzuh/vY/k5Yh3n8/I?=
 =?us-ascii?Q?wUWAWKXB6r7SObaAwjuln+J3MS9/WWqur4GfZkLirflhDOPicfoJLyr2svL1?=
 =?us-ascii?Q?jD04cRRtPIY2Z6UBvyFXvzweVToKVbBb0Icd370KcBJ6KdexHcL4lrlvem9Q?=
 =?us-ascii?Q?x2xf4s+w4yiZZVmb2KCVgDEZL5zN2XbfEfg5mTkk3DPWECBWKc/89P1PKroy?=
 =?us-ascii?Q?DygJYTBqvIBcCncJqeT7waMh3GRcc9Ew7mhh2kq5MOogEWtcTybx1YPIqeA1?=
 =?us-ascii?Q?1xrChju4jJYPwl2AmjXKMqSxq2pII2Z3kBLHH/LFkcenxxeL+HilGy2g1yrp?=
 =?us-ascii?Q?FWaTcOCJjTdrmhMSsZunx6+OH+Dhl6m8v32V1EiQWqIgy+uKzaDz9U2QeCfa?=
 =?us-ascii?Q?P0c4OoTN4ZuLX5wwXy7D8Tl/BnIt1LLtsX9vbgrPUR3YvBmh2ui6RVhu03nk?=
 =?us-ascii?Q?C/7GAQ4rajIJkg0B+j3QVFz052APse7s9KZnSDUKiT39C5+yAIg/eB9IHn6o?=
 =?us-ascii?Q?IMNsT2eVhmjtkjbAAdLh1mw6kLFgikAfHU9AlX+4IjkPrz5tHZOlsAnuE5FA?=
 =?us-ascii?Q?BgyUvpJz+H99belryVpOA+qcL23OlZcq4577aq+xstpWYBiXXan3nFDvuW0+?=
 =?us-ascii?Q?DOQhkdamZrjXHxIlfxKtFm7/+pmnhIud8ney2Y+haG6DxXuZYwcqPXnfpmB4?=
 =?us-ascii?Q?CEzOIIIwfvWh+IQweK/RQm1dFyDVou3EU89RHoOFL01ZhE/vJgeI9nV9UvZp?=
 =?us-ascii?Q?X9IY+ByxqaRQdYyM2vwlJfg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6d96cc-ea01-4188-e608-08d9f8617b64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 13:19:41.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSuww95W//Pl0qVlcwV6AMC1WQUfa+PsdvGJ9ZvLB5voTCufNYXraqfjfuPgejK1d385WLOKvXuOqc121bWB9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

On 25.02.2022 13:28, Andrew Cooper wrote:
> On 25/02/2022 08:44, Jan Beulich wrote:
>> On 24.02.2022 20:48, Andrew Cooper wrote:
>>> In VMX operation, the handling of INIT IPIs is changed.  EXIT_REASON_IN=
IT has
>>> nothing to do with the guest in question, simply signals that an INIT w=
as
>>> received.
>>>
>>> Ignoring the INIT is probably the wrong thing to do, but is helpful for
>>> debugging.  Crashing the domain which happens to be in context is defin=
itely
>>> wrong.  Print an error message and continue.
>>>
>>> Discovered as collateral damage from when an AP triple faults on S3 res=
ume on
>>> Intel TigerLake platforms.
>> I'm afraid I don't follow the scenario, which was (only) outlined in
>> patch 1: Why would the BSP receive INIT in this case?
>=20
> SHUTDOWN is a signal emitted by a core when it can't continue.=C2=A0 Trip=
le
> fault is one cause, but other sources include a double #MC, etc.
>=20
> Some external component, in the PCH I expect, needs to turn this into a
> platform reset, because one malfunctioning core can't.=C2=A0 It is why a
> triple fault on any logical processor brings the whole system down.

I'm afraid this doesn't answer my question. Clearly the system didn't
shut down. Hence I still don't see why the BSP would see INIT in the
first place.

>> And it also cannot be that the INIT was received by the vCPU while runni=
ng on
>> another CPU:
>=20
> It's nothing (really) to do with the vCPU.=C2=A0 INIT is a external signa=
l to
> the (real) APIC, just like NMI/etc.
>=20
> It is the next VMEntry on a CPU which received INIT that suffers a
> VMEntry failure, and the VMEntry failure has nothing to do with the
> contents of the VMCS.
>=20
> Importantly for Xen however, this isn't applicable for scheduling PV
> vCPUs, which is why dom0 wasn't the one that crashed.=C2=A0 This actually
> meant that dom0 was alive an usable, albeit it sharing all vCPUs on a
> single CPU.
>=20
>=20
> The change in INIT behaviour exists for TXT, where is it critical that
> software can clear secrets from RAM before resetting.=C2=A0 I'm not wanti=
ng
> to get into any of that because it's far more complicated than I have
> time to fix.

I guess there's something hidden behind what you say here, like INIT
only being latched, but this latched state then causing the VM entry
failure. Which would mean that really the INIT was a signal for the
system to shut down / shutting down. In which case arranging to
continue by ignoring the event in VMX looks wrong. Simply crashing
the guest would then be wrong as well, of course. We should shut
down instead.

But I don't think I see the full picture here yet, unless your
mentioning of TXT was actually implying that TXT was active at the
point of the crash (which I don't think was said anywhere).

Jan


