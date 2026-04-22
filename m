Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH35FVzW6GlJQwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:08:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FB44712C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290641.1570193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYFK-0004ag-Mc; Wed, 22 Apr 2026 14:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290641.1570193; Wed, 22 Apr 2026 14:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYFK-0004Xs-JP; Wed, 22 Apr 2026 14:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1290641;
 Wed, 22 Apr 2026 14:08:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@swg.vates.tech>)
 id 1wFYFJ-0004Xm-E1
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:08:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYFI-00F59Y-NT
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:08:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@swg.vates.tech>)
 id 69e8d627-2eae-0a2a0a5409dd-0a2a450b9098-36
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:08:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@swg.vates.tech>)
 id 69e8d644-212f-0a2a450b0019-b9ff1c22b0bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:08:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db584dbc0000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Apr 2026 14:07:56 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8C9A4874C4;
 Wed, 22 Apr 2026 16:07:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=U/O52EMYDG9BkfcUKNlOTjcARL9Tp0yR3Eawkx9V5AU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=t0WvHTaOEyyIwQiXfk+KHYaen36zacYGZW11Uq8bEX3IZUo+D2M9cE/u0rXbMBJb0eJnWujdo
 Up9sh6/XsglbOP8z1mO0Kjxs8WFIrT1hqq/TD742rBsaJ646AlwdbmF2677OYgdBCDlOCtSf5EL
 igIBqSabhj7lyJEpwfZJAWdcZsg6fNmBToNdeyH14AX46Ep1gHl6YpXlvORK7o40QVLzwnslh9N
 YyMyNFMDxoZkunuHWcGGseqa70UAeOmFcI1BqEYGDr8XhzNNb6JQSi4v0lgP1Dxc8GLn0MAAB2K
 BGHipxw4S3UitJaKuA+t6hIAOP4aiVfrNliNO5mKl1ng==
X-Zone-Loop: 3c13f8e142c1ba25486a9c0469e6ddc7296e9c8c80bb
x-campaign-type: default
x-transaction-id: 52209e87-3a29-4ffd-a534-0b9761ee4b1f
x-swg-uid: 01-eedb9e38-ae11-4177-a258-4a048fa3bbc8
X-Mailer: Sweego
Message-ID:
 <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
x-swg-bid: 1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 22 Apr 2026 16:07:55 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v7] xen/domain: introduce DOMID_ANY
References: <20260408234046.1314021-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408234046.1314021-1-dmukhin@ford.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.25bc.af5ba2750434f175.19db584d979.3ffb772d6e87de25=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776866875773
X-purgate-ID: tlsNG-42698a/1776866884-7EB70F3B-8430A055/0/0
X-purgate-type: clean
X-purgate-size: 2991
X-Spamd-Result: default: False [-0.17 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,ford.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B10FB44712C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.25bc.af5ba2750434f175.19db584d979.3ffb772d6e87de25=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 04:40:46PM -0700, dmukhin@ford=2Ecom wrote:
> From: Denis Mukhin <dmukhin@ford=2Ecom>=20
>=20
> Add a new symbol DOMID_ANY to improve the readability of the code=2E
>=20
> Update all relevant domid_alloc() call sites and harden the domid_alloc(=
)
> input value check=2E
>=20
> Also, fix problem with passing invalid domain IDs in
> XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
> uses 0xffff as domain ID=2E
>=20
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford=2Ecom>
> ---
> Changes since v6:
> - fixed libxl_domid_valid_guest() check in libxl_create=2Ec
> - Link to v6: https://lore=2Ekernel=2Eorg/xen-devel/20260307025451=2E314=
8078-2-dmukhin@ford=2Ecom/
> - CI: https://gitlab=2Ecom/xen-project/people/dmukhin/xen/-/pipelines/24=
38790748

Unfortunattly, this patch breaks tests in tools/tests, see
    https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/pipelines/2471=
684142

The tests produces this:

    Running /usr/lib/xen/tests/test-mem-claim
    Memory claims tests
    Free pages: 3059012, Oustanding claims: 0
      Domain create failure: 17 - File exists
    FAILED: /usr/lib/xen/tests/test-mem-claim

    Running /usr/lib/xen/tests/test-paging-mempool
    Paging mempool tests
      Domain create failure: 17 - File exists
    FAILED: /usr/lib/xen/tests/test-paging-mempool

    Running /usr/lib/xen/tests/test-resource
    XENMEM_acquire_resource tests
    Test x86 PV
      Domain create failure: 17 - File exists
    Test x86 PVH
      Domain create failure: 17 - File exists
    FAILED: /usr/lib/xen/tests/test-resource

    Running /usr/lib/xen/tests/test-tsx
    TSX tests
      Host: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL =
0
      Got 16 CPUs
    Testing MSR_TSX_FORCE_ABORT consistency
    Testing MSR_TSX_CTRL consistency
    Testing MSR_MCU_OPT_CTRL consistency
    Testing RTM behaviour
      Got #UD
    Testing PV default/max policies
      Max: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
    Testing HVM default/max policies
      Max: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
    Testing PV guest
      Domain create failure: 17 - File exists
    Testing HVM guest
      Domain create failure: 17 - File exists
    FAILED: /usr/lib/xen/tests/test-tsx

At least, the domid test passes :-)
    Running /usr/lib/xen/tests/test-domid
    PASSED


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.25bc.af5ba2750434f175.19db584d979.3ffb772d6e87de25=---

