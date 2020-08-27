Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FFF254016
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 10:02:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBCqv-0008Td-BF; Thu, 27 Aug 2020 08:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBCqt-0008TY-B0
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 08:01:43 +0000
X-Inumbo-ID: b7fda46a-75fb-45fd-9ed0-ae0108b1c540
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7fda46a-75fb-45fd-9ed0-ae0108b1c540;
 Thu, 27 Aug 2020 08:01:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85E84AD2E;
 Thu, 27 Aug 2020 08:02:13 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: gcc10 build issue for Arm64
Message-ID: <be061c98-fad9-c8c0-a858-a65e08fe10ed@suse.com>
Date: Thu, 27 Aug 2020 10:01:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano, Julien,

since it was touching code potentially also affecting Arm, prior
to my push of a couple of commits a few minutes ago I also wanted
to build-test Arm. While as a fallback all went well with gcc
9.3, with my first (default) attempt with 10.2 I ran into

ld: prelink.o: in function `_spin_lock_cb':
/build/xen/staging-arm64/xen/common/spinlock.c:164: undefined reference to `__aarch64_ldadd4_acq_rel'
ld: /build/xen/staging-arm64/xen/common/spinlock.c:164: undefined reference to `__aarch64_ldadd4_acq_rel'
make[3]: *** [/build/xen/staging-arm64/xen/xen-syms] Error 1
make[2]: *** [/build/xen/staging-arm64/xen/xen] Error 2
make[1]: *** [install] Error 2
make: *** [install-xen] Error 2

I have no idea how recent the introduction of the issue is, but
I hope you'll be able to pinpoint the offending change (and a
possible fix) much easier than I would be.

Thanks, Jan

