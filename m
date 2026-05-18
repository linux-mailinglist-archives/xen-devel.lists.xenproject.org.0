Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK8jHbnSCmo78gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:50:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB55691CB
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311701.1581834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOtf5-0000ga-Id; Mon, 18 May 2026 08:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311701.1581834; Mon, 18 May 2026 08:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOtf5-0000eC-Ft; Mon, 18 May 2026 08:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1311701;
 Mon, 18 May 2026 08:49:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+b63a902a6511c8cff3bf+8303+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wOtf3-0000e0-3z
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:49:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOtf2-00HRTB-0q; Mon, 18 May 2026 10:49:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+b63a902a6511c8cff3bf+8303+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0ad289-2eae-0a2a0a5409dd-0a2a45078f28-4
 for <multiple-recipients>; Mon, 18 May 2026 10:49:15 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+b63a902a6511c8cff3bf+8303+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0ad288-229c-0a2a45070019-5a9b3222de68-3
 for <multiple-recipients>; Mon, 18 May 2026 10:49:12 +0200
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wOtej-00000004XhK-32Yc; Mon, 18 May 2026 08:48:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g1+eVz8k9W+ci4EcKfxUg7T4Q5pV1mWJW3UUNSLBkTE=; b=OKRaAom10YDl6l9nhetetvzXGk
	UAyRyLCYa3RV3coaFntWB6FvzbaNUq1VEr+HMIEHITv0/ixgYmORJn2Vm/ONJYtS0cidesb6jsqGT
	O7d4+9ujI7VaRzqQsARrrr7B/q5PiZ2D+5kUP4Evay4MKItS+WQaqM4o+jZtzT/w0x9HErlzQY6V2
	z1uE/nSsmPdEpg58I1CY4+4l/LoomUOEUv+q0+P1wmUdk8jSq8dUAfg2VFG0IwDOl1e4DcUEh7Zco
	IQAnQTe2UcariMDSpLtgiI9Ujf2z9ctjsQzxo9LYWq8mcETml5cKdgrf8cQ61ZoOia4KpKkH9Pimj
	uqHORrgg==;
Message-ID: <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
Subject: Re: [PATCH v4 04/30] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
From: David Woodhouse <dwmw2@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Vitaly Kuznetsov
 <vkuznets@redhat.com>,  x86@kernel.org, Marc Zyngier <maz@kernel.org>,
 Juergen Gross <jgross@suse.com>,  Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, Jonathan Cameron
 <jic23@kernel.org>,  Sascha Bischoff <Sascha.Bischoff@arm.com>, Jack
 Allister <jalliste@amazon.com>, Joey Gouly <joey.gouly@arm.com>, 
 joe.jin@oracle.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  xen-devel@lists.xenproject.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 18 May 2026 09:48:56 +0100
In-Reply-To: <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
	 <20260509224824.3264567-5-dwmw2@infradead.org>
	 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-PC39DHWiBkFfVKw6GO8r"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1779094154-09364C48-CAC50AD7/0/0
X-purgate-type: clean
X-purgate-size: 13934
X-Rspamd-Queue-Id: 70DB55691CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.49 / 15.00];
	SIGNED_SMIME(-2.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dongli.zhang@oracle.com,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--=-PC39DHWiBkFfVKw6GO8r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-05-18 at 00:52 -0700, Dongli Zhang wrote:
> On 5/9/26 3:46 PM, David Woodhouse wrote:

Huh, I didn't write that then; it isn't September yet. Did you mean
2026-05-09? We aren't all in the US...=20

Strictly speaking, you just misattributed a quote of mine, which is
very poor form :)

What mailer are you using? Can it be fixed?

> > From: Jack Allister <jalliste@amazon.com>
> >=20
> > Where kvm->arch.use_master_clock is false (because the host TSC is
> > unreliable, or the guest TSCs are configured strangely), the KVM clock
> > is *not* defined as a function of the guest TSC so KVM_GET_CLOCK_GUEST
> > returns an error. In this case, as documented, userspace shall use the
> > legacy KVM_GET_CLOCK ioctl. The loss of precision is acceptable in this
>=20
> The description here confused me a little. It sounds like userspace shoul=
d call
> KVM_SET_CLOCK if KVM_SET_CLOCK_GUEST fails. However, I assume it actually=
 means
> that userspace should do nothing extra if KVM_SET_CLOCK_GUEST fails, and =
simply
> rely on the prior KVM_SET_CLOCK and KVM_VCPU_TSC_OFFSET workflow describe=
d in
> patch 07. Is that correct?

Yes. If KVM_SET_CLOCK_GUEST doesn't work (which might be because
KVM_GET_CLOCK_GUEST didn't work so userspace doesn't have the data in
the first place, or because the actual ioctl returns failure), then
userspace should rely on the old method using KVM_SET_CLOCK imprecisely
instead. That includes on a migration from an older kernel that *lacks*
KVM_GET_CLOCK_GUEST, of course.

I don't think it strictly matters whether userspace does KVM_SET_CLOCK
first, then *tries* KVM_SET_CLOCK_GUEST, or whether it tries
KVM_SET_CLOCK_GUEST and then only calls KVM_SET_CLOCK on failure? I'd
probably be inclined not to use KVM_SET_CLOCK at all unless it is known
to be needed?

> > +4.145 KVM_GET_CLOCK_GUEST
> > +----------------------------
> > +
> > +:Capability: none
> > +:Architectures: x86_64
> > +:Type: vcpu ioctl
> > +:Parameters: struct pvclock_vcpu_time_info (out)
> > +:Returns: 0 on success, <0 on error
> > +
> > +Retrieves the current time information structure used for KVM/PV clock=
s,
> > +in precisely the form advertised to the guest vCPU, which gives parame=
ters
> > +for a direct conversion from a guest TSC value to nanoseconds.
> > +
> > +When the KVM clock is not in "master clock" mode, for example because =
the
> > +host TSC is unreliable or the guest TSCs are oddly configured, the KVM=
 clock
> > +is actually defined by the host CLOCK_MONOTONIC_RAW instead of the gue=
st TSC.
> > +In this case, the KVM_GET_CLOCK_GUEST ioctl returns -EINVAL.
> > +
> > +4.146 KVM_SET_CLOCK_GUEST
> > +----------------------------
> > +
> > +:Capability: none
>=20
> Do we need a KVM_CHECK_EXTENSION capability for this? If userspace wants =
to
> support the new API, should it detect availability via KVM_CHECK_EXTENSIO=
N, or
> simply try the ioctl and handle failure?

That might be conventional, I suppose. But I suspect Jack's thinking
was that userspace is going to have to *try* it anyway, and still might
have to fall back to what KVM_SET_CLOCK can manage, so userspace
probably wouldn't even bother to check that capability; it doesn't
matter.

Since then, we've added some more attributes in this series though, and
it probably is worth adding a cap which advertises them *all*?
Something like KVM_CAP_CLOCK_PRECISION_API?

> > +#ifdef CONFIG_X86_64
> > +static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __u=
ser *argp)
> > +{
> > +	struct pvclock_vcpu_time_info hv_clock =3D {};
> > +	struct kvm_vcpu_arch *vcpu =3D &v->arch;
> > +	struct kvm_arch *ka =3D &v->kvm->arch;
> > +	unsigned int seq;
> > +
> > +	/*
> > +	 * If KVM_REQ_CLOCK_UPDATE is already pending, or if the pvclock
> > +	 * has never been generated at all, call kvm_guest_time_update().
> > +	 */
> > +	if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {
>=20
> This was flagged by AI, and I am still checking whether it is a real issu=
e.
>=20
> What happens if KVM_REQ_MASTERCLOCK_UPDATE and KVM_REQ_CLOCK_UPDATE are b=
oth
> pending?
>=20
> From my perspective, I am also curious how we should reason about this in=
 other
> scenarios in the future. Specifically, when do we need to process
> KVM_REQ_MASTERCLOCK_UPDATE before KVM_REQ_CLOCK_UPDATE, and when is it
> acceptable not to? I noticed that kvm_cpuid() already processes only
> KVM_REQ_CLOCK_UPDATE.

The way I've been thinking about it =E2=80=94 and I'm only two cups of coff=
ee
into Monday so take those words literally and don't think of them as
British understatement of something I believe is absolute truth =E2=80=94 i=
s
that MASTERCLOCK_UPDATE is updating the actual clock for the whole VM,
while CLOCK_UPDATE is about *putting* that information into the per-
vCPU pvclock structures.

So after a MASTERCLOCK_UPDATE, we need to do a CLOCK_UPDATE on all
vCPUs to disseminate the result. Which means that if CLOCK_UPDATE is
already pending before a MASTERCLOCK_UPDATE, it's probably redundant
and might as well be cleared because it's only going to get set *again*
in kvm_end_pvclock_update()?=20


> > +	/*
> > +	 * Calculate the guest TSC at the new reference point, and the
> > +	 * corresponding KVM clock value according to user_hv_clock.
> > +	 * Adjust kvmclock_offset so both definitions agree.
> > +	 */
> > +	guest_tsc =3D kvm_read_l1_tsc(v, ka->master_cycle_now);
> > +	user_clk_ns =3D __pvclock_read_cycles(&user_hv_clock, guest_tsc);
> > +	ka->kvmclock_offset =3D user_clk_ns - ka->master_kernel_ns;
>=20
> I used to explore adjusting ka->kvmclock_offset in KVM_SET_CLOCK based on=
 the
> old hv_clock and the new hv_clock long time ago. At that time, my concern=
 was
> what would happen if userspace provided bogus values. Theoretically, this=
 is
> possible with any ioctl. My concern may be unnecessary.
>=20
> Would it be helpful to validate that the delta is within a reasonable ran=
ge,
> e.g. that the drift can never be more than five minutes (forward or backw=
ard)?

Setting confidential guests aside, which have their own way of trusting
the TSC and should never even *consider* using kvmclock, surely this is
supposed to be *entirely* under the control of the VMM? The kernel has
no business deciding what is 'bogus'?

If a guest has been running for months on a previous host and is
migrated to a new host, don't we expect that the KVM clock of the new
VM on the new host is tweaked from its default near-zero after
creation, to some large amount?


--=-PC39DHWiBkFfVKw6GO8r
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDUxODA4NDg1
NlowLwYJKoZIhvcNAQkEMSIEIB6QrOyGWiQGu0gwZYzVi/UTjfzXQXvYkSLfXocOC1k8MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAIuYCC1JFBO6F
VHKhI3jauVlAXJD+QyZevE+gU11/CtMaOJuOhulaIJc3fm0A+R6vDht0Dp2Uoa3v04q2q0TGHl+c
AwHsgX1aSCib7RJoPvNeDyGIrByYl4jVMV7CKXSHs/eoHPUHRzQZqQsW3PqHE9n2kZGUCDGjtvJf
UnKt51y9uQQEFt4O3UlxMJmFFzY6Ah+02IMor6xamxxgHrE6jyIO9oLzfnArXbgtY42iIyJFzC/w
bu80URv0TgJvttgg8bz7NDSrlYX9rzkvtgDGsGghP7NjwtgCueOVcwb3GP2KVt6M+lXwL6hgb5Py
jmNMkUhE1tWm/N9WSUgllnEVA/buC8pKKnFFr+4w+0CJFNkf2qvqnMMkv+fYLiUBvkcC2SzbrvCn
7e8J/bbhLB0+ull6V0FYWDbMEha3rBLiya8OcpTUBCVPBZ20l19kp+UnwMUo2gr5jlkGDfFvHtQW
N9h0xFlpCmYsB8IPEIG4oZCu9bBXDq8a0cGKydqIQV1xsAlXRKkYE4CBjFIdA2PU42i2zkI7ZcqA
qM7htyE7mK/b4o/i6u5T0jLKYsVFo5dO+v6pAs9JwWqRcGlg0W/hpsquU5eijb4GTZ4z6An7UDSd
hs2Frd9KxzpOWIm9zUvO0sODrHipNx2gqvmef7eghUx7/DGNIPiwc2AKXLD55t0AAAAAAAA=


--=-PC39DHWiBkFfVKw6GO8r--

