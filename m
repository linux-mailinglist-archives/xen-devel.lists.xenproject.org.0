Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A114CE84
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:38:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwqJi-0002Nr-Ra; Wed, 29 Jan 2020 16:35:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c1nS=3S=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1iwqJh-0002Nm-Al
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:35:49 +0000
X-Inumbo-ID: 6757c880-42b5-11ea-891d-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6757c880-42b5-11ea-891d-12813bfff9fa;
 Wed, 29 Jan 2020 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580315747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+NG/EfzaLh1hbcguaElD/gu52IG31ucl1DGI1XoZy8=;
 b=I5j+SnhtQ4xnaiW8+rimU9jZWahFNKrZvQ3AiUJO7gXySQIRsA3xxMcE+Ue7sw+y8XG3Gx
 a1zvK5EZRgSJ/fp3VNh4Pil6k3Owg/8GD2zNQn/kvArPT3yriNHBDDNSXmANp76Zu6Tsom
 QyJvk2fKHzIR56+M6z16S4dYdShEt/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-aY4o0wdpOp-u3ePYdYY8IA-1; Wed, 29 Jan 2020 11:35:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF541108442F;
 Wed, 29 Jan 2020 16:35:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
 [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D77387B0D;
 Wed, 29 Jan 2020 16:29:59 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-5-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4060e55f-20bf-38a4-6586-3abdcde91836@redhat.com>
Date: Wed, 29 Jan 2020 17:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200129121235.1814563-5-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: aY4o0wdpOp-u3ePYdYY8IA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 4/5] OvmfPkg/XenPlatformPei: Calibrate APIC
 timer frequency
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMjkvMjAgMTM6MTIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENhbGN1bGF0ZSB0aGUg
ZnJlcXVlbmN5IG9mIHRoZSBBUElDIHRpbWVyIHRoYXQgWGVuIHByb3ZpZGVzLgo+IAo+IEV2ZW4g
dGhvdWdoIHRoZSBmcmVxdWVuY3kgaXMgY3VycmVudGx5IGhhcmQtY29kZWQsIGl0IGlzbid0IHBh
cnQgb2YKPiB0aGUgcHVibGljIEFCSSB0aGF0IFhlbiBwcm92aWRlcyBhbmQgdGh1cyBtYXkgY2hh
bmdlIGF0IGFueSB0aW1lLiBPVk1GCj4gbmVlZHMgdG8gZGV0ZXJtaW5lIHRoZSBmcmVxdWVuY3kg
YnkgYW4gb3RoZXIgbWVhbi4KPiAKPiBGb3J0dW5hdGVseSwgWGVuIHByb3ZpZGVzIGEgd2F5IHRv
IGRldGVybWluZXMgdGhlIGZyZXF1ZW5jeSBvZiB0aGUKPiBUU0MsIHNvIHdlIGNhbiB1c2UgVFND
IHRvIGNhbGlicmF0ZSB0aGUgZnJlcXVlbmN5IG9mIHRoZSBBUElDIHRpbWVyLgo+IFRoYXQgaW5m
b3JtYXRpb24gaXMgZm91bmQgaW4gdGhlIHNoYXJlZF9pbmZvIHBhZ2Ugd2hpY2ggd2UgbWFwIGFu
ZAo+IHVubWFwIG9uY2UgZG9uZSAoWGVuQnVzRHhlIGlzIGdvaW5nIHRvIG1hcCB0aGUgcGFnZSBz
b21ld2hlcmUgZWxzZSkuCj4gCj4gVGhlIGNhbGN1bGF0ZWQgZnJlcXVlbmN5IGlzIG9ubHkgbG9n
Z2VkIGluIHRoaXMgcGF0Y2gsIGl0IHdpbGwgYmUgdXNlZAo+IGluIGEgZm9sbG93aW5nIHBhdGNo
Lgo+IAo+IFJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9p
ZD0yNDkwCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Cj4gLS0tCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+IC0tLQo+ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZiB8
ICAgMSArCj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaCAgICAgICAgIHwgICA1
ICsKPiAgT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jICAgICAgICAgfCAgIDEgKwo+
ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jICAgICAgICAgICAgICB8IDEyMyArKysrKysr
KysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKykKCkkn
bGwgcmV2aWV3IHRoaXMgc3VwZXJmaWNpYWxseTsgaXQgc2hvdWxkIGJlIGFwcHJvdmVkIGJ5IHNv
bWVvbmUgZnJvbQp4ZW4tZGV2ZWw6Cgo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlblBsYXRmb3JtUGVpLmluZiBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZv
cm1QZWkuaW5mCj4gaW5kZXggMGVmNzdkYjkyYzAzLi4zMzVhNDQyNTM4YzIgMTAwNjQ0Cj4gLS0t
IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW5QbGF0Zm9ybVBlaS5pbmYKPiArKysgYi9Pdm1m
UGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZgo+IEBAIC01Miw2ICs1Miw3IEBA
IFtMaWJyYXJ5Q2xhc3Nlc10KPiAgICBEZWJ1Z0xpYgo+ICAgIEhvYkxpYgo+ICAgIElvTGliCj4g
KyAgTG9jYWxBcGljTGliCj4gICAgUGNpTGliCj4gICAgUmVzb3VyY2VQdWJsaWNhdGlvbkxpYgo+
ICAgIFBlaVNlcnZpY2VzTGliCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkv
UGxhdGZvcm0uaCBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAo+IGluZGV4IDc2
NjFmNGE4ZGUwYS4uOTdlNDgyYTA2NWYwIDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvUGxhdGZvcm0uaAo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0u
aAo+IEBAIC0xMjcsNiArMTI3LDExIEBAIFhlbkdldEU4MjBNYXAgKAo+ICAgIFVJTlQzMiAqQ291
bnQKPiAgICApOwo+ICAKPiArVk9JRAo+ICtDYWxpYnJhdGVMYXBpY1RpbWVyICgKPiArICBWT0lE
Cj4gKyAgKTsKPiArCj4gIGV4dGVybiBFRklfQk9PVF9NT0RFIG1Cb290TW9kZTsKPiAgCj4gIGV4
dGVybiBVSU5UOCBtUGh5c01lbUFkZHJlc3NXaWR0aDsKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Y
ZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9y
bS5jCj4gaW5kZXggNzE3ZmQwYWIxYTQ1Li5lOTUxMWViNDBjNjIgMTAwNjQ0Cj4gLS0tIGEvT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5jCj4gQEAgLTQ0OCw2ICs0NDgsNyBAQCBJbml0aWFsaXplWGVuUGxhdGZv
cm0gKAo+ICAgIEluaXRpYWxpemVSYW1SZWdpb25zICgpOwo+ICAKPiAgICBJbml0aWFsaXplWGVu
ICgpOwo+ICsgIENhbGlicmF0ZUxhcGljVGltZXIgKCk7Cj4gIAo+ICAgIGlmIChtQm9vdE1vZGUg
IT0gQk9PVF9PTl9TM19SRVNVTUUpIHsKPiAgICAgIFJlc2VydmVFbXVWYXJpYWJsZU52U3RvcmUg
KCk7Cj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXggYzQxZmVjZGM0ODZlLi5kNmNkYzlhOGUzMWMg
MTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQ
a2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKPiBAQCAtMTksNiArMTksNyBAQAo+ICAvLwo+ICAjaW5j
bHVkZSA8TGlicmFyeS9EZWJ1Z0xpYi5oPgo+ICAjaW5jbHVkZSA8TGlicmFyeS9Ib2JMaWIuaD4K
PiArI2luY2x1ZGUgPExpYnJhcnkvTG9jYWxBcGljTGliLmg+Cj4gICNpbmNsdWRlIDxMaWJyYXJ5
L01lbW9yeUFsbG9jYXRpb25MaWIuaD4KPiAgI2luY2x1ZGUgPExpYnJhcnkvUGNkTGliLmg+Cj4g
ICNpbmNsdWRlIDxHdWlkL1hlbkluZm8uaD4KPiBAQCAtMzg2LDMgKzM4NywxMjUgQEAgSW5pdGlh
bGl6ZVhlbiAoCj4gIAo+ICAgIHJldHVybiBFRklfU1VDQ0VTUzsKPiAgfQo+ICsKPiArCj4gK0VG
SV9TVEFUVVMKPiArTWFwU2hhcmVkSW5mb1BhZ2UgKAo+ICsgIElOIFZPSUQgKlBhZ2VQdHIKPiAr
ICApCj4gK3sKPiArICB4ZW5fYWRkX3RvX3BoeXNtYXBfdCAgUGFyYW1ldGVyczsKPiArICBJTlRO
ICAgICAgICAgICAgICAgICAgUmV0dXJuQ29kZTsKPiArCj4gKyAgUGFyYW1ldGVycy5kb21pZCA9
IERPTUlEX1NFTEY7Cj4gKyAgUGFyYW1ldGVycy5zcGFjZSA9IFhFTk1BUFNQQUNFX3NoYXJlZF9p
bmZvOwo+ICsgIFBhcmFtZXRlcnMuaWR4ID0gMDsKPiArICBQYXJhbWV0ZXJzLmdwZm4gPSAoVUlO
VE4pIFBhZ2VQdHIgPj4gRUZJX1BBR0VfU0hJRlQ7CgooMSkgUGxlYXNlIHJlbW92ZSB0aGUgc3Bh
Y2UgY2hhcmFjdGVyIGZyb20gIihVSU5UTikgUGFnZVB0ciIuIEluc2VydGluZwphIHNwYWNlIGNo
YXJhY3RlciBpcyBhIGJhZCBhbmQgY29uZnVzaW5nIGhhYml0IGluIGVkazIsIGJlY2F1c2UgaXQg
bWFza3MKdGhlIGZhY3QgdGhhdCB0aGUgY2FzdCBvcGVyYXRvciBoYXMgb25lIG9mIHRoZSBzdHJv
bmdlc3QgYmluZGluZ3MgaW4gdGhlCkMgbGFuZ3VhZ2UuIFNvIEkgdHJ5IHRvIGtlZXAgaXQgb3V0
IG9mIE92bWZQa2cgYW5kIEFybVZpcnRQa2cuCgo+ICsgIFJldHVybkNvZGUgPSBYZW5IeXBlcmNh
bGxNZW1vcnlPcCAoWEVOTUVNX2FkZF90b19waHlzbWFwLCAmUGFyYW1ldGVycyk7Cj4gKyAgaWYg
KFJldHVybkNvZGUgIT0gMCkgewo+ICsgICAgcmV0dXJuIEVGSV9OT19NQVBQSU5HOwo+ICsgIH0K
PiArICByZXR1cm4gRUZJX1NVQ0NFU1M7Cj4gK30KPiArCj4gK1ZPSUQKPiArVW5tYXBYZW5QYWdl
ICgKPiArICBJTiBWT0lEICpQYWdlUHRyCj4gKyAgKQo+ICt7Cj4gKyAgeGVuX3JlbW92ZV9mcm9t
X3BoeXNtYXBfdCBQYXJhbWV0ZXJzOwo+ICsgIElOVE4gICAgICAgICAgICAgICAgICAgICAgUmV0
dXJuQ29kZTsKPiArCj4gKyAgUGFyYW1ldGVycy5kb21pZCA9IERPTUlEX1NFTEY7Cj4gKyAgUGFy
YW1ldGVycy5ncGZuID0gKFVJTlROKSBQYWdlUHRyID4+IEVGSV9QQUdFX1NISUZUOwoKKDIpIERp
dHRvLgoKPiArICBSZXR1cm5Db2RlID0gWGVuSHlwZXJjYWxsTWVtb3J5T3AgKFhFTk1FTV9yZW1v
dmVfZnJvbV9waHlzbWFwLCAmUGFyYW1ldGVycyk7Cj4gKyAgQVNTRVJUIChSZXR1cm5Db2RlID09
IDApOwo+ICt9Cj4gKwo+ICsKPiArU1RBVElDCj4gK1VJTlQ2NAo+ICtHZXRDUFVGcmVxICgKPiAr
ICBJTiBYRU5fVkNQVV9USU1FX0lORk8gKlZjcHVUaW1lCj4gKyAgKQo+ICt7Cj4gKyAgVUlOVDMy
IFZlcnNpb247Cj4gKyAgVUlOVDMyIFRTQ1RvU3lzdGVtTXVsdGlwbGllcjsKPiArICBJTlQ4ICAg
VFNDU2hpZnQ7Cj4gKyAgVUlOVDY0IENQVUZyZXE7Cj4gKwo+ICsgIGRvIHsKPiArICAgIFZlcnNp
b24gPSBWY3B1VGltZS0+VmVyc2lvbjsKPiArICAgIE1lbW9yeUZlbmNlICgpOwo+ICsgICAgVFND
VG9TeXN0ZW1NdWx0aXBsaWVyID0gVmNwdVRpbWUtPlRTQ1RvU3lzdGVtTXVsdGlwbGllcjsKPiAr
ICAgIFRTQ1NoaWZ0ID0gVmNwdVRpbWUtPlRTQ1NoaWZ0Owo+ICsgICAgTWVtb3J5RmVuY2UgKCk7
Cj4gKyAgfSB3aGlsZSAoKChWZXJzaW9uICYgMSkgIT0gMCkgJiYgKFZlcnNpb24gIT0gVmNwdVRp
bWUtPlZlcnNpb24pKTsKPiArCj4gKyAgQ1BVRnJlcSA9ICgxMDAwMDAwMDAwVUxMIDw8IDMyKSAv
IFRTQ1RvU3lzdGVtTXVsdGlwbGllcjsKCigzKSBJIHVuZGVyc3RhbmQgdGhhdCBPdm1mWGVuIGlz
IFg2NCwgYW5kIHNvIHRoaXMgY29kZSB3aWxsIG5vdCBiZSBidWlsdApmb3IgSUEzMiBpbiBwcmFj
dGljZS4gU3RpbGwsIGZvciBzdGlja2luZyB3aXRoIHRoZSBjb2Rpbmcgc3R5bGUsIGl0J3MKYmV0
dGVyIHRvIHVzZSBMU2hpZnRVNjQoKSBoZXJlLCBhbmQgdGhlbiBEaXZVNjR4MzIoKS4KCj4gKyAg
aWYgKFRTQ1NoaWZ0ID49IDApIHsKPiArICAgICAgQ1BVRnJlcSA+Pj0gVmNwdVRpbWUtPlRTQ1No
aWZ0Owo+ICsgIH0gZWxzZSB7Cj4gKyAgICAgIENQVUZyZXEgPDw9IC1WY3B1VGltZS0+VFNDU2hp
ZnQ7Cj4gKyAgfQoKKDQpIFBsZWFzZSB1c2UgTFNoaWZ0VTY0KCkgYW5kIFJTaGlmdFU2NCgpLgoK
KDUpIEkgdGhpbmsgdGhlcmUncyBhIHR5cG8gaGVyZTogeW91IGp1c3QgZmlzaGVkIG91dCAiVHNj
U2hpZnQiIGZyb20gdGhlCnNoYXJlZCBpbmZvIHBhZ2U7IHdlIHNob3VsZCB1c2VkIHRoYXQgY2Fj
aGVkIHZhbHVlLCBhbmQgbm90IGFjY2VzcyB0aGUKc2hhcmVkIGluZm8gcGFnZSBhZ2Fpbi4gSXMg
dGhhdCByaWdodD8KCj4gKyAgcmV0dXJuIENQVUZyZXE7Cj4gK30KPiArCj4gK1ZPSUQKPiArWGVu
RGVsYXkgKAo+ICsgIElOIFhFTl9WQ1BVX1RJTUVfSU5GTyAqVmNwdVRpbWVJbmZvLAo+ICsgIElO
IFVJTlQ2NCAgICAgICAgICAgICBEZWxheU5zCj4gKyAgKQo+ICt7Cj4gKyAgVUlOVDY0IFRpY2s7
Cj4gKwo+ICsgIFRpY2sgPSBBc21SZWFkVHNjICgpOwo+ICsgIFRpY2sgKz0gKERlbGF5TnMgKiBH
ZXRDUFVGcmVxIChWY3B1VGltZUluZm8pKSAvIDEwMDAwMDAwMDBVTEw7CgooNikgUGxlYXNlIHVz
ZSBNdWx0VTY0eDY0KCkgYW5kIERpdlU2NHgzMigpLiAoMSwwMDAsMDAwLDAwMCBmaXRzIGluIGEK
VUlOVDMyLikKCj4gKyAgd2hpbGUgKEFzbVJlYWRUc2MoKSA8PSBUaWNrKSB7Cj4gKyAgICBDcHVQ
YXVzZSgpOwo+ICsgIH0KPiArfQo+ICsKPiArCj4gKy8qKgo+ICsgIENhbGN1bGF0ZSB0aGUgZnJl
cXVlbmN5IG9mIHRoZSBMb2NhbCBBcGljIFRpbWVyCj4gKyoqLwo+ICtWT0lECj4gK0NhbGlicmF0
ZUxhcGljVGltZXIgKAo+ICsgIFZPSUQKPiArICApCj4gK3sKPiArICBYRU5fU0hBUkVEX0lORk8g
ICAgICAgKlNoYXJlZEluZm87Cj4gKyAgWEVOX1ZDUFVfVElNRV9JTkZPICAgICpWY3B1VGltZUlu
Zm87Cj4gKyAgVUlOVDMyICAgICAgICAgICAgICAgIFRpbWVyVGljaywgVGltZXJUaWNrMjsKPiAr
ICBVSU5UNjQgICAgICAgICAgICAgICAgVHNjVGljaywgVHNjVGljazI7Cj4gKyAgVUlOVDY0ICAg
ICAgICAgICAgICAgIEZyZXE7Cj4gKyAgRUZJX1NUQVRVUyAgICAgICAgICAgIFN0YXR1czsKPiAr
Cj4gKyAgU2hhcmVkSW5mbyA9IEFsbG9jYXRlUGFnZXMgKDEpOwoKKDcpIENhbiB5b3UgY2hlY2sg
aWYgdGhpcyBzdWNjZWVkcz8KCj4gKyAgU3RhdHVzID0gTWFwU2hhcmVkSW5mb1BhZ2UgKFNoYXJl
ZEluZm8pOwo+ICsgIEFTU0VSVF9FRklfRVJST1IgKFN0YXR1cyk7Cj4gKyAgaWYgKEVGSV9FUlJP
UiAoU3RhdHVzKSkgewo+ICsgICAgZ290byBFeGl0Owo+ICsgIH0KPiArCj4gKyAgVmNwdVRpbWVJ
bmZvID0gJlNoYXJlZEluZm8tPlZjcHVJbmZvWzBdLlRpbWU7Cj4gKwo+ICsgIEluaXRpYWxpemVB
cGljVGltZXIgKDEsIE1BWF9VSU5UMzIsIFRSVUUsIDApOwo+ICsgIERpc2FibGVBcGljVGltZXJJ
bnRlcnJ1cHQgKCk7Cj4gKwo+ICsgIFRpbWVyVGljayA9IEdldEFwaWNUaW1lckN1cnJlbnRDb3Vu
dCAoKTsKPiArICBUc2NUaWNrID0gQXNtUmVhZFRzYyAoKTsKPiArICBYZW5EZWxheSAoVmNwdVRp
bWVJbmZvLCAxMDAwMDAwVUxMKTsKPiArICBUaW1lclRpY2syID0gR2V0QXBpY1RpbWVyQ3VycmVu
dENvdW50ICgpOwo+ICsgIFRzY1RpY2syID0gQXNtUmVhZFRzYyAoKTsKPiArCj4gKyAgRnJlcSA9
IChHZXRDUFVGcmVxIChWY3B1VGltZUluZm8pICogKFRpbWVyVGljayAtIFRpbWVyVGljazIpKQo+
ICsgICAgLyAoVHNjVGljazIgLSBUc2NUaWNrKTsKCig4KSBQbGVhc2UgdXNlIHRoZSBhYm92ZS1t
ZW50aW9uZWQgVTY0IG11bHRpcGxpY2F0aW9uIGFuZCBkaXZpc2lvbiBoZWxwZXJzLgoKKDkpIElu
IGNhc2Ugd2UgYXJlIGNvbmNlcm5lZCBhYm91dCBVNjQgb3ZlcmZsb3dzIGFueXdoZXJlIGluIHRo
aXMgcGF0Y2g6ClNhZmVJbnRMaWIgaGFzIHJhbmdlLWNoZWNrZWQgZnVuY3Rpb25zLCBmb3IgZXhh
bXBsZSBTYWZlVWludDY0TXVsdCgpLgoKVGhhbmtzIQpMYXN6bG8KCj4gKyAgREVCVUcgKChERUJV
R19JTkZPLCAiQVBJQyBGcmVxICUgOGx1IEh6XG4iLCBGcmVxKSk7Cj4gKwo+ICsgIFVubWFwWGVu
UGFnZSAoU2hhcmVkSW5mbyk7Cj4gKwo+ICtFeGl0Ogo+ICsgIEZyZWVQYWdlcyAoU2hhcmVkSW5m
bywgMSk7Cj4gK30KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
