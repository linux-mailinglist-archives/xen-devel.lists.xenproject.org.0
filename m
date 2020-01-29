Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF514C986
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:23:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlOq-0001wJ-PI; Wed, 29 Jan 2020 11:20:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwlOp-0001wE-CB
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:20:47 +0000
X-Inumbo-ID: 65077192-4289-11ea-888b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65077192-4289-11ea-888b-12813bfff9fa;
 Wed, 29 Jan 2020 11:20:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C690AF0D;
 Wed, 29 Jan 2020 11:20:45 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200129101643.1394-1-pdurrant@amazon.com>
 <20200129101643.1394-4-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d14de66-f626-9340-09d8-5f7ffe8644f3@suse.com>
Date: Wed, 29 Jan 2020 12:20:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129101643.1394-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/4] mm: make MEMF_no_refcount pages safe
 to assign
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

T24gMjkuMDEuMjAyMCAxMToxNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBAQCAtMjI4
NywxMSArMjI4NywxNCBAQCBpbnQgYXNzaWduX3BhZ2VzKAo+ICAKPiAgICAgIGZvciAoIGkgPSAw
OyBpIDwgKDEgPDwgb3JkZXIpOyBpKysgKQo+ICAgICAgewo+ICsgICAgICAgIHVuc2lnbmVkIGxv
bmcgY291bnRfaW5mbyA9IHBnW2ldLmNvdW50X2luZm87Cj4gKwo+ICAgICAgICAgIEFTU0VSVChw
YWdlX2dldF9vd25lcigmcGdbaV0pID09IE5VTEwpOwo+IC0gICAgICAgIEFTU0VSVCghcGdbaV0u
Y291bnRfaW5mbyk7Cj4gKyAgICAgICAgQVNTRVJUKCEoY291bnRfaW5mbyAmIH5QR0Nfbm9fcmVm
Y291bnQpKTsKCkkgdGhpbmsgdGhpcyB3b3VsZCBiZW5lZml0IGZyb20gYmVpbmcgbW9yZSBzdHJp
Y3Q6IFRoZSBmbGFnIG1heSBhbHNvCm5vdCBiZSBzZXQgaWYgTUVNRl9ub19yZWZjb3VudCBpcyBj
bGVhciBpbiB0aGUgZmxhZ3MgcGFzc2VkIGluLgoKPiBAQCAtMjMzNCwxMSArMjMzMiwyMCBAQCBz
dHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21oZWFwX3BhZ2VzKAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbWVtZmxhZ3MsIGQpKSA9PSBOVUxMKSkgKQo+ICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPiAgCj4gLSAgICBpZiAoIGQgJiYgIShtZW1mbGFncyAmIE1FTUZfbm9fb3du
ZXIpICYmCj4gLSAgICAgICAgIGFzc2lnbl9wYWdlcyhkLCBwZywgb3JkZXIsIG1lbWZsYWdzKSAp
Cj4gKyAgICBpZiAoIGQgJiYgIShtZW1mbGFncyAmIE1FTUZfbm9fb3duZXIpICkKPiAgICAgIHsK
PiAtICAgICAgICBmcmVlX2hlYXBfcGFnZXMocGcsIG9yZGVyLCBtZW1mbGFncyAmIE1FTUZfbm9f
c2NydWIpOwo+IC0gICAgICAgIHJldHVybiBOVUxMOwo+ICsgICAgICAgIGlmICggbWVtZmxhZ3Mg
JiBNRU1GX25vX3JlZmNvdW50ICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgaTsKCldpdGggdGhpcyB5b3UgbWVhbiAuLi4KCj4gKyAgICAgICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgKDEgPDwgb3JkZXIpOyBpKysgKQoKLi4uIDFVTCBoZXJlLiBPciBlbHNlICJ1bnNp
Z25lZCBpbnQiIGFuZCAxVS4gVGhlIGZpbGUgaXNuJ3QKdmVyeSBjb25zaXN0ZW50IHdpdGggdGhp
cywgYnV0IGF0IGxlYXN0IGxvY2FsbHkgdG8gYSBzaW5nbGUKZnVuY3Rpb25zIHRoaW5ncyBzaG91
bGQgbWF0Y2ggdXAuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
