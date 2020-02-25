Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C9016BDC0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 10:43:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6WiE-0004hU-LX; Tue, 25 Feb 2020 09:41:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6WiC-0004hM-SG
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 09:41:08 +0000
X-Inumbo-ID: f253636b-57b2-11ea-92bb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f253636b-57b2-11ea-92bb-12813bfff9fa;
 Tue, 25 Feb 2020 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582623667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IcFmjdeQbb6aw1OpTcYpKAxd97cIFi4Yf8lpBYMspGk=;
 b=J5s8aA772YAagnAUtJWbIVnf5NbLZh8eXRg3XUSIour+CP60L89RGq5a
 DDvW534EB/cklOV3S8LuvzqDdjxond35/xwznhGJVzop+sAz6SinaIbBa
 xc0hf4sN3pePhjddYyXecLlv24M+fue+KOuTjtdpIthCoqVQoZZApqDC6 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4230U3SorFcA7ZBchEBiZXQDhTV0yuX3o39AjKAnGmD68rbR2ueMIqNSGLphE0HMrbHOd5uyzZ
 dbOzig4QyQPu8qT+a7FMVrmMbPAugfBQ6moi7K6RR76urOWDNiIgSaqLsSOTxluYs6XOQLDmLu
 Kl9aVhl86Y/y2CeRAsLHLyL4fAPN5K07KZmjj2HCZq6DhYqErJvchl96e2dSWXsWxniqVIY4hB
 sLlS0upYMzNPoT8/5NBEZkHhMupDTHaW8xjTYtrHeccrT90/gS9EYffM41nuhz+YaZOvMqVUmK
 aig=
X-SBRS: 2.7
X-MesageID: 13316288
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,483,1574139600"; d="scan'208";a="13316288"
Date: Tue, 25 Feb 2020 10:40:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200225094059.GZ4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
 <CABfawhnF5Va8k11zoQEXGS6N1pu031YmBF+TNsJUaBp+2Rh54Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhnF5Va8k11zoQEXGS6N1pu031YmBF+TNsJUaBp+2Rh54Q@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDM6MjY6MDVQTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4gPiBBbHNvIGNkIGFuZCBkIGFuZCBub3QgdmVyeSBoZWxwZnVsIG5hbWVzLCBJ
IHdvdWxkIGp1c3QgdXNlIGNoaWxkIGFuZAo+ID4gPiBwYXJlbnQuCj4gPgo+ID4gU3VyZS4KPiAK
PiBMb29raW5nIGF0IHRoaXMgaW4gdGhlIGNvbnRleHQgb2YgdGhlIHdob2xlIHByZS1leGlzdGlu
ZyBjb2RlLWJhc2UsCj4gdGhlIG5hbWVzIGNkICYgZCBhcmUgdXNlZCB0aHJvdWdob3V0IG1lbV9z
aGFyaW5nLiBTbyBmb3IgY29uc2lzdGVuY3kgSQo+IHdpbGwga2VlcCBpdCBmb3Igbm93LgoKQWNr
LCBpZiB0aGF0J3MgdGhlIHByZXZhaWxpbmcgc3R5bGUgb2YgdGhlIGZpbGUgYW5kIG1haW50YWlu
ZXJzIGFyZQpmaW5lIHdpdGggaXQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
