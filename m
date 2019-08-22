Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF79949D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0mps-0008Tv-4G; Thu, 22 Aug 2019 13:09:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng0H=WS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0mpq-0008Tm-HD
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 13:09:02 +0000
X-Inumbo-ID: 026907ae-c4de-11e9-ac23-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 026907ae-c4de-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 13:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566479341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NZPd0+YkYQGbZLZg0a3x8PelE31z2qVTuW7NYjj3qbk=;
 b=ZeumJP3UB69XHMHeHdxq22DV/JG5pIlhm9g0ramnK0emrzgbSu80s3Gj
 mq4/RLoOv5L5Nx9HhpFCzY0Q8OJqymOk/u64fgJ6ENnMaItOc5FHBioSs
 OodCHHo52dF+NgynlBo9jpDsWVS/8wRnvrUOaaxhznV0LacXERgDAvhxE s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UFmJmVPSt8UrnfNAx99R3C9GlnxvSErHNia6E+DCOgpAg4C8mP8kbf7TI+YDOCoALY6eJQGWpb
 OOKZmOOztP9nznJxjF3gvvshlXVddMWrHWkQ3vIAzqS8qnKhc6YS9ZTwvFs5HVc9UYhoxbbHJ7
 rMXMgW9b8zpUgzIYJWwrBzpeaTn8zQx4qdvDG//PvMczlnDK1t6NSHUuH1c+0Qnqd/cNxTsM+D
 TX3Fit+4ixGvd7cVSK1crctdGaF4ER+NrkBzJptaX9kjUhEo2ir5SEuoYN2zNhKI9+KXoA0fgX
 D3s=
X-SBRS: 2.7
X-MesageID: 4799384
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4799384"
Date: Thu, 22 Aug 2019 15:08:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190822130854.53di6nipokx5qjme@Air-de-Roger>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-9-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566177928-19114-9-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 08/15] microcode/amd: call
 svm_host_osvw_init() in common code
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDk6MjU6MjFBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gSW50cm9kdWNlIGEgdmVuZG9yIGhvb2ssIC5lbmRfdXBkYXRlLCBmb3Igc3ZtX2hvc3Rfb3N2
d19pbml0KCkuCj4gVGhlIGhvb2sgZnVuY3Rpb24gaXMgY2FsbGVkIG9uIGVhY2ggY3B1IGFmdGVy
IGxvYWRpbmcgYW4gdXBkYXRlLgo+IEl0IGlzIGEgcHJlcGFyYXRpb24gZm9yIHNwbGl0aW5nIG91
dCBhcHBseV9taWNyb2NvZGUoKSBmcm9tCj4gY3B1X3JlcXVlc3RfbWljcm9jb2RlKCkuCj4gCj4g
Tm90ZSB0aGF0IHN2bV9ob3N0X29zdm1faW5pdCgpIHNob3VsZCBiZSBjYWxsZWQgcmVnYXJkbGVz
cyBvZiB0aGUKPiByZXN1bHQgb2YgbG9hZGluZyBhbiB1cGRhdGUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
