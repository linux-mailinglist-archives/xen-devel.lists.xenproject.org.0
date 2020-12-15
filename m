Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396FD2DB0EF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54377.94434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCtd-0000IN-6B; Tue, 15 Dec 2020 16:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54377.94434; Tue, 15 Dec 2020 16:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCtd-0000Hy-35; Tue, 15 Dec 2020 16:09:53 +0000
Received: by outflank-mailman (input) for mailman id 54377;
 Tue, 15 Dec 2020 16:09:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpCtb-0000Ht-Km
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:09:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9c349bf-a42c-442e-8d64-94bb4bce43b3;
 Tue, 15 Dec 2020 16:09:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E443ACE0;
 Tue, 15 Dec 2020 16:09:49 +0000 (UTC)
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
X-Inumbo-ID: e9c349bf-a42c-442e-8d64-94bb4bce43b3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608048589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fs2bOX9OQpj4Kvrk0iflV9QhGelJlvbitAZKY2EqpUc=;
	b=h3klwOCA764KDvdLGiJll41rgg7q1E+Uav5Uwf8dq8i9PvrCjkavRbeJDhFqvQFPWMB2Cc
	ep4911oUKZOcKAvu8z+ylOXU8e5o4P31Bw5z7qJ0suXRsk7XspaKMooGgtdYRXJDeTnw0F
	sAFpe3wSIWpd9ZmnXOqyZbSHTkSDOJc=
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86: XSA-348 follow-up
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Date: Tue, 15 Dec 2020 17:09:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The changes for this XSA introduced an inefficiency and could
do with some further hardening. Addressing of this wasn't
sensible as part of the XSA, though (but you may take this as
an explanation of why this starts out as v2).

1: x86: verify function type (and maybe attribute) in switch_stack_and_jump()
2: x86: clobber registers in switch_stack_and_jump() when !LIVEPATCH
3: x86/PV: avoid double stack reset during schedule tail handling
4: livepatch: adjust a stale comment

Jan

