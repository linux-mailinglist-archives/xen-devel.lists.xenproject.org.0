Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B184D2C0A69
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34274.65189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBrv-0007Pb-7W; Mon, 23 Nov 2020 13:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34274.65189; Mon, 23 Nov 2020 13:26:59 +0000
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
	id 1khBrv-0007PC-4P; Mon, 23 Nov 2020 13:26:59 +0000
Received: by outflank-mailman (input) for mailman id 34274;
 Mon, 23 Nov 2020 13:26:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBrt-0007P7-Jx
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:26:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe2199b3-d489-481a-909a-c1b57fabc7f1;
 Mon, 23 Nov 2020 13:26:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4179AC2E;
 Mon, 23 Nov 2020 13:26:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBrt-0007P7-Jx
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:26:57 +0000
X-Inumbo-ID: fe2199b3-d489-481a-909a-c1b57fabc7f1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fe2199b3-d489-481a-909a-c1b57fabc7f1;
	Mon, 23 Nov 2020 13:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ermRl1yZ3mVSGF+O9FQRzJSxMX/19Is0gCXXBe7D0qQ=;
	b=oOFoGa1/XjQI1xXTaviyBRs30PTssMo2ZlRzH3gkpE38wyvAJI72E18R0x8x/2EuYSBU7j
	B7xvv3gZ+K4VRwYVo4G/2o440HlPqH/Q+1lrnxqNieA1eBQclE3BMefExOAePN3TRj7lxx
	jJcj4YvhM0PXbU1KJfcqZrzTzm9z3iM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E4179AC2E;
	Mon, 23 Nov 2020 13:26:55 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/5] evtchn: (not so) recent XSAs follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Date: Mon, 23 Nov 2020 14:26:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These are grouped into a series largely because of their origin,
not so much because there are heavy dependencies among them.
Compared to v2, there's a new patch resulting from review feedback,
and the last patch should be fully usable now. See also the
individual patches.

1: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()
2: avoid access tearing for ->virq_to_evtchn[] accesses
3: convert vIRQ lock to an r/w one
4: convert domain event lock to an r/w one
5: don't call Xen consumer callback with per-channel lock held

Jan

