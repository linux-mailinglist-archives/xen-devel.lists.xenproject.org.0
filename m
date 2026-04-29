Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VoD6HQA48mlGpAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 18:55:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38830497D10
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 18:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297682.1573571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI8Bi-0000ku-Ev; Wed, 29 Apr 2026 16:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297682.1573571; Wed, 29 Apr 2026 16:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI8Bi-0000iw-BK; Wed, 29 Apr 2026 16:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1297682;
 Wed, 29 Apr 2026 16:55:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@swg.vates.tech>)
 id 1wI8Bg-0000iq-Hu
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 16:55:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI8Bf-00DXPO-RK
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 18:54:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@swg.vates.tech>)
 id 69f237c2-e002-0a2a0a5209dd-0a2a4508b90a-18
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 18:54:59 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@swg.vates.tech>)
 id 69f237e3-63b5-0a2a45080019-b9ff1c22822f-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 18:54:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dda2a3d88000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Apr 2026 16:54:54 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E2CA986484;
 Wed, 29 Apr 2026 18:54:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=tPxjCeuXw+PNWa5aL1B7SkZUldWs8bQSo7/uIWCVxQE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iK33oN+HlKXnuzRGtXmCAs8hQKlIPet7lI2bKWVSeonf/MuGZmlMdnX8BAXYNVTz5atD211NS
 qPNADF9oNZeO1nMFF7ALTYz32OTgaEOQHPJTqTX3mNsjS/oPBdsptElbeyVuSytav+AF00Yy/pX
 vT/rC1+vlEkTmSX575Nbca21DWJldWVvzqqTYi475XUmoCZu3avNSILZabY8LIWqEkiV0PH6vjP
 86/z9fG/OaFhs/yGqAQCdZZ+Aq63AJO9+AYGlAyqBslVAwnXdckQ3510WGODJvo5JRs+dQ1UkFM
 +ze/4jAzODEZ8PjYz5sUkEBnIjucWS3vDVSbJi3Xuv7g==
X-Zone-Loop: f5fc6aa7fb3d2a80262c364e8869db00cebd8a22257d
x-campaign-type: default
x-transaction-id: acad869d-85a3-4603-b747-bf2ace67da70
x-swg-uid: 01-f95f651f-3ae0-4cd0-b7b1-e0d56d10c2ba
X-Mailer: Sweego
Message-ID:
 <1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@vates.tech>
x-swg-bid: 1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 29 Apr 2026 18:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260423161112.50221-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <20260423161112.50221-1-ross.lagerwall@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2c5.179858d92bc580ea.19dda2a2bba.f9f3b2a504f764f4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777481690042
X-purgate-ID: tlsNG-c1860d/1777481699-C1D6BDB1-E38CF011/0/0
X-purgate-type: clean
X-purgate-size: 2016
X-Rspamd-Queue-Id: 38830497D10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2c5.179858d92bc580ea.19dda2a2bba.f9f3b2a504f764f4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/04/2026 =C3=A0 18:13, Ross Lagerwall a =C3=A9crit=C2=A0:
> If L1 executes VMRUN with the GIF set and it fails consistency checks,
> Xen will inject a VMEXIT and fail the assert checking the GIF is cleared=
=2E
>=20
> Instead, clear the GIF when injecting a VMEXIT to match what hardware
> does=2E
>=20
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualizat=
ion")
> Signed-off-by: Ross Lagerwall <ross=2Elagerwall@citrix=2Ecom>
> ---
>   xen/arch/x86/hvm/svm/nestedsvm=2Ec | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm=2Ec b/xen/arch/x86/hvm/svm/n=
estedsvm=2Ec
> index ef6fa5d23b67=2E=2Ef89b087a1155 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm=2Ec
> +++ b/xen/arch/x86/hvm/svm/nestedsvm=2Ec
> @@ -733,9 +733,9 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_u=
ser_regs *regs,
>       struct vmcb_struct *vmcb =3D v->arch=2Ehvm=2Esvm=2Evmcb;
>  =20
>       if ( vmcb->_vintr=2Efields=2Evgif_enable )
> -        ASSERT(vmcb->_vintr=2Efields=2Evgif =3D=3D 0);
> +        vmcb->_vintr=2Efields=2Evgif =3D 0;
>       else
> -        ASSERT(svm->ns_gif =3D=3D 0);
> +        nestedsvm_vcpu_clgi(v);
>  =20
>       ns_vmcb =3D nv->nv_vvmcx;
>  =20

Looks good to me, though I think we are here looking to make a "guest=20
CLGI" (clear GIF), so the vGIF specific logic should be collapsed into=20
nestedsvm_vcpu_clgi() instead of having it as the non-vgif-support case=2E
(as IIUC, vGIF is a hardware accelration for nested GIF handling ?)

(also making me notice that svm_vmexit_do_{stgi,clgi}() seems to lack=20
vGIF specific logic)

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2c5.179858d92bc580ea.19dda2a2bba.f9f3b2a504f764f4=---

