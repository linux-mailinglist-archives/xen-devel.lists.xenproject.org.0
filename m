Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3BF42F57B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:33:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210743.367733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOH3-0005H5-LG; Fri, 15 Oct 2021 14:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210743.367733; Fri, 15 Oct 2021 14:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOH3-0005El-Ga; Fri, 15 Oct 2021 14:33:29 +0000
Received: by outflank-mailman (input) for mailman id 210743;
 Fri, 15 Oct 2021 14:33:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbOH2-0005Ed-DU
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:33:28 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcc1f586-4dd8-48c8-b1f6-fff0bae09e78;
 Fri, 15 Oct 2021 14:33:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 57F311FD50;
 Fri, 15 Oct 2021 14:33:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1794813C29;
 Fri, 15 Oct 2021 14:33:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qn9+BDORaWFlTgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 14:33:23 +0000
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
X-Inumbo-ID: fcc1f586-4dd8-48c8-b1f6-fff0bae09e78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634308403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F3kepskjvyVwimHlSrmq0OiX2n5/35tVfRLzRvQBZrY=;
	b=G5s/oPCFmUkt02ZywkeXQOrBt4yDDlAWOfppvdIBUS8PYDO+z4KGDSplzDco9Nz3zVf/6o
	RvJdt8Wm2ohB2X+XNZpK1CfP6Lkuhcu4AzaUzdCapZHi5quYK0Tumx5hA9Cx6I/6ZZKSEq
	HexfCNLo1+s1DaWDtomRFBJOnDrwaX8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: fix wrong SPDX headers of Xen related headers
Date: Fri, 15 Oct 2021 16:33:12 +0200
Message-Id: <20211015143312.29900-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b24413180f5600 ("License cleanup: add SPDX GPL-2.0 license
identifier to files with no license") was meant to do a tree-wide
cleanup for files without any license information by adding a SPDX
GPL-2.0 line to them.

Unfortunately this was applied even to several Xen-related headers
which have been originally under the MIT license, but obviously have
been copied to the Linux tree from the Xen project without keeping the
license boiler plate as required.

Correct that by changing the license of those files back to "MIT".

Some files still contain the MIT license text. Replace that by the
related SPDX line.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/xen/interface/callback.h       | 19 +------------------
 include/xen/interface/elfnote.h        | 19 +------------------
 include/xen/interface/event_channel.h  |  2 +-
 include/xen/interface/features.h       |  2 +-
 include/xen/interface/grant_table.h    | 19 +------------------
 include/xen/interface/hvm/dm_op.h      | 19 +------------------
 include/xen/interface/hvm/hvm_op.h     | 20 +-------------------
 include/xen/interface/hvm/hvm_vcpu.h   | 19 +------------------
 include/xen/interface/hvm/params.h     | 20 +-------------------
 include/xen/interface/hvm/start_info.h | 19 +------------------
 include/xen/interface/io/9pfs.h        | 19 +------------------
 include/xen/interface/io/blkif.h       |  2 +-
 include/xen/interface/io/console.h     |  2 +-
 include/xen/interface/io/displif.h     | 19 +------------------
 include/xen/interface/io/fbif.h        | 19 +------------------
 include/xen/interface/io/kbdif.h       | 19 +------------------
 include/xen/interface/io/netif.h       | 19 +------------------
 include/xen/interface/io/pciif.h       | 19 +------------------
 include/xen/interface/io/protocols.h   |  2 +-
 include/xen/interface/io/pvcalls.h     |  2 ++
 include/xen/interface/io/ring.h        | 19 +------------------
 include/xen/interface/io/sndif.h       | 19 +------------------
 include/xen/interface/io/vscsiif.h     | 19 +------------------
 include/xen/interface/io/xenbus.h      |  2 +-
 include/xen/interface/io/xs_wire.h     |  2 +-
 include/xen/interface/memory.h         |  2 +-
 include/xen/interface/nmi.h            |  2 +-
 include/xen/interface/physdev.h        | 20 +-------------------
 include/xen/interface/platform.h       | 19 +------------------
 include/xen/interface/sched.h          | 19 +------------------
 include/xen/interface/vcpu.h           | 19 +------------------
 include/xen/interface/version.h        |  2 +-
 include/xen/interface/xen-mca.h        |  1 +
 include/xen/interface/xen.h            | 19 +------------------
 include/xen/interface/xenpmu.h         |  2 +-
 35 files changed, 36 insertions(+), 410 deletions(-)

diff --git a/include/xen/interface/callback.h b/include/xen/interface/callback.h
index dc3193f4b581..c67822a25ea6 100644
--- a/include/xen/interface/callback.h
+++ b/include/xen/interface/callback.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * callback.h
  *
  * Register guest OS callbacks with Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2006, Ian Campbell
  */
 
diff --git a/include/xen/interface/elfnote.h b/include/xen/interface/elfnote.h
index 449bd383cb76..38deb1214613 100644
--- a/include/xen/interface/elfnote.h
+++ b/include/xen/interface/elfnote.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * elfnote.h
  *
  * Definitions used for the Xen ELF notes.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2006, Ian Campbell, XenSource Ltd.
  */
 
diff --git a/include/xen/interface/event_channel.h b/include/xen/interface/event_channel.h
index cf80e338fbb0..5f8da466e8a9 100644
--- a/include/xen/interface/event_channel.h
+++ b/include/xen/interface/event_channel.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * event_channel.h
  *
diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 5a7bdefa06a8..53f760378e39 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * features.h
  *
diff --git a/include/xen/interface/grant_table.h b/include/xen/interface/grant_table.h
index 7fb7112d667c..3eeabbc7ee09 100644
--- a/include/xen/interface/grant_table.h
+++ b/include/xen/interface/grant_table.h
@@ -1,27 +1,10 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * grant_table.h
  *
  * Interface for granting foreign access to page frames, and receiving
  * page-ownership transfers.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2004, K A Fraser
  */
 
diff --git a/include/xen/interface/hvm/dm_op.h b/include/xen/interface/hvm/dm_op.h
index ee9e480bc559..08d972f87c7b 100644
--- a/include/xen/interface/hvm/dm_op.h
+++ b/include/xen/interface/hvm/dm_op.h
@@ -1,23 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (c) 2016, Citrix Systems Inc
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef __XEN_PUBLIC_HVM_DM_OP_H__
diff --git a/include/xen/interface/hvm/hvm_op.h b/include/xen/interface/hvm/hvm_op.h
index 25d945ef17de..f3097e79bb03 100644
--- a/include/xen/interface/hvm/hvm_op.h
+++ b/include/xen/interface/hvm/hvm_op.h
@@ -1,22 +1,4 @@
-/*
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
 
 #ifndef __XEN_PUBLIC_HVM_HVM_OP_H__
 #define __XEN_PUBLIC_HVM_HVM_OP_H__
diff --git a/include/xen/interface/hvm/hvm_vcpu.h b/include/xen/interface/hvm/hvm_vcpu.h
index bfc2138e0bf5..cbf93493275c 100644
--- a/include/xen/interface/hvm/hvm_vcpu.h
+++ b/include/xen/interface/hvm/hvm_vcpu.h
@@ -1,22 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2015, Roger Pau Monne <roger.pau@citrix.com>
  */
 
diff --git a/include/xen/interface/hvm/params.h b/include/xen/interface/hvm/params.h
index 4d61fc58d99d..4e2c94b3c466 100644
--- a/include/xen/interface/hvm/params.h
+++ b/include/xen/interface/hvm/params.h
@@ -1,22 +1,4 @@
-/*
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
 
 #ifndef __XEN_PUBLIC_HVM_PARAMS_H__
 #define __XEN_PUBLIC_HVM_PARAMS_H__
diff --git a/include/xen/interface/hvm/start_info.h b/include/xen/interface/hvm/start_info.h
index 50af9ea2ff1e..e33557c0b4e9 100644
--- a/include/xen/interface/hvm/start_info.h
+++ b/include/xen/interface/hvm/start_info.h
@@ -1,22 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2016, Citrix Systems, Inc.
  */
 
diff --git a/include/xen/interface/io/9pfs.h b/include/xen/interface/io/9pfs.h
index 5b6c19dae5e2..f1a4c5ad2fd1 100644
--- a/include/xen/interface/io/9pfs.h
+++ b/include/xen/interface/io/9pfs.h
@@ -1,24 +1,7 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * 9pfs.h -- Xen 9PFS transport
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (C) 2017 Stefano Stabellini <stefano@aporeto.com>
  */
 
diff --git a/include/xen/interface/io/blkif.h b/include/xen/interface/io/blkif.h
index 5e40041c7e95..ba1e9f5b630e 100644
--- a/include/xen/interface/io/blkif.h
+++ b/include/xen/interface/io/blkif.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * blkif.h
  *
diff --git a/include/xen/interface/io/console.h b/include/xen/interface/io/console.h
index 85ca8b02695a..cf17e89ed861 100644
--- a/include/xen/interface/io/console.h
+++ b/include/xen/interface/io/console.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * console.h
  *
diff --git a/include/xen/interface/io/displif.h b/include/xen/interface/io/displif.h
index d43ca0361f86..18417b017869 100644
--- a/include/xen/interface/io/displif.h
+++ b/include/xen/interface/io/displif.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * displif.h
  *
  * Unified display device I/O interface for Xen guest OSes.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (C) 2016-2017 EPAM Systems Inc.
  *
  * Authors: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
diff --git a/include/xen/interface/io/fbif.h b/include/xen/interface/io/fbif.h
index 974a51ed9165..60ca808cef97 100644
--- a/include/xen/interface/io/fbif.h
+++ b/include/xen/interface/io/fbif.h
@@ -1,24 +1,7 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * fbif.h -- Xen virtual frame buffer device
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (C) 2005 Anthony Liguori <aliguori@us.ibm.com>
  * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
  */
diff --git a/include/xen/interface/io/kbdif.h b/include/xen/interface/io/kbdif.h
index 5c7630d7376e..b8b08aa53325 100644
--- a/include/xen/interface/io/kbdif.h
+++ b/include/xen/interface/io/kbdif.h
@@ -1,24 +1,7 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * kbdif.h -- Xen virtual keyboard/mouse
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (C) 2005 Anthony Liguori <aliguori@us.ibm.com>
  * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
  */
diff --git a/include/xen/interface/io/netif.h b/include/xen/interface/io/netif.h
index 2194322c3c7f..cb0c1a25d5d4 100644
--- a/include/xen/interface/io/netif.h
+++ b/include/xen/interface/io/netif.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * xen_netif.h
  *
  * Unified network-device I/O interface for Xen guest OSes.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2003-2004, Keir Fraser
  */
 
diff --git a/include/xen/interface/io/pciif.h b/include/xen/interface/io/pciif.h
index d9922ae36eb5..d1a87b62daae 100644
--- a/include/xen/interface/io/pciif.h
+++ b/include/xen/interface/io/pciif.h
@@ -1,24 +1,7 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * PCI Backend/Frontend Common Data Structures & Macros
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  *   Author: Ryan Wilson <hap9@epoch.ncsc.mil>
  */
 #ifndef __XEN_PCI_COMMON_H__
diff --git a/include/xen/interface/io/protocols.h b/include/xen/interface/io/protocols.h
index 6a89dc1bf225..22099bb4079f 100644
--- a/include/xen/interface/io/protocols.h
+++ b/include/xen/interface/io/protocols.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 #ifndef __XEN_PROTOCOLS_H__
 #define __XEN_PROTOCOLS_H__
 
diff --git a/include/xen/interface/io/pvcalls.h b/include/xen/interface/io/pvcalls.h
index ccf97b817e72..b6680fdbe2a8 100644
--- a/include/xen/interface/io/pvcalls.h
+++ b/include/xen/interface/io/pvcalls.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: MIT */
+
 #ifndef __XEN_PUBLIC_IO_XEN_PVCALLS_H__
 #define __XEN_PUBLIC_IO_XEN_PVCALLS_H__
 
diff --git a/include/xen/interface/io/ring.h b/include/xen/interface/io/ring.h
index b39cdbc522ec..2470ec45ebb2 100644
--- a/include/xen/interface/io/ring.h
+++ b/include/xen/interface/io/ring.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * ring.h
  *
  * Shared producer-consumer ring macros.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Tim Deegan and Andrew Warfield November 2004.
  */
 
diff --git a/include/xen/interface/io/sndif.h b/include/xen/interface/io/sndif.h
index 2aac8f73614c..445657cdb1de 100644
--- a/include/xen/interface/io/sndif.h
+++ b/include/xen/interface/io/sndif.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * sndif.h
  *
  * Unified sound-device I/O interface for Xen guest OSes.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (C) 2013-2015 GlobalLogic Inc.
  * Copyright (C) 2016-2017 EPAM Systems Inc.
  *
diff --git a/include/xen/interface/io/vscsiif.h b/include/xen/interface/io/vscsiif.h
index d07d7aca8d1c..1f6047d3de44 100644
--- a/include/xen/interface/io/vscsiif.h
+++ b/include/xen/interface/io/vscsiif.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * vscsiif.h
  *
  * Based on the blkif.h code.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright(c) FUJITSU Limited 2008.
  */
 
diff --git a/include/xen/interface/io/xenbus.h b/include/xen/interface/io/xenbus.h
index fb8716112251..44456e2853fc 100644
--- a/include/xen/interface/io/xenbus.h
+++ b/include/xen/interface/io/xenbus.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /*****************************************************************************
  * xenbus.h
  *
diff --git a/include/xen/interface/io/xs_wire.h b/include/xen/interface/io/xs_wire.h
index 1517c7e93a3a..d40a44f09b16 100644
--- a/include/xen/interface/io/xs_wire.h
+++ b/include/xen/interface/io/xs_wire.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /*
  * Details of the "wire" protocol between Xen Store Daemon and client
  * library or guest kernel.
diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
index 447004861f00..1a371a825c55 100644
--- a/include/xen/interface/memory.h
+++ b/include/xen/interface/memory.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * memory.h
  *
diff --git a/include/xen/interface/nmi.h b/include/xen/interface/nmi.h
index 73d9b0a2974e..b665fdbef1fd 100644
--- a/include/xen/interface/nmi.h
+++ b/include/xen/interface/nmi.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * nmi.h
  *
diff --git a/include/xen/interface/physdev.h b/include/xen/interface/physdev.h
index 610dba9b620a..a237af867873 100644
--- a/include/xen/interface/physdev.h
+++ b/include/xen/interface/physdev.h
@@ -1,22 +1,4 @@
-/*
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
 
 #ifndef __XEN_PUBLIC_PHYSDEV_H__
 #define __XEN_PUBLIC_PHYSDEV_H__
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index 732efb08c3e1..655d92e803e1 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * platform.h
  *
  * Hardware platform operations. Intended for use by domain-0 kernel.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2002-2006, K Fraser
  */
 
diff --git a/include/xen/interface/sched.h b/include/xen/interface/sched.h
index a4c4d735d781..4dac0634ffff 100644
--- a/include/xen/interface/sched.h
+++ b/include/xen/interface/sched.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * sched.h
  *
  * Scheduler state interactions
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
diff --git a/include/xen/interface/vcpu.h b/include/xen/interface/vcpu.h
index 504c71601511..c7cc28ad8d63 100644
--- a/include/xen/interface/vcpu.h
+++ b/include/xen/interface/vcpu.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * vcpu.h
  *
  * VCPU initialisation, query, and hotplug.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2005, Keir Fraser <keir@xensource.com>
  */
 
diff --git a/include/xen/interface/version.h b/include/xen/interface/version.h
index 8772b552c006..37d6588873d6 100644
--- a/include/xen/interface/version.h
+++ b/include/xen/interface/version.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * version.h
  *
diff --git a/include/xen/interface/xen-mca.h b/include/xen/interface/xen-mca.h
index 7483a78d2425..464aa6b3a5f9 100644
--- a/include/xen/interface/xen-mca.h
+++ b/include/xen/interface/xen-mca.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * arch-x86/mca.h
  * Guest OS machine check interface to x86 Xen.
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 5ee37a296481..5e9916939268 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * xen.h
  *
  * Guest OS interface to Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2004, K A Fraser
  */
 
diff --git a/include/xen/interface/xenpmu.h b/include/xen/interface/xenpmu.h
index ad603eab24b3..e2ee73d91bd6 100644
--- a/include/xen/interface/xenpmu.h
+++ b/include/xen/interface/xenpmu.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 #ifndef __XEN_PUBLIC_XENPMU_H__
 #define __XEN_PUBLIC_XENPMU_H__
 
-- 
2.26.2


