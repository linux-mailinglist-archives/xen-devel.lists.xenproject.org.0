Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6E313B7
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWlCV-0005Tn-Ag; Fri, 31 May 2019 17:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWlCU-0005Ti-2Z
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:20:18 +0000
X-Inumbo-ID: 5bff5356-83c8-11e9-98ea-fb3b03ce73b6
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5bff5356-83c8-11e9-98ea-fb3b03ce73b6;
 Fri, 31 May 2019 17:20:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF26A78;
 Fri, 31 May 2019 10:20:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8CCE3F59C;
 Fri, 31 May 2019 10:20:15 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <95997879-061e-dd6d-5ac3-e0e174fd5e51@arm.com>
Date: Fri, 31 May 2019 18:20:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/lib: Introduce printk_once() and
 replace some opencoded examples
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMTcvMDUvMjAxOSAxOTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBS
ZWZsb3cgdGhlIFp5bnFNUCBtZXNzYWdlIGZvciBncmVwYWJpbGl0eSwgYW5kIGZpeCB0aGUgb21p
c3Npb24gb2YgYSBuZXdsaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZWdhcmRsZXNzIEphbidzIGNvbW1lbnQ6CgpSZXZp
ZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkkgd2lsbCBsZXQg
SmFuL1lvdSB0byBjb21taXQgdGhlIHBhdGNoLgoKQ2hlZXJzLAoKPiAtLS0KPiBDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2NwdWVy
cmF0YS5jICAgICAgICAgICAgICAgfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9hcmNo
L2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5jIHwgIDkgKystLS0tLS0tCj4gICB4ZW4vaW5j
bHVkZS94ZW4vbGliLmggICAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gICAzIGZp
bGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRh
LmMKPiBpbmRleCA0NDMxYjI0Li44OTA0OTM5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9j
cHVlcnJhdGEuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYwo+IEBAIC0zMzYsMTgg
KzMzNiwxMSBAQCBzdGF0aWMgYm9vbCBoYXNfc3NiZF9taXRpZ2F0aW9uKGNvbnN0IHN0cnVjdCBh
cm1fY3B1X2NhcGFiaWxpdGllcyAqZW50cnkpCj4gICAgICAgc3dpdGNoICggc3NiZF9zdGF0ZSAp
Cj4gICAgICAgewo+ICAgICAgIGNhc2UgQVJNX1NTQkRfRk9SQ0VfRElTQUJMRToKPiAtICAgIHsK
PiAtICAgICAgICBzdGF0aWMgYm9vbCBvbmNlID0gdHJ1ZTsKPiAtCj4gLSAgICAgICAgaWYgKCBv
bmNlICkKPiAtICAgICAgICAgICAgcHJpbnRrKCIlcyBkaXNhYmxlZCBmcm9tIGNvbW1hbmQtbGlu
ZVxuIiwgZW50cnktPmRlc2MpOwo+IC0gICAgICAgIG9uY2UgPSBmYWxzZTsKPiArICAgICAgICBw
cmludGtfb25jZSgiJXMgZGlzYWJsZWQgZnJvbSBjb21tYW5kLWxpbmVcbiIsIGVudHJ5LT5kZXNj
KTsKPiAgIAo+ICAgICAgICAgICBhcm1fc21jY2NfMV8xX3NtYyhBUk1fU01DQ0NfQVJDSF9XT1JL
QVJPVU5EXzJfRklELCAwLCBOVUxMKTsKPiAgICAgICAgICAgcmVxdWlyZWQgPSBmYWxzZTsKPiAt
Cj4gICAgICAgICAgIGJyZWFrOwo+IC0gICAgfQo+ICAgCj4gICAgICAgY2FzZSBBUk1fU1NCRF9S
VU5USU1FOgo+ICAgICAgICAgICBpZiAoIHJlcXVpcmVkICkKPiBAQCAtMzU5LDE4ICszNTIsMTEg
QEAgc3RhdGljIGJvb2wgaGFzX3NzYmRfbWl0aWdhdGlvbihjb25zdCBzdHJ1Y3QgYXJtX2NwdV9j
YXBhYmlsaXRpZXMgKmVudHJ5KQo+ICAgICAgICAgICBicmVhazsKPiAgIAo+ICAgICAgIGNhc2Ug
QVJNX1NTQkRfRk9SQ0VfRU5BQkxFOgo+IC0gICAgewo+IC0gICAgICAgIHN0YXRpYyBib29sIG9u
Y2UgPSB0cnVlOwo+IC0KPiAtICAgICAgICBpZiAoIG9uY2UgKQo+IC0gICAgICAgICAgICBwcmlu
dGsoIiVzIGZvcmNlZCBmcm9tIGNvbW1hbmQtbGluZVxuIiwgZW50cnktPmRlc2MpOwo+IC0gICAg
ICAgIG9uY2UgPSBmYWxzZTsKPiArICAgICAgICBwcmludGtfb25jZSgiJXMgZm9yY2VkIGZyb20g
Y29tbWFuZC1saW5lXG4iLCBlbnRyeS0+ZGVzYyk7Cj4gICAKPiAgICAgICAgICAgYXJtX3NtY2Nj
XzFfMV9zbWMoQVJNX1NNQ0NDX0FSQ0hfV09SS0FST1VORF8yX0ZJRCwgMSwgTlVMTCk7Cj4gICAg
ICAgICAgIHJlcXVpcmVkID0gdHJ1ZTsKPiAtCj4gICAgICAgICAgIGJyZWFrOwo+IC0gICAgfQo+
ICAgCj4gICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5jIGIveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMKPiBpbmRleCAwOGUzZTExLi4zMDYw
ZDc5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMKPiBAQCAtMzUs
MTQgKzM1LDkgQEAgc3RhdGljIGJvb2wgenlucW1wX3NtYyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncykKPiAgICAgICAgKi8KPiAgICAgICBpZiAoICFjcHVzX2hhdmVfY29uc3RfY2FwKEFSTV9T
TUNDQ18xXzEpICkKPiAgICAgICB7Cj4gLSAgICAgICAgc3RhdGljIGJvb2wgb25jZSA9IHRydWU7
Cj4gKyAgICAgICAgcHJpbnRrX29uY2UoWEVOTE9HX1dBUk5JTkcKPiArICAgICAgICAgICAgICAg
ICAgICAiWnlucU1QIGZpcm13YXJlIEVycm9yOiBubyBTTUNDQyAxLjEgc3VwcG9ydC4gRGlzYWJs
aW5nIGZpcm13YXJlIGNhbGxzXG4iKTsKPiAgIAo+IC0gICAgICAgIGlmICggb25jZSApCj4gLSAg
ICAgICAgewo+IC0gICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIlp5bnFNUCBmaXJt
d2FyZSBFcnJvcjogbm8gU01DQ0MgMS4xICIKPiAtICAgICAgICAgICAgICAgICAgICJzdXBwb3J0
LiBEaXNhYmxpbmcgZmlybXdhcmUgY2FsbHMuIik7Cj4gLSAgICAgICAgICAgIG9uY2UgPSBmYWxz
ZTsKPiAtICAgICAgICB9Cj4gICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICB9Cj4gICAg
ICAgcmV0dXJuIHp5bnFtcF9lZW1pKHJlZ3MpOwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4vbGliLmggYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiBpbmRleCA5MWVkNTZjLi5jZTIzMWM1
IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9saWIuaAo+IEBAIC0xMDUsNiArMTA1LDE3IEBAIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0
IGNoYXIgKmZtdCwgLi4uKSB7fQo+ICAgI2RlZmluZSBfcChfeCkgKCh2b2lkICopKHVuc2lnbmVk
IGxvbmcpKF94KSkKPiAgIGV4dGVybiB2b2lkIHByaW50ayhjb25zdCBjaGFyICpmb3JtYXQsIC4u
LikKPiAgICAgICBfX2F0dHJpYnV0ZV9fICgoZm9ybWF0IChwcmludGYsIDEsIDIpKSk7Cj4gKwo+
ICsjZGVmaW5lIHByaW50a19vbmNlKGZtdCwgYXJncy4uLikgICAgICAgICAgICAgICBcCj4gKyh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHN0
YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb25jZV87ICAgICAgICAgICAgXAo+ICsgICAgaWYgKCB1
bmxpa2VseSghb25jZV8pICkgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICB7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICBvbmNlXyA9IHRy
dWU7ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgIHByaW50ayhmbXQsICMj
IGFyZ3MpOyAgICAgICAgICAgICAgICAgICBcCj4gKyAgICB9ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArfSkKPiArCj4gICBleHRlcm4gdm9pZCBndWVzdF9w
cmludGsoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pCj4g
ICAgICAgX19hdHRyaWJ1dGVfXyAoKGZvcm1hdCAocHJpbnRmLCAyLCAzKSkpOwo+ICAgZXh0ZXJu
IHZvaWQgbm9yZXR1cm4gcGFuaWMoY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pCj4gCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
