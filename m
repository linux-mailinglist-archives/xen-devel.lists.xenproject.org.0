Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489A303951
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74698.134243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kw7-0007wd-2l; Tue, 26 Jan 2021 09:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74698.134243; Tue, 26 Jan 2021 09:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kw6-0007wG-Vs; Tue, 26 Jan 2021 09:46:58 +0000
Received: by outflank-mailman (input) for mailman id 74698;
 Tue, 26 Jan 2021 09:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Kw5-0007wB-Lj
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:46:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48e1e008-e4e1-4c8c-a487-a971a113e224;
 Tue, 26 Jan 2021 09:46:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E75F7AE66;
 Tue, 26 Jan 2021 09:46:55 +0000 (UTC)
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
X-Inumbo-ID: 48e1e008-e4e1-4c8c-a487-a971a113e224
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NHKgFUTJ9qFBG0TpR8DkjPLges27YGvkSyn4UcnyblQ=;
	b=rtoYiYCJi4mF55zMQ/tOBNygXe0P+AwuNaMxvQnRTKWhuO0Qddvng02xbQdnDgTwROtgmi
	G97cTzyQ/bzJ5c4cyfkpiX0uZLDvRbVuIfqPYhfNLMnDdsTvpJjMnTvA5D6CYTCpGCrR1E
	skK+vLWsASzEUXaYC9qDF3PyQO2urdI=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 00/15] zstd decompression for DomU-s + fallout /
 consolidation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Date: Tue, 26 Jan 2021 10:46:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Only patches 1 and 2 are strictly intended for 4.15, paralleling
the recent Dom0 side work (and re-using many of the files
introduced there, for the stubdom build), but ones up to at least
patch 6 may still want considering (and 4 already has a release
ack).

01: libxenguest: add get_unaligned_le32()
02: libxenguest: support zstd compressed kernels
03: xen/decompress: make helper symbols static
04: libxenguest: "standardize" LZO kernel decompression code
05: libxenguest: drop redundant decompression declarations
06: libxenguest: simplify kernel decompression
07: gunzip: drop INIT{,DATA} and STATIC
08: bunzip: replace INIT
09: unlzo: replace INIT
10: unlzma: replace INIT
11: unlz4: replace INIT
12: unxz: replace INIT{,DATA} and STATIC
13: unzstd: replace INIT{,DATA} and STATIC
14: xen/decompress: drop STATIC and INIT
15: unzstd: make helper symbols static

Jan

