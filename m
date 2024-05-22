Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE788CBD2A
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727345.1131827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9hY7-0003da-JM; Wed, 22 May 2024 08:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727345.1131827; Wed, 22 May 2024 08:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9hY7-0003c4-Ge; Wed, 22 May 2024 08:42:15 +0000
Received: by outflank-mailman (input) for mailman id 727345;
 Wed, 22 May 2024 08:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V5RZ=MZ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s9hY5-0003br-Nw
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:42:13 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2efde923-1817-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 10:42:12 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 243D835794;
 Wed, 22 May 2024 04:42:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1DDC335793;
 Wed, 22 May 2024 04:42:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 5811F35792;
 Wed, 22 May 2024 04:42:11 -0400 (EDT)
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
X-Inumbo-ID: 2efde923-1817-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=b2BmrhjIaVjxHWLhcCazmWsg7
	7Ut75EvzLcrNm5R+Dc=; b=SyosGijh/FEKLb6xHf9QCa8Sn9Fc2Xda9OfbIcTso
	mxo9nBAN+DZUlI4DtvsGoxtN8gbaoq31C8hwp8wFSU8aCnmLdAbyoUqvxQYtifBN
	ldafFpWUqvW0MGik1tP3nY8zd5osL/tVtM7iY60D6z7Ku5EvoCWqz1Mk4P1bkYYN
	eU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 2/3] x86/MCE: add default switch case in init_nonfatal_mce_checker()
Date: Wed, 22 May 2024 11:42:09 +0300
Message-Id: <9ec888c37a261c86a52f360146cbbb3ad437ad30.1716366581.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 2E697050-1817-11EF-ADA8-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

The default switch case block is wanted here, to handle situation
e.g. of unexpected c->x86_vendor value -- then no mcheck init is done, bu=
t
misleading message still gets logged anyway.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - return 0 instead of -ENODEV and put a comment
 - update description a bit
---
 xen/arch/x86/cpu/mcheck/non-fatal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mchec=
k/non-fatal.c
index 33cacd15c2..5a53bcd0b7 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -29,9 +29,14 @@ static int __init cf_check init_nonfatal_mce_checker(v=
oid)
 		/* Assume we are on K8 or newer AMD or Hygon CPU here */
 		amd_nonfatal_mcheck_init(c);
 		break;
+
 	case X86_VENDOR_INTEL:
 		intel_nonfatal_mcheck_init(c);
 		break;
+
+	default:
+		/* unhandled vendor isn't really an error */
+		return 0;
 	}
 	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n")=
;
 	return 0;
--=20
2.25.1


