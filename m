Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53421AEB7E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:27:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7g8M-0007jU-CH; Tue, 10 Sep 2019 13:24:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7g8K-0007jP-Bt
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:24:36 +0000
X-Inumbo-ID: 54cd3070-d3ce-11e9-ac1e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54cd3070-d3ce-11e9-ac1e-12813bfff9fa;
 Tue, 10 Sep 2019 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568121875;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ve048Ll349yz5hNeXw6SQTGylRsmb+2YSJGEk+MTMRs=;
 b=LuA2zXqrvkxRsq3T/z7zYxQJtF+OzoL/MoWtVN3+asq/PEfQAzys0i+y
 vvP6gOTeI8zfMMhdaf1ayxlSy2g+nXM6DDsmyStwAeQWoeoF+KkTe59p8
 02MLo1Iv3iKEk2yt9ktGPkaOWzS95ZCJ8JvuALsWoODxWhIXEMWU3Ws0t s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hE4JIaNCucdR7ehIR3iNjEttJTxK046/f4ueVbVwUNdUwkCaIvjcrqZ92soErwUAtM9H8m/mNE
 bZvn8D/wyS9hGrsBWJP3d7b0/BAb9k3crl/zdZ2DrLWUPe0zVK7J+Adj2qgCyLrrQ1pd54vxlg
 PleX/JLw1agocxdmqlDj9N4vOPs49oD7K2H6OlcwNnMybkn1/bXciaQhsQU+CV7mfMHqAjfNSU
 SVpBAqTpyjMd5Ia3aOt95dbKD+Qac5iNUBB8HuH8oOIH9QnpwXXOPwILx/Z9OHDP0y5pzX6w9f
 Oeg=
X-SBRS: 2.7
X-MesageID: 5608623
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5608623"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23927.41969.760363.770886@mariner.uk.xensource.com>
Date: Tue, 10 Sep 2019 14:24:01 +0100
To: Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jan Beulich <jbeulich@suse.com>, George Dunlap
 <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
 <julien.grall@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "Tim (Xen.org)" <tim@xen.org>
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 00/12] ocaml abi fixes
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIHYzIDAwLzEyXSBvY2FtbCBhYmkgZml4ZXMiKToK
PiBUaGlzIG5vdyBoYXMgZnVydGhlciB1cGRhdGVzIGFuZCBpbXByb3ZlbWVudHMuICBQYXRjaGVz
IDEtMyBhcmUgYXMKPiBiZWZvcmUuICBQYXRjaGVzIDQtMTIgYXJlIG5ldy4gIFRoYW5rcyB0byBB
bmR5IGZvciBoaXMgd29yayAoaW4KPiBwYXJ0aWN1bGFyLCBzb21lIGRlYnVnZ2luZyBhbmQgY29t
bWVudGFyeSBmb3IgbXkgc2NyaXB0KSB3aGljaCBJIGhhdmUKPiBpbmNvcnBvcmF0ZWQgaGVyZS4K
CkkgaGF2ZSBmaXhlZCBhIGZldyBtaW5vciBpc3N1ZXMgYXMgZGlzY3Vzc2VkIGluIHRoaXMgdGhy
ZWFkLCBhbmQKaW5jb3Jwb3JhdGVkIGFja3Mgc28gZmFyLgoKQW5kcmV3IGdhdmUgbWUgaGlzIGFj
a2VkL3Jldmlld2VkLWJ5IG9uIGlyYyBhbmQgSSBoYXZlIGFkZGVkIG15IG93bgpSLUIgdG8gdGhl
IHBhdGNoZXMgb2YgaGlzIEkgaW5jb3Jwb3JhdGVkIChhbmQsIGluIHNvbWUgY2FzZXMgd3JvdGUK
Y29tbWl0IG1lc3NhZ2VzIGZvcikuCgpUaGUgcmVzdWx0IGlzIGhlcmU6CiAgaHR0cHM6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9pd2oveGVuLmdpdDthPXN1bW1hcnkKICAtYiB3
aXAub2NhbWwudjMuMQpJIGNhbiByZXBvc3QgaXQgaWYgYW55b25lIHRoaW5rcyB0aGF0IHdvdWxk
IGJlIHVzZWZ1bC4KCkNocmlzdGlhbiwgYXJlIHlvdSBoYXBweSB3aXRoIG15IG90aGVyIGNoYW5n
ZXMgaW4gdG9vbHMvb2NhbWwgPwpJIGRvbid0IGZlZWwgSSBuZWVkIGEgZm9ybWFsIG9jYW1sIGFj
ayBmb3IgdGhlIGNoYW5nZXMgdG8gYWRkIHRoZQptaXNzaW5nIGVudHJpZXMgdG8gdGhlIGVudW0g
dHlwZXMgKHNpbmNlIHRob3NlIGFyZSBzdXBwb3NlZCB0byBmb2xsb3cKdGhlIGh5cGVydmlzb3Ig
QUJJKSBidXQgSSB0aGluayBJIG5lZWQgeW91ciBhY2sgZm9yIHRoZSBmdXJ0aGVyIHNjcmlwdAph
bmQgeGVuY3RybF9zdHVicyBjaGFuZ2VzIGluIHYzIChvciB2My4xKSBvZiB0aGlzIHNlcmllcy4K
CkFuZCBJIHRoaW5rIHRoZXJlIGlzIG9uZSBwYXRjaCBmcm9tIEFuZHkgdGhhdCBjb3VsZCBkbyB3
aXRoIGFuIGFjawpmcm9tIGEgaHlwZXJ2aXNvciBtYWludGFpbmVyIChoZW5jZSBUSEUgUkVTVCBp
biBteSAiVG8iIGZpZWxkKToKICB4ZW4vZG9tY3RsOiBEcm9wIGd1ZXN0IHN1ZmZpeCBmcm9tIFhF
Tl9ET01DVExfQ0RGX2h2bQoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
