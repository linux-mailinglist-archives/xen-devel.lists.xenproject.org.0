Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE611044E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:34:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icCxg-0004lq-1s; Tue, 03 Dec 2019 18:31:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nD+/=ZZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icCxf-0004ll-0r
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:31:47 +0000
X-Inumbo-ID: 28e99ee9-15fb-11ea-81e8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28e99ee9-15fb-11ea-81e8-12813bfff9fa;
 Tue, 03 Dec 2019 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575397907;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=I8fpfZIHN87/dVYqzaCdYcnNsd05CzGpivWkIERzetw=;
 b=EvEudicBWeGCHNIoULj4/2S36VpdRVCWFRVuOHfH39hf5Zgdy3pT6YEf
 D8vUhhRzXxQdu5wTXiQQxn/nAU5WrfXCNVPe3x94eV9ppiUhsfvjoISsZ
 opaq/Bmln7gjmjBszhBmk0F7hvbpEX6xfLFG9PWd5fGl62iuQbQaXHVyp 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QWpYcvjzquRwNZGdnCmBS6C2IkzSifHJ0dFvy9xQAhidaLrkRaFixqyQsARCSONeRwpvZStHea
 Yw1GV+WmZ4vcbXW2nZc+rLino3d15tTkhPDvYECCOG4qgdifSILBYwLKWuRZprvahiOv4w99yC
 YV0C1ZPMo/JmA47Sqan0lA6C/y57YAeMhDqZ71bLUonlzLtklImU1dCoGyuWNeAw6dVKvZ45uT
 BpiZ6qIXszpcd1W2daAGSW5/HLvD3yaRZ3vXy64k+Ppo0jmqSA2dVJ+gqVS1djgMKR6wJX/Y/g
 xT0=
X-SBRS: 2.7
X-MesageID: 9269770
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,274,1571716800"; 
   d="scan'208";a="9269770"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
 <10135f1d-2247-f6de-a46b-24eba40e44a7@citrix.com>
 <CABfawh=dkaCTw7Z8=P4M0DDL-KdsjBme3Sj536_-Q5bECY=DQw@mail.gmail.com>
 <CABfawhmpujFcQ9agXPG4KYxh8m5=dSju4ntwO9fVg8qAMQ6apg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <74caecf7-807f-74a8-678d-ee0f3e0765b3@citrix.com>
Date: Tue, 3 Dec 2019 18:31:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmpujFcQ9agXPG4KYxh8m5=dSju4ntwO9fVg8qAMQ6apg@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAxODoyNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgRGVj
IDMsIDIwMTkgYXQgMToyMiBQTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+
IHdyb3RlOgo+PiBPbiBUdWUsIERlYyAzLCAyMDE5IGF0IDE6MTggUE0gQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiAwMy8xMi8yMDE5IDE4OjA5
LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+Pj4gT24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjA1
IFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+Pj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVkZS9w
dWJsaWMvdm1fZXZlbnQuaAo+Pj4+Pj4gaW5kZXggOTU5MDgzZDhjNC4uNzY2NzZmZjRjMCAxMDA2
NDQKPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4+Pj4+PiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAo+Pj4+Pj4gQEAgLTI4MSw2ICsyODEsNyBA
QCBzdHJ1Y3Qgdm1fZXZlbnRfZGVidWcgewo+Pj4+Pj4gICAgICB1aW50MzJfdCBpbnNuX2xlbmd0
aDsKPj4+Pj4+ICAgICAgdWludDhfdCB0eXBlOyAgICAgICAgLyogSFZNT1BfVFJBUF8qICovCj4+
Pj4+PiAgICAgIHVpbnQ4X3QgX3BhZFszXTsKPj4+Pj4+ICsgICAgdWludDY0X3QgcGVuZGluZ19k
Ymc7Cj4+Pj4+IFRoaXMgaXMganVzdCBhIG5pdHBpY2sgYnV0IEkgd291bGQgcHJlZmVyIGlmIHdl
IGhhZCB0aGUgX3BhZCBmaWVsZCBhcwo+Pj4+PiB0aGUgbGFzdCBlbGVtZW50IGluIHRoZSBzdHJ1
Y3QgYW5kIGtlZXAgYWxsIDY0LWJpdCBtZW1iZXJzIHVwIGluIHRoZQo+Pj4+PiBmcm9udC4KPj4+
PiBBbHNvLCBzaW5jZSBwZW5kaW5nX2RiZyB1c2VzIHVuc2lnbmVkIGludCBpbiBYZW4sIGRvIHdl
IG5lZWQgdWludDY0X3QKPj4+PiBmb3IgaXQgaGVyZT8gU2VlbXMgdG8gbWUgYSB1aW50MzJfdCB3
b3VsZCBzdWZmaWNlLgo+Pj4gSXRzICVkcjYgKGJ1dCBub3QgcXVpdGUsIGR1ZSB0byBjb21wbGV4
aXR5IHdpdGggZXhjZXB0aW9uIHByaW9yaXRpZXMsCj4+PiBpbnRlcnJ1cHQgc2hhZG93cywgYW5k
IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IG9mIHRoZSBSVE0gYml0IHdpdGgKPj4+IGludmVydGVk
IHBvbGFyaXR5KS4gIEFsbCBvdGhlciByZWdpc3RlcnMgaGF2ZSA2NCBiaXQgZmllbGRzIGluIHRo
ZQo+Pj4gaW50ZXJmYWNlLgo+Pj4KPj4+IFRoZSBvbmx5IGludGVyZXN0aW5nIGJpdHMgaW4gaXQg
ZmFsbCB3aXRoaW4gdGhlIGZpcnN0IDMyIHdoaWNoIGlzIHdoeSBpdAo+Pj4gaXMgaGFuZGxlZCBp
biBhIHNob3J0ZXIgd2F5IHdpdGhpbiBYZW4uICBMaWtlICVjcjAsIEkgZG9uJ3QgZXhwZWN0Cj4+
PiBhbnl0aGluZyBpbnRlcmVzdGluZyB0byBhcHBlYXIgaW4gdGhlIHVwcGVyIDMyIGJpdHMuCj4+
Pgo+PiBQZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBjYWxsIGl0IGRyNiBpbiB0aGUgaW50
ZXJmYWNlIHRoZW4gdG8KPj4gbWFrZSBpdCBtb3JlIGNsZWFyIHRoYXQgdGhpcyBpcyBhIHJlZ2lz
dGVyIHZhbHVlPwo+Pgo+IFdoaWNoIHRoZW4gYmVncyB0aGUgcXVlc3Rpb24sIHdoeSBub3QganVz
dCB1c2UgZHI2IHRoYXQncyBhbHJlYWR5Cj4gcHJlc2VudCBpbiB0aGUgdm1fZXZlbnRfcmVnc194
ODYgc3RydWN0PwoKQmVjYXVzZSBpdCAoc3BlY2lmaWNhbGx5KSBpc24ndCBleGFjdGx5ICVkcjYu
wqAgVGhlIEFCSSBpdCBmb2xsb3dzIGlzCnN0cmljdGx5IGxpa2UgdGhlIFZULXgncyBwZW5kaW5n
X2RiZyBWTUNTIGZpZWxkLgoKQWxsIGJpdHMgaGF2ZSBwb3NpdGl2ZSBwb2xhcml0eSwgYW5kIGFy
ZSBzcGVjaWZpYyB0byB0aGUgZGVidWcgZXhjZXB0aW9uCmluIHF1ZXN0aW9uLgoKJWRyNiBhY2N1
bXVsYXRlcyBzb21lIGRlYnVnIGJpdHMgb3Itd2lzZSAoYW5kIHVudGlsIHRoZSBndWVzdCAjREIK
aGFuZGxlciBkZWNpZGVzIHRvIGNsZWFyIHRoZW0pLCBzb21lIGRlYnVnIGJpdHMgb3ZlcndyaXRl
LXdpc2UsIGFuZCBzb21lCmJpdHMgd2l0aCBpbnZlcnRlZCBwb2xhcml0eS4KClByb3ZpZGluZyAl
ZHI2IGFsb25lLCBlaXRoZXIgYmVmb3JlIG9yIGFmdGVyIG1lcmdpbmcgcGVuZGluZ19kYmcsIGlz
Cmluc3VmZmljaWVudCB0byBkaXNhbWJpZ3VhdGUgdGhlIGRlYnVnIGV4Y2VwdGlvbi4KCnBlbmRp
bmdfZGJnIGlzIHN0cmljdGx5ICJ0aGUgbmV3IGV4Y2VwdGlvbihzKSB0byBhZGQgaW50byB0aGUg
JWRyNiBtaXgiLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
