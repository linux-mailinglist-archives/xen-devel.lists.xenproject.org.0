Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1321393E3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 15:44:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir0u3-0003xD-US; Mon, 13 Jan 2020 14:41:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ir0u2-0003x4-Qq
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 14:41:14 +0000
X-Inumbo-ID: bf0a5778-3612-11ea-827a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf0a5778-3612-11ea-827a-12813bfff9fa;
 Mon, 13 Jan 2020 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578926473;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wZD0FkvW2ph19w/RqOS4AWHqu9Hdtq7ri8UK8L4Iqqk=;
 b=LTBx5XZZwvJJzFt1SNvpao+5wajLG8aqW72OuVk+uxAY05tSfMbN01vp
 qg8jIvffMmBWuKZpjWOkIxaLUWEIwORUJZqv1wMuN71FkEquzlXAvoCAR
 hOKHfl68DT4ZvANyBlBYg+rJGLjb3gR2mA1wGZkdLgZ9y3NAGXGvEWtoy k=;
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
IronPort-SDR: by5u+Cp8EXHkmqaaNGUxBqi1c8QjMPkGPKuAN+dbjxB8dh9i9dxVuIutBdWODvn3ZpPgh77gEg
 GzOctjZm2e6zJEjh2gBBG4wG/rQeamBDWGOfO6zzp+LQgQz1khLt1oYokRuimzg2zh+sjbWIL8
 cUBeXHl98y+2YGat7tcHz6f6oNvV9ttAbkBeXlexK0mE/aZ6daaWrRJAV3Ngx3K6Db341NQMTM
 6OSeMam5hwOV9FTF/65uPfu6XXOxbDXNVTKNpyE+zBUwWXWAFMXOJGDh3cRc6qhSF7SyKMgxB9
 A5I=
X-SBRS: 2.7
X-MesageID: 11204265
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11204265"
To: George Dunlap <george.dunlap@citrix.com>, Doug Goldstein
 <cardoe@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
 <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <52fcbff2-c175-745b-0c4a-d9ce6d4ae45e@citrix.com>
Date: Mon, 13 Jan 2020 14:40:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDEvMjAyMCAxMjo1MSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzEyLzIwIDY6
MjYgUE0sIERvdWcgR29sZHN0ZWluIHdyb3RlOgo+PiBPbiAxLzExLzIwIDM6MDIgQU0sIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6Cj4+Pgo+Pj4+IE9uIEphbiAxMSwgMjAyMCwgYXQgNDowMiBBTSwgRG91
ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPiB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4KPj4+
PiBPbiAxLzEwLzIwIDQ6MzcgQU0sIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+IEhpZGUgdGhl
IGZvbGxvd2luZyBpbmZvcm1hdGlvbiB0aGF0IGNhbiBoZWxwIGlkZW50aWZ5IHRoZSBydW5uaW5n
IFhlbgo+Pj4+PiBiaW5hcnkgdmVyc2lvbjogWEVOVkVSX2V4dHJhdmVyc2lvbiwgWEVOVkVSX2Nv
bXBpbGVfaW5mbywKPj4+Pj4gWEVOVkVSX2NoYW5nZXNldC4KPj4+Pj4gQWRkIGV4cGxpY2l0IGNh
c2VzIGZvciBYRU5WRVJfY29tbWFuZGxpbmUgYW5kIFhFTlZFUl9idWlsZF9pZCBhcyB3ZWxsLgo+
Pj4+PiBJbnRyb2R1Y2UgeHNtX2ZpbHRlcl9kZW5pZWQoKSB0byBodm1sb2FkZXIgdG8gcmVtb3Zl
ICI8ZGVuaWVkPiIgc3RyaW5nCj4+Pj4+IGZyb20gZ3Vlc3QncyBETUkgdGFibGVzIHRoYXQgb3Ro
ZXJ3aXNlIHdvdWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UKPj4+Pj4gZG1pZGVjb2RlLgo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+
Cj4+Pj4+IC0tLQo+Pj4+PiB2MSAtLT4gdjI6Cj4+Pj4+IC0gQWRkZWQgeHNtX2ZpbHRlcl9kZW5p
ZWQoKSB0byBodm1sb2FkZXIgaW5zdGVhZCBvZiBtb2RpZnlpbmcKPj4+Pj4geGVuX2RlbnkoKQo+
Pj4+IFNvIDEwMCUgdGhpcyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3b24ndCBmbHkgd2l0aCB0aGUg
dmFyaW91cwo+Pj4+IGRvd25zdHJlYW1zIHRoYXQgcnVuIHRoZSB2MSBvZiB0aGlzIHBhdGNoLiBU
aG9zZSB2YXJpb3VzIGNvbnN1bWVycwo+Pj4+IHdpbGwgc3RpY2sgd2l0aCB2MS4KPj4+Pgo+Pj4+
IElmIHRoZSBnb2FsIG9mIHRoaXMgaXMgdG8gcmVkdWNlIHRoZSBidXJkZW4gb2YgdGhlIGRvd25z
dHJlYW1zIGFuZAo+Pj4+IHRoZWlyIGN1c3RvbWVycyB0byBjYXJyeSBhIHBhdGNoIGFnYWluc3Qg
WGVuIHRoZW4gSSB3b3VsZG4ndCBldmVuCj4+Pj4gYm90aGVyIHdpdGggdGhpcyB2ZXJzaW9uLgo+
Pj4gSWYgdGhlIGdvYWwgaXMgdG8gY29tZSB1cCB3aXRoIGEgc29sdXRpb24gdGhhdCB3b3JrcyBm
b3IgZXZlcnlvbmUsIGl0Cj4+PiB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBzYWlkICp3aHkqIOKA
nHZhcmlvdXMgY29uc3VtZXJz4oCdIHdvdWxkIGZpbmQgdGhpcwo+Pj4gcGF0Y2ggdW5hY2NlcHRh
YmxlOyBhbmQgYWxzbyB3aGF0IHRoZXkgbWlnaHQgdGhpbmsgYWJvdXQgdGhlIGFsdGVybmF0ZQo+
Pj4gc29sdXRpb25zIHByb3Bvc2VkIChhbmQgd2h5KS4KPj4+Cj4+PiDCoCAtR2VvcmdlCj4+Pgo+
IFtzbmlwXQo+Cj4+IE5vdyBJIGtub3cgc29tZW9uZSBpcyBnb2luZyB0byByZWFkIHRoaXMgYW5k
IHNheSAiTG9vayBhdCBEb3VnIGFuZCBoaW0KPj4gYWR2b2NhdGluZyBmb3Igc2VjdXJpdHkgdGhy
b3VnaCBvYnNjdXJpdHkiLgo+IEZXSVcgSSdkIGJlIHRoZSBmaXJzdCBwZXJzb24gdG8gY29udHJh
ZGljdCB0aGVtLCBhbmQgc2F5IHlvdSB3ZXJlCj4gcHJhY3RpY2luZyAiZGVmZW5zZSBpbiBkZXB0
aCIuIDotKQo+Cj4+IFVsdGltYXRlbHkgbXkgcG9pbnQgaXMgaWYgdGhlIGdvYWwgb2YgdGhpcyBw
YXRjaCBpcyB0byB1cHN0cmVhbSBhIHBhdGNoCj4+IHRoYXQncyBjYXJyaWVkIGJ5IHZhcmlvdXMg
ZG93bnN0cmVhbXMsIHdoeSBub3QgYWN0dWFsbHkgbGlzdGVuIHRvIHdoYXQKPj4gY2F1c2VkIHRo
ZW0gdG8gd3JpdGUgdGhlIHBhdGNoPwo+IFJpZ2h0LCB0aGF0J3Mgd2hhdCBJJ20gdHJ5aW5nIHRv
IGRvOyBidXQgSSBkb24ndCBzZWVtIHRvIGJlIG1ha2luZyBtdWNoCj4gcHJvZ3Jlc3MuCj4KPiBI
ZXJlJ3MgbXkgc3VtbWFyeSBvZiB0aGUgc2l0dWF0aW9uIGFuZCBhcmd1bWVudHMgc28gZmFyOgo+
Cj4gMS4gVGhlIHhlbl92ZXJzaW9uIGh5cGVyY2FsbCBjYW4gcmV0dXJuIHN0cmluZ3MgZm9yIGEg
bnVtYmVyIG9mCj4gZGlmZmVyZW50IHZhbHVlcywgaW5jbHVkaW5nIFhFTlZFUl9leHRyYXZlcnNp
b24sIHdoaWNoIGdpdmVzIHRoZSBwb2ludAo+IHJlbGVhc2UgYW5kIGJ1aWxkIGlkLgo+Cj4gMi4g
VGhlIFhTTSBkdW1teSBtb2R1bGUgaGFzIGNvZGUgdG8gZmlsdGVyIHdoaWNoIG9mIHRoZXNlIGFy
ZSBhbGxvd2VkCj4gZm9yIHVucHJpdmlsZWdlZCBndWVzdHMuICBXaGVuIGFjY2VzcyB0byBhIGdp
dmVuIHZhbHVlIGlzIGZpbHRlcmVkLCBubwo+IGVycm9yIGlzIHJldHVybmVkOyByYXRoZXIsIHRo
ZSBzdHJpbmcgIjxkZW5pZWQ+IiBpcyByZXR1cm5lZC4KCkdpdmVuIGFuIEFCSSB3aGljaCBpcyBj
YXBhYmxlIG9mIGV4cHJlc3NpbmcgLUVQRVJNLCBpdCBpcyBwZXJoYXBzIHdvcnRoCm5vdGluZyB0
aGF0IHRoaXMgYmVoYXZpb3VyIGlzIGJlY2F1c2Ugc29tZSBkcml2ZXJzIHdpbGwgQlNPRCBpZiB0
aGUgY2FsbApmYWlscy4uLgoKPiAzLiBLbm93bGVkZ2UgYWJvdXQgdGhlIHNwZWNpZmljIGluc3Rh
bnRpYXRpb24gb2YgWGVuIG9uIHdoaWNoIHRoZXkgYXJlCj4gcnVubmluZyBtYWtlcyBpdCBlYXNp
ZXIgZm9yIGF0dGFja2VycyB0byBrbm93IGhvdyB0byBhdHRhY2sgdCBoZSBzeXN0ZW07Cj4gdGhl
IFhFTlZFUl9leHRyYXZlcnNpb24gcHJvdmlkZXMgbGl0dGxlIHZhbHVlIHRvIGxlZ2l0aW1hdGUg
dXNlcnMsIGJ1dCBhCj4gbG90IG9mIHZhbHVlIHRvIGF0dGFja2Vycy4gICBBcyBhIGRlZmVuc2Ut
aW4tZGVwdGggbWVhc3VyZSwgaXQncwo+IGltcG9ydGFudCB0byBiZSBhYmxlIHRvIGhpZGUgdGhp
cyBpbmZvcm1hdGlvbi4KPgo+IDQuIFRoZXJlJ3MgY3VycmVudGx5IGEgcGF0Y2ggY2FycmllZCBi
eSBtYW55IGRvd25zdHJlYW1zLCB3aGljaCBjaGFuZ2VzCj4gdGhlIFhTTSBkdW1teSBtb2R1bGUg
dG8gZGVueSBYRU5WRVJfZXh0cmF2ZXJzaW9uIHRvIHVucHJpdmlsZWdlZCBndWVzdHMuCj4KPiA1
LiBIb3dldmVyLCB0aGlzIGNhdXNlZCAiPGRlbmllZD4iIHRvIHNob3cgdXAgaW4gdmFyaW91cyB1
c2VyLXZpc2libGUKPiBwbGFjZXMsIHdoaWNoIGNhdXNlZCBjdXN0b21lciBzdXBwb3J0IGhlYWRh
Y2hlcy4gIFNvIHRoaXMgb3V0LW9mLXRyZWUKPiBwYXRjaCBhbHNvIHJlcGxhY2VkIHRoZSBzdHJp
bmcgcmV0dXJuZWQgd2hlbiBkZW55aW5nIGFjY2VzcyB0byAiIgo+IGluc3RlYWQuICBOb3RlIHRo
YXQgdGhpcyBpcyBub3QgKm9ubHkqIGZvciBYRU5WRVJfZXh0cmF2ZXJzaW9uOyB3aXRoCj4gdGhh
dCBwYXRjaCwgKmFueSogdGltZSB0aGUgdmFsdWUgcmVxdWVzdGVkIGluIHhlbl92ZXJzaW9uIGlz
IGRlbmllZCBieQo+IHBvbGljeSwgIiIgd2lsbCBiZSByZXR1cm5lZC4KPgo+IDYuIFNpbGVudGx5
IHJldHVybmluZyBhbiBlbXB0eSBzdHJpbmcgaXMgY29uc2lkZXJlZCBiYWQgaW50ZXJmYWNlIGRl
c2lnbgo+IGJ5IHNldmVyYWwgZGV2ZWxvcGVycy4KClNldmVyYWwgb3RoZXJzIGRpc2FncmVlIHdp
dGggdGhpcyBjbGFpbS7CoCBOb3QgbGVhc3QgYmVjYXVzZSBpdCBpcyB2ZXJ5CmNvbW1vbiBzaWdu
YWwgZm9yICJubyBpbmZvcm1hdGlvbiIuCgpUaGlzIGlzIHdoeSBzZXZlcmFsIGRvd25zdHJlYW1z
IHJlYWxseSBoYXZlIGdvdHRlbiBhd2F5IHdpdGggdXNpbmcgdGhlCmVtcHR5IHN0cmluZywgZm9y
IHByb2R1Y3RzIHdoaWNoIGhhdmUgYmVlbiBpbiB0aGUgZmllbGQgZm9yIHllYXJzLgoKPiAgIFNv
IFNlcmdleSdzIHNlY29uZCBwYXRjaDoKPiAgLSBTdGlsbCBkZW5pZXMgWEVOVkVSX2V4dHJhdmVy
c2lvbiBhdCB0aGUgaHlwZXJ2aXNvciBsZXZlbAo+ICAtIExlYXZlcyB0aGUgdmFsdWUgcmV0dXJu
ZWQgYnkgdGhlIGh5cGVydmlzb3IgYXMgIjxkZW5pZWQ+Igo+ICAtIEZpbHRlcnMgdGhlICI8ZGVu
aWVkPiIgc3RyaW5nIGF0IHRoZSBodm1sb2FkZXIgbGV2ZWwsIHRvIHByZXZlbnQgaXQKPiBsZWFr
aW5nIGludG8gYSBHVUkgYW5kIHNjYXJpbmcgY3VzdG9tZXJzLgoKVGhlIFNNQmlvcyB0YWJsZSBp
c24ndCB0aGUgb25seSB3YXkgWEVOVkVSX2V4dHJhdmVyc2lvbiBsZWFrcyB1cCBpbnRvCnRoZSBV
SS4KClhFTlZFUl9leHRyYXZlcnNpb24gaXNuJ3QgdGhlIG9ubHkgc291cmNlIG9mIHJlZGFjdGVk
IGluZm9ybWF0aW9uCmxlYWtpbmcgdXAgaW50byB0aGUgVUkuCgpMaW51eCBmb3IgZXhhbXBsZSBl
eHBvcnRzIGl0IGFsbCB2aWEgc3lzZnMuwqAgVGhlIHdpbmRvd3MgZHJpdmVycyBwdXQKWEVOVkVS
X2V4dHJhdmVyc2lvbiBpbnRvIHNldmVyYWwgb3RoZXIgbG9ncy4KCj4KPiBOb3cgd2UgZ2V0IHRv
IEFuZHkncyBvYmplY3Rpb24gb24gdGhlIDEwdGg6Cj4KPiAtLS0KPiBUaGUgcmVhc29uIGZvciB0
aGlzICh3aGljaCBvdWdodCB0byBiZSBvYnZpb3VzLCBidXQgSSBndWVzcyBvbmx5IHRvCj4gdGhv
c2Ugd2hvIGFjdHVhbGx5IGRvIGN1c3RvbWVyIHN1cHBvcnQpIGlzIGJhc2ljIGh1bWFuIHBoeXNp
b2xvZ3kuCj4gImRlbmllZCIgbWVhbnMgc29tZXRoaW5nIGhhcyBnb25lIHdyb25nLiAgSXQgc2Nh
cmVzIHBlb3BsZSwgYW5kIGNhdXNlcwo+IHRoZW0gdG8gc2VlayBoZWxwIHRvIGNoYW5nZSBmaXgg
d2hhdGV2ZXIgaXMgYnJva2VuLgo+Cj4gSXQgaXMgbm90IGFwcHJvcHJpYXRlIGZvciBpdCB0byBm
aW5kIGl0cyB3YXkgaW50byB0aGUgZ3Vlc3QgaW4gdGhlIGZpcnN0Cj4gcGxhY2UsIGFuZCB0aGF0
IGluY2x1ZGVzIHR1cm5pbmcgdXAgaW4gYGRtZXNnYCBhbmQgb3RoZXIgbG9ncywgYW5kCj4gZXhw
ZWN0aW5nIGd1ZXN0IHJ1bnRpbWUgdG8gZmlsdGVyIGZvciBpdCBpcyBjb21wbGV0ZSBub25zZW5z
ZS4KPiAtLS0KPgo+IEJhc2ljYWxseSwgQW5keSBzYXlzIHRoYXQgKmFueXdoZXJlKiBpdCBtaWdo
dCBzaG93IHVwIGlzIHdheSB0b28gc2NhcnksCj4gZXZlbiBhIGd1ZXN0IGRtZXNnIGxvZy4KPgo+
IFdlbGwsIEkgZGlzYWdyZWU7IEkgbG9vayBpbiAiZG1lc2ciIGFuZCBJIHNlZSBsb2FkcyBvZiAi
c2NhcnkiIHRoaW5ncy4KCkp1c3QgYmVjYXVzZSBkbWVzZyBpcyBub3QgYW4gZXhhbXBsZSBvZiBh
IGdvb2QgVUksIGRvZXNuJ3QgbWVhbiBpdHMgb2sKZm9yIHVzIHRvIG1ha2U6CgpYZW4gdmVyc2lv
bjogNC4xNDxkZW5pZWQ+IChwcmVzZXJ2ZS1BRCkKCnRoZSBkZWZhdWx0IHRoaW5nIHNob3duIGlu
IGEgWGVuIHN5c3RlbS4KCj4gQnV0IGlmICI8ZGVuaWVkPiIgaXMgdG9vIHNjYXJ5LCB0aGVuIHdl
IGNhbiB0cnkgIjxoaWRkZW4+Ii4KCkZyb20gYW4gYWJzdHJhY3QgUG9WLCBoaWRkZW4gaXMgbGVz
cyBiYWQgdGhhbiBkZW5pZWQsIGJ1dDoKClhlbiB2ZXJzaW9uOiA0LjE0PGhpZGRlbj4gKHByZXNl
cnZlLUFEKQoKaXNuJ3Qgb2sgZWl0aGVyLgoKPgo+IFRoZW4gd2UgY29tZSB0byB5b3VyIG1haWwu
Cj4KPiBZb3Ugc3BlbmQgdHdvIHBhcmFncmFwaHMganVzdGlmeWluZyB3aHkgd2UgbmVlZCB0byBk
byAjNCAoaGlkZSB0aGUgdmFsdWUKPiBmcm9tIHVucHJpdmlsZWdlZCBndWVzdHMpLCBiYXNpY2Fs
bHkgcmVpdGVyYXRpbmcgcG9pbnQgIzMgYW5kIGRlYWxpbmcKPiB3aXRoIHBvdGVudGlhbCBvYmpl
Y3Rpb25zLiAgQnV0IG5vYm9keSBvYmplY3RzIHRvICM0LCBvciBkaXNhZ3JlZXMgd2l0aCAjMy4K
Pgo+IFlvdSB0aGVuIGhhdmUgYSBwYXJhZ3JhcGggYXJndWluZyB3aHkgaXQncyBpbXBvcnRhbnQg
dGhhdCBpbmZvcm1hdGlvbiBiZQo+IHN0cmlwcGVkIGF0IHRoZSBoeXBlcnZpc29yIHJhdGhlciB0
aGFuIGluIHRoZSB0b29sc3RhY2suCj4KPiBCdXQgU2VyZ2V5J3MgdjIgcGF0Y2ggKmRvZXMqIHN0
cmlwIHRoZSBpbmZvcm1hdGlvbiBhdCB0aGUgaHlwZXJ2aXNvci4KPiBIaXMgcGF0Y2ggbWFrZXMg
aXQgc28gdGhhdCBYRU5WRVJfZXh0cmF2ZXJzaW9uIHJldHVybnMgIjxkZW5pZWQ+Ii4gIFRoZQo+
IGNvZGUgd2hpY2ggY29udmVydHMgIjxkZW5pZWQ+IiB0byAiIiBpbiBodm1sb2FkZXIgaXMgcHVy
ZWx5IGEgVUkgdGhpbmcsCj4gc28gdGhhdCBwZW9wbGUgbG9va2luZyBpbiB0aGVpciBXaW5kb3dz
IFN5c3RlbSBJbmZvIGRvbid0IGdldCBzY2FyeQo+IG1lc3NhZ2VzLgo+Cj4+IEknZCBiZSBoYXBw
eSBpZiB3ZSBoYWQgYSBLY29uZmlnIG9wdGlvbiBiZWhpbmQgd2hhdCB0aGUgc3RyaW5nIGlzLiBH
aXZlCj4+IG1lIGEgYmxhbmsgYXMgYW4gb3B0aW9uIGJ1dCBkZWZhdWx0IGl0IHRvIHdoYXRldmVy
IHN0cmluZyBsaWtlCj4+ICI8aGlkZGVuPiIgdGhhdCB5b3UnZCBsaWtlLiBFdmVyeSBzaGlwcGlu
ZyBYZW4gZGlzdHJvIEkndmUgd29ya2VkIG9uIGhhcwo+PiBoYWQgaXRzIG93biB2MSB2YXJpYW50
IG9mIHRoZSBwYXRjaCBhbmQgbm9uZSBvZiB0aGVtIGF1dGhvcmVkIGJ5IG1lLgo+Cj4gT0ssIHNv
IHdpdGggdGhpcyB3ZSBoYXZlIGZvdXIgcHJvcG9zZWQgb3B0aW9uczoKPgo+IDEuIEJsb2NrIFhF
TlZFUl9leHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwuICBDaGFuZ2UgdGhlCj4g
eGVuX2RlbnkoKSBzdHJpbmcgdG8gIiIuICAoVGhpcyBpcyB2MSBvZiBzZXJnZXkncyBwYXRjaC4p
Cj4KPiAyLiBCbG9jayBYRU5WRVJfZXh0cmF2ZXJzaW9uIGF0IHRoZSBoeXBlcnZpc29yIGxldmVs
LiAgTGVhdmUgeGVuX2RlbnkoKQo+IGFzIHJldHVybmluZyAiPGRlbmllZD4iLCBidXQgcmVwbGFj
ZSAiPGRlbmllZD4iIHdpdGggIiIgaW4gaHZtbG9hZGVyIHNvCj4gaXQgZG9lc24ndCBzaG93IHVw
IGluIHRoZSBTeXN0ZW0gSW5mbyBhbmQgc2NhcmUgdXNlcnMuCj4KPiAzLiBCbG9jayBYRU5WRVJf
ZXh0cmF2ZXJzaW9uIGF0IHRoZSBoeXBlcnZpc29yIGxldmVsLiAgQ2hhbmdlIHhlbl9kZW55KCkK
PiB0byByZXR1cm4gYSBtb3JlIGJlbmlnbiBzdHJpbmcgbGlrZSAiPGhpZGRlbj4iLiAgKFBlcmhh
cHMgYWxzbyBmaWx0ZXIgaXQKPiBpbiBodm1sb2FkZXIsIGp1c3QgZm9yIGdvb2QgbWVhc3VyZS4p
Cj4gZGVmZW5jZSBpbiBkZXB0aCBhcmd1bWVudCBpcyBxdWl0ZSBjb21wZWxsaW5nLgo+Cj4KPgo+
PiAgLUdlb3JnZQo+IDQuIEJsb2NrIFhFTlZFUl9leHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlz
b3IgbGV2ZWwuICBNYWtlIHRoZQo+IHhlbl9kZW55KCkgc3RyaW5nIGNvbmZpZ3VyYWJsZSBpbiBL
Q29uZmlnLgo+Cj4gRnVuZGFtZW50YWxseSBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvICM0LiAgQnV0
IEkgc3RpbGwgZG9uJ3Qga25vdyB3aGF0Cj4geW91ciBvYmplY3Rpb25zIGFyZSB0byAjMiBhbmQg
IzMuCgpCZWNhdXNlIHRoZXkgZG9uJ3QgZml4IHRoZSBvdGhlciBidWdzIGludHJvZHVjZWQgYnkg
dGhlIHBhdGNoLgoKSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgYXJndW1lbnQgb3ZlciByZWRh
Y3RpbmcgbW9yZSBpbmZvcm1hdGlvbiB0aGFuCmlzIGN1cnJlbnRseSByZWRhY3RlZCAtIHRoZSBz
ZWN1cml0eSBhcmd1bWVudHMgZm9yIGRvaW5nIHNvIGFyZSBlbnRpcmVseQpmaW5lLsKgIFRoZSBp
c3N1ZXMgYXJlIGFsbCBvdmVyIGhvdyB0aGUgcmVkYWN0aW9uIG9jY3VycywgYW5kIGluCnBhcnRp
Y3VsYXIsIGhvdyByZWRhY3RpbmcgbmV3IGluZm9ybWF0aW9uIGludGVyYWN0cyB3aXRoIHRoZSBj
dXJyZW50CnJlZGFjdGlvbiBzY2hlbWUgdG8gY2F1c2UgbmV3IHByb2JsZW1zLgoKSXQgaXMgcGh5
c2ljYWxseSBwb3NzaWJsZSB0byBidWlsZCBhIGh5cGVydmlzb3Igd2hpY2ggaGFzIGVtcHR5IHN0
cmluZ3MKaW4gYWxsIG9mIHRoaXMgaW5mb3JtYXRpb24sIHdpdGhvdXQgZXZlbiBlZGl0aW5nIHRo
ZSBzb3VyY2UgY29kZS7CoAooR2V0dGluZyB0aGUgY29tcGlsZXIgc3RyaW5nIHRvIGJlIGVtcHR5
IHdvdWxkIGJlIGEgbGl0dGxlIHRyaWNreSwgYnV0Cm5vdCBub3QgaW1wb3NzaWJsZS7CoCBFdmVy
eXRoaW5nIGVsc2UgaXMgZWFzeS4pCgpJdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGJ1aWxkIGEgaHlw
ZXJ2aXNvciB3aGljaCBoYXMgdGhlIGxpdGVyYWwKIjxkZW5pZWQ+Iiwgd2hpY2ggd291bGQgdGhl
biBhcHBlYXIgZXZlbiB0byBwcml2aWxlZ2VkIGRvbWFpbnMsIGluIHRoaXMKZm9ybS4KClRoZXJl
IGlzIG5vIHN1Y2ggdGhpbmcgYXMgYSBzaWxlbnRseSBmYWlsdXJlIGluIHRoZSBpbnRlcmZhY2Us
IGJlY2F1c2UKdGhlcmUgaXMgbm8gd2F5IHRvIGRpc3Rpbmd1aXNoIGFuIGVsaWRlZCB2YWx1ZSBm
cm9tIGEgcmVhbCB2YWx1ZSwgaW4KZWl0aGVyIGl0cyAiIiBvciAiPGRlbmllZD4iIGZvcm0uCgpX
aGF0ICIiIGdldHMgeW91IHRoYXQgbm90aGluZyBlbHNlIGRvZXMgaXMgc2Vuc2libGUgbG9va2lu
ZyBsb2dnaW5nIHdpdGgKbm8gZ3Vlc3QgY2hhbmdlcyBuZWNlc3NhcnkuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
