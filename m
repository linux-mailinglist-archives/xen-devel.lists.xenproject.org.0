Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4516A875
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 15:35:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Eml-0000QQ-NR; Mon, 24 Feb 2020 14:32:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6Emk-0000QL-IZ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 14:32:38 +0000
X-Inumbo-ID: 809ec5fc-5712-11ea-9206-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 809ec5fc-5712-11ea-9206-12813bfff9fa;
 Mon, 24 Feb 2020 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582554757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U/v8mWMuWjgb/VQYNvcoHCbbIHig9x/DOGAwtUVjBX0=;
 b=B53WQ7ARfr/Xeps7rPcsd3ldXC4GFt1foukmeoxJscEJlsBHB14sEGtX
 O/Mb9nPm86i7SJpDawWP/xP2lybeWlz9qG940d5wuamUvz5wUAOyxGKTs
 aJIalkbMfDEQcrOwVu97Tf6T1Oi5yOEDCYnH4UsNhAaCRllQCvg06Fzcz c=;
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
IronPort-SDR: sLjb/wBjaDYrrQSzZPxkvpbVt9j71eazgbkb12oNKPXdVEc4TbCsvJSDo29s7L9Rin3Sod4Q2j
 HZcK1YRH1wefCUSmCfvDF/UqpQL4iUaLPPT1WUHAyiY7QIYhIQ8bhAM95tbwJCSv2KFMv1qe/Q
 BIwSrb26N+Bb5q6oR9s11oOUVPE4gCaN8wFjBrOME8h9WaFyhZyERqtIYAZF2Sp9d+qRy/6F43
 m2x2SF6X+JuXHz9kW3v0TU2xPg6e5QA73Tar6tKXtwwkM+Hg95zd6gk+HQi13Iax/NNtaTZZ5j
 BE8=
X-SBRS: 2.7
X-MesageID: 13340985
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13340985"
Date: Mon, 24 Feb 2020 15:32:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200224143141.GP4679@Air-de-Roger>
References: <20200224142231.31097-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224142231.31097-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/msr: Drop {pv,
 hvm}_max_vcpu_msrs objects
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDI6MjI6MzFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJdCB0dXJucyBvdXQgdGhhdCB0aGVzZSBhcmUgdW51c2VkLCBhbmQgd2UgZHVwIGEg
dHlwZS1kZXBlbmRlbnQgYmxvY2sgb2YKPiB6ZXJvcy4gIFVzZSB4emFsbG9jKCkgaW5zdGVhZC4K
PiAKPiBSZWFkL3dyaXRlIE1TUnMgYXJlIHR5cGljYWxseSAwIHRvIGJlaW5nIHdpdGgsIGFuZCBu
b24temVybyBkZWZhdWx0cyB3b3VsZAo+IG5lZWQgZGVhbGluZyB3aXRoIGF0IHN1aXRhYmxlIElO
SVQvUkVTRVQgcG9pbnRzIChlLmcuIGFyY2hfdmNwdV9yZWdzX2luaXQpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
