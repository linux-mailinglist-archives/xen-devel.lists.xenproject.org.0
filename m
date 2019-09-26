Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17735BEB6C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 06:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDLkc-0001pm-KX; Thu, 26 Sep 2019 04:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDLkb-0001pf-2y
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 04:51:33 +0000
X-Inumbo-ID: 4f5553e6-e019-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4f5553e6-e019-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 04:51:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC0C5ADDC;
 Thu, 26 Sep 2019 04:51:31 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-27-jgross@suse.com>
 <71a73c6c9224bcaaf1b47a3f0cd0c5a304334300.camel@suse.com>
 <2def1338-8048-58b3-9c5d-a0baf6f3dcb8@suse.com>
 <569f998ccb9a3c1c184c4f2c8244401ad730fb33.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <00d9a8c0-614c-c290-3c36-12d2d3c38096@suse.com>
Date: Thu, 26 Sep 2019 06:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <569f998ccb9a3c1c184c4f2c8244401ad730fb33.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 26/47] xen/sched: Change vcpu_migrate_*()
 to operate on schedule unit
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTg6MzcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0w
OS0yNSBhdCAxNDowNCArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMjUuMDkuMTkg
MDA6MzMsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4KPj4+PiBBcyBpdCBpcyBuZWVkZWQgYW55
d2F5IGNhbGwgdmNwdV9zeW5jX2V4ZWNzdGF0ZSgpIGZvciBlYWNoCj4+Pj4gdmNwdSBvZiB0aGUg
dW5pdCB3aGVuIGNoYW5naW5nIHByb2Nlc3NvcnMuCj4+Pj4KPj4+IEFnYWluLCB3aGF0IGRvIHlv
dSBtZWFuIHdpdGggIkFzIGl0IGlzIG5lZWRlZCBhbnl3YXkiPwo+Pgo+PiBXaGVuIG1vdmluZyBm
cm9tIG9uZSBjcHUgdG8gYW5vdGhlciBvbmUgdGhlIHN0YXRlIG11c3QgYmUgc2F2ZWQgaW4KPj4g
c3RydWN0IHZjcHUgKGluIGNvbnRyYXN0IHRvIGJlaW5nIGhlbGQgcGFydGlhbGx5IGluIHJlZ2lz
dGVycyBvciBvbgo+PiB0aGUKPj4gc3RhY2sgaW4gY2FzZSBvbmx5IHRoZSBpZGxlIHZjcHUgd2Fz
IHNjaGVkdWxlZCBhZnRlcndhcmRzIG9uIHRoZSBvbGQKPj4gY3B1KS4KPj4KPiBTdXJlLgo+IAo+
PiBUaGlzIGlzIGRvbmUgYnkgdmNwdV9zeW5jX2V4ZWNzdGF0ZSgpLiBXaXRob3V0IHRoZSBleHBs
aWNpdCBjYWxsCj4+IGl0IHdvdWxkIGJlIGRvbmUgZWl0aGVyIHdoZW4gdGhlIHZjcHUgaXMgYmVp
bmcgc2NoZWR1bGVkIG9uIHRoZSBuZXcKPj4gY3B1Cj4+IG9yIGlmIGFub3RoZXIgbm9uLWlkbGUg
dmNwdSBpcyBiZWNvbWluZyBhY3RpdmUgb24gdGhlIG9sZCBjcHUuCj4+Cj4gUmlnaHQuIEFuZCBk
b2VzIHRoaXMgdGhlbiBtZWFucyB0aGF0IHdlJ3JlIG5vdyBkb2luZyBpdCB0d2ljZSAoaS5lLiwK
PiBoZXJlIGFuZCBlaXRoZXIgb2YgdGhlIG90aGVyIHBsYWNlcyB5b3UgbWVudGlvbmVkKT8KCk5v
LCBpdCBjaGVja3Mgd2hldGhlciBpdCBoYXMgdG8gZG8gYW55dGhpbmcuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
