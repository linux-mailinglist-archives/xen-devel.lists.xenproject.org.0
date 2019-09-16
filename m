Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06701B4077
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 20:41:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9vs7-0006d2-Ne; Mon, 16 Sep 2019 18:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gi+b=XL=apple.com=afish@srs-us1.protection.inumbo.net>)
 id 1i9vs6-0006cx-6O
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 18:37:10 +0000
X-Inumbo-ID: fd3a0350-d8b0-11e9-978d-bc764e2007e4
Received: from ma1-aaemail-dr-lapp03.apple.com (unknown [17.171.2.72])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd3a0350-d8b0-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 18:37:08 +0000 (UTC)
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 x8GIZuCn049813; Mon, 16 Sep 2019 11:36:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : content-type
 : mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=mmVj1d/8VdkRJRAZhuFscXrF6JynYVyiK4xd+QYTepk=;
 b=Gp66B907H2J/6mxPno0pyqsbxjjNdOfzltXOj7E2sIfort6N356yasH0cikEVN8brdXC
 cDU+ZpkDdppsWrCBBb4XdVZVFWGtArUSQN8qed0H8H9QGwibHAZJ0o/+YdxryuGKONf3
 9WeRDZqmOjorQWxSeaLa/FLLQxZvGilriVXaygZt/1Lj7KDntUdbeI13HLIN3vPgZglI
 PvQpDivm46lUo5iqn2mH/eoNdCt9Roi8EJ4+13CrV4Tk1J+azIwyU9JG2299EPydVYRH
 z5awLsfd3cUqxToaqgwPRWWRY9RWov3FdBUOHLWpC5pBRIF8KYFtRAA1Ej7rSLwVe0e6 nw== 
Received: from mr2-mtap-s03.rno.apple.com (mr2-mtap-s03.rno.apple.com
 [17.179.226.135])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 2v0y6uw7nd-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 16 Sep 2019 11:36:59 -0700
Received: from nwk-mmpp-sz09.apple.com
 (nwk-mmpp-sz09.apple.com [17.128.115.80]) by mr2-mtap-s03.rno.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0PXX00G3YT1MFDF0@mr2-mtap-s03.rno.apple.com>; Mon,
 16 Sep 2019 11:36:58 -0700 (PDT)
Received: from process_milters-daemon.nwk-mmpp-sz09.apple.com by
 nwk-mmpp-sz09.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0PXX00900SL39D00@nwk-mmpp-sz09.apple.com>; Mon,
 16 Sep 2019 11:36:56 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 08777febe38bb384cc57fda39d0586b7
X-Va-E-CD: a5a5e046124b1576edd6ac48f9946ad5
X-Va-R-CD: 5689ef722b0dd46b2e850591228443f8
X-Va-CD: 0
X-Va-ID: f532aa3d-acee-4954-a4da-4b99dffee240
X-V-A: 
X-V-T-CD: 08777febe38bb384cc57fda39d0586b7
X-V-E-CD: a5a5e046124b1576edd6ac48f9946ad5
X-V-R-CD: 5689ef722b0dd46b2e850591228443f8
X-V-CD: 0
X-V-ID: e5b5a9e4-cd01-4149-929b-a17acfbf650d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-09-16_07:,, signatures=0
Received: from [17.235.22.77] (unknown [17.235.22.77])
 by nwk-mmpp-sz09.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0PXX00EUWT1IKX20@nwk-mmpp-sz09.apple.com>; Mon,
 16 Sep 2019 11:36:56 -0700 (PDT)
MIME-version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Andrew Fish <afish@apple.com>
In-reply-to: <26405443-8a65-5d03-dd35-1000ac3fbf0a@redhat.com>
Date: Mon, 16 Sep 2019 11:36:48 -0700
Message-id: <FDC048FC-B33F-49A4-9FC3-DEF91AAC6334@apple.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-10-anthony.perard@citrix.com>
 <26405443-8a65-5d03-dd35-1000ac3fbf0a@redhat.com>
To: devel@edk2.groups.io, lersek@redhat.com
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_07:, , signatures=0
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 09/11] OvmfPkg/XenBusDxe: Fix
 NotifyExitBoot to avoid Memory Allocation Services
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIFNlcCAxNiwgMjAxOSwgYXQgMTA6MzYgQU0sIExhc3psbyBFcnNlayA8bGVyc2VrQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IAo+IE9uIDA5LzEzLzE5IDE2OjUwLCBBbnRob255IFBFUkFSRCB3
cm90ZToKPj4gVGhpcyBwYXRjaCBmaXggdGhlIEVWVF9TSUdOQUxfRVhJVF9CT09UX1NFUlZJQ0VT
IGhhbmRsZXIgdG8gYXZvaWQKPj4gdXNpbmcgdGhlIE1lbW9yeSBBbGxvY2F0aW9uIFNlcnZpY2Vz
Lgo+PiAKPj4gVGhpcyBjb21lcyB3aXRoIGEgbmV3IGludGVyZmFjZSBuYW1lZCBSZWdpc3RlckV4
aXRDYWxsYmFjayBzbyB0aGF0IFBWCj4+IGRyaXZlcnMgY2FuIGRpc2Nvbm5lY3QgZnJvbSB0aGUg
YmFja2VuZCBiZWZvcmUgWGVuQnVzRHhlIGlzIHRlYXJlZAo+PiBkb3duLgo+PiAKPj4gSW5zdGVh
ZCBvZiB1c2luZyBEaXNjb25uZWN0KCkgdG8gdGVhciBkb3duIHRoZSBYZW5CdXMgZHJpdmVyIGFu
ZCB0aGUKPj4gY2hpbGRyZW4gZHJpdmVycywgd2UgYXJlIGdvaW5nIHRvIGFzayBldmVyeSBkcml2
ZXIgdXNpbmcKPj4gWEVOQlVTX1BST1RPQ09MIHRvIGRpc2Nvbm5lY3QgZnJvbSB0aGUgaGFyZHdh
cmUgdmlhIHRoZSBjYWxsYmFjayBzZXQKPj4gd2l0aCBSZWdpc3RlckV4aXRDYWxsYmFjaywgdGhl
biByZXNldCB0aGUgeGVuc3RvcmUgc2hhcmVkIHJpbmcgYW5kCj4+IHRoZSBncmFudCB0YWJsZS4K
PiAKPiBJIHRoaW5rIHRoaXMgYXBwcm9hY2ggLS0gYSBsb3dlci1sZXZlbCBidXMgZHJpdmVyIGNh
bGxpbmcgb3V0IHRvCj4gZGVwZW5kZW50IGRldmljZSBkcml2ZXJzIC0tIGlzIHF1aXRlIHVudXN1
YWwuCj4gCgpMYXN6bG8sCgpJIGFncmVlIGdpdmVuIHRoZSB0aW1lciBldmVudCBhY3Rpdml0eSBp
cyBzdG9wcGVkIHByaW9yIHRvIGNhbGxpbmcgYW55IG9mIHRoZSBFWElUX0JPT1RfU0VSVklDRVMg
ZXZlbnRzIHRoZXJlIGlzIHVzdWFsbHkgbm90IGEgcmVxdWlyZW1lbnQgdG8gY2FsbCB0aGUgZHJp
dmVycyBTdG9wKCkgZnVuY3Rpb24uIEdlbmVyYWxseSBFeGl0IEJvb3QgU2VydmljZXMgZXZlbnRz
IGp1c3QgdHVybiBvZmYgRE1BLCBvciBhbnkgb3RoZXIgaGFyZHdhcmUgdGhhdCBjb3VsZCB0b3Vj
aCBtZW1vcnkgdGhhdCBpcyBiZWluZyBmcmVlZCBiYWNrIGZvciBPUyB1c2FnZS4gU2luY2UgdGhl
IHRpbWVyIGFjdGl2aXR5LCBhbmQgdGh1cyBhbGwgZXZlbnQgYWN0aXZpdHkgaXMgc3RvcHBlZCB0
aGVyZSBpcyBub3QgYSBsb3Qgb2Ygd2F5cyBmb3IgdGhlIGRyaXZlcnMgdG8gZXZlciBoYXZlIGFu
eSBFRkkgY29kZSBydW4gYWdhaW4uIAoKVGhlIG9ubHkgb3RoZXIgZXhjZXB0aW9uIEkgY2FuIHRo
aW5rIG9mIGlzIGlmIHRoZSBPUyBkcml2ZXIgbWFrZXMgc29tZSBraW5kIG9mIGFzc3VtcHRpb24g
YWJvdXQgdGhlIHN0YXRlIG9mIHRoZSBoYXJkd2FyZS4KClRoYW5rcywKCkFuZHJldyBGaXNoCgoK
PiBIb3cgYWJvdXQgdGhlIGZvbGxvd2luZyBpbnN0ZWFkOgo+IAo+IC0gaW50cm9kdWNlIHR3byBY
ZW5CdXNJbyBwcm90b2NvbCBtZW1iZXIgZnVuY3Rpb25zLCBBZGRSZWZlcmVuY2UoKSBhbmQKPiBS
ZW1vdmVSZWZlcmVuY2UoKS4gUmVtb3ZlUmVmZXJlbmNlKCkgc2hvdWxkIHRha2UgYSBCT09MRUFO
IGNhbGxlZAo+ICJIYW5kT2ZmVG9PcyIuIFRoZSBkZXZpY2UgZHJpdmVycyBzaG91bGQgY2FsbCBB
ZGRSZWZlcmVuY2UoKSBqdXN0IGJlZm9yZQo+IGV4aXRpbmcgRHJpdmVyQmluZGluZ1N0YXJ0KCkg
d2l0aCBzdWNjZXNzLCBhbmQgUmVtb3ZlUmVmZXJlbmNlKEZBTFNFKSBpbgo+IERyaXZlckJpbmRp
bmdTdG9wKCkuCj4gCj4gLSB0aGVzZSBwcm90b2NvbCBtZW1iZXIgZnVuY3Rpb25zIHdvdWxkIGlu
Y3JlbWVudCAvIGRlY3JlbWVudCBhCj4gcmVmZXJlbmNlIGNvdW50ZXIgaW4gdGhlIHVuZGVybHlp
bmcgWGVuQnVzIGFic3RyYWN0aW9uLiBBZGRpdGlvbmFsbHksCj4gUmVtb3ZlUmVmZXJlbmNlKCkg
d291bGQgc3RvcmUgdGhlIEhhbmRPZmZUb09zIHBhcmFtZXRlciB0byBhIGJ1cy1sZXZlbAo+IEJP
T0xFQU4gdG9vIChyZWdhcmRsZXNzIG9mIHByZXZpb3VzIHZhbHVlIHN0b3JlZCB0aGVyZSAtLSBh
IFRSVUUtPkZBTFNFCj4gdHJhbnNpdGlvbiB3b3VsZCBuZXZlciBoYXBwZW4gYW55d2F5OyBzZWUg
YmVsb3cpLgo+IAo+IC0gYm90aCBYZW5CdXNEeGUgYW5kIHRoZSBYZW4gZGV2aWNlIGRyaXZlcnMg
c2hvdWxkIHJlZ2lzdGVyIEVCUwo+IGNhbGxiYWNrcywgcGVyIGNvbnRyb2xsZXIgaGFuZGxlIChp
biBCaW5kaW5nU3RhcnQoKSksIGFuZCB1bnJlZ2lzdGVyCj4gdGhlbSAoaW4gQmluZGluZ1N0b3Ao
KSkKPiAKPiAtIHRoZSBvcmRlcmluZyBiZXR3ZWVuIEVCUyBub3RpZmljYXRpb24gZnVuY3Rpb25z
IChxdWV1ZWQgYXQgdGhlIHNhbWUKPiBUUEwpIGlzIHVuc3BlY2lmaWVkLiBJbiB0aGUgZGV2aWNl
IGRyaXZlciBub3RpZmljYXRpb24gZnVuY3Rpb25zLCB0aGUKPiBsYXN0IGFjdGlvbiBzaG91bGQg
YmUgYSBjYWxsIHRvIFhlbkJ1c0lvLT5SZW1vdmVSZWZlcmVuY2UoVFJVRSkgLS0gYWZ0ZXIKPiB0
aGUgZGV2aWNlLXNwZWNpZmljICJmb3JnZXQgbWUiIGFjdGlvbnMgaGF2ZSBiZWVuIGRvbmUuCj4g
Cj4gLSBpZiBSZW1vdmVSZWZlcmVuY2UoKSBnZXRzIGEgVFJVRSBwYXJhbWV0ZXIsIHRoZW4gaXQg
c2hvdWxkIGNoZWNrIHRoZQo+IHJlc3VsdGFudCAocG9zdC1kZWNyZW1lbnQpIHZhbHVlIG9mIHRo
ZSByZWZjb3VudC4gSWYgaXQgaGFzIGdvbmUgdG8KPiB6ZXJvLCBSZW1vdmVSZWZlcmVuY2UoKSBz
aG91bGQgcmUtc2V0IHRoZSB4ZW5idXMgLyB4ZW5zdG9yZSBjb25uZWN0aW9uLgo+IElmIHRoZSBw
YXJhbWV0ZXIgaXMgRkFMU0UsIGl0IHNob3VsZG4ndCBkbyBhbnl0aGluZyBwYXJ0aWN1bGFyIGFm
dGVyCj4gZGVjcmVtZW50aW5nIHRoZSByZWZjb3VudC4KPiAKPiAtIGluIHRoZSBYZW5CdXMgRUJT
IGhhbmRsZXIsIGlmIHRoZSByZWZjb3VudCBpcyBwb3NpdGl2ZSBhdCB0aGUgdGltZSBvZgo+IHRo
ZSBjYWxsLCBub3RoaW5nIHNob3VsZCBiZSBkb25lLiBPdGhlcndpc2UsIGlmIEhhbmRPZmZUb09z
IGlzIFRSVUUsCj4gbm90aGluZyBzaG91bGQgYmUgZG9uZSwgc2ltaWxhcmx5LiBPdGhlcndpc2Us
IHRoZSB4ZW5idXMveGVuc3RvcmUKPiBjb25uZWN0aW9uIHNob3VsZCBiZSByZS1zZXQuCj4gCj4g
VGhlIGlkZWEgaXMgdGhhdCBub3JtYWwgU3RhcnQvU3RvcCBzaG91bGQgbWFuYWdlIHRoZSByZWZj
b3VudCBhcwo+IGV4cGVjdGVkLiBBdCBFeGl0Qm9vdFNlcnZpY2VzKCksIHRoZSBYZW5CdXMgbGV2
ZWwgaGFuZGxlciBzaG91bGQgb25seQo+IGNsZWFyIHRoZSBjb25uZWN0aW9uIHRvIHRoZSBoeXBl
cnZpc29yIGlmIG5vIFJlbW92ZVJlZmVyZW5jZSgpIGNhbGwgaGFzCj4gZG9uZSwgb3Igd2lsbCBk
bywgaXQuIChJZiB0aGUgY291bnRlciBpcyBwb3NpdGl2ZSwgdGhlbiBhIGxhdGVyCj4gUmVtb3Zl
UmVmZXJlbmNlKCkgY2FsbCB3aWxsIGRvIGl0OyBpZiBpdCdzIHplcm8gYnV0IEhhbmRPZmZUb09z
IGlzIFRSVUUsCj4gdGhlbiBpdCdzIGJlZW4gZG9uZSBhbHJlYWR5LiBJZiB0aGUgY291bnRlciBp
cyB6ZXJvIGFuZCB0aGUgQk9PTEVBTiBpcwo+IEZBTFNFLCB0aGVuIGFsbCBkZXZpY2VzIGhhdmUg
YmVlbiBkaXNjb25uZWN0ZWQgbm9ybWFsbHkgd2l0aCBTdG9wKCkgLS0KPiBvciBub25lIGhhdmUg
YmVlbiBjb25uZWN0ZWQgYXQgYWxsIC0tLCBiZWZvcmUgRXhpdEJvb3RTZXJ2aWNlcygpLCBzbyB0
aGUKPiBYZW5CdXMgZHJpdmVyIGl0c2VsZiBoYXMgdG8gYXNrIGZvciBiZWluZyBmb3Jnb3R0ZW4u
KQo+IAo+IEFkbWl0dGVkbHksIHRoaXMgaXMgbW9yZSBjb21wbGljYXRlZCAoZHVlIHRvIHRoZSB1
bnNwZWNpZmllZCBvcmRlcmluZwo+IGJldHdlZW4gRUJTIG5vdGlmaWNhdGlvbnMpLiBJIGp1c3Qg
ZmVlbCBpdCdzIG1vcmUgaWRpb21hdGljIHRvIGdvCj4gdGhyb3VnaCBub3JtYWwgcHJvdG9jb2wg
bWVtYmVyIGZ1bmN0aW9ucyBpbiBFQlMgbm90aWZpY2F0aW9uIGZ1bmN0aW9ucywKPiByYXRoZXIg
dGhhbiBzcGVjaWFsIGNhbGxiYWNrcy4KPiAKPiAoU2lkZSBjb21tZW50OiB0aGUgcmVmZXJlbmNl
IGNvdW50aW5nIGNvdWxkIG5vcm1hbGx5IGJlIHJlcGxhY2VkIGJ5Cj4gZ0JTLT5PcGVuUHJvdG9j
b2xJbmZvcm1hdGlvbigpOyBob3dldmVyLCB0aGF0IHNlcnZpY2UgaXRzZWxmIGFsbG9jYXRlcwo+
IG1lbW9yeSwgc28gd2UgY2FuJ3QgdXNlIGl0IGluIEVCUyBub3RpZmljYXRpb24gZnVuY3Rpb25z
LikKPiAKPiBUaGFua3MKPiBMYXN6bG8KPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IEdy
b3Vwcy5pbyBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91
cC4KPiAKPiBWaWV3L1JlcGx5IE9ubGluZSAoIzQ3MjkyKTogaHR0cHM6Ly9lZGsyLmdyb3Vwcy5p
by9nL2RldmVsL21lc3NhZ2UvNDcyOTIKPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vZ3JvdXBz
LmlvL210LzM0MTI4MDE1LzE3NTUwODQKPiBHcm91cCBPd25lcjogZGV2ZWwrb3duZXJAZWRrMi5n
cm91cHMuaW8KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9lZGsyLmdyb3Vwcy5pby9nL2RldmVsL3Vu
c3ViICBbYWZpc2hAYXBwbGUuY29tXQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
