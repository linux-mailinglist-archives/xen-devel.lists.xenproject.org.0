Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF916A12386
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872400.1283364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2B8-0001Ba-Fs; Wed, 15 Jan 2025 12:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872400.1283364; Wed, 15 Jan 2025 12:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2B8-00018P-D4; Wed, 15 Jan 2025 12:07:22 +0000
Received: by outflank-mailman (input) for mailman id 872400;
 Wed, 15 Jan 2025 12:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YH9L=UH=bounce.vates.tech=bounce-md_30504962.6787a4f6.v1-0d89a930d31f4b1bad54b7c4cf30f140@srs-se1.protection.inumbo.net>)
 id 1tY2B7-00017y-6q
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:07:21 +0000
Received: from mail128-16.atl41.mandrillapp.com
 (mail128-16.atl41.mandrillapp.com [198.2.128.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44d890eb-d339-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:07:20 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4Vt60fKzRKLfTN
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:07:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0d89a930d31f4b1bad54b7c4cf30f140; Wed, 15 Jan 2025 12:07:18 +0000
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
X-Inumbo-ID: 44d890eb-d339-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736942838; x=1737203338;
	bh=s0FW0PEvsl3YOTChC3rgiB7tdBYKznuK7W4tmzXbvNM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=HwwFtq8Dg9/YJabp+q0zIOFVFwrmp4ptGIU6WqR5KPwQPH6p3qyy5HNBffVnvKZYb
	 Mht4z6r3T0uu9hZPF24KD9XQDtXEZ01brMe31Nf9+NJsf62XReqFcUI6ADRYyQ02WN
	 302O7TSNPZq3YnkOZwWYQ530IBCWxFNLO9ui/8wvg1kebzi8cEcm4lexMZ5ZSyPeEX
	 f27I+82N4e2iX4ePIY+bpQdAHNgB3eTmyCEfzOOWUq3IkG7l78wb8ju/3nLru86u3k
	 fmb/nDQaof8KrIlt45Y8A2q/9Pz4E3Waw/g+BGZA6lNB4pNrdCA1gzrTcAE42lP1XD
	 t0NmLQHypa8vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736942838; x=1737203338; i=yann.dirson@vates.tech;
	bh=s0FW0PEvsl3YOTChC3rgiB7tdBYKznuK7W4tmzXbvNM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1qwgkbPjH34P5/nWBpK3IXYJI9iRqx66XtaYXz31s2NjaP5DArUgAnUGJe/4MVfQI
	 6BO+A1lUmpsKEDBsO9c8+ud9bfjlVURkugNEIadZdCoOiAWCvi8C+nlJprOgYpjDzO
	 KbUcV1XUn3UOinsf8yLRSBveZ9880Vv6MjnNPkKR3CefFFf7Fif1S0MnXZ4RiHTUZh
	 NdB5Z60HfOHhSVmxxCJ7iDwuRFHQ6t+YTlUQlJB3BvAq8adMR57lCiq4PViliXiMlI
	 pBIWibjmBJwHAkbX3P0tqOgkKFmISYyk32HxOwVVabTuNmmEzJ1Cnr6E1qs/Zeaoo+
	 Uy/FbzSIP6w2Q==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20docs/sphinx:=20overview=20of=20serial=20consoles?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736942837465
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <d40643bf0730c2f227f2dfbc7985ba0b5f8878cf.1736942790.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0d89a930d31f4b1bad54b7c4cf30f140?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:07:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

---

Notes:
    This is a very preliminar first draft for comments:
    
    - would this structuration be adequate?
    
    - Is my basic understanding correct, are those first enumerations
    correct? (some of it come solely from console.txt, which has already
    proven to be seriously outdated on many aspects)
    
    - is there some doc about the qemu/ioemu backend I missed?  Is it able to
    deal with PV consoles, or is it just for virtual UARTS?

 docs/admin-guide/console.rst | 37 ++++++++++++++++++++++++++++++++++++
 docs/admin-guide/index.rst   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 docs/admin-guide/console.rst

diff --git a/docs/admin-guide/console.rst b/docs/admin-guide/console.rst
new file mode 100644
index 0000000000..7f82a368f9
--- /dev/null
+++ b/docs/admin-guide/console.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Xen console
+===========
+
+Overview
+--------
+
+Xen provides several alternatives to provide the functionality of a
+real machine's serial console, which are seen by the guest as one of:
+
+* PV consoles (``/dev/hvc$N`` in a Linux guest)
+* Virtual SBSA UART (on ARM only?, ``/dev/ttyAMA0`` in a Linux guest)
+
+In dom0, different backends can be used to communicate with those
+guest devices:
+
+* xenconsoled: a ``xenconsoled`` daemon in dom0 takes are of the
+  communication with the guest driver, and provides a pty interface.
+  The ``xenconsole`` tool can be used to connect to this pty.
+  Limitation: can only be used for the first PV or virtual UART
+  console.
+* qemu? ioemu?: FIXME: describe
+
+Configuration
+-------------
+
+TBW
+
+Gory details
+------------
+
+While not strictly useful for administration of a Xen machine, some
+xenstore entries internal to the toolstack are visible, intermingled
+with usual dom0/guest communication.
+
+TBW
diff --git a/docs/admin-guide/index.rst b/docs/admin-guide/index.rst
index 54e6f65de3..8a1ea1741e 100644
--- a/docs/admin-guide/index.rst
+++ b/docs/admin-guide/index.rst
@@ -6,3 +6,4 @@ Admin Guide
 .. toctree::
    introduction
    microcode-loading
+   console
-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

