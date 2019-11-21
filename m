Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794F1053B7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 14:59:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXmx5-0004kp-Kt; Thu, 21 Nov 2019 13:56:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXmx3-0004k5-Nf
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 13:56:53 +0000
X-Inumbo-ID: c521a1f0-0c66-11ea-a333-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c521a1f0-0c66-11ea-a333-12813bfff9fa;
 Thu, 21 Nov 2019 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574344612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hbQ4eZltkEj/WgI6jnFgFgpOEWVZZ8nfstx0psbItbk=;
 b=G4Os2pdiKDMIm88UGAlkmkYkoY7wzR92rACXfUGE5WUiMkrG6XrugtrW
 7KkHhZDJC+Gw4FYVa+9PRzF7PnCg8CiC2p8yUnOKVA0NGbIXqbRykaiVl
 ZJeBVagU6IvFxu4Bk42fCXP1eDXVTG3BSvrYPv539SqTQ+AAPYiIbVl5r E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jq/wm+cyVrdjLMFR9pYOOCV232AU7dbhAzWKS39GBBebNj7cgasTCQjL0UMI5oMCiilZCDPzLE
 jxCv6e0i0sCCHmtsxtA0wXRPFBBewLD+lgYJ0Ks0N1TOQldE2TSHDERYwmQpfp0w4yXhkdPRCJ
 BtXn1uX9ND/MJXJFA6hsyuK6UGMd/R7XYNo23vJ93p8wpY0/sgvOMTfEKOhTw4vWu2miKVQtRy
 8JP4rcvTkHMjFiS6nNy3Vaoy0aQ4KR+IpD+1g5rAKEsm/yPJPKzDbGP+40kEtl50aHwStjeITO
 3SM=
X-SBRS: 2.7
X-MesageID: 8659680
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="8659680"
Date: Thu, 21 Nov 2019 14:56:35 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Rishi <2rushikeshj@gmail.com>
Message-ID: <20191121135635.GU72134@Air-de-Roger>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDc6MDk6MzFQTSArMDUzMCwgUmlzaGkgd3JvdGU6Cj4g
T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMjo0NyBQTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDE5LjExLjIwMTkgMDY6MjMsIFJpc2hpIHdyb3RlOgo+
ID4gPiBvaywgdGhhbmtzIGZvciBjbGVhcmluZyBpdCB1cC4gV291bGQgYSBwYXRjaCBiZSBhY2Nl
cHRlZCBpZiB0aGlzCj4gPiA+IG9wdGlvbiBvZiBzaG93aW5nIEVBWCBsZWFmIGlzIHNlbGVjdGl2
ZWx5IGRvbmUgdGhyb3VnaCBjb21tYW5kIGxpbmUKPiA+ID4gKGRlZmF1bHQgZGlzYWJsZWQpPwo+
ID4KPiA+IEluIGdlbmVyYWwgSSdkIGV4cGVjdCB0aGlzIHRvIGJlIHJhdGhlciB1bmxpa2VseSwg
YnV0IEkgZ3Vlc3MgbXVjaAo+ID4gd291bGQgZGVwZW5kIG9uIHRoZSBhY3R1YWwgcmVhc29uaW5n
IGRvbmUgaW4gdGhlIGRlc2NyaXB0aW9uLgo+ID4KPiA+ID4gT24gbG9uZ2VyIHJ1biwgd2hhdCBp
cyBhbiBleHBlY3RlZCBzYW5lIG1vZGVsIG9mIHZpcnR1YWxpemluZyB0aGlzPwo+ID4gPiBXaXRo
IHNvbWUgZ3VpZGFuY2UsIG1heSBiZSBJIG9yIHNvbWVvbmUgZWxzZSBjYW4gY29kZSB0byBicmlu
ZyB0aGUKPiA+ID4gZnVuY3Rpb25hbGl0eSBiYWNrLgo+ID4KPiA+IFdoaWNoIGZ1bmN0aW9uYWxp
dHk/IFNvIGZhciB5b3UndmUgdGFsa2VkIG9mIG9ubHkgQ1BVSUQgYml0cyBJCj4gPiB0aGluaywg
d2l0aG91dCBleHBsYWluaW5nIGF0IGFsbCB3aGF0IGZ1bmN0aW9uYWxpdHkgeW91IHdhbnQgdG8K
PiA+IGhhdmUgdGhhdCBkZXBlbmRzIG9uIHRoZXNlLiBJbiBnZW5lcmFsLCBhcyBzYWlkIGVhcmxp
ZXIsIENQVQo+ID4gbWFuYWdlbWVudCBpcyB0aGUgaHlwZXJ2aXNvcidzIHJlc3BvbnNpYmlsaXR5
LCBzbyBJJ2QgcmF0aGVyCj4gPiBub3Qgc2VlIHRoaXMgdmlydHVhbGl6ZWQsIGJ1dCB0aGUgaHlw
ZXJ2aXNvciBiZSBwdXQgaW50byBhCj4gPiBwb3NpdGlvbiBvZiBkb2luZyB3aGF0ZXZlciBpcyBu
ZWVkZWQuCj4gPgo+ID4gSmFuCj4gCj4gVGhlIHJlYXNvbmluZyB0byBoYXZlIEVBWCgweDA2aCkg
ZXhwb3NlZCB0byBEb20wIGlzIGZvciBUaGVybWFsIGFuZAo+IFBvd2VyIG1hbmFnZW1lbnQuCj4g
V2l0aG91dCBFQVgoMHgwNmgpIERvbTAgaXMgdW5hYmxlIHRvIHNlbnNlIHByZXNlbmNlIG9mIENQ
VSBjb3JlCj4gdGVtcGVyYXR1cmUgb3IgZG8gVGhlcm1hbCBtYW5hZ2VtZW50IC0gaW5jbHVkaW5n
IGJ1dCBub3QgbGltaXRlZCB0bwo+IG9wZXJhdGluZyBGYW4gc3BlZWQuCj4gRG9tMCBoYXMgdG8g
cmVseSBvbiBvdGhlciBwb3NzaWJsZSB3YXlzIHN1Y2ggYXMgaXBtaSBvciBCSU9TIHdoaWNoIGFy
ZQo+IG9wdGlvbmFsbHkgYXZhaWxhYmxlLgo+Cj4gRnJvbSB0aGUgcGF0Y2ggZGVzY3JpcHRpb24K
PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7
aD03MmUwMzg0NTBkM2Q1ZGUxYTM5ZjBjZmEyZDJiMGY5YjNkNDNjNmM2Cj4gaXQgc2VlbXMgdGhh
dCB0aGUgY2hhbmdlIHdhcyBpbnRyb2R1Y2VkIHRvIG5vdCBleHBvc2UgRUFYKDB4MDZoKSB0bwo+
IHVucHJpdmlsZWdlZCBQViBndWVzdHMgYnV0IG5vdGhpbmcgaXMgc2FpZCBmb3IgRG9tMCBpdHNl
bGYuIEkgdGhpbmsKPiB5b3UgYWxyZWFkeSBtZW50aW9uZWQgdGhhdCB0aGUgZmxhZyBpcyBoaWQg
ZnJvbSBEb20wIGFzIHdlbGwKPiBpbnRlbnRpb25hbGx5Lgo+IAo+IFNvIHVubGVzcyBoeXBlcnZp
c29yIHdhbnRzIHRvIGRvIHRoZXJtYWwgbWFuYWdlbWVudCBvZiB0aGUgQ1BVIGJvYXJkLAo+IGl0
IHdvdWxkIGluaGliaXQgRG9tMCdzIGFiaWxpdHkgdG8gZG8gdGhpcyBmdW5jdGlvbi4KClRoYXQn
cyBsaWtlbHkgd2hhdCB5b3Ugd2FudCwgb24gYSBYZW4gc3lzdGVtIGRvbTAgaXMgYSBzcGVjaWFs
IGd1ZXN0LApidXQgc3RpbGwgYSBndWVzdCwgc28gaXQncyBub3QgZmVhc2libGUgZm9yIGEgbmF0
aXZlIGRvbTAgZHJpdmVyIHRvIGRvCnBvd2VyIG9yIHRlbXBlcmF0dXJlIG1hbmFnZW1lbnQgd2l0
aG91dCBoYXZpbmcgWGVuIHNwZWNpZmljCmtub3dsZWRnZS4gRm9yIGluc3RhbmNlIHRoZSBsb2Fk
IG9uIGRvbTAgZG9lc24ndCBtYXRjaCB0aGUgYWN0dWFsCmxvYWQgb24gdGhlIGhhcmR3YXJlLgoK
SSB0aGluayB3ZSBoYWQgYSB2ZXJ5IHNpbWlsYXIgZGlzY3Vzc2lvbiBhdDoKCmh0dHBzOi8vbWFy
Yy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1NjM5NzY5NjQxMzIzMCZ3PTIKCkkgd291bGQgcmVjb21t
ZW5kIHJlYWRpbmcgdGhlIGZ1bGwgdGhyZWFkIGFuZCB0aGUKY29uY2x1c2lvbnMvcHJvcG9zYWxz
LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
