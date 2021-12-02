Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C71466181
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 11:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236456.410176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjN5-0008WO-E2; Thu, 02 Dec 2021 10:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236456.410176; Thu, 02 Dec 2021 10:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjN5-0008TF-8z; Thu, 02 Dec 2021 10:31:23 +0000
Received: by outflank-mailman (input) for mailman id 236456;
 Thu, 02 Dec 2021 10:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb5W=QT=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1msjN4-0008T9-5g
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 10:31:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd825880-535a-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 11:31:21 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-m5-jW8BqMl2VTj0_2my4ig-2; Thu, 02 Dec 2021 11:31:19 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB4690.eurprd04.prod.outlook.com (2603:10a6:208:c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 10:31:17 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::fd58:46b6:86fc:8a94]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::fd58:46b6:86fc:8a94%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 10:31:16 +0000
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
X-Inumbo-ID: fd825880-535a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638441080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uXEUYPbe08YVktXCZLPg8pr1i3t4tt5IZDlbmRI3/BI=;
	b=UlLnWJvAMR4lpaQojL7q+sadACGg9YX2TskofWPSzDRSQnBSlyxq52TlAQn5M14Zd5N5w2
	1jYLpaA69nM/qqA7V0iJdf5yNbq/uRQsj1/c0wg0iGiatXh+rwdD7hH6OlZ2gtmTRSSHyS
	3PvZxG8Y4IidbWafvSxZz32ymxVMBbM=
X-MC-Unique: m5-jW8BqMl2VTj0_2my4ig-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTWKWRTzDt2gn3BwmSD2nei9yngwuQF++jsgxZIxPm2cnRn4eWCkFA9XdC9C2Kzlp6WjWw1KHea7NSxMmjzD/T43opVsZbS2aeUCGm7UoqqyZ2obehkJLnTlwRKcWGreI3A1palYP7310BoZpCo2a0yQ//fk4XoJpcBCpqxieOez7pGkl017Loz6Qz1sX4CkhrW+/LF74oxzhVP2lgzOr0dZVPQgq6J4sDKp2ITUoPQsIxwUBSa4aVRsC21+Qe/Bhi8V1sz/RsxpoH6Qwqp7jgq74apv0m+wtmm+94NR4zkan4B5QELLdal2hW0wrGVTptgH44e0mcOUxzy3pQQRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXEUYPbe08YVktXCZLPg8pr1i3t4tt5IZDlbmRI3/BI=;
 b=T6b9LXAQcVZc1RPWq+NVHkLyxMl6JQ4q3snwALeziaFxdvycLXX6YR7nbzmsnyPRzM6CE2xxL+1JR57LWcchvNb00YytGX77/KzcMpzZLmb1Pn5iHMvpKQY1r0lh6pi5STj18aMon0lGxHJaTeiuEGzpODn0I3lahrfQhWHDB9hjaiOPFhfBFYhjcxMtuYwAEMVb8oE6xKJRHA11Ae+ZYJDAUZL8JwsLNJ9i4DTGHy4hlwKfxoMQIOaVvoThSP4qcuz0vPa7i++sOyKCfhQvLWqg6y0BFGWab0X0s6qYhNOKtPdch0HbKPy+YAeu71Oiq4Jaq1gDJzvXUy9R7diueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
CC: "julien@xen.org" <julien@xen.org>, Juergen Gross <JGross@suse.com>,
	"wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Thread-Topic: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Thread-Index: AQHX52e8Wph6YOT4skyCNra+X/8gVg==
Date: Thu, 2 Dec 2021 10:31:15 +0000
Message-ID: <fb840a1359dbd2f6599146e65596ae378bd45426.camel@suse.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
	 <178aa1cd-b510-7e3a-2074-a2ae261d4975@suse.com>
In-Reply-To: <178aa1cd-b510-7e3a-2074-a2ae261d4975@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.1 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40119b02-6253-4e0d-ce2c-08d9b57edeed
x-ms-traffictypediagnostic: AM0PR04MB4690:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <AM0PR04MB4690F0F0E26EAB4EFCB89FBBC5699@AM0PR04MB4690.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 umo2S4gbxIT+w8QJcZJ9qysKQLqZxxir6XKW1+qqBKWWAFYcr81/7gOMWU7Vlf2Ff9kqSi3eBjQQLgz9uL2bRWiM+cRBdw3EwwmRRsFteKqO9jlWasCU0l5Sqz723+nWcmZ4hHJivev34jB13eNzTmWenvezwG3I0Fy1bvf8EhDNguKTiK2DJxU9ediDhpvj+P/o+WO5GARl5jgN8WwtzLO38OgkuaGOuq3k7QJJpOhrYEfIspDiTLm6WluGPNIJeX+QuUKA5qE5fsEfPK5FeGZWSxrtRq6EGOfqETYWscli3xdTL/yLUTPgBiIcxfe7AgBbmx4FALHdJU+jk4iaZIOqCW2dn1oxvz19Ul8Zm75Wrnvu5TZjSBf5wkdGBtw4VU7tVG/WWTDY2+scEeqPsxhxfN+2OKFYknwSSVAJ27tmj+rfbFpN9XuJfaYxufO8pwU9x/EHR3L4HlNw8kHWd06K/y84tKejCiJDWu2aD8J44qJll6LfKsrH1oILoTHMJRFIZLaGlxlmKdjhVee5rRnHsNndnLTSYUt6TsY4GSIp1OvEr1jty1uo8Nc2Vx9a6KAct76zciLnmWVmyqaeV9VK+6yQLgUQ1Gw/4jvaFhGDFf9j/2ZlNpnZFjP/HM4qP06KNzJiGamdxyKEH6S4Rcomu6cP3K2vWIWqlVjkWVTxW7V39iOMoQEl5/utFGXTfP5pgpLokvea/xTxFAcRYkKC7ZSOnDypR80PW9i2vEQVBej9yf3dCuEJPsfTi9YUxI81UDOVP1f/5VTe/Dtk55Yx8iWsV8EmeKWFEwlqrxGs+Skwv0ye5oiEV14loZ2fpuvr85I7GPEv+yHvmILtgg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(76116006)(83380400001)(110136005)(66556008)(2906002)(6486002)(5660300002)(54906003)(66446008)(66476007)(64756008)(6512007)(8936002)(186003)(91956017)(66946007)(316002)(71200400001)(4326008)(122000001)(36756003)(2616005)(6506007)(4001150100001)(26005)(86362001)(38100700002)(508600001)(966005)(99936003)(53546011)(8676002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTZzMzhiR1EvdTBUUGkzQVI5clUxRWpUdHkvREw2UEdLcUNxb2dVeHhsQW5X?=
 =?utf-8?B?aldyOEQwbTA5V0F4NVZ5Q1h5WnkzRlVYRit5aStYV0crUFlmSUdIdTAwKzdP?=
 =?utf-8?B?dTljMG1KNDBUck14cmQvWHhxODJFS3VWbXRLbmlIbDgyaFF4Z1lZYmNWdHlN?=
 =?utf-8?B?T2pBVmxlSm1kTlBvNmI3WDErdzB5TVhkd29SeStUUnZvV2VmV09ZS0pyNzBp?=
 =?utf-8?B?SlkrbTZncVlZKzJYc0JoYkpOdW9yM3dzMHAzYkpOOWJ5WWxyK2FaSTVWdk1L?=
 =?utf-8?B?N0prSTJaK0JydUx4SVhFY1d1TFMwTjl4R0JFOExwL1dxTmVxQSt4bit3czJS?=
 =?utf-8?B?MS9zbG5DdVppSGZRWGZ6Z0NNb3pPdmtKUnZyWkltUTdFSHpYK0NYQS9aMDFB?=
 =?utf-8?B?OFdqQTg3ekRwU2FRK01jNHByYUpFUVFBVDRrMXBKN2t4bkVCd2thSUVVMHU0?=
 =?utf-8?B?ZXFaVmx5a3VsVnl1SG16NHJwcUFsOURYbXNmeEV3N3JGaFVUZCtQMzVJR25M?=
 =?utf-8?B?YlFqQmJMTXpINzdkQnFGMDQxQ1VBcGhnQXNLSENWQzdTVFZwQmRDNklxbmFI?=
 =?utf-8?B?V0VUejhWdktKc1RqQU81cGNPSzVNVHUxVFhkaW51UDNsV3YvRFpidDJFaUYv?=
 =?utf-8?B?aXBQWFB6M2tXVG10Ny95VElmODQ0eXpIM1cveWUzNmd5cWxUYzhpS2wrZGFW?=
 =?utf-8?B?VnQwdjFndkc0ZXExb0VDQ2tveE90M0dTR1hmR3RSNUtnVXp5VS9BWEdndEJp?=
 =?utf-8?B?cmM3Um5VY1RKNytPWkREUEVOcTRwM3ZuOEY5RjdxVFkzL0MzVFdGNjhVcHY3?=
 =?utf-8?B?dUljbzEwdy91RFBpN0hiWktDRC8yRlIya1pRYlMxYkI2V2tDMFMvaFZtMXNx?=
 =?utf-8?B?eFpnalVjMTQwTnF5V3NDWko0ZmZIMXNEZmtYZ1JZUGUwaEtGbW5HWHhPeDZ3?=
 =?utf-8?B?b1J1cE1IdVVINU0xU3krMTQraXZhWkhRdTE1WVdXRHVSWFhOcEZVU0ZubnlR?=
 =?utf-8?B?SlU4ZWRMTXNJdDduZjhNOHBmZER1bUZBMDV1dUhVMUtnSzBra3RUUVBrRFdU?=
 =?utf-8?B?VEJKdkN3bkZWSVhXMkRIaDlFRUNKUlFVS2xtSmpDdWlCSTFxWU5NR1pSNWNB?=
 =?utf-8?B?TXZqSkRWZzZ3VDRnek5jNEpNZ0x0WXFQTXhjbkx0czBnOVo1bTRacGpQM2lG?=
 =?utf-8?B?ZzNadkMwY0xOSTBlMGVtZEZDRVdKMEJoT01Odk5talR3Y1pTSnlDa05NRlVo?=
 =?utf-8?B?MjlNZE16MzJtaGh2V3dZNkQvSlF4OVlVbUVSQ2x1SXRMdUVVSlZBd3k2eXRU?=
 =?utf-8?B?dU5iaGVacnZZM2V1Y2xoQ3NzclQzZXZjdks5aVdzR3NqaXNBSVMvR2xiS0g1?=
 =?utf-8?B?VTN3cjNMOFY0VWZWTVQxOGRpdlpHOWk1NU0zT0lZUnRIenBJQWppRWdDME5r?=
 =?utf-8?B?clZQSEtsbXJ3TE5VQUthRWJ4NHNuOC9uNm8zSDVWNnNYVDdxVUZ2QW93QVl3?=
 =?utf-8?B?YUU1RkQ3VEJXYTUwMzhqemxURmExdms0NkVRVjNKTk53UkNqUW9YV2c5MW11?=
 =?utf-8?B?Qks5NVpmOEQ2dmdZWVlnb2g4ODl3ZFlBOTFFR2JYeVh6YnhBSnRaTlgwWm1C?=
 =?utf-8?B?bTI1dEt0amdXU3ovcUZtWGZNZDdpOGQ5VW9LeDd2R3l5S2dDTHZzSkRaMXNY?=
 =?utf-8?B?clUxMlV2ZjI3TEF0MW1xaXlxYzVIS2VJMGQ5SGhrbUJKSVovMXQ5Q0VNakwy?=
 =?utf-8?B?UUM5M3FPUDhKaHoyakt2aUNUR3QwVC85YXY3MkltL2Z5Ym1KUHJTbEVYSWRl?=
 =?utf-8?B?eVdkQ014bkh0dU5tNHgzTmVFT2lNSDVmOXE0bW1Ka01MeGhSd3RuZEVSaWlJ?=
 =?utf-8?B?TVBDd3NaMGZlWUZXbUViVm1EaFVGTmRWYUlKZ1prSmFzYmxlQWQ5alVSV3dj?=
 =?utf-8?B?ZkVWdVg4U1JSWVpZT1ladFo5U2FUSG5PWTZSNVFtMVFzWUF1R0JKenB0dEhv?=
 =?utf-8?B?NlB5TVFDSGM4ZU03N2hsUVpkWlJEZ0FOSDhhM3BVMXYwaTdmWFVsQTBMQ2hV?=
 =?utf-8?B?R2VHUjhKcldmbEduVHRIbE5jeDI4R08zbVkwMDhad04yVEVwKzErNExJbzNF?=
 =?utf-8?B?OUNSMHNJb0hoQjl5Nys3MDRkcnE1RmxETzc1eTVEYzU0VVI1UGNsOEpiQmFY?=
 =?utf-8?Q?OmH/W7kg5FZIeX+Hlc6hKT0=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-FeNE+79BmD66IoQK6+q1"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40119b02-6253-4e0d-ce2c-08d9b57edeed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 10:31:15.9149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRmgnTOZwPsq1aXl0UHBbSFRLBgrVj7cyHpe/5xwhevBjdpdA0t9atHACPqaWzqqxE6WyxCWaLX242pVV72SUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4690

--=-FeNE+79BmD66IoQK6+q1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-11-29 at 15:44 +0100, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
> >=20
> > Andrew Cooper (63):
> > =C2=A0 x86: Introduce support for CET-IBT
> > =C2=A0 x86/hypercall: Annotate fnptr targets
> > =C2=A0 xen: Annotate fnptr targets from custom_param()
> > =C2=A0 xen: Annotate fnptr targets from __initcall()
> > =C2=A0 xen: Annotate fnptr targets from notifier callbacks
> > =C2=A0 xen: Annotate fnptr targets from acpi_table_parse()
> > =C2=A0 xen: Annotate fnptr targets from continue_hypercall_on_cpu()
> > =C2=A0 xen: Annotate fnptr targets from init_timer()
> > =C2=A0 xen: Annotate fnptr targets from call_rcu()
> > =C2=A0 xen: Annotate fnptr targets from IPIs
> > =C2=A0 xen: Annotate fnptr targets from open_softirq()
> > =C2=A0 xsm/flask:=C2=A0 Annotate fnptr targets in the security server
> > =C2=A0 xsm: Annotate fnptr targets
> > =C2=A0 xen/sched: Annotate fnptr targets
> > =C2=A0 xen/evtchn: Annotate fnptr targets
> > =C2=A0 xen/hypfs: Annotate fnptr targets
> > =C2=A0 xen/tasklet: Annotate fnptr targets
> > =C2=A0 xen/keyhandler: Annotate fnptr targets
> > =C2=A0 xen/vpci: Annotate fnptr targets
> > =C2=A0 xen/decompress: Annotate fnptr targets
> > =C2=A0 xen/iommu: Annotate fnptr targets
> > =C2=A0 xen/video: Annotate fnptr targets
> > =C2=A0 xen/console: Annotate fnptr targets
> > =C2=A0 xen/misc: Annotate fnptr targets
> > =C2=A0 x86: Annotate fnptr targets from request_irq()
> > =C2=A0 x86/hvm: Annotate fnptr targets from hvm_funcs
> > =C2=A0 x86/hvm: Annotate fnptr targets from device emulation
> > =C2=A0 x86/emul: Annotate fnptr targets
> > =C2=A0 x86/ucode: Annotate fnptr targets
> > =C2=A0 x86/power: Annotate fnptr targets
> > =C2=A0 x86/apic: Annotate fnptr targets
> > =C2=A0 x86/nmi: Annotate fnptr targets
> > =C2=A0 x86/mtrr: Annotate fnptr targets
> > =C2=A0 x86/idle: Annotate fnptr targets
> > =C2=A0 x86/quirks: Annotate fnptr targets
> > =C2=A0 x86/hvmsave: Annotate fnptr targets
> > =C2=A0 x86/mce: Annotate fnptr targets
> > =C2=A0 x86/pmu: Annotate fnptr targets
> > =C2=A0 x86/cpu: Annotate fnptr targets
> > =C2=A0 x86/guest: Annotate fnptr targets
> > =C2=A0 x86/logdirty: Annotate fnptr targets
> > =C2=A0 x86/shadow: Annotate fnptr targets
> > =C2=A0 x86/hap: Annotate fnptr targets
> > =C2=A0 x86/p2m: Annotate fnptr targets
> > =C2=A0 x86/irq: Annotate fnptr targets
> > =C2=A0 x86/aepi: Annotate fnptr targets
> > =C2=A0 x86/psr: Annotate fnptr targets
> > =C2=A0 x86/dpci: Annotate fnptr targets
> > =C2=A0 x86/pt: Annotate fnptr targets
> > =C2=A0 x86/time: Annotate fnptr targets
> > =C2=A0 x86/misc: Annotate fnptr targets
> > =C2=A0 x86/stack: Annotate fnptr targets
> > =C2=A0 x86/bugframe: Annotate fnptr targets
>=20
> Patches 4-55 as applicable
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
Patch 16, xen/sched: Annotate fnptr targets:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

> preferably with the subjects disambiguated and the minor remarks on
> individual patches taken care of one way or another.=C2=A0
>
Yes, FWIW, I agree with Jan here that even just a quick hint at the
purpose of the annotation is desirable.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-FeNE+79BmD66IoQK6+q1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmGooHIACgkQFkJ4iaW4
c+5GDxAAwVWtk3UK3d2iqDOSkHe+OWab+U8fZ5aAP/KJqSTfPNeowZEInyhOhIMZ
UMOR2Jpa7bHLzGQoAQI9KJms11h9H1tajDxOjzpoiQXTLo+oVy6zb4TrebV8L2Ji
DOu9yhf6iTILQaEgzeVPud5+vvkG9PrWpymcKiAh3o9060vVYHP114AXl8sRdx2Z
yH7qkwFGHV13v/7gLWzu4Q/x65jNEN0CT9ugEcGuX8NEldQtQJeR6o77sATqv72v
AducSNbDjJSx56aupf1PoJ2BzlsrJCdBLpQM5qPic1I54mAlbhog6oVgm0sdaeQB
ijp+44ol3eNP1ljwkN+BD/VKvbWM9AyyV7tDuYW1cPEPX9qQH7LiN8SIjxTNFGwA
EI0KjXGH8WshZVFV7eydhLj8rNmu9PF1VrFpr6u3YgAAC1GIBLXAjYXaPd+JXHOB
uCchG6D7d2R1hzwDqTMhxAoV/G8jwyPdLx0R48J75UMTQ6aD2GeoGOb9a7zjDKX4
eALDUogVXVD3CTcCzy0VUTLwTzP5nJGsbNVnlteex/AsquZPTu5onXGWLbJY6xyF
36Gz2KnYMi6VzDLL9ulyBz+K0F+kW7wpP3l5pGUZnPeZJqsd9+Lo9UysZqCFD5Jc
DBbg/iWtb4bKsbRZRsRHRF4lJHRrDSkfjw1YDY6+4YTawCG+FDY=
=R/Rv
-----END PGP SIGNATURE-----

--=-FeNE+79BmD66IoQK6+q1--


