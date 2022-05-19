Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935A52D0E6
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 12:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332830.556597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrdpC-0007om-Je; Thu, 19 May 2022 10:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332830.556597; Thu, 19 May 2022 10:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrdpC-0007mE-GW; Thu, 19 May 2022 10:56:10 +0000
Received: by outflank-mailman (input) for mailman id 332830;
 Thu, 19 May 2022 10:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qgK=V3=citrix.com=prvs=13100c9ce=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrdpB-0007m8-4q
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 10:56:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452c8361-d762-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 12:56:02 +0200 (CEST)
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
X-Inumbo-ID: 452c8361-d762-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652957762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z4vRUXSAJaAL2sBFivCMDPdY3PI4a6wJUKemvNgqPcY=;
  b=I15lBeXEmqoU3XMb9CRDnJD80S2WYjNxbnl33d0DxC2lESr8UtFKopkX
   vTWx6VrLu6dnfJNvrwrc/3A9cXgnaqz8OBTM2/vaNKvym8GvJ6cKfu/lf
   5qHeUoXcD4ZwfzUM/YAvd3VOeG4sNBadG4KQMhITTTQMdysPfq3IRG47M
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71054945
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/p3MLqAX+aNI+RVW/0Xjw5YqxClBgxIJ4kV8jS/XYbTApDgmgmAHy
 mEdDTiPPvqINGb1eNhwYIiz8xgAvsCAyYBkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhqk
 MljrYadUz0QP/LKic80VRYGATNhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8XRauCN
 pZEAdZpRBadZgB2NUVONK4ZtreBuFOgImJR8k3A8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1ZsKlQzOgulOehCcdBNxBOMQ851+f2LWBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG5+OkOYgTzosGP+UJfpvn8AnnOz
 j+Dt0DSbJ1D3JdQh81XEb0q6g9AR6QlrCZov207vUr/t2uVgbJJgKTxsDDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmCG0Qc1Q8R4qW/1k5JGQWy3yGguTHqFz+5eIWO5C
 KMtkV05CGBv0IuCMvYsPtPZ5zUCxqn8D9X1Ps04nfIVCqWdgDSvpXk0DWbJhjiFuBF1zckXZ
 MfKGe7xXC1yIfk2k1KLqxI1jOZDKtYWnjiIG/gWDn2PjNKjWZJiYexbbArWM7potfrsTce82
 483CvZmAi53CIXWChQ7O6ZKRbzWBRDX3azLlvE=
IronPort-HdrOrdr: A9a23:ULuLl6nI5DdCR/iH93rdhk9CVv7pDfIX3DAbv31ZSRFFG/Fw8P
 re/8jztCWVtN9/YhsdcLy7VZVoIkm8yXcW2+Ys1N6ZNWGMhIaxFvAH0WKL+UyEJ8SUzIBgPM
 lbH5SX1LXLfCFHZZmQ2njeLz+L+qjgzEnSv5a980tQ
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="71054945"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2] ts-xen-build-prep: Install newer NASM version, to build OVMF
Date: Thu, 19 May 2022 11:55:25 +0100
Message-ID: <20220519105525.211344-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recent versions of OVMF now need a version of NASM that is newer
than the one available on Debian oldstable/buster. They want to use
NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
need to use a newer version started with d3febfd9ade3 ("MdePkg:
Replace Opcode with the corresponding instructions.").

There is no backport package available but the nasm package from
Debian Bullseye can easily be installed on Buster as it has few
dependencies and are already satisfied.

[1] https://github.com/tianocore/edk2/commit/6a890db161cd6d378bec3499a1e774db3f5a27a7
    ("BaseTools: Upgrade the version of NASM tool")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 production-config | 2 ++
 ts-xen-build-prep | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/production-config b/production-config
index 9d2e7e0ee492..b77763a19443 100644
--- a/production-config
+++ b/production-config
@@ -112,6 +112,8 @@ DebianExtraPackages_jessie chiark-scripts_6.0.3~citrix1_all.deb
 DebianExtraPackages_stretch chiark-scripts_6.0.4~citrix1_all.deb
 DebianExtraPackages_buster chiark-scripts_6.0.5~citrix1_all.deb libc-kernel-bug.960271/linux-libc-dev_4.19.118-2.0iwj_.deb
 
+DebianExtraPackages_build_buster nasm_2.15.05-1_.deb
+
 DebianExtraPackages_uefi_i386_jessie   extradebs-uefi-i386-2018-04-01/
 DebianExtraPackages_uefi_amd64_jessie  extradebs-uefi-amd64-2018-04-01/
 DebianExtraPackages_uefi_i386_stretch  extradebs-uefi-i386-2018-04-01/
diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 67b3eae62155..e76c0254bfd0 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -250,6 +250,8 @@ END
     if ($ho->{Arch} eq 'amd64' && $ho->{Suite} !~ m/squeeze|lenny/) {
         target_install_packages($ho, 'libc6-dev-i386');
     }
+
+    some_extradebs($ho, [ 'DebianExtraPackages', 'build', $ho->{Suite} ]);
 }
 
 sub ccache_setup () {
-- 
Anthony PERARD


