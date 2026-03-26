Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEelMGkMxWn05wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:37:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E944333872
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263641.1555513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hoF-0001pu-7k; Thu, 26 Mar 2026 10:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263641.1555513; Thu, 26 Mar 2026 10:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hoF-0001ok-3w; Thu, 26 Mar 2026 10:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1263641;
 Thu, 26 Mar 2026 10:19:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c50829.v1-447310448c7741dbb43bce180333537a@bounce.vates.tech>)
 id 1w5hoC-0001nt-Qr
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:19:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5hoC-003mwb-5i
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:19:24 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c50829.v1-447310448c7741dbb43bce180333537a@bounce.vates.tech>)
 id 69c50828-e002-0a2a0a5209dd-0a2a45038944-18
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:19:24 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c50829.v1-447310448c7741dbb43bce180333537a@bounce.vates.tech>)
 id 69c5082a-1947-0a2a45030019-c602b42fc85d-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:19:22 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fhKWY597hzPm130t
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 10:19:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 447310448c7741dbb43bce180333537a; Thu, 26 Mar 2026 10:19:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774520361; x=1774790361;
	bh=apVr+6Zdzv3stI5wR/5aOupZbVz/jF2AjrrLVrCKY48=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=uw9fcNJGeP3dgF2/iwnT3FkR7KX5UQAqVgAtJv6Su2oRxjFlL4EI0p3NxP8361ni+
	 Q/kLFRV3YYWzJ6O/oRE2bN9xEk8ZxmqwFCGV6xoWn38de5OnzMNn0pEyXPF67rzy2s
	 +GeU1+lBYVtG2X5IsKF7S/yfqKct2izl6BYiW8ZDSTDMo1t2vzxgRS22ZYoso8OT+p
	 FROvJk/mIZAw6TjI+pLGtbCtpzufbNVnof6nNaJVwuVw6QVd1b4X5W+sIbadUFo8cR
	 ogqBtXZhH27HMxH2Z/c/BC28PIhcbA89QMcWANe80gl8h7GaOB6O1VgPx5uw/XjA1C
	 X2ng6ZvIq8iYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774520361; x=1774780861; i=teddy.astie@vates.tech;
	bh=apVr+6Zdzv3stI5wR/5aOupZbVz/jF2AjrrLVrCKY48=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=t6bJhkVQb+xkg8PPE9cgKrn+h4Cb1YjI8iYgU044yjmUTzgOHhqmh1JA6PVXE3S6i
	 skrVdlQ7Ca2KucLiQauOxbyiA0MlfBdApcX/gTt1ZfZbNd5PYrgwUAJ3MiRrqq64fP
	 IRAW7hNmU3WRK46wiHvyjIx+ZZAjVYF3p8s5ScLi23CstAVnXst5LXnWlQSgTAYMFm
	 y2ipsSrHGU7xOTh/madCFe0OGuM32WczvkoLP19SFDPP2HqUFWM1gDZH9toWNr/QFY
	 fqIFlcCFhqzcwiqrYjK8SY+JAH3CIRQiDKPzv+BlQc6gW4TQP1/TLWZwaq/icAkt85
	 KKV0/evorIrnw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH]=20x86/intel:=20Add=20recent=20CPU=20models=20model-specific=20LBRs?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774520360593
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <888b0df36c6706de9d7ec1c5c4cc229297699670.1774519884.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.447310448c7741dbb43bce180333537a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260326:md
Date: Thu, 26 Mar 2026 10:19:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1774520363-EAA8372C-53EE28CD/0/0
X-purgate-type: clean
X-purgate-size: 2326
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xcp-ng.org:url,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.779];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E944333872
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add all CPU models that supports these MSR as they are defined in February =
2026 SDM.
It uses the same list that span from Skylake to latest CPU models as a part=
 of

    MSRs in the 6th=E2=80=9413th generation Intel=C2=AE Core=E2=84=A2 proce=
ssors,
    1st=E2=80=945th generation Intel=C2=AE Xeon=C2=AE Scalable processor fa=
milies,
    Intel=C2=AE Core=E2=84=A2 Ultra 7 processors, 8th generation Intel=C2=
=AE Core=E2=84=A2 i3
    processors, Intel=C2=AE Xeon=C2=AE E processors, Intel=C2=AE Xeon=C2=AE=
 6 P-Core
    processors, Intel=C2=AE Xeon=C2=AE 6 E-Core processors, and Intel=C2=AE=
 Series 2
    Core=E2=84=A2 Ultra processors

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Currently, none of these MSR are exposed on these CPUs, leading to BSOD [1]
in Windows when it is supposedly trying to debug some program.

I guess [2] is also caused by these missing MSRs.

[1] https://xcp-ng.org/forum/topic/12008/application-on-vm-causing-bsod
[2] https://lore.kernel.org/xen-devel/ced16fca-3b55-40a1-a7e2-ffadd9707394@=
vates.tech/

 xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..98a25ce301 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -541,10 +541,26 @@ static const struct lbr_info *__init get_model_specif=
ic_lbr(void)
         case 0x8c: case 0x8d:
         /* Tremont */
         case 0x86:
+        /* Saphire Rapids */
+        case 0x8f:
         /* Kaby Lake */
         case 0x8e: case 0x9e:
+        /* Alder Lake */
+        case 0x97: case 0x9a:
         /* Comet Lake */
         case 0xa5: case 0xa6:
+        /* Meteor Lake */
+        case 0xaa:
+        /* Granite Rapids */
+        case 0xad: case 0xae:
+        /* Sierra Forest */
+        case 0xaf:
+        /* Raptor Lake */
+        case 0xba: case 0xb7: case 0xbf:
+        /* Lunar Lake */
+        case 0xbd:
+        /* Emerald Rapids */
+        case 0xcf:
             return sk_lbr;
         /* Atom */
         case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



