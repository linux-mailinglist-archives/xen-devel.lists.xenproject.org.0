Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B82305553
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75787.136540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4fxg-0005PO-TC; Wed, 27 Jan 2021 08:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75787.136540; Wed, 27 Jan 2021 08:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4fxg-0005Oz-Pc; Wed, 27 Jan 2021 08:14:00 +0000
Received: by outflank-mailman (input) for mailman id 75787;
 Wed, 27 Jan 2021 08:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4fxf-0005Ou-8c
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:13:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84ebb0a9-6240-4ece-80f5-4bc8ce66f29a;
 Wed, 27 Jan 2021 08:13:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEEE8B928;
 Wed, 27 Jan 2021 08:13:57 +0000 (UTC)
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
X-Inumbo-ID: 84ebb0a9-6240-4ece-80f5-4bc8ce66f29a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611735237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RO4z4/Ol2UCy+55zfXJQ3hot1SK9y/Uc4AZbFwzEBhc=;
	b=DxFThww7gcuBX0eDcGvhWRIsDhntyQc9CIzy1WCbLQpEl3K/hLRtBFq14yd75e8BFPOqgz
	LarTISUVNouYCz3ZZImv/rgjykg9DNqdpPZlFM4NIof6FwSkaIHmuP9JxtR7pkTxfhbkaN
	w9mFEGzkrTieiZ04FwD5HiBIZzKiNnA=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/6] evtchn: (not so) recent XSAs follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Date: Wed, 27 Jan 2021 09:13:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These are grouped into a series largely because of their origin,
not so much because there are (heavy) dependencies among them.
The main change from v4 is the dropping of the two patches trying
to do away with the double event lock acquires in interdomain
channel handling. See also the individual patches.

1: use per-channel lock where possible
2: convert domain event lock to an r/w one
3: slightly defer lock acquire where possible
4: add helper for port_is_valid() + evtchn_from_port()
5: type adjustments
6: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()

Jan

