Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AEAF8D9B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 12:09:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUTz2-0006KL-Rb; Tue, 12 Nov 2019 11:05:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUTz1-0006KG-2f
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 11:05:15 +0000
X-Inumbo-ID: 4c82ef64-053c-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c82ef64-053c-11ea-984a-bc764e2007e4;
 Tue, 12 Nov 2019 11:05:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23FEDAFF7;
 Tue, 12 Nov 2019 11:05:12 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
 <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
 <314a686c-55cb-e236-ee08-9b1f4d3c9878@suse.com>
 <3e3d1ec4-5de3-60d1-0d3d-d1fb44ee33ee@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2e55380-767e-a8e9-8dff-6b198243f0f5@suse.com>
Date: Tue, 12 Nov 2019 12:05:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3e3d1ec4-5de3-60d1-0d3d-d1fb44ee33ee@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMjAxOSAyMjozOCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IFdoZW4gc3Vw
cGx5aW5nICJwY2k9bm9tc2kiIHRvIHRoZSBndWVzdCBrZXJuZWwsIHRoZSBkZXZpY2Ugd29ya3Mg
ZmluZSwKPiBhbmQgSSBkb24ndCBnZXQgdGhlICJJTlZBTElEX0RFVl9SRVFVRVNUIi4KPiAKPiBB
ZnRlciByZXZlcnRpbmcgMWIwMGMxNmJkZiwgdGhlIGRldmljZSB3b3JrcyBmaW5lIAo+IGFuZCBJ
IGRvbid0IGdldCB0aGUgSU5WQUxJRF9ERVZfUkVRVUVTVCwgCgpDb3VsZCB5b3UgZ2l2ZSB0aGUg
cGF0Y2ggYmVsb3cgYSB0cnk/IFRoYXQgY29tbWl0IHRvb2sgY2FyZSBvZiBvbmx5CnNlY3VyaW5n
IG91cnNlbHZlcywgYnV0IG5vdCBvZiByZWxheGluZyB0aGluZ3MgYWdhaW4gd2hlbiBhIGRldmlj
ZQpnZXRzIGhhbmRlZCB0byBhIGd1ZXN0IGZvciBhY3R1YWwgdXNlLgoKSmFuCgpBTUQvSU9NTVU6
IHJlc3RvcmUgRFRFIGZpZWxkcyBpbiBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpCgpD
b21taXQgMWIwMGMxNmJkZiAoIkFNRC9JT01NVTogcHJlLWZpbGwgYWxsIERURXMgcmlnaHQgYWZ0
ZXIgdGFibGUKYWxsb2NhdGlvbiIpIG1vdmVkIG91cnNlbHZlcyBpbnRvIGEgbW9yZSBzZWN1cmUg
ZGVmYXVsdCBzdGF0ZSwgYnV0CmRpZG4ndCB0YWtlIHN1ZmZpY2llbnQgY2FyZSB0byBhbHNvIHVu
ZG8gdGhlIGVmZmVjdHMgd2hlbiBoYW5kaW5nIGEKcHJldmlvdXNseSBkaXNhYmxlZCBkZXZpY2Ug
YmFjayB0byBhKG5vdGhlcikgZG9tYWluLiBQdXQgdGhlIGZpZWxkcwp0aGF0IG1heSBoYXZlIGJl
ZW4gY2hhbmdlZCBlbHNld2hlcmUgYmFjayB0byB0aGVpciBpbnRlbmRlZCB2YWx1ZXMKKHNvbWUg
ZmllbGRzIGFtZF9pb21tdV9kaXNhYmxlX2RvbWFpbl9kZXZpY2UoKSB0b3VjaGVzIGRvbid0CmN1
cnJlbnRseSBnZXQgd3JpdHRlbiBhbnl3aGVyZSBlbHNlLCBhbmQgaGVuY2UgZG9uJ3QgbmVlZCBt
b2RpZnlpbmcKaGVyZSkuCgpSZXBvcnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBl
aWtlbGVuYm9vbS5pdD4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKLS0tIHVuc3RhYmxlLm9yaWcveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9h
bWRfaW9tbXUuYworKysgdW5zdGFibGUveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9h
bWRfaW9tbXUuYwpAQCAtMTE0LDExICsxMTQsMjEgQEAgc3RhdGljIHZvaWQgYW1kX2lvbW11X3Nl
dHVwX2RvbWFpbl9kZXZpYwogCiAgICAgaWYgKCAhZHRlLT52IHx8ICFkdGUtPnR2ICkKICAgICB7
CisgICAgICAgIGNvbnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJzX2RldjsKKwogICAgICAg
ICAvKiBiaW5kIERURSB0byBkb21haW4gcGFnZS10YWJsZXMgKi8KICAgICAgICAgYW1kX2lvbW11
X3NldF9yb290X3BhZ2VfdGFibGUoCiAgICAgICAgICAgICBkdGUsIHBhZ2VfdG9fbWFkZHIoaGQt
PmFyY2gucm9vdF90YWJsZSksIGRvbWFpbi0+ZG9tYWluX2lkLAogICAgICAgICAgICAgaGQtPmFy
Y2gucGFnaW5nX21vZGUsIHZhbGlkKTsKIAorICAgICAgICAvKiBVbmRvIHdoYXQgYW1kX2lvbW11
X2Rpc2FibGVfZG9tYWluX2RldmljZSgpIG1heSBoYXZlIGRvbmUuICovCisgICAgICAgIGl2cnNf
ZGV2ID0gJmdldF9pdnJzX21hcHBpbmdzKGlvbW11LT5zZWcpW3JlcV9pZF07CisgICAgICAgIGlm
ICggZHRlLT5pdF9yb290ICkKKyAgICAgICAgICAgIGR0ZS0+aW50X2N0bCA9IElPTU1VX0RFVl9U
QUJMRV9JTlRfQ09OVFJPTF9UUkFOU0xBVEVEOworICAgICAgICBkdGUtPml2ID0gaW9tbXVfaW50
cmVtYXA7CisgICAgICAgIGR0ZS0+ZXggPSBpdnJzX2Rldi0+ZHRlX2FsbG93X2V4Y2x1c2lvbjsK
KyAgICAgICAgZHRlLT5zeXNfbWd0ID0gTUFTS19FWFRSKGl2cnNfZGV2LT5kZXZpY2VfZmxhZ3Ms
IEFDUElfSVZIRF9TWVNURU1fTUdNVCk7CisKICAgICAgICAgaWYgKCBwY2lfYXRzX2RldmljZShp
b21tdS0+c2VnLCBidXMsIHBkZXYtPmRldmZuKSAmJgogICAgICAgICAgICAgIGlvbW11X2hhc19j
YXAoaW9tbXUsIFBDSV9DQVBfSU9UTEJfU0hJRlQpICkKICAgICAgICAgICAgIGR0ZS0+aSA9IGF0
c19lbmFibGVkOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
