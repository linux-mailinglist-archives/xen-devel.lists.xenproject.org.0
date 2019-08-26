Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869E9CBBD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 10:38:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ASr-0005aL-Mu; Mon, 26 Aug 2019 08:35:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ASp-0005aG-Ip
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 08:34:59 +0000
X-Inumbo-ID: 62ba94a0-c7dc-11e9-ae23-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62ba94a0-c7dc-11e9-ae23-12813bfff9fa;
 Mon, 26 Aug 2019 08:34:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF68EB011;
 Mon, 26 Aug 2019 08:34:56 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190802130730.15942-1-jgross@suse.com>
 <b763c05de403033802e28cee5854e86aadf3dc1f.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <99c0e9bc-f3b8-f2f1-7523-bef16d311b72@suse.com>
Date: Mon, 26 Aug 2019 10:34:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b763c05de403033802e28cee5854e86aadf3dc1f.camel@suse.com>
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDguMTkgMTc6NTEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OC0wMiBhdCAxNTowNyArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlc2UgdGhyZWUg
cGF0Y2hlcyBoYXZlIGJlZW4gY2FydmVkIG91dCBmcm9tIG15IGNvcmUgc2NoZWR1bGluZwo+PiBz
ZXJpZXMKPj4gYXMgdGhleSBhcmUgc3VmZmljaWVudGx5IGluZGVwZW5kZW50IHRvIGJlIGFwcGxp
ZWQgZXZlbiB3aXRob3V0IHRoZQo+PiBiaWcKPj4gc2VyaWVzLgo+Pgo+PiBXaXRob3V0IHRoaXMg
bGl0dGxlIHNlcmllcyB0aGVyZSBhcmUgbWVzc2FnZXMgbGlrZSB0aGUgZm9sbG93aW5nIHRvCj4+
IGJlCj4+IHNlZW4gb24gdGhlIGNvbnNvbGUgd2hlbiBib290aW5nIHdpdGggc210PTA6Cj4+Cj4+
IChYRU4pIEFkZGluZyBjcHUgMSB0byBydW5xdWV1ZSAwCj4+IChYRU4pIENQVSAxIHN0aWxsIG5v
dCBkZWFkLi4uCj4+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCj4+IChYRU4pIENQVSAx
IHN0aWxsIG5vdCBkZWFkLi4uCj4+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCj4+Cj4+
IEJ5IGFzc2lnbmluZyBjcHVzIHRvIENwdXBvb2wtMCBvbmx5IGFmdGVyIGFsbCBjcHVzIGFyZSB1
cCBhbmQgYnkgbm90Cj4+IHVzaW5nIHRoZSBtb3JlIGNvbXBsaWNhdGVkIGNyZWRpdDIgc2NoZWR1
bGVyIGZvciBjcHVzIG5vdCBpbiBhbnkKPj4gY3B1cG9vbCB0aGlzIHNpdHVhdGlvbiBjYW4gc2lt
cGx5IG5vIGxvbmdlciBoYXBwZW4sIGFzIHBhcmtpbmcgdGhlCj4+IG5vdAo+PiB0byBiZSBzdGFy
dGVkIHRocmVhZHMgaXMgZG9uZSBiZWZvcmUuCj4+Cj4gQW5kIHRoaXMgaXMgbm90IHRoZSBvbmx5
IHByb2JsZW0sIHNvbHZlZCBieSB0aGlzIHNlcmllcyAob3IgYW4KPiBlcXVpdmFsZW50IGFwcHJv
YWNoKS4KPiAKPiBSaWdodCBub3csIENQVXMgdGhhdCBhcmUgbm90IGluIGFueSBwb29sLCBzdGls
bCBiZWxvbmcgdG8gUG9vbC0wJ3MKPiBzY2hlZHVsZXIuIFRoaXMgZm9yY2VzIHVzIHRvIG1ha2Us
IHdpdGhpbiB0aGUgc2NoZWR1bGVyLCBleHRyYSBlZmZvcnQKPiB0byBhdm9pZCBhY3R1YWxseSBy
dW5uaW5nIHZDUFVzIG9uIHRob3NlLgo+IAo+IEluIHRoZSBjYXNlIG9mIENyZWRpdDEsIHRoaXMg
YWxzbyBjYXVzZSBpc3N1ZSB0byB3ZWlnaHRzCj4gKHJlKWRpc3RyaWJ1dGlvbiwgYXMgdGhlIG51
bWJlciBvZiBDUFVzIGF2YWlsYWJsZSB0byB0aGUgc2NoZWR1bGVyIGlzCj4gd3JvbmcuCj4gCj4g
U28sIHdlIGFic29sdXRlbHkgd2FudCBzb21ldGhpbmcgbGlrZSB0aGlzLgo+IAo+IFRoaXMgaXMg
ZGVzY3JpYmVkIGluIHRoZSBjaGFuZ2Vsb2cgb2YgY29tbWl0IGU3MTkxOTIwMjYxZCAoInhlbjoK
PiBjcmVkaXQyOiBuZXZlciBjb25zaWRlciBDUFVzIG91dHNpZGUgb2Ygb3VyIGNwdXBvb2wiKS4K
PiAKPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBtZW50aW9uIHRoaXMgaW4gb25lIG9mIHRoZSBj
aGFuZ2Vsb2dzIG9mIHRoZQo+IHNlcmllcyAocGF0Y2ggMyB3b3VsZCBiZSB0aGUgYmVzdCBwbGFj
ZSwgSSB0aGluaykuCgpPa2F5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
