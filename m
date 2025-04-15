Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF65A89FC9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953970.1348339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gad-0004s5-9w; Tue, 15 Apr 2025 13:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953970.1348339; Tue, 15 Apr 2025 13:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gad-0004pt-7I; Tue, 15 Apr 2025 13:44:39 +0000
Received: by outflank-mailman (input) for mailman id 953970;
 Tue, 15 Apr 2025 13:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLvy=XB=bounce.vates.tech=bounce-md_30504962.67fe62c3.v1-84483b1d263f403a989b997c43abbb9e@srs-se1.protection.inumbo.net>)
 id 1u4gac-0004pm-85
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:44:38 +0000
Received: from mail177-19.suw61.mandrillapp.com
 (mail177-19.suw61.mandrillapp.com [198.2.177.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4ef24c2-19ff-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 15:44:36 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-19.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZcQPb26W7z7rf
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 13:44:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 84483b1d263f403a989b997c43abbb9e; Tue, 15 Apr 2025 13:44:35 +0000
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
X-Inumbo-ID: c4ef24c2-19ff-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744724675; x=1744994675;
	bh=MCsoCxHbYJkH5KgeS0K29SAhmNRAB9ySh3cZ7Gq7Avg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=16qX+mqZnC6VE0K4BZpkDLvu8ktiec/I8qAiccA7tjy0TbpLtOf2YJpwhEj7H7WX8
	 Aqy15HlQjSHlRzBOVNYBqo+A9zYbq0pKT/Gfd1HM9DJchgbWFUXxG9GgViT7rTuqoC
	 UQI9JAIHrZntNXB1+ZcJXyHIvcNsEhj5ZNZHnAR149atJv3CDYPnDbqzXPz1viIXhp
	 OiJBXNB6Pk+DjUrg0H8SejOmds55E6dy8lePkXxc4HYWB7hQBEKGWrLUcgzbMJdFE2
	 q8z6F1ffVsuFndnQsV9o8GR/HNpMDgWaZKbaICyYMB72qxA/KeT/xXROwpY36CAYxG
	 wK7DM/TmGjG+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744724675; x=1744985175; i=teddy.astie@vates.tech;
	bh=MCsoCxHbYJkH5KgeS0K29SAhmNRAB9ySh3cZ7Gq7Avg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qg/PL29d6au8ayywlnM9c/7ZdfumyXVikaKJe7EuZCtsE38VsCo14CJLdGGbdkL28
	 CfnIp7ALlrehCIZ48IF4TVz8fZ6e6JGDIom85qguuspHFrJq7cAptMaajagLIqPDZ0
	 6pzM/yrlEO7lJrF/81rYUGjrfYncFuOzYwHWcZveXjK1rG2Pl799jQh2pJcd57fDIg
	 cFzp65EGWnC/HCIP9G79Brarnp4SQDQc0E/k4cQ+tND/2CXzU+oTwf+/iyvsEROQYk
	 OjqgXZ4oa1kkmTic45OdHE/CEV7+5kECJ63MrNxVrKnD498zjBFddbY0lD/dYdkIPb
	 cdU5Ya7YXofyQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/shadow:=20Fix=20UBSAN=20in=20hvm=5Femulate=5Finsn=5Ffetch?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744724674217
Message-Id: <b46eae31-04b8-46b0-a102-df7e45b995aa@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Tim Deegan" <tim@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech> <fa03d268-4175-4315-87af-0203104635c8@citrix.com>
In-Reply-To: <fa03d268-4175-4315-87af-0203104635c8@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.84483b1d263f403a989b997c43abbb9e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250415:md
Date: Tue, 15 Apr 2025 13:44:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 15/04/2025 =C3=A0 15:02, Andrew Cooper a =C3=A9crit=C2=A0:
> Which compiler are you using?=C2=A0 (Just so there's a record.=C2=A0 Thes=
e reports
> are version-sensitive.)

It's GCC 14.2.0.

> 
> Do you know precisely which condition is being hit?

It occurs when booting OVMF (PVH and HVM) with HAP=3D0.
It doesn't seem to occur with SeaBIOS or PVH GRUB though.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



