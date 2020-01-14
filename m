Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FA13B0E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:29:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPyU-0001O3-8m; Tue, 14 Jan 2020 17:27:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZ5I=3D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irPyS-0001Nw-6R
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:27:28 +0000
X-Inumbo-ID: 213b3dbf-36f3-11ea-8410-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 213b3dbf-36f3-11ea-8410-12813bfff9fa;
 Tue, 14 Jan 2020 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579022845;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=u7ILOPmncgatWOfBXBSmaLR4tA0sewoEQmY6nuyWavY=;
 b=LBSB2kd3CdAzeCK1S1F43AP2p7f1GukN15yjQAzK2zLufVFPysYDms8Q
 C0o2T1Aahp+PEXHu90xF2tbmCqKGLgbwz1p2B5J/tn60INhbav2A46eIz
 O9VZmsOekRvhb18taymcwKwCNBckhngtSz+kUaOSQD+1/5ZegNcAJ0bAc c=;
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
IronPort-SDR: eh99kvKiounF+EHQCRaqDfDbUe+eKpK0t+Qn8WTx2peTM7rWBaKSJFUUl+AZtz/fzCcqifsQRn
 Zod6m5CAoFLL8uOqHBMZh6weEBzu/X8pkLwvkTkCnANxQTHuNfAOXUEHjf1R6MJs6YqWYaUASP
 bdGDq5bOk6SfRgyyQeL46qotDA+hI2iL6Z+YzKY1fF08ixE50jmFZWlhCfbLDb9rCqdB9EcOzW
 M0uoF9UVmNR2pwgjlxxVp0d791jdxE5ZVmtAt1vc1Aps5AKK0oF6bbWY2ICZV73eqC7ebudtLH
 G1w=
X-SBRS: 2.7
X-MesageID: 11333337
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11333337"
To: Jan Beulich <jbeulich@suse.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-6-andrew.cooper3@citrix.com>
 <c8b1dd46-5873-aec8-de72-402aa74727f2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6e708726-9769-f8a0-340d-5c2a739ae4ca@citrix.com>
Date: Tue, 14 Jan 2020 17:27:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c8b1dd46-5873-aec8-de72-402aa74727f2@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/4] x86/boot: Size the boot/directmap
 mappings dynamically
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDEvMjAyMCAxNzowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMDEuMjAyMCAx
ODo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVh
ZC5TCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+PiBAQCAtNjg3LDE0ICs2ODcs
MTkgQEAgdHJhbXBvbGluZV9zZXR1cDoKPj4gICAgICAgICAgICogaGFuZGxpbmcvd2Fsa2luZyks
IGFuZCBpZGVudGl0eSBtYXAgWGVuIGludG8gYm9vdG1hcCAobmVlZGVkIGZvcgo+PiAgICAgICAg
ICAgKiB0aGUgdHJhbnNpdGlvbiBpbnRvIGxvbmcgbW9kZSksIHVzaW5nIDJNIHN1cGVycGFnZXMu
Cj4+ICAgICAgICAgICAqLwo+PiAtICAgICAgICBsZWEgICAgIHN5bV9lc2koc3RhcnQpLCVlYngK
Pj4gLSAgICAgICAgbGVhICAgICAoMTw8TDJfUEFHRVRBQkxFX1NISUZUKSo3KyhQQUdFX0hZUEVS
VklTT1JfUldYfF9QQUdFX1BTRSkoJWVieCksJWVheAo+PiAtICAgICAgICBzaHIgICAgICQoTDJf
UEFHRVRBQkxFX1NISUZULTMpLCVlYngKPj4gLSAgICAgICAgbW92ICAgICAkOCwlZWN4Cj4+IC0x
OiAgICAgIG1vdiAgICAgJWVheCxzeW1fZnMobDJfYm9vdG1hcCktOCglZWJ4LCVlY3gsOCkKPj4g
LSAgICAgICAgbW92ICAgICAlZWF4LHN5bV9mcyhsMl9kaXJlY3RtYXApLTgoJWVieCwlZWN4LDgp
Cj4+IC0gICAgICAgIHN1YiAgICAgJCgxPDxMMl9QQUdFVEFCTEVfU0hJRlQpLCVlYXgKPj4gLSAg
ICAgICAgbG9vcCAgICAxYgo+PiArICAgICAgICBsZWEgICAgIHN5bV9lc2koX3N0YXJ0KSwgJWVj
eAo+PiArICAgICAgICBsZWEgICAgIC0xICsgc3ltX2VzaShfZW5kKSwgJWVkeAo+IFRoaXMgbG9v
a3MgcHJldHR5IG9kZCAtIGRvZXMKPgo+ICAgICAgICAgbGVhICAgICBzeW1fZXNpKF9lbmQpIC0g
MSwgJWVkeAo+Cj4gbm90IHdvcms/CgpObzoKCmhlYWQuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgpo
ZWFkLlM6NTIxOiBFcnJvcjoganVuayBgKCVlc2kpLTEnIGFmdGVyIGV4cHJlc3Npb24KCmJ1dCBp
dCBpcyBub3QgYXQgYWxsIHN1cnByaXNpbmcgd2hlbiB5b3UgZXhwYW5kIHRoZSBtYWNybzoKCmxl
YSAoX2VuZCAtIHN0YXJ0KSglZXNpKSAtIDEsICVlZHgKClRoZSBleHByZXNzaW9uIGZvciB0aGUg
ZGlzcGxhY2VtZW50IGVuZHMgdXAgc3BsaXQgYWNyb3NzIGJvdGggc2lkZXMgb2YKdGhlIFNJQi4K
Cj4KPj4gKyAgICAgICAgbGVhICAgICBfUEFHRV9QU0UgKyBQQUdFX0hZUEVSVklTT1JfUldYKCVl
Y3gpLCAlZWF4IC8qIFBURSB0byB3cml0ZS4gKi8KPj4gKyAgICAgICAgc2hyICAgICAkTDJfUEFH
RVRBQkxFX1NISUZULCAlZWN4ICAgICAgICAgICAgICAgICAgIC8qIEZpcnN0IHNsb3QgdG8gd3Jp
dGUuICovCj4+ICsgICAgICAgIHNociAgICAgJEwyX1BBR0VUQUJMRV9TSElGVCwgJWVkeCAgICAg
ICAgICAgICAgICAgICAvKiBGaW5hbCBzbG90IHRvIHdyaXRlLiAqLwo+PiArCj4+ICsxOiAgICAg
IG1vdiAgICAgJWVheCwgc3ltX29mZnMobDJfYm9vdG1hcCkgICglZXNpLCAlZWN4LCA4KQo+PiAr
ICAgICAgICBtb3YgICAgICVlYXgsIHN5bV9vZmZzKGwyX2RpcmVjdG1hcCkoJWVzaSwgJWVjeCwg
OCkKPiBJIGd1ZXNzIEkgY291bGQgaGF2ZSBub3RpY2VkIHRoaXMgb24gdGhlIHByZXZpb3VzIHBh
dGNoIGFscmVhZHk6Cj4gVGhpcyB3b3VsZCBsb29rIGJldHRlciBhcwo+Cj4gMTogICAgICBtb3Yg
ICAgICVlYXgsIHN5bV9lc2kobDJfYm9vdG1hcCwgICAlZWN4LCA4KQo+ICAgICAgICAgbW92ICAg
ICAlZWF4LCBzeW1fZXNpKGwyX2RpcmVjdG1hcCwgJWVjeCwgOCkKPgo+IENhbiBzeW1fZXNpKCkg
cGVyaGFwcyBiZSBtYWRlCj4KPiAjZGVmaW5lIHN5bV9lc2koc3ltLCBleHRyYS4uLikgICAgICBz
eW1fb2ZmcyhzeW0pKCVlc2ksICMjIGV4dHJhKQo+Cj4gPwoKSSBjb25zaWRlcmVkIGFuZCBkaXNt
aXNzZWQgdGhpcyBhcHByb2FjaC7CoCBZZXMsIHRoZSBjb2RlIGlzIHNsaWdodGx5CnNob3J0ZXIs
IGJ1dCBhdCB0aGUgZXhwZW5zZSBvZiByZWFkYWJpbGl0eS4KClRoZSBhZHZhbnRhZ2Ugb2YgdGhl
IGxvbmdoYW5kIHZlcnNpb24gaXMgdGhhdCBpdCBpcyBvYnZpb3VzIHdoaWNoIGhhbGYKaXMgdGhl
IGRpc3BsYWNlbWVudCBleHByZXNzaW9uLCBhbmQgd2hpY2ggaGFsZiBpcyB0aGUgU0lCLgoKVGhl
IHJlZHVjZWQgdmVyc2lvbiBsZWF2ZXMgYSBkaXN0aW5jdCBwb3NzaWJpbGl0eSBvZiAlZWN4IGJl
aW5nIG1pc3Rha2VuCmFzIHRoZSBiYXNlIHJlZ2lzdGVyLCByYXRoZXIgdGhhbiB0aGUgaW5kZXgu
Cgo+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4gKysrIGIveGVuL2FyY2gveDg2
L3hlbi5sZHMuUwo+PiBAQCAtMzg0LDYgKzM4NCwzIEBAIEFTU0VSVCgodHJhbXBvbGluZV9lbmQg
LSB0cmFtcG9saW5lX3N0YXJ0KSA8IFRSQU1QT0xJTkVfU1BBQ0UgLSBNQklfU1BBQ0VfTUlOLAo+
PiAgICAgICJub3QgZW5vdWdoIHJvb20gZm9yIHRyYW1wb2xpbmUgYW5kIG1iaSBkYXRhIikKPj4g
IEFTU0VSVCgod2FrZXVwX3N0YWNrIC0gd2FrZXVwX3N0YWNrX3N0YXJ0KSA+PSBXQUtFVVBfU1RB
Q0tfTUlOLAo+PiAgICAgICJ3YWtldXAgc3RhY2sgdG9vIHNtYWxsIikKPj4gLQo+PiAtLyogUGxl
bnR5IG9mIGJvb3QgY29kZSBhc3N1bWVzIHRoYXQgWGVuIGlzbid0IGxhcmdlciB0aGFuIDE2TS4g
Ki8KPj4gLUFTU0VSVChfZW5kIC0gX3N0YXJ0IDw9IE1CKDE2KSwgIlhlbiB0b28gbGFyZ2UgZm9y
IGVhcmx5LWJvb3QgYXNzdW1wdGlvbnMiKQo+IEZvbGxvd2luZyB5b3VyIHJlcGx5IHRvIHRoZSBj
b3ZlciBsZXR0ZXIsIHRoaXMgY2FuJ3QgYmUgZHJvcHBlZCBqdXN0IHlldC4KCkNvcnJlY3QuCgo+
IEV2ZW4gd2hlbiB0aGF0IHJlbWFpbmluZyBpc3N1ZSBnb3QgYWRkcmVzc2VkLCBJIHRoaW5rIGl0
IHdvdWxkIGJlIGJldHRlcgo+IHRvIGtlZXAgaXQsIGFsdGVyaW5nIHRoZSBib3VuZCB0byBHQigx
KS4KCkEgMUcgY2hlY2sgd291bGRuJ3QgYmUgY29ycmVjdC4KCldlJ3ZlIGFscmVhZHkgZ290IGEg
bW9yZSBzdWl0YWJsZSBvbmUsIHdoaWNoIGlzIHRoZSBjaGVjayB0aGF0IFhlbgpkb2Vzbid0IGVu
Y3JvYWNoIGludG8gdGhlIHN0dWJzIHJhbmdlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
