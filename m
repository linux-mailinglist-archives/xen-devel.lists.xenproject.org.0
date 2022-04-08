Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5314F93AC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301423.514411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmf1-0005Sv-7v; Fri, 08 Apr 2022 11:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301423.514411; Fri, 08 Apr 2022 11:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmf1-0005Qi-44; Fri, 08 Apr 2022 11:20:15 +0000
Received: by outflank-mailman (input) for mailman id 301423;
 Fri, 08 Apr 2022 11:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWku=US=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1ncmey-0005QX-Ly
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:20:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da8c6099-b72d-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 13:20:11 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-WZ0QwXQEM22DUp9cl3wqPw-1; Fri, 08 Apr 2022 13:20:09 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by DBBPR04MB7515.eurprd04.prod.outlook.com (2603:10a6:10:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 11:20:08 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa%4]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 11:20:08 +0000
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
X-Inumbo-ID: da8c6099-b72d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649416810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tpHOOFkNLOW3CUFaBJazP3CHbIw6xQpArDcPv3B12+E=;
	b=W+YK+ZZaZ51JHyh7a9U/umdFgcbflfApwo7vF00I/uIb2cC4B6n/theJv7XqYHk3eHhiUd
	G9bGKMNdAzZlyg+J2zDFD66u8r5/OcAacBfRlo6/zRSr6hF1Up0r3POuuIAhG1b2/AWWTw
	Vy0pDIAMgO4ZaQKRsytEK5BQmUi5zeA=
X-MC-Unique: WZ0QwXQEM22DUp9cl3wqPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifEcXAXfrvdCUEwHQJbNupEmU5pm3xBLfExYjJYuekZ4g/2kO7kw6Fx49+giWVp5Xp9RHlkkkaHZ7e5Oa6hNKzPrDdkXADLBzccQgxNyrbL+CKAAh5PCMJjXv6eF1zPFaw555xc0yaGTMS0IL8OeFbCkD4z99nmYL+W6DP6AGkTmtpqi8yvI/zPvUrZyaHhUNqb8OKSvzMOx4D3o7nwcfyoBRKiAyVmL4T27ZNGaZQQVxkic8FRAzUFk3Yhgu7rC7T9yG88MCIc4Mp8mbCNxfAPQq50/OIje8G/eB0bEzCYD1OHY063A3lYvmiy3RD0rOiUib/xzFxE8ypA2mSVjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpHOOFkNLOW3CUFaBJazP3CHbIw6xQpArDcPv3B12+E=;
 b=bMN6j/WqxKAPJseSx9T70Ptm5Gze+NmceuUS4fJ7YKj3fTib2dIJfQvYmnhGZeiycfzFofcb6RH9+AR14OcinNA2Zp97QfP9by8JoKXejsyQBkF2uDXoAXj9cHstxJCKfy1U1yiAeb8XE80A/vONWOYPRRGnx42MB+cEh4++dYMVUeI9vM69bKJLX0aufRiHFboSpVQ+TDTPGMW/BCpb3Giv58q/HkG39N+3GhKFNmkZNFJNGuqLFg1B+W9YCl/hjFwX0tTuYvlJJusr3Vk82l3vpTrNc8mge3rdL7EVRxzv4wbj9/tDajnRMSC05fPqWbWv8G176RDkYcMfx4T/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "ohering@suse.de" <ohering@suse.de>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Topic: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Index: AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2A
Date: Fri, 8 Apr 2022 11:20:07 +0000
Message-ID: <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
In-Reply-To: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62b0a344-f18c-47c9-5794-08da1951bd13
x-ms-traffictypediagnostic: DBBPR04MB7515:EE_
x-microsoft-antispam-prvs:
 <DBBPR04MB7515DC8110F3FF1940B06AC4C5E99@DBBPR04MB7515.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rgz0TjdlEUI87fueMkBDDrmtLV31Kv4qP0mU2nSlHGQABWMybRLHJDkdgRbJu+fbX16d9E4LMO3NUu7oiFPk4Ne6bF7Yxi5kQxI+a8ydUmpUpfKeUD/2Qk2+Wv4bE3iMk6qLgezfEHh24UYZlC0g6ngxmNmwb/KCYntujBufKBQx+zWyH2/4rDT0bZthqO0TZKCczKkd7GuISOiFuxHeOk/DNPl3iqvJ8JH4UFnv4T6hOPdhpFckfH/mUmN/MmKM0MCPpXhwsMtlc8Hc+2QdOuEFLX/W2YL15lITTuQr6bdsMWG1qF5NWlY4l3omQfiqbF4eXIoTs1FhMl363/1U7lJH5Li2tkZaejWqszRShv8ea8Js1mESiU9v8DOadKsXSi8qweZVDAN7oAgd784sH8v/R5Qhh1sThAHfEQcyWbwwZH5SkvGd4dDUK8i1frZ2BqjTzadigeB3/EM3yOT7U37CQa8SK+vcWmGJtnV8nLCLEkNTEt2tRQ69U8gv/uX4mIeQMSLpH0Jqp6gu1jzjPqMypSnSoODGzCRa6hLdN2pL7gHUwqw6dyyyjR1yDpSGcP7mxCu0pWm4AmyuO+Iyx9SotiWNfFj/f+d42giJvP/Y6ggrr4z+B5iOWACkX4ZNwUOxFx73Uk0DWY0RDs+X3fO3hOj6v7+oMe/8dNcxz2PiaG9dlZyI+XabVqa8aIuSLWP4BwhYxqHPEWh6C50WMoZaapGpOoJX9/5H9VbSSRjsRY5xyViTqQ+jh6FwWr+YzfwBE92p+KHljbAHeNIP0bll9vXBJTOEl8K+XyAR76CGlgZGYSGhkN3nwTkF9ZlN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(99936003)(122000001)(38100700002)(316002)(5660300002)(8676002)(66476007)(4326008)(66556008)(64756008)(66446008)(86362001)(71200400001)(66946007)(76116006)(38070700005)(2906002)(91956017)(8936002)(6506007)(6512007)(54906003)(110136005)(36756003)(83380400001)(186003)(6486002)(26005)(966005)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2t6bzIrVVRWcndOMzRJeWswSC9rc2Z0SE9sOW55bkZFVjA1dHdTQ0RUV01G?=
 =?utf-8?B?cjV2ZWdoVGMwZTFwZWxKa0NqNlZLNW5jZStEWlFSdGIzRXNxV1NrQ0M2T0Mr?=
 =?utf-8?B?azZZS28vRjJ0UzUxU0RpWnVIcjYxKzdYZEdCRG5WcmRFKzQrNk8wZEI1Y0Za?=
 =?utf-8?B?T2VmQUhRTksvR0J1am1naHZrbXhTTG9Rb2M3N1hDMUZBbGV2TmxWSkhCOEw4?=
 =?utf-8?B?ZitFT0QxYjdyQWpieGJ4ZUNsaEt1M2c3ZElra2tSR2lzdnZ5VEdSMlBhZmpG?=
 =?utf-8?B?eUlRdlhzc3NiQ2pJSUoyb1VIekdLalpLeCtCR2VSMkVhSzFaazZGVk5WT1Vo?=
 =?utf-8?B?YnZNUWRodFE4b3BpL3J6bXJHQk5XQ1NUdjZSelBaTU91SEl6SHVVUWQ0Ymw3?=
 =?utf-8?B?bXNBMFJ2UGpWSzAvdU1xSVQ0NllYbGZaVGJVbWVvaXRBN3NpejF5aXN0Z1kz?=
 =?utf-8?B?aE9NOG1vYUJPSmFTZm51YWtvVnpyUmU2SzRqWDFwSnpmaWZqbzJ3YldNWUYw?=
 =?utf-8?B?LytXYkgyRndMKzNJbExqME9QSGJPc0syYnU4NHNmeVI1YXhxREhUL2RuNkxD?=
 =?utf-8?B?RXNrQlNGT0lTa25IVCttakhENHFMRHNiMEpBR0M4Ymw0N3ZBUmYrQmQvelBU?=
 =?utf-8?B?UElyQ1RDNHBaREdoWnptWHZ4SDg0K3VydDlUYWdMUGxON1BuL0cwS1RDWkhL?=
 =?utf-8?B?S3N1REZRMnpweEg4ZmVPZStrcnI2ZHVTSy9hb0xORER4a3dXYTlMQmc1MjlW?=
 =?utf-8?B?K2hGSzFNeU9Oa05QQWkzeS9BbXFDY2o0VTMxb1Q4bzBtTVl2M3hJWTR1M0hG?=
 =?utf-8?B?SklMM2FqTTU5cGo2bVhYMjRlTkcwckdaUUxjNllTQmV2Q2phQUdnT1BRWTgw?=
 =?utf-8?B?YlpDMU1mYlljaGd1TWk2aHg0WkRHVnBMZmtMdWhaL0lQcFg5YVU2Qzg0eEIx?=
 =?utf-8?B?MnVibkRLQUkyOFMwK1ZxVE5MWE4rYi9HSVZlOHlyTlBYMWR2RVUwbmVuWEFI?=
 =?utf-8?B?eDVBSTNtWDVsQWFKYVY1ZzlIcG1SWmtPRDQ5d04zQkpmM0FFUW80d1Iya0h0?=
 =?utf-8?B?Y2RHczNHM0hoVDRXNlM3eHJGRjNxTjRHcGdQRkl0cjkzTDl1Q3NSaW9BeDl2?=
 =?utf-8?B?bEl3MnhUQjFNeDJ0Q1dxNzg5TjU1OGhqZWoxY3htZkNjOGpndDVmNmZxbEVq?=
 =?utf-8?B?NlhsbjQ5NFZpSEpuUUsvdWlTUElPZWpJK2QvenBrM1B5S1FCU0VBTXM2TXFF?=
 =?utf-8?B?TzdmbkRjc1I0NU44VmZWV3ZZNXA4ZGRPbFRCM24yOVVHSkdPZUl3T3pCZFpF?=
 =?utf-8?B?VmY5bDFKMnpNRkVWNlBJblN6MW1ER0dtRVJQTkhpUWFWcDRiNlVXMmk2ME41?=
 =?utf-8?B?L1YxaWVXL3ViYVJrc1RXVnNYWmlROEFHbmovdWptSnh0OHhkSCswNlNUdFpB?=
 =?utf-8?B?ZkhUUnJJYVpHa1VDYSs4Zk16QWlyZE8zUUZjSzhvOW1LTm9pUUU3eVFKMElD?=
 =?utf-8?B?ZW1jMkhReUl1a1ZLd0VJYTl4MFlMaGRjT01vRk14alo0ekJPUTQ4UnV6K1Bk?=
 =?utf-8?B?emZJTDdDZnhXWU1DNU1hQ3J3UlE5b2xEeDJVS2UwaXcvZjlMWlRPUkVvNnov?=
 =?utf-8?B?aURsUE5lTDdUS1B2ZVQ5ckltRkxlNXRTck5DYjZjSUhWVm12L0VhMWZNRnVU?=
 =?utf-8?B?aVZSQkNNelBsVGhkRzZoQ1FyOE42VGIxMHpXYk03ZkM0UUpVWTNseGRsaGZo?=
 =?utf-8?B?WHhTTC9rRXU0T0xyemt4cUovR0VNcm5RMFFUNUNlekc5ZEFYaHl5NTZHRkxj?=
 =?utf-8?B?KzNpWGJiRGdGMmR6L2pQUjJ2UHpWZUJhQjNsVVVBSGo5aGQydTF5ODZWTWtM?=
 =?utf-8?B?Y01FajFoVVFWZTZIY0JBbXNjVFZkQ1BtWGxzaENJSXpMcjZuWTNmdDdUVHp2?=
 =?utf-8?B?V2o4K2NFYUp1V1d6dnBQQnFHazRsaDZpWUM4UFYvTWkwbGdvdnZES09EdXZo?=
 =?utf-8?B?RjFvWXF0ZkdXcWF5MEdINkZyNHNBdUQ4T3d3VmZSZDFVOUY3K0x1NlBKQ3RL?=
 =?utf-8?B?ODZ5UksvOEg0c2NHbUhYTjhTNE5UbmxFK1lUWTVRWWhYK1J6Q2llekhwUVRD?=
 =?utf-8?B?cTEwd0huZlRhUEcwK0xvN2dCamNIcEluaVNkQnFZTTUxbEh2MUl0T0lsdHA2?=
 =?utf-8?B?b3J2Ti9yWFBRRVU5RDhtTmt4aWgrM1M1THhXYWozU09EOUl5L085eGRXQWZz?=
 =?utf-8?B?eDYycno4b2wvUWZYbGVYTU0yRE9SZkFrVDdzTWlWY3VXUU0wZE1mTGswS3Fp?=
 =?utf-8?B?b1RIdkczeEJSbXJ3a2JETGx0czBzUzZoSEJQTXByRXBUVmdLQkU3UT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-BrWJb1CqFi2RJpl9K0CU"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b0a344-f18c-47c9-5794-08da1951bd13
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 11:20:08.0459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IQJw+f0K08aBUieHB6JfEIBK3uAprTgUYA1h4XKBHu8fVTW7JhUAD+1QOic/TqZACWW/5SH5sQaa0xj/Pvxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515

--=-BrWJb1CqFi2RJpl9K0CU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-04-07 at 15:27 +0200, Jan Beulich wrote:
> ---
> The Fixes: tag isn't very precise - it's rather the commit exposing
> the
> issue by default. I haven't been able to identify the actual commit
> which did introduce the problem; it may well be that it has always
> been
> there since the introduction of credit2.
>=20
> Credit2 moving the vCPU-s off of their initially assigned ones right
> away of course renders sched_select_initial_cpu()'s use of
> cpu_cycle()
> pretty useless.
>
Mmm... you mean that Credit2 is moving the vCPUs off they're assigned
ones _right_now_, or that it will, with this patch?

If you mean the former, I'm not sure it is. In fact, when
sched_select_initial_cpu() is called for dom0, dom0's node affinity is
just all nodes, isn't it? So, the we can pick any CPU in the cpupool,
and we use cycle to try to spread the vCPUs kind of evenly.

If you mean after this patch, well, sure, but that's normal. Again,
when we pick the initial CPU, we still don't know that the vCPUs have
an affinity. Or, actually, we know that in sched_setup_dom0_vcpus(),
but there's no direct way to tell it to sched_init_vcpu() (and hence
sched_select_initial_cpu()).

That's because, by default, affinity is just "all cpus", when we create
the vCPUs, and we change that later, if they have one already (due to
it being present in the config file, or in the dom0_nodes parameter).

Something that *maybe* we can try, since we're handling dom0 vCPUs
specially anyway, is to directly set dom0's node affinity to the nodes
of the CPUs we have in dom0_cpus, before calling vcpu_create() (in
sched_setup_dom0_vcpus(), of course).

This should make sched_select_initial_cpu() pick one of the "correct"
CPUs in the first place. But I don't know if it's worth, neither if
we'll still need this patch anyway (I have to check more thoroughly).

>  But I guess that's still useful for other schedulers.
> I wonder though whether sched_init_vcpu() shouldn't use the CPU map
> calculated by sched_select_initial_cpu() for its call to
> sched_set_affinity() in the non-pinned case, rather than setting
> "all".
>
If we do that, and there's no affinity configured for the guest, or no
"dom0_nodes=3D", when will we reset the affinity to all, which what it
should be in such a case?

Also, if I'm right in my reasoning above, when we come from
sched_setup_dom0_vcpus(), the mast calculated by
sched_select_initial_cpu() is basically cpupool0's cpus_valid, so this
wouldn't really change anything for the problem we're trying to solve
here.

> (I guess doing so might mask the issue at hand, but I think the
> change
> here would still be applicable at least from an abstract pov.)
>=20
I don't think it would mask it, but I do think that, yes, the change
you're making would still be applicable.

And, about it, One thing...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3403,9 +3403,15 @@ void __init sched_setup_dom0_vcpus(struc
> =C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_sched_unit ( d,=
 unit )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinl=
ock_t *lock =3D unit_schedule_lock_irq(unit);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit, &dom0_cpus, NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
sched_set_affinity(unit, NULL, &dom0_cpus);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_unit_migrate_start(unit);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unit_=
schedule_unlock_irq(lock, unit);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_unit_migrate_finish(unit);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
... The result of this (also considering the call to
domain_update_node_affinity()) ends up looking very similar to what
we'd get if, instead of calling sched_set_affinity(), we call
vcpu_set_affinity().

I'm therefore wondering if we should try to just do that... But I'm not
sure, mostly because that would mean calling
domain_update_node_affinity() for all dom0's vCPUs, which is clearly
less efficient than just calling it once at the end.

So I'm thinking that we can indeed do it like this, and add a comment.

Anyone else any thoughts?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-BrWJb1CqFi2RJpl9K0CU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJQGmcACgkQFkJ4iaW4
c+4uEQ//WnkUf1ReyzLAcyfHdp5yUXA7m0Ybvm7FPjFQLbUf9xHfyDue28XVxpWs
3RDmCkuTGb5/JyO4Jd4EEtnmPa11N4UCeGF7/c9vZNprBfCFFvNsRDSzVQKRnJTO
MlIKqcQ8/mgAHnjNHWKoR142XW1iRnoFqStgXhxT95lqdICruqHabYJzW+7i60HF
MFDQEuYx98Klx1MilWhwIUbUHcm5qwuHb8RyDM4vmksqIzZbWiCR+OIczlvPMOVE
jL7skqph9Cgj3g/Fl/RylDG0/IDsL4nPTTiEA2/MpZE2ar0kNqphq/X0kLYTu0HI
SVb2rGpTmqiWUgzT0a+FX4Es5HMe1VNyPVcY5PHjiyVgeGN2Sv7MVaPpeoPBBR2J
gf0LSmGgcxC0xQ7B7r5i2INYnmwodVJ4a9rxmVQmiF4G0656W9GV1v5QJKMJ2LgB
08eJg140xAH7J4vH9oek2vIfJK/m7chPWB/JmqGWXMw/dcErXGvSy7gf0PpJfOkV
3O8rZyacpz4fhURC61FPpfBPknF0l3r7iCKQ7r6CUfhZyJOrRkTH+h+3aJt1RnYN
nR0cWOLFw0aIG4E1ypqHtW2NFBy/hRAiJg8wulAvKds0Hvii9t9RfaJkHaDa+U5C
p9RkjT1QtTiRh4OUS3Zu8Ith6sqXjW2VFDWB7ftPr6pqFs12v28=
=BnT8
-----END PGP SIGNATURE-----

--=-BrWJb1CqFi2RJpl9K0CU--


