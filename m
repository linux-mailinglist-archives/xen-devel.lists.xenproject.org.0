Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD0214D904
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:35:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix77s-0003gV-CS; Thu, 30 Jan 2020 10:32:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix77q-0003gP-I6
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:32:42 +0000
X-Inumbo-ID: d7f99564-434b-11ea-8396-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f99564-434b-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580380361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QY6shGElD0SnxANWsRdH5e+gIw1AeJ1lnEMx37IwzkI=;
 b=U9bPgMZqHKoZPIkO83OA05C5nUtOlsedAeW66uGugh4we1imcJWrdvUR
 Ew/W+jzBelkp8pS+yWm4m1kOf6QJ7EKjT2HMhkoJDfRnP/d2auo6VBA93
 H7F87a3YmwJ0Y4kKxwr76XKTaoTMfHUx2po+M3DwxCNlG3sD+1p4aZCF7 w=;
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
IronPort-SDR: rnAmg6/uUPTglk/5ZGOx3rMgezw/Twgg3vDh4Dhn99dqBK6U/IAe7xGo9zPAS0UKC35hHSogi6
 uz45voqpEtfllhJQv53x/msk4oyhuULTpRgMxBV7yISMFuHAIZ5jfoZluh4g2Gu3kqaBUjiWbf
 DW9wTyuHzPRcYTnYSHVa/udMCbNsilyEe4XdEnFovOHorjBwD/EqB6OhLUn7aw/rmbAo/cH/Z7
 czWFEQPxgH7aNQ3tJXRZaC2t5FWFZ+nLZV9SjexNzCwA4EdUZeLmkb/V8abQWC9XcCSPVDvo1U
 ZJk=
X-SBRS: 2.7
X-MesageID: 12106437
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12106437"
Date: Thu, 30 Jan 2020 11:32:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130103234.GG4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-7-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-7-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 06/12] x86/hypervisor: provide
 hypervisor_reserve_top_pages
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjhQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGlzIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIHRoZSBudW1iZXIgb2YgcGFnZXMgdGhhdCBuZWVk
IHRvIGJlIHJlc2VydmVkCj4gaW4gdGhlIG1hY2hpbmUgYWRkcmVzcyBzcGFjZS4KPiAKPiBFODIw
IGNvZGUgd2lsbCB1c2UgdGhhdCBudW1iZXIgdG8gYWRqdXN0IHRoZSBtYXhpbXVtIFBGTiBhdmFp
bGFibGUgdG8KPiBYZW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KCkl0J3MgaGFyZCB0byBmaWd1cmUgb3V0IHdoZXRoZXIgdGhlIHByb3Bvc2VkIGNv
ZGUgaXMgc3VpdGFibGUgc2luY2UKaXQncyBub3QgeWV0IGNhbGxlZCBieSBhbnkgb3RoZXIgZnVu
Y3Rpb24sIGFuZCB0aGVyZSdzIG5vIGh5cGVydmlzb3IKaW1wbGVtZW50YXRpb24uCgpJIHdvdWxk
bid0IG1pbmQgaWYgdGhpcyB3YXMgbWVyZ2VkIGludG8gdGhlIG5leHQgcGF0Y2ggc28gdGhhdCB0
aGVyZSdzCmEgaW1wbGVtZW50YXRpb24gYW5kIGEgdXNlciBvZiB0aGUgaW50cm9kdWNlZCBjb2Rl
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
