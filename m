Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA2366E8F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114777.218774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEFd-0007WE-FT; Wed, 21 Apr 2021 14:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114777.218774; Wed, 21 Apr 2021 14:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEFd-0007Vc-CB; Wed, 21 Apr 2021 14:54:49 +0000
Received: by outflank-mailman (input) for mailman id 114777;
 Wed, 21 Apr 2021 14:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEFb-0007VQ-W3
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:54:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92f763f3-70eb-41cb-8f21-9180ffba85e1;
 Wed, 21 Apr 2021 14:54:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8318AD8A;
 Wed, 21 Apr 2021 14:54:45 +0000 (UTC)
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
X-Inumbo-ID: 92f763f3-70eb-41cb-8f21-9180ffba85e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619016886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=baVbHeaFpUHOoNNbdk+uVfa5XQKMT3TNCD4TV0hYMkc=;
	b=m2OioZfDKHsX3nrdfqUjFtDwlQnn20Et7qSeEz+Zzysk6UsW1bHGbmav56msdc993oQSsz
	tfGU59WlWDubHANeEr5g0oMyN8XY3n+QmhZ9pVThHZ6wkuSo18rnPOeU7ZFJRaG0emE+KW
	rQsD3ApceeS6eCJT/apjqfW+TZQY+50=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] assorted replacement of x[mz]alloc_bytes()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Date: Wed, 21 Apr 2021 16:54:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In the long run I think we want to do away with these type-unsafe
interfaces, the more that they also request (typically) excess
alignment. This series of entirely independent patches is
eliminating the instances where it's relatively clear that they're
not just "blob" allocations.

v2 only has commit messages extended.

1: x86/MCE: avoid effectively open-coding xmalloc_array()
2: x86/HVM: avoid effectively open-coding xmalloc_array()
3: x86/oprofile: avoid effectively open-coding xmalloc_array()
4: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
5: EFI/runtime: avoid effectively open-coding xmalloc_array()
6: kexec: avoid effectively open-coding xzalloc_flex_struct()
7: video/lfb: avoid effectively open-coding xzalloc_array()
8: Arm/optee: don't open-code xzalloc_flex_struct()

Jan

