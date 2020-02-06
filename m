Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2B15435C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:46:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfZ5-00024o-Lo; Thu, 06 Feb 2020 11:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izfZ3-00024j-Ud
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:43:21 +0000
X-Inumbo-ID: dfc120de-48d5-11ea-af42-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfc120de-48d5-11ea-af42-12813bfff9fa;
 Thu, 06 Feb 2020 11:43:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B815B1BF;
 Thu,  6 Feb 2020 11:43:20 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <20200203105654.22998-4-pdurrant@amazon.com>
 <eb444c22-de88-e0e9-1a99-3cbd412851a0@xen.org>
 <dea18d7c61b240edb9e9dfdf1eacf90d@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8358cbdc-8487-1dce-22c2-9ad008a879d8@suse.com>
Date: Thu, 6 Feb 2020 12:43:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <dea18d7c61b240edb9e9dfdf1eacf90d@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 3/4] mm: make pages allocated with
 MEMF_no_refcount safe to assign
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxMToxMiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPj4gU2VudDogMDYgRmVicnVhcnkgMjAyMCAxMDowNAo+
Pgo+PiBPbiAwMy8wMi8yMDIwIDEwOjU2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiBAQCAtMjMz
MiwxMSArMjM1MCwyMyBAQCBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21oZWFwX3BhZ2VzKAo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVtZmxhZ3MsIGQpKSA9PSBO
VUxMKSkgKQo+Pj4gICAgICAgICAgICByZXR1cm4gTlVMTDsKPj4+Cj4+PiAtICAgIGlmICggZCAm
JiAhKG1lbWZsYWdzICYgTUVNRl9ub19vd25lcikgJiYKPj4+IC0gICAgICAgICBhc3NpZ25fcGFn
ZXMoZCwgcGcsIG9yZGVyLCBtZW1mbGFncykgKQo+Pj4gKyAgICBpZiAoIGQgJiYgIShtZW1mbGFn
cyAmIE1FTUZfbm9fb3duZXIpICkKPj4+ICAgICAgIHsKPj4+IC0gICAgICAgIGZyZWVfaGVhcF9w
YWdlcyhwZywgb3JkZXIsIG1lbWZsYWdzICYgTUVNRl9ub19zY3J1Yik7Cj4+PiAtICAgICAgICBy
ZXR1cm4gTlVMTDsKPj4+ICsgICAgICAgIGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50
ICkKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGk7Cj4+PiAr
Cj4+PiArICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAoMXVsIDw8IG9yZGVyKTsgaSsrICkK
Pj4+ICsgICAgICAgICAgICB7Cj4+PiArICAgICAgICAgICAgICAgIEFTU0VSVCghcGdbaV0uY291
bnRfaW5mbyk7Cj4+PiArICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8gPSBQR0NfZXh0
cmE7Cj4+Cj4+IC4uLiB0aGlzIGlzIHB1cnN1aW5nIHRoZSB3cm9uZ25lc3Mgb2YgdGhlIGNvZGUg
YWJvdmUgYW5kIG5vdCBzYWZlCj4+IGFnYWluc3Qgb2ZmbGluaW5nLgo+Pgo+PiBXZSBjb3VsZCBh
cmd1ZSB0aGlzIGlzIGFuIGFscmVhZHkgZXhpc3RpbmcgYnVnLCBob3dldmVyIEkgYW0gYSBiaXQK
Pj4gdW5lYXNlIHRvIGFkZCBtb3JlIGFidXNlIGluIHRoZSBjb2RlLiBKYW4sIHdoYXQgZG8geW91
IHRoaW5rPwo+Pgo+IAo+IEknZCBjb25zaWRlciBhIHN0cmFpZ2h0Zm9yd2FyZCBwYXRjaC1jbGFz
aC4gSWYgdGhpcyBwYXRjaCBnb2VzIGluCj4gYWZ0ZXIgeW91cnMgdGhlbiBpdCBuZWVkcyB0byBi
ZSBtb2RpZmllZCBhY2NvcmRpbmdseSwgb3IgdmljZSB2ZXJzYS4KCldoaWxlIGdlbmVyYWxseSBJ
IGFkdm9jYXRlIGZvciBub3Qgd2lkZW5pbmcgZXhpc3RpbmcgaXNzdWVzLCBJIGFncmVlCndpdGgg
UGF1bCBoZXJlLiBIaXMgcGF0Y2ggc2hvdWxkIG5vdCBiZSBwZW5hbGl6ZWQgYnkgdXMgX2xhdGVy
XwpoYXZpbmcgZm91bmQgYW4gaXNzdWUgKHdoaWNoIGlzIHF1aXRlIGEgYml0IHdpZGVyKS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
