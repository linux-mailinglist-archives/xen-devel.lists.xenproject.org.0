Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E7360580
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110953.212014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyAe-0007bV-9n; Thu, 15 Apr 2021 09:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110953.212014; Thu, 15 Apr 2021 09:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyAe-0007b8-6s; Thu, 15 Apr 2021 09:20:20 +0000
Received: by outflank-mailman (input) for mailman id 110953;
 Thu, 15 Apr 2021 09:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWyAc-0007b3-Ds
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:20:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 538bf3b6-4af8-4ecb-8dcd-e435f190b1f6;
 Thu, 15 Apr 2021 09:20:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0259BADE2;
 Thu, 15 Apr 2021 09:20:16 +0000 (UTC)
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
X-Inumbo-ID: 538bf3b6-4af8-4ecb-8dcd-e435f190b1f6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618478416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0Dfw2BFGeAW6FKyMK+ubP4DsFBTX35TDYTYDC+4iLA=;
	b=Wjft7KMAtX4mbgQBcvtrKWbcvGqFjHLZI6km9ZbxPceT+v0/8Er7KLA2m3Afi+oRIHOxSJ
	FrSlOdBaQQ839xbdhH6UJaLDgrudCf+L/xtwifAArucAxCnwG1GdrREfEXDhScA7RfuQYU
	/XKaot9yk2u1bJvKm8mKeqsb/wGIfT0=
Subject: Ping: [PATCH v3 00/15] zstd decompression for DomU-s + fallout /
 consolidation
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <ff096d95-c074-2558-ba7b-adf702e3d239@suse.com>
Date: Thu, 15 Apr 2021 11:20:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 10:46, Jan Beulich wrote:
> Only patches 1 and 2 are strictly intended for 4.15, paralleling
> the recent Dom0 side work (and re-using many of the files
> introduced there, for the stubdom build), but ones up to at least
> patch 6 may still want considering (and 4 already has a release
> ack).
> 
> 01: libxenguest: add get_unaligned_le32()
> 02: libxenguest: support zstd compressed kernels
> 03: xen/decompress: make helper symbols static
> 04: libxenguest: "standardize" LZO kernel decompression code
> 05: libxenguest: drop redundant decompression declarations
> 06: libxenguest: simplify kernel decompression
> 07: gunzip: drop INIT{,DATA} and STATIC

While these have all gone in, ...

> 08: bunzip: replace INIT
> 09: unlzo: replace INIT
> 10: unlzma: replace INIT
> 11: unlz4: replace INIT
> 12: unxz: replace INIT{,DATA} and STATIC
> 13: unzstd: replace INIT{,DATA} and STATIC
> 14: xen/decompress: drop STATIC and INIT
> 15: unzstd: make helper symbols static

... may I please ask for an ack (or otherwise) on these?

Jan

