Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13097F9C07
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 09:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641696.1000472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7XGC-0003YR-GF; Mon, 27 Nov 2023 08:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641696.1000472; Mon, 27 Nov 2023 08:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7XGC-0003Ve-D4; Mon, 27 Nov 2023 08:46:32 +0000
Received: by outflank-mailman (input) for mailman id 641696;
 Mon, 27 Nov 2023 08:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lpOF=HI=amazon.co.uk=prvs=6887de0c1=dwmw@srs-se1.protection.inumbo.net>)
 id 1r7XGA-0003VY-En
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 08:46:30 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734a1a14-8d01-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 09:46:28 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-1197e3af.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 08:46:24 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2a-m6i4x-1197e3af.us-west-2.amazon.com (Postfix)
 with ESMTPS id 266D8100FBD; Mon, 27 Nov 2023 08:46:23 +0000 (UTC)
Received: from EX19MTAUEA002.ant.amazon.com [10.0.44.209:44475]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.6.41:2525] with
 esmtp (Farcaster)
 id 141044fc-c10d-4cf8-bc11-f71ae1145270; Mon, 27 Nov 2023 08:46:22 +0000 (UTC)
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 27 Nov 2023 08:46:22 +0000
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19D008UEC001.ant.amazon.com (10.252.135.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.39;
 Mon, 27 Nov 2023 08:46:22 +0000
Received: from EX19D008UEC001.ant.amazon.com ([fe80::4702:5d1a:c556:797]) by
 EX19D008UEC001.ant.amazon.com ([fe80::4702:5d1a:c556:797%3]) with mapi id
 15.02.1118.039; Mon, 27 Nov 2023 08:46:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 734a1a14-8d01-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1701074788; x=1732610788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to;
  bh=2f4ZZ4v4ePsCyOCB+yogvbTxlVa8DfjeKoghatgYhHI=;
  b=KeWcBEOjfc+eNBLZZI7Yw7mdHXnumIevTAUFTOIFLp/fS7qgJHvA+IRh
   zj6vbBwMOQvAUAtFK1YgzPU0mKwBi91AmNkmQxezlxFfL828QTUx1TnCo
   2hOd4APbZVY6lLYxFLIp6BcY/3j67+VZh6pxs9IqHnLbfAma/FgtFs4TJ
   s=;
X-Amazon-filename: smime.p7s
X-IronPort-AV: E=Sophos;i="6.04,230,1695686400"; 
   d="p7s'?scan'208";a="255012342"
Content-Type: multipart/mixed; boundary="===============3000760005954283363=="
MIME-Version: 1.0
X-Farcaster-Flow-ID: 141044fc-c10d-4cf8-bc11-f71ae1145270
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "eduardo@habkost.net" <eduardo@habkost.net>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "marcel.apfelbaum@gmail.com"
	<marcel.apfelbaum@gmail.com>, "groug@kaod.org" <groug@kaod.org>,
	"qemu_oss@crudebyte.com" <qemu_oss@crudebyte.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "julien@xen.org" <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"paul@xen.org" <paul@xen.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
	"marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
	"berrange@redhat.com" <berrange@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>
Subject: Re: [RFC PATCH v3 3/5] xen: add option to disable legacy backends
Thread-Topic: [RFC PATCH v3 3/5] xen: add option to disable legacy backends
Thread-Index: AQHaIQ4y9k/QGRqAmk6N5LqHUfs1XQ==
Date: Mon, 27 Nov 2023 08:46:21 +0000
Message-ID: <a876dd8d01570f76da06f009eb8ed96bc3e0fea6.camel@amazon.co.uk>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
	 <20231124232400.943580-4-volodymyr_babchuk@epam.com>
In-Reply-To: <20231124232400.943580-4-volodymyr_babchuk@epam.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.82.23]
MIME-Version: 1.0
Precedence: Bulk

--===============3000760005954283363==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/pkcs7-signature"; boundary="=-x5o5G14s2DLSe/tKK17B"

--=-x5o5G14s2DLSe/tKK17B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2023-11-24 at 23:24 +0000, Volodymyr Babchuk wrote:
> This patch makes legacy backends optional. As was discussed at [1]
> this is a solution to a problem when we can't run QEMU as a device
> model in a non-privileged domain. This is because legacy backends
> assume that they are always running in domain with ID =3D 0. Actually,
> this may prevent running QEMU in a privileged domain with ID not equal
> to zero.
>=20
> To be able to disable legacy backends we need to alter couple of
> source files that unintentionally depend on them. For example
> xen-all.c used xen_pv_printf to report errors, while not providing any
> additional like xendev pointer. Also, we need to move xenstore
> structure from xen-legacy-backend.c, because it is apparently used in
> xen-all.c.
>=20
> With this patch it is possible to provide
> "--disable-xen-legacy-backends" configure option to get QEMU binary
> that can run in a driver domain. With price of not be able to use
> legacy backends of course.
>=20
> [1]
> https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg05022.html
>=20
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>=20
> ---
>=20
> I am not sure if I made correct changes to the build system, thus this
> patch is tagged as RFC.

Hm, I was imagining a new CONFIG_LEGACY_XEN_BACKENDS option which would
look a lot like CONFIG_XEN_BUS (which would now be only for the new
XenBus code).

This looks weird to me:

> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -14,7 +14,9 @@ system_ss.add(when: 'CONFIG_PL110', if_true:
> files('pl110.c'))
>  system_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
>  system_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
>  system_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
> -system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
> +if have_xen_legacy_backends
> +  system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
> +endif
>=20
>  system_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
>  system_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))

I'd prefer to see just:

-system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
+system_ss.add(when: 'CONFIG_XEN_LEGACY_BACKENDS', if_true: files('xenfb.c'=
))


Probably also better to split out the bits in accel/xen/xen-all.c and
hw/xen/xen-legacy-backend.c to a separate preparatory commit.

--=-x5o5G14s2DLSe/tKK17B
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEjww
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhAwggT4oAMCAQICEQC/QgfpbUT3q2fHshU/ReqfMA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowIjEgMB4GCSqGSIb3DQEJARYRZHdtd0BhbWF6b24uY28udWsw
ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCZgnzd4h6STv/MQcUPixvDN/dNtp4yVSdc
xz9mB1OcA7HXd4WdPyYagmkcH0WguDYaQnOszkSdElI+2XRFSlGXhY7U9tktvdWuY1zAY1UWES8e
3BUHqSKbIKx4SX6GuctCcPnyagVZ9Hk21YUElx9cdmrqt0bGoydgxAspEx56J9Q5a48WfvFYjLBF
NL1dw+P1eUeAljco30+Xggf5faawKfPArUX0cmU4VIh5DMUyv4d0xxfNN6cK1GMj/HGUg2T9OTHW
nbTdq+OHJwHGi/37mCWx1O3uV0hbZzA1fNklaqlsr1Acg0elPeCFXLb8dSkMgQZHNJVjn+mBvG4d
MG4FS3ntipApytA+a5IaMP3LNAo0EoBd5/xVy0M6TXbiYesYLq9rhnrLgO1qcw7+if0jH9YoEJ6a
Je1m7omfEXh2XpospSLaohmAqaBKlyhXDXbTnUVnIf79zU5ohHZof0cP2amnnvYUVD72iuf9qe7X
4L1Rj589qEWYROKiMil5X7l/smE1dAmxhKxx6YWvWkXH9u7JOcmLGdKST0voaY7j3Wk0lxK3NKsk
q0G3BpqbPz3P8BYtn38BvbkFnwVW7F7Qzus3KZJgP62eN25QHxoFj44x3sppx4I5WlYG4lxdFZsY
smQdj64c7MaJ7cp8RJN+eO32RKrkndEkihzxevl11wIDAQABo4IByjCCAcYwHwYDVR0jBBgwFoAU
CcDy/AvalNtf/ivfqJlCz8ngrQAwHQYDVR0OBBYEFJ418HpIgZaPnwpWdCNSvm4XgH/lMA4GA1Ud
DwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjBA
BgNVHSAEOTA3MDUGDCsGAQQBsjEBAgEBATAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28u
Y29tL0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29S
U0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+
MHwwVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1
dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3Nw
LnNlY3RpZ28uY29tMBwGA1UdEQQVMBOBEWR3bXdAYW1hem9uLmNvLnVrMA0GCSqGSIb3DQEBCwUA
A4IBAQCSez7gtf1wlWJr568crX21nm6QFWRdJ/YxMOReeqYtGs8QZf2zm2vIEFab61MrgJFJcFJL
sRhVHwnH/hvax3ZldDpUhM0ODpA9soUjYsvKJ0boFAHPtI1BL0yrZNCBdsUGxMv0t64Acj2ovxQ+
OxPd5ngHu0MzYIKLDvTSehxkh/qW23X7Ey/fPR0sgnAK4IV7clidmuWBbrqX+WKEyEP2kaEvLsRg
8plzYbVVFJl37rX2waKnGaWYnJ3BrvcMMgDSQCuoxMThWAOr7wxOh0ni0K3rW7CwDIAjUSk+fFmS
2EacUvIv/0xUW1nXzGJ12/Qyi+Mw65m0qE776qfcftg3MIIGEDCCBPigAwIBAgIRAL9CB+ltRPer
Z8eyFT9F6p8wDQYJKoZIhvcNAQELBQAwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVy
IE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+
MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0EwHhcNMjIwMTA3MDAwMDAwWhcNMjUwMTA2MjM1OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFk
d213QGFtYXpvbi5jby51azCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJmCfN3iHpJO
/8xBxQ+LG8M39022njJVJ1zHP2YHU5wDsdd3hZ0/JhqCaRwfRaC4NhpCc6zORJ0SUj7ZdEVKUZeF
jtT22S291a5jXMBjVRYRLx7cFQepIpsgrHhJfoa5y0Jw+fJqBVn0eTbVhQSXH1x2auq3RsajJ2DE
CykTHnon1DlrjxZ+8ViMsEU0vV3D4/V5R4CWNyjfT5eCB/l9prAp88CtRfRyZThUiHkMxTK/h3TH
F803pwrUYyP8cZSDZP05MdadtN2r44cnAcaL/fuYJbHU7e5XSFtnMDV82SVqqWyvUByDR6U94IVc
tvx1KQyBBkc0lWOf6YG8bh0wbgVLee2KkCnK0D5rkhow/cs0CjQSgF3n/FXLQzpNduJh6xgur2uG
esuA7WpzDv6J/SMf1igQnpol7WbuiZ8ReHZemiylItqiGYCpoEqXKFcNdtOdRWch/v3NTmiEdmh/
Rw/Zqaee9hRUPvaK5/2p7tfgvVGPnz2oRZhE4qIyKXlfuX+yYTV0CbGErHHpha9aRcf27sk5yYsZ
0pJPS+hpjuPdaTSXErc0qySrQbcGmps/Pc/wFi2ffwG9uQWfBVbsXtDO6zcpkmA/rZ43blAfGgWP
jjHeymnHgjlaVgbiXF0VmxiyZB2PrhzsxontynxEk3547fZEquSd0SSKHPF6+XXXAgMBAAGjggHK
MIIBxjAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUnjXwekiBlo+f
ClZ0I1K+bheAf+UwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYB
BQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEW
F2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2Vj
dGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5j
cmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9T
ZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEF
BQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHAYDVR0RBBUwE4ERZHdtd0BhbWF6b24uY28u
dWswDQYJKoZIhvcNAQELBQADggEBAJJ7PuC1/XCVYmvnrxytfbWebpAVZF0n9jEw5F56pi0azxBl
/bOba8gQVpvrUyuAkUlwUkuxGFUfCcf+G9rHdmV0OlSEzQ4OkD2yhSNiy8onRugUAc+0jUEvTKtk
0IF2xQbEy/S3rgByPai/FD47E93meAe7QzNggosO9NJ6HGSH+pbbdfsTL989HSyCcArghXtyWJ2a
5YFuupf5YoTIQ/aRoS8uxGDymXNhtVUUmXfutfbBoqcZpZicncGu9wwyANJAK6jExOFYA6vvDE6H
SeLQretbsLAMgCNRKT58WZLYRpxS8i//TFRbWdfMYnXb9DKL4zDrmbSoTvvqp9x+2DcxggTHMIIE
wwIBATCBrDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
A1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAL9CB+ltRPer
Z8eyFT9F6p8wDQYJYIZIAWUDBAIBBQCgggHrMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTIzMTEyNzA4NDYyMFowLwYJKoZIhvcNAQkEMSIEILpChnzCNBsdRY+Ea+pi
uD6W5dicbuIDxzBGftFR3+onMIG9BgkrBgEEAYI3EAQxga8wgawwgZYxCzAJBgNVBAYTAkdCMRsw
GQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1Nl
Y3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IGFuZCBTZWN1cmUgRW1haWwgQ0ECEQC/QgfpbUT3q2fHshU/ReqfMIG/BgsqhkiG9w0BCRACCzGB
r6CBrDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAL9CB+ltRPerZ8ey
FT9F6p8wDQYJKoZIhvcNAQEBBQAEggIAlbdFSh4QuvBisYDKpPOxH1gNP2da8eaCyyaAHPff1CQK
UhxjNkoewU5matatC2SDw2mMt7i7p56zNkqKeZG20c4L5mV9E0KlQfwls5ADLozZxKJLhcPPxK+A
AS7H13/MP6oIVIU5KHS4JF8btFecaUC2ZoRTZEXv0aLnOGGNtSKs2+O3tUBW24MWhek5gPLCB9aE
nuLUh1l3O3Ws3lqIbpV2W0WfppQtPYx56Dyx24MYtWdYXSq0oLkpCcujFjABjN1IwvlyBj959S/+
v4x3pQyoJetanuSYQ6015XY4OaXG9pOaqso9tYN+G8UwbyWqfWuyhbeAfWfYjYMzqcZ4V/EwIYij
rzelcB40PbJuB54hpi6yu2iPDb3W+zA90AiWZo1WUKs76uhhiGORWmN+wfynMzs+8Kdkvn8x/4s7
kpDvoAFR9sBvVDd23WPQtj1hqJr05i9hgiIbQs8TknWAlI/ZC3nqkw9bWRDLoq24JyB8pKyyXN8C
CHRwaw3S/RzXjBxAt6x496lHCo73E9x7l+YI6mMeef5JvJSg4HA0J6i2hlVkOgfYm9f8ZoaX0B/l
jt/S7F2Ah8X09UGvFKfX/PWJ9vuKXiMUBePA1Uiym//falgCZj0EGFQDrYPpQvfOrYq1P1lvWSQ0
H3b78dS0RusX3gHUok8+C9oQT2NZ6csAAAAAAAA=


--=-x5o5G14s2DLSe/tKK17B--

--===============3000760005954283363==
Content-Type: multipart/alternative; boundary="===============2959059955995353066=="
MIME-Version: 1.0
Content-Disposition: inline

--===============2959059955995353066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============2959059955995353066==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============2959059955995353066==--
--===============3000760005954283363==--

