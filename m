Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24073E8E27
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165602.302601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlAy-0005qR-RM; Wed, 11 Aug 2021 10:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165602.302601; Wed, 11 Aug 2021 10:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlAy-0005nd-Nv; Wed, 11 Aug 2021 10:09:32 +0000
Received: by outflank-mailman (input) for mailman id 165602;
 Wed, 11 Aug 2021 10:09:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HJ1Z=NC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mDlAx-0005nE-Dh
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:09:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36d0bfec-fa8c-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:09:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-l7X7Ijt2NIWtxMwFlHI94A-1; Wed, 11 Aug 2021 12:09:27 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM9PR04MB8193.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 11 Aug
 2021 10:09:25 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::addd:bf19:12ff:4ff2]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::addd:bf19:12ff:4ff2%3]) with mapi id 15.20.4415.015; Wed, 11 Aug 2021
 10:09:25 +0000
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
X-Inumbo-ID: 36d0bfec-fa8c-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628676568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huxai53Bc2Yv6lid00KRVR3RcUa5n3pg3mqGq6v7ZI4=;
	b=K0xK58BL/n9pv72M5O1VmewoEmkb7xLv45eKB9DmzQWfwQ59eN7KyKc11yl1CVq8NKJMbL
	zLRIz6O9jWTdkUJ76WLoC0gn+wM9FKAO5i5DxyLK0jZD1v+XyyitmhmZNCImDh1AHua2HI
	W/PV/Fd4Y8hO3Zo2U+TCei4mDEkD9cQ=
X-MC-Unique: l7X7Ijt2NIWtxMwFlHI94A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maQ2sASEBtIwQinfaMm9YBZBJeIlZtVwqfpeMzlmKB0z4HsPShGHv/tGcYTkdUlVOEDeiX46DJdJ/fNZ93vzEBcXnlPKqyojK7VTMYZKc0mrgitZqAIZSY+71xyMyJx42fV371C0MOnucleXciaLI7xIjVnusJqvjKO8FQ8HVjeLuRAESw27Lc+7SyhJSt3PrbXZoNyrwZo7jjIie0jYqryolcQdXOuXad5xfrWTnwwf+KC0h8ELtq9N1nepuoPE8Dyzg7CpjGyCEDxhGho57Bv4F9FTA+NKlVz2fFRDsTFESQ86nzEvEEAA4CcNvRMp5TLf3GslT/gER10J+F/Duw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huxai53Bc2Yv6lid00KRVR3RcUa5n3pg3mqGq6v7ZI4=;
 b=gtY3VyJVlIdIw4w8tDlt7oBoXmctryE+gGoOeogzSUkb86jJna7SlaCDfawn9qVINYF9a+ZmW8LjyTphZoitpVR+eutEEt3hvS3rG/r0ge4KIJO+z5aZKX/Quv78c5NkROtHPYWzdA9Cp883gqeqOHU+szwVECCqQzCd0pWI/53GrvpDULCDuN/F4u7FkK6FyqwZ67R5dp4ymPI6KztLJ9yEjnRDkm3x064AemnpKFGmS/bSjmYv4nRFkvgEDwkb9lOrR9d/qcVLug5k1y+Hj6+K9DSAr1MS+mm4hIz0GumUq7cCjGfvc9maYM4DUstn0C66/9qaDZbL4OdhceXCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "julien@xen.org" <julien@xen.org>, "ahmeddan@amazon.co.uk"
	<ahmeddan@amazon.co.uk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "mpohlack@amazon.de"
	<mpohlack@amazon.de>, "jgrall@amazon.co.uk" <jgrall@amazon.co.uk>,
	"doebel@amazon.de" <doebel@amazon.de>
Subject: Re: NULL scheduler DoS
Thread-Topic: NULL scheduler DoS
Thread-Index: AQHXjTpOV/XWdF2YLUCIZdYgL03Tzatrb1sAgAAzUoCAAnTJAA==
Date: Wed, 11 Aug 2021 10:09:25 +0000
Message-ID: <6b5e28f427ccd89505a4448f2b9e5be992a08292.camel@suse.com>
References: <ED25BE5E-D695-4763-B97A-78D6040E2341@amazon.com>
	 <8193a685-3ab1-9407-75f3-e335ea4406e4@xen.org>
	 <f3082b8c-1388-c92b-6175-e6d8b9d4cab4@xen.org>
In-Reply-To: <f3082b8c-1388-c92b-6175-e6d8b9d4cab4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.40.3 (by Flathub.org) 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0944db32-45b1-41ad-b707-08d95cb01926
x-ms-traffictypediagnostic: AM9PR04MB8193:
x-microsoft-antispam-prvs:
 <AM9PR04MB8193E8BF04905C02451B5421C5F89@AM9PR04MB8193.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qRJUmZnzWMIAKkUJV98v5oC0hY+shnoZUdsRLuNlpxDIG8l0Nf8BIGGoWn7G3zt7g33+ENWU5akTGSpnoCM4CM09FKUGkiJ+f7LESM3qM2rOBVFvgiaP5zL5P3fwyv9wwVT+0so9kLVjaortjLCOu/U+YXvNRnu4SyJGbsoIumriAqxJE2yqON2prnsIXPAdL7qvGGNJtmJKM1bA8toMddVKoFHGmRRVBFnWa+TEW8XESs/tGrk8F54b/ZYogSWNmpT92lf7uJtO/K1nnu3uAc71fVwkvEzhzLOEidhnqwbSQtWsWpqD3P/S+PeXeWuCientOocoOzEOhBP7Jkz5eMfBy5oe1Ah7hlKsigYmftVSofpHd5pivKcCbm5Hsv3BHOduNwdIdncgTnKLVJ7W/WKuJyv4YcxwLBTZKshDAeHWArIVlq50uHisInU7YO8UqS/dTYZ34ldXGpd+DChFGllXww+2vwXTudhKnFztds3a55oW4GKUA1MqD7HrbYsR3EcH1mXK2j5GbHCCqHD4f+QI4Y78r2RmZ0DKgp0sIVvkRNbiZKu3A2MoxdlX+DwrV5EBOTDoMncA8D5llPE2cwAsuMO5hjtSwpy4rMsO3mNqgDW8kueVdt+HpLS0mW4LpdsU6nREwbZaTZiHZAupfPrgeas+j337k8tiLGxYH2GQEH17v0bK7roq2FwuW5hBX2tilj32it0p5JhqPeNNcopMLEn0qttxeaGIasMWdHJsm/gPVJOAxD86dlDUFAwnsXbV978V/7c/aGS+C7O3VWsOwR/qaocdC2/7gGWaJYJflC9qzWLwqyXTlG3FI2N+omRdSrJ33sW116s6vB1ykg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(346002)(39860400002)(316002)(66946007)(110136005)(38070700005)(38100700002)(66556008)(66476007)(66616009)(99936003)(66446008)(64756008)(76116006)(91956017)(7116003)(122000001)(53546011)(54906003)(5660300002)(2906002)(26005)(186003)(36756003)(2616005)(71200400001)(478600001)(966005)(8936002)(3480700007)(6486002)(6512007)(8676002)(4326008)(86362001)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWdKUUZzV2JOWkh0N2pwSDNWN2cwUW45RUkybklZUmt5R1RqT3YrRCtsSHJs?=
 =?utf-8?B?a0JNMENCYlZMc1pZUzJZK0dsbXI4dUE4K2tOcUxiYlBENTRVM2NWVGJ3M3FU?=
 =?utf-8?B?c05GYXNnc25KL2oxWjBaSmFjTXlmTzBja1pYelNRSkV3TDlWQ0c4aEc4T0lz?=
 =?utf-8?B?QUVPNWFhQjZSQzUrWUdGbFdXejdpNXU1U0IySGVSZVF3VDdQNCtlNTZ1b1lt?=
 =?utf-8?B?RFd5VG51NVR0NmxpZ1g3ZzM1NDlhWUE2R1FodVZkQ2IrK3MybEQ4Q0YrQldW?=
 =?utf-8?B?dWt6N2NqTWtETUoxRGwzMEx3bUJRb3JiVlNXVXNXZEhMNTRObWduOUNnNkpN?=
 =?utf-8?B?R2N1VmZaMDBHV0ZPaGxiemt0cWxYR0JpZEdQUjMyKytTNUdDN2lpMkF2YUVZ?=
 =?utf-8?B?d1NkQ3dxVXd3TE9mNStxNjZ3NlFTa2JxVHVHR0FCNnVRalhJNW1ha2Z4aENR?=
 =?utf-8?B?T0hQQzZKK0pWN3ZKbmZtR05sK3hPVXJoVlMrbWM0TXJaKzl6RmtUaDlGeG9y?=
 =?utf-8?B?NnRrTC9KQkFqOWNVTWlVV0NLWDIvTDhRdk1oZG5KNHM1eEdjNmlFaVNod2pH?=
 =?utf-8?B?Mnlidm5OMk9HZ0tLN0V4ZTM3cktIRERJWTU1cHBRcy9ZQ1BkMU01YkxXSmxq?=
 =?utf-8?B?YTZzd1Q1UlMxbm8zcFBIYXVXUXcwNUszYVZGQ2QyTHpnZ0tVTUN0amNUZHE3?=
 =?utf-8?B?MHlDTG9Fc0J1RnhjcFNqcDBWUjVXLzdjR2VvZnQ5R2pzN2sxY1dmTk9CbXVT?=
 =?utf-8?B?aVNyZFBZZUJJelZXT0p4aG01bGhQcjQzVGhIQ0N3cUNibitrV0N1RWRzZE11?=
 =?utf-8?B?K3lJSTFSZUdjc1Z0YndTb3lFc0dkV0M1QTB6dnBaSG9KWW5KM1Fkdlg5dkQ3?=
 =?utf-8?B?WXpqdWNrQmlwSGFycXlWZkI2aFd4ZnJ5TE14NTFlRTgrenhTd3lNMEM1Q0Mw?=
 =?utf-8?B?UHB0Wjk2UXpQcXpROGhlYWpXRkI2MnhGR0M3YTNTQjBRRXRyUlZYZ0dyUVFY?=
 =?utf-8?B?RU5lTGNqYmlpY25hM2lyOHlZUjJLdHVZaTd3dlNUclE5NUpGY0loakMxeEV5?=
 =?utf-8?B?NmhPTEJjZmJ0Tm1wNjh6UEM3OUdoQWZtWW5tWHh5SEh2UmtORGx4UGIwNGxS?=
 =?utf-8?B?N3lrM2F3bmlJTkhMbjlHZVRnTjJTMWRPUXdXTWtkRjFSZjZQaUNuc2xsR3JR?=
 =?utf-8?B?N2dpZlM1YlNVYWZ1azZrdDFCK1pWcGpNclJHa3lvZ2JxZ1AxZ1dHWWZQU21t?=
 =?utf-8?B?UUZjTkRLSENoNmFqdThFd2ltQng0ZG5IRDlqdmpsUjIxWGFZbXl0SUhLYlVj?=
 =?utf-8?B?RWN4c0NIeTk0Zkw4clJZRVlmMXdKWGhuZGFwQWpHQWVnRlFleCs2MStmYThr?=
 =?utf-8?B?dWlyTG9UZDUwdkF5bU11cmY3K2M0T0NMZDVSWkhGdk9vTENkRE5WbmlLTXFn?=
 =?utf-8?B?NXJsUVBVb09UcDkxL1dORVVpd3FxYmJVUjZMOTFmNFhqRE8xdk5zdUp5SFBC?=
 =?utf-8?B?eFFKc29nZENyRlBadWFuM2pkUmk3SDZlMUZtUDlQVSs4NkRNTUZCZlo1Z3hN?=
 =?utf-8?B?bzBCd2ZVSDd5dXMyWUp0alJMM1dpbXdyeGQyRm8vbU5DaUl4L0x4M3hDVHgv?=
 =?utf-8?B?Y3FLQnNVSUVKeHhyWit4SDlQcHJva3Q5UXhXWHY2ZXdLL0ZDQlc2Nm1LSW1M?=
 =?utf-8?B?WUEwWlp6cjQ3UFFZL3U5Z0NseFJtTWJWY1RYclFSWEVac1kyNE11YVhEd0VV?=
 =?utf-8?Q?MnwcOafSN3LJw5qeA3bREY0uqrbDXyib95YOGo8?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-niKy73NtsCz6729M72v8"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0944db32-45b1-41ad-b707-08d95cb01926
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 10:09:25.5133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eH8ke4W5extcJwZTEhsXajBLRn46ysdvbKs1Kb/JtqGzHYXnGF7da7wACIGSQ8lavyayGJxXkl6WclA13mrJ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8193

--=-niKy73NtsCz6729M72v8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-08-09 at 21:38 +0100, Julien Grall wrote:
> On 09/08/2021 18:35, Julien Grall wrote:
> >=20
> > This implies that a pCPU may temporarily be assigned to two vCPUs
> > and we=20
> > expect to be fixed up afterwards. However, a domain may be
> > destroyed=20
> > before this is happening.
> >=20
> > So it looks like that unit_deassign() is not able to cope with this
> > case. From a brief look, I think we may want to check if the pCPU
> > is in=20
> > the wait list. If it is, then we should bail out.
>=20
> Actually, I was wrong. It looks like null_unit_remove() is already=20
> checking this condition. Also, the vCPU should be offline (and the
> unit=20
> as well) because they haven't come online yet:
>=20
That's what is currently puzzling me.

I mean, the crash happens in unit_deassign(), called by
null_unit_remove(), called by sched_destroy_vcpu().

And I agree that the unit should be offline, but null_unit_remove()
calls unit_deassign() only if the unit *is* online, so... What's going
on? :-/

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-niKy73NtsCz6729M72v8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmETodQACgkQFkJ4iaW4
c+7kLA/+MAi8knfYmFGabyS6hOODKRMl9O/Iqnevl9uvOTte+ltRsrRtEufdd2uu
wmFd346vgSTRqOPBSNvzbs9/7m8lHwRXlKJZW6dICWRKXHcK6052iEYfst4zvOBF
avpuKRfW/v8Me3ryoNI3efkC4QZU01XPY71KDLNUZ8Tz+ro3iY2QdYeggL1V6x0z
z7ByyDzHwjkLQT0ckhEClCHcqyQ9rCJdtkJbXdkxP8hUg7S6WyIJxV6PPqrrKkFl
MfTdfKZrM4BP3/hIsLNRF+mpAnZJ3/VlNu0ofVmlzw4YsP5jhH2iZxLQpsiFTZ8u
to2ImLXW5JI4zGWACH8wGN/12pbg64x//Gw3mrkvFQ2Ywhjn2okJ6NE2NKwVu39l
A69dUfMY4mm+xhKgXOOMCMvXHfJEC+PPLFcV1LCVhfBor/0sZaECnzT1H4sLX5u8
0Cx6oyIcWqaxRIo2eo4W9KYwXIZXJlnivl+meyj66ZCf/wZXV5LljZjeILPvhhCP
0vaFlURwDmh8Q/V4JkqMXG3mZJE7U/560luWgqyL6nEjjxqztAqUV8Xbhqs2nR3/
miuyYQLRXlfgW2IIvWsjWOAmWF/f1NxzE62x65T1sMtt6aX/W7SxCnBCi6Luq2xa
yHk/L4MknrGu8ULWpRX0Jy5U/6xnn92oK3QyMQWdRK9CN8D1TOk=
=3H5I
-----END PGP SIGNATURE-----

--=-niKy73NtsCz6729M72v8--


