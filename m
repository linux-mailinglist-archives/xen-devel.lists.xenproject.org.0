Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0/QJRBJOmpS5QcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:51:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6A6B5697
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:51:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=infradead.org header.s=casper.20170209 header.b=lrtyFbxA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none)
Received: from list by lists.xenproject.org with outflank-mailman.1344170.1603299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwpz-0004yX-Cf; Tue, 23 Jun 2026 08:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344170.1603299; Tue, 23 Jun 2026 08:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwpz-0004vl-9w; Tue, 23 Jun 2026 08:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1344170;
 Tue, 23 Jun 2026 08:50:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+2f4ff5ab8596c4607a2e+8339+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wbwpw-0004vc-5O
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 08:50:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbwpt-009GRk-Pa; Tue, 23 Jun 2026 10:50:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+2f4ff5ab8596c4607a2e+8339+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a3a48c6-e002-0a2a0a5209dd-0a2a4504b7d0-44
 for <multiple-recipients>; Tue, 23 Jun 2026 10:50:24 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <BATV+2f4ff5ab8596c4607a2e+8339+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a3a48cf-5f9f-0a2a45040019-5a9b3222e79c-3
 for <multiple-recipients>; Tue, 23 Jun 2026 10:50:23 +0200
Received: from [2001:8b0:10b:5:5c35:4a44:b8b0:48f]
 (helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wbwpo-00000005qQh-3N7c; Tue, 23 Jun 2026 08:50:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kcRgiuRej8MdI7L26s3G6V6760dkJcrjiIrLXz5fyVk=; b=lrtyFbxALIwISgeZA/kdYhA3J/
	Z/iBElvcZdoJxAzUoaOBPBCOveZdpHs2EP5Loz7W9HgQGUtDmxTYW6ALDUGpo0lCFAd4MzKCDABZb
	aspTmQBmRjezMJ6S5aGYIerHLTvcXsFdU6eKShuANNA15PO7FMYxCul7x4ae63+FVb/uZAw/lpk4c
	926J5pX750rQPiQs6pWiYQQBvBdIMjHBu0MlAK6bG13QpOOUW6DuQUR8FDalrsfShXbbNJP535MF+
	Xuz3OQq8YZKCrz5SIUpcwecOezbyK4LRlWrx0wg+DVEOMF/18FaHckrV6ZSqdbEYmZhCzrMyXkKE+
	HPULOxYw==;
Message-ID: <936d12817d1401a0e5033513cc8ad04a56a076e8.camel@infradead.org>
Subject: Re: [PATCH v5 04/34] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
From: David Woodhouse <dwmw2@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, x86@kernel.org,
 kvm@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner	 <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Vitaly
 Kuznetsov	 <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky	 <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>,
 Jonathan Cameron	 <jic23@kernel.org>, Marc Zyngier <maz@kernel.org>, Sascha
 Bischoff	 <Sascha.Bischoff@arm.com>, Jack Allister <jalliste@amazon.com>, 
	joe.jin@oracle.com, Joey Gouly <joey.gouly@arm.com>
Date: Tue, 23 Jun 2026 09:50:20 +0100
In-Reply-To: <913f6048e1193e65278cb3f4b4dbf04a151e85f5.camel@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
		 <20260608145455.89187-5-dwmw2@infradead.org>
		 <77f541f7-b346-4c86-8e66-3d2439e29cbb@oracle.com>
	 <913f6048e1193e65278cb3f4b4dbf04a151e85f5.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-qgqjtXkQsawglhqsis4k"
User-Agent: Evolution 3.60.3-0ubuntu1~ppa6 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1782204624-9EFD1141-20B3D38B/0/0
X-purgate-type: clean
X-purgate-size: 9157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.49 / 15.00];
	SIGNED_SMIME(-2.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dongli.zhang@oracle.com,m:x86@kernel.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:maz@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joe.jin@oracle.com,m:joey.gouly@arm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1A6A6B5697


--=-qgqjtXkQsawglhqsis4k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-16 at 12:13 +0100, David Woodhouse wrote:
> On Mon, 2026-06-15 at 23:47 -0700, Dongli Zhang wrote:
> > I tested patches 02, 03, 04, and 26 by customizing QEMU to support kexe=
c live
> > updates (LUO and KHO), preserving the memfd across kexec.
>=20
> Thank you.
>=20
> > For my use case, I used KVM_[GS]ET_CLOCK_GUEST instead of the existing
> > KVM_[GS]ET_CLOCK. I didn't account the downtime in my QEMU code, althou=
gh host
> > TSC never resets across kexec.
> >=20
> > Clock drift was zero, and I did not observe any unnecessary master cloc=
k updates
> > after KVM_SET_CLOCK_GUEST completed.
>=20
> The kvmclock drift won't have been *zero*; it will have been a
> nanosecond or two. Which most people won't notice, but is annoying me.
>=20
> It believe it comes from both pvclock_update_vm_gtod_copy() and
> kvm_vcpu_ioctl_set_clock_guest() rounding *down*. I think we should
> tweak the latter to round *up* so they're at least not biasing in the
> same direction.
>=20
> We could also do better at picking a snapshot cycle count which
> *doesn't* lose in the rounding. But those are definitely improvements
> for another day; this series is long and complex enough and has already
> gained a dependency on fixes in core timekeeping snapshots.

I think some of that drift should be solved by the snapshot fixes from
https://lore.kernel.org/all/20260622211822.1056437-2-dwmw2@infradead.org/
and in fact we might be able to do even better...

Since ktime_get_snapshot_id() now calculates the ideal time with sub-
nanosecond precision, we would add that as a field in the snapshot and
then KVM could track ->master_clock_ns_frac and ->kvmclock_offset_frac
and eliminate the rest of the rounding error too.

It might be more trouble than it's worth, but either way I'll look at
it some other time; it can be done incrementally.

--=-qgqjtXkQsawglhqsis4k
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDYyMzA4NTAy
MFowLwYJKoZIhvcNAQkEMSIEIDOm1m10SG0crtAVSZ+494IKuSSKgvfWfYtKWgTF0lQ8MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAX8rrG7JGogqc
Dn18rvL0yeEm9C7B0cUWzaRfLGcwi83qFG645uhT+a88ggUFguW7A3ThVSEXDYPjy9h+Ue3TRczh
tCpAf1yW/6BErlotG+zhR8wnBn62WrnScA9mI3tCke9Y5mRmU1SuIm9OeaBCCird+dGoDGrj9QIS
Ano/QHEldJiGnBaIakO6HPq901RLMMs8+bcNDmKPIOrhpR/+c0b8KpcrQxrEuSEyUCx+/qYCFKPa
JYwMZy1QGRUPV9iL1bqf19unjfDpfc2oasa/LdZIJWSO+CYk0MPF74YuTiFZSsRAdYOEBFSHv0zw
9XsBWTYIipaj9Lc/4pGP4OnhZOv9fvKpd9PeL3jjuZR2weF32paGKO/buOTXV+Fj8aLf3WAqX0P1
sHLQlVdbcwz62jEKcSGCAotbO38Y2mqdYdiLSKtGh1nMo34s2ZpQhrfb/JmcYu+tSQNMeki7I96k
EqpYEAkrQU5rqBq3V+qxQPCEwZpS46PsdCn5P7zC+9qntI41+pK6qa6cgVDvvAYsptkb8dyC7gcM
IFzOyGXZCT2fRdZYkmvy8c8jGUEW4CioN40E6h/lZBo3goWkjnje+I3ngP8dosJqYH2UyFWqRro2
mYjacVLz45hVwE2WUlumxQ+lCGPwZTEToSv3F3Oi/7qNlsghe0bBT1SXTyojbXUAAAAAAAA=


--=-qgqjtXkQsawglhqsis4k--

