Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F73C9AF2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 11:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156506.288840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xGD-0007XN-5j; Thu, 15 Jul 2021 09:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156506.288840; Thu, 15 Jul 2021 09:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xGD-0007UJ-0x; Thu, 15 Jul 2021 09:02:25 +0000
Received: by outflank-mailman (input) for mailman id 156506;
 Thu, 15 Jul 2021 09:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6+WB=MH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m3xGB-0007UB-Ce
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 09:02:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d148126-e54b-11eb-8897-12813bfff9fa;
 Thu, 15 Jul 2021 09:02:21 +0000 (UTC)
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
X-Inumbo-ID: 5d148126-e54b-11eb-8897-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626339741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bu1VDy0xFTS1HuIHDok0dJq62JEUq81hAhR736lsJKs=;
  b=bfMugtvFPEONQN4fVDvNCkHPQTXYzsr+KEedR5PKVgIyOLiDUARwYOfI
   7fwpHjXrgUZS20ryEPVNrrN/ihIOl9az+K0IM5DuYPzevXa0YY2hSgMVD
   YScFMTdogzMDjgU1VeaB5hL2FCCAgWqoJ2moOqg4QOXAzE/iSuwdyW/pg
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Gc/So5KyrEhyb9C1Uc5OiI18XXz3njGXqh5uNiWzl+bhOBrAZVXbKWYykQJIUq3GQ5oSbhT4J3
 +JFF8ihViKqpzk77uGeipWDuaE7IxN61zpS54Cz7p+nLOnsvuOGqUF2d+dk/J3emlxcoz8X3sB
 1gmfYoQSzcOLKYlGCuqaxXxfP0fL4gHmhkXyjBseFBD3pfEC2LG9DUnKx2u9V7vb/KTFlLhD6A
 LbpdGA/bvPX73Id1wEXdDRKoZ5R4GrR3XosZjQuEnG9HkLgTmb57Ht1SYHyYnXZbCOKmVSNGFr
 YRs=
X-SBRS: 5.1
X-MesageID: 48322015
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YG3PdKjhA2aRQKV9FQid57cWqnBQXuAji2hC6mlwRA09TyX4rb
 HWoB1/737JYVkqOE3I9erwW5VoIkmsk6Kdg7NhWYtKNTOO0ADDQe4N0WKF+UyDJ8SUzJ876U
 4PSdkaNPTASWJzhs6/2gmkH78bsaG6GX+T6dvj8w==
X-IronPort-AV: E=Sophos;i="5.84,240,1620705600"; 
   d="scan'208";a="48322015"
Date: Thu, 15 Jul 2021 10:02:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Julien
 Grall" <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4
Message-ID: <YO/5lPNSjjY0NQZx@perard>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>

Can we backport support of QEMU 6.0 to Xen 4.15? I'm pretty sure
distributions are going to want to use the latest QEMU and latest Xen,
without needed to build two different QEMU binaries.

[XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more deprecated usages.
<20210511092810.13759-1-anthony.perard@citrix.com>
Commits: d5f54009db^..fe6630ddc4

Some more QEMU 6.0 fixes
<20210628100157.5010-1-anthony.perard@citrix.com>
Commits: 217eef30f7  3bc3be978f


Also, Olaf want them to be backported to 4.14, see
    <20210629095952.7b0b94c1.olaf@aepfle.de>

Thanks,

-- 
Anthony PERARD

