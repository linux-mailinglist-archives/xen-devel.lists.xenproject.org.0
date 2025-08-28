Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5FB39F41
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098893.1452835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcv6-0000Vn-9A; Thu, 28 Aug 2025 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098893.1452835; Thu, 28 Aug 2025 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcv6-0000SS-69; Thu, 28 Aug 2025 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1098893;
 Thu, 28 Aug 2025 13:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eAWs=3I=bounce.vates.tech=bounce-md_30504962.68b05d1f.v1-0a5675d16cee438c9c6b712c18ac4b49@srs-se1.protection.inumbo.net>)
 id 1urcv4-0000IL-N6
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:44:02 +0000
Received: from mail187-26.suw11.mandrillapp.com
 (mail187-26.suw11.mandrillapp.com [198.2.187.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d61ceaf-8415-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:44:00 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-26.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cCN0b3W1bzKsbkbp
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 13:43:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0a5675d16cee438c9c6b712c18ac4b49; Thu, 28 Aug 2025 13:43:59 +0000
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
X-Inumbo-ID: 0d61ceaf-8415-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756388639; x=1756658639;
	bh=my3luyqKo2dZnHOOYOj+LdonnR4q/KH6ynAakgWYZ8I=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=zDvxCdIec3aaPPDdt6kwOZ/KVkLBPI5vbUSPzTaPPswPIBRzcfC8CGz1nT0mShtV8
	 HjlVw9E1Rx4r6ghMJoJP7AxsoX0Ohnpmjx/nfHqg2YzaM/743a0Bu/r8GJUm3kHISC
	 J/mXeexqiz2A2YHJdXYSqKndPXcn1NZXZV1prtWu2KRezLILDDie7wH3inhtXH2ywE
	 rayMvR0XDSCqFoci4lW/ktAJN7Cs26b9YG99d6ByNWtnXYV5m6GJ1TDgYflE9ZhHLO
	 EM8qyXp1rxcs2/lhoIIpVvjlFkQmdFC/O/ud7HoZJZsqRf/4PW9/mVmJNOZ6LRWiXu
	 q7kZnPpfY4caQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756388639; x=1756649139; i=teddy.astie@vates.tech;
	bh=my3luyqKo2dZnHOOYOj+LdonnR4q/KH6ynAakgWYZ8I=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=H8JdT3M7jl+nUX9YOQVPe5U3PqRSm1kh5dKYlaXWmZiXzggMLZgm1lCDhDLhagzZb
	 DAF7xnhAdnqr4umqjAm7OXvnNbJwG13MeEkEqWH5sNvzQ0yORSBhJwyZ2tesqb8KBD
	 xsdYPhPUnh9H54qG81t9hw+6Dp5V1Zce8i6xVANmRtB3aMtnnQPjwWNsbEAL0jxQDF
	 6ZN9YB0s2a/gpOSO7omABMMoSqaZieMqtrXsMmFgZkZ07qUPwYZPqDMqriin7MotQ/
	 DJ85ta/K1LeC6b0Ob3I/4uh8htIZNeFyaVd2Jwfvuuo5gIN3C1/Tj6u36D1+RwMrcS
	 8LFeBTUFBtSOQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=200/3]=20Update=20to=20SMBIOS=202.6?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756388637901
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <cover.1756388405.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0a5675d16cee438c9c6b712c18ac4b49?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 13:43:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

First patch clarify the Xen guest handle definition as being a big
endian UUID. The second does update to SMBIOS 2.6, writing a proper
UUID in the table.

Teddy Astie (3):
  xen: Define xen_domain_handle_t encoding and formatting
  hvmloader: Update to SMBIOS 2.6
  CHANGELOG.md: Add SMBIOS 2.6 update statement

 CHANGELOG.md                            |  2 +
 tools/firmware/hvmloader/smbios.c       | 50 ++++++++++++++++++++-----
 tools/firmware/hvmloader/smbios_types.h |  9 +++++
 xen/include/public/xen.h                |  7 ++++
 4 files changed, 59 insertions(+), 9 deletions(-)

-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


