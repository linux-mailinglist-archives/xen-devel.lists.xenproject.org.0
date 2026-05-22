Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OxNE27nEGqOfAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 01:31:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82485BB82B
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 01:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317421.1586470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQZKO-0008Na-46; Fri, 22 May 2026 23:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317421.1586470; Fri, 22 May 2026 23:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQZKO-0008M1-1X; Fri, 22 May 2026 23:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1317421;
 Fri, 22 May 2026 23:30:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+79b2e557e57d1602ccb1+8307+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wQZKL-0008Lv-76
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 23:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQZKK-0083x4-6g; Sat, 23 May 2026 01:30:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+79b2e557e57d1602ccb1+8307+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a10e721-bab6-0a2a0a5309dd-0a2a4508b616-10
 for <multiple-recipients>; Sat, 23 May 2026 01:30:48 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+79b2e557e57d1602ccb1+8307+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a10e727-63b5-0a2a45080019-5a9b5cc7d0d8-3
 for <multiple-recipients>; Sat, 23 May 2026 01:30:47 +0200
Received: from [2001:8b0:10b:5:5975:12af:289:68ce] (helo=ehlo.thunderbird.net)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat
 Linux)) id 1wQZK5-00000005akR-0Dzw; Fri, 22 May 2026 23:30:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i6vHdQ5oldCpZlhFDjFmxL304IdV4wnWfln87BM7NM0=; b=OUorWJ8tXcW09mDeCVBA/b8LZW
	hpfXFu+EBYP9IjRj2PiIkEVGfSyH9LRxmdtygDflODeVVijCU7fk7dVBnp1ZLjSeCRFp5cIz2lYZ5
	i0K5bRWjlXK8pJGE+1wWAdEN7ptP8dQ/E7wnmXXsU5b4IldjDJg1OuxzNRa5Dv1ECgoPWc1bQZrYB
	7Qqsy8e6x1CWJOdocrh1neuN+vKOiZ9WJRS268HMjqh6pNxc4N1jCsaKs1K/il0+geGYobFEr/J9E
	zno9xHOsMAknlHjYnXKJQo/D+frfDBzhKu8XKZ8zdUrzZO9dHhegJdo6KdiPhByzmwkvgRjFtEeM+
	BfqIJBCA==;
Date: Sat, 23 May 2026 00:30:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Sascha Bischoff <Sascha.Bischoff@arm.com>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_27/30=5D_KVM=3A_x86=3A_Add_K?=
 =?US-ASCII?Q?VM=5FVCPU=5FTSC=5FEFFECTIVE=5FFREQ_attribute?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ahDO58dKuPt-lj_J@google.com>
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org> <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org> <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org> <ahBQ7mXNaTtouT3C@google.com> <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org> <ahCQluJj59uWlDAF@google.com> <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org> <ahDO58dKuPt-lj_J@google.com>
Message-ID: <277F54CD-9F17-4B67-B575-3A8DDEA09796@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1779492647-B7D7BDB1-DD550F35/0/0
X-purgate-type: clean
X-purgate-size: 716
X-Spamd-Result: default: False [1.81 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[infradead.org:-];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.358];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E82485BB82B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22 May 2026 22:47:19 BST, Sean Christopherson <seanjc@google=2Ecom> wrot=
e:
>On Fri, May 22, 2026, David Woodhouse wrote:
>> On Fri, 2026-05-22 at 10:21 -0700, Sean Christopherson wrote:
>> >=20
>> > I'll send a standalone patch, along with a selftest tweak to verify t=
he fix=2E
>> > It's technically a fix and won't generate any conflicts, no reason to=
 delay it=2E
>>=20
>> Are you suggesting the other 30 should be delayed? :P
>
>LOL, just acknowledging that it'll take me a minute to page all of that c=
ode in=2E

Hey, it took me more than a year to page it back in :)

I am only teasing; no rush=2E And I will post v5 with some accumulated twe=
aks (from my kvmclock5 branch) soon=2E

