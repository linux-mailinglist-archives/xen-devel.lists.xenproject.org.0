Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44FF4FE5AA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 18:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303735.518182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neJDE-00062t-Ha; Tue, 12 Apr 2022 16:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303735.518182; Tue, 12 Apr 2022 16:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neJDE-0005zQ-E0; Tue, 12 Apr 2022 16:17:52 +0000
Received: by outflank-mailman (input) for mailman id 303735;
 Tue, 12 Apr 2022 16:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUK/=UW=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1neJDC-0005zD-Ls
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 16:17:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18960467-ba7c-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 18:17:49 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-VUkk-cx7MHy8dJXosEnCxQ-1; Tue, 12 Apr 2022 18:17:47 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by PAXPR04MB8176.eurprd04.prod.outlook.com (2603:10a6:102:1c9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 16:17:46 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%6]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 16:17:45 +0000
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
X-Inumbo-ID: 18960467-ba7c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649780269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sWERHgfV9sV13JTJfNMZxFStRVYvJ2bYXVFtyWmir/E=;
	b=nwYRPngWPxN4yCEY1PXcg5gE9Fy7Q35h44Ox9PXLSPkBJHg0kYJb27Zqs2bf2VbfYE4CHd
	fC5WlvXM2btZ80ZuUhbsslV4D8D4UA/LiIK4sRtquq4RV7ZkGmWDrch2oRgJCpXdpmDLvF
	8GBMtyI78OBpvvMGEEt0jyj/le5bBvQ=
X-MC-Unique: VUkk-cx7MHy8dJXosEnCxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1i6+C9WuFsN30dfmLZzyBu09FxnImpOF2EC/UTyaEujtCE2dJz5yoEXPmN6t5/lW9A75ZKKsTfD/ruMoOBoq7t5G1Fy+9EacPOEbR9yLLBsXAQaWa7CF+uv+qyDkVk5BD7kez3fDxSzCgPxP4c4oqer2Ih2ZXAIUge+b8ykx9QbzZJguhyx0Uha+UtwLHVEALLeSN2Wdk7/Ikb72JbLNtlTvsFwlxBbbRm0Q7Op09y3TP8IyJXgchmk5SBtONhKpqbMR16PnDOBrH8RMZ16tHwr1sEY59F7JQ2PdGQhTN/YZBGzP57HjFWWaavAsWlrLJ3y71+mFRGxnnfZqUndSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWERHgfV9sV13JTJfNMZxFStRVYvJ2bYXVFtyWmir/E=;
 b=YTbzatTFok7GR5aJNFPFlTfjLcW2AdiKUcyiRFEQMLcabBlLdo4DqdHzv/4lbfyqMGtFArS1DliaW7kXtIlra2iKhEUOFMz/3ElZsCS2sD254y9emiGMka6Vzfue/JItJfxvwejYjEalW9/hxL0n7lVPd7L5ir7SJAiT3oiqvOJP3oT6gdZpjK6q8twWL6k20o+w29GYM2qnCI8Y/Kg/kJTCoTBFCzkio0RtJVEOSBgv+sDpmdGb1AEl1nwxqzYmkvdyi3dsg6ZCdbjZa0gNBoYhu195pFcCGJsyRvddmLrIJOuFlk9S7FWBG4sJjThJSTudjYUrPVvSKzXczLHBAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>, "ohering@suse.de"
	<ohering@suse.de>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Topic: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Index: AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAIAABpgAgAABqgA=
Date: Tue, 12 Apr 2022 16:17:45 +0000
Message-ID: <6b17c74ff6112a6b165ffeeabc2d9b29f5697583.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
	 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
	 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
In-Reply-To: <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7707c1b-7d85-463c-7533-08da1c9ffac1
x-ms-traffictypediagnostic: PAXPR04MB8176:EE_
x-microsoft-antispam-prvs:
 <PAXPR04MB8176F911208AE1B710A7E3A2C5ED9@PAXPR04MB8176.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YEubphEMa6J14+m6rDMcCW+eW8YYWSHciWUEPa7crG8zC4X5qIR31heQtiR3n231SxltaYUwEOfHNbGZN4CfWYlV/akY0zH/yalZnvOoGwypBkNXd3EqrxC5gm7nhhjhDoiPwqoixOes862fqtwtw86BLMUbRkuos+Lqn53vPpTVpkjoD1CT0+/eUBLCbQ6Y6ACpVcxz20gCHBCWAnpJn2dB+gN/U78yCD02myVDZWMet+xt6dgPCBiVUfWqdoGZ4pelP4v2ZLGoK+oBpR5ecPgrlOzB0nbjC+C5TmCr/qOSRlHJKk7RhQkfk1UpevqUfdJqN7Ia1EgdwbRNbS2Y/NFtGUeSK8IKzMzGJ5ywVHYnEyHQs7b1fxLpH/G7timTCkVbErME0SK9NsiW9WHifYFh+qqc0FcCiMk23ORcSvqb+e9eOTw1QNVve7SC/ICKdyt4IbVafS8aEoGydRXbQFaFw4/3lCDabAgMGVhBUDfvomWAj4tvHKrRnOVTIfe/YsakWLK1A/g/VEne5vzqiuk6KB8P4QDg316QwHZP47AJfHh2Dj9xRWtmWAESsdfSt9JSCZCK0StCDYtkpe9QDHnv2Q9nllyhnwBtXsnxFBrrGSVuUJ7nTT3UkT+InF/bAkP5Yjfk2mqHtNrYuMFCs8UJ83Ojr1D74YMSzYppmD/Vb1lvWuRc1rQepg12M3100zMzMl5lx/9HlgY60gN0lVfjGZXzwWzTuK3LooxJnZZZ+3jWQzyXP1zj6RxCTVSQWOXjGO8L+4lHsmkxAOQ+hmaZpUJcoHECVFtGbhHdCU4Agjj22rLWE3YQl+56MRVF2N8bOPMttuU5w/B3WKJGSg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(2616005)(54906003)(71200400001)(6862004)(66946007)(2906002)(66446008)(37006003)(316002)(8676002)(4744005)(4326008)(66476007)(66556008)(76116006)(38100700002)(36756003)(508600001)(6486002)(966005)(122000001)(186003)(64756008)(6636002)(91956017)(5660300002)(8936002)(99936003)(6506007)(6512007)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkJxVkprS2JiaHlwd280TUQrMHF2VHl2ZHFiT09RbHFQZXdzTFJtSy8vN2hL?=
 =?utf-8?B?M04zclI4eXZDNkFIOUx2dzNUNmprcVoxWHZ3Wno1Y3NteHJCd3ZzVHh3dDJN?=
 =?utf-8?B?N3E4bTN1a09pSURETGJrUURsbGljSFZLNzZRbHpzT2R4aFBIUWNTWnc5dity?=
 =?utf-8?B?b3JybVo1MFU1U3RaZnVCMU5pWm1pM0JIVjNvQy9wR1ZROXpxSHczTFBmWEl1?=
 =?utf-8?B?MUZGaHp6Skp5LzdpUDh6d29NQ0tRS1VYWXdoL25hQ0ZTN1hzYXlicDhwbyt3?=
 =?utf-8?B?akFQZkFvK2VlZWxKS0RIZ1FpRktBSlhyVy9HYXdoNzFHdWpWaFEzMlN3Qk1m?=
 =?utf-8?B?YXY5QTErblJaQmxDOHhUQ1g1Q2lxaExWOXBqdEFLVmxNeGN6SW5HN0J3Tzdv?=
 =?utf-8?B?Z3VlS1MzQWZEY3NTNWFNQ3pYV2V3UkdNSUZKRXlkS0pNSXFPc2NnVTFrTTJH?=
 =?utf-8?B?WmU4aUczN2liRDBVYitQWVpkNTI2ekI3Q0NuSDBnTks4REVmVjhWeG5WMXR2?=
 =?utf-8?B?cHBManpzUGJiWkozbkxlcVY5MzJkaWpqZTF5QTJ3NkJIM053cm9XbGdmNkVB?=
 =?utf-8?B?WFdURU1WZ1NTVVVlM2NtM010SUk1Ry90VVo0dWYwZEczeFpxMVpJU09PTXlS?=
 =?utf-8?B?eThEaFRmK2piSWZENVFJVjhJYXhVbndmZnd1ZHp2dE15czVvOUJIdmRSaEoy?=
 =?utf-8?B?UzVwdTZudjI4V09RcEJIbXFRa3hzZVhvcGZ2bzRCVVFEcUY1elNraStEcU9y?=
 =?utf-8?B?bVVTYjZLc2ovUnRmTHRhYitjVnlVZlRqVXI2emhFRHQyczRvS2lNWHRRcC9t?=
 =?utf-8?B?WUhPSTFJcWtiUEpKdW9EWDBZU0JxU3cyTWVVZ1NCTi9LUjE4VjVyM1R3Y2hD?=
 =?utf-8?B?VlZyYnVCVFdYMkNycWE4bzI5azlKQVl2M1hsTUFja0JMdGlhano3ZWQybEU4?=
 =?utf-8?B?UHVQOHYrUWNnRTRGbUcxTmN0S3haMFlLc1ZlenJrVVlUbjNVRTRibk93bDZi?=
 =?utf-8?B?MjIzTTk5bkdUZ3c2WE96c3VrdW8yYnNjdXlnS2lvSXV5bi9zS0RtOG1TMXlP?=
 =?utf-8?B?ZXRlSHJ1amdsczhTUFVjQjBDZUdxYTJyVG92VENtclc5b1d4L0lTQ1ZwMjlh?=
 =?utf-8?B?SmlNQVVwRzFkc1lTRGJLbjhhUVNJU1JQY3lGSktvcXRGOTRrb2xBK1BKVEVr?=
 =?utf-8?B?VXF3cE5OZ25kTXdpVDFuMWJXTFV2NUF5Z0UzQnBuK3VGMFZ3ZnRiUE4yMlhX?=
 =?utf-8?B?REJsenFSSG8ybHdRYkY1aDdzemI4ci9ETzBabjRzVldmYUlkVU1oQk9JVnlB?=
 =?utf-8?B?T1A1YU5zTUIzU3lrYStlSVVnNEF5bWlKdHBNY3lMakxiRkgxcmMzRlZPaFg0?=
 =?utf-8?B?dDRqd0tNSDJZTDd0WWFZY2hINmtUbjFhWUU5WUk4SmRuQUdpV1YxRG1mUkY1?=
 =?utf-8?B?K3lraWZ5SE1STms3SklpaU0xTlNYTFNPZDdMTmpYd3FBNHV1NXcxM0V1SUJy?=
 =?utf-8?B?eEl2azdUV1drR0J4eW5GSk1FTFZCcEdSVlF3ZC9SYzMyMXZjMFZTZU9WSEN2?=
 =?utf-8?B?YkNmb1FQM3hkZVB3R2hNVm52djVuaXUvTVhabWszUjlXT1RuaUtsVXdwbGQx?=
 =?utf-8?B?bFNwZlEwZjFCOE5EV3ZWK1ZGMFRwaW40RXlGTVhpTnBXQjlPUnlHS3dRWkdm?=
 =?utf-8?B?YmZ2QXRoaTFzbFZoZm9POHZ0K0IzOTRUM05BbHdUTEE5WnBraGZRWjRQeEZh?=
 =?utf-8?B?SnY0dzRPOHhxb3dJWXFQdVhBTFd3ZGY2SFVQejZmd1pxNVppazhyV3dSNCs5?=
 =?utf-8?B?M2JHTm8wbWN3OSt3NG9YZWM0QWFoVEV5Si9WWTVBRWZaYlRwckd4Mjh2Tmt3?=
 =?utf-8?B?YXdybEYzS2poUnY1UndwVGZFcEtwQXVqTGFvbWVKYUtiVjVIeGNpcXdZRk13?=
 =?utf-8?B?YWR3UEozMHFqZXVqZHRjK3RxNldkZGpxdlJEbjNWd2FyZnVIRDBhQ2NZa2xr?=
 =?utf-8?B?Zlp5ZWpDaUtqQjc4OFpiU2V3TWQ2ajU3R0p0SVQ1ZGliMEhLVGZjTHdRMm9v?=
 =?utf-8?B?cGVzTFhsSldTSFNUbWFlU1pUY0ZZUk5idWJjeHB5NHlUbkw5RHpBU3NBMnUw?=
 =?utf-8?B?cDNXVUQ0elBISVJRR3FVUmVaN3BOb2RDTjdzc1Z6MGlPQXBoNExlUGVuSHF5?=
 =?utf-8?B?Y3VIaFhBZ0ZzYnZoZVRid2xkSWFBMVhGVnp3aEtyMFJTdWhiRWZJSXNpeWdj?=
 =?utf-8?B?b2lHRmpEVStrWnA1NVl0cW1ReEdScGgvVzR6T3BPNHdxRkwxaFdhZUdWSUp4?=
 =?utf-8?B?OFltVWJpUU5iSE5YRzRENk1nYjhrdVZ0WjJZT0tUMitoVHJmYjhOdz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aZUWLzv26yiAiYaA7vcC"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7707c1b-7d85-463c-7533-08da1c9ffac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 16:17:45.7613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TVQQxqrpQQJ/S6nOzLmQ0yER4ejV7CD8+M26oKbnh9NfxsOt++2x560rFoEJW18aNLY0jPo1pZLOsjXXKj7MVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8176

--=-aZUWLzv26yiAiYaA7vcC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-04-12 at 16:11 +0000, Dario Faggioli wrote:
> +=C2=A0=C2=A0=C2=A0 else if ( is_hardware_domain(d) )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * In absence of dom0_vc=
pus_pin, the hard and soft affinity
> of
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * domain-0 is controlle=
d by the dom0_nodes parameter. At
> this point
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it has been parsed an=
d decoded, and we have the result of
> that
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in the dom0_cpus mask=
.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !dom0_affinity_relaxed )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_set_affinity(unit, &dom0_cpus, &cpumask_all);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched=
_set_affinity(unit, &cpumask_all, &dom0_cpus);
> +=C2=A0=C2=A0=C2=A0 }
>
Oh, one thing: AFAICT, it's fine to use, e.g., dom0_affinity_relaxed
(that iis __initdata) here.

But I'm never too sure whenever I touch stuff like that... Is it
actually fine?

If no, I think we can drop the annotation, or add non initdata-
variables.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-aZUWLzv26yiAiYaA7vcC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJVpikACgkQFkJ4iaW4
c+6E1xAAsl66dPandQ1rBeuHy2wgiXKEiURGrDREbJOeRKSYl8sX3GuF0+t5HG3J
nvnsJnP6NDgZPjPW66tet9ZfbIEOT3JQkyQeiZ+hBZp+vr8RAEsso0Z+hW3i8oSe
5HUwXOaBmcOn1UvHWXfqw1fAE6iZ6oTYHNOA3U/cGRIk8mB/jCr+2REhwYwm2EEN
H4l5/gDbH90AU1LseBBAVyQYWQxudpu2o+VfBQKW/+i4P0fWRPbqxyMERW1R09zn
4RyoAzZNyIZkpyVVqixmqc2B361oCBcvnLfowOG7SPoy/VjTzAXtPT5SrRT6et90
VxsQu9/zShD6JC+NK+JGq18xboA+TPvTOX3hsFVPRWHkIcGnPC2hxIwCHnx/X7bh
19QuZPqhNGSUzjZcQciQHHU33sjaI3SFQ0VvxXtHRxRjF5xHXhG/JJwacQ0kHQRl
+Rex1EqBx5992KHeiTqyXg5vRgtOuyDZhULiJ2Km5sJBZFZ1fLwyFfqfz+0s5vBb
NZ5DX3Kb2H4F117GgIjFgKBgF5nNtoRnlhUPmdDM+10n42RDKBDnqfGopJjh0IvV
J+odRW5EcfYS4kF8wzGMrJ4f4Dp8S7b2RSsT55i6SwkfkOlJ6n383k4t0ma1JpHx
YMr78rK2YpPzhIXYT7CaQ20nN5qwLBfi08l7E04gkD7ZN1iGL3s=
=xdJZ
-----END PGP SIGNATURE-----

--=-aZUWLzv26yiAiYaA7vcC--


