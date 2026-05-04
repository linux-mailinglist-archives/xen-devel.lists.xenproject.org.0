Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN/yDqeR+Gl8wgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:31:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5014BCE60
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299742.1574290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsSC-0007GJ-UZ; Mon, 04 May 2026 12:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299742.1574290; Mon, 04 May 2026 12:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsSC-0007Do-Qn; Mon, 04 May 2026 12:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1299742;
 Mon, 04 May 2026 12:31:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df2f88b2d000f373@swg.vates.tech>)
 id 1wJsSA-0007Di-QC
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:31:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsS9-005sZq-Nl
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:31:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df2f88b2d000f373@swg.vates.tech>)
 id 69f8918b-2eae-0a2a0a5409dd-0a2a4507a760-16
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:31:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df2f88b2d000f373@swg.vates.tech>)
 id 69f89191-229c-0a2a45070019-b9ff1c22ae57-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:31:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19df2f88b2d000f373.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 May 2026 12:31:08 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3234F86252;
 Mon,  4 May 2026 14:31:07 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=OD8or3s/QJOBGyJXhNyPrhSlXzO3yXnn83xmBgN2eC0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ahtiHU5PNIRMtB1/kbHTDrX/+wnCl3yBJGbLWwLJYy8VwIDd3inPZBb3fl271R+ZMviBDg+W3
 0gJWHe0gbxrTWwSX6eThaWxwZmPjxHOivIqaQBQuJ/PdLn1utMxf4+FJ5fLEuTDJ8RMGov7of9H
 cUze2wM+4G7J4suuXYmTUQqa24G6kdy+e7HR03B8/l8lhPvamMV1OGw95fzBMaRtZRepyyoq0bb
 LvM1qo5jGsdRgJiZGvFxrP/dOQNtA1iDq/GGezQSV0zGP55K2lCX3d4anMKdNMZ39MS3L6sZJvy
 e41Xsns3dIq5nP4N0A/nK8n16Vy5C6PH+qiW0FG8IUmA==
X-Zone-Loop: 0abed36351d139258a29ce56ece0f803a8627e19dfba
x-campaign-type: default
x-transaction-id: a95e3892-1a3d-498d-8321-958c38e8c396
x-swg-uid: 01-078d159b-7268-49e0-bc4c-bd8d12c4052a
X-Mailer: Sweego
Message-ID:
 <1777897868.8631fc262581453bbf619ec5b2062170.19df2f88b2d000f373@vates.tech>
x-swg-bid: 1777897868.8631fc262581453bbf619ec5b2062170.19df2f88b2d000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 4 May 2026 14:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Always sync guest CR2 on VMExit
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.d6.93e06ccba025c343.19df2f88826.86241822aa36c9ae=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777897867307
X-purgate-ID: tlsNG-ef75cf/1777897873-AEB70C48-375E36DA/0/0
X-purgate-type: clean
X-purgate-size: 2387
X-Rspamd-Queue-Id: AF5014BCE60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.d6.93e06ccba025c343.19df2f88826.86241822aa36c9ae=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 01/05/2026 =C3=A0 23:43, Andrew Cooper a =C3=A9crit=C2=A0:
> Under SVM, there are two copies of guest CR2=2E  One is v->arch=2Ehvm=2E=
guest_cr[2]
> and one is in the VMCB=2E
>=20
> Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardw=
are
> loads and saves the guest CR2 across VMRUN/VMExit=2E
>=20
> For HAP guests (where #PF is not intercepted, and therefore we don't typ=
ically
> inject #PF either), this causes the guest CR2 value to be lost on migrat=
e=2E  As
> migration is cooperative and not done from the #PF handler, this also go=
es
> unoticed by guests=2E
>=20
> It also means that an emulated MOV-from-CR2 reads a stale value=2E
>=20
> Reported-by: Stefano Stabellini <sstabellini@kernel=2Eorg>
> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions=
=2E")
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> ---
> CC: Jan Beulich <jbeulich@suse=2Ecom>
> CC: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>
> CC: Teddy Astie <teddy=2Eastie@vates=2Etech>
> CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
>=20
> It also also works around the QEMU bug that triggered the investigion, w=
here
> the CR2 intercepts trigger despite Xen requesting CR2 not to be intercep=
ted=2E
> ---
>   xen/arch/x86/hvm/svm/svm=2Ec | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/x86/hvm/svm/svm=2Ec b/xen/arch/x86/hvm/svm/svm=2Ec
> index ced616684732=2E=2Ef49d2ebbfdd5 100644
> --- a/xen/arch/x86/hvm/svm/svm=2Ec
> +++ b/xen/arch/x86/hvm/svm/svm=2Ec
> @@ -2505,6 +2505,7 @@ void asmlinkage svm_vmexit_handler(void)
>       hvm_sanitize_regs_fields(
>           regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs=2El));
>  =20
> +    v->arch=2Ehvm=2Eguest_cr[2] =3D vmcb_get_cr2(vmcb);
>       if ( paging_mode_hap(v->domain) )
>           v->arch=2Ehvm=2Eguest_cr[3] =3D v->arch=2Ehvm=2Ehw_cr[3] =3D v=
mcb_get_cr3(vmcb);
>  =20
>=20
> base-commit: 61f957d48c78df6c5254b6f54d6170d3bd3d717e

Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.d6.93e06ccba025c343.19df2f88826.86241822aa36c9ae=---

