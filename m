Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA009123797
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 21:41:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihJbW-0007Yk-KN; Tue, 17 Dec 2019 20:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihJbU-0007Yd-E9
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 20:38:00 +0000
X-Inumbo-ID: 1caf3148-210d-11ea-8f99-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1caf3148-210d-11ea-8f99-12813bfff9fa;
 Tue, 17 Dec 2019 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576615079;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=guIUVrSq9lFWzDEodBxIjZSOFp//Ui4cmrPQ0PGhmkI=;
 b=Wh3UbQa/sXCjM610UVi6w7TyP8fpTcCklslrqv7XfVMefvy/ZjV4xHzi
 bgeC+s2Zfx3kroyz8+fHCj0ak6xq7AdElL8qLY5/cfPY0nLDny8+II+my
 k94z416UIiEz066P351PhMvH+/EL/dpnRiX0e0Wq33+AUqfQnQV7cDjv4 o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eXNLfaVqivMWBh2TMsyMI+aKn8wM4jn9rgsGQPokllt9AahHOB9sZlXmk6pO8tXwZa9rczYi5C
 /85JKmZXr9rrvHj+qejcvuqa3eb3jmcG2rMy7+NcmnlHr20w6R2AL9WjC3III8nyz5TrhewuWu
 BSKMkElVVvuSc+WETzy9a2YPFKO9trLKCgoPjw0u455HROTdO6gdhRPormu0DDo37CUaAf867k
 GewnKPdQDDnJt889qCfKGS8avslZPtM9bj5ncgah8lYvrhfHXFMXLEcO5Xm09d8P/zlnvsk6V3
 aZg=
X-SBRS: 2.7
X-MesageID: 10201281
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,326,1571716800"; d="scan'208";a="10201281"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-7-andrew.cooper3@citrix.com>
 <20191217123814.GZ11756@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <539ee2de-02df-d61a-6c9b-54e455deaeb0@citrix.com>
Date: Tue, 17 Dec 2019 20:37:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217123814.GZ11756@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 6/6] x86/suspend: Drop
 save_rest_processor_state() completely
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMTIvMjAxOSAxMjozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gQEAgLTQ2LDI1
ICsxNCw5IEBAIHZvaWQgcmVzdG9yZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQo+PiAgICAg
IC8qIFJlc3RvcmUgZnVsbCBDUjQgKGluYyBNQ0UpIG5vdyB0aGF0IHRoZSBJRFQgaXMgaW4gcGxh
Y2UuICovCj4+ICAgICAgd3JpdGVfY3I0KG1tdV9jcjRfZmVhdHVyZXMpOwo+PiAgCj4+IC0gICAg
LyogUmVjb3ZlciBzeXNjYWxsIE1TUnMgKi8KPj4gLSAgICB3cm1zcmwoTVNSX0xTVEFSLCBzYXZl
ZF9sc3Rhcik7Cj4+IC0gICAgd3Jtc3JsKE1TUl9DU1RBUiwgc2F2ZWRfY3N0YXIpOwo+PiAtICAg
IHdybXNybChNU1JfU1RBUiwgWEVOX01TUl9TVEFSKTsKPj4gLSAgICB3cm1zcmwoTVNSX1NZU0NB
TExfTUFTSywgWEVOX1NZU0NBTExfTUFTSyk7Cj4+IC0KPj4gLSAgICB3cmZzYmFzZShzYXZlZF9m
c19iYXNlKTsKPj4gLSAgICB3cmdzYmFzZShzYXZlZF9nc19iYXNlKTsKPj4gLSAgICB3cm1zcmwo
TVNSX1NIQURPV19HU19CQVNFLCBzYXZlZF9rZXJuZWxfZ3NfYmFzZSk7Cj4+IC0KPj4gLSAgICBp
ZiAoIGNwdV9oYXNfc2VwICkKPj4gLSAgICB7Cj4+IC0gICAgICAgIC8qIFJlY292ZXIgc3lzZW50
ZXIgTVNScyAqLwo+PiAtICAgICAgICB3cm1zcmwoTVNSX0lBMzJfU1lTRU5URVJfRVNQLCBzYXZl
ZF9zeXNlbnRlcl9lc3ApOwo+PiAtICAgICAgICB3cm1zcmwoTVNSX0lBMzJfU1lTRU5URVJfRUlQ
LCBzYXZlZF9zeXNlbnRlcl9laXApOwo+PiAtICAgICAgICB3cm1zcihNU1JfSUEzMl9TWVNFTlRF
Ul9DUywgX19IWVBFUlZJU09SX0NTLCAwKTsKPj4gLSAgICB9Cj4+ICsgICAgcGVyY3B1X3RyYXBz
X2luaXQoKTsKPj4gIAo+PiAtICAgIGlmICggY3B1X2hhc194c2F2ZSAmJiAhc2V0X3hjcjAoc2F2
ZWRfeGNyMCkgKQo+PiArICAgIGlmICggY3B1X2hhc194c2F2ZSAmJiAhc2V0X3hjcjAoZ2V0X3hj
cjAoKSkgKQo+PiAgICAgICAgICBCVUcoKTsKPj4gIAo+PiAgICAgIHdybXNybChNU1JfSUEzMl9D
Ul9QQVQsIFhFTl9NU1JfUEFUKTsKPiBHaXZlbiB3aGF0IHRoaXMgZnVuY3Rpb25zIGRvZXMgYWZ0
ZXIgdGhpcyBjaGFuZ2UsIHdvdWxkIGl0IGJlIGZlYXNpYmxlCj4gdG8gcGxhY2Ugc3VjaCBjYWxs
cyBkaXJlY3RseSBpbiBlbnRlcl9zdGF0ZT8KPgo+IEFGQUlDVCB0aGVyZSdzIGFscmVhZHkgc29t
ZSByZXN0b3JpbmcgZG9uZSB0aGVyZSBhbnl3YXkuCgpIbW0gLSB3ZSBhbHJlYWR5IGFwcGVhciB0
byBkb3VibGUgdXAgQ1I0L0VGRVIgcmVzdG9yYXRpb24sIHNvIHRoZXJlIGlzCmNsZWFybHkgbW9y
ZSBjbGVhbnVwIHRvIGRvLsKgIEknbGwgc2VlIGlmIEkgY2FuIG1ha2UKcmVzdG9yZV9yZXN0X3By
b2Nlc3Nvcl9zdGF0ZSgpIGRpc2FwcGVhciBjb21wbGV0ZWx5LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
