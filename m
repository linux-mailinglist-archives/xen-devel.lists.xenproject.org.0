Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384F7EDFD8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 13:17:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRbFi-0006gR-Kt; Mon, 04 Nov 2019 12:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zIFX=Y4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iRbFg-0006gM-P4
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 12:14:32 +0000
X-Inumbo-ID: a79faf9a-fefc-11e9-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79faf9a-fefc-11e9-b678-bc764e2007e4;
 Mon, 04 Nov 2019 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572869671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uqd3g6wFku3CJRdz3lGVOgTvgIoEVZ1BvJX/iHBFeU0=;
 b=cq9kw/tq6XZrD9oc/KMyd1lZZyUS+fOhSmqUqBX5fEk8ifWAhQDZzEoW
 UFb4fKKfNg7UC8AdVvK37sYKzJG2F41MxPtpiPb+NzJ0c8n8ao5IHc2GO
 QHNZXOAilcRlw8jyxh6nKdp92hF74ov7YRVIw40eziLQyw+aGc/wK8sr2 A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BMxAcmxtsDOLkgGHIcRQuovX+aeC4gTcqFJ9RuWiAekFVmcatUQr1gMY9FZwOkVn5DP2KP/aSu
 4Nt+9syh6ISHf1wdebwJGMUpA8O607s7b/YC4jtPulSqQBw9nekcnhboVKZ+rnbidb/ZRZRDaZ
 +zbQQ416ZpCnTgXPKgLRCXtT/imjcSxVxqcvSq9CgUc3nNbXVuwUC0yD3LmWmC0JAR+X8SuvxS
 a7zl/U0uEmrPBcMv5OVcG8qTiQInG6W9hmMERZKi0SOUR7eeXChVBZMStvZeZqOJjCM1uDX4nJ
 3Ks=
X-SBRS: 2.7
X-MesageID: 7798936
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="7798936"
Date: Mon, 4 Nov 2019 12:14:23 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191104121423.GG2381@perard.uk.xensource.com>
References: <1572632881-9050-1-git-send-email-igor.druzhinin@citrix.com>
 <901b33296f1a4ee489da04d79932127b@EX13D32EUC003.ant.amazon.com>
 <105f4eda-14e0-33b9-e364-1f8a71dce9d9@citrix.com>
 <91a26b3802f44d0cbd9dfef227557780@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91a26b3802f44d0cbd9dfef227557780@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] passthrough: simplify locking
 and logging
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MTM6NDhBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gU2VudDogMDQgTm92ZW1iZXIgMjAx
OSAxMTowNgo+ID4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+IENjOiBJZ29yIERydXpoaW5pbiA8aWdvci5k
cnV6aGluaW5AY2l0cml4LmNvbT47IGpncm9zc0BzdXNlLmNvbTsKPiA+IGpiZXVsaWNoQHN1c2Uu
Y29tCj4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIGZvci00LjEzIHYyXSBwYXNz
dGhyb3VnaDogc2ltcGxpZnkgbG9ja2luZwo+ID4gYW5kIGxvZ2dpbmcKPiA+IAo+ID4gT24gMDQv
MTEvMjAxOSAwODozMSwgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4gPiA+PiBGcm9tOiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5A
Y2l0cml4LmNvbT4KPiA+ID4+IFNlbnQ6IDAxIE5vdmVtYmVyIDIwMTkgMTk6MjgKPiA+ID4+IFRv
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+ID4+IENjOiBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY29tPjsgamJldWxpY2hAc3VzZS5jb207Cj4gPiA+PiBqZ3Jvc3NA
c3VzZS5jb20KPiA+ID4+IFN1YmplY3Q6IFtQQVRDSCBmb3ItNC4xMyB2Ml0gcGFzc3Rocm91Z2g6
IHNpbXBsaWZ5IGxvY2tpbmcgYW5kIGxvZ2dpbmcKPiA+ID4+Cj4gPiA+PiBGcm9tOiBQYXVsIER1
cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gPiA+Pgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+ID4+IC0tLQo+ID4g
Pj4KPiA+ID4+Cj4gPiA+PiB2MjogdXBkYXRlZCBQYXVsJ3MgZW1haWwgYWRkcmVzcwo+ID4gCj4g
PiBUaGlzIHdhcyB3b3JrIHlvdSBkaWQgYXQgQ2l0cml4LCB5ZXM/Cj4gPiAKPiA+ID4gUmV2aWV3
ZWQtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+IAo+ID4gU29CIGFu
ZCBSLWJ5Pwo+IAo+IEkgZGlkIGRvIHRoZSB3b3JrIHdoaWxlIEkgd2FzIGF0IENpdHJpeCwgYnV0
IHN1cmVseSB0aGUgU29CIG11c3QgYmUgdXBkYXRlZCBzaW5jZSB0aGUgcGF0Y2ggaXMgb25seSBu
b3cgYmVpbmcgcG9zdGVkPwoKSSBkb24ndCB0aGluayBpdCBtYXR0ZXJzIHdoZW4gYSBwYXRjaCBp
cyBwdWJsaWNseSBwb3N0ZWQsIHRoZSBTb0IKc2hvdWxkbid0IGNoYW5nZS4KQWxzbywgSWdvciwg
SSB0aGluayB5b3UgbmVlZCB0byBhZGQgeW91ciBvd24gU29CIHRvIHRoZSBwYXRjaC4gVGhpcyB3
b3VsZApiZSBiZWNhdXNlIG9mIChiKSBvciAoYykgb2YgdGhlICJEZXZlbG9wZXIncyBDZXJ0aWZp
Y2F0ZSBvZiBPcmlnaW4gMS4xIiBbMV0uCgo+IEFzIGZvciB0aGUgUi1iLCB3aHkgc2hvdWxkIHRo
YXQgYmUgaGlzdG9yaWM/CgpJIHRoaW5rIGhlIG1lYW50IHRoYXQgcmV2aWV3aW5nIHlvdXIgb3du
IHdvcmsgaXMgYSBiaXQgd2VpcmQuIE9uIHRoZQpvdGhlciBoYW5kLCBpdCBpcyBwb3NzaWJsZSB0
byBoYXZlIGJvdGggYSBTb0IgYW5kIGEgUi1iIGZyb20gdGhlIHNhbWUKcGVyc29uZSwgaWYgdGhl
IG9yaWdpbmFsIHBhdGNoIGhhcyBiZWVuIG1vZGlmaWVkLgoKClsxXToKRGV2ZWxvcGVyJ3MgQ2Vy
dGlmaWNhdGUgb2YgT3JpZ2luIDEuMQoKQnkgbWFraW5nIGEgY29udHJpYnV0aW9uIHRvIHRoaXMg
cHJvamVjdCwgSSBjZXJ0aWZ5IHRoYXQ6CgooYSkgVGhlIGNvbnRyaWJ1dGlvbiB3YXMgY3JlYXRl
ZCBpbiB3aG9sZSBvciBpbiBwYXJ0IGJ5IG1lIGFuZCBJCiAgICBoYXZlIHRoZSByaWdodCB0byBz
dWJtaXQgaXQgdW5kZXIgdGhlIG9wZW4gc291cmNlIGxpY2Vuc2UKICAgIGluZGljYXRlZCBpbiB0
aGUgZmlsZTsgb3IKCihiKSBUaGUgY29udHJpYnV0aW9uIGlzIGJhc2VkIHVwb24gcHJldmlvdXMg
d29yayB0aGF0LCB0byB0aGUgYmVzdAogICAgb2YgbXkga25vd2xlZGdlLCBpcyBjb3ZlcmVkIHVu
ZGVyIGFuIGFwcHJvcHJpYXRlIG9wZW4gc291cmNlCiAgICBsaWNlbnNlIGFuZCBJIGhhdmUgdGhl
IHJpZ2h0IHVuZGVyIHRoYXQgbGljZW5zZSB0byBzdWJtaXQgdGhhdAogICAgd29yayB3aXRoIG1v
ZGlmaWNhdGlvbnMsIHdoZXRoZXIgY3JlYXRlZCBpbiB3aG9sZSBvciBpbiBwYXJ0CiAgICBieSBt
ZSwgdW5kZXIgdGhlIHNhbWUgb3BlbiBzb3VyY2UgbGljZW5zZSAodW5sZXNzIEkgYW0KICAgIHBl
cm1pdHRlZCB0byBzdWJtaXQgdW5kZXIgYSBkaWZmZXJlbnQgbGljZW5zZSksIGFzIGluZGljYXRl
ZAogICAgaW4gdGhlIGZpbGU7IG9yCgooYykgVGhlIGNvbnRyaWJ1dGlvbiB3YXMgcHJvdmlkZWQg
ZGlyZWN0bHkgdG8gbWUgYnkgc29tZSBvdGhlcgogICAgcGVyc29uIHdobyBjZXJ0aWZpZWQgKGEp
LCAoYikgb3IgKGMpIGFuZCBJIGhhdmUgbm90IG1vZGlmaWVkCiAgICBpdC4KCihkKSBJIHVuZGVy
c3RhbmQgYW5kIGFncmVlIHRoYXQgdGhpcyBwcm9qZWN0IGFuZCB0aGUgY29udHJpYnV0aW9uCiAg
ICBhcmUgcHVibGljIGFuZCB0aGF0IGEgcmVjb3JkIG9mIHRoZSBjb250cmlidXRpb24gKGluY2x1
ZGluZyBhbGwKICAgIHBlcnNvbmFsIGluZm9ybWF0aW9uIEkgc3VibWl0IHdpdGggaXQsIGluY2x1
ZGluZyBteSBzaWduLW9mZikgaXMKICAgIG1haW50YWluZWQgaW5kZWZpbml0ZWx5IGFuZCBtYXkg
YmUgcmVkaXN0cmlidXRlZCBjb25zaXN0ZW50IHdpdGgKICAgIHRoaXMgcHJvamVjdCBvciB0aGUg
b3BlbiBzb3VyY2UgbGljZW5zZShzKSBpbnZvbHZlZC4KCgpDaGVlcnMsCgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
