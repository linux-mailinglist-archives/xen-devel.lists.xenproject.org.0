Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM/yCn5vnWk9QAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:29:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD29D1849A8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239611.1541007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoj3-0000fu-3E; Tue, 24 Feb 2026 09:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239611.1541007; Tue, 24 Feb 2026 09:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoj3-0000e1-0G; Tue, 24 Feb 2026 09:29:05 +0000
Received: by outflank-mailman (input) for mailman id 1239611;
 Tue, 24 Feb 2026 09:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cbIO=A4=bounce.vates.tech=bounce-md_30504962.699d6f59.v1-46a639a02fe14996b3b88983f3acca86@srs-se1.protection.inumbo.net>)
 id 1vuoj2-0000dv-Ef
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:29:04 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ec6e299-1163-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 10:28:58 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fKsqF2SBJz705l40
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 09:28:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 46a639a02fe14996b3b88983f3acca86; Tue, 24 Feb 2026 09:28:57 +0000
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
X-Inumbo-ID: 3ec6e299-1163-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771925337; x=1772195337;
	bh=04YoqKiKHQcMfVq+TVh0j4NzIw104UMWK3IitvuKzl0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Km0ZJD/k5KL9QuwPaBmPq9fPlf2SRzANMSCzzC9qqcJ69VJzQYHNkRTfAyDeYu/WW
	 VELcgZCC60bY9zhRBbTrskuUSkY+GrHXoaugKZKyfG+hpeG+txUgbrZ5W5VDFrt01b
	 NREHEOZ9MOSDP7NZg9/Yq69F6YQxDFyIPKjpcg6p4GXx9RsnFnQrFQRHXT8fQKRCdH
	 kPn0+kF4n//wpQDDOShb9ADvmSDrKAIHQpPmNBwwnDibMcCsxhvvTCg1J42mgwcF0E
	 J+X+NNX2zvnAdDfM/bzo/nH6ulrESeqJpd78bUGS4fzX9iA6vFu6AkZvGHp23m+g59
	 zd9y/H3HCDkIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771925337; x=1772185837; i=teddy.astie@vates.tech;
	bh=04YoqKiKHQcMfVq+TVh0j4NzIw104UMWK3IitvuKzl0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=htVWx7MJs0biJMP8naC0CA04G2xmh6zGj/xIMoDn3acbgwhAGy5F9SAf/b0VrfB+n
	 e8F5ZhXRBc/fTj7+o8HzNv4jnbptXLQU1w/mcktpLGfluIFM+xf8tQN4ow4HNqmpUv
	 KwlU5dbqQ8Ub8duW5Iz70Ln3XC2yKRnPWRf7zRQooZe+Jd+CCb4Mkn5Q5vw70sRFs8
	 UtsBprPK9uvuOdKMPyEEfh3yv/9ts/IHPVGa7NoJd/P0dpKtahRMViX0R0V2u0kUOy
	 w2mQgbZZCu0YerGmeZwkrKDioRTJGfTftmNS4SyT8Jz2NIzCNGbyeZOuMOkLLB1hh5
	 dUy6u6IJ74vpw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v7=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771925336678
Message-Id: <f569a8f0-8df9-4e5a-b3ed-ae600c3c0bd3@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech> <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com>
In-Reply-To: <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.46a639a02fe14996b3b88983f3acca86?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260224:md
Date: Tue, 24 Feb 2026 09:28:57 +0000
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:mid,vates.tech:url,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.730];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CD29D1849A8
X-Rspamd-Action: no action

Le 23/02/2026 =C3=A0 17:15, Jan Beulich a =C3=A9crit=C2=A0:
> On 23.02.2026 17:06, Teddy Astie wrote:
>> xc_report_op returns -1 in some error conditions.
>> Make sure it returns -ENOMEM in out of memory errors and -EINVAL
>> in invalid usages errors.
> 
> Isn't this a move in the wrong direction? -1 as a return value is quite o=
kay.
> errno wants setting to indicate the cause of the error (if called functio=
ns
> don't already set it properly).
> 

To me, passing error through errno here feels more like a workaround 
rather than a proper error handling. It doesn't feel consistent in libxc 
overall (some functions returns a negative value corresponding to a 
error number while some others -1; in some cases we update errno).

What are the error handling rules for xenctrl ?

> Also nit: s/xc_report_op/xc_resource_op/ .
> 

ack

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



