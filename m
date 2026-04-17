Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HADEiT24Wn50AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 10:58:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827C418FE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 10:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284050.1565983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDf1B-0006wt-Hl; Fri, 17 Apr 2026 08:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284050.1565983; Fri, 17 Apr 2026 08:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDf1B-0006vR-Eu; Fri, 17 Apr 2026 08:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1284050;
 Fri, 17 Apr 2026 08:57:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e1f601.v1-5bc42f588c204b238698d215908a218c@bounce.vates.tech>)
 id 1wDf1A-0006vL-0n
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 08:57:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDf19-00G32z-86
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 10:57:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e1f601.v1-5bc42f588c204b238698d215908a218c@bounce.vates.tech>)
 id 69e1f5f7-e002-0a2a0a5209dd-0a2a4502db6c-36
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:57:39 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e1f601.v1-5bc42f588c204b238698d215908a218c@bounce.vates.tech>)
 id 69e1f601-af86-0a2a45020019-c602890b55f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:57:38 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fxpg50Zn1zDRZ7PB
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 08:57:37 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 5bc42f588c204b238698d215908a218c; Fri, 17 Apr 2026 08:57:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776416257; x=1776686257;
	bh=DW2l/jc+ZEcxNJuiNNbXqKEtvirgVWtkF8VjCPX3hh4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zYyjDc/3zFNXCrXm7VHZe7ylB4ai+L0Br+8/PG2vPyMor6V/MQQ14Nud2ofmm3w6D
	 MkCFL0rZC+S4014Wap5zCH2vgORObnE/X11men32PKDOgtUHON7oC94/bAk2/bGjEu
	 cPae1qwzid9wVKPbSjZnViGpBWKdf0dEB5Vail8C7HEC7lUdsoIMH6U9EL+Qui2oTK
	 Eu+idol4i/g3Rs9jdLua5PRTgMZWR/aEWBxsshrvs6gNlb32aYbrxyWp8b+udvXQCF
	 SO25K72mQgWOfbDJKGBDVAmBi2KTyjBnax+VW87PYg77vKVwKyd1+azxVxC31sprXn
	 VgZXL4PB4YrPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776416257; x=1776676757; i=anthony.perard@vates.tech;
	bh=DW2l/jc+ZEcxNJuiNNbXqKEtvirgVWtkF8VjCPX3hh4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Gp5wfOtHgiSAk3yA568oHC1o4YiofkHKaBTYC4a8Fm4bZOdaCqjYbvLwARcHVIfWO
	 EHlEJ/siS/wDnIZfF5N+SNEJnJYI0kyC7y7eyQztz1yA96LQOcDaXzV1EJPkNZ7lMe
	 4+LJxrOWz0fO6Rvj5hmIozJuiXdezTbVnEGLxtnnZHrLT4CTeJeVsLmYi0O8du8JB/
	 P4mCSbhZncXC7F/AHeXqAS2oAjmucE3g56K5CR7bg+tkHjk7Hozotws+Ldz4C4JRW4
	 P8OUnZwU5vJp9DPPyd02pQFpqY4M1dk+yEpCsiMhiJ38AFxAr6Hvi7fBaj1HkaGmKY
	 k+eDKFZeJ4twA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v10]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776416256345
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>
Message-Id: <aeH1_5V71IQCbgCI@l14>
References: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
In-Reply-To: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5bc42f588c204b238698d215908a218c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260417:md
Date: Fri, 17 Apr 2026 08:57:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1776416259-B3762161-4279913A/0/0
X-purgate-type: clean
X-purgate-size: 774
X-Spamd-Result: default: False [5.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.862];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0827C418FE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 02:10:37PM +0000, Teddy Astie wrote:
> +    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_cor=
e )
> +    {
> +        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +        {
> +            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - %=
s)\n",
> +                    cpu, errno, strerror(errno));
> +            continue;
> +        }
> +

A trailing whitespace was introduced here since v9.

> +        has_data =3D true;
> +        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
> +    }

Beside that, patch looks good to me now:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



