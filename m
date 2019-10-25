Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1388E4BB7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 15:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNzB2-0000rF-PC; Fri, 25 Oct 2019 12:58:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uj8v=YS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNzB1-0000r6-00
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:58:47 +0000
X-Inumbo-ID: 2d880ae0-f727-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d880ae0-f727-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572008325;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+MpRvxgsLqTzWL2j2Vw0KBe7gz8UwlvTIlNyH6JGMwU=;
 b=P3Uwrg4jTHH2iXFtQZhdspMGEf1SBUXSaJjw0lm7RdGm8cGNCjNf4FcC
 elzoyBvNp9iHiAgSQOURdiXxMtvTSXuGHm1t/ca+KCOPDHMnWCY1nhHsX
 6hrQ3g7kaHfeyCf4tUI0Qk1ldqNP4TXsqxdh5uTw1DOqi0PozLT0C6+W8 s=;
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
IronPort-SDR: exg5Tz6uHnCCwSRfp/gXXEBPPkvEFryLSahIgkBPD9LZYb/qHKslosESMnXtZp6nxuCY7QgW51
 OhXYyOpHYgmR2+TDa2v3L+zu71l7VqEDYrAANStp1MHRMUAydZoG9qNZZuflfUMcXYGrnD4NsC
 RxBa7HPNMNb18NCnVbc7apovmxVpNWVS2FkAnvfjlWrINpPlRPqC9KOLX0ZzebQLUrBjimtgvZ
 sMyvIuPk1sB0KS4uZlenm+OHf0BEWFtwmlaCRviczrIPq4TE1gdH3etoppAT5mEufhEUMjVwXq
 Suw=
X-SBRS: 2.7
X-MesageID: 7740540
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,228,1569297600"; 
   d="scan'208";a="7740540"
To: Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-8-andrew.cooper3@citrix.com>
 <62c638c2-641e-c1c0-a9c3-8c48388289b5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c1794d03-8ec3-d350-aa7d-43cc5701d562@citrix.com>
Date: Fri, 25 Oct 2019 13:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <62c638c2-641e-c1c0-a9c3-8c48388289b5@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/nospec: Optimise
 array_index_mask_nospec() for power-of-2 arrays
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMTAvMjAxOSAxMzoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjMuMTAuMjAxOSAx
NTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhpcyBvcHRpbWlzYXRpb24gaXMgbm90IHNh
ZmUgb24gQVJNLCBiZWNhdXNlIHNvbWUgQ1BVcyBkbyBkYXRhIHZhbHVlCj4+IHNwZWN1bGF0aW9u
LCB3aGljaCBpcyB3aHkgdGhlIENTREIgYmFycmVyIHdhcyBpbnRyb2R1Y2VkLgo+IFNvIGlmIGFu
IHg4NiBDUFUgYXBwZWFyZWQgd2hpY2ggZGlkIHNvIHRvbywgaXQgd291bGQgaW1tZWRpYXRlbHkg
YmUKPiB1bnNhZmUgYXMgd2VsbCBhaXVpLiBJLmUuIHdlJ2QgaGF2ZSB0byBhZ2FpbiBnbyBhbmQg
Zml4IHRoZSBsb2dpYy4KPiBOb3QgdG8gYmUgdGFrZW4gYXMgYW4gb3V0cmlnaHQgb2JqZWN0aW9u
LCBidXQgdG8gcGVyaGFwcyBwcm9tcHQKPiBmdXJ0aGVyIGNvbnNpZGVyYXRpb24uCgpBY3R1YWxs
eSBhbnkgbWFza2luZyBhcHByb2FjaCwgZXZlbiBjbXAvc2JiLCB3b3VsZCBiZSB1bnNhZmUgc28g
SQpzdXBwb3NlIHRoaXMgbm90ZSBpc24ndCBhY2N1cmF0ZS4KCkknbSBhd2FyZSBvZiBvbmUgeDg2
IHBsYW4gZm9yIGRhdGEgdmFsdWUgc3BlY3VsYXRpb24sIHdoaWNoIHdhcyBkZWxheWVkCmluZGVm
aW5pdGVseSBmb2xsb3dpbmcgdGhlIGZhbGxvdXQgZnJvbSBTcGVjdHJlL01lbHRkb3duLCBlc3Bl
Y2lhbGx5IGFzCkwxVEYgYXQgaXRzIGNvcmUgaXMgYSBzcGVjdWxhdGl2ZSBhZGRyZXNzIHByZWRp
Y3Rpb24gYnVnLsKgIFN1ZmZpY2UgaXQgdG8Kc2F5IHRoYXQgdGhlIHZlbmRvcnMgYXJlIGF3YXJl
IHRoYXQgYW55IHBsYW5zIGFsb25nIHRoZXNlIGxpbmVzIHdpbGwKbmVlZCB0byBiZSBkb25lIHdp
dGggZ3JlYXQgY2FyZS4KCj4KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaAo+
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oCj4+IEBAIC03LDEzICs3LDIwIEBA
Cj4+ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4+ICAKPj4gIC8qKgo+PiAtICogYXJy
YXlfaW5kZXhfbWFza19ub3NwZWMoKSAtIGdlbmVyYXRlIGEgbWFzayB0aGF0IGlzIH4wVUwgd2hl
biB0aGUKPj4gLSAqICAgICAgYm91bmRzIGNoZWNrIHN1Y2NlZWRzIGFuZCAwIG90aGVyd2lzZQo+
PiArICogYXJyYXlfaW5kZXhfbWFza19ub3NwZWMoKSAtIGdlbmVyYXRlIGEgbWFzayB0byBib3Vu
ZCBhbiBhcnJheSBpbmRleAo+PiArICogd2hpY2ggaXMgc2FmZSBldmVuIHVuZGVyIGFkdmVyc2Ug
c3BlY3VsYXRpb24uCj4+ICAgKiBAaW5kZXg6IGFycmF5IGVsZW1lbnQgaW5kZXgKPj4gICAqIEBz
aXplOiBudW1iZXIgb2YgZWxlbWVudHMgaW4gYXJyYXkKPj4gICAqCj4+IC0gKiBSZXR1cm5zOgo+
PiArICogSW4gZ2VuZXJhbCwgcmV0dXJuczoKPj4gICAqICAgICAwIC0gKGluZGV4IDwgc2l6ZSkK
Pj4gKyAqCj4+ICsgKiBUaGlzIHllaWxkIH4wVUwgaW4gd2l0aGluLWJvdW5kcyBjYXNlLCBhbmQg
MCBpbiB0aGUgb3V0LW9mLWJvdW5kcwo+IE5pdDogInlpZWxkcyI/CgpPb3BzIHllcy4KCj4KPj4g
QEAgLTIxLDkgKzI4LDE1IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhcnJheV9pbmRl
eF9tYXNrX25vc3BlYyh1bnNpZ25lZCBsb25nIGluZGV4LAo+PiAgewo+PiAgICAgIHVuc2lnbmVk
IGxvbmcgbWFzazsKPj4gIAo+PiAtICAgIGFzbSB2b2xhdGlsZSAoICJjbXAgJVtzaXplXSwgJVtp
bmRleF07IHNiYiAlW21hc2tdLCAlW21hc2tdOyIKPj4gLSAgICAgICAgICAgICAgICAgICA6IFtt
YXNrXSAiPXIiIChtYXNrKQo+PiAtICAgICAgICAgICAgICAgICAgIDogW3NpemVdICJnIiAoc2l6
ZSksIFtpbmRleF0gInIiIChpbmRleCkgKTsKPj4gKyAgICBpZiAoIF9fYnVpbHRpbl9jb25zdGFu
dF9wKHNpemUpICYmIElTX1BPV0VSX09GXzIoc2l6ZSkgKQo+PiArICAgIHsKPj4gKyAgICAgICAg
bWFzayA9IHNpemUgLSAxOwo+PiArICAgICAgICBPUFRJTUlaRVJfSElERV9WQVIobWFzayk7Cj4g
SSBjYW4ndCBzZWVtIHRvIGJlIGFibGUgdG8gZmlndXJlIHdoeSB5b3UgbmVlZCB0aGlzLgoKQmVj
YXVzZSBJIGZvdW5kIGNhc2VzIHdoZXJlIHRoZSBBTkQgd2FzIGVsaWRlZCBieSB0aGUgY29tcGls
ZXIgZW50aXJlbHkKd2l0aG91dCBpdC4KCj4KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbmZp
Zy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaAo+PiBAQCAtNzUsNiArNzUsNyBA
QAo+PiAgI2RlZmluZSBHQihfZ2IpICAgICAoX0FDKF9nYiwgVUxMKSA8PCAzMCkKPj4gIAo+PiAg
I2RlZmluZSBJU19BTElHTkVEKHZhbCwgYWxpZ24pICgoKHZhbCkgJiAoKGFsaWduKSAtIDEpKSA9
PSAwKQo+PiArI2RlZmluZSBJU19QT1dFUl9PRl8yKHZhbCkgKCh2YWwpICYmIElTX0FMSUdORUQo
dmFsLCB2YWwpKQo+IFdoaWxlIHRoZSByaXNrIG1heSBzZWVtIGxvdyBmb3Igc29tZW9uZSB0byBw
YXNzIGFuIGV4cHJlc3Npb24gd2l0aAo+IHNpZGUgZWZmZWN0IGhlcmUsIGV2YWx1YXRpbmcgInZh
bCIgdXAgdG8gdGhyZWUgdGltZXMgaGVyZSBkb2Vzbid0Cj4gbG9vayB2ZXJ5IGRlc2lyYWJsZS4K
ClRoYXQgaXMgZWFzeSB0byBmaXguCgo+IEFzIGEgbWlub3IgcmVtYXJrLCB3aXRob3V0IGNvbnNp
ZGVyaW5nIHJlcHJlc2VudGF0aW9uIEknZCBleHBlY3QKPiBhbiBleHByZXNzaW9uIElTX0FMSUdO
RUQodmFsLCB2YWwpIHRvIGNvbnNpc3RlbnRseSBwcm9kdWNlICJ0cnVlIgo+IGZvciBhbGwgbm9u
LXplcm8gdmFsdWVzLiBFLmcuIDMgaXMgY2VydGFpbmx5ICJhbGlnbmVkIiBvbiBhCj4gYm91bmRh
cnkgb2YgMy4KCklTX0FMSUdORUQoKSBjb21lcyB3aXRoIGFuIGV4cGVjdGF0aW9uIG9mIGJlaW5n
IGFnYWluc3QgYSBwb3dlciBvZiAyLApiZWNhdXNlIG90aGVyd2lzZSB5b3UnZCBuZWVkIGEgRElW
IGluc3RydWN0aW9uIGZvciB0aGUgZ2VuZXJhbCBjYXNlLgoKU29tZSB1c2VycyBjYW4ndCBjb3Bl
IHdpdGggYSBjb21waWxlIHRpbWUgY2hlY2suCgo+IEZpbmFsbHkgdGhpcyBtYXkgd2FudCBndWFy
ZGluZyBhZ2FpbnN0IHVzZSBvbiBzaWduZWQgdHlwZXMgLSBhdAo+IHRoZSB2ZXJ5IGxlYXN0IGl0
IGxvb2tzIHRvIHByb2R1Y2UgdGhlIHdyb25nIGFuc3dlciBmb3IgZS5nLgo+IElOVF9NSU4gb3Ig
TE9OR19NSU4uIEkuZS4gcGVyaGFwcyB0aGUgZXhwcmVzc2lvbiB0byB0aGUgbGVmdCBvZgo+ICYm
IHdhbnRzIHRvIGJlICh2YWwpID4gMC4KCkhvdyBhYm91dCB0aGUgYWJvdmUgZXhwYW5zaW9uIGZp
eCBiZWNvbWluZzoKCih7CsKgwqDCoCB1bnNpZ25lZCB0eXBlb2YodmFsKSBfdmFsID0gdmFsOwrC
oMKgwqAgX3ZhbCAmJiAoX3ZhbCAmIChfdmFsIC0gMSkpID09IDA7Cn0pCgpUaGlzIGNoZWNrIG1h
a2VzIG5vIHNlbnNlIG9uIG5lZ2F0aXZlIG51bWJlcnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
