Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4E2C0E87
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34623.65775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDZW-0005fC-41; Mon, 23 Nov 2020 15:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34623.65775; Mon, 23 Nov 2020 15:16:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDZW-0005em-0o; Mon, 23 Nov 2020 15:16:06 +0000
Received: by outflank-mailman (input) for mailman id 34623;
 Mon, 23 Nov 2020 15:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDZU-0005ee-FH
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:16:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07c78f70-22cc-4a71-a6d4-feb5a7f4c358;
 Mon, 23 Nov 2020 15:16:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE71DAF9E;
 Mon, 23 Nov 2020 15:16:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDZU-0005ee-FH
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:16:04 +0000
X-Inumbo-ID: 07c78f70-22cc-4a71-a6d4-feb5a7f4c358
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 07c78f70-22cc-4a71-a6d4-feb5a7f4c358;
	Mon, 23 Nov 2020 15:16:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606144562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ONPDiUZ6wtOlhqSQwk8qXYvId75rESm8eY+xvhUcyuw=;
	b=MkuvRFTKtuIrmR6bXJv+lkwFbk8DseLa9UyvhInGSL8c3Rfjnp2JuDAEC64z9/st2szCem
	Hmqb9gL29QUEre+CLZa4DrEg92GozVBRA4GuK9Pbu8YLuN+hCrih1OcXcQMTikBIADoQ/F
	g/q0EO2t2c73H3Lud188vWM7DqLLrbw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CE71DAF9E;
	Mon, 23 Nov 2020 15:16:02 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/8] xen: beginnings of moving library-like code into an
 archive
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
Message-ID: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Date: Mon, 23 Nov 2020 16:16:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In a few cases we link in library-like functions when they're not
actually needed. While we could use Kconfig options for each one
of them, I think the better approach for such generic code is to
build it always (thus making sure a build issue can't be introduced
for these in any however exotic configuration) and then put it into
an archive, for the linker to pick up as needed. The series here
presents a first few tiny steps towards such a goal.

Note that we can't use thin archives yet, due to our tool chain
(binutils) baseline being too low.

Further almost immediate steps I'd like to take if the approach
meets no opposition are
- split and move the rest of common/lib.c,
- split and move common/string.c, dropping the need for all the
  __HAVE_ARCH_* (implying possible per-arch archives then need to
  be specified ahead of lib/lib.a on the linker command lines),
- move common/libelf/ and common/libfdt/.

v3 has a new 1st patch and some review feedback addressed. See
individual patches.

1: xen: fix build when $(obj-y) consists of just blanks
2: lib: collect library files in an archive
3: lib: move list sorting code
4: lib: move parse_size_and_unit()
5: lib: move init_constructors()
6: lib: move rbtree code
7: lib: move bsearch code
8: lib: move sort code

Jan

