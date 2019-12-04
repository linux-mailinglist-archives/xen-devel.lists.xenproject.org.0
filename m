Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB7112F22
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 16:59:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icX1t-00037F-I7; Wed, 04 Dec 2019 15:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d3Le=Z2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icX1s-00037A-7J
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 15:57:28 +0000
X-Inumbo-ID: c4a7347c-16ae-11ea-8206-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4a7347c-16ae-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575475047;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=+m1Mxop6hCiOOUPlEKgJgHVvai6KgJRq3T8+YfQDecw=;
 b=TR6Mm9vRtlrk80rQRHIHvOCuRrbU34xgSwS27xhjpACRpFuXsDmzdrll
 9yj36K/QHEpziKnlo3OWgE2fluFk96r3cnPR8Z5A1Yl8FjwdFgP52aXib
 EvVITXEA/vQ1YIxtPk8OHVuyEvzBD+WIvvZLp17mD6a4n7cUu381fIXOX k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ypKF/gdLkvrhkhGwRm5aaxtV8MfrjCtuEumuZnPnqyhwYvoKiy4W4p39T7QZWLEO7v34hXihvT
 KDHpkA/A27f/A287tZbIg2oljlhn+N4YN4sIyDrdvj581CfMYWjpsY0C7i/Xdugzn9r08DTWdg
 9hZq4r4877NkVBJDjlsnSD2deY/JJIrM/dlax9V6qPhASIpPyhNO/lcYP1wD2P4aRFCeJ9zRsg
 oUwthyyonKgKppA38axANngwk9NUbRNlMT+GmPfi4AgFsnFZlLQi7xOT/0gs7guSOyXt45tfFR
 3gs=
X-SBRS: 2.7
X-MesageID: 9743717
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9743717"
To: felix nasch <felix.nasch@gmail.com>, <xen-devel@lists.xenproject.org>
References: <CAMEmTtVgarS_H9Q7DM_VjpEqQZYsguA0unOrX42cPK3-kjDoSA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <14ab4f4e-cad7-6ef2-d839-73701835bd17@citrix.com>
Date: Wed, 4 Dec 2019 15:57:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMEmTtVgarS_H9Q7DM_VjpEqQZYsguA0unOrX42cPK3-kjDoSA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] vmi: supporting single-stepping on AMD processors
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTIvMjAxOSAxNTozMiwgZmVsaXggbmFzY2ggd3JvdGU6Cj4gSGksCj4KPiBJIGFtIHdv
cmtpbmcgb24gbWFraW5nIGxpYnZtaVsxXSB3b3JrIG9uIEFNRCwgYW5kIG9uZSBiaWcgaXNzdWUg
aXMgdGhlIGxhY2sKPiBvZiBzdXBwb3J0IGZvciBzaW5nbGUtc3RlcHBpbmcgb24gQU1EIHByb2Nl
c3NvcnMgaW4gdGhlIHZtaSBhcGkgb2ZmZXJlZCBieSB4ZW4uCj4gSSB0aGluayBpIGhhdmUgYSB3
YXkgdG8gZ2V0IGl0IHRvIHdvcmssIGFuZCBJIHdvdWxkIGxpa2UgdG8ga25vdyBpZiB5b3Ugc2Vl
Cj4gYW55IGlzc3VlcyB3aXRoIHRoaXMgYXBwcm9hY2gsIGFuZCBpZiB0aGVyZSBpcyBhbnkgcmVh
c29uIGl0IGhhc250IGJlZW4KPiBpbXBsZW1lbnRlZCBsaWtlIHRoaXMuCj4KPiBMb29raW5nIGF0
IHRoZSBjb2RlIHRoZSByZWFzb24gd2h5IHNpbmdsZS1zdGVwcGluZyB3b3JrcyBmb3IgaW50ZWws
Cj4gYnV0IG5vdCBmb3IgYW1kIHNlZW1zIHRvIGJlIHRoYXQgSW50ZWwtdnR4IGhhcyB0aGUgaGFu
ZHkKPiAnTW9uaXRvciBUcmFwIEZsYWcnIChNVEYpLCB3aGlsZSBBTUQgZG9lcyBub3Qgb2ZmZXIg
c3VjaCBhIGZlYXR1cmUgaW4gU1ZNLgo+IE9uIEludGVsLCBpZiB0aGUgTVRGIGlzIHNldCwgYWZ0
ZXIgb25lIGd1ZXN0IGluc3RydWN0aW9uIHRoZXJlIGlzIGEKPiB2bWV4aXQgd2l0aCByZWFzb24K
PiBFWElUX1JFQVNPTl9NT05JVE9SX1RSQVBfRkxBRywgd2hpY2ggaXMgdGhlbiBkaXJlY3RseSBw
YXNzZWQgdXAgYXMgYQo+IEhWTV9NT05JVE9SX1NJTkdMRVNURVBfQlJFQUtQT0lOVCBldmVudC4K
Pgo+IFN0dWR5aW5nIHRoZSBBTUQgbWFudWFsIGFuZCByZWFkaW5nIGJldHdlZW4gdGhlIGxpbmVz
IGEgYml0IEkgc2VlIHRoZQo+IGZvbGxvd2luZyB3YXkgdG8gaW1wbGVtZW50IHNpbmdsZSBzdGVw
cGluZyBvbiBBTUQ6Cj4KPiBBTUQgTWFudWFsIDE1LjYjVk1FWElUOgo+PiBXaGVuIFZNUlVOIGxv
YWRzIGEgZ3Vlc3QgdmFsdWUgb2YgMSBpbgo+PiBFRkxBR1MuVEYsIHRoYXQgdmFsdWUgZG9lcyBu
b3QgY2F1c2UgYSB0cmFjZSB0cmFwIGJldHdlZW4KPj4gdGhlIFZNUlVOIGFuZCB0aGUgZmlyc3Qg
Z3Vlc3QKPj4gaW5zdHJ1Y3Rpb24sIGJ1dCByYXRoZXIgYWZ0ZXIgY29tcGxldGlvbiBvZiB0aGUg
Zmlyc3QgZ3Vlc3QgaW5zdHJ1Y3Rpb24uCj4gU286Cj4KPiAxLiBjaGVjayBpZiBndWVzdCBoYXMg
cmZsYWdzLnRmIHNldAo+IDIuIHNldCByZmxhZ3MudGYgaW4gdGhlIGd1ZXN0IGNvbnRleHQKPiAz
LiBjb250aW51ZQo+IDQuIGdldCBhIHZtZXhpdCB3aXRoIGV4Y2VwdGlvbiAjREIKPiA1LiBpZiBy
ZmxhZ3MudGYgd2FzIGluaXRpYWxseSBzZXQsIHJlLWluamVjdCB0aGUgZXZlbnQgaW50byB0aGUg
Z3Vlc3QKPiAodG8gbm90IGludGVyZmVyZSB3aXRoIHN0YW5kYXJkIHNpbmdsZXN0ZXBwaW5nIGlu
c2lkZSB0aGUgZ3Vlc3QpCj4gNi4gZW1pdCBIVk1fTU9OSVRPUl9TSU5HTEVTVEVQX0JSRUFLUE9J
TlQKPgo+IE1vc3Qgb2YgdGhlIGNvZGUgdGhhdCB3b3VsZCBiZSBuZWVkZWQgaXMgYWxyZWFkeSB0
aGVyZSBpbiBzdm0uYywKPiBpIGFtIHByZXBhcmluZyBhIHBhdGNoIHRvIGltcGxlbWVudCBpdCBh
cyBJIGltYWdpbmUgaXQgYWJvdmUsIGJ1dCBpdCB3aWxsIHRha2UKPiBtZSBzb21lIHRpbWUgdG8g
dGVzdCBpdC4KPgo+IFNvIGlzIHRoZXJlIGFueSByZWFzb24gaXQgaGFzIG5vdCBiZWVuIGltcGxl
bWVudGVkIGxpa2UgdGhhdCBhbHJlYWR5LAo+IGFuZCB3b3VsZCB5b3UgZ2VuZXJhbGx5IGFjY2Vw
dCBpdCB0byBiZSBkb25lIGxpa2UgdGhpcz8KCkhlbGxvLgoKWW91J3JlIG5vdCBhY3R1YWxseSB0
aGUgZmlyc3QgdG8gYXNrIGFib3V0IHRoaXMsIGFuZCBzaW5jZSB0aGUgbGFzdCB0aW1lCkkgd2Fz
IGFza2VkLCBJIGRvIGhhdmUgYSBtb3JlIGN1bm5pbmcgaWRlYS4KClNhZGx5LCB5b3UgY2FuJ3Qg
dXNlIFRGIGluIHRoZSBnZW5lcmFsIGNhc2UuwqAgWWVzIC0gdGhlIGV4YW1wbGUgeW91IGdpdmUK
d291bGQgd29yayBpbiBjb21tb24gY2FzZXMsIGJ1dCBURiBpcyB2aXNpYmxlIHRvLCBhbmQgZWRp
dGFibGUgYnksIHRoZQpndWVzdC4KCkl0IGFsc28gY2hhbmdlcyBiZWhhdmlvdXIgZGVwZW5kaW5n
IG9uIHdoZXRoZXIgdGhlIGd1ZXN0IGNob3NlIHRvIHVzZQpNU1JfREVCVUdDVEwuQlRSIChCcmFu
Y2ggVFJhY2UpIHdoaWNoIGNhdXNlcyBvbmUgc2luZ2xlLXN0ZXAgcGVyIGJhc2ljCmJsb2NrIG9m
IGNvZGUsIHJhdGhlciB0aGFuIHBlciBpbnN0cnVjdGlvbi4KCkFzIGFuIGFsdGVybmF0aXZlLCBJ
J20gaW5mb3JtZWQgdGhhdCB0aGUgbWVhbmluZyBvZiB0aGUgaW50ZXJydXB0X3NoYWRvdwpmaWVs
ZCBpbiB0aGUgVk1DQiBpcyAiZXhlY3V0ZSBvbmUgaW5zdHJ1Y3Rpb24gdW5jb25kaXRpb25hbGx5
IiwgYmVmb3JlCnVzdWFsIGludGVycnVwdCByZWNvZ25pdGlvbiBhY3Rpdml0aWVzIHJlc3VtZS4K
ClRoZXJlZm9yZSwgaWYgeW91J3JlIHVwIGZvciBzb21lIGV4cGVyaW1lbnRhdGlvbiBJIGhhdmUg
YSBzdXNwaWNpb24gdGhhdAp0aGUgZm9sbG93aW5nIG1pZ2h0IHdvcmssIGFuZCB3aXRob3V0IHVz
aW5nIGFueSBndWVzdCB2aXNpYmxlL211dGFibGUgc3RhdGUuCgoxLiBTZXQgaW50ZXJydXB0X3No
YWRvdz0xCjIuIEFmdGVyIENMR0kgb24gdGhlIHZtZW50ZXIgcGF0aCwgc2VuZCBhIHNlbGYgSVBJ
CjMuIFZNUlVOIHNob3VsZCBjb21wbGV0ZSwgZXhlY3V0ZSBvbmUgaW5zdHJ1Y3Rpb24sIHRoZW4g
ZXhpdCBiZWNhdXNlIG9mCnRoZSBwZW5kaW5nIElQSQoKR2l2ZW4gdGhhdCB0aGlzIGlzIEFNRCwg
aWYgeW91IGFsbG9jYXRlIGEgc3BlY2lmaWMgdmVjdG9yIGZvciB0aGUKcHVycG9zZSwgeW91IGNh
biBzcG90IGFuZCB1c2UgdGhlIHNlbGVjdGl2ZS1lb2kgQVBJQyBleHRlbnNpb24gdG8gY2FuY2Vs
CnRoZSBJUEkgYmVmb3JlIFNUR0ksIHNvIHdlIGRvbid0IGV2ZW4gd2FzdGUgdGltZSBydW5uaW5n
IGEgbm8tb3AKaW50ZXJydXB0IGhhbmRsZXIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
