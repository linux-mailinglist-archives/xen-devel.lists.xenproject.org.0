Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF92CC00A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42796.77028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTR2-0003t5-3a; Wed, 02 Dec 2020 14:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42796.77028; Wed, 02 Dec 2020 14:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTR1-0003sf-Va; Wed, 02 Dec 2020 14:48:47 +0000
Received: by outflank-mailman (input) for mailman id 42796;
 Wed, 02 Dec 2020 14:48:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkTQz-0003sQ-VL
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:48:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4e3ed96-efd5-4a45-86a5-2e3ceb9cf14e;
 Wed, 02 Dec 2020 14:48:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84E8DAB63;
 Wed,  2 Dec 2020 14:48:44 +0000 (UTC)
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
X-Inumbo-ID: c4e3ed96-efd5-4a45-86a5-2e3ceb9cf14e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606920524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pOUeix5rFQpTEf17eVWovsbIjIYjoeNzqwp31IeSKf0=;
	b=RXouTiTJAOtKSqxd7RXzwS+yoiWc2aekyhAu0Ov4PXcB7SPNuV3Fb+jdzZZ/zJZI7kzRHq
	rBwoD/yCIWdxAT9CGNpgFlWYESM3LFHahCrwiGHVHZEc1EhLaR2sCW+BqvLFrk0WJwNTS7
	MmjBI/v86KjqrAJEik1qqpyEt4mmfu8=
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Hongyan Xia <hx242@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] a tiny bit of header disentangling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
Date: Wed, 2 Dec 2020 15:48:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While reviewing Hongyan's "x86/vmap: handle superpages in
vmap_to_mfn()" it became apparent that the interaction of
xen/mm.h and asm/page.h is problematic. Therefore some basic
page size related definitions get moved out of the latter, and
the mfn_t et al ones out of the former, each into new headers.

While various configurations build fine for me with these
changes in place, it's relatively likely that this may break
some more exotic ones. Such breakage ought to be easy to
resolve, so I hope this risk isn't going to be a hindrance of
the changes here going in.

1: include: don't use asm/page.h from common headers
2: mm: split out mfn_t / gfn_t / pfn_t definitions and helpers

Jan

