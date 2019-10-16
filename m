Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4AD8E43
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:45:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgkj-0001eN-GF; Wed, 16 Oct 2019 10:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QYkk=YJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iKgkh-0001db-Nw
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:41:59 +0000
X-Inumbo-ID: 93c23d3b-f001-11e9-93b0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93c23d3b-f001-11e9-93b0-12813bfff9fa;
 Wed, 16 Oct 2019 10:41:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC87EB4F5;
 Wed, 16 Oct 2019 10:41:56 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
 <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
 <23974.61064.928585.36020@mariner.uk.xensource.com>
 <3f7be099-158d-e10b-7934-19c7fd9e9c75@citrix.com>
 <1531968b-6657-14b4-c740-85995f21b521@arm.com>
 <a41acb21-8390-935f-4897-f1e5ade81a4c@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <81f13638-1697-1cc3-fefc-f14cd8ca9655@suse.com>
Date: Wed, 16 Oct 2019 12:41:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a41acb21-8390-935f-4897-f1e5ade81a4c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTAuMTkgMTI6MzgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvMTYvMTkgMTE6
MzEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgR2VvcmdlLAo+Pgo+PiBPbiAxNi8xMC8y
MDE5IDExOjIyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gMTAvMTYvMTkgMTE6MTggQU0s
IElhbiBKYWNrc29uIHdyb3RlOgo+Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXMgKCJSZTog
W1BBVENIIGZvci00LjEzXSB4ZW4vYXJtOiBEb24ndCB1c2UKPj4+PiBfZW5kIGluIGlzX3hlbl9m
aXhlZF9tZm4oKSIpOgo+Pj4+PiBNeSBzdWdnZXN0aW9uIGlzIGdvaW5nIHRvIHdvcms6ICJ0aGUg
Y29tcGlsZXIgc2VlcyB0aHJvdWdoIGNhc3RzIgo+Pj4+PiByZWZlcnJlZCB0byBjb21wYXJpc29u
cyBiZXR3ZWVuIHBvaW50ZXJzLCB3aGVyZSB3ZSB0ZW1wb3JhcmlseSBjYXN0ZWQKPj4+Pj4gYm90
aCBwb2ludGVycyB0byBpbnRlZ2VycyBhbmQgYmFjayB0byBwb2ludGVycyB2aWEgYSBNQUNSTy4g
VGhhdCBjYXNlCj4+Pj4+IHdhcyBpZmZ5IGJlY2F1c2UgdGhlIE1BQ1JPIHdhcyBjbGVhcmx5IGEg
d29ya2Fyb3VuZCB0aGUgc3BlYy4KPj4+Pj4KPj4+Pj4gSGVyZSB0aGUgc2l0dWF0aW9uIGlzIGRp
ZmZlcmVudC4gRm9yIG9uZSwgd2UgYXJlIGRvaW5nIGFyaXRobWV0aWMuIEFsc28KPj4+Pj4gdmly
dF90b19tYWRkciBhbHJlYWR5IHRha2VzIGEgdmFkZHJfdCBhcyBhcmd1bWVudC4gU28gaW5zdGVh
ZCBvZiBkb2luZwo+Pj4+PiBwb2ludGVycyBhcml0aG1ldGljLCB0aGVuIGNvbnZlcnRpbmcgdG8g
dmFkZHJfdCwgd2UgYXJlIGNvbnZlcnRpbmcgdG8KPj4+Pj4gdmFkZHJfdCBmaXJzdCwgdGhlbiBk
b2luZyBhcml0aG1ldGljcywgd2hpY2ggaXMgZmluZSBib3RoIGZyb20gYSBDOTkKPj4+Pj4gcG9p
bnQgb2YgdmlldyBhbmQgZXZlbiBhIE1JU1JBIEMgcG9pbnQgb2Ygdmlldy4gSSBjYW4ndCBzZWUg
YSBwcm9ibGVtCj4+Pj4+IHdpdGggdGhhdC4gSSBhbSBzdXJlIGFzIEkgcmVhc29uYWJsZSBjYW4g
YmUgOi0pCj4+Pj4KPj4+PiBGVEFPRCBJIHRoaW5rIHlvdSBhcmUgc3VnZ2VzdGluZyB0aGlzOgo+
Pj4+ICDCoCAtICvCoMKgwqDCoCAobWZuX3RvX21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihf
ZW5kIC0gMSkpKQo+Pj4+ICDCoCArICvCoMKgwqDCoCAobWZuX3RvX21hZGRyKG1mbikgPD0gdmly
dF90b19tYWRkcigoKHZhZGRyX3QpX2VuZCAtIDEpKSkKPj4+Pgo+Pj4+IHZpcnRfdG9fbWFkZHIo
dmEpIGlzIGEgbWFjcm8gd2hpY2ggZXhwYW5kcyB0bwo+Pj4+ICDCoMKgwqAgX192aXJ0X3RvX21h
ZGRyKCh2YWRkcl90KSh2YSkpCj4+Pj4KPj4+PiBTbyB3aGF0IGlzIGhhcHBlbmluZyBoZXJlIGlz
IHRoYXQgdGhlIGNhc3QgdG8gYW4gaW50ZWdlciB0eXBlIGlzIGJlaW5nCj4+Pj4gZG9uZSBiZWZv
cmUgdGhlIHN1YnRyYWN0aW9uLgo+Pj4+Cj4+Pj4gV2l0aG91dCB0aGUgY2FzdCwgeW91IGFyZSBj
YWxjdWxhdGluZyB0aGUgcG9pbnRlciB2YWx1ZSBfZW5kLTEgZnJvbQo+Pj4+IHRoZSB2YWx1ZSBf
ZW5kLCB3aGljaCBpcyBVQi7CoCBXaXRoIHRoZSBjYXN0IHlvdSBhcmUgY2FsY3VsYXRpbmcgYW4K
Pj4+PiBpbnRlZ2VyIHZhbHVlLsKgIHZhZGRyX3QgaXMgdW5zaWduZWQsIHNvIGFsbCBhcml0aG1l
dGljIG9wZXJhdGlvbnMgYXJlCj4+Pj4gZGVmaW5lZC7CoCBOb3RoaW5nIGNhc3RzIHRoZSByZXN1
bHQgYmFjayB0byB0aGUgImZvcmJpZGRlbiIgKHdpdGggdGhpcwo+Pj4+IHByb3ZlbmFuY2UpIHBv
aW50ZXIgdmFsdWUsIHNvIGFsbCBpcyB3ZWxsLgo+Pj4+Cj4+Pj4gKFdpdGggdGhlIG1hY3JvIGV4
cGFuc2lvbiB0aGUgY2FzdCBoYXBwZW5zIHR3aWNlLsKgIFRoaXMgaXMgcHJvYmFibHkKPj4+PiBi
ZXR0ZXIgdGhhbiB1c2luZyBfX3ZpcnRfdG9fbWFkZHIgaGVyZS4pCj4+Pj4KPj4+PiBJZSwgaW4g
dGhpcyBjYXNlIEkgYWdyZWUgd2l0aCBTdGVmYW5vLsKgIFRoZSBjYXN0IGlzIGJvdGggbmVjZXNz
YXJ5IGFuZAo+Pj4+IHN1ZmZpY2llbnQuCj4+Pgo+Pj4gTWF5YmUgSSBtaXNzZWQgc29tZXRoaW5n
LCBidXQgd2h5IGFyZSB3ZSB1c2luZyBgPD1gIGF0IGFsbD/CoCBXaHkgbm90IHVzZQo+Pj4gYDxg
Pwo+Pj4KPj4+IE9yIGlzIHRoaXMgc29tZSB3ZWlyZCBDIHBvaW50ZXIgY29tcGFyaXNvbiBVQiB0
aGluZz8KPj4KPj4gX2VuZCBtYXkgbm90IGJlIG1hcHBlZCBpbiB0aGUgdmlydHVhbCBhZGRyZXNz
IHNwYWNlLiBUaGlzIGlzIHRoZSBjYXNlCj4+IHdoZW4gdGhlIHNpemUgb2YgWGVuIGlzIHBhZ2Ut
YWxpZ25lZC4gU28gX2VuZCB3aWxsIHBvaW50IHRvIHRoZSBuZXh0IHBhZ2UuCj4+Cj4+IHZpcnRf
dG9fbWFkZHIoKSBjYW5ub3QgZmFpbCBzbyBpdCBzaG91bGQgb25seSBiZSBjYWxsZWQgb24gdmFs
aWQgdmlydHVhbAo+PiBhZGRyZXNzLiBUaGUgYmVoYXZpb3IgaXMgdW5kZWZpbmVkIGluIGFsbCB0
aGUgb3RoZXIgY2FzZXMuCj4+Cj4+IE9uIHg4NiwgeW91IG1pZ2h0IGJlIGFibGUgdG8gZ2V0IGF3
YXkgYmVjYXVzZSB5b3UgdHJhbnNsYXRlIHRoZSB2aXJ0dWFsCj4+IGFkZHJlc3MgdG8gcGh5c2lj
YWwgYWRkcmVzcyBpbiBzb2Z0d2FyZS4KPj4KPj4gT24gQXJtLCB3ZSBhcmUgdXNpbmcgdGhlIGhh
cmR3YXJlIGluc3RydWN0aW9uIHRvIGRvIHRoZSB0cmFuc2xhdGlvbi4gQXMKPj4gX2VuZCBpcyBu
b3QgYWx3YXlzIG1hcHBlZCwgdGhlbiB0aGUgdHJhbnNsYXRpb24gbWF5IGZhaWwuIEluIG90aGVy
IHdvcmQsCj4+IFhlbiB3aWxsIGNyYXNoLgo+IAo+IE5vbmUgb2YgdGhpcyBleHBsYWlucyBteSBx
dWVzdGlvbi4KPiAKPiBJcyBpdCBub3QgdGhlIGNhc2UgdGhhdCBpZiBgbWZuX3RvX21hZGRyKG1m
bikgPD0gdmlydF90b19tYWRkcihfZW5kLTEpYAo+IGlzIHRydWUsIHRoZW4gYG1mbl90b19tYWRk
cihtZm4pIDwgdmlydF90b19tYWRkcihfZW5kKWAgd2lsbCBiZSB0cnVlLAo+IGFuZCB0aGF0IGlm
IGBtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKF9lbmQtMSlgIGlzIGZhbHNlLCB0
aGVuCj4gYG1mbl90b19tYWRkcihtZm4pIDwgdmlydF90b19tYWRkcihfZW5kKWAgd2lsbCBhbHNv
IGJlIGZhbHNlPwo+IAo+IFVuZGVyIHdoYXQgY29uZGl0aW9ucyB3b3VsZCB0aGV5IGJlIGRpZmZl
cmVudD8KCkluIGNhc2UgdmlydF90b19tYWRkcihfZW5kKSBpcyB1bmRlZmluZWQgZHVlIHRvIG5v
IHRyYW5zbGF0aW9uIGJlaW5nCmF2YWlsYWJsZT8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
