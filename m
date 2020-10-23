Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85F296B41
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10766.28704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsWi-0005tv-T7; Fri, 23 Oct 2020 08:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10766.28704; Fri, 23 Oct 2020 08:34:20 +0000
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
	id 1kVsWi-0005tW-PZ; Fri, 23 Oct 2020 08:34:20 +0000
Received: by outflank-mailman (input) for mailman id 10766;
 Fri, 23 Oct 2020 08:34:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVsWg-0005tP-Kg
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:34:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 041ab3a9-529d-4d1b-9de3-b938425e909f;
 Fri, 23 Oct 2020 08:34:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15FD9ABF4;
 Fri, 23 Oct 2020 08:34:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVsWg-0005tP-Kg
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:34:18 +0000
X-Inumbo-ID: 041ab3a9-529d-4d1b-9de3-b938425e909f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 041ab3a9-529d-4d1b-9de3-b938425e909f;
	Fri, 23 Oct 2020 08:34:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603442056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VH+yNN6+P3LEDkeW4LMEv6Dufqx0Ycnx/RNfURcuaVY=;
	b=Jl0djD1rtDoKVdyK6tnEd9mLUiCWgrAIw03J476n7O4xz6sZAB6mhOdeiL70VM64963jR1
	pY5uOZddvwrhe3JT56VKtIvmLb9GA4EewJnEJQxxTRh+Uuu4zxFmInHAHG7/rF31N2pOXY
	HGO9Fbg0NLoEvCP/zgETR+eZGlhhbQQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 15FD9ABF4;
	Fri, 23 Oct 2020 08:34:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/7] x86: some assembler macro rework
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Date: Fri, 23 Oct 2020 10:34:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Parts of this were discussed in the context of Andrew's CET-SS work.
Further parts simply fit the underlying picture. And a few patches
towards the end get attached here simply because of their dependency.
Patch 7 is new.

All patches except for the new ones in principle have acks / R-b-s
which would allow them to go in. However, there still the controversy
on the naming of the newly introduced header in patch 1 (which
subsequent patches then add to). There hasn't been a name suggestion
which would - imo - truly represent an improvement.

It's also still not really clear to me what - if any - changes to
make to patch 2. As said there I'd be willing to drop some of the
changes made, but not all. Prior discussion hasn't led to a clear
understanding on my part of what's wanted to be kept / dropped. It
could have looked like the entire patch was wanted to go away, but I
don't think I can agree with this. (I could see about moving this to
the end of the series, to unblock what's currently the remainder.)

1: replace __ASM_{CL,ST}AC
2: reduce CET-SS related #ifdef-ary
3: drop ASM_{CL,ST}AC
4: fold indirect_thunk_asm.h into asm-defns.h
5: guard against straight-line speculation past RET
6: limit amount of INT3 in IND_THUNK_*
7: make guarding against straight-line speculation optional

Jan

