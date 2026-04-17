Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLyPOCbv4WmKzgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 10:28:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F5418A39
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 10:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284033.1565974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDeY1-00034j-CH; Fri, 17 Apr 2026 08:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284033.1565974; Fri, 17 Apr 2026 08:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDeY1-000336-8d; Fri, 17 Apr 2026 08:27:33 +0000
Received: by outflank-mailman (input) for mailman id 1284033;
 Fri, 17 Apr 2026 08:27:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e1eef1.v1-d79241642dce4e9989a7f4075f540953@bounce.vates.tech>)
 id 1wDeXz-000330-Qs
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 08:27:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDeXz-001e7M-70
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 10:27:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e1eef1.v1-d79241642dce4e9989a7f4075f540953@bounce.vates.tech>)
 id 69e1eef0-5cb7-0a2a0a5109dd-0a2a450392b8-4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:27:31 +0200
Received: from [198.2.187.30] (helo=mail187-30.suw11.mandrillapp.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e1eef1.v1-d79241642dce4e9989a7f4075f540953@bounce.vates.tech>)
 id 69e1eef1-672d-0a2a45030019-c602bb1e841a-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:27:30 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-30.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fxp0K45NQzP0Jmqd
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 08:27:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d79241642dce4e9989a7f4075f540953; Fri, 17 Apr 2026 08:27:29 +0000
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
	s=mte1; t=1776414449; x=1776684449;
	bh=p3fjiuwfEK2kqAivumZFHwViDj4gbcyHBsUQ9+3dGDE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OilPVXUa+qoG5253jXpeN4VbE22ZGxpqK1do9w75brvI5ASSokIy60DwPcvy7IGlj
	 cKopAJg0h0pNEASS2rHkUBhi6C8WV4yJ4ldLAyzqmozXmvhM6MB4ktBqr3il2ak0EO
	 dBW1PPFr3LRwRSjH6WYyU+sogU3O3SrBbD31uywKuk/REMNvTMvKBzZw9qb7z7Yit/
	 XIKDY4SQ5WauvbMJUv/r8NiV2dCeQaX3Z3+Cv5D60vCMk3NJCmv1X/gSnEgO/RUQhw
	 FBCIFl+jNa6yaC7YW8HD/sOltEHRyK4eEdN1jwxmU25HU3Eh0kSdfyjunz/oJKiTtQ
	 V1zlUjkl+e0vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776414449; x=1776674949; i=anthony.perard@vates.tech;
	bh=p3fjiuwfEK2kqAivumZFHwViDj4gbcyHBsUQ9+3dGDE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=grGijPalEVVQxzdMg/cygjHALXHktuZCyhczeyuf2UxHNbm7twhF2DFJ5DcMW/7DU
	 Jz2EdMUXbDIKBshw4SEPfW+cB6uCraDECTWTzT+ycOxzK0rH8SQ06zYx4O6tSOorxZ
	 t8K21fL0M1bbzWfk85HItnDXPHXKuGDayvA4pPTbOqk1ZVeSE05GmDoAOahzlyfuYr
	 FEs4BRoD+qr4oE7BeN7Y3sc6NVAUzCSI1RXznNd5vRzMGo4YC01BSYsxaOxWcsE9lN
	 XnNxJhHHZbHeZ4rT/dExzU3YrOOX9YWges8Dbpa90dz/cgMUOuv9/w4Abyhqll/U+V
	 rrLP/7Vf9exPQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v7]=20xen/domain:=20introduce=20DOMID=5FANY?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776414444332
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Message-Id: <aeHu69fCYs_2NFR4@l14>
References: <20260408234046.1314021-1-dmukhin@ford.com>
In-Reply-To: <20260408234046.1314021-1-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d79241642dce4e9989a7f4075f540953?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260417:md
Date: Fri, 17 Apr 2026 08:27:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776414451-29D7B938-2A7DF26C/0/0
X-purgate-type: clean
X-purgate-size: 788
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.679];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AD0F5418A39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 04:40:46PM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add a new symbol DOMID_ANY to improve the readability of the code.
> 
> Update all relevant domid_alloc() call sites and harden the domid_alloc()
> input value check.
> 
> Also, fix problem with passing invalid domain IDs in
> XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
> uses 0xffff as domain ID.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

And I believe stefano's review would still apply, right?

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


