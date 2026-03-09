Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOZqD27BrmmRIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:47:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0032239207
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249394.1546856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZcp-0003dR-O1; Mon, 09 Mar 2026 12:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249394.1546856; Mon, 09 Mar 2026 12:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZcp-0003bp-LS; Mon, 09 Mar 2026 12:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1249394;
 Mon, 09 Mar 2026 12:22:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jftE=BJ=bounce.vates.tech=bounce-md_30504962.69aebb6e.v1-638f3f823d7f4ab28270cf3473175c76@srs-se1.protection.inumbo.net>)
 id 1vzZco-0003bj-56
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:22:18 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9711b72a-1bb2-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:22:08 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fTx326qbkz2lL
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:22:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 638f3f823d7f4ab28270cf3473175c76; Mon, 09 Mar 2026 12:22:06 +0000
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
X-Inumbo-ID: 9711b72a-1bb2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773058927; x=1773328927;
	bh=pzRefWKHPO4gtPDK77mGxGQotz5Vl0Qyd4vFEZa7/Gk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=h5HANp9yM3I2+mqmE13/b7WJAI6z+2Osg38VIC3WcuQuGniRsk3eNugV4GJeBrX4n
	 7LIUkNNHC0vyCwf/RnoQ+AQacgA0CXTdz8Qr2wdG8zcEZe79nG+n4Y0F9LLMxJSj7Q
	 Mc4WS5QinrVUgapQU14QeS0HcaYJq/PePZf+0VhxePFFc4tVv5bH+3qijnBwCbl0zu
	 wNxP6jUWAIP/6FmWI24n1pp1gdz/O3Gfz4erZfR3WZYg41KSt9Dc5Qnh8gdk1E9L5U
	 wqNd0jsMKJOsl27Q3OmqEiGjDQBqMFkPDRZQV+0dF0KV1Cl2SL0BfO3WBiYl5l7TGE
	 rvdXYGhPWsdiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773058927; x=1773319427; i=anthony.perard@vates.tech;
	bh=pzRefWKHPO4gtPDK77mGxGQotz5Vl0Qyd4vFEZa7/Gk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=h/bygIiy1vv6mW5R3i8adcMxUnvv3MpjZ12soLwjk2tZelPqOvuNurLLvfv/x2gJz
	 thwOxa/c2lLdGUzB9o9FK3ne9jowZaqjuEJtz+Th5s+67PYID/qcxPxoGbPRv0JL5s
	 NZvBeFGkHRqdrxAizHrUk/VA57/njMJARJsLCI9WCpkdd7Yaq7m1upY2NCOIBA4VbJ
	 v+cYh/xbmOee2Wi9XthF4/yQjfLaBxHurzxKg3wGSMAzQ2HRB066mYjBwX4Ql+BYjW
	 v3pbJihYu364q2oKygi2pmBCgH3Btg7WNgMiJB/SCmvucXjb091ok9JMfYjKd5b6Yv
	 VdFA6Q3uJxzQw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6]=20xen/domain:=20introduce=20DOMID=5FANY?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773058924994
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Message-Id: <aa67bEWug18FDYwY@l14>
References: <20260307025451.3148078-2-dmukhin@ford.com>
In-Reply-To: <20260307025451.3148078-2-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.638f3f823d7f4ab28270cf3473175c76?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:22:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C0032239207
X-Rspamd-Server: lfdr
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
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.418];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 06:54:52PM -0800, dmukhin@ford.com wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index bfc9149096a3..79af2958d170 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -666,7 +666,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>          }
>  
>          for (;;) {
> -            uint32_t local_domid;
> +            uint32_t local_domid = DOMID_INVALID;

Surely, this change is unnecessary?

>              bool recent;
>  
>              if (info->domid == RANDOM_DOMID) {
> @@ -681,8 +681,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                      continue;
>  
>                  local_domid = v;
> +            } else if (libxl_domid_valid_guest(local_domid)) {

You meant to check `info->domid`, right?

> +                local_domid = info->domid;
>              } else {
> -                local_domid = info->domid; /* May not be valid */
> +                local_domid = DOMID_ANY;
>              }

Cheers,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


