Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E632EF4
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 13:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXlQ6-000721-RM; Mon, 03 Jun 2019 11:46:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXlQ4-00071w-HH
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 11:46:28 +0000
X-Inumbo-ID: 389b9a76-85f5-11e9-a8da-8b380d3a8e51
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 389b9a76-85f5-11e9-a8da-8b380d3a8e51;
 Mon, 03 Jun 2019 11:46:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42AFC15A2;
 Mon,  3 Jun 2019 04:46:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FA9F3F5AF;
 Mon,  3 Jun 2019 04:46:25 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e98e452a-b6b4-6296-5e9a-e00c8acc5951@arm.com>
Date: Mon, 3 Jun 2019 12:46:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjEvMDUvMjAxOSAyMjoyNSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3Nl
dHVwLmMKPiBpbmRleCBjY2IwZjE4MWVhLi4xYTI0MGQyMDhiIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL2FybS9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiBAQCAtNDksNiAr
NDksNyBAQAo+ICAgI2luY2x1ZGUgPGFzbS9wbGF0Zm9ybS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9w
cm9jaW5mby5oPgo+ICAgI2luY2x1ZGUgPGFzbS9zZXR1cC5oPgo+ICsjaW5jbHVkZSA8YXNtL3Rl
ZS90ZWUuaD4KPiAgICNpbmNsdWRlIDx4c20veHNtLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2FjcGku
aD4KPiAgIAo+IEBAIC04OTUsNiArODk2LDcgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2ln
bmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKPiAgICAgICBkb20wX2NmZy5hcmNoLm5yX3NwaXMg
PSBtaW4oZ2ljX251bWJlcl9saW5lcygpLCAodW5zaWduZWQgaW50KSA5OTIpIC0gMzI7Cj4gICAg
ICAgaWYgKCBnaWNfbnVtYmVyX2xpbmVzKCkgPiA5OTIgKQo+ICAgICAgICAgICBwcmludGsoWEVO
TE9HX1dBUk5JTkcgIk1heGltdW0gbnVtYmVyIG9mIHZHSUMgSVJRcyBleGNlZWRlZC5cbiIpOwo+
ICsgICAgZG9tMF9jZmcuYXJjaC50ZWVfdHlwZSA9IHRlZV9nZXRfdHlwZSgpOwoKSSB3YXMgZXhw
ZWN0aW5nIHNvbWUgY29kZSB0byBnZW5lcmF0ZS9kcm9wcGVkIHRoZSBPUC1URUUgbm9kZSBpbiBE
b20wIERUQi4gRm9yIAppbnN0YW5jZSwgd2Ugd2FudCB0byBwcm9tb3RlIHRoZSB1c2Ugb2YgImh2
YyIgYW5kIG5vdCAic21jIi4KCgo+ICAgICAgIGRvbTBfY2ZnLm1heF92Y3B1cyA9IGRvbTBfbWF4
X3ZjcHVzKCk7Cj4gICAKPiAgICAgICBkb20wID0gZG9tYWluX2NyZWF0ZSgwLCAmZG9tMF9jZmcs
IHRydWUpOwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL01ha2VmaWxlIGIveGVuL2Fy
Y2gvYXJtL3RlZS9NYWtlZmlsZQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uYzU0ZDQ3OTZmZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC9hcm0vdGVl
L01ha2VmaWxlCj4gQEAgLTAsMCArMSBAQAo+ICtvYmoteSArPSB0ZWUubwo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdGVlL3RlZS5jIGIveGVuL2FyY2gvYXJtL3RlZS90ZWUuYwo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNmJkYTg0Njk1Mwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL3RlZS5jCj4gQEAgLTAsMCArMSw5MyBAQAo+
ICsvKgo+ICsgKiB4ZW4vYXJjaC9hcm0vdGVlL3RlZS5jCj4gKyAqCj4gKyAqIEdlbmVyaWMgcGFy
dCBvZiBURUUgbWVkaWF0b3Igc3Vic3lzdGVtCj4gKyAqCj4gKyAqIFZvbG9keW15ciBCYWJjaHVr
IDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiArICogQ29weXJpZ2h0IChjKSAyMDE4LTIw
MTkgRVBBTSBTeXN0ZW1zLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+ICsgKiBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwo+
ICsgKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KPiArICoKPiAr
ICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBi
ZSB1c2VmdWwsCj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRo
ZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKPiArICogR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8eGVuL2Vy
cm5vLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+
Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL3RlZS90ZWUuaD4KPiArCj4gK2V4dGVybiBjb25zdCBzdHJ1
Y3QgdGVlX21lZGlhdG9yX2Rlc2MgX3N0ZWVtZWRpYXRvcltdLCBfZXRlZW1lZGlhdG9yW107Cj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVlX21lZGlhdG9yX2Rlc2MgKmN1cl9tZWRpYXRvcjsKCk5J
VDogWW91IHByb2JhYmx5IHdhbnQgYSBfX3JlYWRfbW9zdGx5IGhlcmUuCgpCb3RoIGNoYW5nZXMg
Y2FuIGJlIGRvbmUgaW4gZm9sbG93LXVwOgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
