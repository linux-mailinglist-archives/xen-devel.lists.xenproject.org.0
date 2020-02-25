Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0416B6C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 01:37:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6OAl-0005Ib-3R; Tue, 25 Feb 2020 00:34:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fvDX=4N=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j6OAj-0005IV-Pj
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 00:34:01 +0000
X-Inumbo-ID: 82d4da88-5766-11ea-9271-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.35])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82d4da88-5766-11ea-9271-12813bfff9fa;
 Tue, 25 Feb 2020 00:33:59 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4B433924C1DC10BD0C5D;
 Tue, 25 Feb 2020 08:33:57 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 08:33:47 +0800
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <5E53B3E3.6070304@hisilicon.com>
 <8bb7d100-0ca4-c0f9-b294-f2e7a173e1c9@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E546B6B.70906@hisilicon.com>
Date: Tue, 25 Feb 2020 08:33:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <8bb7d100-0ca4-c0f9-b294-f2e7a173e1c9@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] ns16550: Re-order the serial port address
 checking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gMjAyMC8yLzI1IDY6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBX
ZWksCj4gCj4gVGhhbmsgeW91IGZvciBzZW5kaW5nIGEgZm9sbG93LXVwLgo+IAo+IE9uIDI0LzAy
LzIwMjAgMTE6MzAsIFdlaSBYdSB3cm90ZToKPj4gQ2hlY2sgdGhlIHNlcmlhbCBwb3J0IGFkZHJl
c3Mgc3BhY2UgYmVmb3JlIGNoZWNraW5nIHRoZSBhZGRyZXNzLgo+IAo+IENvdWxkIHlvdSBleHBs
YWluIGluIGEgc2VudGVuY2Ugd2h5IHlvdSB3YW50IHRvIHJlLW9yZGVyPwoKRG8geW91IHRoaW5r
IGlzIGl0IE9LIHRvIGV4cGxhaW4gYXMgZm9sbG93aW5nOgoKVGhlIHNlcmlhbCBwb3J0IGFkZHJl
c3Mgc3BhY2UgSUQgcXVhbGlmaWVzIHRoZSBhZGRyZXNzLgpXaGV0aGVyIGEgdmFsdWUgb2YgemVy
byBmb3IgdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3MgY2FuIHNlbnNpYmx5Cm1lYW4gImRpc2FibGVk
IiBkZXBlbmRzIG9uIHRoZSBhZGRyZXNzIHNwYWNlIElELiBIZW5jZSBjaGVjayB0aGUKYWRkcmVz
cyBzcGFjZSBJRCBiZWZvcmUgY2hlY2tpbmcgdGhlIGFkZHJlc3MuCgpUaGFua3MhCgpCZXN0IFJl
Z2FyZHMsCldlaQoKPiAKPiBDaGVlcnMsCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBYdSA8
eHV3ZWk1QGhpc2lsaWNvbi5jb20+Cj4+IC0tLQo+PiAgIHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1
MC5jIHwgMTIgKysrKysrLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvbnMx
NjU1MC5jIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4gaW5kZXggZGM4YWM0Yy4uNDI1
ZTA0NCAxMDA2NDQKPj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4gKysrIGIv
eGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4gQEAgLTE2NDQsNiArMTY0NCwxMiBAQCBzdGF0
aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlfdWFydF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+
Cj4+ICAgICAgIHNwY3IgPSBjb250YWluZXJfb2YodGFibGUsIHN0cnVjdCBhY3BpX3RhYmxlX3Nw
Y3IsIGhlYWRlcik7Cj4+Cj4+ICsgICAgaWYgKCB1bmxpa2VseShzcGNyLT5zZXJpYWxfcG9ydC5z
cGFjZV9pZCAhPSBBQ1BJX0FEUl9TUEFDRV9TWVNURU1fTUVNT1JZKSApCj4+ICsgICAgewo+PiAr
ICAgICAgICBwcmludGsoIm5zMTY1NTA6IEFkZHJlc3Mgc3BhY2UgdHlwZSBpcyBub3QgbW1pb1xu
Iik7Cj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiArICAgIH0KPj4gKwo+PiAgICAgICAv
Kgo+PiAgICAgICAgKiBUaGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBtYXkgYmUgMCBmb3IgZXhhbXBs
ZQo+PiAgICAgICAgKiBpZiB0aGUgY29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4KPj4g
QEAgLTE2NTQsMTIgKzE2NjAsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlfdWFy
dF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4g
ICAgICAgfQo+Pgo+PiAtICAgIGlmICggdW5saWtlbHkoc3Bjci0+c2VyaWFsX3BvcnQuc3BhY2Vf
aWQgIT0gQUNQSV9BRFJfU1BBQ0VfU1lTVEVNX01FTU9SWSkgKQo+PiAtICAgIHsKPj4gLSAgICAg
ICAgcHJpbnRrKCJuczE2NTUwOiBBZGRyZXNzIHNwYWNlIHR5cGUgaXMgbm90IG1taW9cbiIpOwo+
PiAtICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gLSAgICB9Cj4+IC0KPj4gICAgICAgbnMxNjU1
MF9pbml0X2NvbW1vbih1YXJ0KTsKPj4KPj4gICAgICAgLyoKPj4KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
