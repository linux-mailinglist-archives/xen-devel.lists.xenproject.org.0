Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C0186C14
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 14:31:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDpnY-0001Zm-A8; Mon, 16 Mar 2020 13:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JvoA=5B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jDpnW-0001Yi-U3
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 13:28:50 +0000
X-Inumbo-ID: 12288940-678a-11ea-b831-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12288940-678a-11ea-b831-12813bfff9fa;
 Mon, 16 Mar 2020 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584365330;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YaLJur73ptq8osD3vqx4/kjgawAVfQ/FV8LkNxNShOQ=;
 b=HVqUbPDSF+t/3iMkKCt3u/cvRLDNy/WnmzQv53vpZyD/Cuo7Y5ygAI2O
 Eqy9vW1gHhKiudZE/wkUnjfaO5G6x7hHZgka1bfFOnhOaaphebHCxHY0H
 L/mtNkoERjLNHOHnfEfynwFoDlLUkAYpwUg9FomT2JgPmjB82tcRC44pJ o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oz/FLczGmV4yJkkRyBOaOxBv7OYQq2573Lhojzv9OYBMgb6DL1mBjOjqaLbcwoUhnRA3sAoSGi
 GWkhvVnMdG4WeF2bWEEy5iecVoC2PUPde/3Fkxkx7o8eZKj/NQPT9bEaVU4ffNmycODCv4MwPL
 DYgXhBgbqDxWgq7HQSkc1VU3AOhOkAqM67PKOCzGUlTx0UXLCY7bveyXdalgX4jIsO8bVg8GHM
 H+VnQNDBDkpvmktnrS9kyCAo6OGBDgxMlqUbgaxXvi3+WAXHOfgS5GnTG7PYbJTyNunBdHTgX7
 TiQ=
X-SBRS: 2.7
X-MesageID: 14222052
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,560,1574139600"; d="scan'208";a="14222052"
To: Jan Beulich <jbeulich@suse.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <8221cc7f-ad33-03da-5780-8a76fbdc404a@suse.com>
 <f10b1b9f-eeb1-11e9-0f64-b0557f6ac2f8@citrix.com>
 <587987a7-5e28-36d7-ac15-b309b1964229@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e89e2579-5e4f-2892-169b-294c0439edd0@citrix.com>
Date: Mon, 16 Mar 2020 13:28:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <587987a7-5e28-36d7-ac15-b309b1964229@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/APIC: reduce rounding errors in
 calculations
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDMvMjAyMCAwOTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMDMuMjAyMCAx
Njo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTMvMDMvMjAyMCAwOToyNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCj4+PiArKysgYi94ZW4v
YXJjaC94ODYvYXBpYy5jCj4+PiBAQCAtMTI0OSwxNyArMTI0OSwxNiBAQCBzdGF0aWMgaW50IF9f
aW5pdCBjYWxpYnJhdGVfQVBJQ19jbG9jayh2Cj4+PiAgICAgIHR0MiA9IGFwaWNfcmVhZChBUElD
X1RNQ0NUKTsKPj4+ICAgICAgdDIgPSByZHRzY19vcmRlcmVkKCk7Cj4+PiAgCj4+PiAtICAgIHJl
c3VsdCA9ICh0dDEtdHQyKSpBUElDX0RJVklTT1IvTE9PUFM7Cj4+PiArICAgIGJ1c19mcmVxID0g
KHR0MSAtIHR0MikgKiBBUElDX0RJVklTT1IgKiBMT09QU19GUkFDOwo+Pj4gIAo+Pj4gLSAgICBh
cGljX3ByaW50ayhBUElDX1ZFUkJPU0UsICIuLi4uLiBDUFUgY2xvY2sgc3BlZWQgaXMgJWxkLiUw
NGxkIE1Iei5cbiIsCj4+PiAtICAgICAgICAgICAgICAgICgobG9uZykodDIgLSB0MSkgLyBMT09Q
UykgLyAoMTAwMDAwMCAvIEhaKSwKPj4+IC0gICAgICAgICAgICAgICAgKChsb25nKSh0MiAtIHQx
KSAvIExPT1BTKSAlICgxMDAwMDAwIC8gSFopKTsKPj4+ICsgICAgYXBpY19wcmludGsoQVBJQ19W
RVJCT1NFLCAiLi4uLi4gQ1BVIGNsb2NrIHNwZWVkIGlzICVsdS4lMDRsdSBNSHouXG4iLAo+Pj4g
KyAgICAgICAgICAgICAgICAoKHVuc2lnbmVkIGxvbmcpKHQyIC0gdDEpICogTE9PUFNfRlJBQykg
LyAxMDAwMDAwLAo+Pj4gKyAgICAgICAgICAgICAgICAoKHVuc2lnbmVkIGxvbmcpKHQyIC0gdDEp
ICogTE9PUFNfRlJBQyAvIDEwMCkgJSAxMDAwMCk7Cj4+Cj4+IElmIEknbSBub3QgbWlzdGFrZW4s
IHRoaXMgZXhwcmVzc2lvbiBvbmx5IHdvcmtzIGJlY2F1c2Ugb2YgdGhlIEwtPlIKPj4gYXNzb2Np
YXRpdml0eSAoZ2l2ZW4gdGhlIHNhbWUgcHJlY2VkZW5jZSBvZiAqIGFuZCAvKSBncm91cGluZyBp
dCBhcwo+PiAoKHQyLXQxKSAqIDEwKcKgIC8gMTAwIGFzIG9wcG9zZWQgdG8gKHQyLXQxKSAqICgx
MCAvIDEwMCksIHdoZXJlIHRoZQo+PiBsYXR0ZXIgd291bGQgdHJ1bmNhdGUgdG8gMC7CoCBJIHRo
aW5rIHNvbWUgZXh0cmEgYnJhY2tldHMgd291bGQgaGVscCBmb3IKPj4gY2xhcml0eS4KPiAKPiBX
ZWxsLCB5ZXMsIGRvbmUuIFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBoYXZlIGJlZW4gdG8gZHJvcCBt
b3JlIG9mCj4gdGhlbS4KPiAKPj4gVGhhdCBzYWlkLCB3aGF0IGlzIHdyb25nIHdpdGgga2VlcGlu
ZyB0aGUgb3JpZ2luYWwgZm9ybT8KPiAKPiBUaGUgc2FtZSBhcyBlbHNld2hlcmUgaW4gdGhpcyBw
YXRjaCwgYW5kIGFzIHNhaWQgaW4gdGhlIGRlc2NyaXB0aW9uIC0KPiB0aGVyZSdzIGJlZW4gcG9p
bnRsZXNzIHJvdW5kaW5nIChyZWFsbHk6IHRydW5jYXRpb24pIGVycm9ycyBoZXJlIGZyb20KPiBm
aXJzdCBkaXZpZGluZyBieSBIWiAodG8gYmUgcHJlY2lzZTogYnkgSFovMTApIGFuZCB0aGVuIGVm
ZmVjdGl2ZWx5Cj4gbXVsdGlwbHlpbmcgYnkgdGhpcyB2YWx1ZSBhZ2Fpbi4gVGhlIG9yaWdpbmFs
IGRpdmlzaW9uLW9ubHkgYXJndW1lbnQKPiB3b3VsZCBub3QgYmUgYWZmZWN0ZWQgYWZhaWN0LCBi
dXQgdGhlIHJlbWFpbmRlciBvbmUgd291bGQuIEZ1cnRoZXJtb3JlCj4gSSdkIGxpa2UgdG8gYXZv
aWQgaGF2aW5nIHRvIHJldGFpbiB0aGUgTE9PUFMgY29uc3RhbnQuCj4gCj4+IMKgIEkgcmVhbGlz
ZSB0aGlzCj4+IGlzIG9ubHkgZm9yIGEgcHJpbnRrKCksIGJ1dCB0aGUgZGl2IGluc3RydWN0aW9u
IGNhbid0IGJlIHNoYXJlZCBiZXR3ZWVuCj4+IHRoZSB0d28gaGFsdmVzLgo+IAo+IFRoaXMgYmVp
bmcgYW4gX19pbml0IGZ1bmN0aW9uLCBJIGRvbid0IHRoaW5rIHRoZSBudW1iZXIgb2YgZGl2aXNp
b25zCj4gaXMgYSBjb25jZXJuIGhlcmUsIHRoZSBtb3JlIHRoYXQgdGhlIGNvbXBpbGVyIC0gd2l0
aCB0aGUgZGl2aXNvcgo+IGJlaW5nIGEgY29uc3RhbnQgLSB3aWxsIGNvbnZlcnQgdGhlbSB0byBt
dWx0aXBsaWNhdGlvbnMgYW55d2F5LgoKR29vZCBwb2ludC4gIEFja2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
