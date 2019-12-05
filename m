Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FB41143BF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:36:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ict8f-0007bx-QF; Thu, 05 Dec 2019 15:33:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ict8f-0007bs-3s
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:33:57 +0000
X-Inumbo-ID: a60df7e6-1774-11ea-822b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a60df7e6-1774-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:33:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BD36ABC7;
 Thu,  5 Dec 2019 15:33:55 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
Date: Thu, 5 Dec 2019 16:34:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4] gnttab: don't expose host physical address
 without need
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
YW5zbGF0ZWQKcmF0aGVyIHRoYW4gbm9uLWV4dGVybmFsKS4KClN0aWxsIGFsb25nIHRoZXNlIGxp
bmVzIGluIHRoZSB1bm1hcHBpbmcgY2FzZSB0aGVyZSdzIG5vIHBvaW50IGNoZWNraW5nCi0+ZGV2
X2J1c19hZGRyIHdoZW4gR05UTUFQX2RldmljZV9tYXAgaXNuJ3Qgc2V0IChhbmQgaGVuY2UgdGhl
IGZpZWxkCmlzbid0IGdvaW5nIHRvIGJlIGNvbnN1bWVkKS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY0OiBSZS1iYXNlIG92ZXIgZHJvcHBlZCBw
YXRjaGVzLgp2MzogTmV3LgoKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCisrKyBiL3hl
bi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtOTY3LDEwICs5NjcsMTYgQEAgbWFwX2dyYW50X3Jl
ZigKICAgICB9CiAKICAgICBpZiAoIHVubGlrZWx5KHBhZ2luZ19tb2RlX2V4dGVybmFsKGxkKSAm
JgotICAgICAgICAgICAgICAgICAgKG9wLT5mbGFncyAmIChHTlRNQVBfZGV2aWNlX21hcHxHTlRN
QVBfYXBwbGljYXRpb25fbWFwfAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdOVE1BUF9j
b250YWluc19wdGUpKSkgKQorICAgICAgICAgICAgICAgICAgKG9wLT5mbGFncyAmIChHTlRNQVBf
YXBwbGljYXRpb25fbWFwfEdOVE1BUF9jb250YWluc19wdGUpKSkgKQogICAgIHsKLSAgICAgICAg
Z2RwcmludGsoWEVOTE9HX0lORk8sICJObyBkZXZpY2UgbWFwcGluZyBpbiBIVk0gZG9tYWluXG4i
KTsKKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJObyBhcHAvcHRlIG1hcHBpbmcgaW4g
SFZNIGRvbWFpblxuIik7CisgICAgICAgIG9wLT5zdGF0dXMgPSBHTlRTVF9nZW5lcmFsX2Vycm9y
OworICAgICAgICByZXR1cm47CisgICAgfQorCisgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xh
dGUobGQpICYmIHVubGlrZWx5KG9wLT5mbGFncyAmIEdOVE1BUF9kZXZpY2VfbWFwKSApCisgICAg
eworICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5GTywgIk5vIGRldmljZSBtYXBwaW5nIGluIHRy
YW5zbGF0ZWQgZG9tYWluXG4iKTsKICAgICAgICAgb3AtPnN0YXR1cyA9IEdOVFNUX2dlbmVyYWxf
ZXJyb3I7CiAgICAgICAgIHJldHVybjsKICAgICB9CkBAIC0xMjEzLDcgKzEyMTksOCBAQCBtYXBf
Z3JhbnRfcmVmKAogICAgIGlmICggbmVlZF9pb21tdSApCiAgICAgICAgIGRvdWJsZV9ndF91bmxv
Y2sobGd0LCByZ3QpOwogCi0gICAgb3AtPmRldl9idXNfYWRkciA9IG1mbl90b19tYWRkcihtZm4p
OworICAgIG9wLT5kZXZfYnVzX2FkZHIgPSBwYWdpbmdfbW9kZV90cmFuc2xhdGUobGQpID8gb3At
Pmhvc3RfYWRkcgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDogbWZuX3RvX21hZGRyKG1mbik7CiAgICAgb3AtPmhhbmRsZSAgICAgICA9IGhhbmRsZTsK
ICAgICBvcC0+c3RhdHVzICAgICAgID0gR05UU1Rfb2theTsKIApAQCAtMTM5NCw3ICsxNDAxLDcg
QEAgdW5tYXBfY29tbW9uKAogCiAgICAgb3AtPm1mbiA9IGFjdC0+bWZuOwogCi0gICAgaWYgKCBv
cC0+ZGV2X2J1c19hZGRyICYmCisgICAgaWYgKCBvcC0+ZGV2X2J1c19hZGRyICYmIChmbGFncyAm
IEdOVE1BUF9kZXZpY2VfbWFwKSAmJgogICAgICAgICAgdW5saWtlbHkob3AtPmRldl9idXNfYWRk
ciAhPSBtZm5fdG9fbWFkZHIoYWN0LT5tZm4pKSApCiAgICAgICAgIFBJTl9GQUlMKGFjdF9yZWxl
YXNlX291dCwgR05UU1RfZ2VuZXJhbF9lcnJvciwKICAgICAgICAgICAgICAgICAgIkJ1cyBhZGRy
ZXNzIGRvZXNuJ3QgbWF0Y2ggZ250cmVmICglIlBSSXg2NCIgIT0gJSJQUklwYWRkciIpXG4iLAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
