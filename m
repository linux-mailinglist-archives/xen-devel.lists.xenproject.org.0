Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB8C146C46
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:05:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iudzy-0005qA-Ka; Thu, 23 Jan 2020 15:02:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LOIr=3M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iudzx-0005q5-Av
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 15:02:21 +0000
X-Inumbo-ID: 5528026a-3df1-11ea-8e9a-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5528026a-3df1-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579791732;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=29qJwGuzJFBY3kkAT4zRSlCCzOm3Sb+u7cOdtEIPivQ=;
 b=ZGlLgiHV7Qd2NpBWyp4T2cplIabraVYyX5OhqfwCofK9MsETdKAswlhV
 hifXJbvSEzxW4EJbzsmqAihy3SMWos3y5TWqpHsrGtEm4CpfKWK2BARXe
 3tp9boE1LB1hvxA2CZ1dBrERPnkj9UnPIecuOjcPemnAVzXFmQQx5DjVF w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KM3ruguUAedeoOtPQAJXcAt4c/vdVi9RkWHCh7EkeOFy4fcReanB9S9Yy/yfVue65wTLNw3dZK
 CkhkiJBtnWXSFR60ycUmtmiBqGuJNrSiHmAkHMZTDDlVTc0nJkRe6kOM/BXBvmtS1ss/R5eaeL
 s9XOtgbhcCk5jBtKXzIIsfEmRYLmRjIx9Z1wXymEzmL3f8YHPXa2i7E4DPYO63G79sp8UQChk+
 slhf3NqESHCjG2GeeksPJVuPj5sMoE70JnbVoqJQSoHPyXZPSvqhmIQhGDeSKdrNxMBSjljf9D
 DsM=
X-SBRS: 2.7
X-MesageID: 11505672
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11505672"
To: Julien Grall <julien@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
 <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
 <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
 <01b8360a-803b-e409-0ced-9f6cf75ba609@xen.org>
 <4afebff2-2239-44f8-ae82-7264595eda70@citrix.com>
 <33b7d973-d9ee-d13d-c82d-8edf242d03eb@xen.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <a09dded1-e004-3eed-35dc-f6851d4d0971@citrix.com>
Date: Thu, 23 Jan 2020 15:02:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <33b7d973-d9ee-d13d-c82d-8edf242d03eb@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMy8yMCAyOjUyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjMv
MDEvMjAyMCAxNDo0NSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMS8yMy8yMCAyOjQyIFBN
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAyMy8wMS8yMDIwIDExOjMy
LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+IE9uIDIyLzAxLzIwMjAgMTE6MjUsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMjIvMDEvMjAyMCAxMToxOSwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+Pj4+IE9uIDIyLzAxLzIwMjAgMTA6MTQsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMjIvMDEvMjAyMCAxMDowMSwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+Pj4+Pj4gT24gMjAvMDEvMjAyMCAxMDowMSwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+Pj4+Pj4+IHYyIC0tPiB2MzoKPj4+Pj4+Pj4+PiAtIFJlbW92ZSBodm1sb2FkZXIgZmls
dGVyaW5nCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1c3Np
b24sIGhvdyBhYm91dCBhZGRpbmcKPj4+Pj4+Pj4+IFhFTlZFUl9kZW5pZWQgdG8KPj4+Pj4+Pj4+
IHJldHVybiB0aGUgImRlbmllZCIgc3RyaW5nLCBhbGxvd2luZyBjb21wb25lbnRzIHdoaWNoIHdh
bnQgdG8KPj4+Pj4+Pj4+IGZpbHRlcgo+Pj4+Pj4+Pj4gdG8ga25vdyBleGFjdGx5IHdoYXQgdG8g
bG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5nCj4+Pj4+Pj4+PiB5b3UKPj4+
Pj4+Pj4+IGhhZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hvdWxkIHRo
ZW4gcGVyaGFwcyBiZQo+Pj4+Pj4+Pj4gZXh0ZW5kZWQgdG8gbWFrZSB2ZXJ5IGNsZWFyIHRoYXQg
dGhlIGNob3NlbiBzdHJpbmcgc2hvdWxkIG5vdAo+Pj4+Pj4+Pj4gbWF0Y2gKPj4+Pj4+Pj4+IGFu
eXRoaW5nIHRoYXQgY291bGQgcG90ZW50aWFsbHkgYmUgcmV0dXJuZWQgYnkgYW55IG9mIHRoZSBY
RU5WRVJfCj4+Pj4+Pj4+PiBzdWItb3BzLikKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSBoYWQgdGhlIGZv
bGxvd2luZyByZWFzb25pbmc6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDEuIE1vc3QgcmVhbC13b3JsZCB1
c2VycyB3b3VsZCBzZXQgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HPSIiCj4+Pj4+Pj4+IGFueXdh
eS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEg
Y29tcGxldGUgc29sdXRpb24sIHNpbmNlIGRlbmllZAo+Pj4+Pj4+PiBzdHJpbmcgbGVha3MgZWxz
ZXdoZXJlIHRocm91Z2ggdGhlIGh5cGVyY2FsbCAoUFYgZ3Vlc3RzLCBzeXNmcywKPj4+Pj4+Pj4g
ZHJpdmVyCj4+Pj4+Pj4+IGxvZ3MpIGFzIEFuZHJldyBoYXMgcG9pbnRlZCBvdXQgaW4gdGhlIHBy
ZXZpb3VzIGRpc2N1c3Npb24uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIHRoZSBvdGhlciBoYW5kLCBT
TUJpb3MgZmlsdGVyaW5nIHNsaWdodGx5IGltcHJvdmVzIHRoZQo+Pj4+Pj4+PiBzaXR1YXRpb24g
Zm9yCj4+Pj4+Pj4+IEhWTSBkb21haW5zLCBzbyBJIGNhbiByZXR1cm4gaXQgaWYgbWFpbnRhaW5l
cnMgZmluZCBpdCB3b3J0aHkuCj4+Pj4+Pj4KPj4+Pj4+PiBXaGlsZSBJIGFtIG5vdCBhIG1haW50
YWluZXIgb2YgdGhpcyBjb2RlLCBteSBjb25jZXJuIGlzIHlvdSBpbXBvc2UKPj4+Pj4+PiB0aGUg
Y29udmVyc2lvbiBmcm9tICJkZW5pZWQiIHRvICIiIHRvIGFsbCB0aGUgdXNlcnMgKGluY2x1ZGUg
dGhvc2UKPj4+Pj4+PiB3aG8gd2FudHMgdG8ga2VlcCAiZGVuaWVkIikuCj4+Pj4+Pgo+Pj4+Pj4g
VGhpcyBpcyBub3Qgd2hhdCdzIGhhcHBlbmluZyBoZXJlOiB0aGUgZGVmYXVsdCBpcyBzdGlsbCAi
PGRlbmllZD4iCj4+Pj4+PiAoYXMKPj4+Pj4+IHBlciBwYXRjaCAxKTsgYnV0IHBhdGNoIDIgbWFr
ZXMgWEVOVkVSX2V4dHJhdmVyc2lvbiwKPj4+Pj4+IFhFTlZFUl9jb21waWxlX2luZm8KPj4+Pj4+
IGFuZCBYRU5WRVJfY2hhbmdlc2V0IHRvIHJldHVybiAiPGRlbmllZD4iIGluc3RlYWQgb2YgdGhl
IHJlYWwgdmFsdWVzCj4+Pj4+PiB3aGljaCBjYXVzZXMgdGhlIFVJIC8gbG9ncyBpc3N1ZXMuCj4+
Pj4+Cj4+Pj4+IEkgd2FzIHJlZmVycmluZyB0aGUgU01CaW9zIGZpbHRlcmluZy4uLiBJIGRvbid0
IHRoaW5rIGRvaW5nIGEgYmxhbmsKPj4+Pj4gZmlsdGVyaW5nIGlzIHRoZSByaWdodCB0aGluZyB0
byBkbyBpbiB0aGUgaHZtbG9hZGVyIGZvciB0aGUgcmVhc29uCj4+Pj4+IGV4cGxhaW5lZCBhYm92
ZS4KPj4+Pgo+Pj4+IEFwb2xvZ2llcyBmb3IgbWlzdW5kZXJzdGFuZGluZyB0aGUgY29udGV4dC4g
QnV0IEkgZGlzYWdyZWUgYWJvdXQKPj4+PiBodm1sb2FkZXIuIFJldHVybmluZyAiZGVuaWVkIiBm
cm9tIHhlbl92ZXJzaW9uIGh5cGVyY2FsbCB0byBndWVzdHMgaXMKPj4+PiBvbmUgdGhpbmcsIGJ1
dCBodm1sb2FkZXIgYW5kIFNNQmlvcyB0YWJsZXMgYXJlIHBhcnRzIG9mIHRoZSBoeXBlcnZpc29y
Cj4+Pj4gYW5kIHB1dHRpbmcgImRlbmllZCIgdGhlcmUgaXMgc2ltcGx5IGEgdGVycmlibGUgdXNl
ciBleHBlcmllbmNlLgo+Pj4KPj4+IEkgYW0gbm90IGdvaW5nIHRvIGNvbW1lbnQgb24gdGhlIHVz
ZXIgZXhwZXJpZW5jZSBiZWNhdXNlIHRoaXMgaXMgdXAgdG8KPj4+IGFub3RoZXIgYmlrZXNoZWRk
aW5nLiBUaGUgcXVlc3Rpb24gaXMgd2hpY2ggc3RyaW5nIHdpbGwgeW91IHVzZT8gV2h5IGFuCj4+
PiBlbXB0eSBzdHJpbmcgb3ZlciBzb21ldGhpbmcgZGlmZmVyZW50Pwo+Pj4KPj4+IEhvd2V2ZXIs
IGlmIGFuIGFkbWluIGhhcyBjb250cm9sIG92ZXIgdGhlICJkZW55IiBzdHJpbmcsIHdoeSB3b3Vs
ZCBoZQo+Pj4gZXZlciB3YW50IHRvIGZpbHRlciBpdCBpbiBodm1sb2FkZXI/IFdoeSBjYW4ndCBo
ZSBqdXN0IHJlcGxhY2UgdGhlIG9uZQo+Pj4gaW4gS2NvbmZpZz8KPj4KPj4gTW9zdCBhZG1pbnMg
ZG9uJ3QgY29tcGlsZSB0aGVpciBvd24gdmVyc2lvbiBvZiBYZW4uLi4KPiAKPiBUaG9zZSBhZG1p
bnMgYXJlIGFsc28gdW5saWtlbHkgZ29pbmcgdG8gYnVpbGQgdGhlcmUgb3duIGh2bWxvYWRlciwg
cmlnaHQ/Cj4gCj4gVGhlcmVmb3JlLCB0aGV5IHdpbGwgaGF2ZSB0byBhY2NlcHQgd2hhdGV2ZXIg
c3RyaW5nIGlzIHJlcG9ydGVkIGJ5Cj4gSFZNTG9hZGVyIChvciBYZW4pLiBBcyB5b3UgYWxyZWFk
eSBhbGxvdyBYZW4gdG8gY29uZmlndXJlIGl0LCB3aHkgd291bGQKPiB0aGF0IGJlIGEgcHJvYmxl
bSB0byBjaGFuZ2UgdGhlIG9uZSBpbiBLY29uZmlnPyBXaHkgZG8geW91IG5lZWQgdG8gZml4Cj4g
aXQgdXAgaW4gaHZtbG9hZGVyIGFzIHdlbGw/CgpSaWdodCwgdGhlIGlkZWEgd2FzIHBlcmhhcHMg
YXMgdXBzdHJlYW0sIHdlIHNob3VsZCBtb2RpZnkgaHZtbG9hZGVyIHRvCiphbHdheXMqIHJlcGxh
Y2UgIjxkZW5pZWQ+IiB3aXRoICIiLiAgKE9yIHBvdGVudGlhbGx5IHdpdGggYSBtb3JlIGJlbmln
bgpzdHJpbmcsIGxpa2UgImh5cGVydmlzb3IgYnVpbGQgdW5rbm93biIuKQoKIC1HZW9yZ2UKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
