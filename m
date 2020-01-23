Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CE146B6D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:35:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iudW4-0002qI-Ul; Thu, 23 Jan 2020 14:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LOIr=3M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iudW3-0002qD-Ic
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 14:31:27 +0000
X-Inumbo-ID: 0917620c-3ded-11ea-be41-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0917620c-3ded-11ea-be41-12813bfff9fa;
 Thu, 23 Jan 2020 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579789886;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Xxwd7cgGsH/0bmscSx2dNB0w+gq5D6XEKYT5tpbfU7A=;
 b=hebhHbqaxdTAcjMjIlG4LK0M84YAmdwdWJGgsSV8m5Ge33PLXpfBdArn
 kLbqQ5GdVP1mM5L4gpaojv99YBF71KtMurfc2s0TJ/KR22F9SAQUCLvEJ
 +2AkU1VDfkL2hU9deU5qJ48REBcmajFtLin4Yk+pKciY+7HHeSoWf4xfD I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qfCU2KCBX9ODH8xvDdahnzCDeQUhwFqIBKOOpJVPtbxtfdTra+ZRMKCnh9CsEP1coyq6drJXMy
 5XdsiHgbF4L/0nk3QR4zj4jUds+8O/DQ/5ei0K65Yr7g5hwHxK9Ih44AXfVCuvUWyDuK5Jczlr
 gkeK44qiU+LN9+AFRhRC86i9IcfDiHAocmB4JzprSKN718+IHH16z9FXxD50Ombt3Ax4nGti2l
 FCeRpeVM4MdXbf8nzQSvc9dILtimE1WrdPA/2A1jKODBxvHep3VKDVB/3ei60exESDlUWKrh57
 vPU=
X-SBRS: 2.7
X-MesageID: 11321327
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11321327"
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
 <3fc57c86-f861-9a7b-a248-6c45824ab6f5@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <a218fdc2-98e5-d91e-51b0-981101c1d1c8@citrix.com>
Date: Thu, 23 Jan 2020 14:31:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3fc57c86-f861-9a7b-a248-6c45824ab6f5@citrix.com>
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMi8yMCAxMTo0NCBBTSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAyMi8wMS8yMDIw
IDEwOjU3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxLzIyLzIwIDEwOjE0IEFNLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIyLzAxLzIwMjAgMTA6MDEsIFNlcmdleSBE
eWFzbGkgd3JvdGU6Cj4+Pj4gT24gMjAvMDEvMjAyMCAxMDowMSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+Pj4+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+PiB2
MiAtLT4gdjM6Cj4+Pj4+PiAtIFJlbW92ZSBodm1sb2FkZXIgZmlsdGVyaW5nCj4+Pj4+Cj4+Pj4+
IFdoeT8gU2VlaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uLCBob3cgYWJvdXQgYWRkaW5nIFhFTlZF
Ul9kZW5pZWQgdG8KPj4+Pj4gcmV0dXJuIHRoZSAiZGVuaWVkIiBzdHJpbmcsIGFsbG93aW5nIGNv
bXBvbmVudHMgd2hpY2ggd2FudCB0byBmaWx0ZXIKPj4+Pj4gdG8ga25vdyBleGFjdGx5IHdoYXQg
dG8gbG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5nIHlvdQo+Pj4+PiBoYWQ/
IChUaGUgaGVscCB0ZXh0IG9mIHRoZSBjb25maWcgb3B0aW9uIHNob3VsZCB0aGVuIHBlcmhhcHMg
YmUKPj4+Pj4gZXh0ZW5kZWQgdG8gbWFrZSB2ZXJ5IGNsZWFyIHRoYXQgdGhlIGNob3NlbiBzdHJp
bmcgc2hvdWxkIG5vdCBtYXRjaAo+Pj4+PiBhbnl0aGluZyB0aGF0IGNvdWxkIHBvdGVudGlhbGx5
IGJlIHJldHVybmVkIGJ5IGFueSBvZiB0aGUgWEVOVkVSXwo+Pj4+PiBzdWItb3BzLikKPj4+Pgo+
Pj4+IEkgaGFkIHRoZSBmb2xsb3dpbmcgcmVhc29uaW5nOgo+Pj4+Cj4+Pj4gMS4gTW9zdCByZWFs
LXdvcmxkIHVzZXJzIHdvdWxkIHNldCBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkc9IiIgYW55d2F5
Lgo+Pj4+Cj4+Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29tcGxldGUg
c29sdXRpb24sIHNpbmNlIGRlbmllZAo+Pj4+IHN0cmluZyBsZWFrcyBlbHNld2hlcmUgdGhyb3Vn
aCB0aGUgaHlwZXJjYWxsIChQViBndWVzdHMsIHN5c2ZzLCBkcml2ZXIKPj4+PiBsb2dzKSBhcyBB
bmRyZXcgaGFzIHBvaW50ZWQgb3V0IGluIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLgo+Pj4+Cj4+
Pj4gT24gdGhlIG90aGVyIGhhbmQsIFNNQmlvcyBmaWx0ZXJpbmcgc2xpZ2h0bHkgaW1wcm92ZXMg
dGhlIHNpdHVhdGlvbiBmb3IKPj4+PiBIVk0gZG9tYWlucywgc28gSSBjYW4gcmV0dXJuIGl0IGlm
IG1haW50YWluZXJzIGZpbmQgaXQgd29ydGh5Lgo+Pj4KPj4+IFdoaWxlIEkgYW0gbm90IGEgbWFp
bnRhaW5lciBvZiB0aGlzIGNvZGUsIG15IGNvbmNlcm4gaXMgeW91IGltcG9zZSB0aGUKPj4+IGNv
bnZlcnNpb24gZnJvbSAiZGVuaWVkIiB0byAiIiB0byBhbGwgdGhlIHVzZXJzIChpbmNsdWRlIHRo
b3NlIHdobyB3YW50cwo+Pj4gdG8ga2VlcCAiZGVuaWVkIikuCj4+Pgo+Pj4gSWYgeW91IHdlcmUg
ZG9pbmcgYW55IGZpbHRlcmluZyBpbiBodm1sb2FkZXIsIHRoZW4gaXQgd291bGQgYmUgYmVzdCBp
Zgo+Pj4gdGhpcyBpcyBjb25maWd1cmFibGUuIEJ1dCB0aGlzIGlzIGEgYml0IHBvaW50bGVzcyBp
ZiB5b3UgYWxyZWFkeSBhbGxvdwo+Pj4gdGhlIHVzZXIgdG8gY29uZmlndXJlIHRoZSBzdHJpbmcg
YXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwgOikuCj4+Cj4+IFNvIHRoZXJlIGFyZSB0d28gdGhpbmdz
IHdlJ3JlIGNvbmNlcm5lZCBhYm91dDoKPj4gLSBTb21lIHBlb3BsZSBkb24ndCB3YW50IHRvIHNj
YXJlIHVzZXJzIHdpdGggYSAiPGRlbmllZD4iIHN0cmluZwo+PiAtIFNvbWUgcGVvcGxlIGRvbid0
IHdhbnQgdG8gInNpbGVudGx5IGZhaWwiIHdpdGggYSAiIiBzdHJpbmcKPj4KPj4gVGhlIGZhY3Qg
aXMsIGluICpib3RoIGNhc2VzKiwgdGhpcyBpcyBhIFVJIHByb2JsZW0uICBFVkVSWSBjYWxsZXIg
b2YKPj4gdGhpcyBpbnRlcmZhY2Ugc2hvdWxkIGZpZ3VyZSBvdXQgaW5kZXBlbmRlbnRseSB3aGF0
IGEgZ3JhY2VmdWwgd2F5IG9mCj4+IGhhbmRsaW5nIGZhaWx1cmUgaXMgZm9yIHRoZWlyIHRhcmdl
dCBVSS4gIEFueSBjYWxsZXIgd2hvIGRvZXMgbm90IHRoaW5rCj4+IGNhcmVmdWxseSBhYm91dCB3
aGF0IHRvIGRvIGluIHRoZSBmYWlsdXJlIGNhc2UgaXMgYnVnZ3kgLS0gd2hpY2gKPj4gaW5jbHVk
ZXMgZXZlcnkgc2luZ2xlIGNhbGxlciB0b2RheS4gIFRoZSBDT05GSUdfWFNNX0RFTklFRF9TVFJJ
TkcgaXMgYQo+PiBncm9zcyBoYWNrIGZhbGxiYWNrIGZvciBidWdneSBVSXMuCj4+Cj4+IE5vdywg
SSBkb24ndCBsaWtlIHRvIHRlbGwgb3RoZXIgcGVvcGxlIHRvIGRvIHdvcmssIGFuZCBJIGNlcnRh
aW5seSBkb24ndAo+PiBwbGFuIG9uIGZpeGluZyBodm1sb2FkZXIgYXQgdGhlIG1vbWVudCwgYmVj
YXVzZSBpdCdzIGxvdy1wcmlvcml0eSBmb3IKPj4gbWUuICBCdXQgSSBkbyB0aGluayB0aGF0IGhh
dmluZyBodm1sb2FkZXIgZGV0ZWN0IGZhaWx1cmUgYW5kIGV4cGxpY2l0bHkKPj4gbWFrZSBhIHNl
bnNpYmxlIGRlY2lzaW9uIGlzIHRoZSByaWdodCB0aGluZyB0byBkbywgcmVnYXJkbGVzcyBvZiB0
aGUKPj4gYXZhaWxhYmlsaXR5IG9mIENPTkZJR19YU01fREVOSUVEX1NUUklORyB0byB3b3JrIGFy
b3VuZCBidWdneSBjYWxsZXJzLgo+IAo+IEl0J3Mgbm90IGVudGlyZWx5IGNsZWFyIHRvIG1lIHdo
YXQgeW91IHN1Z2dlc3QgdG8gZG8gd2l0aCBodm1sb2FkZXIuCj4gQ291bGQgeW91IGVsYWJvcmF0
ZSBhIGJpdD8KCldlbGwsIGJhc2ljYWxseSAidGhpbmsgY2FyZWZ1bGx5IGFib3V0IHRoZSB1c2Vy
IGV4cGVyaWVuY2UgYW5kIGRlY2lkZQp3aGF0IHRvIGRvIi4gIEdpdmVuIHlvdXIgY29tbWVudCBp
biByZXNwb25zZSB0byBKdWxpZW4sIEkgd291bGQgdGhpbmsKdGhhdCB3b3VsZCBtZWFuIGNoZWNr
aW5nIGZvciBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkcgaW4gaHZtbG9hZGVyIGFuZApyZXBsYWNp
bmcgaXQgd2l0aCBub3RoaW5nIChvciBzb21lIG90aGVyIGluZGljYXRpb24gdGhhdCdzIG1vcmUK
dXNlci1mcmllbmRseSkuICBQZXJoYXBzIHJlLXN1Ym1pdHRpbmcgeW91ciBodm1sb2FkZXIgcGF0
Y2ggYXMgYQpmb2xsb3ctdXAgcGF0Y2guCgpCdXQgYXMgSSBzYWlkLCBpdCdzIGp1c3QgYSBzdWdn
ZXN0aW9uLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
