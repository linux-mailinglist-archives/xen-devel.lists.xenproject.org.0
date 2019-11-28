Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED610CA5B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:30:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKkY-0006LU-LP; Thu, 28 Nov 2019 14:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDnJ=ZU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iaKkX-0006LP-PU
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:26:29 +0000
X-Inumbo-ID: 10a7dbec-11eb-11ea-a3d2-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10a7dbec-11eb-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574951189;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bDGY3VU1LswCIN3f6s7TA9XQ9+uxxxrFC5UCUA8ZKro=;
 b=OgAtgcTGrrXHIs5+5V6cVSPcBR6O/OsDNaFTy+TTAfXJCXaehjhWIuwg
 gTt2wklfG2cEjttu3yGf/0Q72TjfHzcRIoZbB0PhochBQdsw39AGiZuaZ
 eQpaBVsGO24kkJtoCl2yhZvghZ3skghADaw4VLYv85yEnjUWhEhyMJH1j o=;
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
IronPort-SDR: OgS6TeUXJJKz3VH0Kz7JKlMWQfa7bRk9QMYNwy2h+sBieIft258OvvZPsN8USo4aKqhw4N1p9Y
 5KWMXFsgsa5hc2D8d8bCiKabmro8niOdEp/QmWNx8RdrxB90lWnwWbqM6yIe4ZJj0U01A0st6n
 iaJOuownRaeJ+kFvuhmOk7n515BQctnQro41btuplf++mJK8HWTZuCUkjN8CsbyO3lDTvC400d
 owAOzh/aCOvuk8a10isCLvZrAfkqEGtPTugooWw3TWSr1F/Z+ysrEFx/7HAX5mciNl64z12CCD
 lHA=
X-SBRS: 2.7
X-MesageID: 9081724
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9081724"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
 <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
 <a6682041-3a08-d003-27d3-8f7117300876@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <0c97c65b-cc9c-b958-134d-adc8b1e1ca14@citrix.com>
Date: Thu, 28 Nov 2019 14:26:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a6682041-3a08-d003-27d3-8f7117300876@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 WeiLiu <wl@xen.org>, KonradWilk <konrad.wilk@oracle.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjgvMTkgMToxMCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8xMS8yMDE5
IDEwOjE3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gTm92IDI4LCAyMDE5LCBhdCA5OjU1
IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4gSGFzIGFu
eW9uZSBhY3R1YWxseSB0cmllZCBidWlsZGluZyBhIGxpdmVwYXRjaCB3aXRoIHRoaXMgY2hhbmdl
IGluIHBsYWNlPwo+Pj4+PiBBY3R1YWxseSAtIHdoYXQgaXMgeW91ciBjb25jZXJuIGhlcmU/IFRo
ZSBleGFjdCBzcGVsbGluZyBvZiBzeW1ib2xzCj4+Pj4+IG5hbWVzIHNob3VsZCBiZSBvZiBubyBp
bnRlcmVzdCB0byB0aGUgdG9vbC4gQWZ0ZXIgYWxsIHRoZSBjb21waWxlciBpcwo+Pj4+PiBmcmVl
IHRvIGludmVudCBhbGwgc29ydHMgb2YgbmFtZXMgZm9yIGl0cyBsb2NhbCBzeW1ib2xzLCBpbmNs
dWRpbmcKPj4+Pj4gdGhlIG9uZXMgd2Ugd291bGQgcHJvZHVjZSB3aXRoIHRoaXMgY2hhbmdlIGlu
IHBsYWNlLiBBbGwgdGhlIHRvb2wKPj4+Pj4gY2FyZXMgYWJvdXQgaXMgdGhhdCB0aGUgbmFtZXMg
YmUgdW5hbWJpZ3VvdXMuIEhlbmNlIGFueSAodGhlb3JldGljYWwpCj4+Pj4+IHJlZ3Jlc3Npb24g
aGVyZSB3b3VsZCBiZSBhIGJ1ZyBpbiB0aGUgdG9vbHMsIHdoaWNoIGltbyBpcyBubyByZWFzb24K
Pj4+Pj4gdG8gZGVsYXkgdGhpcyBjaGFuZ2UgYW55IGZ1cnRoZXIuIChHcmFudGVkIEkgc2hvdWxk
IGhhdmUgZ290IHRvIGl0Cj4+Pj4+IGVhcmxpZXIsIGJ1dCBpdCBoYWQgYmVlbiBjb250aW51aW5n
IHRvIGdldCBkZWZlcnJlZC4pCj4+Pj4gVGhpcyBtaWdodCBhbGwgYmUgdHJ1ZSAodGhlb3JldGlj
YWxseSkuCj4+Pj4KPj4+PiBUaGUgbGl2ZXBhdGNoIGJ1aWxkIHRvb2xzIGFyZSBmcmFnaWxlIGFu
ZCB2ZXJ5IHNlbnNpdGl2ZSB0byBob3cgdGhlCj4+Pj4gb2JqZWN0IGZpbGVzIGFyZSBsYWlkIG91
dC4gIFRoZXJlIGlzIGEgdmVyeSByZWFsIHJpc2sgdGhhdCB0aGlzIGNoYW5nZQo+Pj4+IGFjY2lk
ZW50YWxseSBicmVha3MgbGl2ZXBhdGNoaW5nIHRvdGFsbHksIGV2ZW4gb24gR0NDIGJ1aWxkcy4K
Pj4+Pgo+Pj4+IFdlcmUgdGhpcyB0byBoYXBwZW4sIGl0IHdvdWxkIGJlIHlldCBhbm90aGVyIDQu
MTMgcmVncmVzc2lvbi4KPj4+IEl0J3MgcGVyaGFwcyBhIG1hdHRlciBvZiBwZXJjZXB0aW9uLCBi
dXQgSSdkIHN0aWxsIGNhbGwgdGhpcyBhCj4+PiBsaXZlIHBhdGNoaW5nIHRvb2xzIGJ1ZyB0aGVu
LCBub3QgYSA0LjEzIHJlZ3Jlc3Npb24uCj4+IEFmdGVyIHRoZSBkaXNjdXNzaW9uIHllc3RlcmRh
eSwgSSB3YXMgdGhpbmtpbmcgYSBiaXQgbW9yZSBhYm91dCB0aGlzLCBhbmQgSeKAmW0gbm90IGhh
cHB5IHdpdGggdGhlIHByaW5jaXBsZSBBbmR5IHNlZW1zIHRvIGJlIG9wZXJhdGluZyBvbiwKPiAK
PiBJJ20gc29ycnkgdGhhdCB5b3UgZmVlbCB0aGF0IHdheS4KPiAKPj4gdGhhdCBpdOKAmXMgcmVh
c29uYWJsZSB0byBjb21wbGV0ZWx5IGJsb2NrIGEgYnVnLWZpeGluZyBwYXRjaCB0byBYZW4sIGZv
cmNpbmcgYSB3b3JrLWFyb3VuZCB0byBiZSB1c2VkIGluIGEgcmVsZWFzZSwgYmVjYXVzZSBpdCBo
YXMgdW5rbm93biBlZmZlY3RzIG9uIGxpdmVwYXRjaGluZy4KPiAKPiBUaGlzIGlzIG5vdCBhIGZh
aXIgY2hhcmFjdGVyaXNhdGlvbiBvZiB3aGF0IGlzIGdvaW5nIG9uIGhlcmUuwqAgSWdub3JlCj4g
dGhlIHNwZWNpZmljcyBvZiB0aGlzIHBhdGNoIC0gdGhleSBhcmUgbm90IHJlbGV2YW50IHRvIG15
IG9iamVjdGlvbi4KPiAKPiBBcyBhIG1haW50YWluZXIsIGl0IGlzIG15IHJlc3BvbnNpYmlsaXR5
IHRvIGVuc3VyZSB0aGF0IGNyYXAgZG9lc24ndCBnZXQKPiBjb21taXR0ZWQuCgpKYW4ncyBwYXRj
aCBpcyBub3QgY3JhcDsgdGhpcyBpcyBvdXQgb2YgbGluZS4KCj4+IEFuZCBJIGRvIG5vdCBjb25z
aWRlciBpdCBteSByZXNwb25zaWJpbGl0eSB0bwo+PiBkbyByZWdyZXNzaW9uIHRlc3RzIG9mIHRo
ZSBsaXZlIHBhdGNoaW5nIHRvb2xzLgo+IAo+IFllcy7CoCBZZXMgaXQgcmVhbGx5IGlzLCB3aGVu
IHlvdSdyZSBtYWtpbmcgYSBtYXRlcmlhbCBjaGFuZ2UKPiBzcGVjaWZpY2FsbHkgdG8gdGhpcyBh
cmVhLCB3aXRoIGEgaGlnaCBjaGFuY2Ugb2YgYWR2ZXJzZSBpbXBhY3QuCgpUaGVuIGl0IGxvb2tz
IGxpa2Ugd2UgbmVlZCB0byBoYXZlIGEgd2lkZXIgZGlzY3Vzc2lvbiBhYm91dCB0aGlzLApiZWNh
dXNlIG15IGFuc3dlciBpcywgIk5vLCBub3QgaXQncyByZWFsbHkgbm90LiIKCkFuZCBJIGRvbid0
IHRoaW5rIHlvdSB3b3VsZCB0aGluayBzbyBlaXRoZXIsIGV4Y2VwdCB0aGF0IHlvdSBoYXBwZW4g
dG8KdXNlIGxpdmVwYXRjaGluZy4gIEltYWdpbmUgaWYgeW91IHBvc3RlZCBhIHBhdGNoIHRyeWlu
ZyB0byBmaXggbmVzdGVkCkhWTSwgYW5kIG91dCBvZiB0aGUgYmx1ZSBPbGFmIHR1cm5lZCB1cCBh
bmQgc2FpZCwgIkhhdmUgeW91IHRlc3RlZCB0aGlzCndpdGggaHlwZXJ2aXNvciBwYWdpbmc/IiAg
QW5kIHdoZW4geW91IHNhaWQsICJObywgSSBoYXZlIG5vIGlkZWEgaG93IHRvCnRlc3QgdGhhdCIs
IEphbiBzaW1wbHkgYmxvY2tlZCB0aGUgcGF0Y2ggaW5kZWZpbml0ZWx5PyAgWW91IHdvdWxkIGJl
CmFuZ3J5LCBhbmQgcmlnaHRseSBzby4KCkFzIGEgZ2VuZXJhbCBwcmluY2lwbGUsIHRoZSBjb3N0
IG9mIGZlYXR1cmVzIHNob3VsZCBiZSBib3JuZSBieSB0aGUKcGVvcGxlIHdobyB1c2UgdGhlbS4g
IFRoYXQgaW5jbHVkZXMgdGhlIGNvc3Qgb2YgZGV0ZXJtaW5pbmcKYXV0aG9yaXRhdGl2ZWx5IHdo
ZXRoZXIgYSBjaGFuZ2UgaXMgc2FmZSBvciBub3QgLS0gZWl0aGVyIGJ5IHJldmlldywgb3IKYnkg
ZG9pbmcgbWFudWFsIHRlc3RpbmcsIG9yIGJ5IGhhdmluZyBhdXRvbWF0ZWQgdGVzdHMgaW4gcGxh
Y2UgdG8gZmxhZwp1cCBpc3N1ZXMuCgpJZiB5b3UgaGFkIHF1ZXN0aW9ucyBhYm91dCB0aGUgcGF0
Y2gsICp5b3UqLCB3aXRoIHlvdXIgZGV2ZWxvcGVyIGhhdCBvbiwKc2hvdWxkIGhhdmUgZWl0aGVy
IGRvbmUgdGVzdGluZywgb3IgYXJyYW5nZWQgZm9yIHNvbWVvbmUgd2hvIHVzZXMgaXQKcmVndWxh
cmx5IHRvIGRvIHRlc3RpbmcgdG8gbWFrZSBzdXJlIGl0IHdvcmtzLgoKIC1HZW9yZ2UKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
