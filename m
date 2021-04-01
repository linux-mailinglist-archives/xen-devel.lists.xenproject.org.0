Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D8351317
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104277.199261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuLt-0000OC-LI; Thu, 01 Apr 2021 10:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104277.199261; Thu, 01 Apr 2021 10:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuLt-0000Nn-I0; Thu, 01 Apr 2021 10:15:01 +0000
Received: by outflank-mailman (input) for mailman id 104277;
 Thu, 01 Apr 2021 10:15:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuLr-0000Ne-UC
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:14:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef0fa20b-faed-45ce-be13-d0a8d0402ad1;
 Thu, 01 Apr 2021 10:14:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 315A3AEA6;
 Thu,  1 Apr 2021 10:14:58 +0000 (UTC)
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
X-Inumbo-ID: ef0fa20b-faed-45ce-be13-d0a8d0402ad1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xH4wjHy3MHm3MpA5OfQg5m/IJ+YbG9hbx8Zy+5IXfxo=;
	b=tydK5NWUI55HS5wCoTczdxtLYmoHEXm0erkuM8nnRMZy2oSA6OmJQuJIsQqkYdOoaHKAYI
	PULWKNdS1+FWh/9rm5Al6DVOy8nO1xYpRytglkQEWucX1SkzjquWeJ70U/AHaAJu9diu41
	jNzOel7cbwWZCMN7e8r2OEuzFPkEXHA=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/23] further population of xen/lib/
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Date: Thu, 1 Apr 2021 12:14:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is to dissolve / move xen/common/lib.c and xen/common/string.c.
One benefit of moving these functions into an archive is that we can
drop some of the related __HAVE_ARCH_* #define-s: By living in an
archive, the per-arch functions will preempt any loading of the
respective functions (objects) from the archive. (Down the road we
may want to move the per-arch functions into archives as well, at
which point the per-arch archive(s) would need to be specified ahead
of the common one(s) to the linker.)

01: lib: move muldiv64()
02: lib: move 64-bit div/mod compiler helpers
03: string: drop redundant declarations
04: lib: move memset()
05: lib: move memcpy()
06: lib: move memmove()
07: lib: move memcmp()
08: lib: move memchr()
09: lib: move memchr_inv()
10: lib: move strlen()
11: lib: move strnlen()
12: lib: move strcmp()
13: lib: move strncmp()
14: lib: move strlcpy()
15: lib: move strlcat()
16: lib: move strchr()
17: lib: move strrchr()
18: lib: move strstr()
19: lib: move strcasecmp()
20: lib: move/rename strnicmp() to strncasecmp()
21: lib: move strspn()
22: lib: move strpbrk()
23: lib: move strsep()

Jan

