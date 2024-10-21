Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A79A66F5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823410.1237404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qtT-0003bB-HE; Mon, 21 Oct 2024 11:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823410.1237404; Mon, 21 Oct 2024 11:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qtT-0003Y1-DC; Mon, 21 Oct 2024 11:48:15 +0000
Received: by outflank-mailman (input) for mailman id 823410;
 Mon, 21 Oct 2024 11:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gOu=RR=amazon.co.uk=prvs=017fe8541=dwmw@srs-se1.protection.inumbo.net>)
 id 1t2qtR-0002fZ-B7
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:48:13 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5886d7fa-8fa2-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 13:48:11 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO 169.254.80.37)
 ([10.43.8.6]) by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 11:48:10 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by inbound-smtp.us-west-2.amazonaws.com with SMTP id
 t2h73osf72gp28frdr4lj61kq4o9tfsnruoi4701
 for ingestion@secure-attach.perimeter.email.amazon.dev;
 Mon, 21 Oct 2024 11:43:07 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 11:43:05 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.0.204:18408]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.25:2525]
 with esmtp (Farcaster)
 id 201fbedc-2036-4ed9-91d8-4c54fa45f86c; Mon, 21 Oct 2024 11:43:04 +0000 (UTC)
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 21 Oct 2024 11:43:04 +0000
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19D008UEC001.ant.amazon.com (10.252.135.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 21 Oct 2024 11:43:04 +0000
Received: from EX19D008UEC001.ant.amazon.com ([fe80::4702:5d1a:c556:797]) by
 EX19D008UEC001.ant.amazon.com ([fe80::4702:5d1a:c556:797%3]) with mapi id
 15.02.1258.034; Mon, 21 Oct 2024 11:43:04 +0000
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
X-Inumbo-ID: 5886d7fa-8fa2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1729511292; x=1761047292;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to;
  bh=HGomAy27EiOqevmUp9aqgQ2x4mJxiI4PWKTFvPqjMJs=;
  b=X5SQnsfKCU34ZtLycXHpeg58eHOxoYR//WIlL3c/vwhpT2EYxks/pdYp
   9q23Y4lR8mcDWnnaC1Yg26WBK2PW2+C6lunhesmGu1Iu+GBSGYY+Jmonn
   plQ9+gFrFx8ArOZWIzPsFP80vHV5q26O1punvYfNPvX2UGTdoAOwxfhdj
   w=;
X-Amazon-filename: smime.p7s
X-IronPort-AV: E=Sophos;i="6.11,220,1725321600";
   d="p7s'346?scan'346,208,346";a="140132990"
Content-Type: multipart/mixed; boundary="===============4692130862257726593=="
MIME-Version: 1.0
X-Farcaster-Flow-ID: 201fbedc-2036-4ed9-91d8-4c54fa45f86c
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "xenproject@ymy.be"
	<xenproject@ymy.be>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re:  [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Thread-Topic: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Thread-Index: AQHbI65j/ode2i+6jkmTOdAwVhWC+Q==
Date: Mon, 21 Oct 2024 11:43:04 +0000
Message-ID: <3663ba26192a78de2090512c912bff8afc852e5c.camel@amazon.co.uk>
References: <20241018080813.45759-1-roger.pau@citrix.com>
	 <ZxMmOjD7oHuAE7Vb@mail-itl>
In-Reply-To: <ZxMmOjD7oHuAE7Vb@mail-itl>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.82.51]
MIME-Version: 1.0

--===============4692130862257726593==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/pkcs7-signature"; boundary="=-XPmOImkDXv8tlkxUWb9S"

--=-XPmOImkDXv8tlkxUWb9S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2024-10-19 at 05:23 +0200, Marek Marczykowski-G=C3=B3recki wrote:
> On Fri, Oct 18, 2024 at 10:08:13AM +0200, Roger Pau Monne wrote:
> > When using AMD-VI interrupt remapping the vector field in the IO-APIC R=
TE is
> > repurposed to contain part of the offset into the remapping table.=C2=
=A0 Previous to
> > 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapp=
ing
> > table would match the vector.=C2=A0 Such logic was mandatory for end of=
 interrupt to
> > work, since the vector field (even when not containing a vector) is use=
d by the
> > IO-APIC to find for which pin the EOI must be performed.
> >=20
> > Introduce a table to store the EOI handlers when using interrupt remapp=
ing, so
> > that the IO-APIC driver can translate pins into EOI handlers without ha=
ving to
> > read the IO-APIC RTE entry.=C2=A0 Note that to simplify the logic such =
table is used
> > unconditionally when interrupt remapping is enabled, even if strictly i=
t would
> > only be required for AMD-Vi.
> >=20
> > Reported-by: Willi Junga <xenproject@ymy.be>
> > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using=
 a static mapping')
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> I can confirm it fixes touchpad issue on Framework 13 AMD,
> it works without ioapic_ack=3Dnew now, thanks!
> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

Thanks for testing. But... why did this work with the auto-EOI? That
*should* have had exactly the same problem, surely?=20

The problem fixed by this patch is that the directed EOI used the
actual vector# and *not* the bits that the I/O APIC *thinks* are the
vector#, which are actually the IRTE index#.

But if you let the CPU do its broadcast EOI then surely *that* is going
to use the actual vector# too, and have precisely the same problem?

If you use the code prior to this patch, *without* ioapic_ack=3Dnew (i.e.
the mode that was failing), what happens if you do this:

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -595,7 +595,7 @@ void setup_local_APIC(void)
     /*
      * Enable directed EOI
      */
-    if ( directed_eoi_enabled )
+    if ( 0 && directed_eoi_enabled )
     {
         value |=3D APIC_SPIV_DIRECTED_EOI;
         apic_printk(APIC_VERBOSE, "Suppress EOI broadcast on CPU#%d\n",


I'm guessing that 'fixes' it too? In which case, it looks like AMD has
some undocumented hack in between its APIC and I/O APIC to let it
magically auto-EOI the correct pin somehow?

Adding Boris and x86@kernel.org to Cc... do we know anything about such
an AMD hack?

--=-XPmOImkDXv8tlkxUWb9S
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
KoZIhvcNAQkFMQ8XDTI0MTAyMTExNDMwM1owLwYJKoZIhvcNAQkEMSIEIGSTJqxf3YRzSYK9BtMB
1yeDesaxEPO4jzwfdj8va2MUMIG9BgkrBgEEAYI3EAQxga8wgawwgZYxCzAJBgNVBAYTAkdCMRsw
GQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1Nl
Y3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IGFuZCBTZWN1cmUgRW1haWwgQ0ECEQC/QgfpbUT3q2fHshU/ReqfMIG/BgsqhkiG9w0BCRACCzGB
r6CBrDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAL9CB+ltRPerZ8ey
FT9F6p8wDQYJKoZIhvcNAQEBBQAEggIAghDcnN2nV57OY+R3kvhquPjIfGr11LNZrXG4s3dbV9EU
BkO7wCHSU8+Ocd738PN/fugdO9fqGmCB2dQRAJlBMwXhboR1+IlyV7lPWRyLoNAZFk+5H/t2mAoh
ElkPgh9xBKph4Z+O05VuiLfgMhHaYyFEUUpVpf6KAkPnOvKjHLxaaCohjO2v6Ki1yTilA5Cc13dV
8BMwXhcnjkUNwlrRCnQWo59fcSkxhVWa8QA24+OKjEtJ7YkaTqc7ABcYploBUDVyKgZn1ICs2sWg
hXI6U7ilrXEWOZMniTM1yJAFbHKVkprgFX0KyltLuTXx/SRrairllf4K1aM8xG6pAukw51ty3FOx
9DjjPUoFjm2dykKL+trrCq//I5OO2WBN/0DGZlL3SsTHuwad2BoPHa3oJKlbsVbvd/d8+U+vcvYC
nwXjgQ9lmcCH5Ut3qLF7m5zvUNNGYNF/JgxjdxuGeYIK5/KPeA4OhAnDCpgCNhClpZIRThjlNR1l
qz3Wz9eqknUPSj9rVqEisrf1ezVgcPWSWIFv5R+oAkGC6CySgp0KOm/eOhvpVnJqxU54mYrWMEDc
j3oF3vc9ZJ5RNNTFIt1G3S/ADuVBP5REiQyJHsUMt35rq0KRrosGrlHxznz+JVhuYy9r7/vZTtpl
hEUneZK7fFbWdNQ0j83NJRSb/ef5otMAAAAAAAA=


--=-XPmOImkDXv8tlkxUWb9S--

--===============4692130862257726593==
Content-Type: multipart/alternative; boundary="===============4441431936227863102=="
MIME-Version: 1.0
Content-Disposition: inline

--===============4441431936227863102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============4441431936227863102==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============4441431936227863102==--

--===============4692130862257726593==--

