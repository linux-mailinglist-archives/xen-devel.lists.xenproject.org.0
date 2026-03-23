Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CIEIBA0wWm7RQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 13:37:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A32F203E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 13:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259271.1552573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4eDG-000431-24; Mon, 23 Mar 2026 12:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259271.1552573; Mon, 23 Mar 2026 12:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4eDF-00040g-Ug; Mon, 23 Mar 2026 12:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1259271;
 Mon, 23 Mar 2026 12:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/Ak=BX=bounce.vates.tech=bounce-md_30504962.69c12f2f.v1-a5e3975b30d84401bdaa110970505a20@srs-se1.protection.inumbo.net>)
 id 1w4eDD-00040a-VT
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:16:52 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7bb2cb-26b2-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 13:16:49 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffXGR3sYrzPm14yr
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:16:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a5e3975b30d84401bdaa110970505a20; Mon, 23 Mar 2026 12:16:47 +0000
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
X-Inumbo-ID: 2a7bb2cb-26b2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774268207; x=1774538207;
	bh=vtzE71XAUj4mlCbmZ2v6MGX3kySlZN51bKY0UKkBOkI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pJdoeWeRvo/gCOCYVPJpVb2wqPoG8BLMrVNGGViexcpE3RP7iNpJmIUIc17l/FFNi
	 sakkMwcldNf1B9JocJQ46SMjAvJlYdo73CDQdnnWYaCRh6Z0O6HFXymzWdw+dujzKX
	 hhNjwxozeIqh8W9ijiJbuR32ByEz1nPXPUJOMHN2GOIVDRD0GCL22lTo7On5QaXAm0
	 XVuvNdsWLasoI2jaXdbUdHqilQ73/gxZDrOsvG7CQOu1mXuPg+bte3T/g43nl6ysvB
	 3wyepCLhn8Sv0DAy6UKL7Qz3U3HjBKcsZ4A7S9TWlxY/9qhDwH/X7MhQ1m1BadijPa
	 VNS9ic+3k8QXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774268207; x=1774528707; i=anthony.perard@vates.tech;
	bh=vtzE71XAUj4mlCbmZ2v6MGX3kySlZN51bKY0UKkBOkI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pqv//eQzGyr4Dl7OgNnTnWJ5giFfmulSwllqedpYdUTu/VubJhyKnZcV9Q2u4/OlU
	 zNGxlY70RA75Kb6MpU2Fx48Tb9OrjGAy5gr17v5WvM2T2pYc4cdvFjDUWAaGbTbrU4
	 qsbBzxdhrcDGyXma8WtPopw1lXAXZt9vov9Bja5TXBKLGlTETxxqcM+9/eRgTlPWuf
	 7aXgSPL4ZdXZzq8EzXwBg4rI0mTrDw15V8zzFflw4kKis089RjINcpDEYkDiFLfBE7
	 xIGnn2MkVQDBBIl6VxlMaWP/nlc/w4zxvltw+1XgFyCm0dv6FKmVtdjC5nhSQ1/bno
	 LZicl/njPE9kA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2001/12]=20tools/libs/store:=20add=20get-=20and=20set-quota=20related=20functions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774268206650
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <acEvLoRZmZjv9Fma@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-2-jgross@suse.com>
In-Reply-To: <20260320150120.874878-2-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a5e3975b30d84401bdaa110970505a20?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 12:16:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,suse.com:email,vates.tech:dkim,vates.tech:email,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 182A32F203E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:01:09PM +0100, Juergen Gross wrote:
> Add functions for getting and setting Xenstore quota to libxenstore:
> 
> xs_get_quota_names(): get the names of the supported quota.
> 
> xs_get_global_quota(): get the value of one global quota.
> 
> xs_set_global_quota(): set the value of one global quota.
> 
> xs_get_domain_quota(): get the value of one quota of a domain.
> 
> xs_set_domain_quota(): set the value of one quota of a domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


