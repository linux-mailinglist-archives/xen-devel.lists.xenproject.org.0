Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B318D18E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:53:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIzD-0002l0-3I; Fri, 20 Mar 2020 14:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFIzB-0002kt-Is
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:50:57 +0000
X-Inumbo-ID: 348f0e04-6aba-11ea-bd99-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 348f0e04-6aba-11ea-bd99-12813bfff9fa;
 Fri, 20 Mar 2020 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584715857;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DBQf/29qzyK2rgwdZmsQ/jDMwSlShL3GOsZggzGEGUI=;
 b=bttfaZ7RT9FJ4cL3vUGrKmZoweRtxGVcwCxPkRYOt9mdBNMMQKml4blp
 NA1s06acdDiAjFoRhpuRl3DBtuMi06PRSl54xV5Lh7/X+VDehMMzA08SO
 wpsMN6+QsaPB6WdRJTS9s15gtdMqxbydjdWIsl/VxGsO/550+2zMLtDwk g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2Fi93hhvol1n+hproQaIWRrw1udyw05+ceuHRgjENqYlVz1JjhLK6rT+TgkGRg22uyY3+b/PvY
 2FvobeXZsXNH9eVxOTKxCyWRFHAVSMjfgHhZPy0W8C6kP3/noqKNbOgxH0pgWitCx8gTZmZ3ic
 v0Gne2Dk6Nzft0+tgyMxBG9i4tRQ2ZlLjDlrpeDuQMXOTZwVlg9g3aGG0qAwDuor2/aTG1sTlt
 a/0YnWdPpdBoEIv2+7AnMRBqgI68Wt63E94ad/Un+43fCEc3PPXVxV6s5U0iN7RP5DuEYAyVSO
 XvQ=
X-SBRS: 2.7
X-MesageID: 14335051
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14335051"
To: Jan Beulich <jbeulich@suse.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-6-andrew.cooper3@citrix.com>
 <2acabccd-da3b-9e22-8f27-41ab1b3cde8a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5b5994ae-db1c-b0d7-16d2-c2f264dc5440@citrix.com>
Date: Fri, 20 Mar 2020 14:50:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2acabccd-da3b-9e22-8f27-41ab1b3cde8a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/6] x86/ucode: Alter ops->free_patch() to
 free the entire patch
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

T24gMjAvMDMvMjAyMCAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDMuMjAyMCAx
NjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlIGRhdGEgbGF5b3V0IGZvciBzdHJ1Y3Qg
bWljcm9jb2RlX3BhdGNoIGlzIGV4dHJlbWVseSBwb29yLCBhbmQKPj4gdW5uZWNlc3NhcmlseSBj
b21wbGljYXRlZC4gIEFsbW9zdCBhbGwgb2YgaXQgaXMgb3BhcXVlIHRvIGNvcmUuYywgd2l0aCB0
aGUKPj4gZXhjZXB0aW9uIG9mIGZyZWVfcGF0Y2goKS4KPj4KPj4gTW92ZSB0aGUgcmVzcG9uc2li
aWxpdHkgZm9yIGZyZWVpbmcgdGhlIHBhdGNoIGludG8gdGhlIGZyZWVfcGF0Y2goKSBob29rLAo+
PiB3aGljaCB3aWxsIGFsbG93IGVhY2ggZHJpdmVyIHRvIGRvIGEgYmV0dGVyIGpvYi4KPiBCdXQg
dGhhdCB3cmFwcGVyIHN0cnVjdHVyZSBpcyBzb21ldGhpbmcgY29tbW9uLCBpLmUuIHRvIGJlCj4g
YWxsb2NhdGVkIGFzIHdlbGwgYXMgdG8gYmUgZnJlZWQgKHByZWZlcmFibHkpIGJ5IGNvbW1vbiBj
b2RlLgo+IFdlIGRpZCBzcGVjaWZpY2FsbHkgbW92ZSB0aGVyZSBkdXJpbmcgcmV2aWV3IG9mIHRo
ZSBtb3N0Cj4gcmVjZW50IHJlLXdvcmsuCgpUaGUgY3VycmVudCBiZWhhdmlvdXIgb2YgaGF2aW5n
IGl0IGFsbG9jYXRlZCBieSB0aGUgcmVxdWVzdCgpIGhvb2ssIGJ1dAoiZnJlZWQiIGluIGEgbWl4
IG9mIGNvbW1vbiBjb2RlIGFuZCBhIGZyZWUoKSBob29rLCBjYW5ub3QgcG9zc2libHkgaGF2ZQpi
ZWVuIGFuIGludGVuZGVkIGNvbnNlcXVlbmNlIGZyb20gbW92aW5nIGl0LgoKVGhlIGZyZWUoKSBo
b29rIGlzIGN1cnJlbnRseSBuZWNlc3NhcnksIGFzIGlzIHRoZSB2ZW5kb3Itc3BlY2lmaWMKYWxs
b2NhdGlvbiBsb2dpYywgc28gc3BsaXR0aW5nIGZyZWVpbmcgcmVzcG9uc2liaWxpdHkgd2l0aCB0
aGUgY29tbW9uCmNvZGUgaXMgd3JvbmcuCgo+IEhvd2V2ZXIsIGhhdmluZyB0YWtlbiBhIGxvb2sg
YWxzbyBhdCB0aGUgbmV4dCBwYXRjaCBJIHdvbmRlcgo+IHdoeSB5b3UgZXZlbiByZXRhaW4gdGhh
dCB3cmFwcGVyIHN0cnVjdHVyZSBjb250YWluaW5nIGp1c3QKPiBhIHNpbmdsZSBwb2ludGVyPyBX
aHkgY2FuJ3Qgd2hhdCBpcyBub3cKPiBzdHJ1Y3QgbWljcm9jb2RlX3thbWQsaW50ZWx9IGJlY29t
ZSBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoLAo+IHdpdGggLSBhcyB5b3Ugc2F5IHRoZXJlIC0gZGlm
ZmVyZW50IHBlci12ZW5kb3IgbGF5b3V0IHdoaWNoCj4gaXMgb3BhcXVlIHRvIGNvbW1vbiBjb2Rl
PwoKVmFyaW91cyBmaXhlcyBhbG9uZyB0aGVzZSBsaW5lcyBhcmUgcGVuZGluZyAoYnV0IGhhdmlu
ZyB0aGUgcmVzdWx0aW5nCmNoYW5nZSBub3QgYmUgInJld3JpdGUgdGhlIGVudGlyZSBmaWxlIGZy
b20gc2NyYXRjaCIgaXMgcHJvdmluZyBoYXJkZXIKdGhhbiBJJ2QgYW50aWNpcGF0ZWQpLgoKQm90
aCBJbnRlbCBhbmQgQU1EIG1ha2UgcG9pbnRsZXNzIGludGVybWVkaWF0ZSBtZW1vcnkgYWxsb2Nh
dGlvbnMgLwpmcmVlcyBmb3IgZXZlcnkgaW5kaXZpZHVhbCB1Y29kZSB0aGV5IGZpbmQgaW4gdGhl
IGNvbnRhaW5lcnMuwqAgRml4aW5nCnRoaXMgaXMgbW9kZXJhdGVseSBlYXN5IGFuZCBhbiBvYnZp
b3VzIHdpbi4KCgpIb3dldmVyLCBJIHdhcyBhbHNvIHRoaW5raW5nIGZ1cnRoZXIgZm9yd2FyZHMs
IHBlcmhhcHMgd2l0aCBzb21lCmRpZmZlcmVudCBjaGFuZ2VzLgoKV2UndmUgY3VycmVudGx5IGdv
dCBzb21lIGF3a3dhcmQgaG9vcHMgdG8ganVtcCB0aHJvdWdoIGZvciBhY2Nlc3NpbmcgdGhlCmlu
aXRyZC91Y29kZSBtb2R1bGUsIGFuZCB0aGUgZGVwZW5kZW5jeSBvbiBtZW1vcnkgYWxsb2NhdGlv
bnMgZm9yY2VzIHVzCnRvIGxvYWQgbWljcm9jb2RlIG11Y2ggbGF0ZXIgdGhhbiBpZGVhbCBvbiBi
b290LgoKSSB3YXMgY29uc2lkZXJpbmcgd2hldGhlciB3ZSBjb3VsZCByZWFycmFuZ2UgdGhpbmdz
IHNvIGFsbCBhbGxvY2F0aW9ucwp3ZXJlIGRvbmUgaW4gY29yZS5jLCB3aXRoIHRoZSB2ZW5kb3Ig
c3BlY2lmaWMgbG9naWMgc2ltcGx5IGlkZW50aWZ5aW5nIGEKc3Vic2V0IG9mIHRoZSBwcm92aWRl
ZCBidWZmZXIgaWYgYW4gYXBwbGljYWJsZSBwYXRjaCBpcyBmb3VuZC4KClRoaXMgd2F5LCB2ZXJ5
IGVhcmx5IGJvb3QgY2FuIGxvYWQgc3RyYWlnaHQgb3V0IG9mIHRoZSBpbml0cmQvdWNvZGUKbW9k
dWxlIChvciBidWlsdGluIGZpcm13YXJlLCBmb3Igd2hpY2ggdGhlcmUgaXMgYSBwYXRjaCBvdXRz
dGFuZGluZyksCmFuZCBzZXR0aW5nIHVwIHRoZSB1Y29kZSBjYXNoIGNhbiBoYXBwZW4gbGF0ZXIg
d2hlbiBkeW5hbWljIG1lbW9yeQphbGxvY2F0aW9ucyBhcmUgYXZhaWxhYmxlLgoKVGhpcyBpcyBl
YXN5IHRvIGRvIGZvciBJbnRlbCwgYW5kIG5vdCBzbyBlYXN5IGZvciBBTUQsIGdpdmVuIHRoZSBz
ZWNvbmQKYWxsb2NhdGlvbiBmb3IgdGhlIGVxdWl2YWxlbmNlIHRhYmxlLgoKRm9yIEFNRCwgdGhl
IHVjb2RlIHBhdGNoZXMgZG9uJ3QgaGF2ZSB0aGUgcHJvY2Vzc29yIHNpZ25hdHVyZSBpbiB0aGVt
LAphbmQgdGhlIHVzZSBvZiB0aGUgZXF1aXZhbGVuY2UgdGFibGUgaXMgbmVjZXNzYXJ5IHRvIHR1
cm4gdGhlIHByb2Nlc3NvcgpzaWduYXR1cmUgaW50byB0aGUgb3BhcXVlIHNpZ25hdHVyZSBpbiB0
aGUgdWNvZGUgaGVhZGVyLsKgwqAgQWZ0ZXIKcGFyc2luZywgaXQgaXMgb25seSB1c2VkIGZvciBz
YW5pdHkgY2hlY2tzLCBhbmQgZ2l2ZW4gdGhlIG90aGVyCnJlc3RyaWN0aW9ucyB3ZSBoYXZlIG9u
IGFzc3VtaW5nIGEgaGV0ZXJvZ2VuZW91cyBzeXN0ZW0sIEkgdGhpbmsgd2UgY2FuCmdldCBhd2F5
IHdpdGggZHJvcHBpbmcgdGhlIGFsbG9jYXRpb24uCgpPVE9ILCBpZiB3ZSBkbyBnbyBkb3duIHRo
ZXNlIGxpbmVzIChhbmQgc3BlY2lmaWNhbGx5LCBzaGlmdCB0aGUKYWxsb2NhdGlvbiByZXBvbnNp
YmlsaXR5IGludG8gY29yZS5jKSwgSSBjYW4ndCBzZWUgYSB3YXkgb2YKcmVpbnRyb2R1Y2luZyBo
ZXRlcm9nZW5lb3VzIHN1cHBvcnQgKG9uIEFNRC7CoCBBZ2FpbiwgSW50ZWwgaXMgZWFzeSwgYW5k
CndlJ3JlIGdvaW5nIHRvIG5lZWQgaXQgZXZlbnR1YWxseSBmb3IgTGFrZWZpZWxkIHN1cHBvcnQp
LgoKVGhvdWdodHM/Cgo+Cj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1ha2UgdGhlIGhvb2tz
IGlkZW1wb3RlbnQuCj4gSSdtIGhhdmluZyBkaWZmaWN1bHR5IHNlZWluZyB3aGF0IHBhcnQgb2Yg
dGhlIHBhdGNoIHRoaXMgaXMKPiBhYm91dC4KClRoZSAiaWYgKCBwYXRjaCApIiBjbGF1c2VzIGlu
IGZyZWVfcGF0Y2goKS4KCmJ1dCBJIHJlYWxpc2UgdGhhdCB3aGF0IEkgbWVhbnQgdG8gd3JpdGUg
d2FzICJ0b2xlcmF0ZSBOVUxMIi7CoCBTb3JyeS4KCldlIGhhdmUgYSB3ZWlyZCBtaXggd2hlcmUg
c29tZSBvZiB0aGUgZnVuY3Rpb25zIHRvbGVyYXRlIGEgTlVMTCBwYXRjaAood2hlcmUgdGhleSBj
YW4gcmVhc29uYWJseSBleHBlY3QgbmV2ZXIgdG8gYmUgZ2l2ZW4gTlVMTCksIGJ1dCB0aGUgZnJl
ZQpob29rIGRvZXNuJ3QgKHdoZXJlIGl0IHdvdWxkIGJlIG1vc3QgdXNlZnVsIGZvciBjYWxsZXIg
c2ltcGxpY2l0eSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
