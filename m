Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGYwBcOo4GlZkgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:15:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE5340C0EF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283162.1565444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIow-0001ow-8m; Thu, 16 Apr 2026 09:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283162.1565444; Thu, 16 Apr 2026 09:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIow-0001mr-5i; Thu, 16 Apr 2026 09:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1283162;
 Thu, 16 Apr 2026 09:15:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e0a8b1.v1-82e43376dfb5406f84713a8671625188@bounce.vates.tech>)
 id 1wDIou-0001mk-7p
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:15:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDIot-00Ffgz-HH
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:15:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e0a8b1.v1-82e43376dfb5406f84713a8671625188@bounce.vates.tech>)
 id 69e0a8ac-5cb7-0a2a0a5109dd-0a2a450a8c64-22
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:15:31 +0200
Received: from [198.2.186.1] (helo=mail186-1.suw21.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e0a8b1.v1-82e43376dfb5406f84713a8671625188@bounce.vates.tech>)
 id 69e0a8b2-56b3-0a2a450a0019-c602ba01bf5f-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:15:31 +0200
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4fxC695vYpzBsVSkP
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:15:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 82e43376dfb5406f84713a8671625188; Thu, 16 Apr 2026 09:15:29 +0000
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
	s=mte1; t=1776330929; x=1776600929;
	bh=ohAvvrLm3IUQdyZ7hOrFWGHujWkJJ6+dNNs/tzY22uo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SK2HpgGV3cM26uEHZ0CDPchzqH11+gukeoftOSf7yA7rneKiknJALaAlsDLDzj+u6
	 EsJg+YfkaZPJx1ydsEL4i5EKecSGBhZFRX8e/P4SMoiuctAdo7t7FBG1Zu7hAbyUef
	 6wjbHOB9DpSX/2lDx6+ctrmhoF0zLgkCDgKUkVodHpWndUM6zK/KOb6LxP7HUMJnp2
	 xXXgnNdXho/bkrbfYdmhwc33DqnH6Dgt+1Bb9tmVqIsXQZz5JGP5PrRBKat0mpV+hV
	 iszTOTX0MPx0xDFMcA/t+pqX0LMtf7GcziX8ac3WC6Slu8DMr5hG8eB1BiEQNVtqx7
	 RKKIn4D1LWQ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776330929; x=1776591429; i=teddy.astie@vates.tech;
	bh=ohAvvrLm3IUQdyZ7hOrFWGHujWkJJ6+dNNs/tzY22uo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=y6CN+Lr0oFqVaPOBFQnGm6DPeoettk7DJttH910jPZlsqylT+haSa534CXmj8LAyH
	 8RWqjaztWlzD0fj2inTc28WUCWb450FQx0Yn4MB9A/2EfjFrqceGqIqy6PkZ2VPGFp
	 7t0WCsDDGbUj4ms1HiYVWkO9LbU4BwxWnewUVcbne7+XoQow6Ekw6nKKIVk4dOdmRI
	 zS7+jYXrvOEUMOoIql+RuMbaVOibtxA2ka44kJM6kFghIzorcOl8uB9nKDsJwfGkBA
	 +xsvuFitNNibeHpc41haRZwE9h9C3buzKxvwI/JXHwZBwDxV2XBKbff3FoWyNT7vUC
	 RsusymWYW85pQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20vtd:=20Drop=20dead=20check=20for=20permissions=20in=20lookup=5Fpage?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776330928805
Message-Id: <70023321-c799-456f-920f-af7a7344de34@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech> <4f9e6615-b9ab-4c2e-9345-100e73eebbb3@suse.com>
In-Reply-To: <4f9e6615-b9ab-4c2e-9345-100e73eebbb3@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.82e43376dfb5406f84713a8671625188?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260416:md
Date: Thu, 16 Apr 2026 09:15:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1776330931-469768B7-8E67D747/0/0
X-purgate-type: clean
X-purgate-size: 1144
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.631];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9BE5340C0EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 16/04/2026 =C3=A0 10:23, Jan Beulich a =C3=A9crit=C2=A0:
> On 10.04.2026 12:09, Teddy Astie wrote:
>> `val` comes from `addr_to_dma_page_maddr()` which is a pagetable
>> paddr and doesn't leak the PTE flags in it.
> 
> Did you read the comment ahead of the function, in particular the part ab=
out
> the caller passing 0 for "target"?
> 

Ah ok, the "full PTE contents below PADDR_BITS limit" also includes the 
R/W flags, but only in that case.

While I'm on it, there is a corner case here where "full PTE content" is 
also at the same time a error condition of this function (if PTE mfn =3D=3D=
 
0, we have val < PAGE_SIZE; yet the mapping exists), but that's not the 
problem this patch is fixing.

>> Rather than returning entries without any permissions, assume they
>> are always r/w.
> 
> This wouldn't be any better.
> 

Not having any permission could confuse the caller that there are no 
mappings. But it depends mostly on the callers which don't exist yet.

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



