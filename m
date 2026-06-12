Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTq6MwslLGrHMAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 17:26:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB72867A840
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 17:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=a7Lg0BK3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336816.1598593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY3lC-0008DH-OM; Fri, 12 Jun 2026 15:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336816.1598593; Fri, 12 Jun 2026 15:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY3lC-0008CC-L4; Fri, 12 Jun 2026 15:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1336816;
 Fri, 12 Jun 2026 15:25:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@swg.vates.tech>)
 id 1wY3lB-0008C1-MS
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 15:25:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY3lB-002bt7-3C
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 17:25:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@swg.vates.tech>)
 id 6a2c24da-bab6-0a2a0a5309dd-0a2a450ad11e-18
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 17:25:29 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@swg.vates.tech>)
 id 6a2c24e8-56b3-0a2a450a0019-b9ff1c128719-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 17:25:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebc701bfb000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 15:25:24 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6C9E28658E;
 Fri, 12 Jun 2026 17:17:31 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Vpw+mCX0aHIoAVGt1Kpz45VSL5bwFu8QnmjlQqsjias=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=a7Lg0BK3/yI+FJjJ2ch3LqomEg4wYH62jIBxgnthM6uMgPmq4h3JH9Iqi2uCpzBlhvyAt1ISZ
 5NPspGHgeVYWeOgdxxft34Dd0nrVWKm6GIiSeucBsh6RcaCNbhRaoxpX7H0HpPHL/UUx0HbHAAx
 IKq3DCw0J/RG/TQueRH5tXz6OcWBFiGOZ6yeAZVzbLAWZIjtmWuHQU+XyDQ2IuTJB7arXvQzhxE
 OVAHFU0L22J+/8EHfaLLq3ALxZnpoZsgYycEmG+1xplGDNgdkZtPM45xIWl90dZNqqmOsL9l25f
 y5RtCqWe1J2SqbMlVa6fKrJWoT3eQ+1Q4A9oDdBSfpFA==
X-Zone-Loop: 380102c53ae20017c498d6f25b67d644cafb2cb68326
x-campaign-type: default
x-transaction-id: 7617c933-f70c-4dd0-aade-a1eec2af7056
x-swg-uid: 01-815a1665-fa6d-4c68-a9aa-d48a6f0742c3
X-Mailer: Sweego
Message-ID:
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
x-swg-bid: 1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 17:17:31 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl>
 <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.142.cec64b929e0f79d6.19ebc68e54b.72557db34583c4d7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781277451596
X-purgate-ID: tlsNG-4011c0/1781277929-733738B7-BEECD60A/0/0
X-purgate-type: clean
X-purgate-size: 2051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB72867A840

---=Part.142.cec64b929e0f79d6.19ebc68e54b.72557db34583c4d7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 03:32:00PM +0100, Andrew Cooper wrote:
> On 12/06/2026 3:20 pm, Jan Beulich wrote:
> > On 12=2E06=2E2026 16:18, Andrew Cooper wrote:
> >> Well, no intended change=2E=C2=A0 It was a very big patch=2E
> >>
> >> Nothing should ever be using efi_get_time()=2E=C2=A0 It's unusable (i=
=2Ee=2E
> >> crashing) on hundreds of millions of machines=2E
> >>
> >> So, while we obviously do need to fix the assertion, this is "only"
> >> collateral damage from having fallen into the efi_get_time() path in =
the
> >> first place=2E=C2=A0 That wants investigating too=2E
> > Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set?
>=20
> The identified system is a Broadwell-D=2E
>=20
> Come to think of it, there were some systems of that era which (falsely)
> claimed to have no CMOS=2E=C2=A0 (An HP Haswell Blade comes to mind, but=
 it
> will be a similar chipset=2E)

Some info from the boot log about the machine:
    HPE ProLiant m510 Server Cartridge
    BIOS Version: H05 v1=2E98 (02/02/2023)
    System Memory: 32 GB
    1 Processor(s) detected, 8 total cores enabled, Hyperthreading is enab=
led
    Proc 1: Intel(R) Xeon(R) CPU D-1548 @ 2=2E00GHz
    HPE Power Profile Mode: Custom
    Power Regulator Mode: Dynamic Power Savings
    Advanced Memory Protection Mode: Advanced ECC Support
    Boot Mode: UEFI
    HPE SmartMemory authenticated in all populated DIMM slots=2E

One of the cartridge on a Moonshot=2E

> > On such systems efi_get_time() would better work properly=2E

I guess it works fine on this system=2E On a different cartridge, with a
Xen build prior to the commit, I have in the boot logs:

    Wallclock source: EFI


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.142.cec64b929e0f79d6.19ebc68e54b.72557db34583c4d7=---

