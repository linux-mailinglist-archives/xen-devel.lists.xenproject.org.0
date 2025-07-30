Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F80B164E4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 18:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064233.1429954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9qg-0005Wl-Au; Wed, 30 Jul 2025 16:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064233.1429954; Wed, 30 Jul 2025 16:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9qg-0005VK-85; Wed, 30 Jul 2025 16:40:14 +0000
Received: by outflank-mailman (input) for mailman id 1064233;
 Wed, 30 Jul 2025 16:40:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tw9b=2L=bounce.vates.tech=bounce-md_30504962.688a4ae4.v1-55b65d1247c042dd9ec8fd02e67fba9f@srs-se1.protection.inumbo.net>)
 id 1uh9qe-0005VE-4U
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 16:40:12 +0000
Received: from mail180-9.suw31.mandrillapp.com
 (mail180-9.suw31.mandrillapp.com [198.2.180.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8c022a5-6d63-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 18:40:06 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-9.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4bsdH86JgkzK5vhdN
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 16:40:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 55b65d1247c042dd9ec8fd02e67fba9f; Wed, 30 Jul 2025 16:40:04 +0000
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
X-Inumbo-ID: d8c022a5-6d63-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753893604; x=1754163604;
	bh=AWuI6pPKvW1SrCk13N7ROhHK7lS8SGB4zDfXjt1i0+Q=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=LA7Ukm92qMrO9LOownDKSqo5iGh9J4IFa1Mv0VRAc5NcvRd5YLbu4VWo0cKddRmrc
	 zpgY9AhqH9zKv7wf/WChOVxz48SlPpdsOuT0JYZm5DNcT4e6fCdS0nPBsIwbgxFFSm
	 JfZtTZI0+/XrkYkgva7FdMK3YAiP9qtUGD6L/aVa5gc6gZQCSnD2PUIBZey/w5H90I
	 cqtVPUYhQI3TZCAZxM7aFrctjvE5SgCmOS1hAP8cXrBkGlMy/oEdtAJ8qBa/AxCFBS
	 1HU024Awh8EQJatGr+zjnHR//33hw1iyH9pJ0iyZWg3EQb0EY0mWlPyFeouCJTord2
	 oZPEDk0QdNHNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753893604; x=1754154104; i=teddy.astie@vates.tech;
	bh=AWuI6pPKvW1SrCk13N7ROhHK7lS8SGB4zDfXjt1i0+Q=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=YXvmJvmdiAiRQsvWBi+7an/j8y2nVnFdcIkPz15zNzm0HGgCINBfa4cwuOvuQfJ12
	 0DXTX7ivYvhYoqwZAC/UabFr4m32An2P+sDGTn6EbYJiIE3tUpJrcX/P7D/z2oWbea
	 DaxPxjX8iyE6hqndD5oXoQXTDzMdDfW1Prcmv/C/QsZykhEJTxpkG1vuVhALnHK5/u
	 4qLWVL49CjYhhUHKkUx0i+bMCzhZYKup0z2Oknxdc8G40nrN1s7V31OiS6a/SVtovd
	 HOwhmMgdwz36nc8gvs/EaLQIvXeSG7yijfkyJZLnscyhKQRtnzHmJuhS8ZZbSvxkV4
	 6RKHPXta03JLQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/vmx:=20Avoid=20pausing=20on=20HVM=5FPARAM=5FIDENT=5FPT=20in=20additional=20cases?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753893603726
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <698e46b8f986e649c661f4382c929abcc2827ec3.1753893493.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.55b65d1247c042dd9ec8fd02e67fba9f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250730:md
Date: Wed, 30 Jul 2025 16:40:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
- there is no vcpu
- unrestricted guest capability is used

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e2720daf1e..39ff1bdbe1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4286,11 +4286,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
             rc = -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
+        v = domain_vcpu(d, 0);
+
         /*
          * Only actually required for VT-x lacking unrestricted_guest
          * capabilities.  Short circuit the pause if possible.
          */
-        if ( !paging_mode_hap(d) || !cpu_has_vmx )
+        if ( !paging_mode_hap(d) || !cpu_has_vmx || !v || vmx_unrestricted_guest(v) )
         {
             d->arch.hvm.params[index] = value;
             break;
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


