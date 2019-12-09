Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75341116C74
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:43:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHQA-0000As-PX; Mon, 09 Dec 2019 11:41:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieHQ9-0000An-Qw
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:41:45 +0000
X-Inumbo-ID: e036ba28-1a78-11ea-b6f1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e036ba28-1a78-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575891705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GzReoROje3tBp7FjKlB0oXgw2hTB34h1ddpP8D5LvGo=;
 b=Dn6qP/iB7uQ3pwxXlU2PlFQ+2GXqX2i65YDsbGLP46oMDIK+Sk8DcFk9
 uWl25XMq6d2z0K7KIKnaP0uqCziG6wah9xZvqbGUN/MU77rvYfLZeYA+e
 I/eRkhyyJA+K4lT/5MOOEZ04rYu3XzoLaIc5lZvGUY8ldYhT1LLme4APS o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Hm12VYnR78F0yIU6Vs5dDAXWyjZEnEngE4KcbEt+L9rMgOvnWLd9+lZvEAq3ooDyIwvLi/XKa8
 NHYIajNI8lrLjnqqYpJGPOxKzg3kuRIYuYET1hXD3y71VNmvjd91/7lVtTXI9o15/AlYCWtohG
 wOO7Paq80UomTbrY2MnK10YJ+scaydS4VYK/J0gmBDWgY7Tez/L/2+qlOmRdeWbNXDbnbazIb3
 LfsY0WlYE10LS3VoFXp7DLNL6rnJ0OC3MfKzR15mrHrqsQ0Y8/UIbNt1wZ7IxgApfXacaYd1oI
 S+k=
X-SBRS: 2.7
X-MesageID: 9942940
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9942940"
Date: Mon, 9 Dec 2019 12:41:37 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191209114137.GT980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-4-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205140123.3817-4-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending
 work in FRONT/BACK_RING_ATTACH
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDI6MDE6MjJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEN1cnJlbnRseSB0aGVzZSBtYWNyb3Mgd2lsbCBza2lwIG92ZXIgYW55IHJlcXVlc3Rz
L3Jlc3BvbnNlcyB0aGF0IGFyZQo+IGFkZGVkIHRvIHRoZSBzaGFyZWQgcmluZyB3aGlsc3QgaXQg
aXMgZGV0YWNoZWQuIFRoaXMsIGluIGdlbmVyYWwsIGlzIG5vdAo+IGEgZGVzaXJhYmxlIHNlbWFu
dGljIHNpbmNlIG1vc3QgZnJvbnRlbmQgaW1wbGVtZW50YXRpb25zIHdpbGwgZXZlbnR1YWxseQo+
IGJsb2NrIHdhaXRpbmcgZm9yIGEgcmVzcG9uc2Ugd2hpY2ggd291bGQgZWl0aGVyIG5ldmVyIGFw
cGVhciBvciBuZXZlciBiZQo+IHByb2Nlc3NlZC4KPiAKPiBOT1RFOiBUaGVzZSBtYWNyb3MgYXJl
IGN1cnJlbnRseSB1bnVzZWQuIEJBQ0tfUklOR19BVFRBQ0goKSwgaG93ZXZlciwgd2lsbAo+ICAg
ICAgIGJlIHVzZWQgaW4gYSBzdWJzZXF1ZW50IHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KClRob3NlIGhlYWRlcnMgY29tZSBmcm9t
IFhlbiwgYW5kIHNob3VsZCBiZSBtb2RpZmllZCBpbiBYZW4gZmlyc3QgYW5kCnRoZW4gaW1wb3J0
ZWQgaW50byBMaW51eCBJTU8uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
