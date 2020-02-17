Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDDB161B43
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 20:09:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3ljO-0003Nq-Dr; Mon, 17 Feb 2020 19:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATlc=4F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j3ljN-0003Nl-MU
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 19:06:57 +0000
X-Inumbo-ID: aa76c8fc-51b8-11ea-bc8e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa76c8fc-51b8-11ea-bc8e-bc764e2007e4;
 Mon, 17 Feb 2020 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581966416;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TmrM1fPwwruaNB53jAVkoq8YQ706mB+rYJR6emHaUYM=;
 b=euzqoeizkvZYp1AR+jy2L5afUnwilOEQNHIEbxlDGjd3+Hn6RJLLvipQ
 I+Drwc8adgE9eEm9lCAODEUE0V9AxP/K/FlWC3im55ZeScsVEbcp1r5Gi
 RQgBfTIC7sVXrccVOpnYvc1AJpd5RFMDCkLCvcGbVnoHTQI2q30QJE8ns w=;
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
IronPort-SDR: B6JYW/oQlaaQFnpvwa+nqlgDivMr7zS4kBNxwUsB1nBZxPen+AERsZYEga943VD/yRmQ0/7VIB
 GGrSlAHsY/P8Rlz+9073FYk2fyWYatVO1DplIc3ZmDGfWXiaf10OkytHbYUAt5SjfvCWbA9XZT
 rpxOgDGFl3eTWKugwWbr0x0Mu0MZXKJuRKUAzBgvQ1PA8cqQgeVAkWfd5T4NMav29+Z9H6vnu1
 lsWqX8MNlqCXm7XvMXnx4ySaGTpL1Fe+ir4p2kKnszRkVN0lNxo+jOzrsPkE3T1iNiT9h7Zk1b
 Hxw=
X-SBRS: 2.7
X-MesageID: 12942965
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12942965"
To: Jan Beulich <jbeulich@suse.com>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
 <056a856a-147e-612b-d476-50be80406581@suse.com>
 <2d25edcb-908a-5318-830b-8811abb125ef@citrix.com>
 <62532a65-efa2-dea5-3ef2-41ccb20023e3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d3bb18cf-b7e9-a983-32f6-e1fc914be5a4@citrix.com>
Date: Mon, 17 Feb 2020 19:06:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <62532a65-efa2-dea5-3ef2-41ccb20023e3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/3] AMD/IOMMU: replace a few literal numbers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDIuMjAyMCAx
NToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDUvMDIvMjAyMCAwOTo0MywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBJbnRyb2R1Y2UgSU9NTVVfUERFX05FWFRfTEVWRUxfe01JTixNQVh9
IHRvIHJlcGxhY2UgbGl0ZXJhbCAxLCA2LCBhbmQgNwo+Pj4gaW5zdGFuY2VzLiBXaGlsZSBkb2lu
ZyBzbyByZXBsYWNlIHR3byB1c2VzIG9mIG1lbXNldCgpIGJ5IGluaXRpYWxpemVycy4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFRoaXMg
ZG9lcyBub3QgbG9vayB0byBiZSBhbiBpbXByb3ZlbWVudC7CoCBJT01NVV9QREVfTkVYVF9MRVZF
TF9NSU4gaXMKPj4gZGVmaW5pdGVseSBib2d1cywgYW5kIGluIGFsbCBjYXNlcywgYSBsaXRlcmFs
IDEgaXMgYmV0dGVyLCBiZWNhdXNlIHRoYXQKPj4gaXMgaG93IHdlIGRlc2NyaWJlIHBhZ2V0YWJs
ZSBsZXZlbHMuCj4gSSBkaXNhZ3JlZS4KCkEgcGFnZXRhYmxlIHdhbGtpbmcgZnVuY3Rpb24gd2hp
Y2ggZG9lczoKCndoaWxlICggbGV2ZWwgPiAxICkKewrCoMKgwqAgLi4uCsKgwqDCoCBsZXZlbC0t
Owp9CgppcyBmYXIgY2xlYXJlciBhbmQgZWFzaWVyIHRvIGZvbGxvdyB0aGFuIGhpZGluZyAxIGJl
aGluZCBhIGNvbnN0YW50CndoaWNoIGlzbid0IG9idmlvdXNseSAxLsKgwqDCoCBTb21ldGhpbmcg
bGlrZSBMRVZFTF80SyB3b3VsZCBhdCBsZWFzdCBiZQpzb21ldGhpbmcgdGhhdCBtYWtlcyBzZW5z
ZSBpbiBjb250ZXh0LCBidXQgYSBsaXRlcmFsIG9uZSBsZXNzIHZlcmJvc2UuCgo+ICBUaGUgZGV2
aWNlIHRhYmxlIGVudHJ5J3MgbW9kZSBmaWVsZCBpcyBib3VuZGVkIGJ5IDEKPiAobWluKSBhbmQg
NiAobWF4KSBmb3IgdGhlIGxlZ2l0aW1hdGUgdmFsdWVzIHRvIHB1dCB0aGVyZS4KCklmIGJ5IDEs
IHlvdSBtZWFuIDAsIHRoZW4geWVzLsKgIENvcGluZyBwcm9wZXJseSB3aXRoIGEgbW9kZSBvZiAw
IGxvb2tzCnRvIGJlIGVhc2llciB0aGFuIHB1dHRpbmcgaW4gYW4gYXJiaXRyYXJ5IHJlc3RyaWN0
aW9uLgoKT1RPSCwgeW91IGludGVuZGVkIHRvIHJlc3RyaWN0IHRvIGp1c3QgdmFsdWVzIHdlIGV4
cGVjdCB0byBmaW5kIGluIGEgWGVuCnNldHVwLCB0aGVuIHRoZSBhbnN3ZXJzIGFyZSAzIGFuZCA0
IG9ubHkuwqAgKFRoZSAiY29ycmVjdG5lc3MiIG9mIHRoaXMKZnVuY3Rpb24gZGVwZW5kcyBvbiBv
bmx5IHJ1bm5pbmcgb24gWGVuLXdyaXR0ZW4gdGFibGVzLsKgIEl0IGRvZXNuJ3QKYWN0dWFsbHkg
cmVhZCB0aGUgbmV4dC1sZXZlbCBmaWVsZCBvdXQgb2YgdGhlIFBURSwgYW5kIGFzc3VtZXMgdGhh
dCBpdAppcyBhIHN0YW5kYXJkIHBhZ2V0YWJsZSBoaWVyYXJjaHkuwqAgVGhpbmdzIHdpbGwgZ28g
d3JvbmcgaWYgaXQKZW5jb3VudGVycyBhIHN1cGVycGFnZSwgb3IgYSBuZXh0LWxldmVsLTcgZW50
cnkuKQoKPgo+PiBTb21ldGhpbmcgdG8gcmVwbGFjZSBsaXRlcmFsIDYvNyBwcm9iYWJseSBpcyBv
aywgYnV0IGRvZXNuJ3Qgd2FudCB0byBiZQo+PiBkb25lIGxpa2UgdGhpcy4KPj4KPj4gVGhlIG1h
am9yaXR5IG9mIHRoZSBwcm9ibGVtcyBoZXJlIGFzIGNhdXNlZCBieSBpb21tdV9wZGVfZnJvbV9k
Zm4oKSdzCj4+IHNpbGx5IEFCSS7CoCBUaGUgcHRfbWZuW10gYXJyYXkgaXMgcHJvYmxlbWF0aWMg
KGJlY2F1c2UgaXQgaXMgdXNlZCBhcyBhCj4+IDEtYmFzZWQgYXJyYXksIG5vdCAwLWJhc2VkKSBh
bmQgdXNlbGVzcyBiZWNhdXNlIGJvdGggY2FsbGVycyBvbmx5IHdhbnQKPj4gdGhlIDRrLWVxdWl2
ZWxlbnQgbWZuLsKgIEZpeGluZyB0aGUgQUJJIGdldHMgcmlkIG9mIHF1aXRlIGEgbG90IG9mIHdh
c3RlZAo+PiBzdGFjayBzcGFjZSwgZXZlcnkgdXNlIG9mICcxJywgYW5kIGV2ZXJ5IHVwcGVyIGJv
dW5kIG90aGVyIHRoYW4gdGhlIGJ1Zwo+PiBvbiBhbmQgYW1kX2lvbW11X2dldF9wYWdpbmdfbW9k
ZSgpLgo+IEkgZGlkbid0IG1lYW4gdG8gYWx0ZXIgdGhhdCBmdW5jdGlvbidzIGJlaGF2aW9yLCBh
dCB0aGUgdmVyeSBsZWFzdAo+IG5vdCB1bnRpbCBiZWluZyBjZXJ0YWluIHRoZXJlIHdhc24ndCBh
IHJlYXNvbiBpdCB3YXMgY29kZWQgd2l0aCB0aGlzCj4gYXJyYXkgYXBwcm9hY2guIElPVyB0aGUg
YWx0ZXJuYXRpdmUgdG8gZ29pbmcgd2l0aCB0aGlzIHBhdGNoCj4gKHN1YmplY3QgdG8gY29ycmVj
dGlvbnMgb2YgY291cnNlKSBpcyBmb3IgbWUgdG8gZHJvcCBpdCBhbHRvZ2V0aGVyLAo+IGtlZXBp
bmcgdGhlIGhhcmQtY29kZWQgbnVtYmVycyBpbiBwbGFjZS4gSnVzdCBsZXQgbWUga25vdy4KCklm
IHlvdSBkb24ndCB3YW50IHRvIGNoYW5nZSB0aGUgQVBJLCB0aGVuIEknbGwgcHV0IGl0IG9uIG15
IHRvZG8gbGlzdC4KCkFzIHByZXZpb3VzbHkgZXhwcmVzc2VkLCB0aGlzIHBhdGNoIG9uIGl0cyBv
d24gaXMgbm90IGFuIGltcHJvdmVtZW50IElNTy4KCj4+PiAtLS0KPj4+IFRCRDogV2Ugc2hvdWxk
IHJlYWxseSBob25vciB0aGUgaGF0cyBmaWVsZCBvZiB1bmlvbgo+Pj4gICAgICBhbWRfaW9tbXVf
ZXh0X2ZlYXR1cmVzLCBidXQgdGhlIHNwZWNpZmljYXRpb24gKG9yIGF0IGxlYXN0IHRoZQo+Pj4g
ICAgICBwYXJ0cyBJIGRpZCBsb29rIGF0IGluIHRoZSBjb3Vyc2Ugb2YgcHV0dGluZyB0b2dldGhl
ciB0aGlzIHBhdGNoKQo+Pj4gICAgICBpcyB1bmNsZWFyIGFib3V0IHRoZSBtYXhpbXVtIHZhbGlk
IHZhbHVlIGluIGNhc2UgRUZSU3VwIGlzIGNsZWFyLgo+PiBJdCBpcyBhdmFpbGFibGUgZnJvbSBQ
Q0kgY29uZmlnIHNwYWNlIChNaXNjMCByZWdpc3RlciwgY2FwKzB4MTApIGV2ZW4gb24KPj4gZmly
c3QgZ2VuIElPTU1VcywKPiBJIGRvbid0IHRoaW5rIGFueSBvZiB0aGUgYWRkcmVzcyBzaXplIGZp
ZWxkcyB0aGVyZSBtYXRjaGVzIHdoYXQKPiBIQVRTIGlzIGFib3V0IChsaW1pdGluZyBvZiB0aGUg
dmFsdWVzIHZhbGlkIHRvIHB1dCBpbiBhIERURSdzCj4gbW9kZSBmaWVsZCkuIEluIGZhY3QgSSdt
IGhhdmluZyBzb21lIGRpZmZpY3VsdHkgYnJpbmdpbmcgdGhlCj4gdHdvIGluIChzZW5zaWJsZSkg
c3luYy4KCkl0IHdpbGwgY29uZmlybSB3aGV0aGVyIDQtbGV2ZWxzIGlzIGF2YWlsYWJsZSBvciBu
b3QsIGJ1dCBUQkgsIHdlIGtub3cKdGhhdCBhbnl3YXkgYnkgdmlydHVlIG9mIGJlaW5nIDY0Yml0
LgoKSGlnaGVyIGxldmVscyByZWFsbHkgZG9uJ3QgbWF0dGVyIGJlY2F1c2Ugd2UgZG9uJ3Qgc3Vw
cG9ydCB1c2luZyB0aGVtLsKgCldlJ3JlIHdlIHRvIHN1cHBvcnQgdXNpbmcgdGhlbSAoYW5kIEkg
ZG8gaGF2ZSBvbmUgdXNlY2FzZSBpbiBtaW5kKSwgaXQKd291bGQgYmUgZW50aXJlbHkgcmVhc29u
YWJsZSB0byByZXN0cmljdCB1c2FnZSB0byBzeXN0ZW1zIHdoaWNoIGhhZCBFRlIuCgo+Cj4+IGFu
ZCB0aGUgSVZSUyB0YWJsZSBpbiBUeXBlIDEwLgo+IFdoaWNoIG1heSBpbiB0dXJuIGJlIGFic2Vu
dCwgaS5lLiB0aGUgcXVlc3Rpb24gb2Ygd2hhdCB0byB1c2UgYXMKPiBhIGRlZmF1bHQgbWVyZWx5
IGdldHMgc2hpZnRlZC4KCk9uZSBvZiBUeXBlIDEwIG9yIDExIGlzIG1hbmRhdG9yeSBmb3IgZWFj
aCBJT01NVSBpbiB0aGUgc3lzdGVtLsKgIE9uZSB3YXkKb3IgYW5vdGhlciwgdGhlIGluZm9ybWF0
aW9uIGlzIHByZXNlbnQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
