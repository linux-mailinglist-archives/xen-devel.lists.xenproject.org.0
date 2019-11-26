Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F5B109E05
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:34:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZa0j-0006G9-Tr; Tue, 26 Nov 2019 12:32:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kHA=ZS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iZa0i-0006G1-HO
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:32:04 +0000
X-Inumbo-ID: bfe05c82-1048-11ea-b155-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfe05c82-1048-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574771523;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lH8B/qWK+xQmjo4WcHnKiq8s5v51wo9hXeNBgqi+BNY=;
 b=ZFgsUr52d4vZz0968zkLsazbJmdpOlBvQhJxOzelr9Mz19wsj19DeLvU
 yK9Netd2yqml7DokHEQdfZtzFXmDdKBalSu9dcCkrJUXYbya4X6BWdT8P
 zGQ2lOpixmDuBTpdYxK1R5TTeDZ/9OVh53Pa7ExJPjCWo09owrBC599KJ s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KAaHpfZPZGbIPW55ZHxcbvv3hGzDcTV4S2+vO2yAQqG1/lyVsgnMQslLhEV7wVjVNw29L5+mb/
 dkUP7Y9hDAimPXehs6iideSfrOfsOV/YYWXXwfg+XoQGuGqFOoFOIiGS/J97iLF6ok7gxL3w7/
 V/RE3PX58bLfZgnaFm0IQoEuDLvx4YQOGFWaCSA60BJC7vEBFZo0cyCF++ZYv36HYao3X2B444
 tfQp+9ZueWLSKcQBwhhhf/xd8TxIjtd6F0J3UgW7p0esKD6KBtJLWtfLsHGA2IQNSMScZztDIr
 WGs=
X-SBRS: 2.7
X-MesageID: 9255181
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9255181"
To: Paul Durrant <pdurrant@gmail.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191113135330.1209-1-pdurrant@amazon.com>
 <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <cce5aa9a-6d3d-49ac-b633-21eaa1fcbd69@citrix.com>
Date: Tue, 26 Nov 2019 12:31:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjYvMTkgMTE6MzAgQU0sIFBhdWwgRHVycmFudCB3cm90ZToKPiBPbiBXZWQsIDEzIE5v
diAyMDE5IGF0IDEzOjU1LCBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+IHdyb3Rl
Ogo+Pgo+PiAuLi53aGVuIHRoZWlyIHZhbHVlcyBhcmUgbGFyZ2VyIHRoYW4gdGhlIHBlci1kb21h
aW4gY29uZmlndXJlZCBsaW1pdHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4gLS0tCj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+PiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBl
dS5jaXRyaXguY29tPgo+PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IENjOiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+PiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4KPj4gQWZ0ZXIgbWlu
aW5nIHRocm91Z2ggY29tbWl0cyBpdCBpcyBzdGlsbCB1bmNsZWFyIHRvIG1lIGV4YWN0bHkgd2hl
biBYZW4KPj4gc3RvcHBlZCBob25vdXJpbmcgdGhlIGdsb2JhbCB2YWx1ZXMsIGJ1dCBJIHJlYWxs
eSB0aGluayB0aGlzIGNvbW1pdCBzaG91bGQKPj4gYmUgYmFjay1wb3J0ZWQgdG8gc3RhYmxlIHRy
ZWVzIGFzIGl0IHdhcyBhIGJlaGF2aW91cmFsIGNoYW5nZSB0aGF0IGNhbgo+PiBjYXVzZSBkb21V
cyB0byBmYWlsIGluIG5vbi1vYnZpb3VzIHdheXMuCj4gCj4gQW55IG90aGVyIG9waW5pb25zIG9u
IHRoaXM/IEFGQUlDVCBxdWVzdGlvbnMgaXMgc3RpbGwgb3BlbjoKPiAKPiAtIERvIHdlIGNvbnNp
ZGVyIG5vdCBob25vdXJpbmcgdGhlIGNvbW1hbmQgbGluZSB2YWx1ZXMgdG8gYmUgYQo+IHJlZ3Jl
c3Npb24gKHNpbmNlIGRvbVVzIHRoYXQgd291bGQgaGF2ZSB3b3JrZWQgYmVmb3JlIHdpbGwgbm8g
bG9uZ2VyCj4gd29yayBhZnRlciBhIGJhc2ljIHVwZ3JhZGUgb2YgWGVuKT8KClRoaXMgd291bGQg
YmUgYSBiaXQgZWFzaWVyIHRvIGZvcm0gYSAicG9saWN5IiBvcGluaW9uIG9uIChvciBwZXJoYXBz
CmFsdGVybmF0ZSBzb2x1dGlvbnMgdG8pIGlmIG1vcmUgb2YgdGhlIHNpdHVhdGlvbiB3ZXJlIG91
dGxpbmVkIGhlcmUuCgpJcyB0aGUgcHJvYmxlbSB0aGF0IHRoZSBwZXItZG9tYWluIGNvbmZpZyBp
cyBhbHdheXMgc2V0LCBhbmQgZG9lc24ndAp0YWtlIHRoZSBoeXBlcnZpc29yLXNldCBjb25maWcg
aW50byBhY2NvdW50PyAgV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvCm1vZGlmeSB0aGUgdG9vbHN0
YWNrIHRvIHVzZSB0aGUgaHlwZXJ2aXNvciB2YWx1ZSBpZiBpdCdzIG5vdCBzZXQ/CgpJbiBmYWN0
LCBpdCBsb29rcyBraW5kIG9mIGxpa2UgdGhpbmdzIGFyZSBzY3Jld2VkIHVwIGFueXdheSAtLSB0
aGUKImRlZmF1bHQiIHZhbHVlIG9mIG1heF9ncmFudF9mcmFtZXMsIGlmIG5vIHZhbHVlIGlzIHNw
ZWNpZmllZCwgaXMgc2V0IGluCnhsLmMuICBJZiB0aGF0IHdlcmUgdGhlIGJlaGF2aW9yIHdlIHdh
bnRlZCwgaXQgc2hvdWxkIGJlIHNldCBpbiBsaWJ4bC5jLgoKQnV0IGl0IGRvZXNuJ3Qgc2VlbSBs
aWtlIGl0IHNob3VsZCBiZSB0ZXJyaWJseSBkaWZmaWN1bHQgdG8gZ2V0IGEgInVzZQp0aGUgZGVm
YXVsdCIgc2VudGluZWwgdmFsdWUgcGFzc2VkIGluIHRvIFhlbiwgc3VjaCB0aGF0OgoKMS4gUGVv
cGxlIHdobyBkb24ndCBkbyBhbnl0aGluZyB3aWxsIGdldCB0aGUgZGVmYXVsdCBjdXJyZW50bHkg
c3BlY2lmaWVkCmluIHhsLmMKCjIuIFBlb3BsZSB3aG8gc2V0IHRoZSB2YWx1ZSBvbiB0aGUgWGVu
IGNvbW1hbmQtbGluZSBhbmQgZG9uJ3Qgc2V0CmFueXRoaW5nIGluIHRoZSBndWVzdCBjb25maWcg
ZmlsZSB3aWxsIGdldCB0aGUgWGVuIGNvbW1hbmQtbGluZSB2YWx1ZQoKMy4gUGVvcGxlIHdobyBz
ZXQgdGhlIHZhbHVlIGluIHRoZSBjb25maWcgZmlsZSB3aWxsIGdldCB0aGUgdmFsdWUgdGhleQpz
cGVjaWZpZWQgKHJlZ2FyZGxlc3Mgb2YgdGhlIGdsb2JhbCBzZXR0aW5nKS4KCklzIHRoYXQgdGhl
IGJlaGF2aW91ciB5b3UnZCBsaWtlIHRvIHNlZSwgUGF1bD8KCiAtR2VvcmdlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
