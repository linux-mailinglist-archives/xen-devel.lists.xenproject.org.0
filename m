Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A361211B4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 18:27:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igu6d-0006QM-7y; Mon, 16 Dec 2019 17:24:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igu6c-0006QH-D6
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 17:24:26 +0000
X-Inumbo-ID: e36b61d4-2028-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e36b61d4-2028-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576517057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f/3p0ydl+7Nzy6Hfb043JbzExnsTbOldARnyWGzr9BY=;
 b=KVjKaEqTYA43gHYu0FmwBX39nEwOKStuH8YXBtxyHcxkyt9bShKSNvJh
 V5i6BIwq/nLV6ehTAEt6PWWQSyij8SdgXZj6gGWMhoiizaGTzeXKLYrWJ
 v6Z2AiPmpQmXBa14vwX3K/b/mgsBAwQduBTFwodz4jVNh0zMzCZeaS6Lj U=;
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
IronPort-SDR: E7XpQd0vLXuIGNjNKl7UCP0N7otfsGvs5gyKADACJV3+9vsBk+U7WHANefvorM+MhO0j8OV2XL
 KIYaYQMdarpDFRFcMefoJ652A550zbL0+rcGhTTxdv5Y3uXVIoc7An1AFy4ZPWmWu/LlH/ESm3
 Ucmq9tTca1cuu0qSWJ8vSBkvg+j7Eah0y3X/AlWmm3K4ViL3P3SDjATn1D3QZkFGqnCFbklthU
 y3amtJi36uwIkXDjwLHDrdBdtQ1D3qrOxjXdmgXSLuY3avDigo/f8bZEloX8n7rlJBZDmFnR/f
 c9o=
X-SBRS: 2.7
X-MesageID: 10161318
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,322,1571716800"; d="scan'208";a="10161318"
Date: Mon, 16 Dec 2019 18:24:10 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191216172410.GR11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213190436.24475-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 1/6] x86/suspend: Clarify and improve the
 behaviour of do_suspend_lowlevel()
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

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDc6MDQ6MzFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBkb19zdXNwZW5kX2xvd2xldmVsKCkgYmVoYXZlcyBhcyBhIGZ1bmN0aW9uIGNhbGws
IGV2ZW4gd2hlbiB0aGUgdHJhbXBvbGluZQo+IGp1bXBzIGJhY2sgaW50byB0aGUgbWlkZGxlIG9m
IGl0LiAgRGlzY3VzcyB0aGlzIHByb3BlcnR5LCB3aGlsZSByZW5hbWluZyB0aGUKPiBmYXItdG9v
LWdlbmVyaWMgX19yZXRfcG9pbnQgdG8gczNfcmVzdW1lLgo+IAo+IE9wdGltaXNlIHRoZSBjYWxs
aW5nIGxvZ2ljIGZvciBhY3BpX2VudGVyX3NsZWVwX3N0YXRlKCkuICAkMyBkb2Vzbid0IHJlcXVp
cmUgYQo+IDY0Yml0IHdyaXRlLCBhbmQgdGhlIGZ1bmN0aW9uIGlzbid0IHZhcmlhZGljIHNvIGRv
ZXNuJ3QgbmVlZCB0byBzcGVjaWZ5IHplcm8KPiBGUFUgcmVnaXN0ZXJzIGluIHVzZS4KPiAKPiBJ
biB0aGUgY2FzZSBvZiBhbiBhY3BpX2VudGVyX3NsZWVwX3N0YXRlKCkgZXJyb3IsIHdlIGRpZG4n
dCBhY3R1YWxseSBsb3NlCj4gc3RhdGUgc28gZG9uJ3QgbmVlZCB0byByZXN0b3JlIGl0LiAgSnVt
cCBzdHJhaWdodCB0byB0aGUgZW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
