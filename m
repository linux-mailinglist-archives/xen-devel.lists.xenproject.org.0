Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9ECA12364
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872358.1283312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY25h-0006tw-Qk; Wed, 15 Jan 2025 12:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872358.1283312; Wed, 15 Jan 2025 12:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY25h-0006sT-Nb; Wed, 15 Jan 2025 12:01:45 +0000
Received: by outflank-mailman (input) for mailman id 872358;
 Wed, 15 Jan 2025 12:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SrcS=UH=bounce.vates.tech=bounce-md_30504962.6787a3a4.v1-2b7afc3f0d0a4991a2d3cb57dfff2308@srs-se1.protection.inumbo.net>)
 id 1tY25g-0006sD-Av
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:01:44 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b6a374b-d338-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:01:42 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4NN49wjzGlsvph
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:01:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2b7afc3f0d0a4991a2d3cb57dfff2308; Wed, 15 Jan 2025 12:01:40 +0000
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
X-Inumbo-ID: 7b6a374b-d338-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736942500; x=1737203000;
	bh=dT6H1d3lSfM7i3eONNGGvJiawvNhcMTrSJaz4H8aMWY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Sgc22EjKIX9FTWzI+3UWNKgg+Wm3TXhi7MSl6ZNK13unT2T1ATGPcdT2ZW8sVC4Gt
	 +TsooqOwyA8plnW33vIZ6VShKdLg3r/kw4nVbulQLBJD8SShmk1pPFHp0kVf6p9EIG
	 1y/sWB7egdMR7dZZL8y56BHCg17uCVZXYT+8Esm1kLmMC+LQFu+blKkGIIPCFVHVQ4
	 SkJlOEu412zT489XhhA6layrFFVlrUPvQDlbMWx+QNPh08WyKvi5+W4cunZn7AZ3be
	 vgUtTt8qnP7WRgbwIZFKgk4mahCn/Y1QDvPppCo92F45VeNweWocAdzIQDo5zMiTiS
	 ohTO5FqarwwVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736942500; x=1737203000; i=yann.dirson@vates.tech;
	bh=dT6H1d3lSfM7i3eONNGGvJiawvNhcMTrSJaz4H8aMWY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=kMGS9TPx2qV8m34dW4GZLWAXy3atoejhrtE3bxei6O/ojBHrSbN1W2Os0gjoCGTPE
	 mr9RJ6+b/3/9RWiCURpXyEtKEK6e2IPeHmRiiXPQNWZ2DHAGX6LrJukGJsDJz+bLiF
	 H/Qsip6eztTFaRd4dGMoogckf8MvcgCRT38z8iqNW7tiSsQZDROaKud7EskjeNuUXG
	 6koHgRwy2Npj6nQzDAqTCQhaKJLGSt+D3noCfZ/L53f3IwjRU9zH8Lo6vkNdiVQUrb
	 UYumCVxaAXoY9bjpFHwI/kew2Fj/84Ojwyj+VIjJHkgkkhvA5txpPAz70JAqF28Pp7
	 NVzyJmLU9UjdA==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=200/2]=20trivial=20improvements=20to=20sphinx=20doc=20tooling?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736942499221
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <cover.1736941628.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2b7afc3f0d0a4991a2d3cb57dfff2308?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:01:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Yann Dirson (2):
  docs/sphinx: import sys for error reporting
  docs/sphinx: gitignore generated files

 .gitignore   | 1 +
 docs/conf.py | 1 +
 2 files changed, 2 insertions(+)

-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

