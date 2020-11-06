Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF12A9008
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 08:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20413.46310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kavtB-0003RM-7w; Fri, 06 Nov 2020 07:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20413.46310; Fri, 06 Nov 2020 07:10:25 +0000
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
	id 1kavtB-0003Qx-4Z; Fri, 06 Nov 2020 07:10:25 +0000
Received: by outflank-mailman (input) for mailman id 20413;
 Fri, 06 Nov 2020 07:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kavtA-0003Qs-1b
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:10:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6b4e055-bdb2-4878-ade0-0b0770b80ab4;
 Fri, 06 Nov 2020 07:10:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18084AB8F;
 Fri,  6 Nov 2020 07:10:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kavtA-0003Qs-1b
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:10:24 +0000
X-Inumbo-ID: f6b4e055-bdb2-4878-ade0-0b0770b80ab4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f6b4e055-bdb2-4878-ade0-0b0770b80ab4;
	Fri, 06 Nov 2020 07:10:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604646621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8nREtTcjfnzeI+eMBht41WVcOapdA3Tg0/MyKJruAb4=;
	b=rcwCcd6HLqOyJ4Pr8h0zqViohye+ZMz8KFJxCoZ5xbtOcRTUQTfUlCKK96/w7Xu4VA4IF/
	hGnNx4AOi2L8ByaVU3Jo4jvxvZsvzaGA/pWoM7JTYjJsS3Mn/NJs9hwVKHzQEl6dazn4U9
	hQmyvN+eVtOFxrrd3u/N9qeoRzZ3JNc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 18084AB8F;
	Fri,  6 Nov 2020 07:10:21 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] introduce and use xvmalloc() et al / shrink x86 xstate
 area
Message-ID: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
Date: Fri, 6 Nov 2020 08:10:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While these may seem somewhat unrelated, the connection between them
is the middle of the patches

1: mm: introduce xvmalloc() et al and use for grant table allocations
2: x86/xstate: use xvzalloc() for save area allocation
3: x86/xstate: re-size save area when CPUID policy changes

Jan

