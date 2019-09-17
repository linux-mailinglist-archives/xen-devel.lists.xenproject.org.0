Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51801B52FD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGNo-00041N-1H; Tue, 17 Sep 2019 16:31:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlRc=XM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAGNm-00041G-MV
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:31:14 +0000
X-Inumbo-ID: 8faa2ffa-d968-11e9-961b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8faa2ffa-d968-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568737872;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=u/5sGWjeT94aeLTkKsArrNWdDLdNsDq/D+AIonInCAs=;
 b=aFAoHkUNH8YsPHrUljuhDZnNGmmBLuuj318LIGgxjhaU6udMRhyNZC60
 oZ3jRwxyzNLqQl/N5l1JYL4ub50yz1s8tR2bJIroDG6/sTRZgkEjuPE6a
 xznld9/hMNxe/sVmiQXo6iVPLI4yJx9wxM/PDhLnpSDPt0wvJ5afhLc68 g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XAb8AeOYh7i4/kYbkiidwl1EIFkDh1iYMjHRhaZrwD0Kt0G7563R9Da+V3XrnSEYgicDk/BHWY
 iDlwggB3i5Np8QKNAvldo7Ur7Xz0cbxzon4CO488bU0JbC9QoYlcL0eI5+4lTy5pePWKS5SoAU
 GrDb9DnlIH2hFTQS1DfkZn3z8r92AayfckKDQ5GfVPhddWg8u0N2Z5bj+Vimlzwbh5rINHrXkC
 LhD3UKIUUkeE4w9Uk+luDCm5EsyY+4BES2w+fY+wbD4yj0/4jMWttjwUXAN9hgymEGFh4vh9ED
 /NY=
X-SBRS: 2.7
X-MesageID: 5989647
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5989647"
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Wei Liu' <wl@xen.org>
References: <20190913160404.495-1-andrew.cooper3@citrix.com>
 <02785fd186584f12bf364a6949ff8a4d@AMSPEX02CL03.citrite.net>
 <302a0acc-618f-5793-5840-36d80881d07f@citrix.com>
 <3a73e41c33f24bbbbae1f6deb5a9e05e@AMSPEX02CL03.citrite.net>
 <387b2c9f-78e2-8c50-b702-b65d3ccb5787@citrix.com>
 <CAK9nU=oMcuiJzMO+GvGnGzHKF=DYCvXpQr5y1x2pwdayf9kxsg@mail.gmail.com>
 <1dc90060013844dab69b6a1347a80d6c@AMSPEX02CL03.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f713c15e-a82d-0693-e8e5-fe1795825b7f@citrix.com>
Date: Tue, 17 Sep 2019 17:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1dc90060013844dab69b6a1347a80d6c@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL
 print message
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDkvMjAxOSAxNDo1NiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+PiBTZW50OiAxNiBT
ZXB0ZW1iZXIgMjAxOSAxNDoyOQo+PiBUbzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT4KPj4gQ2M6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+
OyBYZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEphbiBCZXVsaWNo
Cj4+IDxKQmV1bGljaEBzdXNlLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUg
TW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ODYv
dmlyaWRpYW46IFJld29yZCBIVl9YNjRfTVNSX0NSQVNIX0NUTCBwcmludCBtZXNzYWdlCj4+Cj4+
IE9uIE1vbiwgMTYgU2VwIDIwMTkgYXQgMTQ6MTMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBbLi4uXQo+Pj4+Pj4+IFJlcGxhY2UgdGhlIFZJUklE
SUFOIHByZWZpeCB3aXRoICdyZXBvcnRlZCcgdG8gcmVkdWNlIHRoZSBjb25mdXNpb24gdG8KPj4+
Pj4+PiBub24teGVuLWRldmVsb3BlcnMgdHJ5aW5nIHRvIGludGVycHJldCB0aGUgbWVzc2FnZS4K
Pj4+Pj4+IFRoaXMgaXMgYSBtZXNzYWdlIHRoYXQgaXMgcGVjdWxpYXIgdG8gV2luZG93cyBWTXMs
IHNvIGhvdyBhYm91dCAiV2luZG93cyBWTSBDUkFTSCI/Cj4+Pj4+IEkgcHJlc3VtZSB5b3UgbWVh
biBwYXJ0aWN1bGFyLCBidXQgbm8gLSBpdCBpc24ndCB3aW5kb3dzIHdoaWNoIGlzIHRoZQo+Pj4+
PiBleGNsdXNpdmUgdXNlciBvZiB0aGlzIGludGVyZmFjZS4gIExpbnV4IGhhcyBhIGRyaXZlciB0
byB1c2UgaXQgd2hlbgo+Pj4+PiBydW5uaW5nIHVuZGVyIEh5cGVyVi4KPj4+PiBIbW0sIHRoYXQn
cyBhIGJpdCBvZGQuIEkgdGhvdWdodCB0aGUgY3Jhc2ggY29kZXMgYXJlIFdpbmRvd3Mgc3BlY2lm
aWMuIFBlcmhhcHMgdGhleSBjYW4gYmUKPj4gZGlzdGluZ3Vpc2hlZCBpbiBzb21lIHdheS4KPj4+
IExpbnV4IHNldHMgaXRzIG93biBndWVzdCBPUyBpZGVudGlmaWVyLCB3aGljaCBpcyBzb21lIGZ1
bmN0aW9uIG9mCj4+PiBIVl9MSU5VWF9WRU5ET1JfSUQuCj4+Pgo+Pj4+ICBBbGwgdGhlIHNhbWUs
IHRoZSBsb2cgbGluZSBuZWVkcyB0byBsZWFkIHBlb3BsZSB0byBzb21lIHdheSBvZiBkZWNvZGlu
ZyB0aGUgbWFnaWMgbnVtYmVycyBJCj4+IHRoaW5rLiBIb3cgYWJvdXQ6Cj4+Pj4gIlZJUklESUFO
IFJFUE9SVEVEIENSQVNIIgo+Pj4+Cj4+Pj4gPwo+Pj4gVGhhdCBpcyBzdGlsbCBqdXN0IGFzIGNv
bmZ1c2luZyB0byByZWFkLgo+Pj4KPj4+IFRoZXJlIGlzIG5vIHdheSB0byBkZWNvZGUgdGhlIG51
bWJlcnMgd2l0aG91dCBrbm93aW5nIHdoYXQgT1MgaXMKPj4+IHJ1bm5pbmcsIGFuZCBzaW1wbHkg
c2F5aW5nICJWaXJpZGlhbiIgZG9lc24ndCBoZWxwIHdpdGggdGhhdC4KPj4+Cj4+IFdvdWxkIGl0
IG1ha2Ugc2Vuc2UgdG8gY2FsbCBkdW1wX2d1ZXN0X29zX2lkIGhlcmUgYXMgd2VsbD8gU2VlaW5n
IHRoYXQKPj4gaXQgaXMgb25seSBwcmludGVkIHdoZW4gaXQgd2FzIGZpcnN0IHNldC4KPiBZZXMs
IHRoYXQncyBub3QgYSBiYWQgaWRlYS4KClRoaXMgaXMgYXMgbWF5YmUsIGJ1dCBzdGlsbCBkb2Vz
bid0IGhlbHAgd2l0aCBhbWJpZ3VpdHkgYmVjYXVzZSB5b3UKY2FuJ3QgZXhwZWN0IHBlb3BsZSB0
byByZWNvZ25pc2UgZ3Vlc3QtaWQncyBieSB0aGVpciBoZXggdmFsdWUuwqAgSXQgYWxzbwpkb2Vz
bid0IGhlbHAgd2l0aCB0aGUgY29uZnVzaW9uIG9mIGhhdmluZyB0aGUgd29yZCB2aXJpZGlhbiBp
biB0aGUKcHJpbnRlZCBzdHJpbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
