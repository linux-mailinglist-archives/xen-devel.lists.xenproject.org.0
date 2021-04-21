Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68E3667FD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114190.217499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ98f-0008C5-Aq; Wed, 21 Apr 2021 09:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114190.217499; Wed, 21 Apr 2021 09:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ98f-0008Bj-7t; Wed, 21 Apr 2021 09:27:17 +0000
Received: by outflank-mailman (input) for mailman id 114190;
 Wed, 21 Apr 2021 09:27:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48UE=JS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZ98d-0008Be-Nd
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:27:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfddecca-5ddb-4146-a805-582add0b7a2e;
 Wed, 21 Apr 2021 09:27:14 +0000 (UTC)
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
X-Inumbo-ID: dfddecca-5ddb-4146-a805-582add0b7a2e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618997233;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=D/w2DNl0TeaKEZCmB65pXr1R2VJ6wYuG0NAcJnIRkmE=;
  b=SjUFKRwAqIGts45d/eT7knSZTDksZ+jBlQAdcunO//bGORlcoI+LE6Bn
   cNcgDd2DTigP+gauaTHcMROHdApL/9nBBygyWiFpcwNKD4osN/2i5ToDR
   9yxvasJI3/KVGTGyH2jzmq+3osvct4PviP0ryP1XIKtx/NoAl4HuwBTTF
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GroDJA21M6lxAneqdcgDfqYHeXVDc1LRzX22nVOGYQrmPBJAojRalNyKheNf0TNFlaLiNpH71f
 fzBe1UYDCSGZv8Lw4MOYSfowa9mRRDGN0pzjzwljVscIYM+QOylPT2sGb6Dj/q/TwEPwRw0eKm
 uaPfoUekGPuhcBeFNRBkozxwHy0NsM8KM8Jf6zhAOD8cuBiZFHfDUr9RsjEwHTCzMQ1xuDlMCs
 HT5/w5tvLDCaodcRXXFFibqUEpKUjQxwde+qHI16Uf6ENwCs1cZzs04NwIZ7pbpTJiJVyPHQJx
 vdg=
X-SBRS: 5.1
X-MesageID: 41893701
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:u7gtMqDh8Bs53uLlHelp55DYdL4zR+YMi2QD/WoZc3JoW+afkN
 2jm+le6A/shF8qKRYdsP2JJaXoexPh3LFv5415B9ufdS3HnEftE41494vlxFTbaknD38pQz7
 1pfaQ7KPCYNykYse/A7AO1E8ktzbC8mcjC74rj5kxgUB1wbOVY5xp5Yzzrd3FefhVMBpYyCf
 Onh/ZvmjzIQxsqR/X+InEEWuTZzue79q7bXQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41893701"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [PATCH] CI: Drop TravisCI
Date: Wed, 21 Apr 2021 10:27:05 +0100
Message-ID: <20210421092705.2295-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Travis-ci.org is shutting down shortly.  The arm cross-compile testing has
been broken for a long time now, and all testing has now been superseded by
our Gitlab infrastructure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 .travis.yml | 86 -------------------------------------------------------------
 1 file changed, 86 deletions(-)
 delete mode 100644 .travis.yml

diff --git a/.travis.yml b/.travis.yml
deleted file mode 100644
index f3cd15b79f..0000000000
--- a/.travis.yml
+++ /dev/null
@@ -1,86 +0,0 @@
-language: c
-dist: trusty
-sudo: required
-# don't test master, smoke and coverity branches
-branches:
-    except:
-        - master
-        - smoke
-        - /^coverity-tested\/.*/
-        - /^stable-.*/
-matrix:
-    include:
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=x86_64 debug=n
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=x86_64 XEN_CONFIG_EXPERT=y RANDCONFIG=y debug=n
-        - compiler: gcc-5
-          env: XEN_TARGET_ARCH=x86_64 debug=n
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=x86_64 debug=y
-        - compiler: gcc-5
-          env: XEN_TARGET_ARCH=x86_64 debug=y
-        - compiler: clang
-          env: XEN_TARGET_ARCH=x86_64 clang=y debug=n
-        - compiler: clang
-          env: XEN_TARGET_ARCH=x86_64 clang=y debug=y
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=arm32 CROSS_COMPILE=arm-linux-gnueabihf- debug=n
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=arm32 CROSS_COMPILE=arm-linux-gnueabihf- XEN_CONFIG_EXPERT=y RANDCONFIG=y debug=n
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=arm32 CROSS_COMPILE=arm-linux-gnueabihf- debug=y
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- debug=n
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- XEN_CONFIG_EXPERT=y RANDCONFIG=y debug=n
-        - compiler: gcc
-          env: XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- debug=y
-addons:
-    apt:
-        sources:
-            - ubuntu-toolchain-r-test
-        packages:
-            - zlib1g-dev
-            - libncurses5-dev
-            - libssl-dev
-            - python-dev
-            - xorg-dev
-            - uuid-dev
-            - libyajl-dev
-            - libaio-dev
-            - libglib2.0-dev
-            - libpixman-1-dev
-            - pkg-config
-            - flex
-            - bison
-            - acpica-tools
-            - bin86
-            - bcc
-            - libnl-3-dev
-            - ocaml-nox
-            - libfindlib-ocaml-dev
-            - transfig
-            - pandoc
-            - gcc-arm-linux-gnueabihf
-            - gcc-aarch64-linux-gnu
-            - gcc-5
-            - g++-5
-            - seabios
-            - checkpolicy
-            - ghostscript
-# we must set CXX manually instead of using 'language: cpp' due to
-# travis-ci/travis-ci#3871
-before_script:
-    - export CXX=${CC/cc/++}
-    - export CXX=${CXX/clang/clang++}
-script:
-    - ./scripts/travis-build
-after_script:
-    - cat xen/.config
-    - cat tools/config.log
-    - cat docs/config.log
-notifications:
-    irc:
-        channels:
-            - secure: "mPIFllF6eW3F3talvccMy55Tfcid66IPkkXZYCxDKRF2DQrMyvmg4qt0xN6gGZsdfOBMNr+/YfO5PxusBCUkVdBGBzd3QhFoIDYZbJZgzVh3yNDQ+x4L7p1cZNrwJ2loMmSX6KxGKZxZX9NRStrTUkVyp0jGZB9xkwT8Rl6jXj7EQkgQ95K1Wqafx0ycLfyDQmzX9bzi/3KIBFKMGmK18AFMh+R30zK0FPUUsS4+VhepIkVqO5puU3OYePd34wRnWlt7hjU2Vj5vYmVXp3UOE+E8/Lf9IGVAhitDi+EC35b8zo2BHJ9z6xZARYPvfSqbXcXV20RycabI+e3ufZJ40eatssly5QjWH+HhKS42C4gV1psmQhkTCNCM62Ty5uf6R1hsZJQuiOZrc8ojdje8ey2MxJk4R+Xz+Igg1/kD6+WX9/Y6Y3iRuj5HL1xCYfpTbK4mC7ofw0SofW2aAGI68jHpCqJdQCDzMl6748PlDMM0eKe0MPKIEenYHcoBnOEC/jciXUDa6wduV75EEip7oq2i+m44MopcsEDTpdliH077GhKapF0ActjvBTLpyoTRSfkKm0NZol/dgwd3PGG/mY8clIoeXWRb4opk93ejPC967KmSNC68SlfwaJmFZS5T9vAgb6k7r6i9G3dmYtrLKzws8IV1CPWqLzk58+v4pRk="
-- 
2.11.0


