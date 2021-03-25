Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F17349754
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 17:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101470.194148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTDq-00087L-TR; Thu, 25 Mar 2021 16:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101470.194148; Thu, 25 Mar 2021 16:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTDq-00086z-Py; Thu, 25 Mar 2021 16:52:38 +0000
Received: by outflank-mailman (input) for mailman id 101470;
 Thu, 25 Mar 2021 16:52:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPTDp-00086s-By
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 16:52:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ce25a7f-0503-48d0-a256-ea3de2b1bb3e;
 Thu, 25 Mar 2021 16:52:36 +0000 (UTC)
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
X-Inumbo-ID: 0ce25a7f-0503-48d0-a256-ea3de2b1bb3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616691154;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VWa0Dr40EYe/oIlW+Ufg11dOPxLfxVFBM7uMznamABg=;
  b=X/jcsQnQBd0uOugTDuV6+BVu0TzMJJm1CVstTLzwNBemlIVTKarjND2C
   hX1PLrRp6xUjEgnIIHApSu4IqO3Y6ZJuuy71MDx7lVqLL8hL6IsWIX0B7
   K33CtC4k4Jn20Lpslqe5zVhEwylq76Up/MHj0C+pcBr/CFf0Fqh3pl1+y
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: unb6hMK+djcLpiXwJuZqR8Izwf86YPmyAymTKklw08a4zvqpWQwB4Er3LvIXyu1Hg+h1BIhujW
 DIhBeH4jPnQVqmX6dNiC4hm126Lnnp6WdryJjecdwB0fZvwh/56aB3rBUBeAbWbjUY6uzGVjPQ
 5dRrLlDKI6Gdplpy9woC7XgKuAvNdiiEW4VYQkIw8DwI3PMr2/7S6psB+11bd3mmOvql9HEmzB
 eh3yuWiBtXBavhqVevH3YXAjarDeTTpxQ3FQJ2KMV4hUxP+QTepKWFS9LIE4bbKy8v173LHKnd
 jAY=
X-SBRS: 5.1
X-MesageID: 40150747
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/mTlP6+kYNFILOofjL9uk+ECdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnb8oN45pRUAKe6UGDdyQ6VBaxBza+n+T3vHCXi6vVQvJ
 0LT4FSAMD9ZGIUse/U+w+9euxP/PCi0ISFwdjT1G1sSwYCUdAD0y5cBhyAGkN7AClqbKBYKL
 Om6sBKpyWtdB0sB6zWOlA/U/XevNqOrZr6YHc9bCIP0hWEjj+j9dfBYnul9yoZOgkv/Z4StV
 Lrvia8zaWlvvG9xHbnphXuxqUTovTN4J9uAMSNj+IcNznjjB25Db4RJoGqjXQOj8yErHosjd
 nQszcsVv4Dl0/5TyWOjjbGnynmzTo05HfpxTaj8ATeiP28fh0WIY5lp+tiA3/kwntlhv5Q+u
 Z3+ljckJxtARbJjE3GlqD1fiAvrGWYiz4fi+IJ5kYvNrc2WftqgqE02lhaK5sEFDKS0vFdLM
 BeSPvR4/tbajqhHhbkl1gqxNStW0I6FQudTn4DvdSI0yNXkGoR9Tpg+PAi
X-IronPort-AV: E=Sophos;i="5.81,278,1610427600"; 
   d="scan'208";a="40150747"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH for-4.15 0/2] x86/hpet: Try to unbreak Ryzen 1800X systems
Date: Thu, 25 Mar 2021 16:52:22 +0000
Message-ID: <20210325165224.10306-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a refinement of Jan's "[PATCH][4.15] x86/HPET: don't enable legacy
replacement mode unconditionally" to try and make Xen do the helpful thing on
boot, rather than requiring a non-default command line option to boot in the
first place.

Andrew Cooper (1):
  x86/hpet: Factor hpet_enable_legacy_replacement_mode() out of hpet_setup()

Jan Beulich (1):
  x86/hpet: Don't enable legacy replacement mode unconditionally

 docs/misc/xen-command-line.pandoc |  33 ++++++++
 xen/arch/x86/hpet.c               | 157 ++++++++++++++++++++++----------------
 xen/arch/x86/io_apic.c            |  26 +++++++
 xen/include/asm-x86/hpet.h        |   7 ++
 4 files changed, 157 insertions(+), 66 deletions(-)

-- 
2.11.0


