Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4BD66E7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:11:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK2ue-0002QU-2l; Mon, 14 Oct 2019 16:09:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fu8Z=YH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iK2uc-0002QP-RZ
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:09:34 +0000
X-Inumbo-ID: ff2b098c-ee9c-11e9-9382-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff2b098c-ee9c-11e9-9382-12813bfff9fa;
 Mon, 14 Oct 2019 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571069367;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=5wY3rPjf+u3Y0FmYCBKJegWHrCBDQ9aLMcM8nDr2E/Q=;
 b=NSipLZNcTgQui5FwtXEcIJ1v28TuDfbdKXlwrOpgwDNGCeUooc3PL73C
 ieH8HaL5v8CbnDYQi2r+2DhNT/OJinLgGKpOlw/AnsXFfqrrUnni90KID
 xRHK820mHAmFMeMyHWOkENZ59BXoZZpJodMRrIaLvfrWAYQ+253as/E84 Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1jbjDCiIkw0cq+RMjyCSWQZTSa8T6VazkyRKAQBFGG3sYfVHtEmVsOPjes7zm6TPhqScn/NsqN
 yl/2jAmS2JCsybdwanP2qAdRynvIHBF3f24a8KVL67qdxyt+Z+OOP+aianJA0/hSaNV68VVKiZ
 BmLAYwEfCvd+vnikXTvmLrMhl426ECSxlthtjfAZwG4AHNbQFrfNIcUarLmL6+4FICCvteROhy
 BemA5MEpkgPjlRPugtsJiJCPhWM3Ptxg4MEDJQGeJgkAVn+CgcvW2+SkulFp5RWm+2pdwU1D23
 dtM=
X-SBRS: 2.7
X-MesageID: 7256215
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="7256215"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23972.40372.377662.700932@mariner.uk.xensource.com>
Date: Mon, 14 Oct 2019 17:09:24 +0100
To: Paul Durrant <pdurrant@gmail.com>
In-Reply-To: <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
 <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbWEVOIFBBVENIIGZvci00LjEz
IHYyIDkvOV0gbGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9naWMiKToK
PiBPbiBGcmksIDExIE9jdCAyMDE5IGF0IDE3OjM0LCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hl
bi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA5LzldIGxpYnhsL3hsOiBPdmVyaGF1bCBw
YXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6Cj4gPiA+IE9uIDExLjEwLjE5IDE1OjMxLCBJYW4g
SmFja3NvbiB3cm90ZToKPiA+ID4gPiBJIGRvIG5vdCBoYXZlIGEgc3Ryb25nIG9waW5pb24gYWJv
dXQgdGhpcy4gIEkgd291bGQgYmUgaGFwcHkgd2l0aAo+ID4gPiA+ICJhdXRvIiAob3IgImRlZmF1
bHQiIG1heWJlKS4KPiA+ID4KPiA+ID4gInVuc3BlY2lmaWVkIj8KPiA+Cj4gPiBUaGF0IGlzIElN
TyB0aGUgYmVzdCBzdWdnZXN0aW9uIHNvIGZhciBzbyBJIHdpbGwgZ28gd2l0aCB0aGF0IGluIG15
Cj4gPiB2My4KPiAKPiBTZWVtcyBvZGQgdG8gc3BlY2lmeSBhIHBhcmFtZXRlciB3aXRoIGEgdmFs
dWUgb2YgJ3Vuc3BlY2lmaWVkJyA7LSkKCkkgaGF2ZSB0cmllZCB0byBpbmZlciArMS8tMS8wIG51
bWJlcnMgZnJvbSB0aGUgbWFpbCB0aHJlYWQuICBJIGhhdmUKYWxzbyBsb29rZWQgYXQgbGlieGxf
dHlwZXMuaWRsIHRvIHNlZSBob3cgbWFueSB0aW1lcyB3ZSBhcmUgdXNpbmcKd2hhdCBuYW1lIHRv
IHJlcHJlc2VudCByb3VnaGx5IHRoaXMgY29uY2VwdDoKCiBCaWtlc2hlZCBjb2xvdXIgIFBhdWwg
SnVlcmdlbiBHZW9yZ2UgSWFuIEFudGhvbnkgV2VpICNhbHJlYWR5CgogdW5rbm93biAgICAgICAg
ICAgPyAgICAgID8gICAgIC0xICAgICsyICAgID8gICAgID8gICAgMTcKIGRlZmF1bHQgICAgICAg
ICAgID8gICAgICA/ICAgICA/ICAgICAgMCAgICA/ICAgICA/ICAgICAyCiBhdXRvICAgICAgICAg
ICAgICAtMSAgICAgPyAgICAgKzEgICAgIDAgICAgPyAgICAgPyAgICAgMQogdW5zcGVjaWZpZWQg
ICAgICAgLTEgICAgICsxICAgID8gICAgICAwICAgID8gICAgID8gICAgIDAKCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsIG1haW50YWluZXJzCgpPbiB0aGlzIGJhc2lz
IElNTyBjbGVhcmx5IHRoaXMgc2hvdWxkIGdvIGJhY2sgdG8gInVua25vd24iLgpJIHdpbGwgZG8g
dGhhdCBpbiBhIHJlc3BpbiAob3IgbWF5YmUgb24gY29tbWl0KSBidXQgcmlnaHQgbm93IEkgdGhp
bmsKSSBhbSBzdGlsbCBhd2FpdGluZyBhIHJldmlldyBmb3IgdGhpcyBwYXRjaC4KClRoYW5rcywK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
