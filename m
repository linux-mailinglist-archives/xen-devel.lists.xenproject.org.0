Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9310DD5B
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 11:16:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iazkm-0004m2-6o; Sat, 30 Nov 2019 10:13:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7OGA=ZW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iazkk-0004lx-Hv
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 10:13:26 +0000
X-Inumbo-ID: 0ba41e74-135a-11ea-a55d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ba41e74-135a-11ea-a55d-bc764e2007e4;
 Sat, 30 Nov 2019 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575108806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zBZhGpjNoMGLZh9CT1gIXL00VMRcepjQL2qdX/qwTNg=;
 b=dZK90v1vbOql3IWJ3xVXnLlyiJHq9QqoSzQNBPhLJTMejEOJdV12uw+Y
 EIIGr2UstXwoYFVyuF/hh/sus17wk9VhjCOVA4HmwzF+8OVZ8Z0H0P4nh
 AUXrScBbwFCQX+aQsNcOxWJQG+pQuEMInTmBVjEG7Xl9dxAaXClTZy6GR c=;
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
IronPort-SDR: 8ApxEUeHVxLXKfNEKSkecLJAo2mS71lY73RdsQAfuQ4Q8j7cOM5WiOnhlc722pDlAJCPinzB0n
 cSfEFoAoYhYTF/6P2Mnf5ehuZ8vml86hz9s7MVxUgBhsaoQ6kApHDZCvoCe1HZovD+UAD0TE3q
 ZdhXsaj1Hg6q/TcIj6+EhN84U1P7hsQrq+yn+1MaRFiAHxka7JJ5yQNu5+8WlB8IN84nzErB00
 sYT2dZTdczcvk3YlP+A3Gf0KwzKbQFKsuc7VJE2oqIEsDwANdpu6LKUgvwu82kdojfEkQ78hRO
 azI=
X-SBRS: 2.7
X-MesageID: 9133237
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,261,1571716800"; 
   d="scan'208";a="9133237"
Date: Sat, 30 Nov 2019 11:13:09 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20191130101309.GB980@Air-de-Roger>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDg6MDE6MTdQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gSWYgdGhlIGZlYXR1cmUgaXMgbm90IHByZXNlbnQgWGVuIHdpbGwgdHJ5IHRvIGZv
cmNlIFg4Nl9CVUdfRlBVX1BUUlMKPiBmZWF0dXJlIGF0IENQVSBpZGVudGlmaWNhdGlvbiB0aW1l
LiBUaGlzIGlzIGVzcGVjaWFsbHkgbm90aWNlYWJsZSBpbgo+IFBWLXNoaW0gdGhhdCB1c3VhbGx5
IGhvdHBsdWdzIGl0cyB2Q1BVcy4gV2UgZWl0aGVyIG5lZWQgdG8gcmVzdHJpY3QgdGhpcwo+IGFj
dGlvbiBmb3IgYm9vdCBDUFUgb25seSBvciBhbGxvdyBzZWNvbmRhcnkgQ1BVcyB0byBtb2RpZnkK
PiBmb3JjZWQgQ1BVIGNhcGFiaWxpdGllcyBhdCBydW50aW1lLiBDaG9vc2UgdGhlIGxhdHRlciBh
Y2NvdW50aW5nCj4gZm9yIHBvdGVudGlhbCBtaWNyb2NvZGUgYXN5bW1ldHJ5IGJldHdlZW4gdGhl
IGJvb3QgYW5kIHNlY29uZGFyeSBDUFVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhp
bmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKTEdUTSwgYm90aCBzZXR1cF97Zm9yY2Uv
Y2xlYXJ9X2NwdV9jYXAgYXJlIGNhbGxlZCBmcm9tIG5vbi1pbml0CmZ1bmN0aW9ucywgYWxiZWl0
IEknbSBub3Qgc3VyZSBob3cgd2VsbCBYZW4gYW5kIGd1ZXN0cyB3aWxsIGRlYWwgd2l0aAphIHN5
c3RlbSB0aGF0IGhhcyBzdWNoIGFzeW1tZXRyeSBpbiBDUFUgZmVhdHVyZXMgaWYgQVBzIGRvbid0
IGhhdmUKUnN0ckZwRXJyUHRycyBhbmQgdGhlIEJTUCBkb2VzLgoKUmV2aWV3ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKU2luY2UgSSBhc3N1bWUgdGhpcyBm
aXhlcyBhIHBhZ2UtZmF1bHQsIGNvdWxkIHlvdSBwbGVhc2UgcGFzdGUgcGFydCBvZgp0aGUgY3Jh
c2ggdHJhY2UgdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
