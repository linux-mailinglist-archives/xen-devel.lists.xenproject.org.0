Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1+HhwMxWma5wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:36:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98093337D9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263677.1555547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5i4E-0005V0-0s; Thu, 26 Mar 2026 10:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263677.1555547; Thu, 26 Mar 2026 10:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5i4D-0005TB-TH; Thu, 26 Mar 2026 10:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1263677;
 Thu, 26 Mar 2026 10:35:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c50c09.v1-38453f29c1f54d709fc67d17b81deba1@bounce.vates.tech>)
 id 1w5i4C-0005T5-35
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:35:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5i4B-003rm6-4f
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:35:55 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c50c09.v1-38453f29c1f54d709fc67d17b81deba1@bounce.vates.tech>)
 id 69c50c07-5cb7-0a2a0a5109dd-0a2a450b83b4-22
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:35:55 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c50c09.v1-38453f29c1f54d709fc67d17b81deba1@bounce.vates.tech>)
 id 69c50c09-ef63-0a2a450b0019-c602b42f94d0-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:35:54 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fhKtd2ZbRzPm3LJk
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 10:35:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 38453f29c1f54d709fc67d17b81deba1; Thu, 26 Mar 2026 10:35:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="ngoc-tu.dinh@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774521353; x=1774791353;
	bh=WIPzkTYKJTJ92I5bcFxtZV5gAYnq1t+9C/BGbsdU/3U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iGZccFErGAEj8jrYRRu3kytNnMrIvi3KRtjOj/wQWDbA0nexQTJy9+Eid1X1Ygm17
	 rZSdxa0XGM78ovOYa0PgTtRmFjXtgHYV01LmT8/pTaxScsr5EXL7IZnWBudy2Ord2F
	 2tFiTz6z951RcrQf463HPJRjJtKk5T9uLKJS5hnR6rvROobxAgZneZbqfAnxflpeiZ
	 ZJ197CCCb08J1jVzWmJuXB9qA3u9s0WjE44C4vYTeBg04k7wBiH/86BskfDXHSxvdn
	 lcfdK2Mgd8scAE4kGllMO/p0lxpmSbffUy7tlYX8540Fy9GgpkCk238/zQYAMzgaOH
	 tkoj+8CNi0mAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774521353; x=1774781853; i=ngoc-tu.dinh@vates.tech;
	bh=WIPzkTYKJTJ92I5bcFxtZV5gAYnq1t+9C/BGbsdU/3U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=izaGL37dR8/AWkgQk2v5ZUhImf/Mc56tcRtkBmDlkeFNfcDAMebzi8gaDcRU2bwx6
	 MxspkZ9Tz4eT6qrRhcntsiFr3oS8iqwyY550lKuHpsFvWsUn74aoOwF70cVUQpX/Ox
	 58M4iXQUHgFh4fBS1BKvfolUv4Ez6ipLavAJS/cagIeKLv85kLytP73qO4i7O+UpZY
	 ZHuezqeEnwCTulvRP+HhxZkOA5eFCF7KB59AWdfqk0V3WC87HSS8zjnsRU1wKQ0mCa
	 trjalWFm2K2LwNw+Fi4L1+4hENlosLubcyMt6KZ/eM3pc74YKmtk7+AF1oTXKC7uYJ
	 KbxvyMXfalshA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20x86/intel:=20Add=20recent=20CPU=20models=20model-specific=20LBRs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774521352167
Message-Id: <975b6883-646d-4db4-b931-b21c45d0507b@vates.tech>
To: "Teddy Astie" <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <888b0df36c6706de9d7ec1c5c4cc229297699670.1774519884.git.teddy.astie@vates.tech>
In-Reply-To: <888b0df36c6706de9d7ec1c5c4cc229297699670.1774519884.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.38453f29c1f54d709fc67d17b81deba1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260326:md
Date: Thu, 26 Mar 2026 10:35:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1774521354-988BD112-63802A27/0/0
X-purgate-type: clean
X-purgate-size: 2887
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xcp-ng.org:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.917];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C98093337D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 11:21, Teddy Astie wrote:
> Add all CPU models that supports these MSR as they are defined in Februar=
y 2026 SDM.
> It uses the same list that span from Skylake to latest CPU models as a pa=
rt of
> 
>      MSRs in the 6th=E2=80=9413th generation Intel=C2=AE Core=E2=84=A2 pr=
ocessors,
>      1st=E2=80=945th generation Intel=C2=AE Xeon=C2=AE Scalable processor=
 families,
>      Intel=C2=AE Core=E2=84=A2 Ultra 7 processors, 8th generation Intel=
=C2=AE Core=E2=84=A2 i3
>      processors, Intel=C2=AE Xeon=C2=AE E processors, Intel=C2=AE Xeon=C2=
=AE 6 P-Core
>      processors, Intel=C2=AE Xeon=C2=AE 6 E-Core processors, and Intel=C2=
=AE Series 2
>      Core=E2=84=A2 Ultra processors
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Currently, none of these MSR are exposed on these CPUs, leading to BSOD [=
1]
> in Windows when it is supposedly trying to debug some program.
> 
> I guess [2] is also caused by these missing MSRs.
> 
> [1] https://xcp-ng.org/forum/topic/12008/application-on-vm-causing-bsod
> [2] https://lore.kernel.org/xen-devel/ced16fca-3b55-40a1-a7e2-ffadd970739=
4@vates.tech/
> 
>   xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 

I don't think CPU models with architectural LBRs should be stuffed 
together with the model-specific ones instead of having their own case.

With that said, short of fully implementing arch LBR, it might make 
sense to at least stub out the LER MSRs to allow Windows to read them 
without crashing, as certain versions of Windows use LER MSR indexes 
without checking the arch LBR CPUID bit.

> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 82c55f49ae..98a25ce301 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -541,10 +541,26 @@ static const struct lbr_info *__init get_model_spec=
ific_lbr(void)
>           case 0x8c: case 0x8d:
>           /* Tremont */
>           case 0x86:
> +        /* Saphire Rapids */
> +        case 0x8f:
>           /* Kaby Lake */
>           case 0x8e: case 0x9e:
> +        /* Alder Lake */
> +        case 0x97: case 0x9a:
>           /* Comet Lake */
>           case 0xa5: case 0xa6:
> +        /* Meteor Lake */
> +        case 0xaa:
> +        /* Granite Rapids */
> +        case 0xad: case 0xae:
> +        /* Sierra Forest */
> +        case 0xaf:
> +        /* Raptor Lake */
> +        case 0xba: case 0xb7: case 0xbf:
> +        /* Lunar Lake */
> +        case 0xbd:
> +        /* Emerald Rapids */
> +        case 0xcf:
>               return sk_lbr;
>           /* Atom */
>           case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



