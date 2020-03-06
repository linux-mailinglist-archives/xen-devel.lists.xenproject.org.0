Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA30617B929
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9BR-0003fF-8m; Fri, 06 Mar 2020 09:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA9BP-0003f0-IB
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:22:15 +0000
X-Inumbo-ID: f7523ec8-5f8b-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7523ec8-5f8b-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 09:22:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8346ADE8;
 Fri,  6 Mar 2020 09:22:13 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
 <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
 <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
 <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
 <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
 <0b6e7f36-786c-f788-0c13-7e0ed41d77df@suse.com>
 <ca0ee3e7-bd09-bdeb-da6a-f4acaa96f27a@suse.com>
 <01015fd9-61bf-99a9-8e83-a87ddf4ed6b4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <699d89f4-c18d-c49a-ed6f-deeaf9fe8caf@suse.com>
Date: Fri, 6 Mar 2020 10:22:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <01015fd9-61bf-99a9-8e83-a87ddf4ed6b4@suse.com>
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

T24gMDYuMDMuMjAyMCAxMDoyMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNi4wMy4yMCAx
MDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA2LjAzLjIwMjAgMDk6NDcsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNi4wMy4yMCAwOToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDYuMDMuMjAyMCAwNzo0MiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDUu
MDMuMjAgMDk6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDUuMDMuMjAyMCAwNzow
MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+PiBPbiAwNC4wMy4yMCAxNzo1NiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA0LjAzLjIwMjAgMTc6MzEsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4+Pj4+Pj4+PiBPbiAwNC4wMy4yMCAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+Pj4+Pj4gT24gMDQuMDMuMjAyMCAxNjowNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+
Pj4+Pj4gT24gMDQuMDMuMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4g
T24gMjYuMDIuMjAyMCAxMzo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4+Pj4+PiAr
c3RhdGljIHZvaWQgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoY29uc3QgY2hhciAqc3RyLCBpbnQg
dmFsKQo+Pj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+Pj4gKyAgICBjaGFyICpwb3MgPSBvcHRf
ZXB0X3NldHRpbmcgKyBzdHJsZW4ob3B0X2VwdF9zZXR0aW5nKTsKPj4+Pj4+Pj4+Pj4+PiArCj4+
Pj4+Pj4+Pj4+Pj4gKyAgICBzbnByaW50Zihwb3MsIHNpemVvZihvcHRfZXB0X3NldHRpbmcpIC0g
KHBvcyAtIG9wdF9lcHRfc2V0dGluZyksCj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAiLCVz
PSVkIiwgc3RyLCB2YWwpOwo+Pj4+Pj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+
Pj4+Pj4+ICtzdGF0aWMgdm9pZCB1cGRhdGVfZXB0X3BhcmFtKHZvaWQpCj4+Pj4+Pj4+Pj4+Pj4g
K3sKPj4+Pj4+Pj4+Pj4+PiArICAgIHNucHJpbnRmKG9wdF9lcHRfc2V0dGluZywgc2l6ZW9mKG9w
dF9lcHRfc2V0dGluZyksICJwbWw9JWQiLCBvcHRfZXB0X3BtbCk7Cj4+Pj4+Pj4+Pj4+Pj4gKyAg
ICBpZiAoIG9wdF9lcHRfYWQgPj0gMCApCj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgdXBkYXRlX2Vw
dF9wYXJhbV9hcHBlbmQoImFkIiwgb3B0X2VwdF9hZCk7Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4gVGhpcyB3b24ndCBjb3JyZWN0bHkgcmVmbGVjdCByZWFsaXR5OiBJZiB5b3UgbG9vayBhdAo+
Pj4+Pj4+Pj4+Pj4gdm14X2luaXRfdm1jc19jb25maWcoKSwgZXZlbiBhIG5lZ2F0aXZlIHZhbHVl
IG1lYW5zICJ0cnVlIiBoZXJlLAo+Pj4+Pj4+Pj4+Pj4gdW5sZXNzIG9uIGEgc3BlY2lmaWMgQXRv
bSBtb2RlbC4gSSB0aGluayBpbml0X2VwdF9wYXJhbSgpIHdhbnRzCj4+Pj4+Pj4+Pj4+PiB0byBo
YXZlIHRoYXQgZXJyYXR1bSB3b3JrYXJvdW5kIGxvZ2ljIG1vdmVkIHRoZXJlLCBzdWNoIHRoYXQK
Pj4+Pj4+Pj4+Pj4+IHlvdSBjYW4gdGhlbiBhc3NtZSB0aGUgdmFsdWUgdG8gYmUgbm9uLW5lZ2F0
aXZlIGhlcmUuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEJ1dCBpc24ndCBub3QgbWVudGlvbmlu
ZyBpdCBpbiB0aGUgLTEgY2FzZSBjb3JyZWN0PyAtMSBtZWFuczogZG8gdGhlCj4+Pj4+Pj4+Pj4+
IGNvcnJlY3QgdGhpbmcgb24gdGhlIGN1cnJlbnQgaGFyZHdhcmUuCj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBXZWxsLCBJIHRoaW5rIHRoZSBvdXRwdXQgaGVyZSBzaG91bGQgcmVwcmVzZW50IGVmZmVj
dGl2ZSBzZXR0aW5ncywKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGUgbWluaW11bSByZXF1aXJlbWVu
dCBpcyB0byByZWZsZWN0IHRoZSBlZmZlY3RpdmUgcGFyYW1ldGVycywgbGlrZQo+Pj4+Pj4+Pj4g
Y21kbGluZSBpcyBkb2luZyBmb3IgYm9vdC10aW1lIG9ubHkgcGFyYW1ldGVycy4gV2l0aCBydW50
aW1lIHBhcmFtZXRlcnMKPj4+Pj4+Pj4+IHdlIGhhZCBubyB3YXkgb2YgdGVsbGluZyB3aGF0IHdh
cyBzZXQsIGFuZCB0aGlzIGlzIG5vdyBwb3NzaWJsZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gYW5k
IGEgc3ViLWl0ZW0gc2hvdWxkIGJlIHN1cHByZXNzZWQgb25seSBpZiBhIHNldHRpbmcgaGFzIG5v
IGVmZmVjdAo+Pj4+Pj4+Pj4+IGF0IGFsbCBpbiB0aGUgY3VycmVudCBzZXR1cCwgbGlrZSAuLi4K
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+ICsgICAgaWYgKCBvcHRfZXB0X2V4ZWNfc3AgPj0gMCAp
Cj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoImV4ZWMtc3Ai
LCBvcHRfZXB0X2V4ZWNfc3ApOwo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEkgYWdyZWUgZm9y
IHRoaXMgb25lIC0gaWYgdGhlIHZhbHVlIGlzIHN0aWxsIC0xLCBpdCBoYXMgbmVpdGhlcgo+Pj4+
Pj4+Pj4+Pj4gYmVlbiBzZXQgbm9yIGlzIGl0cyB2YWx1ZSBvZiBhbnkgaW50ZXJlc3QuCj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+PiAuLi4gaGVyZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJIHRoaW5rIHdl
IHNob3VsZCBub3QgbWl4IHVwIHNwZWNpZmllZCBwYXJhbWV0ZXJzIGFuZCBlZmZlY3RpdmUKPj4+
Pj4+Pj4+IHNldHRpbmdzLiBJbiBjYXNlIGFuIGVmZmVjdGl2ZSBzZXR0aW5nIGlzIG9mIGNvbW1v
biBpbnRlcmVzdCBpdCBzaG91bGQKPj4+Pj4+Pj4+IGJlIHJlcG9ydGVkIHZpYSBhIHNwZWNpZmlj
IG5vZGUgKGxpa2UgZS5nLiBzcGVjaWZpYyBtaXRpZ2F0aW9uIHNldHRpbmdzCj4+Pj4+Pj4+PiB3
aGVyZSB0aGUgY21kbGluZSBpcyBub3QgcHJvdmlkaW5nIGVub3VnaCBkZXRhaWxzKS4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gQnV0IHRoZW4gYSBib29sZWFuIG9wdGlvbiB0aGF0IHdhc24ndCBzcGVjaWZp
ZWQgb24gdGhlIGNvbW1hbmQgbGluZQo+Pj4+Pj4+PiBzaG91bGQgcHJvZHVjZSBubyBvdXRwdXQg
YXQgYWxsLiBBbmQgaGVuY2Ugd2UnZCBuZWVkIGEgd2F5IHRvIHRlbGwKPj4+Pj4+Pj4gd2hldGhl
ciBhbiBvcHRpb24gd2FzIHNldCBmcm9tIGNvbW1hbmQgbGluZSBmb3IgX2FsbF8gb2YgdGhlbS4g
SQo+Pj4+Pj4+PiBkb24ndCB0aGluayB0aGlzIHdvdWxkIGJlIHZlcnkgaGVscGZ1bC4KPj4+Pj4+
Pgo+Pj4+Pj4+IEkgZGlzYWdyZWUgaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgaXMgaW1wb3J0
YW50IG9ubHkgZm9yIGNhc2VzIHdoZXJlIHRoZSBoeXBlcnZpc29yIHRyZWF0cyB0aGUKPj4+Pj4+
PiBwYXJhbWV0ZXIgYXMgYSB0cmlzdGF0ZTogdHJ1ZS9mYWxzZS91bnNwZWNpZmllZC4gSW4gYWxs
IGNhc2VzIHdoZXJlCj4+Pj4+Pj4gdGhlIGJvb2wgdmFsdWUgaXMgcmVhbGx5IHRydWUgb3IgZmFs
c2UgaXQgY2FuIGJlIHJlcG9ydGVkIGFzIHN1Y2guCj4+Pj4+Pgo+Pj4+Pj4gVGhlIHByb2JsZW0g
SSdtIGhhdmluZyB3aXRoIHRoaXMgaXMgdGhlIHJlc3VsdGluZyBpbmNvbnNpc3RlbmN5Ogo+Pj4+
Pj4gV2hlbiB3ZSB3cml0ZSB0aGUgdmFyaWFibGUgd2l0aCAwIG9yIDEgaW4gY2FzZSB3ZSBmaW5k
IGl0IHRvIGJlCj4+Pj4+PiAtMSBhZnRlciBjb21tYW5kIGxpbmUgcGFyc2luZywgdGhlIGV4dGVy
bmFsbHkgdmlzaWJsZSBlZmZlY3Qgd2lsbAo+Pj4+Pj4gYmUgZGlmZmVyZW50IGZyb20gdGhlIGNh
c2Ugd2hlcmUgd2UgbGVhdmUgaXQgdG8gYmUgLTEgeWV0IHN0aWxsCj4+Pj4+PiB0cmVhdCBpdCBh
cyAocHNldWRvLSlib29sZWFuLiBUaGlzLCBob3dldmVyLCBpcyBhbiBpbXBsZW1lbnRhdGlvbgo+
Pj4+Pj4gZGV0YWlsLCB3aGlsZSBpbW8gdGhlIGh5cGZzIHByZXNlbnRhdGlvbiBzaG91bGQgbm90
IGRlcGVuZCBvbgo+Pj4+Pj4gc3VjaCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzLgo+Pj4+Pj4KPj4+
Pj4+PiBSZXBvcnRpbmcgMC8xIGZvciBlLmcuICJhZCIgaWYgb3B0X2VwdF9hZD09LTEgd291bGQg
YWRkIGEgbGF0ZW50IHByb2JsZW0KPj4+Pj4+PiBpZiBhbnkgb3RoZXIgYWN0aW9uIHdvdWxkIGJl
IGRlcml2ZWQgZnJvbSB0aGUgcGFyYW1ldGVyIHZhcmlhYmxlIGJlaW5nCj4+Pj4+Pj4gLTEuCj4+
Pj4+Pj4KPj4+Pj4+PiBTbyBlaXRoZXIgb3B0X2VwdF9hZCBzaG91bGQgYmUgbW9kaWZpZWQgdG8g
Y2hhbmdlIGl0IHRvIDAvMSBpbnN0ZWFkIG9mCj4+Pj4+Pj4gb25seSBzZXR0aW5nIHRoZSBWQ01T
IGZsYWcsCj4+Pj4+Pgo+Pj4+Pj4gVGhhdCdzIHdoYXQgSSBkaWQgc3VnZ2VzdC4KPj4+Pj4+Cj4+
Pj4+Pj4gb3IgdGhlIGxvZ2ljIHNob3VsZCBiZSBrZXB0IGFzIGlzIGluIHRoaXMKPj4+Pj4+PiBw
YXRjaC4gSU1PIGNoYW5naW5nIHRoZSBzZXR0aW5nIG9mIG9wdF9lcHRfYWQgc2hvdWxkIGJlIGRv
bmUgaW4gYW5vdGhlcgo+Pj4+Pj4+IHBhdGNoIGlmIHRoaXMgaXMgcmVhbGx5IHdhbnRlZC4KPj4+
Pj4+Cj4+Pj4+PiBBbmQgb2YgY291cnNlIEkgZG9uJ3QgbWluZCBhdCBhbGwgZG9pbmcgc28gaW4g
YSBwcmVyZXEgcGF0Y2guCj4+Pj4+PiBJdCdzIGp1c3QgdGhhdCB0aGUgcGF0Y2ggaGVyZSBwcm92
aWRlcyBhIGdvb2QgcGxhY2UgX3doZXJlXyB0bwo+Pj4+Pj4gYWN0dWFsbHkgZG8gc3VjaCBhbiBh
ZGp1c3RtZW50Lgo+Pj4+Pgo+Pj4+PiBJIHdhcyB0aGlua2luZyBvZiBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+Pj4+Pgo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMKPj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCj4+Pj4+IEBAIC0zMTMsMTIgKzMxMywx
MiBAQCBzdGF0aWMgaW50IHZteF9pbml0X3ZtY3NfY29uZmlnKHZvaWQpCj4+Pj4+ICAgICAgICAg
ewo+Pj4+PiAgICAgICAgICAgICByZG1zcmwoTVNSX0lBMzJfVk1YX0VQVF9WUElEX0NBUCwgX3Zt
eF9lcHRfdnBpZF9jYXApOwo+Pj4+Pgo+Pj4+PiArICAgICAgICBpZiAoIC8qIFdvcmsgYXJvdW5k
IEVycmF0dW0gQVZSNDEgb24gQXZvdG9uIHByb2Nlc3NvcnMuICovCj4+Pj4+ICsgICAgICAgICAg
ICAgYm9vdF9jcHVfZGF0YS54ODYgPT0gNiAmJiBib290X2NwdV9kYXRhLng4Nl9tb2RlbCA9PSAw
eDRkICYmCj4+Pj4+ICsgICAgICAgICAgICAgb3B0X2VwdF9hZCA8IDAgKQo+Pj4+PiArICAgICAg
ICAgICAgb3B0X2VwdF9hZCA9IDA7Cj4+Pj4+ICAgICAgICAgICAgIGlmICggIW9wdF9lcHRfYWQg
KQo+Pj4+PiAgICAgICAgICAgICAgICAgX3ZteF9lcHRfdnBpZF9jYXAgJj0gflZNWF9FUFRfQURf
QklUOwo+Pj4+PiAtICAgICAgICBlbHNlIGlmICggLyogV29yayBhcm91bmQgRXJyYXR1bSBBVlI0
MSBvbiBBdm90b24gcHJvY2Vzc29ycy4gKi8KPj4+Pj4gLSAgICAgICAgICAgICAgICAgIGJvb3Rf
Y3B1X2RhdGEueDg2ID09IDYgJiYgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgPT0gMHg0ZCAmJgo+
Pj4+PiAtICAgICAgICAgICAgICAgICAgb3B0X2VwdF9hZCA8IDAgKQo+Pj4+PiAtICAgICAgICAg
ICAgX3ZteF9lcHRfdnBpZF9jYXAgJj0gflZNWF9FUFRfQURfQklUOwo+Pj4+Pgo+Pj4+PiAgICAg
ICAgICAgICAvKgo+Pj4+PiAgICAgICAgICAgICAgKiBBZGRpdGlvbmFsIHNhbml0eSBjaGVja2lu
ZyBiZWZvcmUgdXNpbmcgRVBUOgo+Pj4+Cj4+Pj4gQW5kIEkgd2FzIHNwZWNpZmljYWxseSBob3Bp
bmcgdG8gYXZvaWQgZG9pbmcgdGhpcyBpbiBhIG5vbi1fX2luaXQKPj4+PiBmdW5jdGlvbi4KPj4+
Cj4+PiBTaG91bGQgYmUgZmFpcmx5IGVhc3kgKHNlZSBhdHRhY2hlZCBwYXRjaCkuCj4+Cj4+IFdo
eSBub3QgcHV0IHRoZSBvcHRfZXB0X2FkIGFkanVzdG1lbnQgcmlnaHQgaW50byBzdGFydF92bXgo
KSwKPj4ganVzdCBsaWtlIGUuZy4gdGhlIG9wdF9lcHRfZXhlY19zcCBnZXRzIGFsc28gZG9uZSB0
aGVyZT8gUHVsbGluZwo+PiB0aGUgc2V0dGluZyB1cCBvZiB0aGUgJ3YnIGtleSBoYW5kbGVyIHJp
c2tzIGluc3RhbGxpbmcgaXQgYWhlYWQKPj4gb2YgYSBwb3RlbnRpYWwgZnV0dXJlIGxhdGVyIGVy
cm9yIGV4aXQgZnJvbSBzdGFydF92bXgoKS4gQnV0IEknbQo+IAo+IElzIHRoaXMgcmVhbGx5IHBy
b2JsZW1hdGljPwoKTm90IF9yZWFsbHlfLCBidXQgc3RpbGwuIEluIHBhcnRpY3VsYXIgSSdkIHBy
ZWZlciB0aGUgJ3YnIGtleSB0bwpub3QgZXZlbiBiZSBsaXN0ZWQgYW1vbmcgJ2gnIGtleSBvdXRw
dXQgaW4gc3VjaCBhIGNhc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
