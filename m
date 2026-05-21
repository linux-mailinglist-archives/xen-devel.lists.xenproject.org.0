Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIt+H+R+D2otMwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:53:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E95AC337
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:53:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316006.1585619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQBKG-0002qL-Dp; Thu, 21 May 2026 21:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316006.1585619; Thu, 21 May 2026 21:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQBKG-0002oV-AA; Thu, 21 May 2026 21:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1316006;
 Thu, 21 May 2026 21:53:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+d535bf5a2932b236163f+8306+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wQBKF-0002oP-GE
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:53:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQBKE-003ydx-FC; Thu, 21 May 2026 23:53:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+d535bf5a2932b236163f+8306+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0f7ebf-e002-0a2a0a5209dd-0a2a450cde72-2
 for <multiple-recipients>; Thu, 21 May 2026 23:53:05 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+d535bf5a2932b236163f+8306+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0f7ec1-62f1-0a2a450c0019-5a9b32229816-3
 for <multiple-recipients>; Thu, 21 May 2026 23:53:05 +0200
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wQBK0-000000095A5-459f; Thu, 21 May 2026 21:52:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lQm3XTbI80oVhehBjbAuKtJa9CPDd69/S5bnpm9lMHU=; b=YIYHCGEZRxwx/UUbFZUWbgIEQQ
	gIewyfR79ILiDfa4YbMDamIBYvhGuG2PXygUjdfM5S4xzCBmnFvsv/mWxbs2Pvnu169oxJY1aXqD5
	gP/NgJZdzLDQmP9Yx0D5Aylx+VnmjB/r9e9G9FBmketmaAuA9n602778rHHKHgTAthZLtdKGiEj0u
	hyzYy0a6I/0MccuSvdzG//WMVsLbGT0sQyfoeck+KJo0IAfLsPmH916B6aB7REqHPci+AkAQ8vFoT
	Z2SufJoWcwXGklfEYAdWkbLUbGcBQxVnTiq8mew7nfTXVVWxrgI3dljn1l057r54TuLgM1LbzwV8Q
	J3WG9daA==;
Message-ID: <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ
 attribute
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul
 Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>, Sascha
 Bischoff <Sascha.Bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, Joey
 Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, Dongli
 Zhang <dongli.zhang@oracle.com>,  joe.jin@oracle.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org,  linux-kselftest@vger.kernel.org
Date: Thu, 21 May 2026 22:52:51 +0100
In-Reply-To: <20260509224824.3264567-28-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
	 <20260509224824.3264567-28-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-kieuLTxJtkGwFtplrKxg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1779400385-F4C79CF5-A8603D8F/0/0
X-purgate-type: clean
X-purgate-size: 8988
X-Spamd-Result: default: False [-1.49 / 15.00];
	SIGNED_SMIME(-2.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,amazon.co.uk:email];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E10E95AC337
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-kieuLTxJtkGwFtplrKxg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-05-09 at 23:46 +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> Add a read-only per-vCPU attribute that reports the effective TSC and
> APIC bus frequencies as seen by the guest, after hardware TSC scaling
> is applied.
>=20
> This allows userspace to populate CPUID leaf 0x40000010 (the "generic"
> timing information leaf used by FreeBSD, XNU, and VMware) with correct
> values, without KVM needing to modify guest CPUID at runtime.
>=20
> The effective TSC frequency differs from what userspace requested via
> KVM_SET_TSC_KHZ due to the granularity of hardware scaling and the
> host kernel's measurement of its own TSC frequency.

As I do another pass on this series, I don't think I can stand by that
claim.

Even on AMD where we only have a 32-bit shift for TSC scaling, that's
still 0.23 PPM, or about half a Hz precision when scaling a 2400MHz
TSC.

And this API was returning kHz anyway! So it was as likely to be
*introducing* inaccuracy by returning 2299999kHz when userspace had
actually asked for 2300000 and the real rate ended up being
2399999.9995.

I think I'll drop it; and userspace should just use KVM_GET_TSC_KHZ.

That does leave userspace still needing a way to get the APIC bus
frequency, to populate CPUID. So maybe I'll just make an attribute
which returns that as a single value.

Or *maybe* KVM should just populate leaf 0x40000010 in its default
template? I thought we decided not to do that though, as unsuspecting
userspace might pass it through uncorrected from the default values? We
could put *zero* in the TSC part, but that just seems like it's another
potential weirdness for the guest to see.



--=-kieuLTxJtkGwFtplrKxg
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDUyMTIxNTI1
MVowLwYJKoZIhvcNAQkEMSIEIPTu0mqiGZugXJbGRVIc7YWEYXrooNvcvkRWmfHyHQVpMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIA0gKFPMVJ16K8
G+6uSbAsoclqi1r0q8ZMfteGT2TzFUWZkNx0kOz6SCBad01Wf8X12t+HFxFYOrLz0Fc18CuhIgEq
W3ZR4pkUvGQrsqJp0QqAo/zbESWOrYCId6ZVvV/6SOBEjj/lhUMdZrRvuOUeo0QGUArl6aXhGSyb
qaN59x6T/SzleSWnsj9ykOj5NFIwLRJwRFIkSrt3h2bVacx/hwLGQi5q3TTpFy6LFoEn2cGmTgP9
p4s/0zZ/WXW1VM/vxcNQF+Hg0SiCCC6NI9r+frMnHAgUgTdDmAwVIiTVXXnhU74B+U8U3oA/bCBX
xFKyjBtF8zxXIvyCdyZXqS13uNu5Eno1BZcMDb3yUr1WDTJ7yEzZTtgB9ue1ExOCSPdCCQEttwat
ZIPcd0feapzUynQsoW2datvonMGhad1cQd5qYSxQPY3oqvubmK9sov7nw3leMBKfPsVI7DsnWDxx
+3e7ak37k/FPQk5pllx+1+7kDWhCiwDnlR0r9we/deo8V3MobXmdeW4DKZbOZtFPZP2z83p5j+vA
X4IJwLZw2aW5Oh28DuoDnsHfHgOx9SVn4gU9xdlkl47AALbLCKVwJihi0sE8WQ1prfzRjqzq4IiE
jsfkDziMpyolxwykNaGUuOBN/f4ogZ48tj0ZdoHBPLW01z8L6mBMpQ7XHkneEQwAAAAAAAA=


--=-kieuLTxJtkGwFtplrKxg--

