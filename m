Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D934AEE0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 20:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102054.195491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgn-0007UQ-Ra; Fri, 26 Mar 2021 19:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102054.195491; Fri, 26 Mar 2021 19:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgn-0007U1-Ns; Fri, 26 Mar 2021 19:00:09 +0000
Received: by outflank-mailman (input) for mailman id 102054;
 Fri, 26 Mar 2021 19:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPrgm-0007Tw-FV
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 19:00:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4c953b9-4c86-4244-bba2-ab26e70c6e1c;
 Fri, 26 Mar 2021 19:00:07 +0000 (UTC)
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
X-Inumbo-ID: e4c953b9-4c86-4244-bba2-ab26e70c6e1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616785207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RuAY2Vs5ZjEISl1t3cvbNmdLRZYlT8iClHaM05R9taE=;
  b=Mr+99u1sMBreGD3NPS2qLDjBzCJ5vXyhBm9irxiqUff7rhBaeM1gajb0
   lknKTC1m6iaHJnbnTjC/10zhVhtLwqdapp8gGx7rJBs0Ms1NnehaZBNpy
   LgP+CrAfYFkQm9otC1pl+evUUfY7au0SEsGhsR/G5wvCJUeWdzIGOd076
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4Y5bV4P3cKKYYi2cldRTTypvf/9TQlJoXbD/ZMzQ0jJ7vtYEJTe6G4MqtCwhRazNZN99SuQKOp
 3wLWSdVJtXmRC6aM0nll4qdkisY/0hRtvuStWtGQFn1gw1e8h9EiLtsJhyDlcPtEkWfD5nnW/n
 8IFalb/5APvKag+8zyJhjayIcDnaVgu+iypbuzyaT6EvQlyuX2BQTn6Hj8O9wT9543ItutPuYO
 EzFU/Z2CeMCOTYWwZPkKJ6JTtwwY/ixRv7LnqTUXMx4K3aFbv+uAuOOwovGIH+7g8yC15j6W87
 ldw=
X-SBRS: 4.0
X-MesageID: 40395915
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Nqfjkq0EGOkwNQYY4u/6iwqjBUFyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslvdMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815MSkVQZ7hk/0NFDG+gYy9LbS1nIbZ8K5
 aG/MpAoFObCBMqR+C2HGMMUeSGh/CjruOEXTc8CxQq6BaDgFqTgdaXLzGi0hgTSD9Jy7s5mF
 K19jDR3am/r+q9jibVym671f9rseH8wdhODtHksLlwFhzQjG+TBbhJavm5kx0e5Mqu71srl9
 ekmWZeA+1Dr0n/U0vwjR/k2wzL2Csj5Xn42Taj8AXeiP28fh0WIY5sgp9Ybwv45iMbzaBB+Z
 MO5U21nd52Cg7Nhyv07dSgbWAbqmOE5UAMvMRWql43a/pmVJZh6bYx0WkQLbI7WAX904wjGP
 kGNrCg2N9mNWm0QlqcgnNi27WXLwwONybDeGcukOqP3QNbmXhopnFouPA3rzM7+JUxR4Is3Z
 W+Do1Y0LVHTsohZalgHus2QcyuFmzXQR7XWVjiW2jaKA==
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40395915"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH for-4.15 v2 0/3] x86/hpet: Try to unbreak Ryzen 1800X systems
Date: Fri, 26 Mar 2021 18:59:44 +0000
Message-ID: <20210326185947.23243-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a refinement of Jan's "[PATCH][4.15] x86/HPET: don't enable legacy
replacement mode unconditionally" to try and make Xen do the helpful thing on
boot, rather than requiring a non-default command line option to boot in the
first place.

Andrew Cooper (2):
  x86/hpet: Factor hpet_enable_legacy_replacement_mode() out of hpet_setup()
  x86/hpet: Restore old configuration if Legacy Replacement mode doesn't
    help

Jan Beulich (1):
  x86/hpet: Don't enable legacy replacement mode unconditionally

 docs/misc/xen-command-line.pandoc |  33 +++++++
 xen/arch/x86/hpet.c               | 187 ++++++++++++++++++++++++--------------
 xen/arch/x86/io_apic.c            |  31 +++++++
 xen/include/asm-x86/hpet.h        |  13 +++
 4 files changed, 194 insertions(+), 70 deletions(-)

-- 
2.11.0


