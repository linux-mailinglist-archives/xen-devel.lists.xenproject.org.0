Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216AF9AC08
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 11:54:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i16Eg-0001xa-Mp; Fri, 23 Aug 2019 09:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i16Ef-0001xV-1Y
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 09:51:57 +0000
X-Inumbo-ID: a40913a8-c58b-11e9-ade4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a40913a8-c58b-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566553916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0rJC/OafCjbdUaL7GEXmJgZbLDkpWezeLxFouxLQt1E=;
 b=NoKvmhmBMcBE1i3OphFdUIOFHPgnIKv8SaskxtXf3gU6eoNPlC60e7CA
 zUHTcDEdNCa+jpi2nz42b9ofqD5ITfggnDf29+K1VxPKH9aue7PY0qndO
 4xhcEFVbZaIXQ9fuWHI+9i72yIjyK/WnCNEhNR6RTNbPEfo980cd4ck1I o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 85curzalOa/7uR4y6dRelJ0WB9Sy8e3o9bIzTagi+JAMMGPQc+76zciGSsdEk0bZ0TQGuQ+A/E
 LMogTCo2im+id6y+QgL5NpnOLNgPIxgwFzXfv2OApMohdsj86Y9jhJcjjz6WeUIgNEs7FhssFk
 3Hh67k/vdoFI1BEvbxtt+HzeVIOdo99UHhTtN4YK3SrZIGHARk4574wxjKSCZJsxLZejS1VRDt
 eAg5DhE9oB9kKxu7jFwUOmoI47pUTJAnpatR9T1QhqVducFjSfylHD52wbvEDrtdQ5IQt1+tfE
 Zu0=
X-SBRS: 2.7
X-MesageID: 4639799
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4639799"
Date: Fri, 23 Aug 2019 11:51:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190823095125.nfxvzifkvz7tj7ag@Air-de-Roger>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816172001.3905-2-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v6 01/10] make
 passthrough/pci.c:deassign_device() static
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6MTk6NTJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgZnVuY3Rpb24gaXMgb25seSBldmVyIGNhbGxlZCBmcm9tIHdpdGhpbiB0aGUg
c2FtZSBzb3VyY2UgbW9kdWxlIGFuZAo+IHJlYWxseSBoYXMgbm8gYnVzaW5lc3MgYmVpbmcgZGVj
bGFyZWQgeGVuL2lvbW11LmguIFRoaXMgcGF0Y2ggcmVsb2NhdGVzCj4gdGhlIGZ1bmN0aW9uIGFo
ZWFkIG9mIHRoZSBmaXJzdCBjYWxsZWQgYW5kIG1ha2VzIGl0IHN0YXRpYy4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4gY2FsbGVyCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
