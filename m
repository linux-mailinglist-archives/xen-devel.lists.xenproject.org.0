Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CCC8D80BA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734828.1140920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5fg-0002WR-9a; Mon, 03 Jun 2024 11:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734828.1140920; Mon, 03 Jun 2024 11:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5fg-0002UU-6P; Mon, 03 Jun 2024 11:16:12 +0000
Received: by outflank-mailman (input) for mailman id 734828;
 Mon, 03 Jun 2024 11:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5ff-0002UO-1e
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:16:11 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acc89b00-219a-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:16:09 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id BC50E31C4E;
 Mon,  3 Jun 2024 07:16:07 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id AB0ED31C4D;
 Mon,  3 Jun 2024 07:16:07 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 23C6931C4C;
 Mon,  3 Jun 2024 07:16:05 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: acc89b00-219a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=qSv2cX6hBGxFZiQm0DYgbFSKi
	8pVVU7oKD2KrMQ9HqQ=; b=eCO7kCNamh1bXY4xOx7svsIvAQxFMbf/PIFORQXms
	vxt3LZ83ia6tX7rNfQciujDMhLwchyZYDPqZ7UDegZ5u5adkTvYwDDMACqD1BT4f
	fR87uRkkpc6SOKO8guuBeCMYYo9/xxxEgCAlxO0ZL822fOgggnGdMFZ9Ktj1cN/K
	OA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v3 05/16] x86: introduce using_{svm,vmx} macros
Date: Mon,  3 Jun 2024 14:16:02 +0300
Message-Id: <9860c4b497038abda71084ea3bce698eab3b277c.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 ABBD3118-219A-11EF-91F9-B84BEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

As we now have SVM/VMX config options for enabling/disabling these featur=
es
completely in the build, we need some build-time checks to ensure that vm=
x/svm
code can be used and things compile. Macros cpu_has_{svm,vmx} used to be =
doing
such checks at runtime, however they do not check if SVM/VMX support is
enabled in the build.

Also cpu_has_{svm,vmx} can potentially be called from non-{VMX,SVM} build
yet running on {VMX,SVM}-enabled CPU, so would correctly indicate that VM=
X/SVM
is indeed supported by CPU, but code to drive it can't be used.

New macros using_{vmx,svm} indicates that both CPU _and_ build provide
corresponding technology support, while cpu_has_{vmx,svm} still remains f=
or
informational runtime purpose, just as their naming suggests.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
Here I've followed Jan's suggestion on not touching cpu_has_{vmx,svm} but
adding separate macros for solving build problems, and then using these
where required.
---
changes in v3:
 - introduce separate macros instead of modifying behaviour of cpu_has_{v=
mx,svm}
---
 xen/arch/x86/include/asm/hvm/hvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
index 2ebea1a92c..778b93df5c 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -26,6 +26,9 @@ extern bool opt_hvm_fep;
 #define opt_hvm_fep 0
 #endif
=20
+#define using_vmx ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
+#define using_svm ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )
+
 /* Interrupt acknowledgement sources. */
 enum hvm_intsrc {
     hvm_intsrc_none,
--=20
2.25.1


