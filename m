Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CDQOA7tkmml0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:10:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932D1423E9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233887.1537244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvYP-0003sv-E5; Mon, 16 Feb 2026 10:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233887.1537244; Mon, 16 Feb 2026 10:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvYP-0003qh-BI; Mon, 16 Feb 2026 10:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1233887;
 Mon, 16 Feb 2026 10:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d2+i=AU=bounce.vates.tech=bounce-md_30504962.6992ecfb.v1-e6d671088aef4fc5bdd57de1b735a54e@srs-se1.protection.inumbo.net>)
 id 1vrvYN-0003qZ-KL
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:10:07 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b50ce1-0b1f-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:10:05 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fDz6M4mqDzPm0Pbr
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 10:10:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e6d671088aef4fc5bdd57de1b735a54e; Mon, 16 Feb 2026 10:10:03 +0000
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
X-Inumbo-ID: a9b50ce1-0b1f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771236603; x=1771506603;
	bh=YYYWtuztqZnncXo8BQHMwSQpsyveH5UOHs5LQ1mAG5g=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jyZTRI8XvQywc9CvDlfom5K6rXwdJS5orRlZhr6qhSREAd5SkU0MTchjoodLgMSXK
	 2Aw322X0ZNZnqrz1iLi4qI/n1r8Sa7J4FR5gMl6z0i5VgO2LloE5xHnB/pwmi+Mr1f
	 XKbB4ybUe6Zq791mXYJcX0qjnQpJtsVQiHdZmOgKoe0p9zPYHXJDt2MSOeCYoxUjT3
	 u/0dxyo/VtBGz9P7ZmhP2hVuyi3I0qbtDOZRArdcmLdvEWfTPRD4BcZ5crNAyCFE8+
	 XH0Tn7LW0kM2zDI+7No0UpNlThNeHpiqlraPbds4pWYXm17AjuAXNB7kBzzrdZQ2fy
	 V8bkv3G4SVUmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771236603; x=1771497103; i=teddy.astie@vates.tech;
	bh=YYYWtuztqZnncXo8BQHMwSQpsyveH5UOHs5LQ1mAG5g=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BYB3BUa9e2iXjKI0VW1tIqyvRjE71sTUuLwlyCI7vbdLaQ6nmM2RDisskAzjay0A8
	 I5nZ7skJgcNOWRBtdPerLiYYSifSRUgq6JIVw9ACXBjOTHKhVN60UzUfMEU/UkLTdB
	 SkdbLfgSh3B4wUOycrh8xcjZNFcQso0W/sFcYelrlNzJFJqxYuhSZO2scntl2UjSVi
	 j/jWNQWwhZW06LtCy/6R1g/l29b9Jzrw+6v2+P9CBC+SEvPDjwn6wDKZ0852xztONB
	 QPMjuWjYqVbrBl+2hleR7F0QmrZP7ZrmrZn9h5w/E2uBcn5Q/L/Zzb2tvsLlq6+5lA
	 8b6GIw5Z04Saw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=201/2]=20x86/svm:=20Add=20Enumerations=20for=20the=20SVM=20virtual=20NMI?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771236602239
Message-Id: <ade32796-361b-45c2-adea-30d10b28ad99@vates.tech>
To: "Abdelkareem Abdelsaamad" <abdelkareem.abdelsaamad@citrix.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, "Jan Beulich" <jbeulich@suse.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com> <8b09eece639ba9cdff0d259e0941f7ef3dae7701.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
In-Reply-To: <8b09eece639ba9cdff0d259e0941f7ef3dae7701.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e6d671088aef4fc5bdd57de1b735a54e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 10:10:03 +0000
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email];
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
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8932D1423E9
X-Rspamd-Action: no action

Le 15/02/2026 =C3=A0 19:24, Abdelkareem Abdelsaamad a =C3=A9crit=C2=A0:
> Introduce the cpuid bit for the SVM vNMI feature support for the x86\AMD
> platforms. The feature support is indicated by the CPUID
> Fn8000_000A_EDX[25] =3D 1.
> 
> Add defines for the three SVM's Virtual NMI (vNMI) managements bits in th=
e
> VMCB structure's vintr_t:
> 
> vintr_t(11) - Virtual NMI is pending.
> vintr_t(12) - Virtual NMI is masked.
> vintr_t(26) - Enable NMI virtualization.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.co=
m>
> ---
>   xen/arch/x86/hvm/svm/vmcb.h        | 8 ++++++--
>   xen/arch/x86/include/asm/hvm/svm.h | 2 ++
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index 69f6047394..047483db9a 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -336,13 +336,17 @@ typedef union
>           u64 tpr:          8;
>           u64 irq:          1;
>           u64 vgif:         1;
> -        u64 rsvd0:        6;
> +        u64 rsvd0:        1;
> +        u64 vnmi_pending: 1;
> +        u64 vnmi_blocking:1;
> +        u64:              3;
>           u64 prio:         4;
>           u64 ign_tpr:      1;
>           u64 rsvd1:        3;
>           u64 intr_masking: 1;
>           u64 vgif_enable:  1;
> -        u64 rsvd2:        6;
> +        u64 vnmi_enable:  1;
> +        u64 rsvd2:        5;
>           u64 vector:       8;
>           u64 rsvd3:       24;
>       } fields;
> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/as=
m/hvm/svm.h
> index 15f0268be7..a35a61273b 100644
> --- a/xen/arch/x86/include/asm/hvm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm.h
> @@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
>   #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
>   #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>   #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
> +#define SVM_FEATURE_VNMI          25 /* Virtual NMI */
>   #define SVM_FEATURE_BUS_LOCK      29 /* Bus Lock Threshold */
>   
>   static inline bool cpu_has_svm_feature(unsigned int feat)
> @@ -57,6 +58,7 @@ static inline bool cpu_has_svm_feature(unsigned int fea=
t)
>   #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE=
)
>   #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
>   #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL=
)
> +#define cpu_has_svm_vnmi      cpu_has_svm_feature(SVM_FEATURE_VNMI)
>   #define cpu_has_svm_bus_lock  cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK)
>   
>   #define MSR_INTERCEPT_NONE    0

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



