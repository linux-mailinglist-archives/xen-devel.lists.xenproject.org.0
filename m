Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1F3555E1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 15:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105976.202641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmE5-0004G4-UR; Tue, 06 Apr 2021 13:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105976.202641; Tue, 06 Apr 2021 13:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmE5-0004Ff-Qw; Tue, 06 Apr 2021 13:58:41 +0000
Received: by outflank-mailman (input) for mailman id 105976;
 Tue, 06 Apr 2021 13:58:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTmE4-0004Fa-II
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 13:58:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58c1221b-4609-47bd-9105-b73b813c0b4f;
 Tue, 06 Apr 2021 13:58:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B082B1AE;
 Tue,  6 Apr 2021 13:58:39 +0000 (UTC)
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
X-Inumbo-ID: 58c1221b-4609-47bd-9105-b73b813c0b4f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617717519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=owQiH4Hvh1+5WKZYNe+4TSGqD+WcQErGYE9h7jSnLzE=;
	b=TS3HVH7nRC55vrgICtsL2s0yesR05zH7lwJgFL2/kkyFtrk1/PPPINbDn4iNQdUao/nprt
	nBKFEAVHlAFBLKzMyZ1kh0F/SmxvlPzNwrmrjhEEu1TgW5g0cgQxXinSWJhg/08mr6UL4F
	8VDaFa/lYFV+k0tO1RpN5+jpQEZvd/g=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86: asm-offsets.h and !PV32 adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Date: Tue, 6 Apr 2021 15:58:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is a rework of the previously posted (now) 1st patch plus two
new ones.

1: don't build unused entry code when !PV32
2: x86: slim down hypercall handling when !PV32
3: x86: avoid building COMPAT code when !HVM && !PV32

Jan

