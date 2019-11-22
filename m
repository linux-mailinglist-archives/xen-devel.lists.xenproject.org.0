Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155DA107248
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 13:39:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8Bi-0001Eu-Iz; Fri, 22 Nov 2019 12:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qik7=ZO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iY8Bg-0001Ei-Uj
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 12:37:25 +0000
X-Inumbo-ID: d50afe68-0d24-11ea-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d50afe68-0d24-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574426243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Il9b6JA7WsGU3Lyh9MOfDx6hwvHT+n7swzK5kLenlYM=;
 b=XeB7R1uZZ8ufhyrC5gP6hyfJb5P3RBz0t+vwBBYFSl1quZRDstPFw217
 eY8e5/nwQJqPTQ+D89acZSGOMuZIDsOOVkTB49/qmCwDZWa6ejF31uquj
 XDHn8Ey5iXh9MVDtiTbt8uPeI8840jQ6/tWmOlqvlF9+w9OUTn5vuhfp4 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WiCGyvfpzqAa2WkfSUyrYFW9b2KCbAoeHh2lOyFFRYrZtySjZR/vc82dcEugad2+X54CitT41l
 jrKteYst9AgJpUvryfYJhGinlFm8seURVrQd5QyGy0PKW5yiuakuGmPPFB3173gk1scnCJ7dVJ
 +gjDU356nrJB9alalKlG5lglGu9jYBZ5IscXD9jyN46LKuZiUuaB1Vl0JNDbJ6QERCXccbyuQn
 zxh+MDNqkq+RSQtLqmWQOyw0hc2DRbcgW3BHvF4VBEC8x9T6xd7vZ9MftfcJgHcROSoGJTAEl6
 M78=
X-SBRS: 2.7
X-MesageID: 9119608
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="9119608"
Date: Fri, 22 Nov 2019 13:37:16 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191122123716.GX72134@Air-de-Roger>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121221551.1175-2-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTA6MTU6NTBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgVlQteCB0YXNrIHN3aXRjaCBoYW5kbGVyIGFkZHMgaW5zdF9sZW4gdG8gcmlw
IGJlZm9yZSBjYWxsaW5nCj4gaHZtX3Rhc2tfc3dpdGNoKCkuICBUaGlzIGNhdXNlcyBlYXJseSBm
YXVsdHMgdG8gYmUgZGVsaXZlcmVkIHRvIHRoZSBndWVzdCB3aXRoCgpCeSBlYXJseSBmYXVsdHMg
eW91IG1lYW4gZmF1bHRzIGluamVjdGVkIGJ5IGh2bV90YXNrX3N3aXRjaCBpdHNlbGYgZm9yCmV4
YW1wbGU/Cgo+IHRyYXAgc2VtYW50aWNzLCBhbmQgYnJlYWsgcmVzdGFydGliaWxpdHkuCj4gCj4g
SW5zdGVhZCwgcGFzcyB0aGUgaW5zdHJ1Y3Rpb24gbGVuZ3RoIGludG8gaHZtX3Rhc2tfc3dpdGNo
KCkgYW5kIHdyaXRlIGl0IGludG8KPiB0aGUgb3V0Z29pbmcgdHNzIG9ubHksIGxlYXZpbmcgcmlw
IGluIGl0cyBvcmlnaW5hbCBsb2NhdGlvbi4KPiAKPiBGb3Igbm93LCBwYXNzIDAgb24gdGhlIFNW
TSBzaWRlLiAgVGhpcyBoaWdobGlnaHRzIGEgc2VwYXJhdGUgcHJlZXhpc3RpbmcgYnVnCj4gd2hp
Y2ggd2lsbCBiZSBhZGRyZXNzZWQgaW4gdGhlIGZvbGxvd2luZyBwYXRjaC4KPiAKPiBXaGlsZSBh
ZGp1c3RpbmcgY2FsbCBzaXRlcywgZHJvcCB0aGUgdW5uZWNlc3NhcnkgdWludDE2X3QgY2FzdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKQ29kZSBMR1RNOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
