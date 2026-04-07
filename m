Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALaxFaoU1Wm30AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 16:28:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A93B003C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 16:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275071.1561046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA7Py-0006AI-BC; Tue, 07 Apr 2026 14:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275071.1561046; Tue, 07 Apr 2026 14:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA7Py-00067U-7k; Tue, 07 Apr 2026 14:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1275071;
 Tue, 07 Apr 2026 14:28:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d51491.v1-9635abaa79d7495a902f1a97067a8fcc@bounce.vates.tech>)
 id 1wA7Pw-00067O-5m
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 14:28:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA7Pv-006w95-Hp
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:28:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d51491.v1-9635abaa79d7495a902f1a97067a8fcc@bounce.vates.tech>)
 id 69d51488-5cb7-0a2a0a5109dd-0a2a450ce958-18
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:28:35 +0200
Received: from [198.2.136.16] (helo=mail136-16.atl41.mandrillapp.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d51491.v1-9635abaa79d7495a902f1a97067a8fcc@bounce.vates.tech>)
 id 69d51492-f40c-0a2a450c0019-c6028810e3da-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:28:35 +0200
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fqpTY5WcFz8XRqPJ
 for <xen-devel@lists.xenproject.org>; Tue,  7 Apr 2026 14:28:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9635abaa79d7495a902f1a97067a8fcc; Tue, 07 Apr 2026 14:28:33 +0000
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
	s=mte1; t=1775572113; x=1775842113;
	bh=wulGuTlcR8Sn4nzBb9YK+YbQVPxoyiSgvH5ZgGYc+/w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Zj16rsmBNZPFcrTZtvXrwjirj28wSkh4abWOmIaEXGNOHr8n5pJ8oSPcmDZdkFeym
	 i09YA30xMk6PHwt7JBCKnnFCOQoxfNy9afYkpb5h6oUfGPwb46Bn4ffFVdjGXTakJu
	 t3+XBQ6NlvmENeTlAeY+6CSYqiIMKjv/mzamaA8+TP9dbAUSVDAOVQjbDp2q2FMiqH
	 +L9BYrWOyIPI2ABOufl08HK/hEyp+Dfi22YZMSKE2G7pvS2oEGRyVfsUn4Tvd8POXH
	 4VcjFkRpm4Ya4RIyQ1WU8VgGvvNaRbEzbPLaKCx2k/IGdgIxL+DscvE5aXs0wJkkaQ
	 yH9X9Z4oM4oGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775572113; x=1775832613; i=teddy.astie@vates.tech;
	bh=wulGuTlcR8Sn4nzBb9YK+YbQVPxoyiSgvH5ZgGYc+/w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rWvaWa++IEb19cf8UrhBU4gW1Su6QcNaMd/Xy1PlyeFE1EzKM2p7z33FhL0ALeuez
	 TvCcO9LX2HEx/eVM50Lc353QsGXwiVTs965Fxa70q7vadNTcz+yOj5ja+eALclZvvU
	 xMiwtpkhmLgwVEqz8Ub8+rf6Ru4v65BVcIMQICZn1As3zIiFRFtHsvABi9K/2SvqFI
	 e+4C7SE97yZNpXB3kHdpNGiXeZByHq9qG/dGmjbSdPw2XWMlvUN7IAAfsnbPrWNAjl
	 7HW1P/d+/Em+5DgRSYAX2G97PftDtn2WK+mDcmXOurOoERkVW7rJKzY77sHBNBlEpB
	 pv69GmmXWxDCw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/HPET:=20channel=20handling=20in=20hpet=5Fbroadcast=5Fresume()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775572112605
Message-Id: <f1d850c9-e544-49a7-922a-dedce7b8c306@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
In-Reply-To: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9635abaa79d7495a902f1a97067a8fcc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260407:md
Date: Tue, 07 Apr 2026 14:28:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1775572115-80360A3D-80950A2E/0/0
X-purgate-type: clean
X-purgate-size: 2721
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,mandrillapp.com:dkim,invisiblethingslab.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.889];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B06A93B003C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 07/04/2026 =C3=A0 15:35, Jan Beulich a =C3=A9crit=C2=A0:
> The per-channel ENABLE bit is to solely be driven by hpet_enable_channel(=
)
> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
> the (possible) channel put in legacy mode we don't do so during boot
> either.
> 
> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
> all-zero message (when the passed in CPU mask has no online CPUs). Nothin=
g
> would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
> would later produce a well-formed message template in
> hpet_events[].msi.msg.
> 
> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>
> ---
> As to the Fixes: tag: The issue for the HPET resume case is the
> cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) check in
> msi_compose_msg(). The earlier cpumask_empty() wasn't a problem, as
> cpu_mask_to_apicid() returning a bogus (offline) value didn't have any ba=
d
> effect: Before use, a valid destination would have been put in place, but
> other parts of .msg were properly set up. Furthermore we also didn't clea=
r
> the entire message prior to that change.
> 
> Many thanks got to Marek for tirelessly trying out various debugging
> suggestions.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -685,12 +685,18 @@ void hpet_broadcast_resume(void)
>       for ( i =3D 0; i < n; i++ )
>       {
>           if ( hpet_events[i].msi.irq >=3D 0 )
> +        {
> +            struct irq_desc *desc =3D irq_to_desc(hpet_events[i].msi.irq=
);
> +
> +            cpumask_copy(desc->arch.cpu_mask, cpumask_of(smp_processor_i=
d()));
> +
>               __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));

We can directly reuse "desc" here since irq_to_desc(...) isn't supposed 
to change value with cpumask_copy().

i.e `__hpet_setup_msi_irq(desc);`

> +        }
>   
>           /* set HPET Tn as oneshot */
>           cfg =3D hpet_read32(HPET_Tn_CFG(hpet_events[i].idx));
>           cfg &=3D ~(HPET_TN_LEVEL | HPET_TN_PERIODIC);
> -        cfg |=3D HPET_TN_ENABLE | HPET_TN_32BIT;
> +        cfg |=3D HPET_TN_32BIT;
>           if ( !(hpet_events[i].flags & HPET_EVT_LEGACY) )
>               cfg |=3D HPET_TN_FSB;
>           hpet_write32(cfg, HPET_Tn_CFG(hpet_events[i].idx));
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



