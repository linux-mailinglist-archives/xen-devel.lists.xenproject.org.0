Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560FF232FE
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 13:49:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSgkc-0000KS-EV; Mon, 20 May 2019 11:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x+15=TU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hSgka-0000KN-5W
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:46:40 +0000
X-Inumbo-ID: ebcf8dd4-7af4-11e9-9b74-8b89c7487422
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebcf8dd4-7af4-11e9-9b74-8b89c7487422;
 Mon, 20 May 2019 11:46:36 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: zAXLqLZsEBFnXnRCLOvHm5yajpfuTfVIQUEh/QIYDopy4uUPcK2hcT5OtEfXNF8Bs6NWAC7fd7
 LiMml18fJ7mn68vz6iEESSvRWIofju4CqmuP/rpG+sW3P/cuuJBnwsN0sPyFZnlv0pvuM4ZTe0
 EdlQwFjCBkXuqgvItHApAsjwR/dthj/jCKjdp4eSVr2r+a8E46NhFMxoVlcDdTvugcli5ArRKT
 sJP/dM9iYJZcPbxskuer7wX9eeaqGFqr2gE/IaVhAibbwED6Zf4IA+zhuhPQsHz7TGAuAWtK3u
 Mjg=
X-SBRS: 2.7
X-MesageID: 630547
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="630547"
Date: Mon, 20 May 2019 13:46:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190520114626.i2u37ul3bizqwaap@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 12/15] x86/IRQ: add explicit
 tracing-enabled check to trace_irq_mask()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NTE6NTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHNldHVwIGZvciBjYWxsaW5nIHRyYWNlX3ZhcigpICh3aGljaCBpdHNlbGYgY2hl
Y2tzIHRiX2luaXRfZG9uZSkgaXMKPiBub24tbmVnbGlnaWJsZSwgYW5kIGhlbmNlIGEgc2VwYXJh
dGUgb3V0ZXItbW9zdCBjaGVjayBpcyB3YXJyYW50ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKSSB0aGluayBhIG1hY3JvIG9yIGhlbHBlciB3b3Vs
ZCBiZSBoZWxwZnVsOiBpZTogdHJhY2VfZW5hYmxlZCBvciBzb21lCnN1Y2guIENoZWNraW5nIHRi
X2luaXRfZG9uZSBpcyBhcyBvYnZpb3VzIGFzIGl0IGNvdWxkIGJlIElNTy4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
