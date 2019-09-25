Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D6BDBDC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:10:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4Cl-0008Ew-3o; Wed, 25 Sep 2019 10:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD4Cj-0008Er-5e
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:07:25 +0000
X-Inumbo-ID: 4523dd68-df7c-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 4523dd68-df7c-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 10:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569406045;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7R88mjnAHU0j49nmP5ckV2L4JE0PWhA6XBdaiuSF5UY=;
 b=KxPydu/Jxysu1yuWQLIlBbCAEQ1HQzs0CoOX1zgklfpOs8lA2No6UYts
 hrx2vvNKxDE5S5U6IDkQIB4+DAozsTPYTpTyr1gup53fxpkTUXjRTZiEz
 SYaFGxxGDR+KjXpTUfhkJMgxNHhIsHIvHjJW3XnCXKOFh7l6L10qyV3in o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s/jfSLNcsDoJjlpBqDD6pBe5AO/G9enF4myWBibXTIt0P8mNTqH1IA3E/ghIBFUegXBc0N2v8K
 94fvJ8XWgxAKCPKGAW/8aV8BsczSpYYCqE0vEA/CdgqnGqdw30EJ8Iafgmuq+tYd9tmxhwPDlm
 h9KU2crUCGL/b17hHQgKnDKZU2tNozYe+wfFYayhO1+Bf0jrK8AhfUJpPPbyxIMhoUHqTNnwzb
 4ALe0vN3OR+G5zwzFhxYK7mEoQEbdZ5mOnmCD1nGMEwwnFwq7U1UPag60FZQxx9Zauk8Vw5kCy
 YCY=
X-SBRS: 2.7
X-MesageID: 6104361
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6104361"
Date: Wed, 25 Sep 2019 12:07:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925100714.nv4sa2q4pyqlb264@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-4-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-4-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 3/8] x86: drop
 hypervisor_cpuid_base
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjZBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgb25seSB1c2VyIGlzIFhlbiBzcGVjaWZpYyBjb2RlIGluIFBWIHNoaW0uIFdlIGNhbiB0
aGVyZWZvcmUgZXhwb3J0Cj4gdGhlIHZhcmlhYmxlIGRpcmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
