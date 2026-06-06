Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sSIzEyD8I2oV1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 06 Jun 2026 12:53:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A894E64D216
	for <lists+xen-devel@lfdr.de>; Sat, 06 Jun 2026 12:53:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=infradead.org header.s=casper.20170209 header.b=gy8xYWhq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none)
Received: from list by lists.xenproject.org with outflank-mailman.1330508.1593906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVoeA-0002vA-9Q; Sat, 06 Jun 2026 10:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330508.1593906; Sat, 06 Jun 2026 10:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVoeA-0002tb-64; Sat, 06 Jun 2026 10:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1330508;
 Sat, 06 Jun 2026 10:52:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+5f94dc927c466778897c+8322+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wVoe7-0002tV-40
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 10:52:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVoe6-00Fr0j-HG
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 12:52:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+5f94dc927c466778897c+8322+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a23fbf4-e002-0a2a0a5209dd-0a2a4505eb98-10
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 12:52:53 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+5f94dc927c466778897c+8322+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a23fc04-aaa8-0a2a45050019-5a9b3222a5f4-3
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 12:52:53 +0200
Received: from [2001:8b0:10b:5:e135:8c80:b1ce:3f2f]
 (helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wVodl-00000009dTM-3Nod; Sat, 06 Jun 2026 10:52:34 +0000
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
	bh=aMAeNZMNgr7i7Pp78hkFlqy0BHv1TcuoYaKZcq0aBj0=; b=gy8xYWhq+iEEcOAe0U8T8T73tP
	mnmXEjaJy4pXwcIriTPsYmGkRTj04zRwvvO2NXwk9wARpilN0jKSNKX83uyoZnkUl1WBxq3l7US7o
	rq1zjxI/Yhym86KytfQwUllqI+yPotv449qs5gjOPOOfzX3+190w5Dvwhir/tJpXWFZpWBLVO2C7c
	WvGdGohvDXRFMp0J8e/4ERmMYQxjDST1mO+xq/AmftcJzhqYuolcbLGdJU+ezbVFPj2yHJ2sFDuQZ
	XcoZXNy75qYC2SMjQj9M8lNIoqvWalepMiL2SYQgr6yPzevGwSgYXAmAqY47/p9QMsXgBkMoVW7p4
	m+rOXjOg==;
Message-ID: <eef867eae15e30d08482ba16a1a32159745b64a7.camel@infradead.org>
Subject: Re: [PATCH v4 10/47] x86/tsc: Consolidate forcing of
 X86_FEATURE_TSC_KNOWN_FREQ for PV code
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>, Sean Christopherson
 <seanjc@google.com>,  Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Kiryl Shutsemau
 <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,  Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>,  Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski	 <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Juergen Gross	 <jgross@suse.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz	
 <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe	
 <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
 Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky	
 <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, 	linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, 	xen-devel@lists.xenproject.org, Tom
 Lendacky <thomas.lendacky@amd.com>,  Nikunj A Dadhania	 <nikunj@amd.com>,
 Michael Kelley <mhklinux@outlook.com>
Date: Sat, 06 Jun 2026 11:52:33 +0100
In-Reply-To: <877boc554l.ffs@fw13>
References: <20260529144435.704127-1-seanjc@google.com>
	 <20260529144435.704127-11-seanjc@google.com> <877boc554l.ffs@fw13>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-+zEII74NtADjQ1WcGTb7"
User-Agent: Evolution 3.60.3 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c201ff/1780743173-D9971443-4A264845/0/0
X-purgate-type: clean
X-purgate-size: 11017
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.48 / 15.00];
	SIGNED_SMIME(-2.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:mhklinux@outlook.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,infradead.org:from_mime,infradead.org:mid];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[zytor.com,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,outlook.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A894E64D216


--=-+zEII74NtADjQ1WcGTb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-06-06 at 12:34 +0200, Thomas Gleixner wrote:
> On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
>=20
> > Now that all paravirt code that explicitly specifies the TSC frequency
> > also sets X86_FEATURE_TSC_KNOWN_FREQ, replace all of the one-off code
> > and simply set X86_FEATURE_TSC_KNOWN_FREQ if the TSC frequency is known=
.
> >=20
> > Do NOT force set TSC_KNOWN_FREQ if the "known" TSC frequency was provid=
ed
> > by the user.=C2=A0 Per commit bd35c77e32e4 ("x86/tsc: Add tsc_early_khz=
 command
> > line parameter"), one of the goals of the param is to allow the refined
> > calibration work "to do meaningful error checking".
> >=20
> > Note, preferring the user-provided TSC frequency over the frequency fro=
m
> > the hypervisor or trusted firmware, while simultaneously not treating t=
he
> > user-provided frequency as gospel, is obviously incongruous.=C2=A0 Swee=
p the
> > problem under the rug for now to avoid opening a big can of worms that
> > likely doesn't have a great answer.
>=20
> There is a good answer I think.
>=20
> early_tsc_khz exists to cater for the overclocking crowd. On their
> modded systems the firmware supplied TSC frequency (CPUID/MSR) is not
> matching reality anymore. So they work around that by supplying a close
> enough tsc_early_khz and then they let the refined calibration work
> figure it out.
>=20
> Arguably that's only relevant for bare metal systems and what's worse is
> that in virtual environments the refined calibration work can fail,
> which renders the TSC unstable.
>=20
> So I'd rather say we change this logic to:
>=20
> =C2=A0=C2=A0 if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tsc_khz =3D x86_init.....();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 force(X86_FEATURE_TSC_KNOWN_FREQ);
> =C2=A0=C2=A0 } else if (tsc_khz_early) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
> =C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0 }
>=20
> Along with:
>=20
> =C2=A0=C2=A0 if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tsc_khz_early)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Ignoring non-se=
nsical tsc_early_khz command line argument\n");
>=20
> or something daft like that.
>=20
> The kernel has for various reasons always tried to cater for the needs
> of users who are plagued by bonkers firmware, but we have to stop to
> prioritize or treating equal ancient and modded out of spec hardware.
>=20
> TBH, I consider that whole KVM clock nonsense to fall into the modded
> out of spec hardware realm. Do a reality check:
>=20
> =C2=A0=C2=A0 How many production systems are out there still which run VM=
s on CPUs
> =C2=A0=C2=A0 with a broken TSC and the lack of VM TSC scaling?
>=20
> I'm not saying that we should not support the few remaining systems
> anymore, but our tendency to pretend that we can keep all of this
> nonsense working and at the same time making progress is just a fallacy.

I don't know that we can take the KVM (and Xen) clock away from guests,
but all of the *horrid* part about it is the way it attempts to cope
with the possibility that the *host* timekeeping might flip away from
TSC-based mode at any point in time. By the end of my outstanding
cleanup series, that is the *only* thing the gtod_notifier remains for.

If we can trust the hardware *and* the host kernel, then KVM could
theoretically hardwire the kvmclock into 'master clock mode' where it
basically just advertises the TSC=E2=86=92kvmclock relationship *once* to a=
ll
CPUs and it never changes.

All the nonsense about updating it every time we enter a CPU could just
go away completely.


--=-+zEII74NtADjQ1WcGTb7
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDYwNjEwNTIz
M1owLwYJKoZIhvcNAQkEMSIEIEhVSloFuhqMBmE9MWMnRL+4glXcavjBsj6htTNioZ48MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAD2spFgvCf31F
C1uDR0BxwsoCE8WWD65unLAZn1GMby4630Yrry6rafto1Wg7+RLrqgV1fzMYICLpfPSJQjhOny+v
K2C8ySckNmhkJnxRMQ5TlJxZt1nRqXtcRYRI58+Q0EgDqCVpmUumYy4/kn6c3pnS2zC0bOqWh3f/
24c+NmInRr2zAnghE54ohxiQlUhqlM5XjZnot/VGeLeJ2Obzm0ULz4MD+nasaHlXPODBE9ourWdy
2DDHv9SAmrKJENz1+Hnqfq7hTfYiLdDfXJlTnrGXbgldFy9mv8qp65JhSyP+bmWbcTjposWld74Z
YaoDme7wOF+bXraVmTDQ9fKmCYdTuPTwbGOyL27w1bBsIXG0n550XANkQSDr936+Vmt3GZCcZ+i9
BSIGCkJExetIEo4AdTIkTtrmJppr/5aRSzwSihp6hu+BaKE4pdpSSJcv5AJSBg0L59kXRLZDUZNH
dX21IFjahVLB9f+6g86puYeNVuYo+YojXCzk7W3r1DRztRD4U4c8c7LKZhjCdqJhlszRANV1b34u
fGJh4Gf36lg2+9h03GXeG83sA2uR1fdlEkCE+sFdqg8yqMDcp8dsxTBb6DhXpTtPhF/2MIjBa6Xq
md+jy/QnNmI4SL8Wh59o1ukoeL2lIGQ/TuHS07hT6K8mJejoOVVRLrPzccs5QKEAAAAAAAA=


--=-+zEII74NtADjQ1WcGTb7--

