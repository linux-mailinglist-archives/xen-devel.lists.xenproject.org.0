Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A7154125
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 10:29:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izdQ3-0006BU-R1; Thu, 06 Feb 2020 09:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CJ3H=32=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izdQ2-0006BP-ML
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 09:25:54 +0000
X-Inumbo-ID: abfb6178-48c2-11ea-8952-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abfb6178-48c2-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580981154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AJXeIJW2H9xKwRlCU2YTKEBmIXl33VlufNtmBgJZmDw=;
 b=GjNAMbj7j31I+mUctTXO5s5UY2GqFc8SC5hxW7GjUzslMQg2Z4oK0k0E
 BnodoPhmZesC9Tr/5X3bP+piqC9x8BaF8n0gtvUjeCyGX8SLOuz+UT0Hp
 TX6KsMWhF7bKK5PH66Ci/I7ON2lyQGz6zTD7vHqx2l/whTUUhwZB5yGol g=;
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
IronPort-SDR: 6rTE8RO4ZxX9nB156K59AxAh4QM1g8HZXt9yi+j/R9M88zTBTpaDQoMU6wh2qJ1LqTlFgaQS0X
 9ZBQXdWd+9kpPyvWxYZY+SuTTdTiCbSsGr11U5+6ec6ZXRrWlBFhe1sh/4blEI/YD+CAGe/phR
 NfpczXXN0Flt3IUZhQowUbmufDSj9ZBii992xO45ys5JXkM/F1RxDEai4B+m0uKNZrOfSY2eU0
 gjYio1lDxlBWbpZSZlCi3cPXE1znFCKcg0StZjkEro5pLdmzbW2aTJ4TBp6it2E4xNYWmx1NUh
 CZU=
X-SBRS: 2.7
X-MesageID: 12042589
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12042589"
Date: Thu, 6 Feb 2020 10:25:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200206092544.GV4679@Air-de-Roger>
References: <20200205180224.6525-1-wl@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205180224.6525-1-wl@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/guest/xen: only set HVM parameter on BSP
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDY6MDI6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGVyZSBpcyBubyBuZWVkIGZvciBldmVyeSBDUFUgdG8gc2V0IGEgZ3Vlc3QgcHJvcGVydHku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KClJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkkgd2lsbCBzZW5kIGEgcGF0
Y2ggc2hvcnRseSB0byBpbnRyb2R1Y2UgYW4gSVNfQlNQIG1hY3JvLCBhcyBpdCB3b3VsZAptYWtl
IHRoZSBjb2RlIGNsZWFyZXIgSU1PLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
