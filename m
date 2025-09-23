Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C67B964C5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 16:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128442.1468797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1481-0004uV-Qf; Tue, 23 Sep 2025 14:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128442.1468797; Tue, 23 Sep 2025 14:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1481-0004rK-Mc; Tue, 23 Sep 2025 14:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1128442;
 Tue, 23 Sep 2025 14:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQ3Z=4C=bounce.vates.tech=bounce-md_30504962.68d2b065.v1-acfe7957fc674b7d9a61cb1cffdd2e0d@srs-se1.protection.inumbo.net>)
 id 1v1480-0004qp-Ma
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 14:36:24 +0000
Received: from mail133-23.atl131.mandrillapp.com
 (mail133-23.atl131.mandrillapp.com [198.2.133.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ace9e44f-988a-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 16:36:23 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-23.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cWMx156Ljz35hVQg
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 14:36:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 acfe7957fc674b7d9a61cb1cffdd2e0d; Tue, 23 Sep 2025 14:36:21 +0000
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
X-Inumbo-ID: ace9e44f-988a-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1758638181; x=1758908181;
	bh=P8Oo8nkljt7Riu6h2XQ7dGEmIIPy5qgKPXON1CCjxu8=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=KH0qq21wYlv9MJxG7UOF14O2z9zy/k9r5K2xbVPY7OOErADjJvS2AK1LvHiHfIeSB
	 80BjF1trS+KLXxtu2SBD/iK5rqlAPACyQ5oNSIQgqq6ioriqVSkL+eBrQ03930iyWT
	 xn0UUJ/XarDP14Fnagmu9SMHSrVAN+axEy1t8go+tlc+oQx4hIX+4A3SpjlhktRh3i
	 woyu3g1Rh2N7vVtcn6Iljjgalf750jmwZJk5UZ33kbS6lWxBEq4Zlf5pmhJSOnH2jy
	 foWKjiavbNzCo6cP7WzfcN1QV05FKXnTM3/1RURWv48pkVR39tV++XmoqG6L+zd6cG
	 8Wnyrsv66qGPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1758638181; x=1758898681; i=yann.sionneau@vates.tech;
	bh=P8Oo8nkljt7Riu6h2XQ7dGEmIIPy5qgKPXON1CCjxu8=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=i965NleXoj797NhDg/X+66HXon8aS/JPpPBMtLn+P9QN7xH8SQJhANKmlzJ39CgiW
	 wA6eHi/t90p3X7XcECCtZhSUZEtq3nI4csA9tNJ2ZHUNh5BKwFFEPOo//pX0aOw8uD
	 vHSuGE2/5Ptmtn9EciXnaOW5sV9WxTDih4Q6lUQjpYeLhkAv3X13fvS2JSF9KlkBjC
	 uVINRL5mCQBbcJ/C1pC86Ib3IsjVXKMhfpznSxiNs5KFDkhBn0EV2PpuWnQFTGKtlN
	 eVjb8MwpUxPW132jpww2Qc8nOecR9sFLd4AwRzjWS7uOI59p4LCTw8fVi/cmMHcBOJ
	 ilu7dRXlHEN8w==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Xen=20Summit=202025=20-=20"x86=20Nested=20Virtualization=20-=20Project=20Plan"=20design=20session=20notes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1758638181050
Message-Id: <de45d1c8-5740-430f-8e9e-7517cc4b8254@vates.tech>
To: "Xen developer discussion" <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.acfe7957fc674b7d9a61cb1cffdd2e0d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250923:md
Date: Tue, 23 Sep 2025 14:36:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Here are my notes from this design session: 
https://design-sessions.xenproject.org/uid/discussion/disc_ADNniRk2YcQ1wMOZ=
eMXc/view

I apologize for it being partial and maybe containing errors, it was not 
an easy task for a non-native speaker as well as someone who does not 
know the topic of nested virt.

####################
Wednesday 17/09

Nested Virt It=E2=80=99s going to be a requirement for windows in a couple =
of years.
Let=E2=80=99s present the bigger picture plan, how to break it down and how=
 
people can help
Also maybe prioritizing

*A break down in small pieces is shown on screen*

Feature prep :
Nested virt is a huge undertaking
Few bits are optional
In theory it=E2=80=99s just a couple of instructions
It=E2=80=99s easy to implement wrong and create security vuln
Idea is to try and have each small piece have testing (XTF?)

cpuid/msr it=E2=80=99s an old topic, we are struggling to finish this
we don=E2=80=99t have a good way of controlling the features in the hypervi=
sor
There is a lot of code that assumes that all VMs are configured the same 
way.

We need to control all nested features per domain

Lot of other work to do : hvm fixes.
Lot of work that is not actually nested virt related
Some is deleting code which is great.

Mostly it=E2=80=99s not integration with the emulator that causes most work
XenServer goal is to get VBS to work (Virtualization Based Security)
(Windows using HyperV underneath)
An issue is that Windows, if it sees that virt is available it could 
turn anything on.
It makes assumptions that a group of features are available in one group.
To make windows happy it will demand quite a number of features available
making WSL2 working is smaller than making VBS working according to Andrew.
Viridian nested work has to be proven to work safely, this is a 
performance improvement, it=E2=80=99s not a priority. However you really wa=
nt it 
because otherwise perf are bad.
=3D> Make existing code work towards our need
I=E2=80=99m not quite sure how much we can use existing code (Jan)
Some pieces will definitely need rewriting
NMI handling, breakpoint handling are broken
We have bugs to fix wrt to MSR: the check for the bitmap is in the 
generic hook
We need to fix them (bugs) in order not to have security vuln in the 
nested virt case

Maybe focusing on one vendor first (intel vs amd) to have it out more 
quickly?
AMD has 50 controls, intel has ~500.
If we look at AMD first =E2=80=A6 it would help to have something out
90% of the work is common.
Teddy : Nested paging handling is not in the shown breakdown
How do we transition from the old way of nested virt to the new one?
Would it be ok to send a patch to ditch the old way?
Andrew : I don=E2=80=99t think we want to slowly move from the old to the n=
ew
Andrew : I think we should rewrite from scratch, and by someone actively 
ignoring current code.
Andrew : we should remove code and put the new one in a single release
If we are building feature by feature it should be doable
Andrew : if we do it in 1 release we should put the removal of 1 feature 
and the restoration in one patch series.
Running hypervisor that are not Xen , on top of Xen, should be part of 
the testing
Today most likely only Xen on Xen works because their assumptions do align.
XAPI testing for instance uses a lot nested virt to just spin up lots of 
Xen and do pool join etc

Conclusion: let=E2=80=99s do a first basic working solution running on 1st 
generation hardware, from scratch.

####################

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech





