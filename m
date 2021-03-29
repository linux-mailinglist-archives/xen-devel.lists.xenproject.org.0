Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEC34CEAA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 13:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102957.196529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpv3-000725-At; Mon, 29 Mar 2021 11:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102957.196529; Mon, 29 Mar 2021 11:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpv3-00071g-7i; Mon, 29 Mar 2021 11:18:53 +0000
Received: by outflank-mailman (input) for mailman id 102957;
 Mon, 29 Mar 2021 11:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQpv1-00071b-Pe
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 11:18:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a837f9e-3658-4da8-ac3b-8a8c2ce4c52e;
 Mon, 29 Mar 2021 11:18:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43D3EB457;
 Mon, 29 Mar 2021 11:18:50 +0000 (UTC)
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
X-Inumbo-ID: 5a837f9e-3658-4da8-ac3b-8a8c2ce4c52e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617016730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aUYrzmbWRoapn0e4WTautW36RFz6N2tJyLtjAT6FsLY=;
	b=mUkNftuGQXaGWKIrd/XcuU1IvUGqKMYq7BKzKaYOmolKhWztUKU2KLEEnegtp0DdHyZftb
	h70XjCoX80qWqeYruaQigZ4b2Jxpgi6e+SIrSpY1xxAL4OV1UHdEHnvxalMIYDuEI6n3iP
	yz19EeH90LgxpMN+st2SHE/0NTs745s=
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.14.2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Message-ID: <38e7fa74-8e2a-2411-90ce-8485677d6fca@suse.com>
Date: Mon, 29 Mar 2021 13:18:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

in a little over two weeks time the release is due. Please point out
backports you find missing from the respective staging branches, but
which you consider relevant.

One that I have queued already is

b9b3082002ca VT-d: correct off-by-1 in number-of-IOMMUs check

Like for 4.13.3, f6f787de9896 ("x86/timer: Fix boot on Intel systems
using ITSSPRC static PIT clock gating") may need reverting. Unless by
that time we have at least a final workaround for the follow-on issue
it has caused (which now looks to be at least not unlikely anymore).

Jan

