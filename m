Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E98E8561
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 11:20:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPOZF-0003Kh-5P; Tue, 29 Oct 2019 10:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zg9R=YW=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iPOZD-0003Kc-9Z
 for xen-devel@lists.xen.org; Tue, 29 Oct 2019 10:17:35 +0000
X-Inumbo-ID: 523f954a-fa35-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 523f954a-fa35-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572344253;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=B0B/CWip6ye5bGRSA++wmMYqfV45VmffF3tGFZRrTMI=;
 b=Qlai6V4oZ4hFW+Clxo5QPGJCJzm38IZPoUjxXOGKh3S5fZ0aDRoSc534
 IpD5zZG/WrokXcpNeNNtAWPr6IUMCQzbclU6BtF7QmI62PkyoTMv1kGTo
 3ZJKcCtBnSvtUSvMdAh2bhTx6zfBaMfP8uC75+dM9UWdPmrd7XsZeAwmQ A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y2/l8Tx+rGNkmdM8iTEmfAyV5/V5eLk9yqwKZefEJbq7eacE9g1rxHE3FqSg6jB6C12yjNKLRF
 h+8ahOV0yCZ8bgmNq+Po5GACGb5WLb+LtnSp35wGcrdvA5MDbZmjBf5bGaXWiTVo5QV+DSNqbw
 2py2bS07OKv/n3ikvwgC5tN4wIo0LyC7iNe6j4h6W2DL+vatTelP4U4TnMPoX7ByEMQnkCqAcL
 4MltGwiX781zza9GH7W6C16pj+NHYikoCghSWA2QmhVFvWwuAMkRJaD/61iMmO07bEyP77VAhS
 5Eo=
X-SBRS: 2.7
X-MesageID: 8012174
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,243,1569297600"; 
   d="scan'208";a="8012174"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
 <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
 <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
 <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <0fabcc47-f029-0024-bd4c-9ca8c56650f0@citrix.com>
Date: Tue, 29 Oct 2019 10:17:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
Content-Language: en-US
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
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMTAvMjAxOSAxMTozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8xMC8yMDE5
IDExOjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMTAuMjAxOSAxMjoxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI4LzEwLzIwMTkgMTE6MTEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI4LjEwLjIwMTkgMTI6MDgsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+IE9u
IDI4LzEwLzIwMTkgMDk6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjguMTAuMjAx
OSAwOTo1NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+Pj4+PiBDb252ZXJ0aW5nIGEgZ3Vlc3Qg
ZnJvbSBQViB0byBQVi1pbi1QVkggbWFrZXMgdGhlIGd1ZXN0IHRvIGhhdmUgMzg0awo+Pj4+Pj4+
IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVzdCdzIGJhbGxvb24gZHJpdmVyLiBU
aGlzIGhhcHBlbnMKPj4+Pj4+PiBiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2ZXMg
NjQwayAtIDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKPj4+Pj4+PiB0aGUgZmFjdCB0aGF0IGl0
J3MgcmVhbGx5IGEgdXNhYmxlIFJBTSBpbiBQVkggYm9vdCBtb2RlLgo+Pj4+Pj4gVGhpcyBpcyBh
IFBWSCBwcm9wZXJ0eSBhY2NvcmRpbmcgdG8geW91ciBkZXNjcmlwdGlvbiBhbmQgYWNjb3JkaW5n
Cj4+Pj4+PiB0byBteSB1bmRlcnN0YW5kaW5nLiBXaHkgd291bGQgeW91IHRoZW4gLi4uCj4+Pj4+
Pgo+Pj4+Pj4+IEZpeCB0aGlzIGJ5IHNraXBwaW5nIHRoZSByZWdpb24gdHlwZSBjaGFuZ2UgZm9y
IHB2LXNoaW0gbW9kZS4KPj4+Pj4+IC4uLiBhbHRlciBiZWhhdmlvciBmb3Igc2hpbSBtb2RlIG9u
bHksIHJhdGhlciB0aGFuIHdoZW4gYm9vdGVkIGluCj4+Pj4+PiBQVkggbW9kZSBpbiBnZW5lcmFs
Pwo+Pj4+PiBUaGlzIGlzIGp1c3QgbWUgYmVpbmcgY2F1dGlvdXMuCj4+Pj4+Cj4+Pj4+IE15IG9y
aWdpbmFsIGVtYWlsIGRvZXMgaGF2ZSB0aGlzIHRleHQgYWZ0ZXIgLS0tCj4+Pj4+ICJUaGUgY29u
ZGl0aW9uIGNhbiBiZSByZWxheGVkIHRvIGJlIGp1c3QgIXB2aF9ib290IGlmIHRoZXJlIGFyZSBu
bwo+Pj4+PiBwbGFucyB0byBzdXBwb3J0IFZHQSBNTUlPIC8gUk9NcyBmb3IgUFZIIGd1ZXN0cy4i
Cj4+Pj4gSSBkb3VidCBlbXVsYXRlZCBvbmVzIGFyZSBpbnRlbmRlZCB0byBiZSBzdXBwb3J0ZWQs
IGJ1dCBvZgo+Pj4+IGNvdXJzZSBhIGdyYXBoaWNzIGNhcmQgY291bGQgYmUgcGFzc2VkIHRocm91
Z2guIElpcmMgcGFzc3Rocm91Z2gKPj4+PiBpcyBhIHBlbmRpbmcgd29yayBpdGVtIHN0aWxsIGFu
eXdheSBmb3IgUFZILCBzbyBkZWFsaW5nIHdpdGggdGhlCj4+Pj4gY2FzZSByaWdodCBub3cgbWF5
IG5vdCBldmVuIGJlIG5lY2Vzc2FyeS4KPj4+IFRoZSBidWcgaXMgWGVuIGJsaW5kbHkgcHJlc3Vt
aW5nIHRoYXQgYSBtaXNzaW5nIGhvbGUgIm11c3QgYmUgYSBmaXJtd2FyZQo+Pj4gYnVnIi4KPj4+
Cj4+PiBJIGNhbiBiZWxpZXZlIHRoYXQgdGhlcmUgbWF5IGhhdmUgYmVlbiBzeXN0ZW1zIGRlY2Fk
ZXMgYWdvIHdoaWNoIGdvdAo+Pj4gdGhpcyB3cm9uZywgYnV0IHRiaCBJIGRvdWJ0IGl0IGFwcGxp
ZXMgdG8gNjRiaXQtY2FwYWJsZSBzeXN0ZW1zLAo+Pj4gY29uc2lkZXJpbmcgaG93IHN0YW5kYXJk
aXNlZCB0aGluZ3Mgd2VyZSBieSB0aGVuLgo+Pj4KPj4+IEknZCBqdXN0IGRlbGV0ZSB0aGlzIHdo
b2xlIHBpZWNlIG9mIGxvZ2ljIGFuZCBjYWxsIGl0IGRvbmUuCj4+IFdlbGwsIEkgY291bGQgc2Vl
IHVzZSBiZWluZyBsZXNzIGFnZ3Jlc3NpdmUgaGVyZSwgYnV0IGZpcm13YXJlIChpZgo+PiB0aGVy
ZSBpcyBmaXJtd2FyZSwgaS5lLiBldmVyeXRoaW5nIGV4Y2VwdCBQVkgpIGNsYWltaW5nIHRoZXJl
IHRvCj4+IGJlIFJBTSBpbW1lZGlhdGVseSBiZWxvdyB0aGUgMU0gYm91bmRhcnkgaXMgYSBwcmV0
dHkgZ29vZCBzaWduIG9mCj4+IHNvbWV0aGluZyBiZWluZyB3cm9uZy4gVGhlcmUgX291Z2h0XyB0
byBiZSBST00gYXQgdGhhdCBhZGRyZXNzLgo+PiBPdG9oIHRoZXJlIHdlcmUgZXZlbiB3YXlzIGlu
IG9sZGVyIGNoaXBzZXRzIHRvIG1ha2UgUkFNIGFwcGVhciBhdAo+PiBhZGRyZXNzIHJhbmdlcyBu
b3QgdXNlZCBieSBvcHRpb24gUk9Ncywgc28gdGhlIGxvZ2ljIHdlIGN1cnJlbnRseQo+PiBoYXZl
IGdvZXMgdG9vIGZhciBwb3RlbnRpYWxseSBldmVuIG9uIGJhcmUgbWV0YWwuCj4+Cj4+IFNvIHdo
aWxlIEknbSBhbGwgZm9yIHJlbGF4aW5nLCBJIGRvbid0IHRoaW5rIEkgY2FuIHN1cHBvcnQKPj4g
b3V0cmlnaHQgZGVsZXRpb24uCj4gCj4gRm9yIG5vdywgaG93IGFib3V0IGNwdV9oYXNfaHlwZXJ2
aXNvciA/Cj4gCj4gV2hhdGV2ZXIgdGhlIHZpcnR1YWwgZW52aXJvbm1lbnQsIHdlIHNob3VsZCB0
cnVzdCB0aGUgcHJvdmlkZWQgbWVtb3J5IG1hcC4KClVuZm9ydHVuYXRlbHksIHRoaXMgcGxhbiBo
YXMgZmFpbGVkOiBpbml0X2U4MjAoKSBpcyBjYWxsZWQgd2F5IGJlZm9yZQplYXJseV9jcHVfaW5p
dCgpIGFuZCB0ZXN0aW5nIGNwdV9oYXNfaHlwZXJ2aXNvciBpcyBtZWFuaW5nbGVzcyB0aGVyZS4K
CkkgZ3Vlc3MgSSdsbCBnbyBmb3IgIXB2aF9ib290IGNoZWNrIGZvciBub3cuCgotLQpUaGFua3Ms
ClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
