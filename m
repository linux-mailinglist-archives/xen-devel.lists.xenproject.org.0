Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0FB997A5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 17:05:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0obO-00041v-Tv; Thu, 22 Aug 2019 15:02:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9la=WS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0obN-00041n-7B
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 15:02:13 +0000
X-Inumbo-ID: d1050414-c4ed-11e9-ac23-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d1050414-c4ed-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 15:02:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B36E15A2;
 Thu, 22 Aug 2019 08:02:10 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784A13F706;
 Thu, 22 Aug 2019 08:02:08 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <680c5b24-b3fd-97b6-c048-49a2bdba4a3d@arm.com>
 <BEEC1E7D-4A4D-406E-97C3-D5433BAE8CAF@amazon.com>
 <5526b464-24a6-6aca-a9f3-095492abecdd@arm.com>
 <485AB113-81CD-4700-8A29-F2939F125EA6@amazon.com>
 <24f7f2f0-13f3-58e1-0891-921b5048d939@arm.com>
 <16A9D28C-8F6C-4358-85C9-98BB7BB5C90E@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2b60e660-dbc4-7629-5fc3-f84abcd26c17@arm.com>
Date: Thu, 22 Aug 2019 16:02:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <16A9D28C-8F6C-4358-85C9-98BB7BB5C90E@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMi8wOC8yMDE5IDEyOjE1LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4+
IE9uIDIyLiBBdWcgMjAxOSwgYXQgMTI6NDMsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20gCj4+IDxtYWlsdG86anVsaWVuLmdyYWxsQGFybS5jb20+PiB3cm90ZToKPj4gT24gMjIv
MDgvMjAxOSAxMToyMCwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+Pj4+IENyb3NzLWNv
bXBpbGVyIGFyZSBub3dhZGF5cyB3aWRlbHkgYXZhaWxhYmxlLiBTbyBidWlsZCB0ZXN0aW5nIHlv
dXIgY2hhbmdlcyAKPj4+PiBpbiBjb21tb24gY29kZSB3b3VsZCBiZSB0aGUgbWluaW11bS4KPj4+
Pgo+Pj4gSSB3aXNoIGl0IHdhcyB0aGF0IHNpbXBsZS4gTmV2ZXJ0aGVsZXNzLCBJIHdpbGwgdHJ5
IHRvIHByZXBhcmUgYW4gZW52aXJvbm1lbnQgCj4+PiB0byBwZXJmb3JtIHN1Y2ggYnVpbGRzLgo+
Pgo+PiBDcm9zcy1jb21waWxpbmcgdGhlIGh5cGVydmlzb3IgaXMgcmVhbGx5IGVhc3kgOykuCj4+
Cj4+IDEpIERvd25sb2FkIHRoZSBjcm9zcy1jb21waWxlciB0YXJiYWxsIChoZXJlIG9uZSBbMV0p
IGFuZCB1bmNvbXByZXNzIGl0LiBZb3UgCj4+IGNhbiBhbHNvIGluc3RhbGwgdGhlIG9uZSBwcm92
aWRlZCBieSB5b3VyIGRpc3Ryby4KPj4KPj4gMikgQnVpbGQgWGVuIGh5cGVydmlzb3IuIEhlcmUg
YW4gZXhhbXBsZSBmb3IgYXJtNjQ6Cj4+Cj4+IDQyc2g+IGNkIHhlbi5naXQveGVuCj4+IDQyc2g+
IG1ha2UgWEVOX1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NPTVBJTEVSPTx0cmlwbGV0Pi0KPj4K
Pj4gSW4gbXkgY2FzZSwgSSBhbSB1c2luZyB0aGUgQXJtIHRvb2xjaGFpbiBBQXJjaDY0IEdOVS9M
aW51eCB0YXJnZXQgCj4+IChhYXJjaDY0LWxpbnV4LWdudSkuIFNvIHRoZSA8dHJpcGxldD4gd291
bGQgYmUgYWFyY2g2NC1saW51eC1nbnUuCj4+Cj4+IFRoaXMgaXMgYXNzdW1pbmcgeW91IGhhdmUg
dGhlIGNvbXBpbGVycyBiaW5hcnkgaW4geW91ciBQQVRILiBJZiBub3QsIHlvdSBjYW4gCj4+IHVz
ZSBnaXZlIHRoZSBmdWxsIHBhdGg6Cj4+Cj4+IENST1NTX0NPTVBJTEVSPS9vcHQvZ2NjLWFybS04
LjMtMjAxOS4wMy14ODZfNjQtYWFyY2g2NC1saW51eC1nbnUvYmluL2FhcmNoNjQtbGludXgtZ251
LQo+IAo+IEF3ZXNvbWUhIFRoYXQgcmVhbGx5IHdvcmtzIChlc3BlY2lhbGx5IHRoYW5rcyBmb3Ig
dGhlIFsxXSBsaW5r4oCmIGZpbmFsbHkgc29tZSAKPiB0b29sc3RhY2sgdGhhdCB3b3JrcyBvbiBt
eSBzeXN0ZW0pLgo+IAo+IE9uZSBjaGFuZ2Ugd2FzIG5lZWRlZDogcy9DUk9TU19DT01QSUxFUi9D
Uk9TU19DT01QSUxFL2cKCk9oIHllcywgc29ycnkgZm9yIHRoYXQuIEkgZGlkbid0IGNvcHkvcGFz
dGUgZm9yIG9uY2UuCgo+IAo+IFRoYW5rcyEKPiAKPiBIYXZpbmcgdGhpcyBpbiBhIHdpa2kgd291
bGQgcmVhbGx5IGhlbHAuIE9yIGhhdmUgSSBtaXNzZWQgaXQ/CgpUaGlzIGlzIGV4cGxhaW5lZCBv
biB0aGUgWGVuIG9uIEFybSB3aWtpIHBhZ2UgWzJdLiBCdXQgSSBoYXZlIHRvIGFkbWl0IHRoZSBw
YWdlIAppcyBkaWZmaWN1bHQgdG8gZ28gdGhyb3VnaC4gSSBuZWVkIHRvIGZpbmQgc29tZSB0aW1l
IHRvIHJld29yayBpdC4KCkNoZWVycywKCj4+IFsxXSAKPj4gaHR0cHM6Ly9kZXZlbG9wZXIuYXJt
LmNvbS90b29scy1hbmQtc29mdHdhcmUvb3Blbi1zb3VyY2Utc29mdHdhcmUvZGV2ZWxvcGVyLXRv
b2xzL2dudS10b29sY2hhaW4vZ251LWEvZG93bmxvYWRzCgpbMl0gCmh0dHBzOi8vd2lraS54ZW5w
cm9qZWN0Lm9yZy93aWtpL1hlbl9BUk1fd2l0aF9WaXJ0dWFsaXphdGlvbl9FeHRlbnNpb25zI0Ny
b3NzX0NvbXBpbGluZwoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
