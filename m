Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE914EB6C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:00:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKxo-00031V-7f; Fri, 21 Jun 2019 14:56:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heKxm-00031Q-OV
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:56:26 +0000
X-Inumbo-ID: bc53cd64-9434-11e9-adc6-dba15e7671d6
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc53cd64-9434-11e9-adc6-dba15e7671d6;
 Fri, 21 Jun 2019 14:56:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 08:56:22 -0600
Message-Id: <5D0CF016020000780023A30D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 08:56:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
 <20190618172245.GA16087@amd.com>
 <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
 <20190619155447.GA20907@amd.com>
 <5D0C7B3B0200007800239F12@prv1-mh.provo.novell.com>
 <20190621142925.GA19049@amd.com>
In-Reply-To: <20190621142925.GA19049@amd.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE2OjI5LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6Mzc6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxOS4wNi4xOSBhdCAxNzo1NCwgPEJyaWFuLldvb2RzQGFtZC5jb20+IHdy
b3RlOgo+PiA+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEyOjIwOjQwQU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMTguMDYuMTkgYXQgMTk6MjIsIDxCcmlhbi5Xb29k
c0BhbWQuY29tPiB3cm90ZToKPj4gPj4gPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwNjo0Mjoz
M0FNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4gPj4gPj4+IE9uIDEwLjA2LjE5IGF0
IDE4OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+ID4+ID4gT24g
MjMvMDUvMjAxOSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+ID4+IFRCRDogV2Ug
bWF5IHdhbnQgdG8gdmVyaWZ5IHRoYXQgSExUIGluZGVlZCBpcyBjb25maWd1cmVkIHRvIGVudGVy
IENDNi4KPj4gPj4gPj4gPiAKPj4gPj4gPj4gPiBJIGNhbid0IGFjdHVhbGx5IHNwb3QgYW55dGhp
bmcgd2hpY2ggdGFsa3MgYWJvdXQgSExUIGRpcmVjdGx5LiAgVGhlCj4+ID4+ID4+ID4gY2xvc2Vz
dCBJIGNhbiBwb3N0IGlzIENGT0ggKGNhY2hlIGZsdXNoIG9uIGhhbHQpIHdoaWNoIGlzIGFuCj4+
ID4+ID4+ID4gYXV0by10cmFuc2l0aW9uIGZyb20gQ0MxIHRvIENDNiBhZnRlciBhIHNwZWNpZmlj
IHRpbWVvdXQsIGJ1dCB0aGUKPj4gPj4gPj4gPiB3b3JkaW5nIHN1Z2dlc3RzIHRoYXQgbXdhaXQg
d291bGQgYWxzbyB0YWtlIHRoaXMgcGF0aC4KPj4gPj4gPj4gCj4+ID4+ID4+IFdlbGwsIEkgaGFk
IGNvbWUgYWNyb3NzIGEgc2VjdGlvbiBkZXNjcmliaW5nIGhvdyBITFQgY2FuIGJlCj4+ID4+ID4+
IGNvbmZpZ3VyZWQgdG8gYmUgdGhlIHNhbWUgYWN0aW9uIGFzIHRoZSBJL08gcG9ydCByZWFkIGZy
b20gb25lCj4+ID4+ID4+IG9mIHRoZSB0aHJlZSBwb3J0cyBpbnZvbHZlZCBpbiBDLXN0YXRlIG1h
bmFnZW1lbnQKPj4gPj4gPj4gKENTdGF0ZUJhc2VBZGRyKzAuLi4yKS4gQnV0IEkgY2FuJ3Qgc2Vl
bSB0byBmaW5kIHRoaXMgYWdhaW4uCj4+ID4+ID4+IAo+PiA+PiA+PiBBcyB0byBNV0FJVCBiZWhh
dmluZyB0aGUgc2FtZSwgSSBkb24ndCB0aGluayBJIGNhbiBzcG90IHByb29mCj4+ID4+ID4+IG9m
IHlvdXIgaW50ZXJwcmV0YXRpb24gb3IgcHJvb2Ygb2YgQnJpYW4ncy4KPj4gPj4gPiAKPj4gPj4g
PiBJdCdzIG5vdCByZWFsbHkgZG9jdW1lbnRlZCBjbGVhcmx5LiAgSSBnb3QgbXkgaW5mb3JtYXRp
b24gZnJvbSB0aGUgSFcKPj4gPj4gPiBlbmdpbmVlcnMuICBJJ3ZlIGFscmVhZHkgcG9zdGVkIHdo
YXQgaW5mb3JtYXRpb24gSSBrbm93IHNvIEkgd29uJ3QKPj4gPj4gPiByZXBlYXQgaXQuCj4+ID4+
IAo+PiA+PiBBdCBsZWFzdCBhIHBvaW50ZXIgdG8gd2hlcmUgeW91IGhhZCBzdGF0ZWQgdGhpcyB3
b3VsZCBoYXZlIGJlZW4KPj4gPj4gbmljZS4gSWlyYyB0aGVyZSdzIG5vIHByb21vdGlvbiBpbnRv
IENDNiBpbiB0aGF0IGNhc2UsIGluIGNvbnRyYXN0Cj4+ID4+IHRvIEFuZHJldydzIHJlYWRpbmcg
b2YgdGhlIGRvYy4KPj4gPiAKPj4gPiAmbXdhaXRfdjFfcGF0Y2hzZXQKPj4gCj4+IEhtbSwgSSd2
ZSBsb29rZWQgdGhyb3VnaCB0aGUgcGF0Y2ggZGVzY3JpcHRpb25zIHRoZXJlIGFnYWluLCBidXQg
SQo+PiBjYW4ndCBmaW5kIGFueSBleHBsaWNpdCBzdGF0ZW1lbnQgdG8gdGhlIGVmZmVjdCBvZiB0
aGVyZSBiZWluZyBubwo+PiBwcm9tb3Rpb24gaW50byBkZWVwZXIgc3RhdGVzIHdoZW4gdXNpbmcg
TVdBSVQuCj4gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTAyL21zZzAyMDA3Lmh0bWwgCgpUaGFua3MuIFllcywgaXQgbWF5IGJlIGlt
cGxpZWQgZnJvbSB0aGVyZSwgYnV0IHRvIG1lIGl0J3Mgc3RpbGwgbm90CmV4cGxpY2l0LiBBbHNv
IHJlY2FsbCB0aGF0IGl0IHdhcyBBbmRyZXcgb3JpZ2luYWxseSBhc2tpbmcgaWYgYW55CnByb21v
dGlvbiBmcm9tIENDMSBpcyBwb3NzaWJsZS4gSSdtIGZpbmUgd2l0aCB5b3UgdGVsbGluZyBtZSBp
dCdzCm5vdCwgYnV0IEFuZHJldyBtYXkgc3RpbGwgd2FudCB5b3UgcG9pbnRpbmcgaGltIGF0IHdo
ZXJlIHRoaXMKaXMgd3JpdHRlbiBkb3duLgoKPiBTaW5jZSB5b3UncmUgdW5kZXIgTkRBLCBJIGNh
biBzZW5kIHlvdSB0aGUgZW1haWwgSSByZWNlaXZlZCBmcm9tIHRoZSBIVwo+IGVuZ2luZWVyaW5n
IGJ1dCBhcyBhIGJhc2ljIHJlY2FwOgo+IAo+IElmIHRoZSBIVyBpcyBjb25maWd1cmVkIHRvIHVz
ZSBDQzYgZm9yIEhMVCAoQ0M2IGlzIGVuYWJsZWQgYW5kIHNvbWUKPiBvdGhlciBOREEgYml0cyB3
aGljaCBnZXRzIE9SJ2Qgd2l0aCBmaXJtd2FyZSBzbyB5b3UgY2FuIG9ubHkKPiBmdW5jdGlvbmFs
bHkgQ0M2IG9uIEhMVCBvZmYsIGJ1dCBjYW4ndCBtYWtlIHN1cmUgaXQncyBvbiksIHRoZW4gdGhl
Cj4gZmxvdyBpczoKPiAxKSBITFQKPiAyKSB0aW1lcgo+IDMpIGZsdXNoIHRoZSBjYWNoZXMgZXRj
Cj4gNCkgQ0M2Cj4gCj4gVGhpcyBjYW4gYmUgaW50ZXJydXB0ZWQgdGhvdWdoLiAgVGhlIEhXIGVu
Z2luZWVyIHNhaWQgdGhhdCB3aGlsZSB0aGV5Cj4gYXJlbid0IHRoZSBzYW1lIChhcyBJTyBiYXNl
ZCBDLXN0YXRlcyksIHRoZXkgZW5kIHVwIGF0IHRoZSBzYW1lIHBsYWNlLgo+IAo+IFRoZSB3aG9s
ZSByZWFzb24gSExUIHdhcyBzZWxlY3RlZCB0byBiZSB1c2VkIGluIG15IHBhdGNoZXMgaXMgYmVj
YXVzZQo+IHdlIGNhbid0IGxvb2sgaW4gdGhlIENTVCB0YWJsZSBmcm9tIFhlbiBhbmQgaXQncyBh
bHdheXMgc2FmZSB0byB1c2UsCj4gZXZlbiBpZiBDQzYgaXMgZGlzYWJsZWQgaW4gQklPUyAod2hp
Y2ggd2UgY2FuJ3QgdGVsbCkuICBBdCB0aGlzIHBvaW50LAo+IEknbSByZXBlYXRpbmcgb3VyIGNv
bnZlcnNpb24gd2UgaGFkIGluIG15IHYxIHBhdGNoIHNldC4gIElmIHlvdSBuZWVkCj4gYW55IGZ1
cnRoZXIgaW5mbywgbGV0IG1lIGtub3cuCgpUaGFua3MsIEkgcmVjYWxsIGFsbCBvZiB0aGlzLiBJ
IGRvbid0IHNlZSB0aG91Z2ggaG93IGl0J3MgcmVsYXRlZCB0byB0aGUKcXVlc3Rpb24gb2Ygd2hl
dGhlciB0aGUgQ1BVIHdvdWxkIHJlYWxseSByZW1haW4gaW4gQzEgd2hlbiB1c2luZwpNV0FJVCAo
aS5lLiBnb2luZyBiYWNrIHRvIEFuZHJldydzIG9yaWdpbmFsIGZpbmRpbmcgb2YgcHJvbW90aW9u
IGZyb20KQ0MxIHRvIENDNikuIE5vdyBJIGRvIHJlYWxpemUgdGhhdCBDMSAhPSBDQzEsIGJ1dCB0
aGlzIGRvZXNuJ3QgaGVscApjbGFyaWZ5aW5nIHRoaW5ncyBpbiBhbnkgd2F5LgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
