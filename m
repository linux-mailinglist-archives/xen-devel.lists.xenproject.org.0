Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AISgNennDGoopwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 00:44:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F9585CBF
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 00:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313438.1583569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPTAB-0000pi-Fq; Tue, 19 May 2026 22:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313438.1583569; Tue, 19 May 2026 22:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPTAB-0000mq-Cj; Tue, 19 May 2026 22:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1313438;
 Tue, 19 May 2026 22:43:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+4b7c99f23599b32cd9f8+8304+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wPTA7-0000mk-Ie
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 22:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPTA5-00DdEQ-J3; Wed, 20 May 2026 00:43:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+4b7c99f23599b32cd9f8+8304+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0ce794-bab6-0a2a0a5309dd-0a2a450a8fda-12
 for <multiple-recipients>; Wed, 20 May 2026 00:43:41 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+4b7c99f23599b32cd9f8+8304+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a0ce79c-56b3-0a2a450a0019-5a9b3222885c-3
 for <multiple-recipients>; Wed, 20 May 2026 00:43:40 +0200
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wPT9u-00000006Ogz-2yWk; Tue, 19 May 2026 22:43:31 +0000
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
	bh=+WCIzdWes3UVgHCi8CWN6cps7bIrLmIXX90dePdofcg=; b=XZTxoahJXwWUNgdkc2NGwg+w0C
	9grBLzjCxRxZt/Dw4831UwgeQh7kB3FwYkzBODyrZZp7PEziYcE75tP5JxV+4EBoEAHSXKW0Xt71O
	1XdfN+I84K4HE7TOw6J9hgOsTuSlKHvJ99s4Z+JRpgVUp+lkdBYcFvKFSCboAzbeWS5iRLML9Q5rA
	sGb4WmwPjp/AGqYvnDSXWbIGoVL0HfAkTeMAR8b17QeFvtAUHEhd4rOL2Cjo3r2+R9VbqG0v6QEJC
	ijG6gU2ZgHHadxvqka+o/fMHrNc668yBdBd/uv1R02ESlxiNhvIT7BuTW6sPpFE0HexGKeLmNw8T1
	EqsW6aaQ==;
Message-ID: <32ca0a8da4bfb1e92013a7f75e0ff7541ebcd6a6.camel@infradead.org>
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
Date: Tue, 19 May 2026 23:43:29 +0100
In-Reply-To: <aa68ed10-15da-4368-a986-6864843a3c44@oracle.com>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
	 <20260509224824.3264567-5-dwmw2@infradead.org>
	 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
	 <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
	 <935312be-9a86-49fd-8bb4-2c998a68e2df@oracle.com>
	 <b9980333f3a310bf05e170e79c40cb2f46485caf.camel@infradead.org>
	 <aa68ed10-15da-4368-a986-6864843a3c44@oracle.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-r8BxiHhSG54aOSyFfagN"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1779230621-72F718B7-D52F7678/0/0
X-purgate-type: clean
X-purgate-size: 14660
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 299F9585CBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-r8BxiHhSG54aOSyFfagN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 14:23 -0700, Dongli Zhang wrote:
> I think I now understand why I feel like I am always asking weird questio=
ns. I
> have been thinking about how to account for downtime, so I see
> KVM_SET_CLOCK_GUEST as a supplement to KVM_SET_CLOCK.

I do not believe in "downtime". There is no such thing.
There is only "steal time".

A CPU may be off in the weeds =E2=80=94 a vCPU suffering steal time, or eve=
n a
pCPU in SMM which is effectively the same thing =E2=80=94 but time doesn't
stop, and neither does the TSC.

> Suppose we are not going to account for any downtime. With KVM_SET_CLOCK_=
GUEST:
>=20
> 1. The masterclock is active, so gTSC is synchronized across vCPUs. All v=
CPUs
> share the same kvm_read_l1_tsc(v, ka->master_cycle_now).

Strictly, by the time we get to the end of my series, masterclock is
active *because* all the vCPUs are running at the same TSC rate (even
if the guest set them to different offsets). But OK.

> 2. Migrate the gTSC to the target VM however people want (either ablolute=
 value
> or offset value). (Optional) Account for downtime in gTSC however people =
want,
> even with KVM_SET_CLOCK/KVM_CLOCK_REALTIME, which you may not like.
>
> 3. Adjust kvm-clock (that is, ka->kvmclock_offset) with KVM_SET_CLOCK_GUE=
ST.
>=20
> That is why you think KVM_SET_CLOCK is no longer required if we have
> KVM_SET_CLOCK_GUEST. While I think KVM_SET_CLOCK is required because of
> KVM_CLOCK_REALTIME.

If I recall correctly what we described in
https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org/
I don't think we actually needed KVM_SET_CLOCK at all, did we?

We *abuse* KVM_GET_CLOCK to give us a tuple of {realtime, host TSC}
because there's actually no other way for *userspace* to get that. We
don't actually *care* about the KVM clock part.

We use the {realtime, host TSC} pair to reconstitute the guest TSC
values to correctly reflect the passing of time while the guest was in
the ether.

> It it isn't required to account any downtime for gTSC or if there is anot=
her way
> to do so, only KVM_SET_CLOCK_GUEST is enough.

Right. If you only want the guest to come back with the *same* values
in its TSC as before the migration, as if the TSC was *paused* during
the migration, then you can just restore those values and use
KVM_SET_CLOCK_GUEST. Assuming you are on modern hardware and have set
all vCPUs to the same rate (and are using this series so the *guest*
can't break masterclock for you, and you can trust the
KVM_SET_CLOCK_GUEST will work).

> >=20
> > > Another scenario is when only MASTERCLOCK_UPDATE is pending and there=
 is no
> > > pending CLOCK_UPDATE.
> > >=20
> > > In this scenario, is it fine to skip processing MASTERCLOCK_UPDATE be=
fore saving
> > > pvclock_vcpu_time_info?
> > >=20
> >=20
> > I'm not sure I understand that scenario.=20
> >=20
> > MASTERCLOCK_UPDATE means we have to actually recalculate the master
> > clock (which really *should* be rare, now!). And then any time we do
> > that, we also have to do a CLOCK_UPDATE on every vCPU to disseminate
> > the new information. Which is why kvm_end_pvclock_update() does exactly
> > that.
> >=20
> > So your "MASTERCLOCK_UPDATE is pending and there is no pending
> > CLOCK_UPDATE" doesn't make much sense to me. If MASTERCLOCK_UPDATE is
> > pending, then there *will* be a CLOCK_UPDATE pending.
>=20
> Suppose the VM is stopped and the master clock is active.

I don't know what it means for a VM to be 'stopped'. Do you mean that
all vCPUs happen to be experiencing steal time at the present moment?

> Suddenly, we change the host clocksource from TSC to HPET. pvclock_gtod_n=
otify()
> may call pvclock_gtod_update_fn() to set a pending KVM_REQ_MASTERCLOCK_UP=
DATE
> for all vCPUs. Unless the pending KVM_REQ_MASTERCLOCK_UPDATE is processed=
 by
> kvm_update_masterclock(), kvm_end_pvclock_update() will not set a pending
> KVM_REQ_CLOCK_UPDATE.

You say 'Unless'... do you mean 'Until'?

> Therefore, this is a scenario in which only KVM_REQ_MASTERCLOCK_UPDATE is=
 pending.
>=20
> I do not think this scenario is important. I am just curious about the ex=
pected
> way to implement similar code in the future :)

I think that's working correctly. Until the master clock has *actually*
been updated, there's no point in setting CLOCK_UPDATE for each vCPU to
disseminate the new information to its own pvclock?



> >=20
> >=20
> > > > >=20
> > > > > Would it be helpful to validate that the delta is within a reason=
able range,
> > > > > e.g. that the drift can never be more than five minutes (forward =
or backward)?
> > > >=20
> > > > If a guest has been running for months on a previous host and is
> > > > migrated to a new host, don't we expect that the KVM clock of the n=
ew
> > > > VM on the new host is tweaked from its default near-zero after
> > > > creation, to some large amount?
> > > >=20
> > >=20
> > > Regarding live migration, my own investigation does not show a propor=
tional
> > > relationship between VM uptime and the amount of drift.
> >=20
> > You're comparing the VM on the source host, with the VM on the
> > destination post-migration.
>=20
> Apologies for making it confusing. I was just trying to explain why I thi=
nk the
> kvm-clock drift will not be large.

Sure, but I don't care. If we have a sane API, the drift should be zero
:)

> We previously discussed the vCPU hotplug and kvm-clock drift issue. The l=
onger
> the time interval between two vCPU hotplug events, the larger the drift.
>=20
> For live migration (with QEMU), I provided the equation to show that the =
drift
> will not be large, because it is determined by something else rather than=
 by how
> long the VM has been running on the source server.
>=20
>=20
> For the previous vCPU hotplug and kvm-clock bug, if we add more vCPUs to =
a guest
> that has been running for three months, the drift will be relatively larg=
er.
>=20
> For QEMU live migration, migrating a guest VM that has been running on th=
e
> source host for *three months* versus one that has been running for *one =
day*
> will not cause much difference in kvm-clock drift.

Right.

> For the ideal live update case (on the same host), there may be no need t=
o
> adjust gTSC so that it keeps incrementing. In that case, KVM_SET_CLOCK_GU=
EST can
> be used to adjust kvm-clock based on gTSC.

Right. You restore the gTSC using its *offset* from the host TSC which
hasn't stopped counting on the same host. Then use KVM_SET_CLOCK_GUEST
to restore the kvmclock in terms of the gTSC. And you have an
absolutely cycle-perfect migration.

> For the live migration scenario, the current QEMU implementation not only=
 fails
> to account for downtime, but also has a drift issue. That is what I would=
 like
> to address in QEMU.

Again, restore the gTSC as accurately as possible. Probably by working
out for *yourself* the relationships of the source and destination host
TSCs to real time, and then reconstituting on the destination using TSC
offset just as for live migration.

And then use KVM_SET_CLOCK_GUEST too.

That's what I attempted to document in
https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org/
and should probably revive.

--=-r8BxiHhSG54aOSyFfagN
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDUxOTIyNDMy
OVowLwYJKoZIhvcNAQkEMSIEIGTvfr5wfeHz/LRotJrCHsL4izASUvFK0bew3Yy0ltj1MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAHpod2FTGRp3s
+iubDiwdcG6yaOTdLcBeMf4EYW4N1+Rt6Gck9iU5sVGP3pjXieU+mwW7lt+U+XalI+GvZqTE9cNr
nigUN/7qXrrLuS437UBhzJhkKtGJ/nAcmxNKoLH4y6ptsBA+AmWEGbhcw4HdSjAzWwHU1hpmkZWy
opAnjCHqlwswKjzdilciJX6xXiad4m2Tc3/MPxzIygybUazKxvdUYvPe9UmNy35fBKYWxBymxdmh
u+H+3V6ox/UzgU5Hd/uEZQ9P85r6Kq7sYJR8o6G6TZ9Vebc5KYuwhutMvBxAEcPD1OlCfdTbPl5I
LitD+Bu1nKdQE02aArTZhKnacUald05J8/pWbiYaoQBhPWJ7XU1KlTz5QscEjQ4EEAmmAqYiHgPg
stP9ABKr4g5kVi4xgubf83i1b+bBUiMRLVPq18aOHAGFHF7c7OEVW77h0nqM5KQsZ9OcDH7g7+8a
VHLYixTOAbSYJuAcO9Uctr28WNXcNevtYnTLhHIhzFHUV2jlGNxtNWXZJJrSno3C319MIv1iHfrU
PsPW4O90+2wVD+yu3h1pHhhEioBi75IS29XyKJDvRwVRc3UAC+kp7Gh1+lToWweYHMMjQL2EMxn6
e0EeV98Imp12ELJnHfYCcoqMebvBXYSNACKmkQ3RPN0DRVqsF3DA001gtCC4wSMAAAAAAAA=


--=-r8BxiHhSG54aOSyFfagN--

