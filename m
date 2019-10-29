Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC6E856B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 11:21:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPOb8-0003Ri-JI; Tue, 29 Oct 2019 10:19:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lo1b=YW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPOb6-0003Rc-8p
 for xen-devel@lists.xen.org; Tue, 29 Oct 2019 10:19:32 +0000
X-Inumbo-ID: 9844bd5e-fa35-11e9-950e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9844bd5e-fa35-11e9-950e-12813bfff9fa;
 Tue, 29 Oct 2019 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572344371;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xNr2gQca7ti+ZlZkdbTsujDPOP/tVTsmHDn3uFWFGb0=;
 b=GveCHIZWoSpCyLQJNIUAzubRNUceB8ZtNOwxEVceA1dzdt6mMb4h+15j
 6doSdGHdEZBzqocuOGBxeuuM+FTuwoeD6Hw0sDMMO80ZvJ1MX7npn6gKy
 D/gfga7EjlzrUrRoUm08cVMgrOYuDuGtbGXG19wEAgBBstaghOs1AJ6qA U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: E/WgGg8sI2LHES+nwhZ1tv7jmg6t23kdpSUnw7vDakRpVkYEmXkYkAjq4T/kEP+ANR8akyyZe7
 CSJAfctug8pYTA/vSiIKEmc2khumXsHs1OqTS5cZdeVypdK0noeodf7d4/WzsKLs/Qui/KxNv6
 fZnxuAoX0ZQlHbKcsTPty+kd+GJfvkO7Rl6yaZLP899MwGO3tbJo/WzILLI2KraHgDF5PGAUPP
 X8w0zpaWEp7qPmoTY3HJLLo1EHaY0ZTuzeKBxMIM0G6cHqvV9Ayj3gzRuaGEhwoURKgykNnB0f
 uzo=
X-SBRS: 2.7
X-MesageID: 7913884
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,243,1569297600"; 
   d="scan'208";a="7913884"
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
 <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
 <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
 <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
 <0fabcc47-f029-0024-bd4c-9ca8c56650f0@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b2a9fac9-538b-62cb-2051-1cb8ef37eaef@citrix.com>
Date: Tue, 29 Oct 2019 10:19:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0fabcc47-f029-0024-bd4c-9ca8c56650f0@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTAvMjAxOSAxMDoxNywgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAyOC8xMC8yMDE5
IDExOjMzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOC8xMC8yMDE5IDExOjMwLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IE9uIDI4LjEwLjIwMTkgMTI6MTUsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4+Pj4gT24gMjgvMTAvMjAxOSAxMToxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDI4LjEwLjIwMTkgMTI6MDgsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+PiBPbiAyOC8xMC8y
MDE5IDA5OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyOC4xMC4yMDE5IDA5OjU2
LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+Pj4+PiBDb252ZXJ0aW5nIGEgZ3Vlc3QgZnJvbSBQ
ViB0byBQVi1pbi1QVkggbWFrZXMgdGhlIGd1ZXN0IHRvIGhhdmUgMzg0awo+Pj4+Pj4+PiBsZXNz
IG1lbW9yeSwgd2hpY2ggbWF5IGNvbmZ1c2UgZ3Vlc3QncyBiYWxsb29uIGRyaXZlci4gVGhpcyBo
YXBwZW5zCj4+Pj4+Pj4+IGJlY2F1c2UgWGVuIHVuY29uZGl0aW9uYWxseSByZXNlcnZlcyA2NDBr
IC0gMU0gcmVnaW9uIGluIEU4MjAgZGVzcGl0ZQo+Pj4+Pj4+PiB0aGUgZmFjdCB0aGF0IGl0J3Mg
cmVhbGx5IGEgdXNhYmxlIFJBTSBpbiBQVkggYm9vdCBtb2RlLgo+Pj4+Pj4+IFRoaXMgaXMgYSBQ
VkggcHJvcGVydHkgYWNjb3JkaW5nIHRvIHlvdXIgZGVzY3JpcHRpb24gYW5kIGFjY29yZGluZwo+
Pj4+Pj4+IHRvIG15IHVuZGVyc3RhbmRpbmcuIFdoeSB3b3VsZCB5b3UgdGhlbiAuLi4KPj4+Pj4+
Pgo+Pj4+Pj4+PiBGaXggdGhpcyBieSBza2lwcGluZyB0aGUgcmVnaW9uIHR5cGUgY2hhbmdlIGZv
ciBwdi1zaGltIG1vZGUuCj4+Pj4+Pj4gLi4uIGFsdGVyIGJlaGF2aW9yIGZvciBzaGltIG1vZGUg
b25seSwgcmF0aGVyIHRoYW4gd2hlbiBib290ZWQgaW4KPj4+Pj4+PiBQVkggbW9kZSBpbiBnZW5l
cmFsPwo+Pj4+Pj4gVGhpcyBpcyBqdXN0IG1lIGJlaW5nIGNhdXRpb3VzLgo+Pj4+Pj4KPj4+Pj4+
IE15IG9yaWdpbmFsIGVtYWlsIGRvZXMgaGF2ZSB0aGlzIHRleHQgYWZ0ZXIgLS0tCj4+Pj4+PiAi
VGhlIGNvbmRpdGlvbiBjYW4gYmUgcmVsYXhlZCB0byBiZSBqdXN0ICFwdmhfYm9vdCBpZiB0aGVy
ZSBhcmUgbm8KPj4+Pj4+IHBsYW5zIHRvIHN1cHBvcnQgVkdBIE1NSU8gLyBST01zIGZvciBQVkgg
Z3Vlc3RzLiIKPj4+Pj4gSSBkb3VidCBlbXVsYXRlZCBvbmVzIGFyZSBpbnRlbmRlZCB0byBiZSBz
dXBwb3J0ZWQsIGJ1dCBvZgo+Pj4+PiBjb3Vyc2UgYSBncmFwaGljcyBjYXJkIGNvdWxkIGJlIHBh
c3NlZCB0aHJvdWdoLiBJaXJjIHBhc3N0aHJvdWdoCj4+Pj4+IGlzIGEgcGVuZGluZyB3b3JrIGl0
ZW0gc3RpbGwgYW55d2F5IGZvciBQVkgsIHNvIGRlYWxpbmcgd2l0aCB0aGUKPj4+Pj4gY2FzZSBy
aWdodCBub3cgbWF5IG5vdCBldmVuIGJlIG5lY2Vzc2FyeS4KPj4+PiBUaGUgYnVnIGlzIFhlbiBi
bGluZGx5IHByZXN1bWluZyB0aGF0IGEgbWlzc2luZyBob2xlICJtdXN0IGJlIGEgZmlybXdhcmUK
Pj4+PiBidWciLgo+Pj4+Cj4+Pj4gSSBjYW4gYmVsaWV2ZSB0aGF0IHRoZXJlIG1heSBoYXZlIGJl
ZW4gc3lzdGVtcyBkZWNhZGVzIGFnbyB3aGljaCBnb3QKPj4+PiB0aGlzIHdyb25nLCBidXQgdGJo
IEkgZG91YnQgaXQgYXBwbGllcyB0byA2NGJpdC1jYXBhYmxlIHN5c3RlbXMsCj4+Pj4gY29uc2lk
ZXJpbmcgaG93IHN0YW5kYXJkaXNlZCB0aGluZ3Mgd2VyZSBieSB0aGVuLgo+Pj4+Cj4+Pj4gSSdk
IGp1c3QgZGVsZXRlIHRoaXMgd2hvbGUgcGllY2Ugb2YgbG9naWMgYW5kIGNhbGwgaXQgZG9uZS4K
Pj4+IFdlbGwsIEkgY291bGQgc2VlIHVzZSBiZWluZyBsZXNzIGFnZ3Jlc3NpdmUgaGVyZSwgYnV0
IGZpcm13YXJlIChpZgo+Pj4gdGhlcmUgaXMgZmlybXdhcmUsIGkuZS4gZXZlcnl0aGluZyBleGNl
cHQgUFZIKSBjbGFpbWluZyB0aGVyZSB0bwo+Pj4gYmUgUkFNIGltbWVkaWF0ZWx5IGJlbG93IHRo
ZSAxTSBib3VuZGFyeSBpcyBhIHByZXR0eSBnb29kIHNpZ24gb2YKPj4+IHNvbWV0aGluZyBiZWlu
ZyB3cm9uZy4gVGhlcmUgX291Z2h0XyB0byBiZSBST00gYXQgdGhhdCBhZGRyZXNzLgo+Pj4gT3Rv
aCB0aGVyZSB3ZXJlIGV2ZW4gd2F5cyBpbiBvbGRlciBjaGlwc2V0cyB0byBtYWtlIFJBTSBhcHBl
YXIgYXQKPj4+IGFkZHJlc3MgcmFuZ2VzIG5vdCB1c2VkIGJ5IG9wdGlvbiBST01zLCBzbyB0aGUg
bG9naWMgd2UgY3VycmVudGx5Cj4+PiBoYXZlIGdvZXMgdG9vIGZhciBwb3RlbnRpYWxseSBldmVu
IG9uIGJhcmUgbWV0YWwuCj4+Pgo+Pj4gU28gd2hpbGUgSSdtIGFsbCBmb3IgcmVsYXhpbmcsIEkg
ZG9uJ3QgdGhpbmsgSSBjYW4gc3VwcG9ydAo+Pj4gb3V0cmlnaHQgZGVsZXRpb24uCj4+IEZvciBu
b3csIGhvdyBhYm91dCBjcHVfaGFzX2h5cGVydmlzb3IgPwo+Pgo+PiBXaGF0ZXZlciB0aGUgdmly
dHVhbCBlbnZpcm9ubWVudCwgd2Ugc2hvdWxkIHRydXN0IHRoZSBwcm92aWRlZCBtZW1vcnkgbWFw
Lgo+IFVuZm9ydHVuYXRlbHksIHRoaXMgcGxhbiBoYXMgZmFpbGVkOiBpbml0X2U4MjAoKSBpcyBj
YWxsZWQgd2F5IGJlZm9yZQo+IGVhcmx5X2NwdV9pbml0KCkgYW5kIHRlc3RpbmcgY3B1X2hhc19o
eXBlcnZpc29yIGlzIG1lYW5pbmdsZXNzIHRoZXJlLgo+Cj4gSSBndWVzcyBJJ2xsIGdvIGZvciAh
cHZoX2Jvb3QgY2hlY2sgZm9yIG5vdy4KCk9wZW5jb2RlIGl0IHdpdGggY3B1aWRfZWN4KDEpIGZv
ciBub3csIGFzIHdlJ3ZlIGRvbmUgZWxzZXdoZXJlLgoKSSd2ZSBnb3QgYSBwYXRjaCBpbiBteSBu
b3QtcHJvZ3Jlc3NpbmctdmVyeS1xdWlja2x5IHNlcmllcyB0byByZW1vdmUgdGhlCmJvb3QgdGlt
ZSBtYXBwaW5nIGF0IDAgd2hpY2ggY2xlYW5zIHVwIGVhcmx5IENQVUlEIGhhbmRsaW5nIHNvIHRo
aXMgY2FuCnR1cm4gaW50byBjcHVfaGFzX2h5cGVydmlzb3IsIGJ1dCB0aGF0IGlzIGRlZmluaXRl
bHkgcG9zdC00LjEzIG1hdGVyaWFsCnJpZ2h0IG5vdy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
