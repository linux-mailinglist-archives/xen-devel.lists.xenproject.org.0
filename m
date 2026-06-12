Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f6SAMztCLGoCOgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 19:30:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66267B5A7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 19:30:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=L4eHHogL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336954.1598648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY5hc-000222-26; Fri, 12 Jun 2026 17:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336954.1598648; Fri, 12 Jun 2026 17:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY5hb-0001zG-Uv; Fri, 12 Jun 2026 17:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1336954;
 Fri, 12 Jun 2026 17:29:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebce20767000701b@swg.vates.tech>)
 id 1wY5hb-0001zA-2C
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 17:29:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY5hZ-00Gq88-W9
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 19:29:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebce20767000701b@swg.vates.tech>)
 id 6a2c41fe-5cb7-0a2a0a5109dd-0a2a450cb49a-8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 19:29:53 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebce20767000701b@swg.vates.tech>)
 id 6a2c4211-62f1-0a2a450c0019-b9ff1c128073-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 19:29:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebce20767000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 17:29:50 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 53BFF865E3;
 Fri, 12 Jun 2026 19:29:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pfeU4m7B3yotx6EMWP6xqFgVmAAjbrDQE6H7yN6E2wE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=L4eHHogL7N/eLa+8vkoa3A6XFdJ9Zh36UuLT3/4a66tNIQCFeH/ZPW5ZrNtQKoa4j9W1dmU+x
 x36p0pfx3lyMG+zjjKptRiPm0X1Hqo5qRqPbEI7ACV6J4Lc6WaFVzDW+56tGitCtAwZLHYe2kMT
 mIbZfZYj5u3ijripgXgiBJB93Ls/3w8+ZdtJ3sMaINOVoDrLpoXWsF4u14VFRk+1OKPrbfV50DL
 j5IEfsU6o4/EX0w5kl7dUi2H8LI6zeLqNuatUNRyS3w3LyvEEw0btgqmr8evWi6D0srkTC0aAdN
 2gX2NlXUztf2gDZudd+fCAofNEYgnbVwlzhuiY0GtJrw==
X-Zone-Loop: d1149887ae0c6e5c594306c5c37a4cae8d5aa19d1961
x-campaign-type: default
x-transaction-id: dce315c6-e3b2-4eef-8b33-46b066d71cfd
x-swg-uid: 01-0e473e46-d154-4f98-927e-9df6db961908
X-Mailer: Sweego
Message-ID:
 <1781285390.8631fc262581453bbf619ec5b2062170.19ebce20767000701b@vates.tech>
x-swg-bid: 1781285390.8631fc262581453bbf619ec5b2062170.19ebce20767000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 19:29:49 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI
 runtime path
References: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.154.fa57a385a660c6ea.19ebce204b1.956fbd88cbecb468=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781285389490
X-purgate-ID: tlsNG-d25034/1781285393-E3370CF5-C512CB85/0/0
X-purgate-type: clean
X-purgate-size: 3082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B66267B5A7

---=Part.154.fa57a385a660c6ea.19ebce204b1.956fbd88cbecb468=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 05:54:36PM +0100, Bernhard Kaindl wrote:
> Anthony reported a boot-time assertion in init_xen_time() via efi_get_ti=
me()
> -> efi_rs_enter() in vcpu_save_fpu() on a Broadwell-D system:
>=20
>   Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387=2Ec:195
>=20
> This became fragile after the lazy-FPU removal cleanup series:
>=20
> In 1792bb9a99d2 ("x86: Cleanup cr0=2ETS flag handling"),
> efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr)=
,
> which unconditionally asserts !is_idle_vcpu(v)
> so an EFI runtime call in idle context now asserts=2E
>=20
> Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
> efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
> which has the same assertion and can fail for the same reason=2E
>=20
> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/resto=
re
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs=2E
>=20
> Fixes: 1792bb9a99d2 ("x86: Cleanup cr0=2ETS flag handling")
> Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
> Reported-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>
> Suggested-by: Jan Beulich <jbeulich@suse=2Ecom>
> Signed-off-by: Bernhard Kaindl <bernhard=2Ekaindl@citrix=2Ecom>
> ---
>  xen/common/efi/runtime=2Ec | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> Jan Beulich's suggestion to guard the calls to vcpu_save_fpu() and
> vcpu_restore_fpu() in the EFI runtime path with is_idle_vcpu() checks
> seems to be the right approach to fix the assertion failure for idle vCP=
Us:
>=20
> > The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/f=
pu_dirty"):
> > While vcpu_restore_fpu() indeed unconditionally set the two boolean fi=
elds to
> > true at that point, idle vCPU-s may never make it through that functio=
n, and
> > hence ->fpu_dirtied would have remained false, triggering the (origina=
l) early
> > exit from _vcpu_save_fpu()=2E Perhaps all we can do now is guard the c=
all to
> > vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_=
leave())
> > by explicit is_idle_vcpu() checks=2E Much like the calls are guarded i=
n
> > __context_switch()=2E
>=20
> Anthony, could you test this with the 'cmos-rtc-probe' workaround you ju=
st
> added removed to check if guarding the assertions as Jan suggested is en=
ough
> to fix the issues triggered on your machine?

Yes, that patch works=2E I've also checked that I have
"Wallclock source: EFI" in the boot logs=2E

Tested-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.154.fa57a385a660c6ea.19ebce204b1.956fbd88cbecb468=---

