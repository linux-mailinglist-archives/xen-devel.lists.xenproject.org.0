Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A713A5C2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:21:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJI3-0002rO-Ss; Tue, 14 Jan 2020 10:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C/ck=3D=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1irJI2-0002rI-IN
 for xen-devel@lists.xen.org; Tue, 14 Jan 2020 10:19:14 +0000
X-Inumbo-ID: 4f5379dd-36b7-11ea-8364-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f5379dd-36b7-11ea-8364-12813bfff9fa;
 Tue, 14 Jan 2020 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578997153;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IjSFaovo0jMU1Sy/ZbDDtBsPYt+oAkqaY1dr3FY1GUU=;
 b=G6UgT/BrT8z3KL3a4loocrwe4Tk5RYNIvIdwcAT6qEmsQJ5VyYKmZG+Y
 E5Eetmx2SCb1L8iz/AEt+SKar5ydbu6ylrYFbSGyzux9vMhV/DgxvSjIv
 79Mvg69T3oQRTPgig91VgeS/uMM4d0a9lOyeVbUDlwEaVAPRToNvbdFLq M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iOrU8RJGd+PRWvMrc1N4zQ5fVDb4cyk1u+Hh2C5KAvw1PHIl5k2+dW20R/OQdX31jiKEkj6Wkg
 O5SlC1FsRbvs+mT4jUCbrnblgxEZE6eGpVa/JmS4+lxiLaFsvq/KS7CIRc7Es1uYlXzK28u5QH
 /JuRQnWBc/ASvf15ajgqm0jqwRednZm8ciwYaKjaRkP+hwW12ht5oN85dXHIq1iJkdffPbrH8t
 zEOZW2VMA3NFeLH4teAdYJvBl/1BS/JpSUT3Zp58NP3BFCO4JCL7JmZ0YVuLwObO+/GGLeq62x
 wkg=
X-SBRS: 2.7
X-MesageID: 10892423
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,432,1571716800"; d="scan'208";a="10892423"
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
 <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
 <52fcbff2-c175-745b-0c4a-d9ce6d4ae45e@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <2f1e4eb2-1487-11ec-8a62-3c19372af4e5@citrix.com>
Date: Tue, 14 Jan 2020 10:19:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <52fcbff2-c175-745b-0c4a-d9ce6d4ae45e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDEvMjAyMCAxNDo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMS8yMDIw
IDEyOjUxLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiAgIFNvIFNlcmdleSdzIHNlY29uZCBwYXRj
aDoKPj4gIC0gU3RpbGwgZGVuaWVzIFhFTlZFUl9leHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlz
b3IgbGV2ZWwKPj4gIC0gTGVhdmVzIHRoZSB2YWx1ZSByZXR1cm5lZCBieSB0aGUgaHlwZXJ2aXNv
ciBhcyAiPGRlbmllZD4iCj4+ICAtIEZpbHRlcnMgdGhlICI8ZGVuaWVkPiIgc3RyaW5nIGF0IHRo
ZSBodm1sb2FkZXIgbGV2ZWwsIHRvIHByZXZlbnQgaXQKPj4gbGVha2luZyBpbnRvIGEgR1VJIGFu
ZCBzY2FyaW5nIGN1c3RvbWVycy4KPgo+IFRoZSBTTUJpb3MgdGFibGUgaXNuJ3QgdGhlIG9ubHkg
d2F5IFhFTlZFUl9leHRyYXZlcnNpb24gbGVha3MgdXAgaW50bwo+IHRoZSBVSS4KPgo+IFhFTlZF
Ul9leHRyYXZlcnNpb24gaXNuJ3QgdGhlIG9ubHkgc291cmNlIG9mIHJlZGFjdGVkIGluZm9ybWF0
aW9uCj4gbGVha2luZyB1cCBpbnRvIHRoZSBVSS4KPgo+IExpbnV4IGZvciBleGFtcGxlIGV4cG9y
dHMgaXQgYWxsIHZpYSBzeXNmcy4gIFRoZSB3aW5kb3dzIGRyaXZlcnMgcHV0Cj4gWEVOVkVSX2V4
dHJhdmVyc2lvbiBpbnRvIHNldmVyYWwgb3RoZXIgbG9ncy4KCkkndmUgZm91bmQgdGhhdCAvc3lz
L2h5cGVydmlzb3IvdmVyc2lvbi9leHRyYSByZXR1cm5zICI8ZGVuaWVkPiIuCiI8aGlkZGVkPiIg
d291bGQgaGF2ZSBsb29rZWQgYmV0dGVyIHRoZXJlLgoKPj4gTm93IHdlIGdldCB0byBBbmR5J3Mg
b2JqZWN0aW9uIG9uIHRoZSAxMHRoOgo+Pgo+PiAtLS0KPj4gVGhlIHJlYXNvbiBmb3IgdGhpcyAo
d2hpY2ggb3VnaHQgdG8gYmUgb2J2aW91cywgYnV0IEkgZ3Vlc3Mgb25seSB0bwo+PiB0aG9zZSB3
aG8gYWN0dWFsbHkgZG8gY3VzdG9tZXIgc3VwcG9ydCkgaXMgYmFzaWMgaHVtYW4gcGh5c2lvbG9n
eS4KPj4gImRlbmllZCIgbWVhbnMgc29tZXRoaW5nIGhhcyBnb25lIHdyb25nLiAgSXQgc2NhcmVz
IHBlb3BsZSwgYW5kIGNhdXNlcwo+PiB0aGVtIHRvIHNlZWsgaGVscCB0byBjaGFuZ2UgZml4IHdo
YXRldmVyIGlzIGJyb2tlbi4KPj4KPj4gSXQgaXMgbm90IGFwcHJvcHJpYXRlIGZvciBpdCB0byBm
aW5kIGl0cyB3YXkgaW50byB0aGUgZ3Vlc3QgaW4gdGhlIGZpcnN0Cj4+IHBsYWNlLCBhbmQgdGhh
dCBpbmNsdWRlcyB0dXJuaW5nIHVwIGluIGBkbWVzZ2AgYW5kIG90aGVyIGxvZ3MsIGFuZAo+PiBl
eHBlY3RpbmcgZ3Vlc3QgcnVudGltZSB0byBmaWx0ZXIgZm9yIGl0IGlzIGNvbXBsZXRlIG5vbnNl
bnNlLgo+PiAtLS0KPj4KPj4gQmFzaWNhbGx5LCBBbmR5IHNheXMgdGhhdCAqYW55d2hlcmUqIGl0
IG1pZ2h0IHNob3cgdXAgaXMgd2F5IHRvbyBzY2FyeSwKPj4gZXZlbiBhIGd1ZXN0IGRtZXNnIGxv
Zy4KPj4KPj4gV2VsbCwgSSBkaXNhZ3JlZTsgSSBsb29rIGluICJkbWVzZyIgYW5kIEkgc2VlIGxv
YWRzIG9mICJzY2FyeSIgdGhpbmdzLgo+Cj4gSnVzdCBiZWNhdXNlIGRtZXNnIGlzIG5vdCBhbiBl
eGFtcGxlIG9mIGEgZ29vZCBVSSwgZG9lc24ndCBtZWFuIGl0cyBvawo+IGZvciB1cyB0byBtYWtl
Ogo+Cj4gWGVuIHZlcnNpb246IDQuMTQ8ZGVuaWVkPiAocHJlc2VydmUtQUQpCgpBbmQgdGhlIGFi
b3ZlIGlzIGluZGVlZCBmb3VuZCBpbiBkbWVzZyBvZiBQViBkb21haW5zICh0aGV5IGhhdmUgbm8g
U01iaW9zKS4KIjxoaWRkZW4+IiBpcyBub3QgYXBwcm9wcmlhdGUgaGVyZSBpbmRlZWQuIEl0IHNo
b3VsZCBiZSBlaXRoZXIgIiIgb3IKZ2VuZXJpYyAiLjAiIElNSE8uCgotLQpUaGFua3MsClNlcmdl
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
