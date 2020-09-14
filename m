Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD82268907
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlT5-0004Bg-UL; Mon, 14 Sep 2020 10:12:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlT4-0004Bb-Od
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:12:14 +0000
X-Inumbo-ID: 123419f3-ca46-47ad-adb1-02bc732a7826
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 123419f3-ca46-47ad-adb1-02bc732a7826;
 Mon, 14 Sep 2020 10:12:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0663B036;
 Mon, 14 Sep 2020 10:12:18 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] xen: beginnings of moving library-like code into an
 archive
Message-ID: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Date: Mon, 14 Sep 2020 12:12:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
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

In a few cases we link in library-like functions when they're not
actually needed. While we could use Kconfig options for each one
of them, I think the better approach for such generic code is to
build it always (thus making sure a build issue can't be introduced
for these in any however exotic configuration) and then put it into
an archive, for the linker to pick up as needed. The series here
presents a first few tiny steps towards such a goal.

Not that we can't use thin archives yet, due to our tool chain
(binutils) baseline being too low.

The first patch actually isn't directly related to the rest of the
series, except that - to avoid undue redundancy - I ran into the
issue addressed there while (originally) making patch 3 convert to
using $(call if_changed,ld) "on the fly". IOW it's a full
(contextual and functional) prereq to the series.

Further almost immediate steps I'd like to take if the approach
meets no opposition are
- split and move the rest of common/lib.c,
- split and move common/string.c, dropping the need for all the
  __HAVE_ARCH_* (implying possible per-arch archives then need to
  be specified ahead of lib/lib.a on the linker command lines),
- move common/libelf/ and common/libfdt/.

1: build: use if_changed more consistently (and correctly) for prelink*.o
2: lib: split _ctype[] into its own object, under lib/
3: lib: collect library files in an archive
4: lib: move list sorting code
5: lib: move parse_size_and_unit()
6: lib: move init_constructors()
7: lib: move rbtree code
8: lib: move bsearch code
9: lib: move sort code

Jan

