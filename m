Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6FA875978
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 22:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690041.1075677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riLT4-0007lV-OX; Thu, 07 Mar 2024 21:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690041.1075677; Thu, 07 Mar 2024 21:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riLT4-0007in-Ly; Thu, 07 Mar 2024 21:39:58 +0000
Received: by outflank-mailman (input) for mailman id 690041;
 Thu, 07 Mar 2024 21:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtTi=KN=bounce.vates.tech=bounce-md_30504962.65ea3428.v1-69ea55a8c2a44cbeb47edb7fbc9fa4c8@srs-se1.protection.inumbo.net>)
 id 1riLT2-0007ic-PF
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 21:39:56 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf7ea36-dccb-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 22:39:54 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4TrN4S5HHszB5pBbs
 for <xen-devel@lists.xenproject.org>; Thu,  7 Mar 2024 21:39:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 69ea55a8c2a44cbeb47edb7fbc9fa4c8; Thu, 07 Mar 2024 21:39:52 +0000
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
X-Inumbo-ID: 3bf7ea36-dccb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1709847592; x=1710108092;
	bh=00POTxB1zrlLZFJpELQ2i438glsnk01REfkxGshruHk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=0t1yPr+gTkajgp+d5RPN4SN4xVHhJLj2x7A50fq0KSSYBuy/g9tZIOUzLaZM3vC+u
	 LzX60VMHFodjs9ejZBUgJKKjfsDyYc9tMhUUlThrPGfSmMKOjZ2KYNKvTUIfNKUffM
	 mITvTcSuNP1VEWw1LKxS10ylEBN6rGRwo1x8ycbkom6n42C4r0N1pEUBC1RcSSIsv/
	 dKZQCkwuyVkYxIILO+i+OuGn1wje+5PeodT6/cEiyRehThdmCajRyoP0UDHsU8+RJU
	 Apv0bhY1unlqZXqIz1D3XIUywH7U7qn0BuvzSkWstuNx17rm6kGF9fQwryTld66fPE
	 juNjjp0ss/7xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1709847592; x=1710108092; i=vaishali.thakkar@vates.tech;
	bh=00POTxB1zrlLZFJpELQ2i438glsnk01REfkxGshruHk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=DfodxubCpJKq2jItGWrCVTAjsvoktQsh+C9CpYdD89dozI/kbPK/8P/3RMo2Im0MB
	 BaZN9AQx3jq+nOV/vfR/AFsrFx68ZFpd6/d2irmYgoJR7u0S2O/vRigStLR1zS4xBu
	 ze1YPWY04tc+B+x084qXah+mce89qMyyoI0tZlKHZZQPtSI/Nf4iWHcydkDRyGunie
	 bOfzOTQKvdlMtBBrLP9P8FmQwr89TFNqsqQaXhzvGq1r2kWV4Hd2f2f9A+57+KE7vJ
	 Ke1D/kRg6RJqlMbZhIdyCKg7vkqeRrQ9rxhtdGkSiETxj4/ehh6bcFWJNpT+PSNYgj
	 gFwsSkAmAJ9jQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/2]=20x86/svm=20:=20Misc=20changes=20for=20few=20vmcb=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1709847591479
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <cover.1709846387.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.69ea55a8c2a44cbeb47edb7fbc9fa4c8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240307:md
Date: Thu, 07 Mar 2024 21:39:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

In this patchset, first patch removes the unnecessary suffix
from a bunch of vmcb bits and the second patch is about
printing the status of sev and sev-es bits while dumping VMCB.

Vaishali Thakkar (2):
  x86/svm: Drop the _enabled suffix from vmcb bits
  x86/svmdebug: Print sev and sev_es vmcb bits

 xen/arch/x86/hvm/svm/nestedsvm.c        | 14 +++++++-------
 xen/arch/x86/hvm/svm/svm.c              |  2 +-
 xen/arch/x86/hvm/svm/svmdebug.c         |  2 ++
 xen/arch/x86/hvm/svm/vmcb.c             |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 18 +++++++++---------
 5 files changed, 20 insertions(+), 18 deletions(-)

-- 
2.44.0

