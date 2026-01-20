Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OS0IDq0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21048291
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208870.1520997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBVs-00025W-NH; Tue, 20 Jan 2026 13:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208870.1520997; Tue, 20 Jan 2026 13:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBVs-00022w-Kc; Tue, 20 Jan 2026 13:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1208870;
 Tue, 20 Jan 2026 13:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiQ1=7Z=bounce.vates.tech=bounce-md_30504962.696f7eee.v1-4824c57c7d5041c48b98d46479d3b06c@srs-se1.protection.inumbo.net>)
 id 1viBVr-00022q-07
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:11:15 +0000
Received: from mail14.wdc04.mandrillapp.com (mail14.wdc04.mandrillapp.com
 [205.201.139.14]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7de76de6-f601-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 14:11:12 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail14.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4dwSPq09Jrz8XS27G
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 13:11:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4824c57c7d5041c48b98d46479d3b06c; Tue, 20 Jan 2026 13:11:10 +0000
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
X-Inumbo-ID: 7de76de6-f601-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768914671; x=1769184671;
	bh=VxAoZGVlST9OVVrgCzYWr7DYbVd9xEIUsiIJJpE4u9A=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VqKdqIipNzQtTyMU1KEO6mKOhNLCw5wXOgrLyCEXcRgPHD9VVSHMx4KKLWBPCXk1f
	 /5Dym6SajcdzQaEv88ao6uRYb1lgfgxLuqDsLH9FlOkwMLgFIn+Pg33jvNWz6MiGox
	 XR9bUQBxCmfk94ZvFLVEY3MdSYQtlfvSV3fs0t/PxxOkcfHE2m8PUzi/F4oEIxuViE
	 UzkU0rwXMRW42D4HjlgJUOry+o+OgYpD1iS+scwzqvs39Il1Xqq2rk4qQWgrXY2g7b
	 JCVcXb1d0CsYnOLo7MM7WGo0leI0zFlmyGvsI0a15yB+mfDCx8obl37eiq5dVDmZla
	 e+zZQ31ZFHHbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768914671; x=1769175171; i=teddy.astie@vates.tech;
	bh=VxAoZGVlST9OVVrgCzYWr7DYbVd9xEIUsiIJJpE4u9A=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=el4SK0duTM5mAenFWxcESjlBnjRMJEfnnqYUID686s4E1JbYkdWCc8r7Bglrz7RqP
	 iImNVSfFvRkhqEst/Hr9ely0EeIQg0Fuzp0hy8faUlgmLui7iepX2nc3vGQXcs3tj1
	 jZgN/ey0QTj6HrmIloGz2c4mUDma8e5hoHem48R6/aeXH16mXZe8hSV3cdOVcv9BXt
	 78ZfbIjw9WfnZ0K06/elxQ+69DRoOkO8XoTwsVClVQakd+JsW/cFgyXaVohyoygLXv
	 RKm0kcFymYBVyEcHMq4/PKFRIV5k+pl7/Mx4trzutfHgSpdSeahN1xte4YlCwlzrS4
	 Zq+l3czkDJRhA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/2]=20x86/svm:=20Intercept=20Bus=20Locks=20for=20HVM=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768914669437
Message-Id: <5c554703-f7e6-4625-be07-4fc607b2c4b5@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com> <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4824c57c7d5041c48b98d46479d3b06c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260120:md
Date: Tue, 20 Jan 2026 13:11:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1D21048291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, some questions

Le 20/01/2026 =C3=A0 10:56, Alejandro Vallejo a =C3=A9crit=C2=A0:
> With the threshold initialised to 1 the guest exits at the first
> buslock. Initialising as zero is invalid and causes an immediate exit.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/hvm/svm/svm.c  | 4 ++++
>   xen/arch/x86/hvm/svm/vmcb.c | 6 ++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 9748df87d8..dbb7f99d5e 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -3087,6 +3087,10 @@ void asmlinkage svm_vmexit_handler(void)
>           hvm_descriptor_access_intercept(0, 0, desc, write);
>           break;
>       }
> +    case VMEXIT_BUSLOCK:
> +        perfc_incr(buslock);
> +        vmcb->bus_lock_thresh =3D 1;
> +        break;
>   
>       default:
>       unexpected_exit_type:
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index cbee10d046..7a19b1ab61 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>           GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP      =
 |
>           GENERAL2_INTERCEPT_RDPRU;
>   
> +    if ( cpu_has_bus_lock_thresh )
> +    {
> +        vmcb->_general3_intercepts =3D GENERAL3_INTERCEPT_BUS_LOCK_THRES=
H;
> +        vmcb->bus_lock_thresh =3D 1; /* trigger immediately */
> +    }
> +
>       /* Intercept all debug-register writes. */
>       vmcb->_dr_intercepts =3D ~0u;
>   

According to APM,

INTERCEPT_BUS_LOCK_THRESH does
 > Intercept bus lock operations when Bus Lock Threshold Counter is 0

I assume that when set to 0, we intercept all bus locks, so if set to 1, 
every 2 bus lock (since we first go from 1 to 0, then at 0 we intercept 
the next one) ?

I think we want that to be tunable, as intercepting all bus locks may be 
too extreme we probably want to intercept every few ones instead.

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



