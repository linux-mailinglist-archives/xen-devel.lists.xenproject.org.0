Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9FBDA14
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 10:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD2rp-000844-DG; Wed, 25 Sep 2019 08:41:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD2ro-00083p-46
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 08:41:44 +0000
X-Inumbo-ID: 4c95f678-df70-11e9-962c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4c95f678-df70-11e9-962c-12813bfff9fa;
 Wed, 25 Sep 2019 08:41:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D849AC3F;
 Wed, 25 Sep 2019 08:41:42 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18ed3227-38be-09bf-420f-a125813b5e78@suse.com>
Date: Wed, 25 Sep 2019 10:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925070503.13850-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/sched: fix freeing per-vcpu data in
 sched_move_domain()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAwOTowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBjYXNlIG9mIGFu
IGFsbG9jYXRpb24gZXJyb3Igb2YgcGVyLXZjcHUgZGF0YSBpbiBzY2hlZF9tb3ZlX2RvbWFpbigp
Cj4gdGhlIGFscmVhZHkgYWxsb2NhdGVkIGRhdGEgaXMgZnJlZWQganVzdCB1c2luZyB4ZnJlZSgp
LiBUaGlzIGlzIHdyb25nCj4gYXMgc29tZSBzY2hlZHVsZXJzIG5lZWQgdG8gZG8gYWRkaXRpb25h
bCBvcGVyYXRpb25zIChlLmcuIHRoZSBhcmluYzY1Mwo+IHNjaGVkdWxlciBuZWVkcyB0byByZW1v
dmUgdGhlIHZjcHUtZGF0YSBmcm9tIGEgbGlzdCkuCj4gCj4gU28gaW5zdGVhZCB4ZnJlZSgpIG1h
a2UgdXNlIG9mIHRoZSBzY2hlZF9mcmVlX3ZkYXRhKCkgaG9vay4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
