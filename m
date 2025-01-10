Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BBA089C3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 09:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869306.1280768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWAH3-0003HB-Gj; Fri, 10 Jan 2025 08:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869306.1280768; Fri, 10 Jan 2025 08:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWAH3-0003F7-Df; Fri, 10 Jan 2025 08:21:45 +0000
Received: by outflank-mailman (input) for mailman id 869306;
 Fri, 10 Jan 2025 08:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b62p=UC=casper.srs.infradead.org=BATV+4f8727a5892a49e75626+7810+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tWAH2-0003F1-2B
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 08:21:44 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec4702cb-cf2b-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 09:21:42 +0100 (CET)
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=edge-cache-192.e-lhr50.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tWAH0-0000000CSWD-04Zw; Fri, 10 Jan 2025 08:21:42 +0000
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
X-Inumbo-ID: ec4702cb-cf2b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tGMjyQd2+jGi5ezrE20+Dh0F2Vs0fb19lFk8NfL0r9k=; b=TwokirjTExSWPrqRFq3QqI4LtL
	aLG3v/z52LdIDGYh8bWV/V1TUW/bxKkHQBMMuAkXPSffEDoMQ5ynLY95Lu+taBnXozycK5HWqij5m
	7YB5uhxS3bxxq3TxCYWgDaWjWEKCE6DiFzwYViOOxsgrQCsuAL+mV7rNRGMoCBYOmy3H0l/4rLTpY
	M1G5N9fuw+poNG1/pgJ5Z2rTfKSOD7fhYB+i15CxiwbAUTuKB6E5mdzSaL+FAX9xFH4DXY8zFdGpp
	s3/RQ/gmcHRJ8paiStTcg0BV23vYFuYtiBKNfNhuA1VoWwvI+OYjq7IqTrrUJcg8+uoajT0neSG6I
	DvhR0nig==;
Message-ID: <868327eef674cb45d4230f388c1674fe1dced86f.camel@infradead.org>
Subject: Re: [PATCH 2/2] xen: do not use '%ms' scanf specifier
From: David Woodhouse <dwmw2@infradead.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, qemu-devel@nongnu.org, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 xen-devel@lists.xenproject.org
Date: Fri, 10 Jan 2025 08:21:41 +0000
In-Reply-To: <73307130-f03e-413d-98fb-7e6c05383851@linaro.org>
References: <20250107093140.86180-1-roger.pau@citrix.com>
	 <20250107093140.86180-3-roger.pau@citrix.com> <Z3-sJMXpiFUoATHz@l14>
	 <974ab6743d168d34babd458fe5e2e7766bb280b4.camel@infradead.org>
	 <Z3__eDp4hShe79Pl@macbook.local>
	 <17c134258de9517b677f08a865394f8075d67bdf.camel@infradead.org>
	 <73307130-f03e-413d-98fb-7e6c05383851@linaro.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-LCYR3IEEqcqhJw1BSRXw"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-LCYR3IEEqcqhJw1BSRXw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-01-10 at 09:16 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/1/25 09:08, David Woodhouse wrote:
> > On Thu, 2025-01-09 at 17:55 +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, Jan 09, 2025 at 11:25:13AM +0000, David Woodhouse wrote:
> > > > On Thu, 2025-01-09 at 11:59 +0100, Anthony PERARD wrote:
> > > > >=20
> > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char label[32];
> > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XenDevice *xendev =3D NUL=
L;
> > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XenConsole *con;
> > > > > > @@ -550,7 +551,10 @@ static void xen_console_device_create(XenB=
ackendInstance *backend,
> > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
oto fail;
> > > > > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > -=C2=A0=C2=A0=C2=A0 if (xs_node_scanf(xsh, XBT_NULL, fe, "type"=
, errp, "%ms", &type) !=3D 1) {
> > > > > > +=C2=A0=C2=A0=C2=A0 node_path =3D g_strdup_printf("%s/type", fe=
);
> > > > > > +=C2=A0=C2=A0=C2=A0 type =3D qemu_xen_xs_read(xsh, XBT_NULL, no=
de_path, NULL);
> > > > > > +=C2=A0=C2=A0=C2=A0 g_free(node_path);
> > > > >=20
> > > > > I feel like we want "xs_node_read()" which would be similair to
> > > > > xs_node_vscanf() but would simply return the result of
> > > > > qemu_xen_xs_read(). This would avoid the need format of the node =
path in
> > > > > several place in the code. But it's OK like that as well.
> > > >=20
> > > > If you look at the other callers of qemu_xen_xs_read(), it looks li=
ke
> > > > the majority of them create the path with snprintf and then pass it=
 in.
> > > > Or with g_strdup_printf(), pass it in, then free it afterwards.
> > > >=20
> > > > So perhaps qemu_xen_xs_read() should be a printf-style function too=
,
> > > > with its last arg(s) being the node name.
> > >=20
> > > I just went with Anthony suggestion and introduced xs_node_read(), as
> > > I didn't want to play with qemu_xen_xs_read().=C2=A0 Not that I think=
 the
> > > suggestion is not valid, just seemed more work than what I wanted to
> > > do right now.
> >=20
> > Makes sense. Something like this=C2=B9?
> >=20
> > char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error **errp, unsigned =
int *len,
>=20
> Maybe switch len <-> errp arg order.

Ack. Changed in my 'percentms' branch in case Roger wants to use it.

We can then clean up a few users of snprintf+qemu_xen_xs_read() to use
xs_node_read() too.

--=-LCYR3IEEqcqhJw1BSRXw
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDExMDA4MjE0
MVowLwYJKoZIhvcNAQkEMSIEIFSdPAXclUH18tGfOnC/GHFtG2BFOq2oeLX0lN8ZPj7hMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAohs9pUWAtc1s
NcpVNygVAe33v9oci8I5lUtGKkNt5Qve8Cavav2P1GZh+FUoFmH93BmEKw82/GT47tqP2XSxVmX9
CSAs4svypEMW737BXzrWwzYKOuesoG8IxMMglz1FkBMHkVwp0v25UFPxm/jnFU9KMoK15yCOIbfH
xu5YId5j/M0XANE6A28NoqaJXq9uyftjzbrnWh7Z42XMD/4/vrlBHJxsREd9vrwCVptwUq/ttjX9
FqztnWikoQcfIEV48u2wwn4k76Qh2l4YqwJauuuw10zr7IPR8QMgBaitlfd8ieTx0dtFiBrpBHL6
N9RdJ6HmhxMRXUo52hTeZ0i34Urdlqt3NdRxUOz8G128XLzoNPkzTxLH2Ch9ltuauO8QeGottbSc
e+VSEv68NN0UoUnqnAk7ovX2zFHVApYm+l7U88NorpaKLcCov6U51kqvOV1gvK6VGIiP0GaeSj3W
LShZ16tUtxuw5l+P0OG48jlMYgu9g7TacDGrBMIfYhCfvrbH6l8N9nLGxp7NmtX/BymwpXvmsXUt
DgKdOoziHpUA+88/wz/GEOpKcmb5ppypGMMr43Ur0SuvT56R7WXzfeiVk3ZEODpk3+MQyoiCsXly
9PqnoQSdxiSw6Eq+pnXIH5QehGBERhCNuQQEoZ64PEMxKFkI1cSlIlTIfmHYAK4AAAAAAAA=


--=-LCYR3IEEqcqhJw1BSRXw--

