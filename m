Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80441DEB4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200087.354475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVykX-0000Jg-3R; Thu, 30 Sep 2021 16:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200087.354475; Thu, 30 Sep 2021 16:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVykX-0000Gn-0N; Thu, 30 Sep 2021 16:17:33 +0000
Received: by outflank-mailman (input) for mailman id 200087;
 Thu, 30 Sep 2021 16:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o/Z=OU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVykV-0000GN-Dr
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:17:31 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc82e4a3-6dcd-4676-a9d2-523f2aa18138;
 Thu, 30 Sep 2021 16:17:30 +0000 (UTC)
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
X-Inumbo-ID: cc82e4a3-6dcd-4676-a9d2-523f2aa18138
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633018650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SbncEBKHNrhIHO54GucIwwh3ENu4Nen3Olbl5JVgzeY=;
  b=hICE/2GUxPLgX04X1fK8bauyBoj+4KhUhfLG8TNw+ejisEQ+sQKojLlQ
   hkOCmBcaVy5vsGv0/LFf3iPLc1RKFo12BYDCYDvo3uVlpZxyzPe11Xum3
   6sbhNK3YJsp7eHT79dpE5RSr2Rx/HJNBk+3nagW4gf0U2MknBUcj978LU
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Rvo5U9IbjyivvlhtvlaEWHHxFxHghdkEqZyiPaYfXTaGCoXUprceQ1l4kCo6RiEryAO2LxM1kw
 XbC1CFZVtLXBIz9veIm8h0SKbKk0EEjeotqWNceY5PGUbvjiZ8fd5Pjve7EH8iDL1Mwh/WfeOx
 P9Z1XRMybn/edMOSGDCTvdUVf0NRUZIbStsuV5rlqEjP2Oom4H71JXe3qGYpw5ho7Lgl+31T93
 gLicUbTtOePLQzRNq/Jnt8MA1+Cnm+M+xOeHHSMRTz4vRW3r6C2NH1jhENVt03fgUYDodPsZ8L
 /8YusxZxzBR+q9jESNsNhiFJ
X-SBRS: 5.1
X-MesageID: 54035940
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0K1Nb6BLK5ppnxVW//Xkw5YqxClBgxIJ4kV8jS/XYbTApGwrgzIDm
 2UeXmGDOP+NMzCkctF+bY22oxgE75bVyoAxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0ko7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/oGXWosxrm
 c90mY2taEQHYpX0w+IzTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFgG9r25ESRZ4yY
 eI6djhFV0XBTiFkP0gVFoIjg+T5pnrGJmgwRFW9+vNsvjm7IBZK+LPkKtbSd/SBTN9ZmUver
 WXDl0zwBA0aM9qOjyKI6Hu2isfAmCr6XMQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l4fqL3hqDV3I9Yi9cSZ8I6PcOHjoEy
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuYe6/9Bq5v7bZpMzSPfq0o2d9STYm
 WjikcQou1kEYSfnPY2V+krbyxalu5TEVAI84gi/somNtVgiPN/Ni2BF8zHmARd8wGSxEgTpU
 JsswZH2AAUy4Xelz3flrAIlRuzB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGI41INvM4DYCX7Msebhr5d7exxlsAM8vy/C5jpgidmOMAtJGdrAgk0DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBhXs2p95wLKLTTSuekcUl4Y8LsLXoaU9QNt8xoei3go
 hlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:ebugV6w0nH+G4UexYmIqKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54035940"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 2/2] automation: Add qemu to debian:stretch container for smoke test
Date: Thu, 30 Sep 2021 17:17:20 +0100
Message-ID: <20210930161720.825098-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930161720.825098-1-anthony.perard@citrix.com>
References: <20210930161720.825098-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

We can add qemu into the container so that there's no need to install
it everytime we run a test.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Also, smoke tests stopped working as of today due to outdated
root certificate, so container needs to be updated anyway.
    fatal: unable to access 'https://xenbits.xen.org/git-http/xtf.git/': server certificate verification failed.

I haven't push the container yet, I've only pushed it as
debian:tmp-stretch for testing it.
---
 automation/build/debian/stretch.dockerfile | 2 ++
 automation/scripts/qemu-smoke-x86-64.sh    | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index e2ee14e2017c..da6aa874dd70 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -47,6 +47,8 @@ RUN apt-get update && \
         nasm \
         gnupg \
         apt-transport-https \
+        # for test phase, qemu-smoke-* jobs
+        qemu-system-x86 \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 4b176c508dec..8ac065491c75 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -6,9 +6,11 @@ set -ex
 variant=$1
 
 # Install QEMU
-export DEBIAN_FRONTENT=noninteractive
-apt-get -qy update
-apt-get -qy install qemu-system-x86
+if ! type qemu-system-x86_64; then
+    export DEBIAN_FRONTENT=noninteractive
+    apt-get -qy update
+    apt-get -qy install qemu-system-x86
+fi
 
 # Clone and build XTF
 git clone https://xenbits.xen.org/git-http/xtf.git
-- 
Anthony PERARD


