Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17D351542
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104462.199813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxX4-0005oQ-4A; Thu, 01 Apr 2021 13:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104462.199813; Thu, 01 Apr 2021 13:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxX3-0005nk-W7; Thu, 01 Apr 2021 13:38:46 +0000
Received: by outflank-mailman (input) for mailman id 104462;
 Thu, 01 Apr 2021 13:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxX2-0005gw-3m
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:44 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f4b8ddc-efa6-402f-9079-fdde9fc8c75e;
 Thu, 01 Apr 2021 13:38:38 +0000 (UTC)
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
X-Inumbo-ID: 3f4b8ddc-efa6-402f-9079-fdde9fc8c75e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tb+mtbd8sswEGjjqgjwZtym2//EwdV/CLbEWHhvGtLk=;
  b=UlT7er/6/zqdZLP1tr6mNVVbAIwfZhgRKEBzzIrbfqsN7zxUolvuj51O
   6CZR+PoDFskzV6ONLnTcPBkzAEO1IidBiNHZ5kfJ6GoaackdFgrTD1X0l
   q842sIXiEOJpgfIRMqrtr9VURP+KDV3DY/VYDnY9XB/VfeDmXX94Hrf2+
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jSaamM3dsoXodOIIsnmIh+wSfAkf0Ja+qwWjNEiFEpVZT7CsQvjIHVVv8ejC69oBL7hanJigQE
 2KhDGmhnFusHJgdzuGAhYUhxtg2K/gUgIS5OwH+5oqv7WPpQyjD0dUoqreq5y5hussoB0PBtbk
 hm5R/jwU6Lh9q5RA/UF+Z82XJzffLCTkXkRhmNPoASChPlqkWPsmNMaKc/lWGEghP71n6D8T7W
 W/zuVoA6ahNd23Lj5Sj+7qQITyNaw06qxYTjdbncbdl+pU/0okQzWNeXfODxA/2PAdxLB7//tM
 Fyk=
X-SBRS: 5.1
X-MesageID: 40557943
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cKqkoqHiA1fUPFGSpLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYdNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtq/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvRnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFALM
 BSCqjnlZRrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUDsqg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJgfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3+inHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczm8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Sit+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXBvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmhSae+jQuUIqk1xX/DFhmBrM4+GdkRnmNHADFxbYjJVQVSRUKV6Sg6
 3+gLCl6Eg=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40557943"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.15 5/7] CHANGELOG.md: Various new entries, mostly x86
Date: Thu, 1 Apr 2021 14:38:25 +0100
Message-ID: <20210401133827.362216-5-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...Grouped mostly by submitter / maintainer

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index b3325a8371..2f26cd5c87 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -17,6 +17,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Named PCI devices for xl/libxl
  - Improved documentation for xl PCI configuration format
  - Support for zstd-compressed dom0 (x86) and domU kernels
+ - EFI: Enable booting unified hypervisor/kernel/initrd/DT images
+ - Reduce ACPI verbosity by default
+ - Add ucode=allow-same option to test late microcode loading path
  - Library improvements from NetBSD ports upstreamed
  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
  - CI loop: Add qemu-based dom0 / domU test for ARM
-- 
2.30.2


