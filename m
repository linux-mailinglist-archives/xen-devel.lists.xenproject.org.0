Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7FE229BA7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 17:40:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyGqx-0006lO-FH; Wed, 22 Jul 2020 15:40:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xSrN=BB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jyGqw-0006lJ-74
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 15:40:18 +0000
X-Inumbo-ID: a3d971f4-cc31-11ea-a1d9-12813bfff9fa
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3d971f4-cc31-11ea-a1d9-12813bfff9fa;
 Wed, 22 Jul 2020 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1595432416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMIl8jnlh+N2cCXY8SNVvjBNlGZU9fZNkn1UDio7Vh0=;
 b=ESRZqq3KnOOjr5nmEtOG8sBIfb2mlqiW++GbnDGlGLjqjKGHejgSOd6uFte/PKF3o+cXSp
 p9fHxXAQZ3dIQQqBK+Mej8oUpwK5TONHVqT8sQGWfwM5x2gFTT1twDTkTjfiZ2LYapm7Nr
 RfMQoPpQYwqdg7Ul4WXawi6jUDg4W1k=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-Oy6QlQZ_MC22eWWqpIMyEQ-2; Wed, 22 Jul 2020 17:40:14 +0200
X-MC-Unique: Oy6QlQZ_MC22eWWqpIMyEQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMJ5frpTDFfEhhas2sO0Slcxp+S0TebwJVTnlXDRvmYRpufPe5X8jAH+2ULJJpMT9UkGKXqDs0kt5wAax9uOXJhzhVtot+i8Jn1ulhCR559LpjVt4uMn39ghwQrtJPgGMSZnbjzcAtMkGQcyIMEXAv8Rjs5nM0zXZM2hFsYe4cBGR9uP0h7LfrnOhPXvEWRCDsrAbtJWuWi1USr97u0FNlhCex3NfsW9mYeRsPhh9JNlPR7jT86Bvd+jEYpnduSbRJQHk8h/K3eF2zd1YblL4pwhLlAoHRi5E+6jQ+qQ9F37sW7dwJKHdhBoxg9YnfJvEiIuMgxMJFpzHMqZe6OA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMIl8jnlh+N2cCXY8SNVvjBNlGZU9fZNkn1UDio7Vh0=;
 b=RKNA1jZ7fVKKK1heeD+zdGfd8AiEAY/crBE5JuScHKKS16PhcxvPljQr+bhV1s0BsbptJXT8DvtesAeU9E1LN4JtJ0PQlopD+s1WtP/jm97saWaKa0lwbaOedL7i7jJhc6Q/jv9+nGOHINTjHUnq7ZklQpSW/z5hu3kHFW6zLeuQH/TVbC7nPpVgQvvfVNcW5gXn31ioDcDDVYa53F5BpFiNgdbk0EZUaROrESA6x8omIwZYZd6ztdI3XRlGJDr4MOaJLS19GzHtmzmmOF5hq0WoPkluhPtzrS6znl0N5ITjNj4ofycYEVKQIKMqZG3VWL2r+1vOMTteDlz+SB9bkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DB8PR04MB5834.eurprd04.prod.outlook.com (2603:10a6:10:af::12)
 by DB7PR04MB5276.eurprd04.prod.outlook.com (2603:10a6:10:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 22 Jul
 2020 15:40:11 +0000
Received: from DB8PR04MB5834.eurprd04.prod.outlook.com
 ([fe80::7d0f:f3c4:6a9b:4799]) by DB8PR04MB5834.eurprd04.prod.outlook.com
 ([fe80::7d0f:f3c4:6a9b:4799%5]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 15:40:11 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: credit2: document that min_rqd is valid and ok to use
Thread-Topic: [PATCH] xen: credit2: document that min_rqd is valid and ok to
 use
Thread-Index: AQHWYD5i3CiuwX6Cr0uQclh88PJ90g==
Date: Wed, 22 Jul 2020 15:40:10 +0000
Message-ID: <1ec2e50b96263f6d4f4fd0d8de66c236b35c3101.camel@suse.com>
References: <158524252335.30595.3422322089286433323.stgit@Palanthas>
In-Reply-To: <158524252335.30595.3422322089286433323.stgit@Palanthas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 (by Flathub.org) 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6949aa91-ad62-425c-0c04-08d82e55852c
x-ms-traffictypediagnostic: DB7PR04MB5276:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB52767D2DF02CBB776FE071BAC5790@DB7PR04MB5276.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qnN4lKK70AgwT3PPYq/MtpaE+2YTKd7dyd0voSZ3m9DoIKPet3iHK12R9NjvsfVgaDLSMsC0HxPHgtmPJklB2GjLw6ebkq6vNn2lOASgbpLGDs04uhowBTcYBZt+u40WH9Sq4BkxSCYXYU+z6+iP8DLFrDbSiQxk79CRdMUOAznHlndrxeDlQDj+T+I9HHD9ddcOQg/0TGpDhzBjYlPTKy9I68Yei9ZrKBtwtsMqUkLDZSEZ44cxEn//vc2eZOfq4uL+fPWxh3YXAOcNCwFxlWbTOA1KCy+PEJw9x1ma1bn87kYVRzPevkY8FkD8wRbBm7pweW7ewEmDBAPIAdenxZw2XQGo6toc+gnMDM3ELDhk+jbmCH5UHYKC+ynPdk33+hmZtrOmrZyHdmHNEQGSVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB5834.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(366004)(396003)(346002)(2616005)(6506007)(26005)(8676002)(99936003)(36756003)(71200400001)(86362001)(4326008)(186003)(8936002)(4744005)(66446008)(64756008)(66556008)(6486002)(66476007)(66946007)(91956017)(6512007)(76116006)(5660300002)(966005)(478600001)(66616009)(2906002)(54906003)(316002)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: e0YO2Pvu57JOzgMYvjN6uSGkmig4XTURadd7qSpSFQRphKelbuOgRB+zsQqzhisoRu49cyxPN54mAWLzCAEPcjpCh3uAIPLaoI9kIH07mUp+THMBl/WTq2Jbru0+hMvMQ/3bjfmNOWlV/LV1FePjOmYekH2D1Hoc/NKQLhTq1mKCYDIncLcyAYGX+2VwH314p36+vxJMyZ8NVGP5QH3/PT+QaE5iEeODLa05LNHKjzkDB5Qoe8wmiQ0ua9zaPhjkbZp7JITZijkFv1kVpqtlsATAtkxD1Z4F2vqrgyTgBsdWq1yH4wN0bA30yRcTZgchxGMqndg5ZsalaBWfV++KTqK5Rf5GttvXIfBi3hj0RF4SNxlRz/hCthPHsE2x7uH4hM7RaKDSzED7f2LkE3FiRxJQMWbfVUSNVRMLk/9L3V6ombWnnqsv4xD2pgQs+IzsoPkynoMtVHPfSKO9liQoh6yxPrpD9RO2MdZXu4WwaJQ=
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-4pbxLaLnMipw4hZnQyCG"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5834.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6949aa91-ad62-425c-0c04-08d82e55852c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 15:40:11.2700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcZg0FIVEGSae5AUUYRgjstZhfasAZTn3j61jSVzpjuLIfxVuqC3OApWCvobrfuwJ/sjhyv2PFxPjPz0WPn89w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5276
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <JGross@suse.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=-4pbxLaLnMipw4hZnQyCG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-26 at 18:08 +0100, Dario Faggioli wrote:
> Code is a bit involved, and it is not easy to tell that min_rqd,
> inside
> csched2_res_pick() is actually pointing to a runqueue, when it is
> dereferenced.
>=20
> Add a comment and an ASSERT() for that.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>
Ping.

Actually, for George, this is more a:

<<Hey, it seems I forgot to Cc you when I sent this. Apologies for
that!>> :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-4pbxLaLnMipw4hZnQyCG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl8YXdkACgkQFkJ4iaW4
c+5WHQ/8CDf0i7iJNjNM/9tqQpMMIGQN4Wvy8ycrHVMsoXpHb+UwTRceBslsd3UA
mGOKTFA39tvDdB8TgrpCNOQbeGljn+dh6gvN6FeE9M6URM3hfQE2oDaJJRtGMXlI
fF6VEL0ElA1N2z/7zL+yKDNQI6vIyikMOx4BAfoTeC7TdXFWKtanlwFv6S75dW/a
lt0MkTXUrrDJ1NDc1nQPcuKJdq/k/RYiFxSjEt0TXMRJwhz9qIPEkCsW2tXMOWW4
J8dqfBf6M6PGMYKe2baoYXY88+S7u9INpLOVhBBtML/cqov2gao27JxiZJovwEV8
NjFbp9LlpRA12swWMEK0lurnT/4EuQ+PdOcL1lE1X1602USbIl1aQLZmZMwARS6r
4tNcZ7is/3D6CAnAzJwUwAcA7wCtZTQfWAHMZ2BnLcQ/toH303ue8w4V830PrvCa
l0zA/+zLMF6PAM/NadRsdG97OOoodtpHzgp6oDFotbA1iulgcHFxc18Z7vT6zIul
2mktWkpRlHCMh7ZQT/J0F3crwar8OK53q9UEchVNqO0dD5sYCr16Gllb4feiZ9SO
v/3BIg17fUoTVIZpGcK/VJuH1gyHlviQIiWxCiPc0RbZkEGtdITH+LB2PYNx6V+r
T3rfejZJvoM67dZFD8h6e2rE5wu1N8MMT2/vhGirlVNSx1+n1fc=
=gREJ
-----END PGP SIGNATURE-----

--=-4pbxLaLnMipw4hZnQyCG--


