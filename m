Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E54B965C1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 16:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128461.1468805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14G4-0006XB-Mn; Tue, 23 Sep 2025 14:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128461.1468805; Tue, 23 Sep 2025 14:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14G4-0006Un-KE; Tue, 23 Sep 2025 14:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1128461;
 Tue, 23 Sep 2025 14:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqZy=4C=bounce.vates.tech=bounce-md_30504962.68d2b256.v1-94d0a8d6c86a4ea9abe15f9c011bd057@srs-se1.protection.inumbo.net>)
 id 1v14G2-0006Uh-LN
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 14:44:42 +0000
Received: from mail133-23.atl131.mandrillapp.com
 (mail133-23.atl131.mandrillapp.com [198.2.133.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ed65ca-988b-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 16:44:39 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-23.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cWN6Z1dV4z35hWC8
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 14:44:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 94d0a8d6c86a4ea9abe15f9c011bd057; Tue, 23 Sep 2025 14:44:38 +0000
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
X-Inumbo-ID: d4ed65ca-988b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1758638678; x=1758908678;
	bh=DmKrUPickkfvJc0Xd5IFkjipDk3pdqzLI+e+o4I2eTw=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=mc8170emKNIkM3mGb8gQcDPdPd1A8kH52GsDWtnWSSC/sQE7g7MEJzJwAJUA/ZXuP
	 qSofImjLVZJX/m/52PDkGGPny2osfvcdxkIGY/jzN1l7DK9TMPeMVoQ74asg4ZsNuK
	 3TXL/edI568Ut+DqK7Rml5TRtUsOm2SqXMcfx8sH1bMH4YjWyw4GaSRrqwRC6OKN7l
	 mvOHc/Jkr6GwFX3cPRZLiRzxMSEiORvdomlvzUeUv/wxA4mQHhGXpt5dPfou2tu50r
	 DpLUc1+1oQpg9PFv+sZc3uT9TqV1PYVCyJpzLoi/fzMUEOK5aLFtHNaEJTjCDAXq7T
	 97Z+gw/LttT7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1758638678; x=1758899178; i=yann.sionneau@vates.tech;
	bh=DmKrUPickkfvJc0Xd5IFkjipDk3pdqzLI+e+o4I2eTw=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=wGydgrOw8LAvnL/syjVh2IbE6dJG7HGd6WPY7Ns2KeqICWE4RXekby6QlYbDoawGq
	 QA2fiZlNi6CONxd0AUHjmM6lm2H7rpOryI6zd6ZS1K6UDl8zgc6EGSbtcyV2Aw8vbU
	 tjEhzYyIy3HxdNjVJxEhzFmSy1RxHZFBo8xci9cZZFZCAHZE1go7Ep0WfMqwmRCMc4
	 hhDTvV7ZSv+MRO7VCx2SV6lia+jA87auT5ylShLL23PLT9hdbq3m/9A2bK2HiN3R6M
	 2JD1YUhQ5xtM3Maj8nMnPYUdcBzGvz/WeZ3cmKqO4YgkzAtSFG5hWZhcldvQaL09GK
	 s7Fz+4oNalYcQ==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Xen=20Summit=202025=20-=20"Documentation=20Next=20Steps"=20design=20session=20notes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1758638676524
Message-Id: <68f987fb-4845-4811-b559-7999e283cf98@vates.tech>
To: "Xen developer discussion" <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.94d0a8d6c86a4ea9abe15f9c011bd057?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250923:md
Date: Tue, 23 Sep 2025 14:44:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Documentation Next Steps" 
(https://design-sessions.xenproject.org/uid/discussion/disc_Jp2T9yq2I3sH00t=
eD0CT/view) 
design session notes

Animated by Cody.

The documentation kind of exist=E2=80=A6
There=E2=80=99s the wiki but you cannot register: it=E2=80=99s deactivated.
We had to put a control system because some people were crashing the 
wiki content.
Cody : the technical documentation is being created in Sphinx
It=E2=80=99s hard to find getting started, documentation and guides.
It=E2=80=99s in the wiki but it also contain outdated documentation.
Problem of the wiki is that it=E2=80=99s not related to some Xen version.
Sphinx is at least tied to some Xen version.
The wiki also contains how-to=E2=80=99s, list of boards, things that don=E2=
=80=99t 
really make sense in xen.git but are helpful to people.
If we write pages on the website the number of person to contribute to 
this will be limited.
The website is in a git repo now 
(https://gitlab.com/xen-project/www-xenproject-org)
Some wiki pages are outdated because they are only valid for some 
versions of Xen.
We should have a getting started guide which is well maintained.
We could have some information in the wiki like specific getting started 
for some specific boards and then put the link to the wiki pages in the 
website.
Real documentation should not be on the wiki because it=E2=80=99s getting o=
ut of 
date and is not tied to Xen versions.
We should prevent people from writing =E2=80=9Cgit clone xen.git; make=E2=
=80=9D in the 
wiki, we should always provide branch/tags/sha1 so that the information 
stays true.
It=E2=80=99s OK to have some outdated info, it=E2=80=99s better than having=
 no info at all.
We need to write more doc/info.
Also, what do we put in the documentation for instance to explain how to 
put Xen on an RPI? Since we don=E2=80=99t maintain yocto meta-virtualizatio=
n.
How do we provide the domU?
We should have a user documentation auto generated from git repo (sphinx?)
So first we would need to convert current doc (in xen.git and some parts 
of the wiki) into sphinx format. Before then adding new content.
We need to link to the new sphinx doc in the website 
(https://xenbits.xen.org/docs/sphinx-4.20-testing/ for instance).
- need a list of supported boards, should be listed on the website
We should put some text in the getting started to say =E2=80=9Cif you have 
difficulties, please email xen-users mailing list=E2=80=9D


-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech





