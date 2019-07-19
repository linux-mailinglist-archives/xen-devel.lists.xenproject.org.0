Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8C6E057
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 06:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoKpf-0002V6-Hs; Fri, 19 Jul 2019 04:49:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoKpe-0002V1-Bz
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 04:49:22 +0000
X-Inumbo-ID: 9228c54e-a9e0-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9228c54e-a9e0-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 04:49:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E71EAD09;
 Fri, 19 Jul 2019 04:49:19 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-5-jgross@suse.com>
 <545dedb5b964e21f4bbedd72c68ec3700acc3dde.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <97a82335-874a-a55c-df89-01d36209fda6@suse.com>
Date: Fri, 19 Jul 2019 06:49:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <545dedb5b964e21f4bbedd72c68ec3700acc3dde.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 04/60] xen/sched: use new sched_unit instead
 of vcpu in scheduler interfaces
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
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMTkgMTk6NDQsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAxOS0w
NS0yOCBhdCAxMjozMiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gb3JkZXIgdG8g
cHJlcGFyZSBjb3JlLSBhbmQgc29ja2V0LXNjaGVkdWxpbmcgdXNlIGEgbmV3IHN0cnVjdAo+PiBz
Y2hlZF91bml0IGluc3RlYWQgb2Ygc3RydWN0IHZjcHUgZm9yIGludGVyZmFjZXMgb2YgdGhlIGRp
ZmZlcmVudAo+PiBzY2hlZHVsZXJzLgo+Pgo+PiBSZW5hbWUgdGhlIHBlci1zY2hlZHVsZXIgZnVu
Y3Rpb25zIGluc2VydF92Y3B1IGFuZCByZW1vdmVfdmNwdSB0bwo+PiBpbnNlcnRfdW5pdCBhbmQg
cmVtb3ZlX3VuaXQgdG8gcmVmbGVjdCB0aGUgY2hhbmdlIG9mIHRoZSBwYXJhbWV0ZXIuCj4+IElu
IHRoZSBzY2hlZHVsZXJzIHJlbmFtZSBsb2NhbCBmdW5jdGlvbnMgc3dpdGNoZWQgdG8gc2NoZWRf
dW5pdCwgdG9vLgo+Pgo+PiBGb3Igbm93IHRoaXMgbmV3IHN0cnVjdCB3aWxsIGNvbnRhaW4gYSB2
Y3B1IHBvaW50ZXIgb25seSBhbmQgaXMKPj4gYWxsb2NhdGVkIG9uIHRoZSBzdGFjay4gVGhpcyB3
aWxsIGJlIGNoYW5nZWQgbGF0ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4KPiBUaGlzIGxvb2tzIGdvb2QgdG8gbWUuCj4gCj4gT25lIHRo
aW5nIHRoYXQgY2FtZSB0byBtaW5kLCBpcyB0aGF0IHRoZSB2YXJpb3VzIGZ1bmN0aW9uIHBhcmFt
ZXRlcnMKPiBhbmQgbG9jYWwgdmFyaWFibGVzIGNhbGxlZCAndW5pdCcsIGNvdWxkIGJlIGNhbGxl
ZCAnc3UnLgo+IAo+IEl0J3MgYSBjb250cmFjdGlvbiBvZiAnc2NoZWRfdW5pdCcsIGxpa2UsIGUu
Zy4sICd2JyBvciAndmMnIHdlcmUKPiBjb250cmFjdGlvbnMgb2YgJ3ZjcHUnLCBpdCdzIHN0aWxs
IHF1aXRlIGRlc2NyaXB0aXZlLCBpdCdzIHNob3J0LCB3aGljaAo+IGlzIGFsd2F5cyBnb29kLCBJ
TU8sIGFuZCBtaWdodCBtZWFuIGxlc3MgbGluZSB3cmFwIHJlZm9ybWF0dGluZwo+IChjb25zaWRl
cmluZyB0aGF0IGl0J3MgcmVwbGFjaW5nICd2JyBvciAndmMnKS4KPiAKPiBPZiBjb3Vyc2UsIHRo
aXMgd2lsbCBsaWtlbHkgbWVhbiBjaGFuZ2luZyBhbGwgdGhlIG90aGVyIH42MCBwYXRjaGVzLCBz
bwo+IEknbGwgdW5kZXJzdGFuZCBpZiB5b3Ugc2F5IHRoYXQgaXQgd291bGQgYmUgdG9vIG11Y2gu
CgpJIHByZWZlciAidW5pdCIsIGFzIGl0IGlzIG1vcmUgcmVhZGFibGUgYW5kIHRoZSBlZmZvcnQg
dG8gZG8gdGhlIGNoYW5nZQp3b3VsZCBiZSBxdWl0ZSBsYXJnZSAocmVwbGFjaW5nICJpdGVtIiBi
eSAidW5pdCIgd2FzIGRvYWJsZSB2aWEgc2VkLAp3aGlsZSB0aGlzIGNoYW5nZSB3b3VsZCByZXF1
aXJlIG1vcmUgbWFudWFsIGludGVydmVudGlvbikuCgo+IAo+IEFsc28uLi4KPiAKPj4gaW5kZXgg
MjIwMWZhY2E2Yi4uNzJhMTc3NThhMSAxMDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gQEAgLTI3NSw2ICsyNzUs
MTAgQEAgc3RydWN0IHZjcHUKPj4gICAgICAgc3RydWN0IGFyY2hfdmNwdSBhcmNoOwo+PiAgIH07
Cj4+ICAgCj4+ICtzdHJ1Y3Qgc2NoZWRfdW5pdCB7Cj4+ICsgICAgc3RydWN0IHZjcHUgICAgICAg
ICAgICp2Y3B1Owo+PiArfTsKPj4gKwo+Pgo+IElzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdCB0
aGF0IHRoaXMgZmllbGQgaXMgZ29pbmcgdG8gYmUgcmVuYW1lZAo+IHZjcHVfbGlzdCwgcmlnaHQg
ZnJvbSB0aGlzIHBhdGNoPwoKWWVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
