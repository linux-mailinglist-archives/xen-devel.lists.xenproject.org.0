Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC84F92EF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301333.514245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclrn-0006xo-Kg; Fri, 08 Apr 2022 10:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301333.514245; Fri, 08 Apr 2022 10:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclrn-0006v9-Hj; Fri, 08 Apr 2022 10:29:23 +0000
Received: by outflank-mailman (input) for mailman id 301333;
 Fri, 08 Apr 2022 10:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWku=US=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nclrm-0006v1-3W
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:29:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c05fea3d-b726-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:29:20 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-B9XIrisXNxunwhQ6KZw_fw-1; Fri, 08 Apr 2022 12:29:19 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by HE1PR0401MB2316.eurprd04.prod.outlook.com (2603:10a6:3:23::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:29:17 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa%4]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 10:29:17 +0000
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
X-Inumbo-ID: c05fea3d-b726-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649413760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi3gBZqVU9GOiA6inmQOKJ+XPy6pK8sUY8RJrVxwmNk=;
	b=K72aWyALg2Vxkshhq14WT/BEfq1fGnYRNv/KJIBbPY0RLwwqTSsmlIHUHAd5N0nfZvmBI8
	V3cJrF6FmPfrkzxEYK5U/VVj4FCiqKA7TLTThTBrb/CnQEtpYaCQbys+pQSK8+oJ2YThDz
	pLEkv7O+d3YHxu9WaAfa70CMoE+XboE=
X-MC-Unique: B9XIrisXNxunwhQ6KZw_fw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWjX7B8UakHSoxtHGlksbe3Rj1KYKRSkAp1INwTtoOOPqli41z1CYwmh+zLr+DjyAIqewVIKcbD0VeohlggtpVHFVyFyw7QN++s7ijzWEbMxz8PGi5P3HdhJtd0YvYAoAS+7X6ru5kOen9sl76Il2Fev22gXOuxvaZCahnZwFc0ArL/fGa8+BNJQF0Xo8PE/3gc6Lq4FfM+u85KJ6b0hJ1qbJAp0OoCBfKNl5NwJs6l3pVZzYenk6X++xUlF+k6DvFZEuC7tbWCe6hivJ9sneQ8gfuwBEgTGy6RDjmTnPqI1/2vrMXNXzTcBjeXspyAXdn7PSd9fe35VdCmgBvOhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi3gBZqVU9GOiA6inmQOKJ+XPy6pK8sUY8RJrVxwmNk=;
 b=ONxganN/CFdMkZgQjzYHE9SrQftnBL0sXuJwx7CF/vz6zN5Ns4pnbhR+lGZt5s+eIfY5yrAxerpEulnsx3zydVXnpEhMADLKUXW82isu9Fp+wfb5thwp082NBHSEqpjrRIereWeOJ6MvD2qvfCwj5mARiDLW+lYjnATOewaRiT6VPcGzuKmfcRcSmGuCPJamoGbwBHRFsX2NiOcNbcoG9hvrVD+Hrg5fqmOLGE03aLxEBMJSDqfD4RILYG6S0+LZRrD6AiQCQpzo7sxm83FlXC6fTvfL5HZ18Zocdo8mFJdNZOqrCG4h8OsrEH6beTyT/J9x/g1D+H1oRc2TsO5aIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "luca.fancellu@arm.com" <luca.fancellu@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, Jan Beulich <JBeulich@suse.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "wl@xen.org"
	<wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"wei.chen@arm.com" <wei.chen@arm.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 3/6] xen/sched: retrieve scheduler id by name
Thread-Topic: [PATCH v6 3/6] xen/sched: retrieve scheduler id by name
Thread-Index: AQHYSyUE9E7urcTvC0i0eb3jd4Nypazl0LOA
Date: Fri, 8 Apr 2022 10:29:16 +0000
Message-ID: <a33a1cc55573a1e8d32bb22da31b17058ba76d53.camel@suse.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
	 <20220408084517.33082-4-luca.fancellu@arm.com>
In-Reply-To: <20220408084517.33082-4-luca.fancellu@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 936821b8-f875-4708-7984-08da194aa2aa
x-ms-traffictypediagnostic: HE1PR0401MB2316:EE_
x-microsoft-antispam-prvs:
 <HE1PR0401MB2316AA00A9E86DDA372BEBAEC5E99@HE1PR0401MB2316.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OhGW18rR/9hLgo1Aa+h7ADxHFfg34LN6VOjiiXO7IwP91tP4nF+ZSoGIM5HF7UtX920pbVea0mvrsqRoVhvEeI9OAbLt8ec1H9VjBj4+F834ByqXHbuUaCr5dG2QEQmltD8VWI5Ft+0wiVXfDX280dBIBsPgh2qB0IBvzDx4Z3ULdkZIXqzh+oLJBpayNCNJJ7k0wvQCbLRtwtxQvQTxhu7J7/LUkUl3Er+sA0XiFoknJrwDWLU/Xcniads+wd7ltL0VVDaZsSltwvqSd4366PSBgL7WDvL/ihux1F0V4Mfg88NjM50idJb1fMl0Rk7HzWh3D4uZbf+pP26tdhzzZxIQVl0nOT9YMq4rdlbsoGEANyZLxjtOwK5UV1AgakPuFC8JLK4V5udaOl8K3zeMS5oViU8zWSVEqpuab1vmcVoCAu9apJySbfa4O5lEk7G8cp2xhiqLPt0DbBlgl6ZvB3IGSshXsvXxmIS6twXeaF1na5895m64pVw4x4JRaky5YQmP3RmnKigIfQTHRTNo02ZZwR3dcLjgiWmwLjBRIoi0P1+D+2w/SptBfjFDIQgXfXosH2N63DZsdu2jMUizu6i74ksxq1VVdfWKBKYhz8BHLAMAqbqL70WLyAoE84k/IjqIZ2pDAxSrKZIVxvOAHziPN3McRQX9E5RVfRIfjs819+WuBzVLfaGGX9wRKZRSRccMOOrqgGuEDsgqzwMB9lyAjGtc10AVYXwB4DpbYtFYaCMgrDpuOIs2TX3/YdQQ0ze8DIx3ZEAlFtD8L7FLyfK91IQh1sHUKY4NXcDp5HozoZwHEBy+e5QIiOj7X8fN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(86362001)(122000001)(186003)(66556008)(66946007)(38100700002)(76116006)(66476007)(91956017)(99936003)(8936002)(2906002)(36756003)(8676002)(4744005)(38070700005)(64756008)(66446008)(5660300002)(71200400001)(6512007)(2616005)(26005)(54906003)(110136005)(508600001)(6486002)(6506007)(316002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFhNemw1T0pSYklrREtKNWlldGkrbEtMVVd0OUxHL2IyakVLcS9rbVA0YzV0?=
 =?utf-8?B?cGdhelJwMlM1a3RpNnl5bkMxbFdLRzRpbWhFUGp0L3FRUUtWUFJ0YmdCcFM0?=
 =?utf-8?B?d1pJK0hSM2NYRm80ZjlnZDhqVG1Zb09QeDF2L2lIeHBUbWxFbTJ4ZWl5SkxB?=
 =?utf-8?B?VnRWUHlZY2JVeW5QMzByTFpQRGNodmJpUkNpc2s5ZUhwNktvL29hL3RiSmNV?=
 =?utf-8?B?TXRIaEZiSEUxZCtsRmFFREVDdTBNZ2FQWk1XaGh0dnhockNiSjFyWEtyTGZz?=
 =?utf-8?B?eDFqUTJjb2lIWEkzb0FwM2dOVzFGUW9VNnJ4MjVXRWdRdjVVY1F5SktWYkJt?=
 =?utf-8?B?aS8xdFQwcEZ0UE5aSEdlWDRQaTRBZ29GMmp0VXgxRVZHb3JsaExIamxOYy9Y?=
 =?utf-8?B?NVJMd2FPUldrS1Nzd2ljU3owdWdjd0hmV21iZmVsT1JwK0pzZ0tCVklVM2RC?=
 =?utf-8?B?S0pnWUJSMHNGS09kTGs0Q29lWUdRNGI4V3prbm5lTFIvb2R5RFJKTi82Sk55?=
 =?utf-8?B?VkFHalBLemVzRTRyWFRxRmg2dTRDQ2ZxaG1wYzJLRGdzeWFzdlRBN0RXam9J?=
 =?utf-8?B?UWJlbWs0Rjl1Y2pvYmUxZnVnK1RNK2JCWTFsTDNjMUJWVGNENjdudTVFTGZX?=
 =?utf-8?B?SjVoanUzNDNubDgrdDNNOXdwMFNLUjkvbTJXQ0xMWW5TVFN0NjdwM3F5aFhM?=
 =?utf-8?B?eS90dkp3Q0I5aE82eWJOK1YyaHU4WnpiZGI3WUxIVHhjcWZwS1BVcHNWbGNL?=
 =?utf-8?B?ZG41TTJSb2thditlNkdJTEtWQjlWbE9DSDkrNElMdXN1NllpNGpqelJTUnhp?=
 =?utf-8?B?cG5hcDFxemg3bjArZmNEOXVid0xhL2t6NWYxZU5oZkcrZkN2M3hvbTA2b0Nl?=
 =?utf-8?B?N2hwOEloVlVweUlUejhwRkgzSkpXMFVkK2VuMUdSbFQzaSs1dWNvQ1BMdElL?=
 =?utf-8?B?WnlHZkpnMFVXczFIOVJ5OGdjSDM3eGU3Z2V4QWh2Qk5XN1J4Y2RITHk5aGsv?=
 =?utf-8?B?Q21hT0R3ZjU1L3BsbVd3WmpMMFVDak01MmF2TE5DdlpYdm5wdld5bEVVWnZn?=
 =?utf-8?B?U0haOTJDaXRqd2lUc2pnS3BEZHRyWlpNd25RVEQwU2d6SHpkSy9ERjVtVkVq?=
 =?utf-8?B?RXQ2M2lDRkxZeGFyQVlxeTIyOEM4V1c4aGlnSjhrOHFBRktDRnhjOFpzRHUy?=
 =?utf-8?B?dm0vVVJjMnVybEhGaWd1dXd3ZlNjalZnU0twRHlmMFBsR3FOVHRpaU5BYnhN?=
 =?utf-8?B?Znl3blYyOEd1QWVoSEVNY2Z0YS9adWZXcjRpY0k2S2xxZkdRSzJBdUd1NnZ6?=
 =?utf-8?B?OUVFTy9XNmlzN0tRbjRWR1FnVC85NjlXNFhMdzZ3YnVuR1pEK1Viam9YQ3dF?=
 =?utf-8?B?dTBIM3NqcWZMcTYvOENEUGd3RWQ1SDVRSTNiYTAzcFI1MC9KbW1IczEySkVK?=
 =?utf-8?B?R0d5MXFqUmx1eDh1dDFXVERvQVVjQ2xnN0doOC93L0FxbFR6RlJ6cEpMR0hI?=
 =?utf-8?B?dGdGTk9XUHdoMkRLUVhLSUwzVnlYODlobGZWeWF0UDhrTXRKRXd6dDRhVG9W?=
 =?utf-8?B?ek1TTWQ5cjZ6ZVdYWUpZQ1J5VWpuMUdXcGhUMnAzVU4rb1lOdjdXUW5WWVQ1?=
 =?utf-8?B?RFk0R2Zzby9zbWJpMkVoaGx3aWY1NjdkNVd4MUlPRzFKRjZiQ3IwdHJVOHZI?=
 =?utf-8?B?MXpCYjZJUW15MHpZZWFlTEZsQ1BFSy8vMm4xUkVmNTBhUkt5UndHN09nZEw3?=
 =?utf-8?B?WEQvdmRUM1lnNzRHaGdWSWk1NDFZZVR3ZG5TTjZUVU1MMDVWMFFTRThENEp1?=
 =?utf-8?B?WjA2ZUY2eVRsOEJreGp2aTJGZnF5S0hsbnkwZ082c044S0VwM2V0M3BNN3dC?=
 =?utf-8?B?RGN6RkhGdmVtQXFFcVpRVFFZN3UyV0tPMkZwcDc0bDBXckE3eGlaQUp3eGtM?=
 =?utf-8?B?ZEM4dVpteGthbWJacHFLcE9uamtFVXprTHJ1MUc1dDFKL2gyY0NsYnJBQTU3?=
 =?utf-8?B?SnMwMkRYbGl1R254eVJmb2NabkI5bFV2MlF0Q0d5ZHZ3elZXTHZBM21HUXZM?=
 =?utf-8?B?dTZmc0padDA0WkVNS3J0aU9wY1lBSVZtNUd1ZG5uZ0RjWld1Zm1kOVUwdWZI?=
 =?utf-8?B?N3pSYUh3Slg0VGt5VFlKNm1CSkZGWHN1eTRoUVJBWTlxMGlIVlhsbEhVM01S?=
 =?utf-8?B?SUhEZW9wWm9XRHFNMXhIeXFGam0reDFCVVlOU1R4R2xtUU01YUxlYlpEQ0VH?=
 =?utf-8?B?VmJkQU5uVk55dkdQWVNRYVdHS01UT1k2WjZhT1FmZUYxdzFVQnVRTmpVRDkr?=
 =?utf-8?B?dXk4TDJpUjBQdVhPRnR6TmRRM1l0d1RXSnVOc3hlSGd6T2pWR0pVdz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZDmeGkWQCWAlNOJLp/wK"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936821b8-f875-4708-7984-08da194aa2aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 10:29:16.9952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ge3+UnBn758GSG+0zL/r/fdMXDCnqvyzPLpqd2UvppYI0Doy5D7dAbaRGBobhrWin1JqsHVPI0gDlKdZuh5DGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2316

--=-ZDmeGkWQCWAlNOJLp/wK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-04-08 at 09:45 +0100, Luca Fancellu wrote:
> Add a static function to retrieve the scheduler pointer using the
> scheduler name.
>=20
> Add a public function to retrieve the scheduler id by the scheduler
> name that makes use of the new static function.
>=20
> Take the occasion to replace open coded scheduler search with the
> new static function in scheduler_init.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ZDmeGkWQCWAlNOJLp/wK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJQDnsACgkQFkJ4iaW4
c+7I4A//QXxz2l0PkZtxAg2cC4eY4Jk2uZD0KX4Rxb/WJE30v8Am5L5WPfV+KxZM
nlj8xjdk+hZgxFySM29RhSuG7nAef7GtgvQ2jkOQh6SxkXk27v3Oq7Ma6wXYjloS
6OI+qEW3eDl9YWraTqxKtBJhw3RyP9FFdOaO82EbYide/kJwi1J6Ivri6rtmp3OC
tHlapUWSPu8EmK55fHidLfv6is9lizkSFEo3Rg6+ShIfEuGQlMUc4A3dozMDXZIF
4aNDistpriC8mId0aj8WHhtYA8U8cc8zxBzYXU4xaS6N4XWRBba1wl4dfkhC0j6H
bFrSJ/wrWa9X4natp+OU1a5QEUVp9/9ROE9/fTUHGPMyNmOfp+CU02tyqZAUhqnF
WqK66hu2W6Zx7yfFug91SA6vVayg/SbT0Z1OK5jFNJUwxEmeoqSLfNHB8TI8qsyo
Qifd5/Lo8HFDOmOeLBH2adoAivvcDIdjzEkoXZMtvGPrWnAsWIxxvwEiph33fPZq
mkXhemAQSYLuf+sHgFkYQXc9P/KvFzRorW0JTanVXoXXd7SXDvn6SS5Hs8e6z0Eb
A8dT57BlNkawaeRy12Wx6MwQichfiPUAudqQwRDsd3h82S2XI1t8svaL4tJXo8O+
5nbpzRe7wdTeOSoxEqlAN4pC1MMqZdmKu6Rdg/HRxt7n/I+70aw=
=WfFm
-----END PGP SIGNATURE-----

--=-ZDmeGkWQCWAlNOJLp/wK--


