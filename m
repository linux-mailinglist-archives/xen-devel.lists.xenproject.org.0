Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68A417788
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195494.348225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTn9Q-00061N-Jg; Fri, 24 Sep 2021 15:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195494.348225; Fri, 24 Sep 2021 15:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTn9Q-0005y9-GU; Fri, 24 Sep 2021 15:30:12 +0000
Received: by outflank-mailman (input) for mailman id 195494;
 Fri, 24 Sep 2021 15:30:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mTn9O-0005xw-KY
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 15:30:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 881846e6-a919-4662-a658-ba7f17234707;
 Fri, 24 Sep 2021 15:30:09 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-E8LQTbL8No2h6mhgrTfSqg-1;
 Fri, 24 Sep 2021 17:30:07 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 15:30:05 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 15:30:05 +0000
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
X-Inumbo-ID: 881846e6-a919-4662-a658-ba7f17234707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632497408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QIrnMBnIvxtySEdOc2GunU4qTCLynbDICb1WQvw3Inw=;
	b=dWdQiTCFBhdgS9VmwGvihATopi4zHpThZ36xTMc+eFlzw2Ag0qQDWo1Nj42kSQYewzQDIa
	kEKJNHp6wL57vwpVWbszdJpCPv17viUu3zru1w5dtoFTAnrqBWcvirsWfCr8X4SN64WRLF
	goLnW9N38uEhSyz0AOLr6Yvn9m0zQNY=
X-MC-Unique: E8LQTbL8No2h6mhgrTfSqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+IcIT7iTZt48Ho8ak/k/1m7fwe/eKK6iUlfFpw2Z1hf6Pi99ELh6kR3rASGweFYsjQ25vuakeQYVxgMNP2sBoJhF+e8Iz8z0pFVAADaz/d9h5VInVKC8bzEpF4SJOpVgOfGUidjxKrPF5AO70x7Iu4JEs+gTNRl14UBWrn3y9qFVyvfgvX+Y1RkDU1Q18NwDQw/5c8i2AcrQZ1yZzT63coZyXO1kNnEBnTPDMv3sIoHiybz3woND/IyPbez9eSKDqTtj2wwI9hUnopZzrAapDhpAs62D3rwFI3JaDf4z0/XZib4lb5B2BbsvN+wyGGpf8poKh/uarSUJakL5wEMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QIrnMBnIvxtySEdOc2GunU4qTCLynbDICb1WQvw3Inw=;
 b=jyZwAr0K320Y15CKXC3X/Z/QOdTAHLOZCYSvNQnArZ4H1U1bndurwMy62wQRMAbkEXUHggrxWB8WuLptdAH7Qzg2OkDQao6Du61YPTygpZNHsskhlBLf+E6cdDpseD5LtLUXW1nqg+sB6fhybWihJEaRBHiLGgT9v7Y44KJnOHQcHfCcmzcCQLuxrjBZTKfhilYpz4qqySPuPQk3lrQLQS64S543cmgFKcNfEVlGDi83uJuMDN6HXMwQW94NculsUeimeBuTiG6lCpN2apIPd0CKb/yfB6jF54vEPcIue7ecxWccSmCpEWMVGmJWCG9adHfPuA0HeKcdo1sj1NX+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v2.1 14/12] xen: Switch to new TRACE() API
Thread-Topic: [PATCH v2.1 14/12] xen: Switch to new TRACE() API
Thread-Index: AQHXsVkMcY6jWQHaHkuxnpRFfdaE/Q==
Date: Fri, 24 Sep 2021 15:30:05 +0000
Message-ID: <6136f9d77c3aea601a409bddb28a8f81f5709e3a.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920193234.19409-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210920193234.19409-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f3aeef8-b1e0-48c9-3d3d-08d97f702f3a
x-ms-traffictypediagnostic: AM0PR04MB5826:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB58268D9A1F8BD8FDE97BD773C5A49@AM0PR04MB5826.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DNTwUI5QYF7BcqCHTCsmsNShu7uwkqlE4OJcoJDnzuP3tpQam9eMjyUZxxCGJaBb/TwJO6w8S5IdSwWKn2Plzj8bo6h2WR74PhPJY/PCkflm2xmM9Obx+dt99O4H9ShJAXnQcYNJ2oFzBoJF7dlsf4uXWfJillrvgeHUMj0q51Aef0DHxJm6LU7oRbiGrwu0BWHry9S68Ka5PvB6VrXr7BEhL9Vdn70Vc8RR2l0j/cAi7U8FIXcYVGehYhly3hXsTEsCht5KfQTl7CbcInKIT/8qFT1OOHzDlULnZz5dF6e3AEj3H6fPMSZQo3nYdWHtTrj29y2hkFDbOAY9Ye4eHIqAzdvxaxo0L4pjwXY1gzarn/DmXN0WP4UOMdKPOa5htY9O1yUC7FCuOWzdt5lhjuPmnATlBBHM8gAWUWZnYCEratpK16NRsxjsJsnHAvFc/drN9nKdeKSOS4NIAHURe13DJWZ5yMj3CoQm8FhrkOpS7fQNGJDFZs2RNY6qRUnEpOPAH3b97e9gYnt494IZFjao0Wc3aFOWf7WBlsnF1Nuaka+T2LcFJ2OrzLgV549gQMmwPfyXjH+TTPKFUdeNoYFO3ZVAXaxC/NQLc6BZYxASDw+4OZQmAhetXNwFm2ctAw034r/5NJsmsaD1Z0QJyWO6qRaK2kaxVX7eeqzDO25pl/1a3bOf7Ip14INmXEec/LGxdc3RwJQCE59ZdDZ9/flUx7GGNWl5llRATjYCRmCsdGrP5DsrVHrndXSgemRC2ewjPCfEZWQU3YblkhFxE59/WE2csGi4oDdnyl4qtsPOO1ZpaS4hOq48Ut5AnZJnbh+VL2LpvbJ4wDSMwrNRHA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(99936003)(66946007)(5660300002)(186003)(4326008)(66616009)(8936002)(6486002)(86362001)(508600001)(76116006)(2906002)(64756008)(66556008)(110136005)(6506007)(66476007)(38070700005)(316002)(66446008)(91956017)(8676002)(36756003)(54906003)(122000001)(2616005)(71200400001)(966005)(6512007)(38100700002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDBvUDR0Nk54RVdURjgxRkFRbm9DZVN5dDRNT3lFZlkrZnl1dVdQa3RCbzZF?=
 =?utf-8?B?eWV4ZTlMeDl4UVI3bUQ4b1lDK1BaZFBLb3kwQkFVSmtxSDM3RlBDM1MwZlhQ?=
 =?utf-8?B?QlgzcGxGcG9JaGpGbXl6ZzdwdS9HNzFpdGx2N2NrdTR3YVhHSGM4YnJIUkJo?=
 =?utf-8?B?eXdSSlJuNXZPUWp1VUNPTUpjUlhpMmE5UVFxNGxRVEo0d0llUHBnenhraGVs?=
 =?utf-8?B?eGVNRWpxYVFKTHltM2MrNXFwaVErYTdiK0kweDczV2p5WTM3MndXVjh0eFdk?=
 =?utf-8?B?R3psbDlzOWRCQllKcVBENCtOekVodUQ1TEhWV1J6ZVlTZEY3SkpjckIwM2ZI?=
 =?utf-8?B?c21XdFhTa2JzM3N1a0htSDlSNkp3WmpwdjFueWU4Z1RBdG1ZOVdxOVRlNjdO?=
 =?utf-8?B?by95d2gxMkhIL3hCWDhnYXY1ZWEwb0VtSDVQOEwvQU1qRjlUMHc5dEJVSmtp?=
 =?utf-8?B?UlVnWlYvNFo3TEtjaVBNRnU1WXg2SkdKZjJvNVdhc1NmWWVpU1ZLblZrRzlQ?=
 =?utf-8?B?R2ZZR2xqM2MyZzZMb0FONElsaTQvYjZiMDYrdEJ3ZTg3Slp1ZUtYS2lmMWlE?=
 =?utf-8?B?L2tHYis0TkhuUkhVcExpVnpLMldsK2RmSTEzT3gydi8rdkNJOFpmdkU5WXNM?=
 =?utf-8?B?d3RWTHB2UjhERTJ2WmNlcHBadHN0bUhKbzNLaW9zRlVtaFk3Mi9COHpVVHlN?=
 =?utf-8?B?enJ1Y3JHRlYvZmpFVCsxUGR3Z2kzNkpBVDRHODQwR1liN24rTFQ5SXFUQ0FM?=
 =?utf-8?B?YStic2JoV21aR3BRZzREQ2FsTTFhK2RDTDAxU2Z6QWxpeHVKZkx3WDZKK1NJ?=
 =?utf-8?B?TkE2Q3ZaN25DSGF4TUd4S1FmT2IvMjEzYnJQVXlFcHMrcXpKd2lvTDIyR0hU?=
 =?utf-8?B?dVJoRzFhYVRwei9EVXVVWFNJVDAybHI4L28zNEFsUzJZUTljSG5HcHQ5Y2FR?=
 =?utf-8?B?ZkFHZ256M0grc2lZZTM3RGs2cnFrbGZtVFduYXN5VXZwV09vTDQxRTdxS3ZQ?=
 =?utf-8?B?K24rTUFwZmZjUEREU0NGb1pBOHVLRndrWWt3ck02WkR3bWJOMVZqSkMvbE9U?=
 =?utf-8?B?TlpobXlGSnkvSUo4WUtPTmZiMjVzM09FMmVoRkJCTUtoblJGTWxuOWlpVlJh?=
 =?utf-8?B?M05HMHZxTEo4cTJmeUpwa0lsdjNCSjRGN1FzL1hZaFhTSmNoa2cxc1BHT2dW?=
 =?utf-8?B?M3RvRHVZdHQxREhoaGw2aUFVTEJsSUxXU2tVTllUVGRpUlczWkJQUGJ0UWlk?=
 =?utf-8?B?TlRSK0RYVXRSb3BwWm1EWU8rZ1JIbXRQZlNpNGlRM2xUWkk5WGpjRXhZeGJ3?=
 =?utf-8?B?dnNvRHRJOXc0TVF6TWNVQXJNTnVCcWN0T0QyUHhzU1owMnlEM0hIcjl0Y2s5?=
 =?utf-8?B?RllqWjc5U0ZLWWJVbk9wM0ZQbTBtd0N5ZitmRU1wUVFXalRlQ3NzbHdYQk9R?=
 =?utf-8?B?Rk5RODUza3JRd0R0QlVJNXpNeDFWSldpSzR5UHFla2RTOEp6T0RoMGYrL3Ux?=
 =?utf-8?B?c1VjZkoxMWc0RVJncklvcnlMNGlNYlk3UG9rL200VVRWUU9ZdTV6aTV5eFRS?=
 =?utf-8?B?VkNyaFU4S0VMd3ROK2I2RElXSzZqdmNUOXZNQmRGMmxxbXFFTXgvTzd5aFZJ?=
 =?utf-8?B?ZCtpZFlOa2JrNFB1TU1mZGp1S1BqS2NSRXdQdjU2dllMQ204ZVVHalE5R3B1?=
 =?utf-8?B?ZWpEdkNQNXJ3MytyN21SbGpNelFnaGg1ekdid3BBTEkxRllCbUhCWkZzY2NV?=
 =?utf-8?Q?0WW/WyeyzAe+Nnav3zHg0ivWQS+zS64yNVJTQ1E?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-s25DmJGB9spnQ39XkZXG"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3aeef8-b1e0-48c9-3d3d-08d97f702f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 15:30:05.4426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fEHOsF3mCMf9PpzWzjLDq27KaBwUaPe225xmNilL/DrUXoECdaHeS8BWY2VMqzY/hUpryBhbFe6KqJMBq6mIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5826

--=-s25DmJGB9spnQ39XkZXG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-20 at 20:32 +0100, Andrew Cooper wrote:
> (Almost) no functional change.
>=20
> irq_move_cleanup_interrupt() changes two smp_processor_id() calls to
> the 'me'
> local variable which manifests as a minor code improvement.=C2=A0 All
> other
> differences in the compiled binary are to do with line numbers
> changing.
>=20
> Some conversion notes:
> =C2=A0* HVMTRACE_LONG_[234]D() and TRACE_2_LONG_[234]D() were latently
> buggy.=C2=A0 They
> =C2=A0=C2=A0 blindly discard extra parameters, but luckily no users are
> impacted.=C2=A0 They
> =C2=A0=C2=A0 are also obfuscated wrappers, depending on exactly one or tw=
o
> parameters
> =C2=A0=C2=A0 being TRC_PAR_LONG() to compile successfully.
> =C2=A0* HVMTRACE_LONG_1D() behaves unlike its named companions, and takes
> exactly
> =C2=A0=C2=A0 one 64bit parameter which it splits manually.=C2=A0 It's one=
 user,
> =C2=A0=C2=A0 vmx_cr_access()'s LMSW path, is gets adjusted to use
> TRACE_PARAM64().
> =C2=A0* TRACE_?D() and TRACE_2_LONG_*() change to TRACE_TIME() as cycles
> is always.
>
Was this supposed to be "as cycles is always 1", or something like
that? (But maybe it's fine and it is me. I'm no native speaker after
all...)

In any case...

> =C2=A0* HVMTRACE_ND() is opencoded for VMENTRY/VMEXIT records to include
> cycles.
> =C2=A0=C2=A0 These are converted to TRACE_TIME(), with the old modifier
> parameter
> =C2=A0=C2=A0 expressed as an OR at the callsite.=C2=A0 One callsite,
> svm_vmenter_helper() had
> =C2=A0=C2=A0 a nested tb_init_done check, which is dropped.=C2=A0 (The op=
timiser
> also spotted
> =C2=A0=C2=A0 this, which is why it doesn't manifest as a binary differenc=
e.)
> =C2=A0* All HVMTRACE_?D() change to TRACE() as cycles is explicitly
> skipped.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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

--=-s25DmJGB9spnQ39XkZXG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFN7vwACgkQFkJ4iaW4
c+5Dfg/7BeS3v7YzuzWmh2o/w1VLaaiX38VvZ/KcG1X8pBIjKnEbk7v894wUDnyg
oxMxJ3eN2Rmb+QR9AIRTCfms0gfPQfkF5mZpAb/z778sLn+ifARaxkQ7bi5LKDtP
How+m1YCl0FRXEGxheC9c/m5+6d4mZGtK2SjiANXsbyAiXWTHFaAJTm7L51Ru69t
BTGkwQC28++KpahoPE4OY+WxA89mKeFCgpZaJap4TethuxEmLZKFcdQKYOC+fRu+
0+Wa8QydnwtbTVwaHXzFxfpckT33mh2E0vGWJ5GM7dvbr9KzBmHCqAxL+/0gK3g4
1HWaY3I2qbUhjrVeP2czhKRkas4nqO7SHLcsRXKaEDzwBRgeRYUlTTyzV7HJSuQ3
6QhNhRB4shwqoXZ4xVpAWl1K/g2YxDY4s3OpibgcYKS4zymn9e7p6YMWkOC0loVP
MjfXMwheLIYJjXokmZcD2UHOC0CAiLQfQ8wCGxzulWPupTIG3HNYqtUDz5xaa4Ch
dSjIZiIH4AsxHyezG4awn7BtcUW+cYOqKhMJ2JkAA6d6DPLJSlYmVyUKEVeRVvOd
S7g6/Dsd8glHKxRiLdcyuhvVu9UjJUsM69yh4eG9MePNImGnqcJyUN9+E6HKL3LF
zyCu4VlVsJ+rLmb1MSvbqmO6xIgPzidCwDHbWYLHOT70Oz4FUr0=
=VHUo
-----END PGP SIGNATURE-----

--=-s25DmJGB9spnQ39XkZXG--


