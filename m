Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F7C0FA0C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 18:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151698.1482254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDQzR-0002h3-Pk; Mon, 27 Oct 2025 17:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151698.1482254; Mon, 27 Oct 2025 17:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDQzR-0002ei-MZ; Mon, 27 Oct 2025 17:26:41 +0000
Received: by outflank-mailman (input) for mailman id 1151698;
 Mon, 27 Oct 2025 17:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ym1g=5E=bounce.vates.tech=bounce-md_30504962.68ffab49.v1-067f4abfdae24386913dabdb34f3bf1b@srs-se1.protection.inumbo.net>)
 id 1vDQzP-0002R5-SL
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 17:26:39 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 167b652c-b35a-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 18:26:36 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cwL5j5ldfzBsThqt
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 17:26:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 067f4abfdae24386913dabdb34f3bf1b; Mon, 27 Oct 2025 17:26:33 +0000
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
X-Inumbo-ID: 167b652c-b35a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761585993; x=1761855993;
	bh=1nrAjCCsJDTL8+q5w1d+Usd1KVZTaIlpHPrgdwOze5k=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=dmwW/0ckmNdFrOQJ1Di4/ofnTuPhjTueOQRmuYLMTNox+LIQVyAUBEvzftmy9t4n5
	 UHmn1/xAaXhMokB7ISB8o5abL442qKtPxjfVnTWr3vs2Jnxl7njhnsMFZlt7FhF5qZ
	 wRIDnm/6AKAVOCu9yjx+W0lQ6JH4RxbbRZT16AcZjOQy9DeHXsd6U1+mGfaeFx65H/
	 qc2U9I8g6P12KCr8ENbA+sjNNTGpkUCqOGmzokczlPfxRlUYDaSS6FJp3vDwdqq95U
	 87JCTgeahUx5DwQc9bLVAJwCEuhlIN2YBG9ovImkuYuVi1Bsm767mm2M+LnobIJVfv
	 Yq4cW8A+zzz3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761585993; x=1761846493; i=teddy.astie@vates.tech;
	bh=1nrAjCCsJDTL8+q5w1d+Usd1KVZTaIlpHPrgdwOze5k=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=zTOO1gcmBx6+U9IeXZVIiFt27yfeZglQ/JJ4DO3+VFUovx/YSrN1kGc20e8DJGZRn
	 VmE8y1JGnjHUTRMkwYL/LVy5u7SLXmVpcJmSlh0YD1hdHoNtqnVtt/ZQ+1MFztG70f
	 zs7hzc7Wm0y0ptl1/07YefEN9MEG1wtBOiqI+lCgAVZrl8zbumJcm013K2hd+OrIZI
	 Zfp49s+dUeddVMqTBapN+rMeEeZaH2maynSwAxX6/VE3Z1YqK9V1aun0GB45DjW3Bh
	 pEDnnFeRu7Tf5lFy8+5scXt6QiNYmqFe9SDZ+1gymmz+eoMvwrHfU+ZaXTAPONoS7O
	 Gi2qoWLfaJG4A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=200/2]=20Support=20for=20Intel=20temperature=20sensors=20(DTS)?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761585992748
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <cover.1761585640.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.067f4abfdae24386913dabdb34f3bf1b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251027:md
Date: Mon, 27 Oct 2025 17:26:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The idea here is to expose the DTS sensors through XENPF_resource_op
and introduce a new dedicated tool to expose it for the user.

Teddy Astie (2):
  x86/platform: Expose DTS sensors MSR
  tools: Introduce xen-inteltemp tool

 tools/misc/.gitignore                |  1 +
 tools/misc/Makefile                  |  4 ++
 tools/misc/xen-inteltemp.c           | 98 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr-index.h |  2 +
 xen/arch/x86/platform_hypercall.c    |  6 ++
 5 files changed, 111 insertions(+)
 create mode 100644 tools/misc/xen-inteltemp.c

-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


