Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFcJBPyD52m+9gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:04:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F643BB98
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289008.1569241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBiH-0007oi-Tl; Tue, 21 Apr 2026 14:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289008.1569241; Tue, 21 Apr 2026 14:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBiH-0007lr-QT; Tue, 21 Apr 2026 14:04:29 +0000
Received: by outflank-mailman (input) for mailman id 1289008;
 Tue, 21 Apr 2026 14:04:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373@swg.vates.tech>)
 id 1wFBiF-0007lj-7Q
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:04:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFBiE-007mSI-KV
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:04:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373@swg.vates.tech>)
 id 69e783dd-2eae-0a2a0a5409dd-0a2a4503cbc4-34
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:04:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373@swg.vates.tech>)
 id 69e783ea-672d-0a2a45030019-b9ff1c229759-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:04:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db05b44aa000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 21 Apr 2026 14:04:24 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id DCC248747F;
 Tue, 21 Apr 2026 16:04:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=MB/m/ZZNg4unA9O5EHjaJEeR/qWt44l6z4I1gSVJ4dk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TOaVLUo48manl0zBOhikmTndS8SRmxCYo/SVIfMXhxAmDpqDSRquYdrAmuvStYy0K+3ZzB/hz
 vbZZSMFd8hk6aZgZwB5d7AzxXF1KClJgQ8YbEqAi75SInffl0jUq0THAt+XSmkXpUrby+JBkDno
 Y0DbY/SzCQmmep0A+W9IIByyWoClaCmGAFhYI+3IRmiXTAwNXLlLHECdb+aJ2qX1Issu7AnmsSo
 okPHy5DfOHP3cIgxZYotBkChG4y/isshSDZpC/cebEOouDe3NSDJlBXOJbUa5862Czuyv/GxX8Z
 Dtz/XYF7Wy8Qs8CfKPeV8XOOyY1SFKCQ626fiTQ93YDA==
X-Zone-Loop: 3fc5128abaea35f35050ab85e6d5e76fcaf417e7d227
x-campaign-type: default
x-transaction-id: e53f060e-b64b-4739-82cc-34a2e2128896
x-swg-uid: 01-cc4ac554-f169-4f4d-9b60-469fa7643f91
X-Mailer: Sweego
Message-ID:
 <1776780264.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373@vates.tech>
x-swg-bid: 1776780264.8631fc262581453bbf619ec5b2062170.19db05b44aa000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 21 Apr 2026 16:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, jason.andryuk@amd.com
References: <cover.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
 <29068558780bd9c6182d7bd74b357acc44409bfe.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <29068558780bd9c6182d7bd74b357acc44409bfe.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2489.c2540df3f714e6ac.19db05b4251.729abd03c36de791=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776780264017
X-purgate-ID: tlsNG-33051d/1776780266-A3161938-1411CCFA/0/0
X-purgate-type: clean
X-purgate-size: 3025
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,vates.tech:mid,vates.tech:dkim,vates.tech:url];
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
	NEURAL_HAM(-0.00)[-0.670];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 220F643BB98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.2489.c2540df3f714e6ac.19db05b4251.729abd03c36de791=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 26/02/2026 =C3=A0 14:23, Abdelkareem Abdelsaamad a =C3=A9crit=C2=A0:
> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the =
VMCB
> and handed off to the hardware=2E There is no need for the artificial tr=
acking
> of the NMI handling completion with the IRET instruction interception=2E
>=20
> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardw=
are
> accelerated feature when the AMD platform supports the vNMI=2E
>=20
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem=2Eabdelsaamad@citrix=
=2Ecom>
> ---
>   xen/arch/x86/hvm/svm/intr=2Ec | 6 ++++++
>   xen/arch/x86/hvm/svm/svm=2Ec  | 1 +
>   xen/arch/x86/hvm/svm/vmcb=2Ec | 2 ++
>   3 files changed, 9 insertions(+)
>=20
> diff --git a/xen/arch/x86/hvm/svm/intr=2Ec b/xen/arch/x86/hvm/svm/intr=
=2Ec
> index 6453a46b85=2E=2E112a393211 100644
> --- a/xen/arch/x86/hvm/svm/intr=2Ec
> +++ b/xen/arch/x86/hvm/svm/intr=2Ec
> @@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
>       u32 general1_intercepts =3D vmcb_get_general1_intercepts(vmcb);
>       intinfo_t event;
>  =20
> +    if ( vmcb->_vintr=2Efields=2Evnmi_enable )
> +    {
> +        vmcb->_vintr=2Efields=2Evnmi_pending =3D 1;
> +        return;
> +    }
> +
>       event=2Eraw =3D 0;
>       event=2Ev =3D true;
>       event=2Etype =3D X86_ET_NMI;
> diff --git a/xen/arch/x86/hvm/svm/svm=2Ec b/xen/arch/x86/hvm/svm/svm=2Ec
> index 18ba837738=2E=2E815565c33f 100644
> --- a/xen/arch/x86/hvm/svm/svm=2Ec
> +++ b/xen/arch/x86/hvm/svm/svm=2Ec
> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm=
(void)
>       P(cpu_has_tsc_ratio, "TSC Rate MSR");
>       P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>       P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
> +    P(cpu_has_svm_vnmi, "Virtual NMI");
>       P(cpu_has_svm_bus_lock, "Bus Lock Filter");
>   #undef P
>  =20
> diff --git a/xen/arch/x86/hvm/svm/vmcb=2Ec b/xen/arch/x86/hvm/svm/vmcb=
=2Ec
> index e583ef8548=2E=2Ee90bbac332 100644
> --- a/xen/arch/x86/hvm/svm/vmcb=2Ec
> +++ b/xen/arch/x86/hvm/svm/vmcb=2Ec
> @@ -184,6 +184,8 @@ static int construct_vmcb(struct vcpu *v)
>       if ( default_xen_spec_ctrl =3D=3D SPEC_CTRL_STIBP )
>           v->arch=2Emsrs->spec_ctrl=2Eraw =3D SPEC_CTRL_STIBP;
>  =20
> +    vmcb->_vintr=2Efields=2Evnmi_enable =3D cpu_has_svm_vnmi;
> +
>       return 0;
>   }
>  =20

What is the status of this ?

IIRC the main concern was regarding whether or not the vnmi_pending bit=20
requires to set the clean_bits=2E But it seems it is not the case here=2E

Do we have a official confirmation on that ?

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2489.c2540df3f714e6ac.19db05b4251.729abd03c36de791=---

