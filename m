Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC317DF31
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:58:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBH0h-0001Lb-9n; Mon, 09 Mar 2020 11:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=42rt=42=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1jBH0f-0001LP-PX
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:55:49 +0000
X-Inumbo-ID: eab0caea-61fc-11ea-b52f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eab0caea-61fc-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583754948;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=C/xJxaz1HPEad9Cq79QVEMSisToP/g2HFWCfsADfI6Y=;
 b=YPGhyhv+m7cTNWzGBJPGm1VmsB49OFK18QdcZFHyEARlxjvZOfV8vFr4
 TrJA1yI61PY+OC58bGrDUKWRCdvo1WQhSoIHYAGFd/hlXGWw8mGUdv5oe
 3PF+YKBCBRgk7gA8RCj62u2xKsR9AGgdcF08dj8aktkt/sar6VrcjFnzA Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JgI9DMDBqIG/5csB+AE2eQzxs8Jzg+AtOz604uvzUk/KvqamPC+ZuFGEgWHgAEcEqSrCSSsHYd
 PGe+O8Q/dcmI/ANpEk3lF54Mteac5sjwzfqIYQFk1LEolKBjmUojw2LQEFmpluKkO8ryXMTcqG
 Neea/juow+M3adZq6S2AG2T6oG8ZuY+o3fQReMLpLfwWaJzOjjjjLG8DHPs0vm8HvWQTHSxlXr
 wH1oENiYbIFJxwZvLO9QhLTE6tdHWq1Uf9dC8BxvPf74CN+6Q1dHSiO2ahQd/aCEcVRlZZ5/80
 M2M=
X-SBRS: 2.7
X-MesageID: 13965934
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,533,1574139600"; d="scan'208";a="13965934"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <dbf7d4d5-8df7-b391-30a8-b98bb53bbcb4@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <25cbe893-acc4-496a-6914-b27253985338@citrix.com>
Date: Mon, 9 Mar 2020 11:55:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <dbf7d4d5-8df7-b391-30a8-b98bb53bbcb4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vmevent: reduce include dependencies
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy85LzIwIDExOjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGVyZSdzIG5vIG5lZWQg
Zm9yIHZpcnR1YWxseSBldmVyeXRoaW5nIHRvIGluY2x1ZGUgcHVibGljL3ZtX2V2ZW50LmguCj4g
TW92ZSBpdHMgaW5jbHVzaW9uIG91dCBvZiBzY2hlZC5oLiBUaGlzIHJlcXVpcmVzIHVzaW5nIHRo
ZSBub24tdHlwZWRlZgo+IG5hbWUgaW4gcDJtX21lbV9wYWdpbmdfcmVzdW1lKCkncyBwcm90b3R5
cGU7IGJ5IG5vdCBjaGFuZ2luZyB0aGUKPiBmdW5jdGlvbiBkZWZpbml0aW9uIGF0IHRoZSBzYW1l
IHRpbWUgaXQnbGwgcmVtYWluIGNlcnRhaW4gdGhhdCB0aGUgYnVpbGQKPiB3b3VsZCBmYWlsIGlm
IHRoZSB0eXBlZGVmIGl0c2VsZiB3YXMgY2hhbmdlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCgpBY2tlZC1ieTogUm9zcyBMYWdlcndhbGwg
PHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
