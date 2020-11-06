Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DE2A92BA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20528.46479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kay4g-0000as-JZ; Fri, 06 Nov 2020 09:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20528.46479; Fri, 06 Nov 2020 09:30:26 +0000
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
	id 1kay4g-0000aT-GQ; Fri, 06 Nov 2020 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 20528;
 Fri, 06 Nov 2020 09:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kay4e-0000aN-Qh
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:30:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 167c5157-bbae-40d2-8c65-c31a2ce6ba2c;
 Fri, 06 Nov 2020 09:30:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB635AC35;
 Fri,  6 Nov 2020 09:30:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kay4e-0000aN-Qh
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:30:24 +0000
X-Inumbo-ID: 167c5157-bbae-40d2-8c65-c31a2ce6ba2c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 167c5157-bbae-40d2-8c65-c31a2ce6ba2c;
	Fri, 06 Nov 2020 09:30:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8YALmS3K80DAZopt76sKC9xNv+zUz9dzUqEri7d1gN8=;
	b=HMVQwkmrdB+hkHLtybJxD8vnxwmz3tQYpVS7BlIX9gQjH0SfOCf9wdvCLuE0HGL991W2JI
	zZe7EeT7AqPyqwOly8lYMsLBPWJ/0OX5nnO/D+Lq/LPzjDkm3tdS3Td4jzvTuzUvb3QKVj
	QTW99cHwWIfVa560ySsdFbDA+Z+fLFw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DB635AC35;
	Fri,  6 Nov 2020 09:30:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/9] x86/p2m: hook adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Message-ID: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Date: Fri, 6 Nov 2020 10:30:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This started out with me getting confused by the two write_p2m_entry()
hooks we have - there really ought to be no more than one, or if two
were absolutely needed they imo would better have distinct names. Other
adjustment opportunities (and I hope they're improvements) were found
while getting rid of that one unnecessary layer of indirect calls.

v2 has a build fix for clang in patch 3 and a few new patches.

1: p2m: paging_write_p2m_entry() is a private function
2: p2m: collapse the two ->write_p2m_entry() hooks
3: p2m: suppress audit_p2m hook when possible
4: HAP: move nested-P2M flush calculations out of locked region
5: p2m: split write_p2m_entry() hook
6: p2m: avoid unnecessary calls of write_p2m_entry_pre() hook
7: p2m: pass old PTE directly to write_p2m_entry_pre() hook
8: shadow: cosmetics to sh_unshadow_for_p2m_change()
9: shadow: adjust TLB flushing in sh_unshadow_for_p2m_change()

Jan

