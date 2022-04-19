Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D5506F00
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 15:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308146.523708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHs-0003pq-LT; Tue, 19 Apr 2022 13:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308146.523708; Tue, 19 Apr 2022 13:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHs-0003nU-H3; Tue, 19 Apr 2022 13:53:00 +0000
Received: by outflank-mailman (input) for mailman id 308146;
 Tue, 19 Apr 2022 13:52:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngoHr-0003n8-7U
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 13:52:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04ee214f-bfe8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 15:52:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99CC12112B;
 Tue, 19 Apr 2022 13:52:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52884139F6;
 Tue, 19 Apr 2022 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qIzvErm+XmL/EgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 13:52:57 +0000
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
X-Inumbo-ID: 04ee214f-bfe8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650376377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4wJ7ITwhPEI/c6FS563E3yxL+vilAPqU1YHXYgdh9M=;
	b=Hf6Slkfb596jSsL3JpkD7yHvevxLV4Qye9KDHHZ/dDIveP3Ydu2S3uG2BMPWYjShF7hr//
	b2WPKajFuirm/rkkY0+WSALlMYvz2yySc2cxBP1+6Jl8nmLjgaJT+D1J6aDCC8ZmF3EAZ9
	Pc/xwSB3toL7eopkTTrpsWGYanuwNlQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Cheyenne Wills <cheyenne.wills@gmail.com>
Subject: [PATCH v3 1/3] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Date: Tue, 19 Apr 2022 15:52:52 +0200
Message-Id: <20220419135254.21729-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220419135254.21729-1-jgross@suse.com>
References: <20220419135254.21729-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A hypervisor built without CONFIG_GDBSX will crash in case the
XEN_DOMCTL_gdbsx_guestmemio domctl is being called, as the call will
end up in iommu_do_domctl() with d == NULL:

(XEN) CPU:    6
(XEN) RIP:    e008:[<ffff82d040269984>] iommu_do_domctl+0x4/0x30
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
(XEN) rax: 00000000000003e8   rbx: ffff830856277ef8   rcx: ffff830856277fff
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040269984>] R iommu_do_domctl+0x4/0x30
(XEN)    [<ffff82d04035cd5f>] S arch_do_domctl+0x7f/0x2330
(XEN)    [<ffff82d040239e46>] S do_domctl+0xe56/0x1930
(XEN)    [<ffff82d040238ff0>] S do_domctl+0/0x1930
(XEN)    [<ffff82d0402f8c59>] S pv_hypercall+0x99/0x110
(XEN)    [<ffff82d0402f5161>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x11/0x90
(XEN)    [<ffff82d040366288>] S lstar_enter+0x128/0x130
(XEN)
(XEN) Pagetable walk from 0000000000000144:
(XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 6:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 0000000000000144

Fix this issue by making sure the domain pointer has a sane value.

Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
Fixes: e726a82ca0dc ("xen: make gdbsx support configurable")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use gdbsx_guest_mem_io() interface modification (Jan Beulich)
V3:
- avoid d being NULL (Andrew Cooper)
---
 xen/common/domctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 57135d4478..5879117580 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -308,7 +308,6 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( op->domain == DOMID_INVALID )
         {
     case XEN_DOMCTL_createdomain:
-    case XEN_DOMCTL_gdbsx_guestmemio:
             d = NULL;
             break;
         }
-- 
2.34.1


