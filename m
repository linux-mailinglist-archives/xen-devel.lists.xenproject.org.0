Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21181FA8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:00:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueR3-0003cL-5p; Mon, 05 Aug 2019 14:58:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wcQ6=WB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hueR1-0003cA-49
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:58:03 +0000
X-Inumbo-ID: 6bc5c421-b791-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6bc5c421-b791-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 14:58:02 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nm+DRrueYKFXcPepecQ9LGGezh7FcRSmDXCbu0j47Q+vhV0YOulY8yhbY5HAgj+o9H5efPNUUT
 wFr+P3uA3MI+G2sTKO175TApcbmLpH2yrJOMwNtgWXeSEWpG4Pok80yC3KBhieZ+CY3One6CHt
 3fJOryen8AY2ho07atZzYZWoFmUwU+bhjiKtB+3uu+rtANTucvI2Pac0LqHwOO0+ByEg9aTp/b
 LJu6jkrVAwEk4+zNlmy3CuXd39JIpVjy8E2i40It5LS0eFasMwwM9frqYFgMiLVfNAUPiWS24R
 FsM=
X-SBRS: 2.7
X-MesageID: 3994971
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3994971"
Date: Mon, 5 Aug 2019 15:57:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190805145759.GJ1242@perard.uk.xensource.com>
References: <1562133373-19208-1-git-send-email-chao.gao@intel.com>
 <20190703160317.GM13449@perard.uk.xensource.com>
 <20190719013839.GA8955@gao-cwp>
 <23880.16715.608881.373298@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23880.16715.608881.373298@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v2] libxl_qmp: wait for completion of device
 removal
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDM6NDY6MzVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQ2hhbyBHYW8gd3JpdGVzICgiUmU6IFtQQVRDSCB2Ml0gbGlieGxfcW1wOiB3YWl0IGZv
ciBjb21wbGV0aW9uIG9mIGRldmljZSByZW1vdmFsIik6Cj4gPiBPbiBXZWQsIEp1bCAwMywgMjAx
OSBhdCAwNTowMzoxN1BNICswMTAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+ID5PbiBXZWQs
IEp1bCAwMywgMjAxOSBhdCAwMTo1NjoxM1BNICswODAwLCBDaGFvIEdhbyB3cm90ZToKPiA+ID4+
IFRvIHJlbW92ZSBhIGRldmljZSBmcm9tIGEgZG9tYWluLCBhIHFtcCBjb21tYW5kIGlzIHNlbnQg
dG8gcWVtdS4gQnV0IGl0IGlzCj4gPiA+PiBoYW5kbGVkIGJ5IHFlbXUgYXN5Y2hyb25vdXNseS4g
RXZlbiB0aGUgcW1wIGNvbW1hbmQgaXMgY2xhaW1lZCB0byBiZSBkb25lLAo+ID4gPj4gdGhlIGFj
dHVhbCBoYW5kbGluZyBpbiBxZW11IHNpZGUgbWF5IGhhcHBlbiBsYXRlci4KPiA+ID4+IFRoaXMg
YmVoYXZpb3IgYnJpbmdzIHR3byBxdWVzdGlvbnM6Cj4gPiA+PiAxLiBBdHRhY2hpbmcgYSBkZXZp
Y2UgYmFjayB0byBhIGRvbWFpbiByaWdodCBhZnRlciBkZXRhY2hpbmcgdGhlIGRldmljZSBmcm9t
Cj4gPiA+PiB0aGF0IGRvbWFpbiB3b3VsZCBmYWlsIHdpdGggZXJyb3I6Cj4gPiA+PiAKPiA+ID4+
IGxpYnhsOiBlcnJvcjogbGlieGxfcW1wLmM6MzQxOnFtcF9oYW5kbGVfZXJyb3JfcmVzcG9uc2U6
IERvbWFpbiAxOnJlY2VpdmVkIGFuCj4gPiA+PiBlcnJvciBtZXNzYWdlIGZyb20gUU1QIHNlcnZl
cjogRHVwbGljYXRlIElEICdwY2ktcHQtNjBfMDAuMCcgZm9yIGRldmljZQo+ID4gPj4gCj4gPiA+
PiAyLiBBY2Nlc3NlcyB0byBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZSBpbiBRZW11IG1heSBvdmVy
bGFwIHdpdGggbGF0ZXIgZGV2aWNlCj4gPiA+PiByZXNldCBpc3N1ZWQgYnkgJ3hsJyBvciBieSBw
Y2liYWNrLgo+ID4gPj4gCj4gPiA+PiBJbiBvcmRlciB0byBhdm9pZCBtZW50aW9uZWQgcXVlc3Rp
b25zLCB3YWl0IGZvciB0aGUgY29tcGxldGlvbiBvZiBkZXZpY2UKPiA+ID4+IHJlbW92YWwgYnkg
cXVlcnlpbmcgYWxsIHBjaSBkZXZpY2VzIHVzaW5nIHFtcCBjb21tYW5kIGFuZCBlbnN1cmluZyB0
aGUgdGFyZ2V0Cj4gPiA+PiBkZXZpY2UgaXNuJ3QgbGlzdGVkLiBPbmx5IHJldHJ5IDUgdGltZXMg
dG8gYXZvaWQgJ3hsJyBwb3RlbnRpYWxseSBiZWluZyBibG9ja2VkCj4gPiA+PiBieSBxZW11Lgo+
IC4uLgo+ID4gQ291bGQgd2UgbWVyZ2UgdGhpcyBwYXRjaD8gb3IgbmVlZCBjb21tZW50cyBmcm9t
IHNvbWVvbmUgZWxzZT8KPiAKPiBJIHNlZSB0aGlzIHBhdGNoIHdhcyBpbiBmYWN0IG1lcmdlZC4K
PiAKPiBIb3dldmVyLCB0aGVyZSBpcyBhIHByb2JsZW0uCj4gCj4gSXQgYWRkcyBhIG5ldyBjYWxs
IHRvICJxbXBfc3luY2hyb25vdXNfc2VuZCIuICBXZSBoYXZlIGJlZW4gdHJ5aW5nIHRvCj4gbWFr
ZSBsaWJ4bCBub3QgdHJ1c3QgcWVtdSBhbmQgdGhhdCBtZWFucyBhYm9saXNoaW5nIGFsbCB1c2Vz
IG9mCj4gcW1wX3N5bmNocm9ub3VzX3NlbmQuICBOb3cgSSBrbm93IHRoYXQgY3VycmVudGx5IHdl
IGhhdmVuJ3QgZG9uZSB0aGF0Cj4gZm9yIFBDSSBwYXNzdGhyb3VnaCBidXQgd2Ugc2hvdWxkIG5v
dCBiZSBhZGRpbmcgbW9yZSB0ZWNobmNpYWwgZGVidAo+IHVubGVzcyB3ZSBoYXZlIHRvLgo+IAo+
IFVuZm9ydHVuYXRlbHkgdGhlIHBsYWNlIHdoZXJlIHRoaXMgcGF0Y2ggaGFzIHRvIGFkZCBjb2Rl
IGFscmVhZHkgdXNlcwo+IHRoaXMgc3luY2hyb25vdXMgaW50ZXJmYWNlIGFuZCBjdXJyZW50bHkg
aXQgaXMgdGhlcmVmb3JlIG5vdCBlYXN5IHRvCj4gZG8gd2hhdCBDaGFvIEdhbyBuZWVkZWQgdG8g
ZG8uICBTbyBpdCB3YXMgcHJvYmFibHkgcmlnaHQgdG8gYWNjZXB0Cj4gdGhpcyBwYXRjaC4KPiAK
PiBNYXliZSB3ZSBzaG91bGQgaW50cm9kdWNlIGEgdGhpbmcgd2hpY2ggY2FuIG1ha2UgYSBsaWJ4
bF9fZXZfcW1wIGZyb20KPiBhIGxpYnhsX19xbXBfaGFuZGxlciwgb3IgbWFrZSBsaWJ4bF9fcW1w
X2hhbmRsZXIgY29udGFpbiBhCj4gbGlieGxfX2V2X3FtcCwgb3Igc29tZXRoaW5nID8gIElmIHdl
IGhhZCBoYWQgdGhhdCwgQ2hhbyBHYW8gY291bGQgaGF2ZQo+IHByb3ZpZGVkIGEgcGF0Y2ggaW50
cm9kdWNpbmcgbmV3IGNhbGxzIHRvIGxpYnhsX19ldl9xbXBfc2VuZCBldGMuCgpUaGF0IGxvb2tz
IGNvbXBsaWNhdGVkLiBJJ2QgcmF0aGVyIGdldCByaWQgb2YgdGhhdCBxbXBfc3luY2hyb25vdXNf
c2VuZApzdHVmZi4KCj4gQWRkaXRpb25hbGx5OiBpcyBpdCByZWFsbHkgdGhlIGNhc2UgdGhhdCB0
aGVyZSBpcyBubyB3YXkgdG8gaGF2ZSBxZW11Cj4gc2VuZCB1cyBhIHNpZ25hbCB3aGVuIHRoZSB3
b3JrIGlzIGRvbmUgPyAgVGhpcyBwb2xsaW5nIGlzIHJhdGhlciBwb29yLgoKVGhlcmUgaXMsIFFF
TVUgc2VuZHMgYW4gZXZlbnQgd2hlbiB0aGUgZGV2aWNlIGlzIHJlbW92ZWQuIE1heWJlIHdlIGNv
dWxkCmRlc2lnbiBhIG5ldyBBUEkgZm9yIGxpYnhsX19ldl9xbXAgdG8gaGFuZGxlIGV2ZW50cywg
SSB0aGluayB0aGF0J3MgZm9yCmFub3RoZXIgZGF5LgoKQWxzbywgc2VlIFsxXSB3aGljaCByZWlt
cGxlbWVudHMgdGhhdCBwb2xsaW5nIHdpdGggZXZfcW1wIGFuZCBldl90aW1lcgphbmQgaGF2ZSBh
IG5vdGUgYWJvdXQgdXNpbmcgZXZlbnRzIGluc3RlYWQ6ClsxXSBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDAyNDEuaHRtbAoK
VGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
