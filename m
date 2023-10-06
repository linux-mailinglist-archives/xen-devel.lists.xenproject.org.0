Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16E7BBF3E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 20:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613803.954580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qopxu-0000i5-0m; Fri, 06 Oct 2023 18:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613803.954580; Fri, 06 Oct 2023 18:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qopxt-0000Zs-TJ; Fri, 06 Oct 2023 18:54:21 +0000
Received: by outflank-mailman (input) for mailman id 613803;
 Fri, 06 Oct 2023 18:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LN/y=FU=citrix.com=prvs=63610b956=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qopxs-0000VZ-Mk
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 18:54:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0d2ed51-6479-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 20:54:18 +0200 (CEST)
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
X-Inumbo-ID: c0d2ed51-6479-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696618458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2uX+SHBDUuq7urjzE6lLyQyHdoxcJfW0g6f2j1ELSfY=;
  b=Ari9gFR8upEq6vbnQ/O73bvai/CDX0qdF4odcCb9clakxuLwCRS6M8wA
   Co+4P9ag6bjilsZW+9nnQBci1FGONA0JCzgvJTttRwFpb2p1X5RUpOjhI
   BDxdStDmdbuLCJaBLiwS0XAEUZvle682iLqvz0MQay6a/MuFkcGUVh0Cx
   M=;
X-CSE-ConnectionGUID: FvEREW8TSwKmhlQAgEn1mw==
X-CSE-MsgGUID: U5FcZ4ZQTzquIYfDl+/Q/A==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125288252
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:t0Lb0qk0J3uwuUk/Er/l0gPo5gxWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUG/Ua/eJZzShcth0PN+29B8DvsLQx4JjTAVt+CxnQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5AGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dIGBQogUUC/vP2VxbK/c8Bjq8J6Kda+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzF/
 DKWpTmjav0cHOHC5zG3rkCVuv3WgALKVq4WV/qBsdc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZtNiG668ipvyAyP9x
 xiDqSR4jLIW5eYr2qOh7Bb4ijSjjpHTS0g+4QC/Y46+xlonPsj/PdXusAWKq6kYRGqEcrWfl
 FYatvKz07AyNo6ukSyJecwCMbfw4unQZVUwnmVT84kdGyWFoiDyI90BsG8lfS+FIe5eJ2W0P
 BG7VRd5oc8LZST0N8ebdqrsU6wXIb7c+cMJvxw+RuJJZ4B4cgjP1ixnbk74M4vFyxN0z/9X1
 Xt2a6+R4Zcm5UdPlmDeqx81i+ND+8zH7Tq7qWrH5xqmy6GCQ3WeVK0INlCDBshgsvLa/V6No
 o8HaZfbo/m6bAEZSnCImbP/0HhQdSRrbXwIg5M/mhG/zvpORzh6Vq65LUIJcI15haVF/tokD
 VnkMnK0PGHX3CWdQS3TMywLVV8adconxZ7NFXB2bAnANrlKSdrH0ZrzgLNtLed/pLEynKEsJ
 xTHEu3Zaslypv3802x1RfHAQEZKLXxHWSrm0/KZXQUC
IronPort-HdrOrdr: A9a23:UmLlf6j6VeOu9hOiqxMB+QiFL3BQXugji2hC6mlwRA09TyX4ra
 +TdZEgviMc5wxhPE3I9ergBED4ewK+yXcX2+cs1NWZLWvbUQKTRekJgOffKlvbakjDH4VmtZ
 uIHZIOceHYPBxXitv7/Rn9M/tI+qj+zElwv5a48566d3ANV51d
X-Talos-CUID: 9a23:XN2fKWDlafLbGKf6Ewd52XQ5JZAZSWL+yXfUGma3JGAwTaLAHA==
X-Talos-MUID: 9a23:VHfJ8QmAUFwtrwjE2wHKdnpfaelj0ficMXwfiIgniseoMW83AnC02WE=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="125288252"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.18 v2 1/2] docs/spnix: Switch hypercall-abi.rst to named footnotes
Date: Fri, 6 Oct 2023 19:54:01 +0100
Message-ID: <20231006185402.1098400-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
References: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will simplify inserting a new one in the middle.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 docs/guest-guide/x86/hypercall-abi.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index 14c48929d748..42a820386b68 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -6,7 +6,7 @@ Hypercall ABI
 Hypercalls are system calls to Xen.  Two modes of guest operation are
 supported, and up to 6 individual parameters are supported.
 
-Hypercalls may only be issued by kernel-level software [1]_.
+Hypercalls may only be issued by kernel-level software [#kern]_.
 
 Registers
 ---------
@@ -33,7 +33,7 @@ The registers used for hypercalls depends on the operating mode of the guest.
 
 32 and 64bit PV guests have an ABI fixed by their guest type.  The ABI for an
 HVM guest depends on whether the vCPU is operating in a 64bit segment or not
-[2]_.
+[#mode]_.
 
 
 Parameters
@@ -87,7 +87,7 @@ written by Xen, is mapped with executable permissions so it may be used.
 Multiple hypercall pages may be created by the guest, if it wishes.
 
 The stubs are arranged by hypercall index, and start on 32-byte boundaries.
-To invoke a specific hypercall, ``call`` the relevant stub [3]_:
+To invoke a specific hypercall, ``call`` the relevant stub [#iret]_:
 
 .. code-block:: none
 
@@ -116,14 +116,14 @@ means.
 
 .. rubric:: Footnotes
 
-.. [1] For HVM guests, ``HVMOP_guest_request_vm_event`` may be configured to
-       be usable from userspace, but this behaviour is not default.
+.. [#kern] For HVM guests, ``HVMOP_guest_request_vm_event`` may be configured
+   to be usable from userspace, but this behaviour is not default.
 
-.. [2] While it is possible to use compatibility mode segments in a 64bit
-       kernel, hypercalls issues from such a mode will be interpreted with the
-       32bit ABI.  Such a setup is not expected in production scenarios.
+.. [#mode] While it is possible to use compatibility mode segments in a 64bit
+   kernel, hypercalls issues from such a mode will be interpreted with the
+   32bit ABI.  Such a setup is not expected in production scenarios.
 
-.. [3] ``HYPERCALL_iret`` is special.  It is only implemented for PV guests
-       and takes all its parameters on the stack.  This stub should be
-       ``jmp``'d to, rather than ``call``'d.  HVM guests have this stub
-       implemented as ``ud2a`` to prevent accidental use.
+.. [#iret] ``HYPERCALL_iret`` is special.  It is only implemented for PV
+   guests and takes all its parameters on the stack.  This stub should be
+   ``jmp``'d to, rather than ``call``'d.  HVM guests have this stub
+   implemented as ``ud2a`` to prevent accidental use.
-- 
2.30.2


