Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AF366DEC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114541.218303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDdv-0007m2-Ie; Wed, 21 Apr 2021 14:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114541.218303; Wed, 21 Apr 2021 14:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDdv-0007ld-FN; Wed, 21 Apr 2021 14:15:51 +0000
Received: by outflank-mailman (input) for mailman id 114541;
 Wed, 21 Apr 2021 14:15:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDdu-0007lY-Fn
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:15:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93e77e5e-b048-4c9b-9d86-0c822b186a64;
 Wed, 21 Apr 2021 14:15:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E24B6B4A7;
 Wed, 21 Apr 2021 14:15:48 +0000 (UTC)
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
X-Inumbo-ID: 93e77e5e-b048-4c9b-9d86-0c822b186a64
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UesFdHn5dx/kBX6wc3Qq2EP1qW8INJTatdh3g8LHvHw=;
	b=HWLjfOz0qE957C1CJ3Z+32Bn0e71GzUoaKFRyISEXoADWbWV5P6hFSmgxCSQbF3r6uibec
	fQc0cMHkEL9ahk8o4ZWU7IV5ki/rdiSqlXpwaYdSl74OQoFGH067rwZJmv9HbfEjAsPFFi
	fXvBZJ4Yf6e+9wU8FvOVvXihK54Tiic=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/20] further population of xen/lib/
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Date: Wed, 21 Apr 2021 16:15:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is to dissolve / move xen/common/string.c. One benefit of moving
these functions into an archive is that we can drop some of the related
__HAVE_ARCH_* #define-s: By living in an archive, the per-arch functions
will preempt any loading of the respective functions (objects) from the
archive. (Down the road we may want to move the per-arch functions into
archives as well, at which point the per-arch archive(s) would need to
be specified ahead of the common one(s) to the linker.)

The only change in v2 is adjustment to all of the commit messages.

01: lib: move memset()
02: lib: move memcpy()
03: lib: move memmove()
04: lib: move memcmp()
05: lib: move memchr()
06: lib: move memchr_inv()
07: lib: move strlen()
08: lib: move strnlen()
09: lib: move strcmp()
10: lib: move strncmp()
11: lib: move strlcpy()
12: lib: move strlcat()
13: lib: move strchr()
14: lib: move strrchr()
15: lib: move strstr()
16: lib: move strcasecmp()
17: lib: move/rename strnicmp() to strncasecmp()
18: lib: move strspn()
19: lib: move strpbrk()
20: lib: move strsep()

Jan

