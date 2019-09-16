Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F88B3DDB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:44:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9t8A-0001Aa-7O; Mon, 16 Sep 2019 15:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9t88-0001AF-EA
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:41:32 +0000
X-Inumbo-ID: 749d1428-d898-11e9-95ef-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 749d1428-d898-11e9-95ef-12813bfff9fa;
 Mon, 16 Sep 2019 15:41:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A5B73082B6D;
 Mon, 16 Sep 2019 15:41:31 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CAA1600C1;
 Mon, 16 Sep 2019 15:41:29 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-7-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <135a493b-bddb-4628-4464-06a4bc1cd029@redhat.com>
Date: Mon, 16 Sep 2019 17:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913145100.303433-7-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 16 Sep 2019 15:41:31 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 06/11] OvmfPkg/XenBusDxe:
 Rework XenStoreProcessMessage to avoid allocating memory
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTMvMTkgMTY6NTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgcGF0Y2ggcmV3
b3JrIFhlblN0b3JlUHJvY2Vzc01lc3NhZ2UgaW4gb3JkZXIgdG8gYXZvaWQgbWVtb3J5Cj4gYWxs
b2NhdGlvbiB3aGVuIGEgcmVwbHkgaXMgZXhwZWN0ZWQuIEluc3RlYWQgb2YgYWxsb2NhdGluZyBh
IGJ1ZmZlcgo+IGZvciB0aGlzIHJlcGx5LCB3ZSBhcmUgZ29pbmcgdG8gY29weSB0byBhIGJ1ZmZl
ciBwYXNzZWQgYnkgdGhlIGNhbGxlci4KPiBGb3IgbWVzc2FnZXMgdGhhdCBhcmVuJ3QgZnVsbHkg
cmVjZWl2ZWQsIHRoZXkgd2lsbCBiZSBzdG9yZWQgaW4gYQo+IGJ1ZmZlciB0aGF0IGhhdmUgYmVl
biBhbGxvY2F0ZWQgYXQgdGhlIGluaXRpYWxpc2F0aW9uIG9mIHRoZSBkcml2ZXIuCj4gCj4gQSB0
ZW1wb3JhcnkgbWVtb3J5IGFsbG9jYXRpb24gaXMgbWFkZSBpbiBYZW5TdG9yZVRhbGt2IGJ1dCB0
aGF0IHdpbGwKPiBiZSByZW1vdmVkIGluIGEgZnVydGhlciBwYXRjaC4KPiAKPiBSZWY6IGh0dHBz
Oi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE5MAo+IFNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQo+
ICBPdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9yZS5jIHwgMjk3ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKSwgMTY3
IGRlbGV0aW9ucygtKQoKU29ycnksIHRvbyBiaWcgZm9yIGEgZGV0YWlsZWQgcmV2aWV3LCBhbmQg
SSdkIGxpa2UgdG8gZ28gdGhyb3VnaCB0aGUKc2VyaWVzIHRvZGF5LiBTbywgYmFzZWQgb24gdGhl
IGRpZmZzdGF0LAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpU
aGFua3MKTGFzemxvCgo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9yZS5j
IGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYwo+IGluZGV4IGNhN2JlMTJkNjguLjAwNGQz
YjYwMjIgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYwo+ICsrKyBi
L092bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMKPiBAQCAtNzIsMjcgKzcyLDYgQEAgc3RydWN0
IF9YRU5TVE9SRV9XQVRDSAo+ICAjZGVmaW5lIFhFTlNUT1JFX1dBVENIX0ZST01fTElOSyhsKSBc
Cj4gICAgQ1IgKGwsIFhFTlNUT1JFX1dBVENILCBMaW5rLCBYRU5TVE9SRV9XQVRDSF9TSUdOQVRV
UkUpCj4gIAo+IC0KPiAtLyoqCj4gLSAqIFN0cnVjdHVyZSBjYXB0dXJpbmcgbWVzc2FnZXMgcmVj
ZWl2ZWQgZnJvbSB0aGUgWGVuU3RvcmUgc2VydmljZS4KPiAtICovCj4gLSNkZWZpbmUgWEVOU1RP
UkVfTUVTU0FHRV9TSUdOQVRVUkUgU0lHTkFUVVJFXzMyICgnWCcsICdTJywgJ3MnLCAnbScpCj4g
LXR5cGVkZWYgc3RydWN0IHsKPiAtICBVSU5UMzIgU2lnbmF0dXJlOwo+IC0gIExJU1RfRU5UUlkg
TGluazsKPiAtCj4gLSAgc3RydWN0IHhzZF9zb2NrbXNnIEhlYWRlcjsKPiAtCj4gLSAgdW5pb24g
ewo+IC0gICAgLyogUXVldWVkIHJlcGxpZXMuICovCj4gLSAgICBzdHJ1Y3Qgewo+IC0gICAgICBD
SEFSOCAqQm9keTsKPiAtICAgIH0gUmVwbHk7Cj4gLSAgfSB1Owo+IC19IFhFTlNUT1JFX01FU1NB
R0U7Cj4gLSNkZWZpbmUgWEVOU1RPUkVfTUVTU0FHRV9GUk9NX0xJTksocikgXAo+IC0gIENSIChy
LCBYRU5TVE9SRV9NRVNTQUdFLCBMaW5rLCBYRU5TVE9SRV9NRVNTQUdFX1NJR05BVFVSRSkKPiAt
Cj4gIC8qKgo+ICAgKiBDb250YWluZXIgZm9yIGFsbCBYZW5TdG9yZSByZWxhdGVkIHN0YXRlLgo+
ICAgKi8KPiBAQCAtMTA1LDIxICs4NCw2IEBAIHR5cGVkZWYgc3RydWN0IHsKPiAgCj4gICAgWEVO
QlVTX0RFVklDRSAqRGV2Owo+ICAKPiAtICAvKioKPiAtICAgKiBBIGxpc3Qgb2YgcmVwbGllcyB0
byBvdXIgcmVxdWVzdHMuCj4gLSAgICoKPiAtICAgKiBUaGUgcmVwbHkgbGlzdCBpcyBmaWxsZWQg
YnkgeHNfcmN2X3RocmVhZCgpLiAgSXQKPiAtICAgKiBpcyBjb25zdW1lZCBieSB0aGUgY29udGV4
dCB0aGF0IGlzc3VlZCB0aGUgcmVxdWVzdAo+IC0gICAqIHRvIHdoaWNoIGEgcmVwbHkgaXMgbWFk
ZS4gIFRoZSByZXF1ZXN0ZXIgYmxvY2tzIGluCj4gLSAgICogWGVuU3RvcmVSZWFkUmVwbHkgKCku
Cj4gLSAgICoKPiAtICAgKiAvbm90ZSBPbmx5IG9uZSByZXF1ZXN0aW5nIGNvbnRleHQgY2FuIGJl
IGFjdGl2ZSBhdCBhIHRpbWUuCj4gLSAgICovCj4gLSAgTElTVF9FTlRSWSBSZXBseUxpc3Q7Cj4g
LQo+IC0gIC8qKiBMb2NrIHByb3RlY3RpbmcgdGhlIHJlcGx5IGxpc3QuICovCj4gLSAgRUZJX0xP
Q0sgUmVwbHlMb2NrOwo+IC0KPiAgICAvKioKPiAgICAgKiBMaXN0IG9mIHJlZ2lzdGVyZWQgd2F0
Y2hlcy4KPiAgICAgKi8KPiBAQCAtMTM2LDYgKzEwMCwxMyBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4g
IAo+ICAgIC8qKiBIYW5kbGUgZm9yIFhlblN0b3JlIGV2ZW50cy4gKi8KPiAgICBFRklfRVZFTlQg
RXZlbnRDaGFubmVsRXZlbnQ7Cj4gKwo+ICsgIC8qKiBCdWZmZXIgdXNlZCB0byBjb3B5IHBheWxv
YWRzIGZyb20gdGhlIHhlbnN0b3JlIHJpbmcgKi8KPiArICAvLyBUaGUgKyAxIGlzIHRvIGFsbG93
IHRvIGhhdmUgYSBcMC4KPiArICBDSEFSOCBCdWZmZXJbWEVOU1RPUkVfUEFZTE9BRF9NQVggKyAx
XTsKPiArCj4gKyAgLyoqIElEIHVzZWQgd2hlbiBzZW5kaW5nIG1lc3NhZ2VzIHRvIHhlbnN0b3Jl
ZCAqLwo+ICsgIFVJTlROIE5leHRSZXF1ZXN0SWQ7Cj4gIH0gWEVOU1RPUkVfUFJJVkFURTsKPiAg
Cj4gIC8vCj4gQEAgLTE0OCw2ICsxMTksMTIgQEAgc3RhdGljIFhFTlNUT1JFX1BSSVZBVEUgeHM7
Cj4gIC8vIFByaXZhdGUgVXRpbGl0eSBGdW5jdGlvbnMKPiAgLy8KPiAgCj4gK1NUQVRJQwo+ICtY
RU5TVE9SRV9TVEFUVVMKPiArWGVuU3RvcmVHZXRFcnJvciAoCj4gKyAgQ09OU1QgQ0hBUjggKkVy
cm9yU3RyCj4gKyAgKTsKPiArCj4gIC8qKgo+ICAgIENvdW50IGFuZCBvcHRpb25hbGx5IHJlY29y
ZCBwb2ludGVycyB0byBhIG51bWJlciBvZiBOVUwgdGVybWluYXRlZAo+ICAgIHN0cmluZ3MgaW4g
YSBidWZmZXIuCj4gQEAgLTYxMyw3MCArNTkwLDEwNiBAQCBYZW5TdG9yZVJlYWRTdG9yZSAoCj4g
ICAgQmxvY2sgcmVhZGluZyB0aGUgbmV4dCBtZXNzYWdlIGZyb20gdGhlIFhlblN0b3JlIHNlcnZp
Y2UgYW5kCj4gICAgcHJvY2VzcyB0aGUgcmVzdWx0Lgo+ICAKPiArICBAcGFyYW0gRXhwZWN0ZWRS
ZXF1ZXN0SWQgICAgICBCbG9jayB1bnRpbCBhIHJlcGx5IHRvIHdpdGggdGhpcyBJRCBpcyBzZWVu
Lgo+ICsgIEBwYXJhbSBFeHBlY3RlZFRyYW5zYWN0aW9uSWQgIElkZW0sIGJ1dCBzaG91bGQgYWxz
byBtYXRjaCB0aGlzIElELgo+ICsgIEBwYXJhbSBCdWZmZXJTaXplICAgICAgICAgICAgIElOOiBz
aXplIG9mIHRoZSBidWZmZXIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVVQ6
IFRoZSByZXR1cm5lZCBsZW5ndGggb2YgdGhlIHJlcGx5Lgo+ICsgIEBwYXJhbSBCdWZmZXIgICAg
ICAgICAgICAgICAgIFRoZSByZXR1cm5lZCBib2R5IG9mIHRoZSByZXBseS4KPiArCj4gICAgQHJl
dHVybiAgWEVOU1RPUkVfU1RBVFVTX1NVQ0NFU1Mgb24gc3VjY2Vzcy4gIE90aGVyd2lzZSBhbiBl
cnJubyB2YWx1ZQo+ICAgICAgICAgICAgIGluZGljYXRpbmcgdGhlIHR5cGUgb2YgZmFpbHVyZSBl
bmNvdW50ZXJlZC4KPiAgKiovCj4gIFNUQVRJQwo+ICBYRU5TVE9SRV9TVEFUVVMKPiAgWGVuU3Rv
cmVQcm9jZXNzTWVzc2FnZSAoCj4gLSAgVk9JRAo+ICsgIElOICAgICBVSU5UMzIgICAgRXhwZWN0
ZWRSZXF1ZXN0SWQsCj4gKyAgSU4gICAgIFVJTlQzMiAgICBFeHBlY3RlZFRyYW5zYWN0aW9uSWQs
Cj4gKyAgSU4gT1VUIFVJTlROICAgICAqQnVmZmVyU2l6ZSBPUFRJT05BTCwKPiArICBJTiBPVVQg
Q0hBUjggICAgICpCdWZmZXIgT1BUSU9OQUwKPiAgICApCj4gIHsKPiAtICBYRU5TVE9SRV9NRVNT
QUdFICpNZXNzYWdlOwo+IC0gIENIQVI4ICpCb2R5Owo+IC0gIFhFTlNUT1JFX1NUQVRVUyBTdGF0
dXM7Cj4gLQo+IC0gIE1lc3NhZ2UgPSBBbGxvY2F0ZVplcm9Qb29sIChzaXplb2YgKFhFTlNUT1JF
X01FU1NBR0UpKTsKPiAtICBNZXNzYWdlLT5TaWduYXR1cmUgPSBYRU5TVE9SRV9NRVNTQUdFX1NJ
R05BVFVSRTsKPiAtICBTdGF0dXMgPSBYZW5TdG9yZVJlYWRTdG9yZSAoJk1lc3NhZ2UtPkhlYWRl
ciwgc2l6ZW9mIChNZXNzYWdlLT5IZWFkZXIpKTsKPiAtICBpZiAoU3RhdHVzICE9IFhFTlNUT1JF
X1NUQVRVU19TVUNDRVNTKSB7Cj4gLSAgICBGcmVlUG9vbCAoTWVzc2FnZSk7Cj4gLSAgICBERUJV
RyAoKEVGSV9EX0VSUk9SLCAiWGVuU3RvcmU6IEVycm9yIHJlYWQgc3RvcmUgKCVkKVxuIiwgU3Rh
dHVzKSk7Cj4gLSAgICByZXR1cm4gU3RhdHVzOwo+IC0gIH0KPiAtCj4gLSAgQm9keSA9IEFsbG9j
YXRlUG9vbCAoTWVzc2FnZS0+SGVhZGVyLmxlbiArIDEpOwo+IC0gIFN0YXR1cyA9IFhlblN0b3Jl
UmVhZFN0b3JlIChCb2R5LCBNZXNzYWdlLT5IZWFkZXIubGVuKTsKPiAtICBpZiAoU3RhdHVzICE9
IFhFTlNUT1JFX1NUQVRVU19TVUNDRVNTKSB7Cj4gLSAgICBGcmVlUG9vbCAoQm9keSk7Cj4gLSAg
ICBGcmVlUG9vbCAoTWVzc2FnZSk7Cj4gLSAgICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiWGVuU3Rv
cmU6IEVycm9yIHJlYWQgc3RvcmUgKCVkKVxuIiwgU3RhdHVzKSk7Cj4gLSAgICByZXR1cm4gU3Rh
dHVzOwo+IC0gIH0KPiAtICBCb2R5W01lc3NhZ2UtPkhlYWRlci5sZW5dID0gJ1wwJzsKPiArICBz
dHJ1Y3QgeHNkX3NvY2ttc2cgSGVhZGVyOwo+ICsgIENIQVI4ICAgICAgICAgICAgICAqUGF5bG9h
ZDsKPiArICBYRU5TVE9SRV9TVEFUVVMgICAgU3RhdHVzOwo+ICAKPiAtICBpZiAoTWVzc2FnZS0+
SGVhZGVyLnR5cGUgPT0gWFNfV0FUQ0hfRVZFTlQpIHsKPiAtICAgIENPTlNUIENIQVI4ICAgICpX
YXRjaEV2ZW50UGF0aDsKPiAtICAgIENPTlNUIENIQVI4ICAgICpXYXRjaEV2ZW50VG9rZW47Cj4g
LSAgICBWT0lEICAgICAgICAgICAqQ29udmVydGVkVG9rZW47Cj4gLSAgICBYRU5TVE9SRV9XQVRD
SCAqV2F0Y2g7Cj4gKyAgd2hpbGUgKFRSVUUpIHsKPiAgCj4gLSAgICAvLwo+IC0gICAgLy8gUGFy
c2UgV0FUQ0hfRVZFTlQgbWVzc2FnZXMKPiAtICAgIC8vICAgPHBhdGg+XDA8dG9rZW4+XDAKPiAt
ICAgIC8vCj4gLSAgICBXYXRjaEV2ZW50UGF0aCA9IEJvZHk7Cj4gLSAgICBXYXRjaEV2ZW50VG9r
ZW4gPSBXYXRjaEV2ZW50UGF0aCArIEFzY2lpU3RyU2l6ZSAoV2F0Y2hFdmVudFBhdGgpOwo+ICsg
ICAgU3RhdHVzID0gWGVuU3RvcmVSZWFkU3RvcmUgKCZIZWFkZXIsIHNpemVvZiAoSGVhZGVyKSk7
Cj4gKyAgICBpZiAoU3RhdHVzICE9IFhFTlNUT1JFX1NUQVRVU19TVUNDRVNTKSB7Cj4gKyAgICAg
IERFQlVHICgoREVCVUdfRVJST1IsICJYZW5TdG9yZTogRXJyb3IgcmVhZCBzdG9yZSAoJWQpXG4i
LCBTdGF0dXMpKTsKPiArICAgICAgcmV0dXJuIFN0YXR1czsKPiArICAgIH0KPiAgCj4gLSAgICBD
b252ZXJ0ZWRUb2tlbiA9IChWT0lEICopIEFzY2lpU3RySGV4VG9VaW50biAoV2F0Y2hFdmVudFRv
a2VuKTsKPiArICAgIEFTU0VSVCAoSGVhZGVyLmxlbiA8PSBYRU5TVE9SRV9QQVlMT0FEX01BWCk7
Cj4gKyAgICBpZiAoSGVhZGVyLmxlbiA+IFhFTlNUT1JFX1BBWUxPQURfTUFYKSB7Cj4gKyAgICAg
IERFQlVHICgoREVCVUdfRVJST1IsICJYZW5TdG9yZTogTWVzc2FnZSBwYXlsb2FkIG92ZXIgJWQg
KGlzICVkKVxuIiwKPiArICAgICAgICAgIFhFTlNUT1JFX1BBWUxPQURfTUFYLCBIZWFkZXIubGVu
KSk7Cj4gKyAgICAgIEhlYWRlci5sZW4gPSBYRU5TVE9SRV9QQVlMT0FEX01BWDsKPiArICAgIH0K
PiAgCj4gLSAgICBFZmlBY3F1aXJlTG9jayAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVzTG9jayk7Cj4g
LSAgICBXYXRjaCA9IFhlblN0b3JlRmluZFdhdGNoIChDb252ZXJ0ZWRUb2tlbik7Cj4gLSAgICBE
RUJVRyAoKERFQlVHX0lORk8sICJYZW5TdG9yZTogV2F0Y2ggZXZlbnQgJWFcbiIsIFdhdGNoRXZl
bnRUb2tlbikpOwo+IC0gICAgaWYgKFdhdGNoICE9IE5VTEwpIHsKPiAtICAgICAgV2F0Y2gtPlRy
aWdnZXJlZCA9IFRSVUU7Cj4gLSAgICB9IGVsc2Ugewo+IC0gICAgICBERUJVRyAoKEVGSV9EX1dB
Uk4sICJYZW5TdG9yZTogV2F0Y2ggaGFuZGxlICVhIG5vdCBmb3VuZFxuIiwKPiAtICAgICAgICAg
ICAgICBXYXRjaEV2ZW50VG9rZW4pKTsKPiArICAgIFBheWxvYWQgPSB4cy5CdWZmZXI7Cj4gKyAg
ICBTdGF0dXMgPSBYZW5TdG9yZVJlYWRTdG9yZSAoUGF5bG9hZCwgSGVhZGVyLmxlbik7Cj4gKyAg
ICBpZiAoU3RhdHVzICE9IFhFTlNUT1JFX1NUQVRVU19TVUNDRVNTKSB7Cj4gKyAgICAgIERFQlVH
ICgoREVCVUdfRVJST1IsICJYZW5TdG9yZTogRXJyb3IgcmVhZCBzdG9yZSAoJWQpXG4iLCBTdGF0
dXMpKTsKPiArICAgICAgcmV0dXJuIFN0YXR1czsKPiAgICAgIH0KPiAtICAgIEVmaVJlbGVhc2VM
b2NrICgmeHMuUmVnaXN0ZXJlZFdhdGNoZXNMb2NrKTsKPiAtICAgIEZyZWVQb29sIChNZXNzYWdl
KTsKPiAtICAgIEZyZWVQb29sIChCb2R5KTsKPiAtICB9IGVsc2Ugewo+IC0gICAgTWVzc2FnZS0+
dS5SZXBseS5Cb2R5ID0gQm9keTsKPiAtICAgIEVmaUFjcXVpcmVMb2NrICgmeHMuUmVwbHlMb2Nr
KTsKPiAtICAgIEluc2VydFRhaWxMaXN0ICgmeHMuUmVwbHlMaXN0LCAmTWVzc2FnZS0+TGluayk7
Cj4gLSAgICBFZmlSZWxlYXNlTG9jayAoJnhzLlJlcGx5TG9jayk7Cj4gKyAgICBQYXlsb2FkW0hl
YWRlci5sZW5dID0gJ1wwJzsKPiArCj4gKyAgICBpZiAoSGVhZGVyLnR5cGUgPT0gWFNfV0FUQ0hf
RVZFTlQpIHsKPiArICAgICAgQ09OU1QgQ0hBUjggICAgKldhdGNoRXZlbnRQYXRoOwo+ICsgICAg
ICBDT05TVCBDSEFSOCAgICAqV2F0Y2hFdmVudFRva2VuOwo+ICsgICAgICBWT0lEICAgICAgICAg
ICAqQ29udmVydGVkVG9rZW47Cj4gKyAgICAgIFhFTlNUT1JFX1dBVENIICpXYXRjaDsKPiArCj4g
KyAgICAgIC8vCj4gKyAgICAgIC8vIFBhcnNlIFdBVENIX0VWRU5UIG1lc3NhZ2VzCj4gKyAgICAg
IC8vICAgPHBhdGg+XDA8dG9rZW4+XDAKPiArICAgICAgLy8KPiArICAgICAgV2F0Y2hFdmVudFBh
dGggPSBQYXlsb2FkOwo+ICsgICAgICBXYXRjaEV2ZW50VG9rZW4gPSBXYXRjaEV2ZW50UGF0aCAr
IEFzY2lpU3RyU2l6ZSAoV2F0Y2hFdmVudFBhdGgpOwo+ICsKPiArICAgICAgQ29udmVydGVkVG9r
ZW4gPSAoVk9JRCAqKSBBc2NpaVN0ckhleFRvVWludG4gKFdhdGNoRXZlbnRUb2tlbik7Cj4gKwo+
ICsgICAgICBFZmlBY3F1aXJlTG9jayAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVzTG9jayk7Cj4gKyAg
ICAgIFdhdGNoID0gWGVuU3RvcmVGaW5kV2F0Y2ggKENvbnZlcnRlZFRva2VuKTsKPiArICAgICAg
REVCVUcgKChERUJVR19JTkZPLCAiWGVuU3RvcmU6IFdhdGNoIGV2ZW50ICVhXG4iLCBXYXRjaEV2
ZW50VG9rZW4pKTsKPiArICAgICAgaWYgKFdhdGNoICE9IE5VTEwpIHsKPiArICAgICAgICBXYXRj
aC0+VHJpZ2dlcmVkID0gVFJVRTsKPiArICAgICAgfSBlbHNlIHsKPiArICAgICAgICBERUJVRyAo
KERFQlVHX1dBUk4sICJYZW5TdG9yZTogV2F0Y2ggaGFuZGxlICVhIG5vdCBmb3VuZFxuIiwKPiAr
ICAgICAgICAgICAgICAgIFdhdGNoRXZlbnRUb2tlbikpOwo+ICsgICAgICB9Cj4gKyAgICAgIEVm
aVJlbGVhc2VMb2NrICgmeHMuUmVnaXN0ZXJlZFdhdGNoZXNMb2NrKTsKPiArCj4gKyAgICAgIGlm
IChIZWFkZXIucmVxX2lkID09IEV4cGVjdGVkUmVxdWVzdElkCj4gKyAgICAgICAgJiYgSGVhZGVy
LnR4X2lkID09IEV4cGVjdGVkVHJhbnNhY3Rpb25JZAo+ICsgICAgICAgICYmIEJ1ZmZlciA9PSBO
VUxMKSB7Cj4gKyAgICAgICAgLy8KPiArICAgICAgICAvLyBXZSB3ZXJlIHdhaXRpbmcgZm9yIGEg
d2F0Y2ggZXZlbnQKPiArICAgICAgICAvLwo+ICsgICAgICAgIHJldHVybiBYRU5TVE9SRV9TVEFU
VVNfU1VDQ0VTUzsKPiArICAgICAgfQo+ICsgICAgfSBlbHNlIGlmIChIZWFkZXIucmVxX2lkID09
IEV4cGVjdGVkUmVxdWVzdElkCj4gKyAgICAgICYmIEhlYWRlci50eF9pZCA9PSBFeHBlY3RlZFRy
YW5zYWN0aW9uSWQpIHsKPiArICAgICAgU3RhdHVzID0gWEVOU1RPUkVfU1RBVFVTX1NVQ0NFU1M7
Cj4gKyAgICAgIGlmIChIZWFkZXIudHlwZSA9PSBYU19FUlJPUikgewo+ICsgICAgICAgIFN0YXR1
cyA9IFhlblN0b3JlR2V0RXJyb3IgKFBheWxvYWQpOwo+ICsgICAgICB9IGVsc2UgaWYgKEJ1ZmZl
ciAhPSBOVUxMKSB7Cj4gKyAgICAgICAgQVNTRVJUIChCdWZmZXJTaXplICE9IE5VTEwpOwo+ICsg
ICAgICAgIEFTU0VSVCAoKkJ1ZmZlclNpemUgPj0gSGVhZGVyLmxlbik7Cj4gKyAgICAgICAgQ29w
eU1lbSAoQnVmZmVyLCBQYXlsb2FkLCBNSU4gKEhlYWRlci5sZW4gKyAxLCAqQnVmZmVyU2l6ZSkp
Owo+ICsgICAgICAgICpCdWZmZXJTaXplID0gSGVhZGVyLmxlbjsKPiArICAgICAgfSBlbHNlIHsK
PiArICAgICAgICAvLwo+ICsgICAgICAgIC8vIFBheWxvYWQgc2hvdWxkIGJlICJPSyIgaWYgdGhl
IGZ1bmN0aW9uIHNlbmRpbmcgYSByZXF1ZXN0IGRvZXNuJ3QKPiArICAgICAgICAvLyBleHBlY3Qg
YSByZXBseS4KPiArICAgICAgICAvLwo+ICsgICAgICAgIEFTU0VSVCAoSGVhZGVyLmxlbiA9PSAz
KTsKPiArICAgICAgICBBU1NFUlQgKEFzY2lpU3RyQ21wIChQYXlsb2FkLCAiT0siKSA9PSAwKTsK
PiArICAgICAgfQo+ICsgICAgICByZXR1cm4gU3RhdHVzOwo+ICsgICAgfQo+ICsKPiAgICB9Cj4g
IAo+ICAgIHJldHVybiBYRU5TVE9SRV9TVEFUVVNfU1VDQ0VTUzsKPiBAQCAtNzM2LDUxICs3NDks
NiBAQCBYZW5TdG9yZUdldEVycm9yICgKPiAgICByZXR1cm4gWEVOU1RPUkVfU1RBVFVTX0VJTlZB
TDsKPiAgfQo+ICAKPiAtLyoqCj4gLSAgQmxvY2sgd2FpdGluZyBmb3IgYSByZXBseSB0byBhIG1l
c3NhZ2UgcmVxdWVzdC4KPiAtCj4gLSAgQHBhcmFtIFR5cGVQdHIgVGhlIHJldHVybmVkIHR5cGUg
b2YgdGhlIHJlcGx5Lgo+IC0gIEBwYXJhbSBMZW5QdHIgIFRoZSByZXR1cm5lZCBib2R5IGxlbmd0
aCBvZiB0aGUgcmVwbHkuCj4gLSAgQHBhcmFtIFJlc3VsdCAgVGhlIHJldHVybmVkIGJvZHkgb2Yg
dGhlIHJlcGx5Lgo+IC0qKi8KPiAtU1RBVElDCj4gLVhFTlNUT1JFX1NUQVRVUwo+IC1YZW5TdG9y
ZVJlYWRSZXBseSAoCj4gLSAgT1VUIGVudW0geHNkX3NvY2ttc2dfdHlwZSAqVHlwZVB0ciwKPiAt
ICBPVVQgVUlOVDMyICpMZW5QdHIgT1BUSU9OQUwsCj4gLSAgT1VUIFZPSUQgKipSZXN1bHQKPiAt
ICApCj4gLXsKPiAtICBYRU5TVE9SRV9NRVNTQUdFICpNZXNzYWdlOwo+IC0gIExJU1RfRU5UUlkg
KkVudHJ5Owo+IC0gIENIQVI4ICpCb2R5Owo+IC0KPiAtICB3aGlsZSAoSXNMaXN0RW1wdHkgKCZ4
cy5SZXBseUxpc3QpKSB7Cj4gLSAgICBYRU5TVE9SRV9TVEFUVVMgU3RhdHVzOwo+IC0gICAgU3Rh
dHVzID0gWGVuU3RvcmVQcm9jZXNzTWVzc2FnZSAoKTsKPiAtICAgIGlmIChTdGF0dXMgIT0gWEVO
U1RPUkVfU1RBVFVTX1NVQ0NFU1MgJiYgU3RhdHVzICE9IFhFTlNUT1JFX1NUQVRVU19FQUdBSU4p
IHsKPiAtICAgICAgREVCVUcgKChERUJVR19FUlJPUiwgIlhlblN0b3JlLCBlcnJvciB3aGlsZSBy
ZWFkaW5nIHRoZSByaW5nICglZCkuXG4iLAo+IC0gICAgICAgICAgICAgIFN0YXR1cykpOwo+IC0g
ICAgICByZXR1cm4gU3RhdHVzOwo+IC0gICAgfQo+IC0gIH0KPiAtICBFZmlBY3F1aXJlTG9jayAo
JnhzLlJlcGx5TG9jayk7Cj4gLSAgRW50cnkgPSBHZXRGaXJzdE5vZGUgKCZ4cy5SZXBseUxpc3Qp
Owo+IC0gIE1lc3NhZ2UgPSBYRU5TVE9SRV9NRVNTQUdFX0ZST01fTElOSyAoRW50cnkpOwo+IC0g
IFJlbW92ZUVudHJ5TGlzdCAoRW50cnkpOwo+IC0gIEVmaVJlbGVhc2VMb2NrICgmeHMuUmVwbHlM
b2NrKTsKPiAtCj4gLSAgKlR5cGVQdHIgPSBNZXNzYWdlLT5IZWFkZXIudHlwZTsKPiAtICBpZiAo
TGVuUHRyICE9IE5VTEwpIHsKPiAtICAgICpMZW5QdHIgPSBNZXNzYWdlLT5IZWFkZXIubGVuOwo+
IC0gIH0KPiAtICBCb2R5ID0gTWVzc2FnZS0+dS5SZXBseS5Cb2R5Owo+IC0KPiAtICBGcmVlUG9v
bCAoTWVzc2FnZSk7Cj4gLSAgKlJlc3VsdCA9IEJvZHk7Cj4gLSAgcmV0dXJuIFhFTlNUT1JFX1NU
QVRVU19TVUNDRVNTOwo+IC19Cj4gLQo+ICAvKioKPiAgICBTZW5kIGEgbWVzc2FnZSB3aXRoIGFu
IG9wdGlvbmFsbHkgbXV0aS1wYXJ0IGJvZHkgdG8gdGhlIFhlblN0b3JlIHNlcnZpY2UuCj4gIAo+
IEBAIC04MDYsMTYgKzc3NCwxNyBAQCBYZW5TdG9yZVRhbGt2ICgKPiAgICApCj4gIHsKPiAgICBz
dHJ1Y3QgeHNkX3NvY2ttc2cgTWVzc2FnZTsKPiAtICB2b2lkICpSZXR1cm4gPSBOVUxMOwo+IC0g
IFVJTlQzMiBJbmRleDsKPiAtICBYRU5TVE9SRV9TVEFUVVMgU3RhdHVzOwo+ICsgIFVJTlROICAg
ICAgICAgICAgICBJbmRleDsKPiArICBYRU5TVE9SRV9TVEFUVVMgICAgU3RhdHVzOwo+ICsgIFZP
SUQgICAgICAgICAgICAgICAqQnVmZmVyOwo+ICsgIFVJTlROICAgICAgICAgICAgICBCdWZmZXJT
aXplOwo+ICAKPiAgICBpZiAoVHJhbnNhY3Rpb24gPT0gWFNUX05JTCkgewo+ICAgICAgTWVzc2Fn
ZS50eF9pZCA9IDA7Cj4gICAgfSBlbHNlIHsKPiAgICAgIE1lc3NhZ2UudHhfaWQgPSBUcmFuc2Fj
dGlvbi0+SWQ7Cj4gICAgfQo+IC0gIE1lc3NhZ2UucmVxX2lkID0gMDsKPiArICBNZXNzYWdlLnJl
cV9pZCA9IHhzLk5leHRSZXF1ZXN0SWQrKzsKPiAgICBNZXNzYWdlLnR5cGUgPSBSZXF1ZXN0VHlw
ZTsKPiAgICBNZXNzYWdlLmxlbiA9IDA7Cj4gICAgZm9yIChJbmRleCA9IDA7IEluZGV4IDwgTnVt
UmVxdWVzdHM7IEluZGV4KyspIHsKPiBAQCAtODM2LDI5ICs4MDUsMzYgQEAgWGVuU3RvcmVUYWxr
diAoCj4gICAgICB9Cj4gICAgfQo+ICAKPiAtICBTdGF0dXMgPSBYZW5TdG9yZVJlYWRSZXBseSAo
KGVudW0geHNkX3NvY2ttc2dfdHlwZSAqKSZNZXNzYWdlLnR5cGUsIExlblB0ciwgJlJldHVybik7
Cj4gLQo+IC1FcnJvcjoKPiAtICBpZiAoU3RhdHVzICE9IFhFTlNUT1JFX1NUQVRVU19TVUNDRVNT
KSB7Cj4gLSAgICByZXR1cm4gU3RhdHVzOwo+ICsgIGlmIChSZXN1bHRQdHIpIHsKPiArICAgIEJ1
ZmZlciA9IEFsbG9jYXRlUG9vbCAoWEVOU1RPUkVfUEFZTE9BRF9NQVggKyAxKTsKPiArICAgIEJ1
ZmZlclNpemUgPSBYRU5TVE9SRV9QQVlMT0FEX01BWDsKPiArICB9IGVsc2Ugewo+ICsgICAgQnVm
ZmVyID0gTlVMTDsKPiArICAgIEJ1ZmZlclNpemUgPSAwOwo+ICAgIH0KPiAgCj4gLSAgaWYgKE1l
c3NhZ2UudHlwZSA9PSBYU19FUlJPUikgewo+IC0gICAgU3RhdHVzID0gWGVuU3RvcmVHZXRFcnJv
ciAoUmV0dXJuKTsKPiAtICAgIEZyZWVQb29sIChSZXR1cm4pOwo+ICsgIC8vCj4gKyAgLy8gV2Fp
dCBmb3IgYSByZXBseSB0byBvdXIgcmVxdWVzdAo+ICsgIC8vCj4gKyAgU3RhdHVzID0gWGVuU3Rv
cmVQcm9jZXNzTWVzc2FnZSAoTWVzc2FnZS5yZXFfaWQsIE1lc3NhZ2UudHhfaWQsCj4gKyAgICAm
QnVmZmVyU2l6ZSwgQnVmZmVyKTsKPiArCj4gKyAgaWYgKFN0YXR1cyAhPSBYRU5TVE9SRV9TVEFU
VVNfU1VDQ0VTUykgewo+ICsgICAgREVCVUcgKChERUJVR19FUlJPUiwgIlhlblN0b3JlLCBlcnJv
ciB3aGlsZSByZWFkaW5nIHRoZSByaW5nICglZCkuXG4iLAo+ICsgICAgICAgIFN0YXR1cykpOwo+
ICsgICAgRnJlZVBvb2wgKEJ1ZmZlcik7Cj4gICAgICByZXR1cm4gU3RhdHVzOwo+ICAgIH0KPiAg
Cj4gLSAgLyogUmVwbHkgaXMgZWl0aGVyIGVycm9yIG9yIGFuIGVjaG8gb2Ygb3VyIHJlcXVlc3Qg
bWVzc2FnZSB0eXBlLiAqLwo+IC0gIEFTU0VSVCAoKGVudW0geHNkX3NvY2ttc2dfdHlwZSlNZXNz
YWdlLnR5cGUgPT0gUmVxdWVzdFR5cGUpOwo+IC0KPiAgICBpZiAoUmVzdWx0UHRyKSB7Cj4gLSAg
ICAqUmVzdWx0UHRyID0gUmV0dXJuOwo+IC0gIH0gZWxzZSB7Cj4gLSAgICBGcmVlUG9vbCAoUmV0
dXJuKTsKPiArICAgICpSZXN1bHRQdHIgPSBCdWZmZXI7Cj4gKyAgICBpZiAoTGVuUHRyKSB7Cj4g
KyAgICAgICpMZW5QdHIgPSBCdWZmZXJTaXplOwo+ICsgICAgfQo+ICAgIH0KPiAgCj4gLSAgcmV0
dXJuIFhFTlNUT1JFX1NUQVRVU19TVUNDRVNTOwo+ICtFcnJvcjoKPiArICByZXR1cm4gU3RhdHVz
Owo+ICB9Cj4gIAo+ICAvKioKPiBAQCAtOTc1LDcgKzk1MSw3IEBAIFhlblN0b3JlV2FpdFdhdGNo
ICgKPiAgICAgICAgcmV0dXJuIFhFTlNUT1JFX1NUQVRVU19TVUNDRVNTOwo+ICAgICAgfQo+ICAK
PiAtICAgIFN0YXR1cyA9IFhlblN0b3JlUHJvY2Vzc01lc3NhZ2UgKCk7Cj4gKyAgICBTdGF0dXMg
PSBYZW5TdG9yZVByb2Nlc3NNZXNzYWdlICgwLCAwLCBOVUxMLCBOVUxMKTsKPiAgICAgIGlmIChT
dGF0dXMgIT0gWEVOU1RPUkVfU1RBVFVTX1NVQ0NFU1MgJiYgU3RhdHVzICE9IFhFTlNUT1JFX1NU
QVRVU19FQUdBSU4pIHsKPiAgICAgICAgcmV0dXJuIFN0YXR1czsKPiAgICAgIH0KPiBAQCAtMTA2
MCwxMiArMTAzNiwxMiBAQCBYZW5TdG9yZUluaXQgKAo+ICAgIERFQlVHICgoRUZJX0RfSU5GTywg
IlhlbkJ1c0luaXQ6IFhlbkJ1cyByaW5ncyBAJXAsIGV2ZW50IGNoYW5uZWwgJXhcbiIsCj4gICAg
ICAgICAgICB4cy5YZW5TdG9yZSwgeHMuRXZlbnRDaGFubmVsKSk7Cj4gIAo+IC0gIEluaXRpYWxp
emVMaXN0SGVhZCAoJnhzLlJlcGx5TGlzdCk7Cj4gICAgSW5pdGlhbGl6ZUxpc3RIZWFkICgmeHMu
UmVnaXN0ZXJlZFdhdGNoZXMpOwo+ICAKPiAtICBFZmlJbml0aWFsaXplTG9jayAoJnhzLlJlcGx5
TG9jaywgVFBMX05PVElGWSk7Cj4gICAgRWZpSW5pdGlhbGl6ZUxvY2sgKCZ4cy5SZWdpc3RlcmVk
V2F0Y2hlc0xvY2ssIFRQTF9OT1RJRlkpOwo+ICAKPiArICB4cy5OZXh0UmVxdWVzdElkID0gMTsK
PiArCj4gICAgLyogSW5pdGlhbGl6ZSB0aGUgc2hhcmVkIG1lbW9yeSByaW5ncyB0byB0YWxrIHRv
IHhlbnN0b3JlZCAqLwo+ICAgIFN0YXR1cyA9IFhlblN0b3JlSW5pdENvbW1zICgmeHMpOwo+ICAK
PiBAQCAtMTA5NSwxOSArMTA3MSw2IEBAIFhlblN0b3JlRGVpbml0ICgKPiAgICAgIH0KPiAgICB9
Cj4gIAo+IC0gIGlmICghSXNMaXN0RW1wdHkgKCZ4cy5SZXBseUxpc3QpKSB7Cj4gLSAgICBYRU5T
VE9SRV9NRVNTQUdFICpNZXNzYWdlOwo+IC0gICAgTElTVF9FTlRSWSAqRW50cnk7Cj4gLSAgICBF
bnRyeSA9IEdldEZpcnN0Tm9kZSAoJnhzLlJlcGx5TGlzdCk7Cj4gLSAgICB3aGlsZSAoIUlzTnVs
bCAoJnhzLlJlcGx5TGlzdCwgRW50cnkpKSB7Cj4gLSAgICAgIE1lc3NhZ2UgPSBYRU5TVE9SRV9N
RVNTQUdFX0ZST01fTElOSyAoRW50cnkpOwo+IC0gICAgICBFbnRyeSA9IEdldE5leHROb2RlICgm
eHMuUmVwbHlMaXN0LCBFbnRyeSk7Cj4gLSAgICAgIFJlbW92ZUVudHJ5TGlzdCAoJk1lc3NhZ2Ut
PkxpbmspOwo+IC0gICAgICBGcmVlUG9vbCAoTWVzc2FnZS0+dS5SZXBseS5Cb2R5KTsKPiAtICAg
ICAgRnJlZVBvb2wgKE1lc3NhZ2UpOwo+IC0gICAgfQo+IC0gIH0KPiAtCj4gICAgZ0JTLT5DbG9z
ZUV2ZW50ICh4cy5FdmVudENoYW5uZWxFdmVudCk7Cj4gIAo+ICAgIGlmICh4cy5YZW5TdG9yZS0+
c2VydmVyX2ZlYXR1cmVzICYgWEVOU1RPUkVfU0VSVkVSX0ZFQVRVUkVfUkVDT05ORUNUSU9OKSB7
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
