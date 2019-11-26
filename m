Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B350D10A071
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:37:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbuu-000281-Gl; Tue, 26 Nov 2019 14:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZbut-00027u-Ep
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:34:11 +0000
X-Inumbo-ID: cf25a25e-1059-11ea-a3a3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf25a25e-1059-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574778850;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VGvqkhLqBbQc1byBLY5TiY5wavRXzrOX2q8ybCwq+1E=;
 b=fYmnFpVvMrzzfikLxCgG4HtWHHWdJPyuCqDWWgkFyk5+K5z/30CvMMCP
 BRxdRXaxUblovjbGqhNnSUTMSBn1cq5Utr3pbP0dY83o4YMW3BevlY+i0
 otO2fKje+0fsQ/BrGZK8fWWOWVxfWK2i/MQ70Ph2Ekovi8sLdeKkj58nX 8=;
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
IronPort-SDR: MUj62+6IJ/6oe+XXc4KKTlhacHNQ+QRHa69cwO7xG29t0e4dBb57TPyLCsBhfH8ZHurb0GfD/T
 i0zyAxLvFj+4BTQ9hgdaJIh7uv65jDZtht0bTbtJnN9rNTTM6g2UwmI19t7xDyQ6zJJVWdGlS7
 vkc2cmc75QG8t5qAPXBzzj9T/MrqOAhii0efzyokhqE3nYulFa2QuybAGZnYLbgPTmnXKLRZdW
 I/aeM1AZFUc2vuXphKsE7+RDANrvYt9HwOURfI4tSPpd3N/Etue1KBTGgbOiKp22ZLepw6RX6O
 /Ik=
X-SBRS: 2.7
X-MesageID: 9398126
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9398126"
To: Jan Beulich <jbeulich@suse.com>
References: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
 <abdc01eb-de2a-c7ff-3803-e7dfd6c022d4@suse.com>
 <77017c06-c383-e511-c0dc-9b49944ae967@citrix.com>
 <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2acf7a28-fdc9-8c06-7e9c-25b6b19864d7@citrix.com>
Date: Tue, 26 Nov 2019 14:34:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTEvMjAxOSAxNDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMTEuMjAxOSAx
MzoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjYvMTEvMjAxOSAwODo0MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNS4xMS4yMDE5IDIyOjA1LCBJZ29yIERydXpoaW5pbiB3cm90
ZToKPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+
Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+Pj4+IEBA
IC0xMjc5LDcgKzEyNzksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfZGV2
aWNlX3RhYmxlKAo+Pj4+ICAgICAgICAgIGZvciAoIGJkZiA9IDAsIHNpemUgLz0gc2l6ZW9mKCpk
dCk7IGJkZiA8IHNpemU7ICsrYmRmICkKPj4+PiAgICAgICAgICAgICAgZHRbYmRmXSA9IChzdHJ1
Y3QgYW1kX2lvbW11X2R0ZSl7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgLnYgPSB0
cnVlLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IHRydWUsCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgLml2ID0gaW9tbXVfaW50cmVtYXAsCj4+PiBUaGlzIHdh
cyB2ZXJ5IGludGVudGlvbmFsbHkgInRydWUiLCBhbmQgaWdub3JpbmcgImlvbW11X2ludHJlbWFw
IjoKPj4gRGVsaWJlcmF0ZSBvciBub3QsIGl0IGlzIGEgcmVncmVzc2lvbiBmcm9tIDQuMTIuCj4g
SSBhY2NlcHQgaXQncyBhIHJlZ3Jlc3Npb24gKHdoaWNoIHdhbnRzIGZpeGluZyksIGJ1dCBJIGRv
bid0IHRoaW5rCj4gdGhpcyBpcyB0aGUgd2F5IHRvIGFkZHJlc3MgaXMuIEkgY291bGQgYmUgY29u
dmluY2VkIGJ5IGdvb2QKPiBhcmd1bWVudHMsIHRob3VnaC4KPgo+PiBCb290aW5nIHdpdGggaW9t
bXU9bm8taW50cmVtYXAgaXMgYSBjb21tb24gZGVidWdnaW5nIHRlY2huaXF1ZSwgYW5kIHRoYXQK
Pj4gbWVhbnMgbm8gaW50ZXJydXB0IHJlbWFwcGluZyBhbnl3aGVyZSBpbiB0aGUgc3lzdGVtLCBl
dmVuIGZvcgo+PiBzdXBwb3NlZGx5LXVudXNlZCBEVEVzLgo+IFdoZXRoZXIgSVY9MSBvciBJVj0w
LCB0aGVyZSdzIG5vIGludGVycnVwdCBfcmVtYXBwaW5nXyB3aXRoIHRoaXMKPiBvcHRpb24gc3Bl
Y2lmaWVkLiBUaGVyZSdzIHNvbWUgaW50ZXJydXB0IF9ibG9ja2luZ18sIHllcy4gSXQncwo+IG5v
dCBpbW1lZGlhdGVseSBjbGVhciB0byBtZSB3aGV0aGVyIHRoaXMgaXMgYSBnb29kIG9yIGEgYmFk
IHRoaW5nLgoKWW91J3JlIGF0dGVtcHRpbmcgdG8gYXJndWUgc2VtYW50aWNzLsKgIEJsb2NraW5n
IGlzIGEgc3BlY2lhbCBjYXNlIHJlbWFwcGluZy4KCiJpb21tdT1uby1pbnRyZW1hcCIgKGZvciBi
ZXR0ZXIgb3Igd29yc2UsIG5hbWluZyB3aXNlKSByZWZlcnMgdG8gdGhlCmludGVycnVwdCBtZWRp
YXRpb24gZnVuY3Rpb25hbGl0eSBpbiB0aGUgSU9NTVUsIGFuZCBtZWFucyAiZG9uJ3QgdXNlIGFu
eQpvZiBpdCIuwqAgQW55IG90aGVyIGJlaGF2aW91ciBpcyBhIHJlZ3Jlc3Npb24uCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
