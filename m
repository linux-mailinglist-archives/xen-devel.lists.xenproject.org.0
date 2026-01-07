Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38175CFEF68
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197011.1514689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWoI-0008RQ-0K; Wed, 07 Jan 2026 16:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197011.1514689; Wed, 07 Jan 2026 16:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWoH-0008Pw-Tz; Wed, 07 Jan 2026 16:55:01 +0000
Received: by outflank-mailman (input) for mailman id 1197011;
 Wed, 07 Jan 2026 16:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w/oj=7M=bounce.vates.tech=bounce-md_30504962.695e8fdf.v1-6e096f620aff42e18a629b6854069a69@srs-se1.protection.inumbo.net>)
 id 1vdWoF-0008Pf-Ut
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:55:00 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9875ba4b-ebe9-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 17:54:57 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4dmYzz6BkQzK5vgL6
 for <xen-devel@lists.xenproject.org>; Wed,  7 Jan 2026 16:54:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6e096f620aff42e18a629b6854069a69; Wed, 07 Jan 2026 16:54:55 +0000
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
X-Inumbo-ID: 9875ba4b-ebe9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767804895; x=1768074895;
	bh=thHUAzP1js0oVbJpysXtYKJfwX2p4bisZFhZB3P7Ygk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=zevoEF3pYz5Hu4ejbm+pR7lbMR+6LTJdDtd97L2Mybp1VPsrkLBsXutzMCnP423oK
	 A4rpkT8WTMzs1fGRzuq1ZcaFTv1D2qMxFbPBiCaSNJ7O8c64Qk8BvNp56aSYCVgBLo
	 180EN+GyKS9oAjWYxzWQHSmXVZTrxD7kFmdDJu+1YFmod6SMj+hZyINtsjNUaZ8Mil
	 1c+wgfQ7TLLiRwmLW7EvcQm/zc2WfzxcK8Nru8tT2potSrXRd/2USyCzwU5T1/fJeJ
	 izVb/XucnR1BsSoiX/lMoccH2ZlNzm3BJbgdYdurBNxZNm4s00cu/+tUYvc/WwQkAm
	 FxX10ajnv2t3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767804895; x=1768065395; i=teddy.astie@vates.tech;
	bh=thHUAzP1js0oVbJpysXtYKJfwX2p4bisZFhZB3P7Ygk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=lnLZRWTwIqjmAF9gyZx8fIMiQ2UfJJH+CNyqTDa2nPgKIpuhhyVRH5MhJO0npj2Wa
	 5WDqglDJx0XVA4t8VP1HPxNCl0OTP7low2gdVLk6Rmgf1D2iRGfE/cnOl9bRRe8HHO
	 bRis/tgzkeKYcH8Xybq3W3jjIVJR7IYaF9y+hq3QMZsvFnALsuqSdkqfKiq56VasbY
	 ZsX76zoioZnMsJHJcue8rakVckhl4cIuOEBNV/qdXzcBQKSDYr4YXzGlOtbObV8qBH
	 ZaLhowHGNX+u+ZatYYv0ZukzncKrUlr1aMtxKodVzhr9gzHcQy6DFGqhjsPWw8gg7t
	 1bkZU6/DgHdTg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v1=200/2]=20x86/pci:=20MMCFG=20improvements=20and=20always=20use=20it=20if=20available?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767804894854
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <cover.1767804090.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6e096f620aff42e18a629b6854069a69?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260107:md
Date: Wed, 07 Jan 2026 16:54:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently, Xen uses legacy method to access the configuration space unless the
access cannot be made with it, where Xen fallbacks to MMCFG. This is not really
great, as MMCFG is more flexible and doesn't require a dedicated lock, so it would
be preferable to use it whenever possible.

Teddy Astie (2):
  x86/pci: Improve pci_mmcfg_{read,write} error handling
  x86/pci: Prefer using mmcfg for accessing configuration space

 xen/arch/x86/x86_64/mmconfig_64.c | 10 +++---
 xen/arch/x86/x86_64/pci.c         | 52 ++++++++++++++-----------------
 2 files changed, 28 insertions(+), 34 deletions(-)

-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


