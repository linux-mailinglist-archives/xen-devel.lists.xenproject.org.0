Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C18769D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 11:51:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw1V5-0006C7-N7; Fri, 09 Aug 2019 09:47:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw1V4-0006C2-7X
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 09:47:54 +0000
X-Inumbo-ID: bf3b486e-ba8a-11e9-8883-27120e3ff66d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf3b486e-ba8a-11e9-8883-27120e3ff66d;
 Fri, 09 Aug 2019 09:47:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41914B0E6;
 Fri,  9 Aug 2019 09:47:48 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20190802130730.15942-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <631515e6-2426-940b-63a0-bd2f770083ae@suse.com>
Date: Fri, 9 Aug 2019 11:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802130730.15942-1-jgross@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/3] xen/sched: use new idle scheduler for
 free cpus
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMTkgMTU6MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gVGhlc2UgdGhyZWUgcGF0
Y2hlcyBoYXZlIGJlZW4gY2FydmVkIG91dCBmcm9tIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMK
PiBhcyB0aGV5IGFyZSBzdWZmaWNpZW50bHkgaW5kZXBlbmRlbnQgdG8gYmUgYXBwbGllZCBldmVu
IHdpdGhvdXQgdGhlIGJpZwo+IHNlcmllcy4KPiAKPiBXaXRob3V0IHRoaXMgbGl0dGxlIHNlcmll
cyB0aGVyZSBhcmUgbWVzc2FnZXMgbGlrZSB0aGUgZm9sbG93aW5nIHRvIGJlCj4gc2VlbiBvbiB0
aGUgY29uc29sZSB3aGVuIGJvb3Rpbmcgd2l0aCBzbXQ9MDoKPiAKPiAoWEVOKSBBZGRpbmcgY3B1
IDEgdG8gcnVucXVldWUgMAo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCj4gKFhFTikg
Q1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KPiAoWEVOKSBDUFUgMSBzdGlsbCBub3QgZGVhZC4uLgo+
IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCj4gCj4gQnkgYXNzaWduaW5nIGNwdXMgdG8g
Q3B1cG9vbC0wIG9ubHkgYWZ0ZXIgYWxsIGNwdXMgYXJlIHVwIGFuZCBieSBub3QKPiB1c2luZyB0
aGUgbW9yZSBjb21wbGljYXRlZCBjcmVkaXQyIHNjaGVkdWxlciBmb3IgY3B1cyBub3QgaW4gYW55
Cj4gY3B1cG9vbCB0aGlzIHNpdHVhdGlvbiBjYW4gc2ltcGx5IG5vIGxvbmdlciBoYXBwZW4sIGFz
IHBhcmtpbmcgdGhlIG5vdAo+IHRvIGJlIHN0YXJ0ZWQgdGhyZWFkcyBpcyBkb25lIGJlZm9yZS4K
PiAKPiBKdWVyZ2VuIEdyb3NzICgzKToKPiAgICB4ZW4vc2NoZWQ6IHBvcHVsYXRlIGNwdXBvb2ww
IG9ubHkgYWZ0ZXIgYWxsIGNwdXMgYXJlIHVwCj4gICAgeGVuL3NjaGVkOiByZW1vdmUgY3B1IGZy
b20gcG9vbDAgYmVmb3JlIHJlbW92aW5nIGl0Cj4gICAgeGVuL3NjaGVkOiBhZGQgbWluaW1hbGlz
dGljIGlkbGUgc2NoZWR1bGVyIGZvciBmcmVlIGNwdXMKCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRv
IGhhdmUgc29tZSBmZWVkYmFjayBvbiB0aGlzIHNlcmllcz8KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
