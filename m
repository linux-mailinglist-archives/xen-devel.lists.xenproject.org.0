Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054431545B2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:04:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhk3-0006oO-2r; Thu, 06 Feb 2020 14:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1nX9=32=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1izhk2-0006oJ-7T
 for xen-devel@lists.xen.org; Thu, 06 Feb 2020 14:02:50 +0000
X-Inumbo-ID: 5b5adf60-48e9-11ea-af99-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b5adf60-48e9-11ea-af99-12813bfff9fa;
 Thu, 06 Feb 2020 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580997770;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+t2qD9qM1Z6CHc9JTy7ge3GMMahWTco68eMVFIe2AbI=;
 b=C2Ln6gGRsV8sHY4ZZ2ig1kzCaUpiqtAj5RPK2VTbNgc/5w4LGrW5E/3d
 Miv5tlOj8S9f9TWSSByobCZyyJqOFjYAVgLsEkIBg0LJb0ESoxoISfWuf
 ehpLJF3jFE0c5h1aQib2PiRpqVkU5sMaYEuz9gs2k1+tKfgjwyVJNRrx4 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lEm7dhbOyq7QTdEDTlAUe9pMgYVB916ziqmma9kmnjp1SzVkR/K/mXP2tWXMpIr8Dzd9GavQ2U
 kbDsnJPjGs5dH8Yn4da312QFIvS3Th8Xd3imRa2MsqIN2ihtbU73JY2erHADEYPcn/Jo04AS3j
 DKueHxRNI9jJ/jLHjCVKUgBWiZVgS2Sb1Iia4HDla1wPdMl2+kYIgoanODoH57a8ELelVt4O0F
 9MBLtJ4G3tA33QdyqZ4Bq2qSh+hW3mwu0MpW3TatsoHGTw6ID4PxuXX6CX0Yr9RT2AAAHsWtlw
 ZnU=
X-SBRS: 2.7
X-MesageID: 12042657
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12042657"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
 <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
Date: Thu, 6 Feb 2020 14:02:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDIvMjAyMCAxMTowNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAwNi8wMi8yMDIw
IDA5OjU3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAwNS4wMi4yMCAxNzowMywgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IEhlbGxvLAo+Pj4KPj4+IEknbSBjdXJyZW50bHkgaW52ZXN0aWdh
dGluZyBhIExpdmUtUGF0Y2ggYXBwbGljYXRpb24gZmFpbHVyZSBpbiBjb3JlLQo+Pj4gc2NoZWR1
bGluZyBtb2RlIGFuZCB0aGlzIGlzIGFuIGV4YW1wbGUgb2Ygd2hhdCBJIHVzdWFsbHkgZ2V0Ogo+
Pj4gKGl0J3MgZWFzaWx5IHJlcHJvZHVjaWJsZSkKPj4+Cj4+PiAgICAgIChYRU4pIFsgIDM0Mi41
MjgzMDVdIGxpdmVwYXRjaDogbHA6IENQVTggLSBJUElpbmcgdGhlIG90aGVyIDE1IENQVXMKPj4+
ICAgICAgKFhFTikgWyAgMzQyLjU1ODM0MF0gbGl2ZXBhdGNoOiBscDogVGltZWQgb3V0IG9uIHNl
bWFwaG9yZSBpbiBDUFUgcXVpZXNjZSBwaGFzZSAxMy8xNQo+Pj4gICAgICAoWEVOKSBbICAzNDIu
NTU4MzQzXSBiYWQgY3B1czogNiA5Cj4+Pgo+Pj4gICAgICAoWEVOKSBbICAzNDIuNTU5MjkzXSBD
UFU6ICAgIDYKPj4+ICAgICAgKFhFTikgWyAgMzQyLjU1OTU2Ml0gWGVuIGNhbGwgdHJhY2U6Cj4+
PiAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjVdICAgIFs8ZmZmZjgyZDA4MDIzZjMwND5dIFIgY29t
bW9uL3NjaGVkdWxlLmMjc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YTQvMHgyNzAKPj4+ICAg
ICAgKFhFTikgWyAgMzQyLjU1OTU2OF0gICAgWzxmZmZmODJkMDgwMjNmOGFhPl0gRiBjb21tb24v
c2NoZWR1bGUuYyNzY2hlZHVsZSsweDE3YS8weDI2MAo+Pj4gICAgICAoWEVOKSBbICAzNDIuNTU5
NTcxXSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0
aXJxKzB4NWEvMHg5MAo+Pj4gICAgICAoWEVOKSBbICAzNDIuNTU5NTc0XSAgICBbPGZmZmY4MmQw
ODAyNzhlYzU+XSBGIGFyY2gveDg2L2RvbWFpbi5jI2d1ZXN0X2lkbGVfbG9vcCsweDM1LzB4NjAK
Pj4+Cj4+PiAgICAgIChYRU4pIFsgIDM0Mi41NTk3NjFdIENQVTogICAgOQo+Pj4gICAgICAoWEVO
KSBbICAzNDIuNTYwMDI2XSBYZW4gY2FsbCB0cmFjZToKPj4+ICAgICAgKFhFTikgWyAgMzQyLjU2
MDAyOV0gICAgWzxmZmZmODJkMDgwMjQxNjYxPl0gUiBfc3Bpbl9sb2NrX2lycSsweDExLzB4NDAK
Pj4+ICAgICAgKFhFTikgWyAgMzQyLjU2MDAzMl0gICAgWzxmZmZmODJkMDgwMjNmMzIzPl0gRiBj
b21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhjMy8weDI3MAo+Pj4g
ICAgICAoWEVOKSBbICAzNDIuNTYwMDM2XSAgICBbPGZmZmY4MmQwODAyM2Y4YWE+XSBGIGNvbW1v
bi9zY2hlZHVsZS5jI3NjaGVkdWxlKzB4MTdhLzB4MjYwCj4+PiAgICAgIChYRU4pIFsgIDM0Mi41
NjAwMzldICAgIFs8ZmZmZjgyZDA4MDI0MGQ1YT5dIEYgY29tbW9uL3NvZnRpcnEuYyNfX2RvX3Nv
ZnRpcnErMHg1YS8weDkwCj4+PiAgICAgIChYRU4pIFsgIDM0Mi41NjAwNDJdICAgIFs8ZmZmZjgy
ZDA4MDI3OWRiNT5dIEYgYXJjaC94ODYvZG9tYWluLmMjaWRsZV9sb29wKzB4NTUvMHhiMAo+Pj4K
Pj4+IFRoZSBmaXJzdCBIVCBzaWJsaW5nIGlzIHdhaXRpbmcgZm9yIHRoZSBzZWNvbmQgaW4gdGhl
IExQLWFwcGxpY2F0aW9uCj4+PiBjb250ZXh0IHdoaWxlIHRoZSBzZWNvbmQgd2FpdHMgZm9yIHRo
ZSBmaXJzdCBpbiB0aGUgc2NoZWR1bGVyIGNvbnRleHQuCj4+Pgo+Pj4gQW55IHN1Z2dlc3Rpb25z
IG9uIGhvdyB0byBpbXByb3ZlIHRoaXMgc2l0dWF0aW9uIGFyZSB3ZWxjb21lLgo+Pgo+PiBDYW4g
eW91IHRlc3QgdGhlIGF0dGFjaGVkIHBhdGNoLCBwbGVhc2U/IEl0IGlzIG9ubHkgdGVzdGVkIHRv
IGJvb3QsIHNvCj4+IEkgZGlkIG5vIGxpdmVwYXRjaCB0ZXN0cyB3aXRoIGl0Lgo+Cj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2ghIEl0IHNlZW1zIHRvIGZpeCB0aGUgaXNzdWUgaW4gbXkgbWFudWFs
IHRlc3RpbmcuCj4gSSdtIGdvaW5nIHRvIHN1Ym1pdCBhdXRvbWF0aWMgTFAgdGVzdGluZyBmb3Ig
Ym90aCB0aHJlYWQvY29yZSBtb2Rlcy4KCkFuZHJldyBzdWdnZXN0ZWQgdG8gdGVzdCBsYXRlIHVj
b2RlIGxvYWRpbmcgYXMgd2VsbCBhbmQgc28gSSBkaWQuCkl0IHVzZXMgc3RvcF9tYWNoaW5lKCkg
dG8gcmVuZGV6dm91cyBjcHVzIGFuZCBpdCBmYWlsZWQgd2l0aCBhIHNpbWlsYXIKYmFja3RyYWNl
IGZvciBhIHByb2JsZW1hdGljIENQVS4gQnV0IGluIHRoaXMgY2FzZSB0aGUgc3lzdGVtIGNyYXNo
ZWQKc2luY2UgdGhlcmUgaXMgbm8gdGltZW91dCBpbnZvbHZlZDoKCiAgICAoWEVOKSBbICAxNTUu
MDI1MTY4XSBYZW4gY2FsbCB0cmFjZToKICAgIChYRU4pIFsgIDE1NS4wNDAwOTVdICAgIFs8ZmZm
ZjgyZDA4MDI0MTdmMj5dIFIgX3NwaW5fdW5sb2NrX2lycSsweDIyLzB4MzAKICAgIChYRU4pIFsg
IDE1NS4wNjk1NDldICAgIFs8ZmZmZjgyZDA4MDIzZjNjMj5dIFMgY29tbW9uL3NjaGVkdWxlLmMj
c2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YTIvMHgyNzAKICAgIChYRU4pIFsgIDE1NS4xMDk2
OTZdICAgIFs8ZmZmZjgyZDA4MDIzZjcyOD5dIEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWRfc2xh
dmUrMHgxOTgvMHgyNjAKICAgIChYRU4pIFsgIDE1NS4xNDU1MjFdICAgIFs8ZmZmZjgyZDA4MDI0
MGUxYT5dIEYgY29tbW9uL3NvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg1YS8weDkwCiAgICAoWEVO
KSBbICAxNTUuMTgwMjIzXSAgICBbPGZmZmY4MmQwODAzNzE2ZjY+XSBGIHg4Nl82NC9lbnRyeS5T
I3Byb2Nlc3Nfc29mdGlycXMrMHg2LzB4MjAKCkl0IGxvb2tzIGxpa2UgeW91ciBwYXRjaCBwcm92
aWRlcyBhIHdvcmthcm91bmQgZm9yIExQIGNhc2UsIGJ1dCBvdGhlcgpjYXNlcyBsaWtlIHN0b3Bf
bWFjaGluZSgpIHJlbWFpbiBicm9rZW4gc2luY2UgdGhlIHVuZGVybHlpbmcgaXNzdWUgd2l0aAp0
aGUgc2NoZWR1bGVyIGlzIHN0aWxsIHRoZXJlLgoKLS0KVGhhbmtzLApTZXJnZXkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
