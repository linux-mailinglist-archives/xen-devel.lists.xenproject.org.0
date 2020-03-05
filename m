Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B017A153
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 09:30:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9lq8-0000VP-B8; Thu, 05 Mar 2020 08:26:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9lq7-0000VK-7B
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 08:26:43 +0000
X-Inumbo-ID: 0a43f7dc-5ebb-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a43f7dc-5ebb-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 08:26:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AAB68AE39;
 Thu,  5 Mar 2020 08:26:40 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
 <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
Date: Thu, 5 Mar 2020 09:26:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAyMCAwNzowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMy4yMCAx
Nzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjAzLjIwMjAgMTc6MzEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4wMy4yMCAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDQuMDMuMjAyMCAxNjowNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDQu
MDMuMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDIuMjAyMCAxMzo0
NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiArc3RhdGljIHZvaWQgdXBkYXRlX2VwdF9w
YXJhbV9hcHBlbmQoY29uc3QgY2hhciAqc3RyLCBpbnQgdmFsKQo+Pj4+Pj4+ICt7Cj4+Pj4+Pj4g
KyAgICBjaGFyICpwb3MgPSBvcHRfZXB0X3NldHRpbmcgKyBzdHJsZW4ob3B0X2VwdF9zZXR0aW5n
KTsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICBzbnByaW50Zihwb3MsIHNpemVvZihvcHRfZXB0X3Nl
dHRpbmcpIC0gKHBvcyAtIG9wdF9lcHRfc2V0dGluZyksCj4+Pj4+Pj4gKyAgICAgICAgICAgICAi
LCVzPSVkIiwgc3RyLCB2YWwpOwo+Pj4+Pj4+ICt9Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICtzdGF0aWMg
dm9pZCB1cGRhdGVfZXB0X3BhcmFtKHZvaWQpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArICAgIHNucHJp
bnRmKG9wdF9lcHRfc2V0dGluZywgc2l6ZW9mKG9wdF9lcHRfc2V0dGluZyksICJwbWw9JWQiLCBv
cHRfZXB0X3BtbCk7Cj4+Pj4+Pj4gKyAgICBpZiAoIG9wdF9lcHRfYWQgPj0gMCApCj4+Pj4+Pj4g
KyAgICAgICAgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoImFkIiwgb3B0X2VwdF9hZCk7Cj4+Pj4+
Pgo+Pj4+Pj4gVGhpcyB3b24ndCBjb3JyZWN0bHkgcmVmbGVjdCByZWFsaXR5OiBJZiB5b3UgbG9v
ayBhdAo+Pj4+Pj4gdm14X2luaXRfdm1jc19jb25maWcoKSwgZXZlbiBhIG5lZ2F0aXZlIHZhbHVl
IG1lYW5zICJ0cnVlIiBoZXJlLAo+Pj4+Pj4gdW5sZXNzIG9uIGEgc3BlY2lmaWMgQXRvbSBtb2Rl
bC4gSSB0aGluayBpbml0X2VwdF9wYXJhbSgpIHdhbnRzCj4+Pj4+PiB0byBoYXZlIHRoYXQgZXJy
YXR1bSB3b3JrYXJvdW5kIGxvZ2ljIG1vdmVkIHRoZXJlLCBzdWNoIHRoYXQKPj4+Pj4+IHlvdSBj
YW4gdGhlbiBhc3NtZSB0aGUgdmFsdWUgdG8gYmUgbm9uLW5lZ2F0aXZlIGhlcmUuCj4+Pj4+Cj4+
Pj4+IEJ1dCBpc24ndCBub3QgbWVudGlvbmluZyBpdCBpbiB0aGUgLTEgY2FzZSBjb3JyZWN0PyAt
MSBtZWFuczogZG8gdGhlCj4+Pj4+IGNvcnJlY3QgdGhpbmcgb24gdGhlIGN1cnJlbnQgaGFyZHdh
cmUuCj4+Pj4KPj4+PiBXZWxsLCBJIHRoaW5rIHRoZSBvdXRwdXQgaGVyZSBzaG91bGQgcmVwcmVz
ZW50IGVmZmVjdGl2ZSBzZXR0aW5ncywKPj4+Cj4+PiBUaGUgbWluaW11bSByZXF1aXJlbWVudCBp
cyB0byByZWZsZWN0IHRoZSBlZmZlY3RpdmUgcGFyYW1ldGVycywgbGlrZQo+Pj4gY21kbGluZSBp
cyBkb2luZyBmb3IgYm9vdC10aW1lIG9ubHkgcGFyYW1ldGVycy4gV2l0aCBydW50aW1lIHBhcmFt
ZXRlcnMKPj4+IHdlIGhhZCBubyB3YXkgb2YgdGVsbGluZyB3aGF0IHdhcyBzZXQsIGFuZCB0aGlz
IGlzIG5vdyBwb3NzaWJsZS4KPj4+Cj4+Pj4gYW5kIGEgc3ViLWl0ZW0gc2hvdWxkIGJlIHN1cHBy
ZXNzZWQgb25seSBpZiBhIHNldHRpbmcgaGFzIG5vIGVmZmVjdAo+Pj4+IGF0IGFsbCBpbiB0aGUg
Y3VycmVudCBzZXR1cCwgbGlrZSAuLi4KPj4+Pgo+Pj4+Pj4+ICsgICAgaWYgKCBvcHRfZXB0X2V4
ZWNfc3AgPj0gMCApCj4+Pj4+Pj4gKyAgICAgICAgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoImV4
ZWMtc3AiLCBvcHRfZXB0X2V4ZWNfc3ApOwo+Pj4+Pj4KPj4+Pj4+IEkgYWdyZWUgZm9yIHRoaXMg
b25lIC0gaWYgdGhlIHZhbHVlIGlzIHN0aWxsIC0xLCBpdCBoYXMgbmVpdGhlcgo+Pj4+Pj4gYmVl
biBzZXQgbm9yIGlzIGl0cyB2YWx1ZSBvZiBhbnkgaW50ZXJlc3QuCj4+Pj4KPj4+PiAuLi4gaGVy
ZS4KPj4+Cj4+PiBJIHRoaW5rIHdlIHNob3VsZCBub3QgbWl4IHVwIHNwZWNpZmllZCBwYXJhbWV0
ZXJzIGFuZCBlZmZlY3RpdmUKPj4+IHNldHRpbmdzLiBJbiBjYXNlIGFuIGVmZmVjdGl2ZSBzZXR0
aW5nIGlzIG9mIGNvbW1vbiBpbnRlcmVzdCBpdCBzaG91bGQKPj4+IGJlIHJlcG9ydGVkIHZpYSBh
IHNwZWNpZmljIG5vZGUgKGxpa2UgZS5nLiBzcGVjaWZpYyBtaXRpZ2F0aW9uIHNldHRpbmdzCj4+
PiB3aGVyZSB0aGUgY21kbGluZSBpcyBub3QgcHJvdmlkaW5nIGVub3VnaCBkZXRhaWxzKS4KPj4K
Pj4gQnV0IHRoZW4gYSBib29sZWFuIG9wdGlvbiB0aGF0IHdhc24ndCBzcGVjaWZpZWQgb24gdGhl
IGNvbW1hbmQgbGluZQo+PiBzaG91bGQgcHJvZHVjZSBubyBvdXRwdXQgYXQgYWxsLiBBbmQgaGVu
Y2Ugd2UnZCBuZWVkIGEgd2F5IHRvIHRlbGwKPj4gd2hldGhlciBhbiBvcHRpb24gd2FzIHNldCBm
cm9tIGNvbW1hbmQgbGluZSBmb3IgX2FsbF8gb2YgdGhlbS4gSQo+PiBkb24ndCB0aGluayB0aGlz
IHdvdWxkIGJlIHZlcnkgaGVscGZ1bC4KPiAKPiBJIGRpc2FncmVlIGhlcmUuCj4gCj4gVGhpcyBp
cyBpbXBvcnRhbnQgb25seSBmb3IgY2FzZXMgd2hlcmUgdGhlIGh5cGVydmlzb3IgdHJlYXRzIHRo
ZQo+IHBhcmFtZXRlciBhcyBhIHRyaXN0YXRlOiB0cnVlL2ZhbHNlL3Vuc3BlY2lmaWVkLiBJbiBh
bGwgY2FzZXMgd2hlcmUKPiB0aGUgYm9vbCB2YWx1ZSBpcyByZWFsbHkgdHJ1ZSBvciBmYWxzZSBp
dCBjYW4gYmUgcmVwb3J0ZWQgYXMgc3VjaC4KClRoZSBwcm9ibGVtIEknbSBoYXZpbmcgd2l0aCB0
aGlzIGlzIHRoZSByZXN1bHRpbmcgaW5jb25zaXN0ZW5jeToKV2hlbiB3ZSB3cml0ZSB0aGUgdmFy
aWFibGUgd2l0aCAwIG9yIDEgaW4gY2FzZSB3ZSBmaW5kIGl0IHRvIGJlCi0xIGFmdGVyIGNvbW1h
bmQgbGluZSBwYXJzaW5nLCB0aGUgZXh0ZXJuYWxseSB2aXNpYmxlIGVmZmVjdCB3aWxsCmJlIGRp
ZmZlcmVudCBmcm9tIHRoZSBjYXNlIHdoZXJlIHdlIGxlYXZlIGl0IHRvIGJlIC0xIHlldCBzdGls
bAp0cmVhdCBpdCBhcyAocHNldWRvLSlib29sZWFuLiBUaGlzLCBob3dldmVyLCBpcyBhbiBpbXBs
ZW1lbnRhdGlvbgpkZXRhaWwsIHdoaWxlIGltbyB0aGUgaHlwZnMgcHJlc2VudGF0aW9uIHNob3Vs
ZCBub3QgZGVwZW5kIG9uCnN1Y2ggaW1wbGVtZW50YXRpb24gZGV0YWlscy4KCj4gUmVwb3J0aW5n
IDAvMSBmb3IgZS5nLiAiYWQiIGlmIG9wdF9lcHRfYWQ9PS0xIHdvdWxkIGFkZCBhIGxhdGVudCBw
cm9ibGVtCj4gaWYgYW55IG90aGVyIGFjdGlvbiB3b3VsZCBiZSBkZXJpdmVkIGZyb20gdGhlIHBh
cmFtZXRlciB2YXJpYWJsZSBiZWluZwo+IC0xLgo+IAo+IFNvIGVpdGhlciBvcHRfZXB0X2FkIHNo
b3VsZCBiZSBtb2RpZmllZCB0byBjaGFuZ2UgaXQgdG8gMC8xIGluc3RlYWQgb2YKPiBvbmx5IHNl
dHRpbmcgdGhlIFZDTVMgZmxhZywKClRoYXQncyB3aGF0IEkgZGlkIHN1Z2dlc3QuCgo+IG9yIHRo
ZSBsb2dpYyBzaG91bGQgYmUga2VwdCBhcyBpcyBpbiB0aGlzCj4gcGF0Y2guIElNTyBjaGFuZ2lu
ZyB0aGUgc2V0dGluZyBvZiBvcHRfZXB0X2FkIHNob3VsZCBiZSBkb25lIGluIGFub3RoZXIKPiBw
YXRjaCBpZiB0aGlzIGlzIHJlYWxseSB3YW50ZWQuCgpBbmQgb2YgY291cnNlIEkgZG9uJ3QgbWlu
ZCBhdCBhbGwgZG9pbmcgc28gaW4gYSBwcmVyZXEgcGF0Y2guCkl0J3MganVzdCB0aGF0IHRoZSBw
YXRjaCBoZXJlIHByb3ZpZGVzIGEgZ29vZCBwbGFjZSBfd2hlcmVfIHRvCmFjdHVhbGx5IGRvIHN1
Y2ggYW4gYWRqdXN0bWVudC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
