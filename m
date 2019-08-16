Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311D902B4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybzB-0008Oh-N6; Fri, 16 Aug 2019 13:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGx2=WM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hybz9-0008OW-NY
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:09:39 +0000
X-Inumbo-ID: 18d3894f-c027-11e9-8bb7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18d3894f-c027-11e9-8bb7-12813bfff9fa;
 Fri, 16 Aug 2019 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565960977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n8uV7rxWCBVHbRQ01I3BYBJw+grhOVynSh9lPZ+569k=;
 b=QSZOaoTL9prWs/uwOavAWIwMrAwmUYnWRj1EJ5J1MVvtvojb7ai4lWbm
 IpJMyRtHH5Q95Wg6jEgKR2LXrnI0cqtAXpRPMnhnHUW8aXOIl0EgN3ILH
 lDTRRNIQBJ4fC3pmd2FxfGNG81vQLIjDsKm3XB5jL7JwGzuWlpDt+YFZC 0=;
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
IronPort-SDR: 0tYY+/wBecOo2S+TlV/t7oYTTl8OR6uujxYwxiJcUFYzsxChHTnwEhl34M9EZHU3Z/2cD3HzXo
 hMzBGl36ZhjopUV0RspuDLSm9Qyx5bK3Saozqb8yO4EWle5VG2BFObhiWccEJ58RK6QG84tRbQ
 D6pjQdVp2mfX4ffqTbVpNP4F4H/3bURYYoGO8igGow0A1Rjn2C8OycCzl3lW/Yutzg0EaKD27h
 bugNlT8jwmTvzXv8egwbtq5cn17PiDB6gW3/w1/1/3vC+EzssXtcz61vypSQm4QHrjhZ1GLnrx
 Pqw=
X-SBRS: 2.7
X-MesageID: 4517829
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4517829"
Date: Fri, 16 Aug 2019 14:09:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190816130934.GH1289@perard.uk.xensource.com>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
 <20190813153020.GC1289@perard.uk.xensource.com>
 <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
 <20190813164215.GE1289@perard.uk.xensource.com>
 <20190816124707.l4qnujnvs5epf3kp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816124707.l4qnujnvs5epf3kp@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTI6NDc6MDdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAwNTo0MjoxNVBNICswMTAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDA0OjQ3OjIzUE0gKzAxMDAsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+IEVycm9yIGJldHdlZW4gdXNlciBhbmQgdGVybWluYWwu
IDopCj4gPiA+IAo+ID4gPiBJJ2Qgc3luYydkIHhsIGFuZCBsaWJ4bC5zbywgYnV0IG5vdCBsaWJ4
bHUuc28KPiA+IAo+ID4gSSBhY3R1YWxseSBtYWRlIHRoZSBzYW1lIG1pc3Rha2UgZmlyc3QgdGlt
ZSBJIHRyaWVkLgo+ID4gCj4gPiA+IE9rLCBzbyB0aGF0IGlzIHdvcmtpbmcgbm93LsKgIEkgdGhp
bmsgJ2NtZGxpbmUrPSIgZG9tMD1wdmgKPiA+ID4gZG9tMC1pb21tdT1ub25lIicgaXMgc2xpZ2h0
bHkgbGVzcyB0b3J0dXJlZCBzeW50YXgsIGJ1dCBJIGd1ZXNzIHRoZXJlIGlzCj4gPiA+IG5vIHdh
eSB0aGF0IHRoaXMgaXNuJ3QgZ29pbmcgdG8gYmUgaG9ycmlibGUuCj4gPiA+IAo+ID4gPiBBcyBm
b3IgdGhlIGdlbmVyYWwgbWVjaGFuaXNtLCBob3cgdXNhYmxlIGlzICs9IGZvciBhbnl0aGluZyBv
dGhlciB0aGFuCj4gPiA+IGNtZGxpbmU/wqAgTW9zdCBzdHJpbmdzIGluIGNvbmZpZyBmaWxlcyBj
YW4ndCB1c2VmdWxseSBiZSBleHRlbmRlZCBpbgo+ID4gPiB0aGlzIG1hdHRlciAtIGlmIHRoZXkg
bmVlZCBjaGFuZ2luZywgdGhleSBuZWVkIGNoYW5naW5nIHdob2xlc2FsZS4KPiA+IAo+ID4gVGhh
dCdzIHRydWUsIGJ1dCBvbmUgY291bGQgaW1hZ2luZyBzb21lIG1heWJlIGJhZCBleGFtcGxlIGxp
a2UgYWRkaW5nIGEKPiA+IHN1ZmZpeCB0byB0aGUgbmFtZSBvZiB0aGUgZ3Vlc3Q6ICJuYW1lKz0n
LW92bWYnOyIuCj4gPiBHb2luZyB0aHJvdWdoIGBtYW4geGwuY2ZnJywgbWF5YmUgYSBnb29kIGV4
YW1wbGUgb3RoZXIgdGhhbiBjbWRsaW5lCj4gPiBjb3VsZCBiZSAiY3B1cys9JyxeMSciIGJ1dCBt
YXliZSBhIHNwYWNlIGlzIGZpbmUgaGVyZSwgb3Igb25lIGNvdWxkIHVzZQo+ID4gYSBsaXN0IGlu
c3RlYWQuCj4gPiBPdGhlciBwb3RlbnRpYWwgdXNlcyBjb3VsZCBiZSBmb3IgIlBBVEgiLCBidXQg
aW4gdGhpcyBjYXNlIGl0IHdvdWxkIGJlCj4gPiBiZXR0ZXIgcmVzZXQgdGhlIHNldHRpbmcgcmF0
aGVyIHRoYXQgYXR0ZW1wdGluZyB0byBhZGQgYSBzdWZmaXggdG8gYW4KPiA+IGV4aXN0aW5nIG9u
ZS4KPiA+IAo+ID4gSSB3b25kZXIgaWYgaW5zdGVhZCBvZiBkb2luZyArPSBvbiBhbGwgc3RyaW5n
cywgd2Ugc2hvdWxkIGluc3RlYWQgaGF2ZQo+ID4gYHhsJyB3aGl0ZWxpc3QgdGhlIGZldyBvcHRp
b25zIHdoZXJlICs9IHdvdWxkIG1ha2Ugc2Vuc2UuIChhbmQgYXQgdGhhdAo+ID4gcG9pbnQsIGl0
IHdvdWxkIGJlIGVhc3kgdG8gYWRkIGEgJyAnIHdoZXJlIGlzIG1ha2Ugc2Vuc2UsIGxpa2UKPiA+
ICJjbWRsaW5lInMuIEJ1dCB0aGVuLCBob3cgdG8gdGVsbCB1c2VycyB0aGF0IGl0IGNhbid0IGRv
ICJuYW1lKz0nLW5ldyciPwo+ID4gYmVjYXVzZSB4bHUgd291bGQganVzdCBwcmludCBhIHdhcm5p
bmcsIGFuZCB4bCB3b3VsZCBrZWVwIGdvaW5nIHdpdGgKPiA+IG5hbWU9IiIuICBUcnkgInhsIGNy
ZWF0ZSBtZW1vcnkrPTQyIiA7LSkuCj4gCj4gTm90IHN1cmUgSSBmb2xsb3cuIENhbiB5b3UgbGlt
aXQgdGhpcyBpbiB4bD8KCldpdGggYSBwYXRjaCB0byB4bCwgeWVzIDstKS4gV2hhdCBjb3VsZCBi
ZSBkb25lIGlzIHRvIGFkZCBhIG5ldyBBUEkgaW4KbGlieGx1LiBUaGUgb3JpZ2luYWwgZnVuY3Rp
b24gZ2V0X3N0cmluZygpIGNvdWxkIHJldHVybiBhbiBlcnJvciBpZiArPQp3YXMgdXNlZCBvbiBh
IHNwZWNpZmljIHNldHRpbmcuIEEgbmV3IGZ1bmN0aW9uIGdldF9hcHBlbmRlZF9zdHJpbmcoKQoo
d29ya2luZyB0aXRsZSksIGNvdWxkIHJldHVybiByZXR1cm4gYSBzdHJpbmcgd2l0aCB0aGUgKz0g
Y29tcHV0YXRpb24KZG9uZS4gVGhhdCB3YXksIHhsIGNhbiBjaG9vc2Ugd2hpY2ggc2V0dGluZyBh
cmUgYWxsb3dlZCB0byBoYXZlICs9IHVzZWQKKGFuZCBpdCBjb3VsZCBldmVuIHVzZSBob3cgdG8g
ZG8gaXQsIGkuZS4gYWRkIHNwYWNlcyBiZXR3ZWVuIHN0cmluZ3Mgb3IKbm90KS4KCj4gSXNuJ3Qg
Kz0gaGFuZGxlZCBpbiBsaWJ4bHUgYWxyZWFkeT8KCkl0J3Mgbm90LCB0aGlzIHBhdGNoIGFkZHMg
dGhlIGNhcGFiaWxpdHkgaW50byBsaWJ4bHUuCgpDaGVlcnMsCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
