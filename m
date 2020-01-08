Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0471344EE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 15:25:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipCDu-00065I-Qn; Wed, 08 Jan 2020 14:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipCDs-00065D-TU
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 14:22:12 +0000
X-Inumbo-ID: 3ddcf9f6-3222-11ea-bc14-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ddcf9f6-3222-11ea-bc14-bc764e2007e4;
 Wed, 08 Jan 2020 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578493325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wJV08ekTjsWdKGBS+YTLfGDE4UP4hoJerd8qCVec9Ic=;
 b=GIl5PkLLbai/r5LtZuvl+9nx9Bysab/I3QW/GRbpOsWD/pZfXus7NE6X
 oaaZquLA88AJJ/i6hMzg4MyTDYBjvbGrcVWEZqQEn48zWBq4+LU8lG6ZE
 l0C3lghf+ek+PNv8p69o9weZ0yIVxl3BOK5vqNYmCQ3860PvQiW02gy/l 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ROCs5Qk4JIS5igWIservhKBxXzWGtmiGj8R+Wn1ZchiWw7jw7nYcguGzAec/Zluo73Xg3tx2YS
 d6uOiMtt9aTZqD5TzvotKEuh9zeC2/OX4fj5KlOiKg85180cyPteoRJvhRwYMMIIqfFsSytagq
 vJscpcFuBC2I5hCJpJfRMSIGsvu4U89g/z9krZGV+ZwvMBDQwK+H8axPDiVJHPbfmT05JtdYwD
 ad/mAPQ3oK5WS4PY+hN6A3bwWzMuZ3KldXsL4v8kpyrnFkCQT4THDO5yTz6YWQXsAUzlQFa+lb
 cCw=
X-SBRS: 2.7
X-MesageID: 10786178
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10786178"
Date: Wed, 8 Jan 2020 15:21:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200108142154.GP11756@Air-de-Roger>
References: <CAK9nU=p6vCHsq2aGs4NND=qdRHekPLWoxwULP7-iY1d7JsSbWg@mail.gmail.com>
 <CAK9nU=rpLSrUgoyEjPw5MfuOzkC+=9R74Bch4yA2jv1FLWVtcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9nU=rpLSrUgoyEjPw5MfuOzkC+=9R74Bch4yA2jv1FLWVtcQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Proxying Hyper-V hypercalls from L2 to L0
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <liuwe@microsoft.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDQ6MDk6MDlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIDMwIERlYyAyMDE5IGF0IDE2OjI0LCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3cm90
ZToKPiA+Cj4gPiBIaSBhbGwKPiA+Cj4gPiBBcyBtdWNoIGFzIEkgdHJ5IHRvIGF2b2lkIHdyaXRp
bmcgY29kZSB0byBwcm94eSBIeXBlci1WIGh5cGVyY2FsbHMsIGl0Cj4gPiBzZWVtcyB1bmF2b2lk
YWJsZSBmb3IgUFYgZ3Vlc3RzLCBiZWNhdXNlIEh5cGVyLVYgcmVxdWlyZXMgaHlwZXJjYWxscwo+
ID4gdG8gYmUgaXNzdWVkIHdpdGggQ1BMPTAuCj4gPgo+ID4gVGhpcyBtZWFucyBmb3IgUFYgRG9t
MCBJIHdpbGwgbmVlZCB0byBhZGQgY29kZSBpbiBYZW4gdG8gc3VwcG9ydAo+ID4gSHlwZXItVidz
IEFCSXMsIGFsb25nIHdpdGggYXBwcm9wcmlhdGUgdmFsaWRhdGlvbnMuCj4gPgo+ID4gSG93IG11
Y2ggZG8geW91IGNhcmUgYWJvdXQgcnVubmluZyBhIFBWIERvbTAgaW4gdGhpcyBYZW4gb24gSHlw
ZXItVgo+ID4gc2V0dXA/IEkgcGVyc29uYWxseSB3b3VsZCBjZXJ0YWlubHkgZ28gZnVsbCBvbiBQ
VkggaWYgcG9zc2libGUuIDotKQo+ID4KPiAKPiBJIHRlc3RlZCBQVkggRG9tMCBpbiBYZW4gb24g
SHlwZXItViBzZXR1cCBqdXN0IG5vdy4gVW5mb3J0dW5hdGVseQo+IEh5cGVyLVYgZG9lc24ndCBz
dXBwb3J0IHZJT01NVSB5ZXQuIERvbTAgZGlkbid0IGdldCBhbnkgaW50ZXJydXB0IGluCj4gdGhh
dCBzZXR1cC4KCldpdGhvdXQgRE1BIHJlbWFwcGluZyBJL08gZGV2aWNlcyB3b24ndCBiZSBhYmxl
IHRvIGdldCB0aGUgcmVhbAphZGRyZXNzZXMsIGFuZCB0aHVzIHdvbid0IHdvcmsgY29ycmVjdGx5
IG9yIGF0IGFsbC4gVGhlIG9ubHkgb3B0aW9uIGluCnN1Y2ggc2NlbmFyaW8gbGFja2luZyBhbiBJ
T01NVSB3b3VsZCBiZSB0byBidWlsZCBkb20wIHdpdGggYW4gaWRlbnRpdHkKbWVtb3J5IG1hcCwg
YnV0IEkgd291bGQgYXZvaWQgZ29pbmcgdGhhdCByb3V0ZSwgYXMgSSB0aGluayBpdCdzCmdvaW5n
IHRvIGNhdXNlIG1vcmUgcGFpbiB0aGF0IGp1c3QgdXNpbmcgYSBQViBkb20wLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
