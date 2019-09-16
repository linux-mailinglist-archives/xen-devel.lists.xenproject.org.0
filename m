Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E9B3877
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:43:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oQn-0002ur-5n; Mon, 16 Sep 2019 10:40:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9oQm-0002um-Jt
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:40:28 +0000
X-Inumbo-ID: 636af73a-d86e-11e9-95de-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 636af73a-d86e-11e9-95de-12813bfff9fa;
 Mon, 16 Sep 2019 10:40:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7893EAC37;
 Mon, 16 Sep 2019 10:40:23 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
Date: Mon, 16 Sep 2019 12:40:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXVfZndzcGVjLmgKPiBAQCAt
MCwwICsxLDY4IEBACj4gKy8qCj4gKyAqIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXVfZndzcGVj
LmgKPiArICoKPiArICogQ29udGFpbnMgYSBjb21tb24gc3RydWN0dXJlIHRvIGhvbGQgdGhlIHBl
ci1kZXZpY2UgZmlybXdhcmUgZGF0YSBhbmQKPiArICogZGVjbGFyYXRpb24gb2YgZnVuY3Rpb25z
IHVzZWQgdG8gbWFpbnRhaW4gdGhhdCBkYXRhCj4gKyAqCj4gKyAqIEJhc2VkIG9uIExpbnV4J3Mg
aW9tbXVfZndzcGVjIHN1cHBvcnQgeW91IGNhbiBmaW5kIGF0Ogo+ICsgKiAgICBpbmNsdWRlL2xp
bnV4L2lvbW11LmgKPiArICoKPiArICogQ29weXJpZ2h0IChDKSAyMDA3LTIwMDggQWR2YW5jZWQg
TWljcm8gRGV2aWNlcywgSW5jLgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTkgRVBBTSBT
eXN0ZW1zIEluYy4KPiArICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgo+ICsgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRl
cm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiArICogTGljZW5z
ZSwgdmVyc2lvbiAyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bi4KPiArICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gKyAqIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCj4gKyAqIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiArICoKPiArICogWW91IHNo
b3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4gKyAq
IExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3
LmdudS5vcmcvbGljZW5zZXMvPi4KPiArICovCj4gKwo+ICsjaWZuZGVmIF9fQVJDSF9BUk1fSU9N
TVVfRldTUEVDX0hfXwo+ICsjZGVmaW5lIF9fQVJDSF9BUk1fSU9NTVVfRldTUEVDX0hfXwo+ICsK
PiArLyogcGVyLWRldmljZSBJT01NVSBpbnN0YW5jZSBkYXRhICovCj4gK3N0cnVjdCBpb21tdV9m
d3NwZWMgewo+ICsgICAgLyogdGhpcyBkZXZpY2UncyBJT01NVSAqLwo+ICsgICAgc3RydWN0IGRl
dmljZSAqaW9tbXVfZGV2Owo+ICsgICAgLyogSU9NTVUgZHJpdmVyIHByaXZhdGUgZGF0YSBmb3Ig
dGhpcyBkZXZpY2UgKi8KPiArICAgIHZvaWQgKmlvbW11X3ByaXY7Cj4gKyAgICAvKiBudW1iZXIg
b2YgYXNzb2NpYXRlZCBkZXZpY2UgSURzICovCj4gKyAgICB1bnNpZ25lZCBpbnQgbnVtX2lkczsK
PiArICAgIC8qIElEcyB3aGljaCB0aGlzIGRldmljZSBtYXkgcHJlc2VudCB0byB0aGUgSU9NTVUg
Ki8KPiArICAgIHVpbnQzMl90IGlkc1sxXTsKPiArfTsKCk5vdGUgdGhhdCB5b3UgYWJ1c2UgeHJl
YWxsb2NfZmxleF9zdHJ1Y3QoKSB3aGVuIHVzaW5nIGl0IHdpdGggc3VjaAphIHR5cGU6IFRoZSBs
YXN0IGZpZWxkIGlzIF9ub3RfIGEgZmxleGlibGUgYXJyYXkgbWVtYmVyLiBDb21waWxlcnMKbWln
aHQgbGVnaXRpbWF0ZWx5IHdhcm4gaWYgdGhleSBjYW4gcHJvdmUgdGhhdCB5b3UgYWNjZXNzCnAt
Pmlkc1sxXSBhbnl3aGVyZSwgZGVzcGl0ZSB5b3UgKHByZXN1bWFibHkpIGhhdmluZyBhbGxvY2F0
ZWQgZW5vdWdoCnNwYWNlLiAoSSBoYXZlbid0IGJlZW4gYWJsZSB0byB0aGluayBvZiBhIHdheSBm
b3IgdGhlIG1hY3JvIHRvCmFjdHVhbGx5IGRldGVjdCBhbmQgaGVuY2UgcmVmdXNlIHN1Y2ggd3Jv
bmcgdXNlcy4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
