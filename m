Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHEaOH0WDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:51:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C665796DB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312519.1582618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFEF-0001xx-8u; Tue, 19 May 2026 07:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312519.1582618; Tue, 19 May 2026 07:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFEF-0001wV-52; Tue, 19 May 2026 07:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1312519;
 Tue, 19 May 2026 07:51:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+4b7c99f23599b32cd9f8+8304+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wPFEC-0001wP-GM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:51:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPFEB-005j5g-SU; Tue, 19 May 2026 09:50:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+4b7c99f23599b32cd9f8+8304+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0c1662-bab6-0a2a0a5309dd-0a2a450281a2-6
 for <multiple-recipients>; Tue, 19 May 2026 09:50:59 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+4b7c99f23599b32cd9f8+8304+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0c1661-af86-0a2a45020019-5a9b3222b55e-3
 for <multiple-recipients>; Tue, 19 May 2026 09:50:58 +0200
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wPFDt-00000005dE2-2vSi; Tue, 19 May 2026 07:50:42 +0000
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
	bh=2I20zy7pvCfvCrda6zbAyknDlpOfiA0ggmXaaJwhbRE=; b=jYbCwqTSVywpKDxG1FmH+Adqcw
	w6GggxLY7YanY4TEBm+Mt2T5jofi8uAT6c/QiFEUhFTx5WmWVieLRrSkByHHxgXoMvQZhJUvQcDsT
	jcpH9HKlG5fEM84xv6ESE14tZmaIutcWzIQzdkHebkfzsOpq7itycL43tvT31y/jjLwExK2/76GsU
	6+vD23HY1HYOnL36nmVxMRB0C7sOTU/UQercN4uAfZS4OFLhugLw2VxKLfVV1zH22Zr4PN4RLFQk8
	3dqSAFuGkZgs0KHIMNz3sEIkO3XlyRFupIo0FQajd4g+cYdZne+LOpbR8rtF1lK/FMwO6dvrbRV/v
	/1QQEAYQ==;
Message-ID: <b9980333f3a310bf05e170e79c40cb2f46485caf.camel@infradead.org>
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
Date: Tue, 19 May 2026 08:50:39 +0100
In-Reply-To: <935312be-9a86-49fd-8bb4-2c998a68e2df@oracle.com>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
	 <20260509224824.3264567-5-dwmw2@infradead.org>
	 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
	 <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
	 <935312be-9a86-49fd-8bb4-2c998a68e2df@oracle.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-boRirr429Da0AX+mV+GN"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-720697/1779177058-8077A161-3EE05FE6/0/0
X-purgate-type: clean
X-purgate-size: 17600
X-Spamd-Result: default: False [-1.49 / 15.00];
	SIGNED_SMIME(-2.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dongli.zhang@oracle.com,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,infradead.org:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 37C665796DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-boRirr429Da0AX+mV+GN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-05-18 at 17:57 -0700, Dongli Zhang wrote:
> On 2026-05-18 1:48 AM, David Woodhouse wrote:
> > ...
>=20
> I have fixed the Thunderbird configuration. Does it look better to you?

The date is certainly better, thank you. But although I *was* up late
that night frowning at clocks, I didn't think I was up *quite* as late
(almost 2am) as it suggests.

But I suspect that getting *that* right is beyond the limit of
Thunderbird's configurability.

Thanks :)

> I really appreciate guidelines like the ones below.
>=20
> https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org
>=20
> Assuming I am a user of the new API, I feel confused about whether the go=
al is
> to replace KVM_SET_CLOCK with KVM_SET_CLOCK_GUEST, or whether the latter =
is
> meant to supplement the former.

The issue is that KVM_SET_CLOCK_GUEST can only be used in 'masterclock'
mode, when the TSC is reliable and the guest TSCs are all in sync.

Which ought to be *all* of the time, on modern hardware and sane
configurations. And in this series, I don't even let the *guest* screw
that over by setting different TSC offsets on different vCPUs any more
(we stay in masterclock mode in that case now). But the VMM can cause
its guest to come out of masterclock mode, by setting different TSC
*speeds* on different vCPUs.

So there remain some pathological cases where the kvmclock actually
still has a justification to exist, and those are the cases where it
needs to be set in its own right as a function of host time
(KVM_SET_CLOCK), not purely as a function of the guest TSC
(KVM_SET_CLOCK_GUEST).


>=20
> If we are going to use KVM_SET_CLOCK_GUEST when KVM_SET_CLOCK is not need=
ed, I
> would appreciate it if the API could carry more data in addition to struc=
t
> pvclock_vcpu_time_info.
>=20
> +#define KVM_SET_CLOCK_GUEST=C2=A0=C2=A0=C2=A0 _IOW(KVMIO, 0xd6, struct p=
vclock_vcpu_time_info)
> +#define KVM_GET_CLOCK_GUEST=C2=A0=C2=A0=C2=A0 _IOR(KVMIO, 0xd7, struct p=
vclock_vcpu_time_info)
>=20
>=20
> In the future, if we need to carry additional data, we could simply reuse=
 the
> padding fields instead of introducing another KVM_SET_CLOCK_GUEST2.
>=20
> The following is an example of how additional data could be carried.
>=20
> KVM: x86: Report host tsc and realtime values in KVM_GET_CLOCK
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc68dc1b577eabd5605c6c7c08f3e07ae18d30d5d

I'm not very keen on the way that KVM_[GS]ET_CLOCK threw extra time
references in over the years without any of them ever actually making
*sense*, which makes me reluctant.=C2=A0

KVM_[GS]ET_CLOCK_GUEST on the other hand does *one* thing: it exports
the relationship between the guest TSC and kvmclock. We don't *need* to
litter it with time values from other clocks willy-nilly.

But yes, you are right in principle.

And in fact, the other part of this conversation has really drawn my
attention to the ugliness of the "try KVM_SET_CLOCK_GUEST and if that
doesn't take then fall back to KVM_SET_CLOCK" which we are pushing onto
userspace.

Yes, I covered it in the guidelines: but we should always abide by the
mantra, "if it *needs* documenting, fix it first".

So perhaps we could build a variant which does both at once. It
provides the guest clock as a function of guest TSC for the sane
masterclock case, but *also* includes CLOCK_TAI at the same moment, in
case it needs to fall back to that.

Although... the actual reference time part of the existing pvclock
might be significantly in the past, especially with all the
MASTERCLOCK_UPDATE elimination that we've been doing. And we'd have to
regenerate it to get a simultaneous realtime reading, wouldn't we?
> >=20

> > > Do we need a KVM_CHECK_EXTENSION capability for this? If userspace wa=
nts to
> > > support the new API, should it detect availability via KVM_CHECK_EXTE=
NSION, or
> > > simply try the ioctl and handle failure?
> >=20
> > That might be conventional, I suppose. But I suspect Jack's thinking
> > was that userspace is going to have to *try* it anyway, and still might
> > have to fall back to what KVM_SET_CLOCK can manage, so userspace
> > probably wouldn't even bother to check that capability; it doesn't
> > matter.
> >=20
> > Since then, we've added some more attributes in this series though, and
> > it probably is worth adding a cap which advertises them *all*?
> > Something like KVM_CAP_CLOCK_PRECISION_API?
>=20
> From an API user's perspective, userspace may need to distinguish between=
 an API
> failure and the API not being available.

That's -ENOTTY vs. -EINVAL for the ioctl, isn't it? And isn't there
something similarly unambiguous for the attributes?

But I have no objection to adding a capability. The lack of it was more
oversight than intent.


> > >=20
> > > From my perspective, I am also curious how we should reason about thi=
s in other
> > > scenarios in the future. Specifically, when do we need to process
> > > KVM_REQ_MASTERCLOCK_UPDATE before KVM_REQ_CLOCK_UPDATE, and when is i=
t
> > > acceptable not to? I noticed that kvm_cpuid() already processes only
> > > KVM_REQ_CLOCK_UPDATE.
> >=20
> > The way I've been thinking about it =E2=80=94 and I'm only two cups of =
coffee
> > into Monday so take those words literally and don't think of them as
> > British understatement of something I believe is absolute truth =E2=80=
=94 is
> > that MASTERCLOCK_UPDATE is updating the actual clock for the whole VM,
> > while CLOCK_UPDATE is about *putting* that information into the per-
> > vCPU pvclock structures.
> >=20
> > So after a MASTERCLOCK_UPDATE, we need to do a CLOCK_UPDATE on all
> > vCPUs to disseminate the result. Which means that if CLOCK_UPDATE is
> > already pending before a MASTERCLOCK_UPDATE, it's probably redundant
> > and might as well be cleared because it's only going to get set *again*
> > in kvm_end_pvclock_update()?=20
>=20
> Another scenario is when only MASTERCLOCK_UPDATE is pending and there is =
no
> pending CLOCK_UPDATE.
>=20
> In this scenario, is it fine to skip processing MASTERCLOCK_UPDATE before=
 saving
> pvclock_vcpu_time_info?
>=20

I'm not sure I understand that scenario.=20

MASTERCLOCK_UPDATE means we have to actually recalculate the master
clock (which really *should* be rare, now!). And then any time we do
that, we also have to do a CLOCK_UPDATE on every vCPU to disseminate
the new information. Which is why kvm_end_pvclock_update() does exactly
that.

So your "MASTERCLOCK_UPDATE is pending and there is no pending
CLOCK_UPDATE" doesn't make much sense to me. If MASTERCLOCK_UPDATE is
pending, then there *will* be a CLOCK_UPDATE pending.


> > >=20
> > > Would it be helpful to validate that the delta is within a reasonable=
 range,
> > > e.g. that the drift can never be more than five minutes (forward or b=
ackward)?
> >=20
> > If a guest has been running for months on a previous host and is
> > migrated to a new host, don't we expect that the KVM clock of the new
> > VM on the new host is tweaked from its default near-zero after
> > creation, to some large amount?
> >=20
>=20
> Regarding live migration, my own investigation does not show a proportion=
al
> relationship between VM uptime and the amount of drift.

You're comparing the VM on the source host, with the VM on the
destination post-migration.

Perhaps I misunderstood, but I thought your suggested validation of a
'reasonable range' would also apply when adjusting the kvmclock of the
nascent VM on the destination host, from "newly created" to "has been
running for months" while migrating the state of the actual guest onto
a clean new slate.

> Just taking QEMU + KVM as an example: suppose TSC scaling is inactive, th=
e
> amount of drift does not depend on how long the VM has been running befor=
e live
> migration.
>=20
> Instead, it depends on the delta between when we call MSR_IA32_TSC and
> KVM_GET_CLOCK, and between MSR_IA32_TSC and KVM_SET_CLOCK.
>=20
> The guest TSC stops at P1 and resumes at P3.
> The kvmclock stops at P2 and resumes at P4.
>=20
> We expect P1 =3D=3D P2 and P3 =3D=3D P4.
>=20
> On source host.
>=20
> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3D0 =3D=3D=3D> P1

Here's where it all starts going wrong. Line 1.

Any API which lets you get a single time value in isolation, and thus
which is already out of date by the time the system call even returns,
is fundamentally unsuitable for migration.

> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3D1
> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3D2
> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3D3
> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3D4
> ... ...
> - kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3DN
> - KVM_GET_CLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D> P2
>=20
> On target host.
>=20
> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3D1 =3D=3D=3D> P3
> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3D2

At this point, the nasty hack in the kernel steps in, realises that the
value you're setting on vCPU 2 is within a second or so of the value
you had previously set on vCPU 1, and snaps it back to be precisely the
same. To work around the fundamental brokenness of this method.

> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3D3
> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3D4
> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3D5
> ... ...
> - kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3DN
> - KVM_SET_CLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D> P4
>=20
>=20
> Here is my equiation to predict the drift.

I'm sure you're right, but I didn't get that far when looking at this.
I'd already thrown up in my mouth a little bit by line one.

Here's my equation to predict the drift of a live update done correctly
on the same host using the method I've now put in the documentation:

0.

:)

--=-boRirr429Da0AX+mV+GN
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDUxOTA3NTAz
OVowLwYJKoZIhvcNAQkEMSIEID4VyOau5HDbTuenIzpyAYYNdwfCXft9bKPuz9k0Xjn2MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAS1JbDhNwweIc
QuYqwRAR/yS3GsFNwrGARwzxspR3bF3bmAUiOaCXA3/sfTImbngl22ObTT9hBrzX04xEO1F/kWLu
jk0gL1TgngSCBZyQLrwahUBNUjauE3SvCPY6Hj2dsL3Me9qbi9s3aGCmB46zEZhWdYDZ4HUMHPKQ
3TISGmbnsKoW4pEXXGjHEaTXiOU+253QfWEzAo5ftaXKCG0KUIbDPTapzXmiv9do6m8xULhFqLRT
dYfwAelKWA95DmxdS3Etek4fwUH1DOtrYvoMOPdxl+yOB81a5PZ07YvbDXF3oWN4wOBTqII6tJ/2
qerAIlNL3DvUsaSvyq7D+seztNNzZAZCpZmBQCFd/n77JS7C2SMqgcBoh0QxBGg8m/GlI75PdNPf
rXuTxUprfyKPRoWsbQ60WTX0yBKuTxdM31tSCL3VJ1mD49L3nGQFdBqljHmluTFAAZnje2bsDYYb
brqKFb/YL9AIYtWGlyYHXja9jGLK/h1xa6vEVpbhMH8t6MB9GZ90n1mJTt86Oh/s/o+/BHQW2NBB
mnxknQoFRTzV1MLWNt5LcT/G99QT8L7UEBpHsxlA5KtmWub93cFUbN/TJaKLU4wr/ggKq0qwHMAf
xcRJU3086EBsZPLghhtuP/7D5/CkU9W8dvobyuHsQfxlk5u+K312Seym8N2j+jMAAAAAAAA=


--=-boRirr429Da0AX+mV+GN--

