Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF59B3B7E4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 11:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101000.1454222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvs7-0005tU-Vi; Fri, 29 Aug 2025 09:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101000.1454222; Fri, 29 Aug 2025 09:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvs7-0005s1-So; Fri, 29 Aug 2025 09:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1101000;
 Fri, 29 Aug 2025 09:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJKp=3J=bounce.vates.tech=bounce-md_30504962.68b179b3.v1-9d6748b3d1f444049f5bcb91e5be475e@srs-se1.protection.inumbo.net>)
 id 1urvs6-0005rv-Qw
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 09:58:14 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acce3e57-84be-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 11:58:13 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cCtxb6lHpz2K1shq
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:58:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9d6748b3d1f444049f5bcb91e5be475e; Fri, 29 Aug 2025 09:58:11 +0000
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
X-Inumbo-ID: acce3e57-84be-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756461491; x=1756731491;
	bh=WWdk2dSq9KosXLKOsHAPyY2hgXMKmQ9ttyuq2XmwRuc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=UP2JGhvR/fQHCcjulhFUtzIxIw62FpTTVsp1600JMzVaBDjD531uYeCX2D9DlWnts
	 AwaEJBp8Mjz/4U3vAHPuvqYy/IVO41ahcWPHNFjyd3tPffE4I8dHD4Brrk77KR7i7T
	 bkjmC0miMRpUZu5RShvfogzHxE5l35gCjtoPAn8xlD1lgjrDtxJvFV74Goug1u6uif
	 WBuvczJOfIuMO5/dToQ8duho1TfooC8d1yedLfnWRJ541RRuyKukdJueGXIUJb2oeH
	 MpAnup0LlHmwdNqvWYxzpOZdfd+/gzi0wkwRn3ClXs71bvxg7S4U/GE19pdzVFiLI+
	 zVOMNCwh1g0dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756461491; x=1756721991; i=teddy.astie@vates.tech;
	bh=WWdk2dSq9KosXLKOsHAPyY2hgXMKmQ9ttyuq2XmwRuc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=JsGpwzKASDZoKJrtcInYe4fSRWz7bLjWbSYIg7N8Q5JdCaNX+N1N7nRTPgv3F3gmi
	 KWw0YeGVEZ0Or+FoNRSGiVzHe7XF78/8GkQAndHCTLhIdpQy4IY6wtN7nHdHql/WpO
	 5GeRDgfYMs4vw/ROYlWSqfxfuZXEyT1Cj+nvugmXy/e0lR/NUGtoRKt6LBhP7KPmkt
	 qT3+XFxcXuc/h07apkAtcewP5LaWvOk7BXgKpoiy77tZH/3QrMwqWtTulA+zPmfqzK
	 TCD0I0RXehkoBIqOw/54Q5MQVllBwQ9KUTuqYX8MxcLqZOHQG4J0tQl4C//Ddw3dza
	 hgxWKJYGGA8sQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RESEND=20PATCH=20v2=200/3]=20Update=20to=20SMBIOS=202.6?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756461490277
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <cover.1756460430.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9d6748b3d1f444049f5bcb91e5be475e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 09:58:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

First patch clarifies the Xen guest handle definition as being a big
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


