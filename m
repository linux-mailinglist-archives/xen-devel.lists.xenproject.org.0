Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C421B29
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 18:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRfOa-0001L1-Gq; Fri, 17 May 2019 16:07:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRfOY-0001Kt-LG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:07:42 +0000
X-Inumbo-ID: e5b00629-78bd-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5b00629-78bd-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 16:07:41 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Yq4hNTLCYCD7rzaUUgWFhF0e2gXju2RDHZhTo8GIhymolroBSoH3URF67MggxNMGeQfKKYPSof
 tLAOiy9T2dXpq3QLHIzoA+NqA7qw/SjufL/2+TRNRbtDBEsU8ivrvumujYnAzuJyEBEoBNCDPF
 KrBhvq75OvI1Y0Lg1Nq6k3nZp/+9vTdpjYIYz6EfqDhModpBLYFJ8Wtj632lEPV2GPzqQRwNO+
 oGtq/x6hJ4rwqmZ5DnM21suZb/CxP7IIrYDKwJ7GZMYd+X5zwOIE1YXw5GSXLwvpPN5vgrSsSP
 mpE=
X-SBRS: 2.7
X-MesageID: 566756
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="566756"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23774.56364.355028.254597@mariner.uk.xensource.com>
Date: Fri, 17 May 2019 17:07:08 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CDE5296020000780022FEC9@prv1-mh.provo.novell.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
 <23773.36372.890326.392603@mariner.uk.xensource.com>
 <5CDE5296020000780022FEC9@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] preparations for 4.11.2
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IHByZXBhcmF0aW9ucyBmb3IgNC4xMS4yIik6Cj4gT2th
eSAtIGFzIGFsc28gaW5kaWNhdGVkIG9uIGlyYywgd2l0aCB0aGUgd2Vla2VuZCBpbiBiZXR3ZWVu
IGFuZAo+IHdpdGggdGhlIG1vc3QgcmVjZW50IGZsaWdodCBoYXZpbmcgZmFpbGVkIGFueXdheSBp
dCBzaG91bGRuJ3QgYmUKPiB0b28gbXVjaCBvZiBhbiBleHRyYSBkZWxheS4KClJpZ2h0LiAgT0ss
IEkgaGF2ZSBwdXNoZWQgbXkgcXVldWUgbm93LgoKPiBZZXQgdG8gYmUgaG9uZXN0IC0gbW9zdCBv
ciBhbGwgb2YgdGhlc2UKPiBzaG91bGQgaGF2ZSBiZWVuIHJlcXVlc3RlZCBhbmQgY29tbWl0dGVk
IHNldmVyYWwgd2Vla3MgYWdvLAo+IHNvb24gYWZ0ZXIgdGhlIG1haWwgYXQgdGhlIHJvb3Qgb2Yg
dGhpcyB0aHJlYWQgd2FzIHNlbnQuIEkgd29uZGVyCj4gaWYgSSBuZWVkIHRvIGFkZCBhIGhhcmQg
Y3V0LW9mZiBkYXRlIHRvIHRoZXNlIGluaXRpYXRvciBtYWlscyB0aGF0IEkKPiBzZW5kLiBJJ2Qg
cHJlZmVyIG5vdCB0bywgbm90IHRoZSBsZWFzdCBiZWNhdXNlIG9mIHVuZm9yZXNlZW4KPiBpc3N1
ZXMgbGlrZSB0aGUgcmVjZW50IG1vbnRoLWxvbmcgKG9yIG1vcmU/KSBvc3N0ZXN0IHN0YWxsLgoK
SSB0aGluayBzdGF0aW5nIGEgY3V0LW9mZiBkYXRlIHdvdWxkIGJlIGEgdmVyeSBzZW5zaWJsZSBp
ZGVhLiAgSWYKY2lyY3Vtc3RhbmNlcyBjaGFuZ2UgeW91IGNhbiBhbHdheXMgc2F5ICJiZWNhdXNl
IG9mIFgsIHRoaXMgZGVhZGxpbmUKaXMgYmVpbmcgd2FpdmVkL2V4dGVuZGVkIi4KCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
