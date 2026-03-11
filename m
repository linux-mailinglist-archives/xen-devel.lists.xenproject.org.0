Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHafOmScsWnkDAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 17:46:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114D26785E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 17:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251342.1548525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Mgd-0005wB-Ot; Wed, 11 Mar 2026 16:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251342.1548525; Wed, 11 Mar 2026 16:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Mgd-0005t6-Im; Wed, 11 Mar 2026 16:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1251342;
 Wed, 11 Mar 2026 16:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7+k=BL=bounce.vates.tech=bounce-md_30504962.69b19c21.v1-91755ee142c24cf09d14820a48502e98@srs-se1.protection.inumbo.net>)
 id 1w0Mgc-0005sz-BL
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 16:45:30 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2353a73-1d69-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 17:45:23 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fWGns1qR4z38C
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 16:45:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 91755ee142c24cf09d14820a48502e98; Wed, 11 Mar 2026 16:45:21 +0000
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
X-Inumbo-ID: b2353a73-1d69-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773247521; x=1773517521;
	bh=sF4mymys6HAdkw0w5HfIbDG7JT5KWKQV9kEANluIkKo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M4SXMsT4bI7OMHpjo6LlMptingu/us1dYII8J6C73OlHhtcIsUJ8McFoo3u02yPtZ
	 U1rBnznU53xx3xmaiCuN5FFFXLfbyW3FNX+uNNSyJgX86AHEaTxiuAwDazqqRUGW1U
	 q3OzHVngsTFJ4ShODeUJq+ZFDeIEZQg9ybitwqKgSSjjgPaQ/++ae//PLH/eAdhb97
	 d1IKfOBhrJoGLco7gNEIm+sFchGMpd/hM4hs1RMbMT08/xWLS+A+BUtb2Sb8DVDLOO
	 MBH0T1SnpNMwg1bp62EAwPlsExVjIPhgXmm/b1ew+J2QdOEHX0TnM1mxX6ofLdlp2O
	 0nYPW8EEs6TMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773247521; x=1773508021; i=anthony.perard@vates.tech;
	bh=sF4mymys6HAdkw0w5HfIbDG7JT5KWKQV9kEANluIkKo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qWbqT8GoBdfavENknNPEKsyiiDPye6BhIAUmwJXI3qtc9Mbn1S9BnJkRDZV7pghV9
	 M+TQqB8scXcgKvc39HWKdMo5JrQ3eyELwR7Pwm/kN/wAk3C1yI7wE28y0ewAzeZ/YN
	 cigWWSP2BqWWq8gFfYDM4ZHfaItDBBSyXfVDq/ThjAo+UP54cgv8qKJjQRYUZ9869u
	 31ZtQKH+Y6MowrMvafKfl/ehpvLMmp4WvO1ForSa7cvl1h96McipczlO+rZRtmtoTI
	 ORYN1wxIewkCOLtRgOenOT3TQCYSrd1n3YeF0uVNksIVU3IxyTtmza5mwqoH+Xt/Di
	 hiDpvUNUZlF1Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=202/2]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773247520247
To: "Jan Beulich" <jbeulich@suse.com>, "Teddy Astie" <teddy.astie@vates.tech>
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, xen-devel@lists.xenproject.org
Message-Id: <abGcHzCpY_Y7kq9r@l14>
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech> <aadf2e78f91f442964cc4e93c028b6b31fceb9eb.1772211384.git.teddy.astie@vates.tech> <7380cf63-e9ac-4df9-9633-c26f9de0027a@suse.com> <4c18413b-6296-4a30-bbec-561f7b802cbc@vates.tech> <d7419a76-4c9a-4741-b738-9a4bdbfb0dd0@suse.com>
In-Reply-To: <d7419a76-4c9a-4741-b738-9a4bdbfb0dd0@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.91755ee142c24cf09d14820a48502e98?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260311:md
Date: Wed, 11 Mar 2026 16:45:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [5.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.966];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9114D26785E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 03, 2026 at 12:54:28PM +0100, Jan Beulich wrote:
> On 03.03.2026 11:50, Teddy Astie wrote:
> > Le 02/03/2026 =C3=A0 17:52, Jan Beulich a =C3=A9crit=C2=A0:
> >> On 27.02.2026 18:00, Teddy Astie wrote:
> >>> +            printf("No data\n");
> >>> +            exit(ENODATA);
> >>
> >> In how far is using errno values as arguments to exit() a useful thing=
? (I
> >> think you had it like this before, and I merely forgot to ask.) Yes, I=
 can
> >> see the tool using a number of exit(EINVAL), but I don't understand th=
ose
> >> either. This way you can't even document easily what particular exit c=
odes
> >> mean, as the errno values may vary across OSes.
> >>
> > 
> > I reused the exit(...) pattern used in xenpm, but I'm also fine by 
> > returning simpler errors (like exit(1) or exit(EXIT_FAILURE)).
> 
> Anthony, can you please suggest which one better fits the toolstack as a
> whole?

There isn't really one, but `exit(EXIT_FAILURE)` would be more
explicit.


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



