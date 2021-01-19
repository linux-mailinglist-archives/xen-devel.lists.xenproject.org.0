Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63832FBAD2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70474.126492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sho-000405-20; Tue, 19 Jan 2021 15:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70474.126492; Tue, 19 Jan 2021 15:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1shn-0003zg-Ur; Tue, 19 Jan 2021 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 70474;
 Tue, 19 Jan 2021 15:14:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1shm-0003yb-Gc
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:14:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb2d0127-28ed-4bf2-b594-25b785686a6c;
 Tue, 19 Jan 2021 15:14:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49AC4AF5B;
 Tue, 19 Jan 2021 15:14:00 +0000 (UTC)
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
X-Inumbo-ID: eb2d0127-28ed-4bf2-b594-25b785686a6c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611069240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Nl5+EFfYo4tGAUsx6E7qN4w6lotDcybojuWzSQZHWE=;
	b=DbRZneMMwaNjOIo20WZ/614HfJQf4OPMBMSgeXnyVd2duzHh7BAzCrrIvur5EKEscMJg+b
	aOJobIZkm9KzpXeG4BX9MsZ4VOJ690R9Hk/ea0/wt1ZtMyT/PvhMLzmrJj10KH7rxo8Q2d
	7q4Xq/Wddf7ZI1LBCRQkyVsK8D5lQmE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] zstd decompression for DomU-s + fallout /
 consolidation
Message-ID: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Date: Tue, 19 Jan 2021 16:13:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Only the 1st patch is strictly intended for 4.15, paralleling
the recent Dom0 side work (and re-using some of the files
introduced there, for the stubdom build), but later ones may
still want considering.

1: libxenguest: support zstd compressed kernels
2: xen/decompress: make helper symbols static
3: libxenguest: "standardize" LZO kernel decompression code
4: libxenguest: drop redundant decompression declarations
5: libxenguest: simplify kernel decompression

Jan

