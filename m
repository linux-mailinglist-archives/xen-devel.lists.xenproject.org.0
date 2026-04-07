Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C5VEFMq1Wli1wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 18:01:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903853B1729
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 18:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275148.1561111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8qx-0004Ow-Sr; Tue, 07 Apr 2026 16:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275148.1561111; Tue, 07 Apr 2026 16:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8qx-0004Mt-P6; Tue, 07 Apr 2026 16:00:35 +0000
Received: by outflank-mailman (input) for mailman id 1275148;
 Tue, 07 Apr 2026 16:00:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d52a1e.v1-a08d790daf4144f5afd24c13c8ce5860@bounce.vates.tech>)
 id 1wA8qv-0004Mn-CS
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:00:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA8qu-004wDb-MZ
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 18:00:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d52a1e.v1-a08d790daf4144f5afd24c13c8ce5860@bounce.vates.tech>)
 id 69d52a1d-e002-0a2a0a5209dd-0a2a45049306-8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 18:00:32 +0200
Received: from [198.2.136.16] (helo=mail136-16.atl41.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d52a1e.v1-a08d790daf4144f5afd24c13c8ce5860@bounce.vates.tech>)
 id 69d52a1f-bb33-0a2a45040019-c602881072b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 18:00:32 +0200
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fqrWf66W0z8XRqbL
 for <xen-devel@lists.xenproject.org>; Tue,  7 Apr 2026 16:00:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a08d790daf4144f5afd24c13c8ce5860; Tue, 07 Apr 2026 16:00:30 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775577630; x=1775847630;
	bh=Dstru+kHoZmtS5qezTht3r8KRsk+jJpHtfrwwofsbNk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Gix4KMYJ41zY2aQC3rgRV2t9YRPtOS6NlN6981dZByX3DoT+y++kJTfbqHxfXE3za
	 1iMtSObOWx6smp2Gx2q7h797FCdNCuTHCqt1iNd5QcS2RcUeUw2+DFIuBWLFTlKM5f
	 GiToabz9+zDAl9q9iHh6/edHSQVvvL3t+69mQ9DdhW9/1SeN5pH6WECXa+MK8kAlgr
	 kKVxrXteyYH592SZ/zujf3igy4rcCISbLxB/tr4phSIMAyb09XD69sbvZSsdfbHK5b
	 aW59mJwf/HhzptGAE38qWxxkW+Mp+KTgKEgtLPHWTpK0LRhs/52HpQIi+7eWm97vJF
	 7cLAKrsxObUQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775577630; x=1775838130; i=teddy.astie@vates.tech;
	bh=Dstru+kHoZmtS5qezTht3r8KRsk+jJpHtfrwwofsbNk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=i7RSvmCglU0uYfR+41mqWWXTB0AVb39e+HpO2a9+h2SNTBjJGKWPGi/6H2Bn/9I8z
	 l0nhS2f1tuOWrVShpRWwgMxjAZxLQc+fcsszJ1ztnYtVDyZflTpvSMFMlSPpOEZ6QQ
	 ZcmBl6lPcodmZfij9Opd5TcvYb1fqoL7b0EFYbilozvq6l2dFuaG3f2mh4IyDTNSzc
	 VV4KlUpA+ybUMlla0pK+QK51LKJh2hEXdz9BdIyBmD6UycKyLrP7B9aHSCYIV2Kgda
	 /wFzGVRvSGpia19hXFBIr9BIHzRZw+pVJ73KksBzJpjJAm5qLuNAZIYf+/I93RvPXq
	 DVFla4nbdI7Eg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20x86/emul:=20Remove=20fallback=20path=20from=20SWAPGS?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775577629235
Message-Id: <e9056cab-09a8-4874-bcb6-5b39091722cc@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260407142351.73049-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260407142351.73049-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a08d790daf4144f5afd24c13c8ce5860?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260407:md
Date: Tue, 07 Apr 2026 16:00:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1775577632-B3B3051B-5D34BB8B/0/0
X-purgate-type: clean
X-purgate-size: 3876
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_ALL(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out,vates.tech:query timed out,citrix.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_SPAM(0.00)[0.928];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,sreg.base:url]
X-Rspamd-Queue-Id: 903853B1729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 07/04/2026 =C3=A0 16:27, Andrew Cooper a =C3=A9crit=C2=A0:
> In real hardware, accesses to the registers cannot fail.  The error paths=
 are
> just an artefact of the hook functions needing to return something.
> 
> The best effort unwind is also something that doesn't exist in real hardw=
are,
> and makes the logic more complicated to follow.  Instead, use an
> ASSERT_UNREACHABLE() with a fallback of injecting #DF.  Hitting this path=
 is
> an error in Xen.
> 
> While adjusting, remove {read,write}_segment() and use {read,write}_msr()=
 to
> access MSR_GS_BASE.  There's no need to access the other parts of the GS
> segment, and this is less work behind the scenes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> 
> v2:
>   * Retain x86_emul_reset_event()
>   * Pass an error code for #DF
>   * Drop goto done now that generate_exception() is used
>   * Use 2x{read,write}_msr()
> 
> Tested using LKGS's extention of the test emulator for SWAPGS.
> ---
>   xen/arch/x86/x86_emulate/0f01.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0=
f01.c
> index 6c10979dd650..54bd6faf0f2c 100644
> --- a/xen/arch/x86/x86_emulate/0f01.c
> +++ b/xen/arch/x86/x86_emulate/0f01.c
> @@ -189,22 +189,24 @@ int x86emul_0f01(struct x86_emulate_state *s,
>           generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
>           fail_if(!ops->read_segment || !ops->read_msr ||
>                   !ops->write_segment || !ops->write_msr);

Do we still need checks for ops->{read,write}_segment if we're not using 
them anymore ?

> -        if ( (rc =3D ops->read_segment(x86_seg_gs, &sreg,
> -                                     ctxt)) !=3D X86EMUL_OKAY ||
> -             (rc =3D ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> +        if ( (rc =3D ops->read_msr(MSR_GS_BASE, &sreg.base,
>                                    ctxt)) !=3D X86EMUL_OKAY ||
> -             (rc =3D ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> -                                  ctxt, false)) !=3D X86EMUL_OKAY )
> +             (rc =3D ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> +                                 ctxt)) !=3D X86EMUL_OKAY )
>               goto done;
> -        sreg.base =3D msr_val;
> -        if ( (rc =3D ops->write_segment(x86_seg_gs, &sreg,
> -                                      ctxt)) !=3D X86EMUL_OKAY )
> +        if ( (rc =3D ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> +                                  ctxt, false)) !=3D X86EMUL_OKAY ||
> +             (rc =3D ops->write_msr(MSR_GS_BASE, msr_val,
> +                                  ctxt, false)) !=3D X86EMUL_OKAY )
>           {
> -            /* Best effort unwind (i.e. no real error checking). */
> -            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
> -                                ctxt, false) =3D=3D X86EMUL_EXCEPTION )
> -                x86_emul_reset_event(ctxt);
> -            goto done;
> +            /*
> +             * In real hardware, access to the registers cannot fail.  I=
t is
> +             * an error in Xen if the writes fail given that both MSRs h=
ave
> +             * equivalent checks.
> +             */
> +            ASSERT_UNREACHABLE();
> +            x86_emul_reset_event(ctxt);
> +            generate_exception(X86_EXC_DF, 0);
>           }
>           break;
>   

The rest looks good to me (with or without ops->{read,write}_segment 
fail_if() change).

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



