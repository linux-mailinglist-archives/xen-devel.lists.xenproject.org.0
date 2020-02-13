Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4115CA96
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 19:41:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2JNp-000383-Qr; Thu, 13 Feb 2020 18:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jlQm=4B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j2JNo-00037y-QL
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 18:38:40 +0000
X-Inumbo-ID: 0d312180-4e90-11ea-b923-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d312180-4e90-11ea-b923-12813bfff9fa;
 Thu, 13 Feb 2020 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581619120;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wbuKpBpnC88C100eqcc05Eac4zQhixQbiXsg1SP2P+A=;
 b=bAMZ/zoeBsmgvveHNJYZ9dBVGbUtB4Mp1eBF3No08xzyt8EGKZG5lRxU
 ia5VAYjsfpauddZlTO+KovegKyBYLWRlWybFNHyibtltUze1V2tJJlVx6
 wnWTZtUxoRCjVGuj/bK1PR3gEBWXr8msdGW4Rdz8U080ocgu1ez7TXe5y Y=;
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
IronPort-SDR: lq6Qnn/NPT+T8CSQu+GguUYLAQo+FbM9c+Vjm1r8IN+3V+mQiD4YL7g7Zg6Q+vjYRfe4E3VOe/
 hpCEUDi4YDXPea/PY89WVVYm8jraUhNs13uAcQUhBqRrXAwFKYNwwU/YbHQsUGGiqI8j/dwtNW
 AdvHFsG9JLI8sqYUs0nV/XlP6nJgmkflWR3FR7q9+NnoGaCShUOfW/reEphli6nc2nxmc/rcBc
 UO4NJ7lH/c7Qd+GZsSE6b2Ih3K04j79S5Evbndpx0txIqZjI1t1WI78iGHNZbCNj/tLZ8kO5tX
 ldw=
X-SBRS: 2.7
X-MesageID: 12597335
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,437,1574139600"; d="scan'208";a="12597335"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200213125449.14226-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1f5db5a6-e5c3-4d63-fdb4-e027d38bea18@citrix.com>
Date: Thu, 13 Feb 2020 18:38:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213125449.14226-1-jgross@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/8] xen: don't let keyhandlers block
 indefinitely on locks
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDIvMjAyMCAxMjo1NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBLZXloYW5kbGVycyBk
dW1waW5nIGh5cGVydmlzb3IgaW5mb3JtYXRpb24gdG8gdGhlIGNvbnNvbGUgb2Z0ZW4gbmVlZAo+
IHRvIHRha2UgbG9ja3Mgd2hpbGUgYWNjZXNzaW5nIGRhdGEuIEluIG9yZGVyIHRvIG5vdCBibG9j
ayBpbiBjYXNlIG9mCj4gc3lzdGVtIGluY29uc2lzdGVuY2llcyBpdCBpcyBjb252ZW5pZW50IHRv
IHVzZSB0cnlsb2NrIHZhcmlhbnRzIHdoZW4KPiBvYnRhaW5pbmcgdGhlIGxvY2tzLiBPbiB0aGUg
b3RoZXIgaGFuZCBhIGJ1c3kgc3lzdGVtIG1pZ2h0IGVhc2lseQo+IGVuY291bnRlciBoZWxkIGxv
Y2tzLCBzbyB0aGlzIHBhdGNoIHNlcmllcyBpcyBhZGRpbmcgc3BlY2lhbCB0cnlsb2NrCj4gdmFy
aWFudHMgd2l0aCBhIHRpbWVvdXQgdXNlZCBieSBrZXloYW5kbGVycy4KClRoaXMgaXMgYSBiYWNr
d2FyZHMgc3RlcC4KCktleWhhbmRsZXJzIGFyZSBmb3IgZGVidWdnaW5nIHB1cnBvc2VzLsKgIFdo
ZW4gZGVidWdnaW5nIGl0IGlzIGZhciBtb3JlIAppbXBvcnRhbnQgdG8gZ2V0IHRoZSByZXF1ZXN0
ZWQgZGF0YSwgdGhhbiBhbG1vc3QgYW55dGhpbmcgZWxzZS4KClRoZSBzeXN0ZW0gd2lsbCBjb3Bl
IHdpdGggYSBtdWx0aS1zZWNvbmQgb3V0YWdlIG9jY3VycmluZyBhcHByb3hpbWF0ZWx5IApuZXZl
ci7CoCBBIHBlcnNvbiBkZWJ1Z2dpbmcgd2hvIGNhbid0IGdldCB0aGUgZGF0YSBoYXMgbm8gY2hh
bmNlIG9mIApmaXhpbmcgd2hhdGV2ZXIgcHJvYmxlbSB0aGV5IGFyZSBsb29raW5nIGZvci4KClRo
aXMgc2VyaWVzIHNlZW1zIHRvIGJlIGJyZWFraW5nIHRoZSBvbmUgY3JpdGljYWwgdXNlY2FzZSBm
b3IgCmtleWhhbmRsZXJzLCB0byBmaXggd2hhdCAtIG5vdCBsZXQgZGVidWdnaW5nIGdldCBpbiB0
aGUgd2F5IG9mIHRoZSAKc21vb3RoIHJ1bm5pbmcgb2YgdGhlIHN5c3RlbT/CoCBBIHN5c3RlbSBp
biBuZWVkIG9mIGRlYnVnZ2luZyBpbiB0aGUgCmZpcnN0IHBsYWNlIGhhcyBiaWdnZXIgcHJvYmxl
bXMgdGhhbiBuZWVkaW5nIHRvIHJ1biBzbW9vdGhseS4KClRoZSBvbmx5IHRoaW5nIHdoaWNoIHNo
b3VsZCBoYXBwZW4gdG8gaW1wcm92ZSBzeXN0ZW0gc3RhYmlsaXR5IGlzIGZvciAKa2V5aGFuZGxl
cnMgdG8gZGlzYWJsZSB0aGUgc3lzdGVtIHdhdGNoZG9nIHdoaWxlIHRoZXkgYXJlIHJ1bm5pbmcs
IGluIApjYXNlIHRoZXkgaGFwcGVuIHRvIHJ1biBmb3Igc2Vjb25kcyBvZiB3YWxsY2xvY2sgdGlt
ZS4gVGhpcyBpcyBhbiBpc3N1ZSAKd2hpY2ggaXNuJ3QgYWRkcmVzc2VkIGJ5IHRoZSBzZXJpZXMs
IGJlY2F1c2Ugb25jZSBhIGtleWhhbmRsZXIgZG9lcyBnZXQgCmEgbG9jaywgaXQga2VlcHMgaXQg
dW50aWwgaXQgaXMgZG9uZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
