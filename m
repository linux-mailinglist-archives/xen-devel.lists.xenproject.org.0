Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D32F7F26
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68258.122172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qn6-0007rr-2Y; Fri, 15 Jan 2021 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68258.122172; Fri, 15 Jan 2021 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qn5-0007rP-VA; Fri, 15 Jan 2021 15:13:31 +0000
Received: by outflank-mailman (input) for mailman id 68258;
 Fri, 15 Jan 2021 15:13:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Qn4-0007rE-Ut
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:13:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b54ea35-8994-49dc-b554-e240d2fccedc;
 Fri, 15 Jan 2021 15:13:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E122AB7F;
 Fri, 15 Jan 2021 15:13:29 +0000 (UTC)
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
X-Inumbo-ID: 9b54ea35-8994-49dc-b554-e240d2fccedc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610723609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3jFCZ3LEY4MwUcmJdkfQP2Otk9/7V3UphYBvL7hnzo=;
	b=mSzHZb6AADSNA7v21e4S2A2WSgpDDFSkVssJbVlVvzpVeBMd/1TRZaTcVZLOzcOatGi+MQ
	73AggS9lo2OT0zj3+C6ljGIT4/SlW5mkU9fgxtUAWoj2z/4ypY77wXkPFJewiG0uOKQHPw
	EMJmaiJ00+oZNK5YE/9+WbYnfFx49Dg=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] gnttab: pin count related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <43168334-20af-a0ed-95ec-8eef5200877b@suse.com>
Date: Fri, 15 Jan 2021 16:13:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Getting rid of the literal number has been something I've been
hoping to see happen for perhaps over 10 years, along with
doing away with some unnecessary refusal of operations. The
other patch is "collateral damage" from doing that change.

1: gnttab: adjust pin count overflow checks
2: gnttab: consolidate pin-to-status syncing

Jan

