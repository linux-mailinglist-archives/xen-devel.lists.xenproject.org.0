Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78335168026
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:26:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59E6-0000Sv-VS; Fri, 21 Feb 2020 14:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j59E5-0000So-8S
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:24:21 +0000
X-Inumbo-ID: d95c15d2-54b5-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d95c15d2-54b5-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 14:24:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DDD1B213;
 Fri, 21 Feb 2020 14:24:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
 <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
 <3a7a760f-2212-01f8-3e2c-8383e7f74177@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fe649f4a-3e0c-4beb-8030-67cabf81cca7@suse.com>
Date: Fri, 21 Feb 2020 15:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3a7a760f-2212-01f8-3e2c-8383e7f74177@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAgMTU6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAyLjIwMjAgMTU6
MTYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIxLjAyLjIwIDE1OjExLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuLAo+Pj4KPj4+IE9uIDIxLzAyLzIwMjAgMTQ6MDYsIErD
vHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMjAgMTQ6NDksIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMjEvMDIvMjAyMCAxMzo0NiwgSsO8cmdlbiBHcm/D
nyB3cm90ZToKPj4+Pj4+IE9uIDIxLjAyLjIwIDE0OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+Pj4+
PiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICswMDAwLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4+Pj4+Pj4+PiBIaSwKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBPbiAyMC8wMi8yMDIwIDE3
OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+Pj4+Pj4gQWxsb3cgYSBDUFUgYWxyZWFk
eSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxzbyBsb2NrCj4+Pj4+Pj4+Pj4g
aXQgaW4KPj4+Pj4+Pj4+PiByZWFkIG1vZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyBy
ZWFkIGxvY2tpbmcgYSByd2xvY2sgdGhhdCdzCj4+Pj4+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0
aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+Pj4+
Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2Fz
ZS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJp
dHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvCj4+Pj4+Pj4+Pj4gc3VwcG9ydAo+Pj4+Pj4+
Pj4+IHVwIHRvIDE2Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0ZSBsb2NrIG1hc2sgdG8g
MiBiaXRzOiBvbmUgdG8KPj4+Pj4+Pj4+PiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVy
cyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUKPj4+Pj4+Pj4+PiBvdGhlciB0bwo+Pj4+Pj4+
Pj4+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3RlIHRoZSB3cml0
ZSByZWxhdGVkIGRhdGEKPj4+Pj4+Pj4+PiBpcyB1c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9uZSBp
biBvcmRlciB0byBiZSBhYmxlIHRvIGNsZWFyIGl0IChhbmQKPj4+Pj4+Pj4+PiB0aHVzIHJlbGVh
c2UgdGhlIGxvY2spIHVzaW5nIGEgMTZiaXQgYXRvbWljIHdyaXRlLgo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBjb25jdXJyZW50IHJlYWRl
cnMgZnJvbQo+Pj4+Pj4+Pj4+IDE2Nzc3MjE2IHRvCj4+Pj4+Pj4+Pj4gNjU1MzYsIEkgdGhpbmsg
dGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4+Pj4+
Pj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1
cmVzIHN1cHBvcnQKPj4+Pj4+Pj4+PiBhdG9taWMKPj4+Pj4+Pj4+PiBvcGVyYXRpb25zIG9uIDY0
Yml0IGludGVnZXJzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUgdG8g
c3VwcG9ydCBhdG9taWMgb3BlcmF0aW9ucyBvbiA2NC1iaXQgaW50ZWdlcnMuCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+ICDCoMKgIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190
ICpsb2NrKQo+Pj4+Pj4+Pj4+ICDCoMKgIHsKPj4+Pj4+Pj4+PiAtwqDCoMKgIC8qCj4+Pj4+Pj4+
Pj4gLcKgwqDCoMKgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBj
bGVhcmVkIGRpcmVjdGx5Lgo+Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIE90aGVyd2lzZSwgYW4gYXRv
bWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+Pj4+PiAtwqDC
oMKgwqAgKi8KPj4+Pj4+Pj4+PiAtwqDCoMKgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxvY2st
PmNudHMpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBh
dG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkCj4+Pj4+Pj4+Pj4gZGlyZWN0bHkuICovCj4+Pj4+Pj4+
Pj4gK8KgwqDCoCBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9j
ay0+Y250cykpKTsKPj4+Pj4+Pj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0g
MTYpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgd3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZsb2NrLT5j
bnRzLCAwKTsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8g
Y2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5IGludG8gYQo+Pj4+Pj4+Pj4gdWludDE2X3QuIFlv
dQo+Pj4+Pj4+Pj4gd291bGQgYXQgbGVhc3Qgd2FudCB0byB1c2UgJmxvY2stPmNudHMuY291bnRl
ciBoZXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTdXJlLCBJIHdhcyB3b25kZXJpbmcgYWJvdXQgdGhp
cyBteXNlbGYuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdpbGwgd2FpdCBmb3IgbW9yZSBjb21tZW50cywg
bm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCj4+Pj4+Pj4+IGNvbW1pdCBp
ZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNzdWVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSXQncyBtb3JlIHRo
YW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxpa2UK
Pj4+Pj4+PiB0aGlzIG9uZSBpcyBlbmRpYW5uZXNzLXVuc2FmZSwgYW5kIGhlbmNlIGEgdHJhcCB3
YWl0aW5nIGZvciBhIGJpZwo+Pj4+Pj4+IGVuZGlhbiBwb3J0IGF0dGVtcHQgdG8gZmFsbCBpbnRv
LiBBdCB0aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCBjYXVzZQo+Pj4+Pj4+IGEgYnVpbGQgZmFp
bHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIGl0IHdh
cwo+Pj4+Pj4+IGVuZGlhbm5lc3Mtc2FmZS4KPj4+Pj4+Cj4+Pj4+PiBXb3VsZG4ndCBhIHVuaW9u
IGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+Pj4+Pgo+Pj4+PiBZb3Ugd291bGQgbm90IGJlIGFibGUg
dG8gdXNlIGF0b21pY190IGluIHRoYXQgY2FzZSBhcyB5b3UgY2FuJ3QKPj4+Pj4gYXNzdW1lIHRo
ZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4KPj4+Pgo+Pj4+IHVuaW9uIHJ3bG9ja3dvcmQgewo+
Pj4+ICDCoMKgwqDCoCBhdG9taWNfdCBjbnRzOwo+Pj4+ICDCoMKgwqDCoCB1aW50MzJfdCB2YWw7
Cj4+Pj4gIMKgwqDCoMKgIHN0cnVjdCB7Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3Qg
d3JpdGU7Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3QgcmVhZGVyczsKPj4+PiAgwqDC
oMKgwqAgfTsKPj4+PiB9Owo+Pj4+Cj4+Pj4gc3RhdGljIGlubGluZSBjb25zdCB1aW50MzJfdCBf
cXJfYmlhcygKPj4+PiAgwqDCoMKgwqAgY29uc3QgdW5pb24gcndsb2Nrd29yZCB7Cj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqAgLndyaXRlID0gMCwKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCAucmVhZGVy
cyA9IDEKPj4+PiAgwqDCoMKgwqAgfSB4Owo+Pj4+Cj4+Pj4gIMKgwqDCoMKgIHJldHVybiB4LnZh
bDsKPj4+PiB9Cj4+Pj4KPj4+PiAuLi4KPj4+PiAgwqDCoMKgwqAgY250cyA9IGF0b21pY19hZGRf
cmV0dXJuKF9xcl9iaWFzKCksICZsb2NrLT5jbnRzKTsKPj4+PiAuLi4KPj4+Pgo+Pj4+IEkgZ3Vl
c3MgdGhpcyBzaG91bGQgZG8gdGhlIHRyaWNrLCBubz8KPj4+Cj4+PiBZb3UgYXJlIGFzc3VtaW5n
IHRoZSBhdG9taWNfdCBsYXlvdXQgd2hpY2ggSSB3b3VsZCByYXRoZXIgbm8gd2FudCB0bwo+Pj4g
aGFwcGVuLgo+Pgo+PiBUaGF0IGFscmVhZHkgaGFwcGVuZWQuIHJ3bG9jay5oIGFscmVhZHkgYXNz
dW1lcyBhdG9taWNfdCB0byBiZSAzMiBiaXRzCj4+IHdpZGUuCj4gCj4gRXhhY3RseSAzMiBiaXRz
LCBvciBhdCBsZWFzdCBhcyBtYW55PwoKVmFsdWUgaXMgcmVhZCBpbnRvIGEgdTMyIHZhcmlhYmxl
IGFuZCB0aGVuIGFuIHVwZGF0ZSB2aWEgY21weGNoZygpIGlzCmRvbmUgdXNpbmcgdGhhdCB2YWx1
ZSBmb3IgY29tcGFyaXNvbi4gU28gYW55IGFkZGl0aW9uYWwgYml0cyB3aWxsIGJlCmxvc3QgYW5k
IHVwZGF0ZSB3aWxsIG5ldmVyIHN1Y2NlZWQgKHNlZSBxdWV1ZV93cml0ZV9sb2NrX3Nsb3dwYXRo
KCkpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
