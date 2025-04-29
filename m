Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB29AA036F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971399.1359856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX9-0007MN-14; Tue, 29 Apr 2025 06:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971399.1359856; Tue, 29 Apr 2025 06:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX8-0007Ic-S6; Tue, 29 Apr 2025 06:33:34 +0000
Received: by outflank-mailman (input) for mailman id 971399;
 Tue, 29 Apr 2025 04:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGTB=XP=kernel.org=devnull+chenlinxuan.uniontech.com@srs-se1.protection.inumbo.net>)
 id 1u9cEg-0003lQ-Iy
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 04:06:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d93bd99-24af-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 06:06:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FDD04A2BA;
 Tue, 29 Apr 2025 04:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32BAAC16AAE;
 Tue, 29 Apr 2025 04:06:17 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 25755C3ABA5;
 Tue, 29 Apr 2025 04:06:17 +0000 (UTC)
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
X-Inumbo-ID: 4d93bd99-24af-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745899577;
	bh=k2PRcTC3BnKrnGtxiZbpr39EydncBfZx8pWBXCBrn+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sl1R/QSSKs05tUYWMQq/uiCadkREGBOU5tVJHGA66P2EkOFGfCC1JLNOssSpJjpfv
	 i1N3YAK7hTIvrT9evYzjPTpMtl9av07WHvpZFrJXHyBHKvQWjn/JhigCD6fkfMAGPH
	 JkY8VguW7fzhxvQAMEhDofx3SSxc7yjIqdbHjB9Zr5KEaqG9hWmkcjzjao55vtZ/NI
	 q8WnG0Bz6jZ+4e+KKoj5E4dzgyIM5z1gqx+F00UJmhuUlydMRP5jx4WNva+ZnwM6YJ
	 EGWX7EYVTkC+hr3arTlEqZN+KPB4ASUlbCDvZNZIqqfe80t6+0KxhgB0ir2HqOqYyq
	 ONp6bMmilIzFA==
From: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>
Date: Tue, 29 Apr 2025 12:06:10 +0800
Subject: [PATCH RFC v3 6/8] kcov: add __always_inline for canonicalize_ip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-noautoinline-v3-6-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
In-Reply-To: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Kevin Tian <kevin.tian@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Winston Wen <wentao@uniontech.com>, 
 kasan-dev@googlegroups.com, xen-devel@lists.xenproject.org, 
 Chen Linxuan <chenlinxuan@uniontech.com>, 
 Changbin Du <changbin.du@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=chenlinxuan@uniontech.com; h=from:subject:message-id;
 bh=bu46wuQGrDj6kBvEdZGeSh/hu1kfUprs2xtOHC9YvDM=;
 b=owEBbQKS/ZANAwAKAXYe5hQ5ma6LAcsmYgBoEFAzBVNZPkSl6Omnu5oU34AQK+1mpqi/WLkNr
 0NEvxK8dUyJAjMEAAEKAB0WIQTO1VElAk6xdvy0ZVp2HuYUOZmuiwUCaBBQMwAKCRB2HuYUOZmu
 i8g1D/40bhkDUMn5ZsiK4TnuOugcii2OnZKhTkti9V/LWWRvgzRyIsQwQx4FtXYSoLWNriV0VjO
 CyBhHFDEFDn9Qz/M965AcIUUmKLR5grVtMB9zo5zCc6a91HPJy6GMCb7vQWZAzb4+pWGKnhvAMx
 Ov0wOqEkIfqqFMjOVcO8Vm4hfpv/gUj81gfM3GBjvGd2OHSGu5Pij0pZYLJpk1zPwPTmvDqrsz4
 oYuo8iGnQFrGPoCp8bulBU2twHYxidXZqedbEM/1LtFaKcmn/lXQC7zQRnMoVVJw/VWRJEm3H/r
 ZAZEvQW29nAzq7hH4vvQnts2FtjI834A3qFtxQn63CS2Sfr4r+Cq1EuVsao/7MSVIED9IWykpk7
 4zxistnA1wTl+9FGo+ICJdWpP4NFZYJXYzFIo2tProekWZDMySQIIR8PlepBYAhmPBM4brAn4p+
 6EeroMTKyY8ruNjdDNz7d2T4eCWNT79QPnCWQnqqQnu6en7oxsQ2nWq0yCWUgq6PiInxlG1IrOp
 ws0NDutFTcctb93F/sUKWR8fxwjFNCr2kJf2YNiq9h6vsJ5kJf0v5kwbgfSvV4AJmDUqbWsjulX
 AA7Pwu8V0FCWq4C/mflHXRlVyt5MBdGeteRJDx/xMeppywk4M4UANlKUX+SDfpwBq2fbdtOztNl
 do0e6Yl/yQUEHnA==
X-Developer-Key: i=chenlinxuan@uniontech.com; a=openpgp;
 fpr=D818ACDD385CAE92D4BAC01A6269794D24791D21
X-Endpoint-Received: by B4 Relay for chenlinxuan@uniontech.com/default with
 auth_id=380
X-Original-From: Chen Linxuan <chenlinxuan@uniontech.com>
Reply-To: chenlinxuan@uniontech.com

From: Chen Linxuan <chenlinxuan@uniontech.com>

Presume that kernel is compiled for x86_64 with gcc version 13.3.0:

  make allmodconfig
  make KCFLAGS="-fno-inline-small-functions -fno-inline-functions-called-once"

This results a objtool warning:

  vmlinux.o: warning: objtool: __sanitizer_cov_trace_pc+0xc: call to canonicalize_ip() with UACCESS enabled

Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 187ba1b80bda169d2f7efead5c6076b8829522ca..a2e2d3c655406b5a1f53e4855c782727b0541935 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -194,7 +194,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	return mode == needed_mode;
 }
 
-static notrace unsigned long canonicalize_ip(unsigned long ip)
+static __always_inline notrace unsigned long canonicalize_ip(unsigned long ip)
 {
 #ifdef CONFIG_RANDOMIZE_BASE
 	ip -= kaslr_offset();

-- 
2.43.0



