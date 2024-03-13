Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B787AB80
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 17:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692630.1079980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRfZ-0000b8-Fk; Wed, 13 Mar 2024 16:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692630.1079980; Wed, 13 Mar 2024 16:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRfZ-0000YY-CZ; Wed, 13 Mar 2024 16:41:33 +0000
Received: by outflank-mailman (input) for mailman id 692630;
 Wed, 13 Mar 2024 16:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqOb=KT=bounce.vates.tech=bounce-md_30504962.65f1d73a.v1-02c8ef692cf34864b336a41beefd05b2@srs-se1.protection.inumbo.net>)
 id 1rkRfX-0008Dq-8h
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 16:41:31 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1cb283-e158-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 17:41:30 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Tvx9Q14d0zB5p8C3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 16:41:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 02c8ef692cf34864b336a41beefd05b2; Wed, 13 Mar 2024 16:41:30 +0000
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
X-Inumbo-ID: 8b1cb283-e158-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710348090; x=1710608590;
	bh=FMitaZpjptJvXQpvaxxHZ/aFZkkeDw8TY9xvhcTGIUY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NO1+mgHmuB344VkLQH3vs3M/sf9zVdMkXS3QvrvUEe8PmF3CnoqMWI+nSm6U0P0UK
	 jA0YXSdhIbIVxDtAZRBx0Qu2zpqxsQBHg1yPPA/GvGn2yfT5EtPKYx2vFwyXxDs0QR
	 4ADyf893c7HoLOzTw5Kq46oKQ7VqX8zBc3DCoSCFI/EoJgpNW/i6FSL7cxUpiAB2N4
	 uIS3ejWHNAZGJxOcg27hCjrcnP9uzgRaTRVWt9dxXDq08JnKDoP/q2LUHHP94I56hQ
	 KwA4EygUDkKE3VPF7BxSRzfBPODe6I3LLaQBLGKTTAIRv/XvEUbsY25QY8Vsfmvu1A
	 CnSyhULIQN9cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710348090; x=1710608590; i=vaishali.thakkar@vates.tech;
	bh=FMitaZpjptJvXQpvaxxHZ/aFZkkeDw8TY9xvhcTGIUY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VBN6sibtXiH+TGClEeQQ3pqVM2hAo59ljZXcskj8Jkqux+uFWpvwmDmt+La4+y7oc
	 YH83TUYMtJfCnoW2VeCf2vhifyKCUj45mWCHE3djhI+nWyNXcROj2mIciDWdXctTVE
	 nfe1V58e1ZK6xkIjPRZAH4sNQU/uthsOH+ZCNBKBkft/7zY3t3ci1FqWtGSBDrOIRS
	 G8JvAjfMk416jVBc7jKIryxggD8xNAmqfl9hLI4XYU/DUmPXuNhApcNPwl8Pv3jyiH
	 e4+e0ojS/QyLUci6tkwW+26avYtzttuJOs0IqaARLmXoMzl3NwD7a4htSrEP5C9Z6w
	 0dkrNKcRGWD2Q==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=203/3]=20x86/svmdebug:=20Print=20np,=20sev=20and=20sev=5Fes=20vmcb=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710348088991
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <f71fc11c1411f17a3570e3f8c8c088c1276b8552.1710347950.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1710347950.git.vaishali.thakkar@vates.tech>
References: <cover.1710347950.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.02c8ef692cf34864b336a41beefd05b2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240313:md
Date: Wed, 13 Mar 2024 16:41:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently only raw _np_ctrl is being printed. It can
be informational to know about which particular bits
are enabled. So, this commit adds the bit-by-bit decode
for np, sev and sev_es bits.

Note that while, only np is enabled in certain scenarios
at the moment, work for enabling sev and sev_es is in
progress. And it'll be useful to have this information as
part of svmdebug.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
Changes since v1:
        - Pretty printing
Changes since v2:
        - Minor changes in pretty printing to make information
          clear
        - Improve commit log and subject to include _np bit
---
 xen/arch/x86/hvm/svm/svmdebug.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 0d714c728c..9d3badcf5d 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -51,8 +51,11 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb->exitcode, vmcb->exit_int_info.raw);
     printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
            vmcb->exitinfo1, vmcb->exitinfo2);
-    printk("np_ctrl = %#"PRIx64" asid = %#x\n",
-           vmcb_get_np_ctrl(vmcb), vmcb_get_asid(vmcb));
+    printk("asid = %#x np_ctrl = %#"PRIx64":%s%s%s\n",
+           vmcb_get_asid(vmcb), vmcb_get_np_ctrl(vmcb),
+           vmcb_get_np(vmcb)     ? " NP"     : "",
+           vmcb_get_sev(vmcb)    ? " SEV"    : "",
+           vmcb_get_sev_es(vmcb) ? " SEV_ES" : "");
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
            vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
-- 
2.44.0

