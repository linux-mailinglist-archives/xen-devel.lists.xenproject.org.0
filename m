Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OvsIYXskmml0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:08:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F81423AD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233879.1537236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvW7-0002Mk-3j; Mon, 16 Feb 2026 10:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233879.1537236; Mon, 16 Feb 2026 10:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvW6-0002Jj-WD; Mon, 16 Feb 2026 10:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1233879;
 Mon, 16 Feb 2026 10:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fHBT=AU=bounce.vates.tech=bounce-md_30504962.6992ec6a.v1-049ca1a42eb34f78b13ecf3ea395e659@srs-se1.protection.inumbo.net>)
 id 1vrvW5-0002Jb-NN
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:07:45 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5317b1a0-0b1f-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:07:40 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4fDz3Z1QMdzCf9KRq
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 10:07:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 049ca1a42eb34f78b13ecf3ea395e659; Mon, 16 Feb 2026 10:07:38 +0000
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
X-Inumbo-ID: 5317b1a0-0b1f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771236458; x=1771506458;
	bh=Lb0HJ4esRwdSgy7GSFwaHnP6y8gxW0LOU9R9teu79Xg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Esl4p7Q5KVYOGUWFt8C4u0Klz8jW/5RS4KGnMIUdZ8T7d5eppuzozfntCC6I51+rd
	 3X/kuSf+Ht10c9H5MQu8mgMIpj6JE6aOCQJtXeiNoHQ7oEb+HgoM6K7tbEkPvAjpGs
	 0OJnHJXAwFDw1+GDMT8+hA11uxgCqREJVkhiAOl4oz9txuJUzLW1FnOD5CPzguWq8e
	 GT+PostBFewIEWA5hOetWkxkb/OnGGHWiOAe22+SGN9AzXcDKXPXzET56w9pgBn7ux
	 comdXvzw8x3mkxEpLSjIpfrwWlAMOOFZiTeFObP5lCkcp+KcKdW6ACHVkix6CQUXl0
	 x0NFXaK4EMy/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771236458; x=1771496958; i=teddy.astie@vates.tech;
	bh=Lb0HJ4esRwdSgy7GSFwaHnP6y8gxW0LOU9R9teu79Xg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yUAgE9xhEOsYutouyMF8RuDxGDF4N3315SDjnay9j7+pzg8D3I3yNoIef9Z3LPDis
	 mK9eJtmSm/8XiXO9jQyKCm90/+iBtMVAy9qaDfPms9EQ0DU7nUCTTsqUzgJQYp4Sp6
	 C77wXFt/4uPDEHnlKAeWw89lmhe5RLzSQHY9KYO3J5kfGZgEJmkNXHmF8qMkLrUlZB
	 +ADP9GbCeHw4k4BSQsQJviEBw/hQIh2QFrRPP6KFLLGzIyPlk5U2kfLDhSAB33Ys9q
	 aUFuJQKKFMGSRH8KwQWlNt0PXdxnGsDdTxwy8Xif7mC8o5oOB5GxZC+WCiLBRw7jFR
	 JY5AWS3PGA6SQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/2]=20x86/svm:=20Use=20the=20virtual=20NMI=20when=20available?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771236456833
Message-Id: <c0c2e0cd-173a-496f-a643-7d19c9418a2a@vates.tech>
To: "Abdelkareem Abdelsaamad" <abdelkareem.abdelsaamad@citrix.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, "Jan Beulich" <jbeulich@suse.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com> <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
In-Reply-To: <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.049ca1a42eb34f78b13ecf3ea395e659?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 10:07:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:url,vates.tech:dkim,citrix.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
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
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CA4F81423AD
X-Rspamd-Action: no action

Le 15/02/2026 =C3=A0 19:24, Abdelkareem Abdelsaamad a =C3=A9crit=C2=A0:
> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the V=
MCB
> and handed off to the hardware. There is no need for the artificial track=
ing
> of the NMI handling completion with the IRET instruction interception.
> 
> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardwa=
re
> accelerated feature when the AMD platform support the vNMI.
> 
> Adjust the svm_get_interrupt_shadow to check if the vNMI is currently blo=
cked
> by servicing another in-progress NMI.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.co=
m>
> ---
>   xen/arch/x86/hvm/svm/intr.c | 9 +++++++++
>   xen/arch/x86/hvm/svm/svm.c  | 5 ++++-
>   xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 6453a46b85..3e8959f155 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>       u32 general1_intercepts =3D vmcb_get_general1_intercepts(vmcb);
>       intinfo_t event;
>   
> +    if ( vmcb->_vintr.fields.vnmi_enable )
> +    {
> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
> +            !vmcb->_vintr.fields.vnmi_blocking )
> +           vmcb->_vintr.fields.vnmi_pending =3D 1;
> +
> +        return;
> +    }
> +

I think you need to update the clearbit for tpr (related to vintr) for 
the hardware to know that you modified the vnmi_pending bit.

This is done through vmcb_{get,set}_vintr in your case (this will also 
allow simplifying all the vmcb->_vintr).

You need to do something like

vintr_t intr =3D vmcb_get_vintr(vmcb);
...

if ( intr.fields.vnmi_enable )
{
   if ( !intr.fields.vnmi_pending && !intr.vnmi_blocking )
   {
     intr.fields.vnmi_pending =3D 1;
     vmcb_set_vintr(vmcb, intr);
   }
   return;
}


>       event.raw =3D 0;
>       event.v =3D true;
>       event.type =3D X86_ET_NMI;
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..3dfdc18133 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -548,7 +548,9 @@ static unsigned cf_check int svm_get_interrupt_shadow=
(struct vcpu *v)
>       if ( vmcb->int_stat.intr_shadow )
>           intr_shadow |=3D HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
>   
> -    if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
> +    if ( vmcb->_vintr.fields.vnmi_enable
> +         ? vmcb->_vintr.fields.vnmi_blocking
> +         : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET=
) )
>           intr_shadow |=3D HVM_INTR_SHADOW_NMI;
>   
>       return intr_shadow;
> @@ -2524,6 +2526,7 @@ const struct hvm_function_table * __init start_svm(=
void)
>       P(cpu_has_tsc_ratio, "TSC Rate MSR");
>       P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>       P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
> +    P(cpu_has_svm_vnmi, "Virtual NMI");
>       P(cpu_has_svm_bus_lock, "Bus Lock Filter");
>   #undef P
>   
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index e583ef8548..e90bbac332 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -184,6 +184,8 @@ static int construct_vmcb(struct vcpu *v)
>       if ( default_xen_spec_ctrl =3D=3D SPEC_CTRL_STIBP )
>           v->arch.msrs->spec_ctrl.raw =3D SPEC_CTRL_STIBP;
>   
> +    vmcb->_vintr.fields.vnmi_enable =3D cpu_has_svm_vnmi;
> +
>       return 0;
>   }
>   

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



