Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B530183230
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 14:58:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCOJ2-0003jW-89; Thu, 12 Mar 2020 13:55:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCOJ0-0003jQ-FK
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 13:55:22 +0000
X-Inumbo-ID: 1d42abc2-6469-11ea-92cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d42abc2-6469-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584021321;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YmnS0punLgTOHI25wlOOk7ajgxBEqsTquVEp5TF3Avo=;
 b=GCHvnzkDuLwDCH6lFBvB+3radDfYi+yzsfXOagkNqmq40k2Rqk5tnlLp
 rcXrHuiyGk+YnOXVsNFmZv5uUod4dhsS//CbLDUlho9gED1/B1jd3opHF
 Pwnnzk9/Tvu/YYBeDkcfSv4p16fCk67WS+jJoktalqN6icRO8hjEGkshV 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0ivDVwBZLOCWscvyp4xOPaNqyK1wQG5t/YKcmqBFRKMt6YxcKVuUTQMA9Tb5NrIkCB0BIebcRx
 ssWdvk/121ePb90v7VNpYKRUN53o5K5ftMLEUCIkK/GGMmXKcpuSJzTtA4v6zm6gWBa633RggL
 y9/xweiS1t1jtBo6jLvTxbYwx/VVQIJeHX7Ee9YhwXRIzc/U3xa2GeGWwew4Bc4oPpnVTLZug/
 kkViiR2BGlrrTW4hK3hmRQSOTU5knMYWRfebd62OnDsmfx5XZjsdCzGrNVfhvklem7/32Pwy3T
 RdQ=
X-SBRS: 2.7
X-MesageID: 14179857
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14179857"
To: Dario Faggioli <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <57b1c260-0d1b-76de-83e5-65e043263325@citrix.com>
Date: Thu, 12 Mar 2020 13:55:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158402065414.753.15785539969715690913.stgit@Palanthas>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>, Tomas
 Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDMvMjAyMCAxMzo0NCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gVGhlcmUgaGF2ZSBi
ZWVuIHJlcG9ydCBvZiBzdGFsbHMgb2YgZ3Vlc3QgdkNQVXMsIHdoZW4gQ3JlZGl0MiB3YXMgdXNl
ZC4KPiBJdCBzZWVtZWQgbGlrZSB0aGVzZSB2Q1BVcyB3ZXJlIG5vdCBnZXR0aW5nIHNjaGVkdWxl
ZCBmb3IgdmVyeSBsb25nCj4gdGltZSwgZXZlbiB1bmRlciBsaWdodCBsb2FkIGNvbmRpdGlvbnMg
KGUuZy4sIGR1cmluZyBkb20wIGJvb3QpLgo+Cj4gSW52ZXN0aWdhdGlvbnMgbGVkIHRvIHRoZSBk
aXNjb3ZlcnkgdGhhdCAtLWFsdGhvdWdoIHJhcmVseS0tIGl0IGNhbgo+IGhhcHBlbiB0aGF0IGEg
dkNQVSBtYW5hZ2VzIHRvIHJ1biBmb3IgdmVyeSBsb25nIHRpbWVzbGljZXMuIEluIENyZWRpdDIs
Cj4gdGhpcyBtZWFucyB0aGF0LCB3aGVuIHJ1bnRpbWUgYWNjb3VudGluZyBoYXBwZW5zLCB0aGUg
dkNQVSB3aWxsIGxvc2UgYQo+IGxhcmdlIHF1YW50aXR5IG9mIGNyZWRpdHMuIFRoaXMgaW4gdHVy
biBtYXkgbGVhZCB0byB0aGUgdkNQVSBoYXZpbmcgbGVzcwo+IGNyZWRpdHMgdGhhbiB0aGUgaWRs
ZSB2Q1BVcyAoLTJeMzApLiBBdCB0aGlzIHBvaW50LCB0aGUgc2NoZWR1bGVyIHdpbGwKPiBwaWNr
IHRoZSBpZGxlIHZDUFUsIGluc3RlYWQgb2YgdGhlIHJlYWR5IHRvIHJ1biB2Q1BVLCBmb3IgYSBm
ZXcKPiAiZXBvY2hzIiwgd2hpY2ggb2Z0ZW4gdGltZXMgaXMgZW5vdWdoIGZvciB0aGUgZ3Vlc3Qg
a2VybmVsIHRvIHRoaW5rIHRoZQo+IHZDUFUgaXMgbm90IHJlc3BvbmRpbmcgYW5kIGNyYXNoaW5n
Lgo+Cj4gQW4gZXhhbXBsZSBvZiB0aGlzIHNpdHVhdGlvbiBpcyBzaG93biBoZXJlLiBJbiBmYWN0
LCB3ZSBjYW4gc2VlIGQwdjEKPiBzaXR0aW5nIGluIHRoZSBydW5xdWV1ZSB3aGlsZSBhbGwgdGhl
IENQVXMgYXJlIGlkbGUsIGFzIGl0IGhhcwo+IC0xMjU0MjM4MjcwIGNyZWRpdHMsIHdoaWNoIGlz
IHNtYWxsZXIgdGhhbiAtMl4zMCA9IOKIkjEwNzM3NDE4MjQ6Cj4KPiAgICAgKFhFTikgUnVucXVl
dWUgMDoKPiAgICAgKFhFTikgICBuY3B1cyAgICAgICAgICAgICAgPSAyOAo+ICAgICAoWEVOKSAg
IGNwdXMgICAgICAgICAgICAgICA9IDAtMjcKPiAgICAgKFhFTikgICBtYXhfd2VpZ2h0ICAgICAg
ICAgPSAyNTYKPiAgICAgKFhFTikgICBwaWNrX2JpYXMgICAgICAgICAgPSAyMgo+ICAgICAoWEVO
KSAgIGluc3Rsb2FkICAgICAgICAgICA9IDEKPiAgICAgKFhFTikgICBhdmVsb2FkICAgICAgICAg
ICAgPSAyOTMzOTEgKH4xMTElKQo+ICAgICAoWEVOKSAgIGlkbGVyczogMDAsMDAwMDAwMDAsMDAw
MDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMGZmZmZmZmYKPiAgICAgKFhFTikgICB0
aWNrbGVkOiAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCww
MDAwMDAwMAo+ICAgICAoWEVOKSAgIGZ1bGx5IGlkbGUgY29yZXM6IDAwLDAwMDAwMDAwLDAwMDAw
MDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDBmZmZmZmZmCj4gICAgIFsuLi5dCj4gICAg
IChYRU4pIFJ1bnF1ZXVlIDA6Cj4gICAgIChYRU4pIENQVVswMF0gcnVucT0wLCBzaWJsaW5nPTAw
LC4uLiwgY29yZT0wMCwuLi4KPiAgICAgKFhFTikgQ1BVWzAxXSBydW5xPTAsIHNpYmxpbmc9MDAs
Li4uLCBjb3JlPTAwLC4uLgo+ICAgICBbLi4uXQo+ICAgICAoWEVOKSBDUFVbMjZdIHJ1bnE9MCwg
c2libGluZz0wMCwuLi4sIGNvcmU9MDAsLi4uCj4gICAgIChYRU4pIENQVVsyN10gcnVucT0wLCBz
aWJsaW5nPTAwLC4uLiwgY29yZT0wMCwuLi4KPiAgICAgKFhFTikgUlVOUToKPiAgICAgKFhFTikg
ICAgIDA6IFswLjFdIGZsYWdzPTAgY3B1PTUgY3JlZGl0PS0xMjU0MjM4MjcwIFt3PTI1Nl0gbG9h
ZD0yNjIxNDQgKH4xMDAlKQo+Cj4gV2UgY2VydGFpbmx5IGRvbid0IHdhbnQsIHVuZGVyIGFueSBj
aXJjdW1zdGFuY2UsIHRoaXMgdG8gaGFwcGVuLgo+IFRoZXJlZm9yZSwgbGV0J3MgdXNlIElOVF9N
SU4gZm9yIHRoZSBjcmVkaXRzIG9mIHRoZSBpZGxlIHZDUFUsIGluCj4gQ3JlZGl0MiwgdG8gYmUg
c3VyZSB0aGF0IG5vIHZDUFUgY2FuIGdldCBiZWxvdyB0aGF0IHZhbHVlLgo+Cj4gTk9URTogaW52
ZXN0aWdhdGlvbnMgaGF2ZSBiZWVuIGRvbmUgYWJvdXQgX2hvd18gaXQgaXMgcG9zc2libGUgZm9y
IGEKPiB2Q1BVIHRvIGV4ZWN1dGUgZm9yIHNvIGxvbmcgdGhhdCBpdHMgY3JlZGl0cyBiZWNvbWVz
IHNvIGxvdy4gV2hpbGUgc3RpbGwKPiBub3QgY29tcGxldGVseSBjbGVhciwgdGhlcmUgYXJlIGV2
aWRlbmNlIHRoYXQ6Cj4gLSBpdCBvbmx5IGhhcHBlbnMgdmVyeSByYXJlbHkKPiAtIGl0IGFwcGVh
cnMgdG8gYmUgYm90aCBtYWNoaW5lIGFuZCB3b3JrbG9hZCBzcGVjaWZpYwo+IC0gaXQgZG9lcyBu
b3QgbG9vayB0byBiZSBhIENyZWRpdDIgKGUuZy4sIGFzIGl0IGhhcHBlbnMgd2hlbiBydW5uaW5n
Cj4gICB3aXRoIENyZWRpdDEgYXMgd2VsbCkgaXNzdWUsIG9yIGEgc2NoZWR1bGVyIGlzc3VlCgpP
biB3aGF0IGJhc2lzPwoKRXZlcnl0aGluZyByZXBvcnRlZCB0byB4ZW4tZGV2ZWwgYXBwZWFycyB0
byBzdWdnZXN0cyBpdCBpcyBhIGNyZWRpdDIKcHJvYmxlbS7CoCBJdCBkb2Vzbid0IG1hbmlmZXN0
IG9uIHZlcnNpb25zIG9mIFhlbiBiZWZvcmUgY3JlZGl0MiBiZWNhbWUKdGhlIGRlZmF1bHQsIGFu
ZCBzd2l0Y2hpbmcgYmFjayB0byBjcmVkaXQxIGFwcGVhcnMgdG8gbWl0aWdhdGUgdGhlIHByb2Js
ZW0uCgpDZXJ0YWlubHkgYXMgZmFyIGFzIFhlblNlcnZlciBpcyBjb25jZXJuZWQsIHdlIGhhdmVu
J3Qgc2VlbiBzeW1wdG9tcwpsaWtlIHRoaXMgaW4gYSBkZWNhZGUgb2YgcnVubmluZyBjcmVkaXQx
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
