Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04481529ED
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:32:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIsD-0003X6-Lc; Wed, 05 Feb 2020 11:29:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jt5G=3Z=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1izIsB-0003Wu-Mc
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:29:35 +0000
X-Inumbo-ID: c84c68e4-480a-11ea-90d5-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c84c68e4-480a-11ea-90d5-12813bfff9fa;
 Wed, 05 Feb 2020 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580902174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uPIjiL9Q2S6C9bpLUovP1cHB6JzgkATXVPHB3WaG08I=;
 b=ceQvsG7xM/xBvS70uXjgY4/e/bfxLzCQZ152CZfIr/CrlWvfhpUunzH5
 Tn+ri0EaLfcVKPQowi5ccV/6E7SMTSTWLYivTxOx3JoQNKAarn5DS99d9
 xO6nhLeayMWfqBc27KKkaas2Ps/S/nL2LoywkEKFBYdUUBvTN0ffbZTu8 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dcbG0UrUATCUUJzIOMhOaDdcwrDPdX0aeO6jo/FaoA3XZTJ755isA6gKjbVEle1Di+ekOI9wsJ
 N6G5v8pWvNOe6oww3m2IwMF+rG32OEd6TVgHL6jiwf2y5JkisxnW/smd/VrFXV85uHRaYQck4z
 FEfUXPcv5WjP6RzW3w+4lbpevO6MYdug/G1Rab2O2U820H3HkaQWfVFYJdj08hSHpl0WUEVIDT
 MDYaxdkiOpqlUotvhWuPocd8Ybc/OJ8mD8jA65UdusGwwQWBJfozXfE8GdBqv7N+Ne3y+2z54l
 Dco=
X-SBRS: 2.7
X-MesageID: 11980275
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="11980275"
Date: Wed, 5 Feb 2020 11:29:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200205112930.GC85066@perard.uk.xensource.com>
References: <20200205112412.19414-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205112412.19414-1-pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix assertion failure in stub
 domain creation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6MjQ6MTJBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE5PVEU6IFRoZSBjb21tZW50IGZvciBYRU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbiBpbiBk
b21jdGwuaCBpcyBjaGFuZ2VkIHRvCj4gICAgICAgcmVmbGVjdCByZWFsaXR5LgoKU3VyZWx5LCB0
aGlzIGNoYW5nZSBkZXNlcnZlIHRvIGJlIGluIGl0cyBvd24gcGF0Y2gsIGlzbid0IGl0PwoKLS0g
CkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
