Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B91542A8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:08:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izeyi-0006d5-IB; Thu, 06 Feb 2020 11:05:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1nX9=32=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1izeyg-0006d0-UF
 for xen-devel@lists.xen.org; Thu, 06 Feb 2020 11:05:46 +0000
X-Inumbo-ID: 9f49b55c-48d0-11ea-af37-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f49b55c-48d0-11ea-af37-12813bfff9fa;
 Thu, 06 Feb 2020 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580987145;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=l5PmbxSHWT+o09efuklCWmVz8U0SNxS1lbjmUrrGv+M=;
 b=OSnZt4y9/eZEw0jEgtH95obIR0PHIO6skAgBD0inaZK9ByZ74QaMuR+M
 SIJnoGHsSOoKUHuayrnTWNUg3gVBCyp8NedkgR/MkjP10/c1ICqAPn2AK
 qeSSgnnCWDmG4OGEt5tR+ypKgVjpi01YJraIiXJimpsd2E/HzTVUxPraX A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fP5EoB3A6gCyOt35SIP0XmdlT/p17WHMqELBHpzWvKm1ts7lXp10KWrAnWliMbYNWR+oIK6X5G
 VTpYfjWm9UkiHwXZCVmk+gmFsyESVoZ3/qjmK2izcb15HoJ8ICXa6wgR+NMggh/VRkyEIgPUPc
 NMkX95XDeBzn2NFBEBmnbFrHZHiHNbiscposp0qWyjRC0BVQ/cYWc1hDD00YVJAK4+XUBomneK
 lGSWf+V9VDP+QfjBEnVQQhRvFhC1gN0u5phUpSlCd145yAdmj/4H81O3fQrQV1bZNWS191w9Wf
 j+4=
X-SBRS: 2.7
X-MesageID: 12656269
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12656269"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
 <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
Date: Thu, 6 Feb 2020 11:05:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDIvMjAyMCAwOTo1NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNS4wMi4yMCAx
NzowMywgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IEknbSBjdXJyZW50bHkg
aW52ZXN0aWdhdGluZyBhIExpdmUtUGF0Y2ggYXBwbGljYXRpb24gZmFpbHVyZSBpbiBjb3JlLQo+
PiBzY2hlZHVsaW5nIG1vZGUgYW5kIHRoaXMgaXMgYW4gZXhhbXBsZSBvZiB3aGF0IEkgdXN1YWxs
eSBnZXQ6Cj4+IChpdCdzIGVhc2lseSByZXByb2R1Y2libGUpCj4+Cj4+ICAgICAgKFhFTikgWyAg
MzQyLjUyODMwNV0gbGl2ZXBhdGNoOiBscDogQ1BVOCAtIElQSWluZyB0aGUgb3RoZXIgMTUgQ1BV
cwo+PiAgICAgIChYRU4pIFsgIDM0Mi41NTgzNDBdIGxpdmVwYXRjaDogbHA6IFRpbWVkIG91dCBv
biBzZW1hcGhvcmUgaW4gQ1BVIHF1aWVzY2UgcGhhc2UgMTMvMTUKPj4gICAgICAoWEVOKSBbICAz
NDIuNTU4MzQzXSBiYWQgY3B1czogNiA5Cj4+Cj4+ICAgICAgKFhFTikgWyAgMzQyLjU1OTI5M10g
Q1BVOiAgICA2Cj4+ICAgICAgKFhFTikgWyAgMzQyLjU1OTU2Ml0gWGVuIGNhbGwgdHJhY2U6Cj4+
ICAgICAgKFhFTikgWyAgMzQyLjU1OTU2NV0gICAgWzxmZmZmODJkMDgwMjNmMzA0Pl0gUiBjb21t
b24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhhNC8weDI3MAo+PiAgICAg
IChYRU4pIFsgIDM0Mi41NTk1NjhdICAgIFs8ZmZmZjgyZDA4MDIzZjhhYT5dIEYgY29tbW9uL3Nj
aGVkdWxlLmMjc2NoZWR1bGUrMHgxN2EvMHgyNjAKPj4gICAgICAoWEVOKSBbICAzNDIuNTU5NTcx
XSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJx
KzB4NWEvMHg5MAo+PiAgICAgIChYRU4pIFsgIDM0Mi41NTk1NzRdICAgIFs8ZmZmZjgyZDA4MDI3
OGVjNT5dIEYgYXJjaC94ODYvZG9tYWluLmMjZ3Vlc3RfaWRsZV9sb29wKzB4MzUvMHg2MAo+Pgo+
PiAgICAgIChYRU4pIFsgIDM0Mi41NTk3NjFdIENQVTogICAgOQo+PiAgICAgIChYRU4pIFsgIDM0
Mi41NjAwMjZdIFhlbiBjYWxsIHRyYWNlOgo+PiAgICAgIChYRU4pIFsgIDM0Mi41NjAwMjldICAg
IFs8ZmZmZjgyZDA4MDI0MTY2MT5dIFIgX3NwaW5fbG9ja19pcnErMHgxMS8weDQwCj4+ICAgICAg
KFhFTikgWyAgMzQyLjU2MDAzMl0gICAgWzxmZmZmODJkMDgwMjNmMzIzPl0gRiBjb21tb24vc2No
ZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhjMy8weDI3MAo+PiAgICAgIChYRU4p
IFsgIDM0Mi41NjAwMzZdICAgIFs8ZmZmZjgyZDA4MDIzZjhhYT5dIEYgY29tbW9uL3NjaGVkdWxl
LmMjc2NoZWR1bGUrMHgxN2EvMHgyNjAKPj4gICAgICAoWEVOKSBbICAzNDIuNTYwMDM5XSAgICBb
PGZmZmY4MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4NWEv
MHg5MAo+PiAgICAgIChYRU4pIFsgIDM0Mi41NjAwNDJdICAgIFs8ZmZmZjgyZDA4MDI3OWRiNT5d
IEYgYXJjaC94ODYvZG9tYWluLmMjaWRsZV9sb29wKzB4NTUvMHhiMAo+Pgo+PiBUaGUgZmlyc3Qg
SFQgc2libGluZyBpcyB3YWl0aW5nIGZvciB0aGUgc2Vjb25kIGluIHRoZSBMUC1hcHBsaWNhdGlv
bgo+PiBjb250ZXh0IHdoaWxlIHRoZSBzZWNvbmQgd2FpdHMgZm9yIHRoZSBmaXJzdCBpbiB0aGUg
c2NoZWR1bGVyIGNvbnRleHQuCj4+Cj4+IEFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gaW1wcm92
ZSB0aGlzIHNpdHVhdGlvbiBhcmUgd2VsY29tZS4KPgo+IENhbiB5b3UgdGVzdCB0aGUgYXR0YWNo
ZWQgcGF0Y2gsIHBsZWFzZT8gSXQgaXMgb25seSB0ZXN0ZWQgdG8gYm9vdCwgc28KPiBJIGRpZCBu
byBsaXZlcGF0Y2ggdGVzdHMgd2l0aCBpdC4KClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBJdCBz
ZWVtcyB0byBmaXggdGhlIGlzc3VlIGluIG15IG1hbnVhbCB0ZXN0aW5nLgpJJ20gZ29pbmcgdG8g
c3VibWl0IGF1dG9tYXRpYyBMUCB0ZXN0aW5nIGZvciBib3RoIHRocmVhZC9jb3JlIG1vZGVzLgoK
LS0KVGhhbmtzLApTZXJnZXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
