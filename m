Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F71260E0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:32:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtzZ-00067z-17; Thu, 19 Dec 2019 11:29:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihtzW-00067u-SZ
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:29:14 +0000
X-Inumbo-ID: c818f032-2252-11ea-918a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c818f032-2252-11ea-918a-12813bfff9fa;
 Thu, 19 Dec 2019 11:29:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 163C6ADC8;
 Thu, 19 Dec 2019 11:29:12 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191218144133.16089-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f5cadab-bdef-25ab-69e9-8a12c1899ee1@suse.com>
Date: Thu, 19 Dec 2019 12:29:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218144133.16089-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/hvm/rtc: preserved guest RTC offset
 during suspend/resume/migrate
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxNTo0MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBlbXVsYXRlZCBS
VEMgaXMgc3luY2hyb25pemVkIHdpdGggdGhlIFBWIHdhbGxjbG9jazsgYW55IHdyaXRlIHRvIHRo
ZQo+IFJUQyB3aWxsIHVwZGF0ZSBzdHJ1Y3QgZG9tYWluJ3MgJ3RpbWVfb2Zmc2V0X3NlY29uZHMn
IGZpZWxkIGFuZCBjYWxsCj4gdXBkYXRlX2RvbWFpbl93YWxsY2xvY2soKS4KPiAKPiBIb3dldmVy
LCB0aGUgdmFsdWUgb2YgJ3RpbWVfb2Zmc2V0X3NlY29uZHMnIGlzIG5vdCBwcmVzZXJ2ZWQgaW4g
YW55IHNhdmUKPiByZWNvcmQgYW5kIGluZGVlZCwgd2hlbiB0aGUgUlRDIHNhdmUgcmVjb3JkIGlz
IGxvYWRlZCwgdGhlIENNT1MgdmFsdWVzCj4gd2lsbCBiZSB1cGRhdGVkIGJhc2VkIG9uIGFuIG9m
ZnNldCB2YWx1ZSB3aGljaCBtYXkgb3IgbWF5IG5vdCBoYXZlIGJlZW4KPiBzZXQgYnkgdGhlIHRv
b2xzdGFjayBbMV0uIFRoaXMgbWF5IHJlc3VsdCBpbiBtYWtpbmcgYm9ndXMgdmFsdWVzIGF2YWls
YWJsZQo+IHRvIHRoZSBndWVzdCBhbmQgbWVzc2luZyB1cCBhbnkgY2FsY3VsYXRpb25zIGRvbmUg
aW4gdGhlIGNhbGwgdG8KPiBhbGFybV90aW1lcl91cGRhdGUoKSBhdCB0aGUgZW5kIG9mIHJ0Y19s
b2FkKCkuCj4gCj4gVGhpcyBwYXRjaCBleHRlbmRzIHRoZSBSVEMgc2F2ZSByZWNvcmQgdG8gY29u
dGFpbiBhbiBvZmZzZXQgdmFsdWUsIHdoaWNoCj4gd2lsbCBiZSB6ZXJvIGZpbGxlZCBvbiBsb2Fk
IG9mIGFuIG9sZGVyIHJlY29yZC4gVGhlICd0aW1lX29mZnNldF9zZWNvb25kcycKPiBmaWVsZCBp
biBzdHJ1Y3QgZG9tYWluIGlzIGFsc28gbW9kaWZpZWQgaW50byBhICd0aW1lX29mZnNldCcgc3Ry
dWN0LAo+IGNvbnRhaW5pbmcgYSAnc2Vjb25kcycgZmllbGQgYW5kIGEgYm9vbGVhbiAnc2V0JyBm
aWVsZC4KPiAKPiBUaGUgY29kZSBpbiBydGNfbG9hZCgpIHRoZW4gdXNlcyB0aGUgbmV3IHZhbHVl
IGluIHRoZSBzYXZlIHJlY29yZCB0bwo+IHVwZGF0ZSB0aGUgdmFsdWUgb2Ygc3RydWN0IGRvbWFp
bidzICd0aW1lX29mZnNldC5zZWNvbmRzJyB1bmxlc3MKPiAndGltZV9vZmZzZXQuc2V0JyBpcyB0
cnVlLCB3aGljaCB3aWxsIG9ubHkgYmUgdGhlIGNhc2UgaWYgdGhlIHRvb2xzdGFjayBoYXMKPiBh
bHJlYWR5IHBlcmZvcm1lZCBhIFhFTl9ET01DVExfc2V0dGltZW9mZnNldC4KPiAKPiBbMV0gVGhl
cmUgaXMgY3VycmVudGx5IG5vIHdheSBmb3IgYSB0b29sc3RhY2sgdG8gcmVhZCB0aGUgdmFsdWUg
b2YKPiAgICAgJ3RpbWVfb2Zmc2V0X3NlY29uZHMnIGZyb20gc3RydWN0IGRvbWFpbi4gSW4gdGhl
IHBhc3QsIGFueSBob3BlIG9mCj4gICAgIHByZXNlcnZhdGlvbiBvZiB0aGUgdmFsdWUgYWNyb3Nz
IGEgZ3Vlc3QgbGlmZS1jeWNsZSBvcGVyYXRpb24gd2FzIGJhc2VkCj4gICAgIG9uIHJlbHlpbmcg
b24gcWVtdS1kbSB0byB3cml0ZSBhIHZhbHVlIGludG8geGVuc3RvcmUgd2hlbmV2ZXIgdGhlIFJU
Qwo+ICAgICB3YXMgdXBkYXRlZCwgaW4gcmVzcG9uc2UgdG8gYW4gSU9SRVEgd2l0aCB0eXBlIElP
UkVRX1RZUEVfVElNRU9GRlNFVAo+ICAgICBiZWluZyBzZW50IGJ5IFhlbjsgc2VlOgo+IAo+ICAg
ICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cWVtdS14ZW4tdHJhZGl0aW9uYWwu
Z2l0O2E9YmxvYjtmPWkzODYtZG0vaGVscGVyMi5jI2w0NTcKPiAKPiAgICAgYnV0IHRoaXMgYmVo
YXZpb3VyIHdhcyBuZXZlciBmb3J3YXJkLXBvcnRlZCBpbnRvIHVwc3RyZWFtIFFFTVUsIHdoaWNo
Cj4gICAgIGNvbXBsZXRlbHkgaWdub3JlcyB0aGF0IElPUkVRIHR5cGUuCj4gICAgIEluIGVpdGhl
ciBjYXNlLCBub3RoaW5nIGluIHhsIG9yIGxpYnhsIGV2ZXIgc2FtcGxlcyB0aGUgdmFsdWUgb2YK
PiAgICAgUlRDIG9mZnNldCBmcm9tIHhlbnN0b3JlIHNvIGFueSBvZmZzZXQgYWRqdXN0bWVudCB0
byBhIG5vbi16ZXJvIHZhbHVlCj4gICAgIHBlcmZvcm1lZCBieSB0aGUgZ3Vlc3QgKHdoaWNoIGlu
IHRoZSBjYXNlIG9mIFdpbmRvd3MgaXMgaGlnaGx5IGxpa2VseQo+ICAgICBhcyBpdCBub3JtYWxs
eSB3cml0ZXMgUlRDIGluIGxvY2FsIHRpbWUsIHdoZXJlYXMgWGVuIG1haW50YWlucyB0aW1lIGlu
Cj4gICAgIFVUQykgaXMgY29tcGxldGVseSBsb3N0IHdpdGggdGhlIGRlLWZhY3RvIHRvb2xzdGFj
aywgYW5kIGFsd2F5cyBoYXMKPiAgICAgYmVlbi4gSW5zdGVhZCwgUFYgZHJpdmVycyBhcmUgcmVs
aWVkIHVwb24gdG8gcGFwZXIgb3ZlciB0aGlzIGdhcGluZwo+ICAgICBob2xlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggb25lIHJlbWFyazoKCj4gQEAg
LTc3MSw2ICs3NzMsMTIgQEAgc3RhdGljIGludCBydGNfbG9hZChzdHJ1Y3QgZG9tYWluICpkLCBo
dm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPiAgCj4gICAgICAvKiBSZXNldCB0aGUgd2FsbC1jbG9j
ayB0aW1lLiAgSW4gbm9ybWFsIHJ1bm5pbmcsIHRoaXMgcnVucyB3aXRoIGhvc3QgCj4gICAgICAg
KiB0aW1lLCBzbyBsZXQncyBrZWVwIGRvaW5nIHRoYXQuICovCj4gKyAgICBpZiAoICFkLT50aW1l
X29mZnNldC5zZXQgKQo+ICsgICAgewo+ICsgICAgICAgIGQtPnRpbWVfb2Zmc2V0LnNlY29uZHMg
PSBzLT5ody5ydGNfb2Zmc2V0Owo+ICsgICAgICAgIHVwZGF0ZV9kb21haW5fd2FsbGNsb2NrX3Rp
bWUoZCk7Cj4gKyAgICB9CgpJdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2hpY2ggb2YgdGhl
IHBvc3NpYmxlIGJlaGF2aW9ycyBpcyB0aGUKYmV0dGVyIG9uZSAtIG92ZXJyaWRpbmcgYSB0b29s
IHN0YWNrIHNldCB2YWx1ZSB3aXRoIHdoYXQgdGhlIHNhdmUKcmVjb3JkIHNheXMsIG9yIChsaWtl
IHlvdSBkbykgdGhlIG90aGVyIHdheSBhcm91bmQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
