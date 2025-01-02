Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17F9FF9E4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 14:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863972.1275318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTLRW-000536-Fd; Thu, 02 Jan 2025 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863972.1275318; Thu, 02 Jan 2025 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTLRW-0004yr-CJ; Thu, 02 Jan 2025 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 863972;
 Thu, 02 Jan 2025 13:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpvf=T2=casper.srs.infradead.org=BATV+b36269e03d8020e3a9b7+7802+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tTLRU-0004x6-Sl
 for xen-devel@lists.xen.org; Thu, 02 Jan 2025 13:40:52 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a9b6222-c90f-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 14:40:45 +0100 (CET)
Received: from [172.31.31.240] (helo=u09cd745991455d.lumleys.internal)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tTLRM-0000000Gqm4-0q3O; Thu, 02 Jan 2025 13:40:44 +0000
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
X-Inumbo-ID: 2a9b6222-c90f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tpjCVnQPWoH/XipcBZOPQWI/gdmv2UjGTw2vyAbwl2w=; b=EaHzxMq7uuhnkLqUBvni9OO22B
	qaQmZsA/wOadKIGzCdd9ftFkZ56tCnaQ79roo/m4wPvJYR5HY97+KPvNVGUYm01ZBmZVO5OXOtcos
	jOGPgdp+tPkdM4Donae8Bh/LMBnfl3kpR50Wa+k5Ik3N8XUk8BU1NbVx0/aDrcRXwdfFNZPtMRYqR
	SHiXEccOfrTZz5d2sekBUPOZ8JjyeCVmbgynqsdYVeQPzwBZz9vaXuJDAIj6ZAtMHaklQI5zR1gxU
	K9GBbzVQhzZz5BEbekoLvBBbDHblDVHtNR8zGc/246/K+zV8mwEtuYClALdtXPRjnygae2MG3cc1c
	FXz8ARLQ==;
Message-ID: <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, "Xen.org security
 team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org,  xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
Date: Thu, 02 Jan 2025 13:40:44 +0000
In-Reply-To: <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
	 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
	 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
	 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
	 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-ZSqhNB+07rLVAUqGo4d1"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-ZSqhNB+07rLVAUqGo4d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-01-02 at 14:38 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 02.01.25 13:53, David Woodhouse wrote:
> > On Thu, 2025-01-02 at 13:07 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 23.12.24 15:24, David Woodhouse wrote:
> > > > On Tue, 2024-12-17 at 12:18 +0000, Xen.org security team wrote:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Xen Security Advisory CVE-2024-53241 / XSA-466
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 version 3
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Xen =
hypercall page unsafe against speculative attacks
> > > > >=20
> > > > > UPDATES IN VERSION 3
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >=20
> > > > > Update of patch 5, public release.
> > > >=20
> > > > Can't we even use the hypercall page early in boot? Surely we have =
to
> > > > know whether we're running on an Intel or AMD CPU before we get to =
the
> > > > point where we can enable any of the new control-flow integrity
> > > > support? Do we need to jump through those hoops do do that early
> > > > detection and setup?
> > >=20
> > > The downside of this approach would be to have another variant to do
> > > hypercalls. So you'd have to replace the variant being able to use AM=
D
> > > or INTEL specific instructions with a function doing the hypercall vi=
a
> > > the hypercall page.
> >=20
> > You'd probably start with the hypercall function just jumping directly
> > into the temporary hypercall page during early boot, and then you'd
> > update them to use the natively prepared vmcall/vmmcall version later.
> >=20
> > All the complexity of patching and CPU detection in early boot seems to
> > be somewhat gratuitous and even counter-productive given the change it
> > introduces to 64-bit latching.
> >=20
> > And even if the 64-bit latch does happen when HVM_PARAM_CALLBACK_IRQ is
> > set, isn't that potentially a lot later in boot? Xen will be treating
> > this guest as 32-bit until then, so won't all the vcpu_info and
> > runstate structures be wrong even as the secondary CPUs are already up
> > and running?
>=20
> What I don't get is why this latching isn't done when the shared info
> page is mapped into the guest via the XENMAPSPACE_shared_info hypercall
> or maybe additionally when VCPUOP_register_runstate_memory_area is being
> used by the guest.
>=20
> These are the earliest possible cases where the guest is able to access
> this data.

Well, that's a great idea. Got a time machine? If you have, I have some
comments on the MSI=E2=86=92PIRQ mapping nonsense too... :)

> >=20
> > > I'm planning to send patches for Xen and the kernel to add CPUID feat=
ure
> > > bits indicating which instruction to use. This will make life much ea=
sier.
> > >=20
> > > > Enabling the hypercall page is also one of the two points where Xen
> > > > will 'latch' that the guest is 64-bit, which affects the layout of =
the
> > > > shared_info, vcpu_info and runstate structures.
> > > >=20
> > > > The other such latching point is when the guest sets
> > > > HVM_PARAM_CALLBACK_IRQ, and I *think* that should work in all
> > > > implementations of the Xen ABI (including QEMU/KVM and EC2). But wo=
uld
> > > > want to test.
> > > >=20
> > > > But perhaps it wouldn't hurt for maximal compatibility for Linux to=
 set
> > > > the hypercall page *anyway*, even if Linux doesn't then use it =E2=
=80=94 or
> > > > only uses it during early boot?
> > >=20
> > > I'm seeing potential problems with that approach when someone is usin=
g
> > > an out-of-tree module doing hypercalls.
> > >=20
> > > With having the hypercall page present such a module would add a way =
to do
> > > speculative attacks, while deleting the hypercall page would result i=
n a
> > > failure trying to load such a module.
> >=20
> > Is that a response to the original patch series, or to my suggestion?
> >=20
> > If we temporarily ask Xen to populate a hypercall page which is used
> > during early boot (or even if it's *not* used, and only used to make
> > sure Xen latches 64-bit mode early)... I don't see why that makes any
> > difference to modules. I wasn't suggesting we keep it around and
> > *export* it.
>=20
> Ah, I didn't read your suggestion that way.
>=20
> Still I believe using the hypercall page is not a good idea, especially a=
s
> we'd add a hard dependency on the ability to enable CFI in the kernel rel=
ated
> to the switch from the hypercall page to the new direct hypercall functio=
ns.

Are you suggesting that you're able to enable the CPU-specific CFI
protections before you even know whether it's an Intel or AMD CPU?

--=-ZSqhNB+07rLVAUqGo4d1
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEwMjEzNDA0
NFowLwYJKoZIhvcNAQkEMSIEIDUwqzfQxPc+HaOfqtpRWO5Rf/HauguEWk83YSkakwpOMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAr4S7rxlagx1c
9wh0lNoVXvLKYFaoAwFADYW/JRzu9XcwebnGA6Zb0xlAQjh0T/wFMAcbXqpIGMvtzJimKPVkSZgi
azWY5K1BJf+0NwALOpH1NrVrGolTt6V3B6Rcoihdlnge8/QNizeggzTqi8FEy4C+BjtRNXU7tOUS
SgAkUt2qegRlqOL64DLdcanZDTM8EDcxpSEth2H+5hOis297dYHdwMHioBbaaJVjjb8j28ngOYrg
afNoYOaV1Hez4OL82fwmI6YYA5YKPdhlqzUvNG7GbvC4SIUO82AV4f+v2qpg40dvCg61KM4SdqPA
J1VZCDd8eMJk1wweZasJRgLvVg8AGVAjR+frG8gwkuVuetez6InWO/L369pc/Qs11s2BaqQ4tz1N
SUiX6Auf48efCyUwVNhjHu3oGSmb08tzIi7UgVQCAgdEoCNanGQreUIygCX8UkfpxZCKuz9iqrEr
rwwr+A65GPp3WPgdR/cXEAaW6GklQDjk4hoTBgjn09dcf7hKp9PiyE6XGvLU9/DnsIXLY8QXvdDn
3NESrkzOnrTKhUE/bD29dDxKYZ3cvt/Thqa+J4NB+X17MSwOaw8pL4ji6UBksk6GBF/cw26kXQK2
Pg7kQ+ervXyOEkztp11rJujCeCze3RSYxfMwCYU8UuXqDBFbjgF5DjuPRZR8pU4AAAAAAAA=


--=-ZSqhNB+07rLVAUqGo4d1--

