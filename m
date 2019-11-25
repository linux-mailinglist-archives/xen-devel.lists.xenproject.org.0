Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D96108B4A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:01:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZB9S-0001H4-RM; Mon, 25 Nov 2019 09:59:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZB9R-0001Gw-He
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 09:59:25 +0000
X-Inumbo-ID: 4259c516-0f6a-11ea-a38a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4259c516-0f6a-11ea-a38a-12813bfff9fa;
 Mon, 25 Nov 2019 09:59:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EED5CAC2C;
 Mon, 25 Nov 2019 09:59:23 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
Message-ID: <1dcb0914-bdbb-6ffa-572b-c91b0ecdc5b3@suse.com>
Date: Mon, 25 Nov 2019 10:59:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 3/3] gnttab: don't expose host physical
 address without need
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJhbnNsYXRlZCBkb21haW5zIHNob3VsZG4ndCBzZWUgaG9zdCBwaHlzaWNhbCBhZGRyZXNzZXMu
IFdoaWxlIHRoZQphZGRyZXNzIGlzIGFsc28gbm90IHN1cHBvc2VkIHRvIGJlIGhhbmRlZCBiYWNr
IGV2ZW4gdG8gbm9uLXRyYW5zbGF0ZWQKZG9tYWlucyB3aGVuIEdOVE1BUF9kZXZpY2VfbWFwIGlz
IG5vdCBzZXQgKGFzIGV4cGxpY2l0bHkgc3RhdGVkIGJ5IGEKY29tbWVudCBpbiB0aGUgcHVibGlj
IGhlYWRlciksIFBWIGtlcm5lbHMgKExpbnV4IGF0IGxlYXN0KSBhc3N1bWUgdGhlCmZpZWxkIHRv
IGdldCBwb3B1bGF0ZWQgbmV2ZXJ0aGVsZXNzLiAoU2ltaWxhcmx5IG1hcGtpbmQoKSBzaG91bGQg
Y2hlY2sKb25seSBHTlRNQVBfZGV2aWNlX21hcC4pCgpBbG9uZyB0aGVzZSBsaW5lcyBzcGxpdCB0
aGUgcGFnaW5nIG1vZGUgcmVsYXRlZCBjaGVjayBuZWFyIHRoZSB0b3Agb2YKbWFwX2dyYW50X3Jl
ZigpIHRvIGhhbmRsZSB0aGUgImV4dGVybmFsIiBhbmQgInRyYW5zbGF0ZWQiIGNhc2VzCnNlcGFy
YXRlbHkgKEdOVE1BUF9kZXZpY2VfbWFwIHVzZSBnZXR0aW5nIHRpZWQgdG8gYmVpbmcgbm9uLXRy
YW5zbGF0ZWQKcmF0aGVyIHRoYW4gbm9uLWV4dGVybmFsKSwgYW5kIG1ha2UgdGhlIGFzc2lnbm1l
bnQgb2YgLT5kZXZfYnVzX2FkZHIKY29uZGl0aW9uYWwgdXBvbiB0aGUgZ3Vlc3QgYmVpbmcgYSBu
b24tdHJhbnNsYXRlZCBvbmUuCgpTdGlsbCBhbG9uZyB0aGVzZSBsaW5lcyBpbiB0aGUgdW5tYXBw
aW5nIGNhc2UgdGhlcmUncyBubyBwb2ludCBjaGVja2luZwotPmRldl9idXNfYWRkciB3aGVuIEdO
VE1BUF9kZXZpY2VfbWFwIGlzbid0IHNldCAoYW5kIGhlbmNlIHRoZSBmaWVsZAppc24ndCBnb2lu
ZyB0byBiZSBjb25zdW1lZCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Ci0tLQp2MzogTmV3LgoKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCisr
KyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtOTM4LDIxICs5MzgsMjkgQEAgbWFwX2dy
YW50X3JlZigKICAgICB9CiAKICAgICBpZiAoIHVubGlrZWx5KHBhZ2luZ19tb2RlX2V4dGVybmFs
KGxkKSAmJgotICAgICAgICAgICAgICAgICAgKG9wLT5mbGFncyAmIChHTlRNQVBfZGV2aWNlX21h
cHxHTlRNQVBfYXBwbGljYXRpb25fbWFwfAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdO
VE1BUF9jb250YWluc19wdGUpKSkgKQorICAgICAgICAgICAgICAgICAgKG9wLT5mbGFncyAmIChH
TlRNQVBfYXBwbGljYXRpb25fbWFwfEdOVE1BUF9jb250YWluc19wdGUpKSkgKQogICAgIHsKLSAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJObyBkZXZpY2UgbWFwcGluZyBpbiBIVk0gZG9t
YWluXG4iKTsKKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJObyBhcHBsaWNhdGlvbiBt
YXBwaW5nIGluIEhWTSBkb21haW5cbiIpOwogICAgICAgICBvcC0+c3RhdHVzID0gR05UU1RfZ2Vu
ZXJhbF9lcnJvcjsKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIGlmICggcGFnaW5nX21v
ZGVfdHJhbnNsYXRlKGxkKSAmJiAob3AtPmZsYWdzICYgR05UTUFQX2hvc3RfbWFwKSAmJgotICAg
ICAgICAgKHJjID0gbm90aWZ5X2dmbihsZCwgZ2FkZHJfdG9fZ2ZuKG9wLT5ob3N0X2FkZHIpKSkg
KQorICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRlKGxkKSApCiAgICAgewotICAgICAgICBn
ZHByaW50ayhYRU5MT0dfSU5GTywgIm5vdGlmeSglIlBSSV9nZm4iKSAtPiAlZFxuIiwKLSAgICAg
ICAgICAgICAgICAgZ2ZuX3goZ2FkZHJfdG9fZ2ZuKG9wLT5ob3N0X2FkZHIpKSwgcmMpOwotICAg
ICAgICBvcC0+c3RhdHVzID0gR05UU1RfZ2VuZXJhbF9lcnJvcjsKLSAgICAgICAgcmV0dXJuOwor
ICAgICAgICBpZiAoIHVubGlrZWx5KChvcC0+ZmxhZ3MgJiBHTlRNQVBfZGV2aWNlX21hcCkpICkK
KyAgICAgICAgeworICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJObyBkZXZpY2Ug
bWFwcGluZyBpbiB0cmFuc2xhdGVkIGRvbWFpblxuIik7CisgICAgICAgICAgICBvcC0+c3RhdHVz
ID0gR05UU1RfZ2VuZXJhbF9lcnJvcjsKKyAgICAgICAgICAgIHJldHVybjsKKyAgICAgICAgfQor
CisgICAgICAgIGlmICggdW5saWtlbHkocmMgPSBub3RpZnlfZ2ZuKGxkLCBnYWRkcl90b19nZm4o
b3AtPmhvc3RfYWRkcikpKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19JTkZPLCAibm90aWZ5KCUiUFJJX2dmbiIpIC0+ICVkXG4iLAorICAgICAgICAgICAgICAgICAg
ICAgZ2ZuX3goZ2FkZHJfdG9fZ2ZuKG9wLT5ob3N0X2FkZHIpKSwgcmMpOworICAgICAgICAgICAg
b3AtPnN0YXR1cyA9IEdOVFNUX2dlbmVyYWxfZXJyb3I7CisgICAgICAgICAgICByZXR1cm47Cisg
ICAgICAgIH0KICAgICAgICAgQlVJTERfQlVHX09OKEdOVFNUX29rYXkpOwogICAgIH0KIApAQCAt
MTIwMSw3ICsxMjA5LDggQEAgbWFwX2dyYW50X3JlZigKICAgICBpZiAoIG5lZWRfaW9tbXUgKQog
ICAgICAgICBkb3VibGVfZ3RfdW5sb2NrKGxndCwgcmd0KTsKIAotICAgIG9wLT5kZXZfYnVzX2Fk
ZHIgPSBtZm5fdG9fbWFkZHIobWZuKTsKKyAgICBvcC0+ZGV2X2J1c19hZGRyID0gcGFnaW5nX21v
ZGVfdHJhbnNsYXRlKGxkKSA/IG9wLT5ob3N0X2FkZHIKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA6IG1mbl90b19tYWRkcihtZm4pOwogICAgIG9wLT5o
YW5kbGUgICAgICAgPSBoYW5kbGU7CiAgICAgb3AtPnN0YXR1cyAgICAgICA9IEdOVFNUX29rYXk7
CiAKQEAgLTEzODIsNyArMTM5MSw3IEBAIHVubWFwX2NvbW1vbigKIAogICAgIG9wLT5tZm4gPSBh
Y3QtPm1mbjsKIAotICAgIGlmICggb3AtPmRldl9idXNfYWRkciAmJgorICAgIGlmICggb3AtPmRl
dl9idXNfYWRkciAmJiAoZmxhZ3MgJiBHTlRNQVBfZGV2aWNlX21hcCkgJiYKICAgICAgICAgIHVu
bGlrZWx5KG9wLT5kZXZfYnVzX2FkZHIgIT0gbWZuX3RvX21hZGRyKGFjdC0+bWZuKSkgKQogICAg
ICAgICBQSU5fRkFJTChhY3RfcmVsZWFzZV9vdXQsIEdOVFNUX2dlbmVyYWxfZXJyb3IsCiAgICAg
ICAgICAgICAgICAgICJCdXMgYWRkcmVzcyBkb2Vzbid0IG1hdGNoIGdudHJlZiAoJSJQUkl4NjQi
ICE9ICUiUFJJcGFkZHIiKVxuIiwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
