Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B6162661
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 13:46:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j42DC-0000Le-HB; Tue, 18 Feb 2020 12:42:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j42DB-0000LZ-JK
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 12:42:49 +0000
X-Inumbo-ID: 2b41fed2-524c-11ea-ade5-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b41fed2-524c-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582029770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KqdnKGKJ9Q+h20Ec6WJsBg8Pofyx4K6zopJ1z/uvf20=;
 b=X2icVM8qit+f6M6ZcSA2N0Qms8mzc0ObXoGtVQ4h9EYA9dOL5U4N3IVL
 QP3jpDoXqiBwepyoQUgqFAxo2jkT7mHkSTBDbJzpAedpEQ4QvtN7WO35C
 Tkpjc0AfhEOObBMQln76RMOUecQvPhM5XXIp8FNU6LPYSDwNCfia1bc9p I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s6mPUgLBc47UOm8RUHs5wsXUS2lQKn4ksI/Ar4rT4Vog9M7MmTOtzfGw+2eJdQ/sds3qSrZXcd
 Ic29HQWaoP8ZM2PJXR35n9lATr24AVMfY7dlJIO3aqRWryhoomXV6FO6/3JszVS7iML7b0Hkbt
 PAAPnbtHsepIjVP27ZsEPqUuXa7Gwi5/C6CWc/t5GCzX2Fil1kWxvwk9lSZw3aY3ybvmYAJQ+f
 B1qboUiiYP1K9Eq/B3kz9OYDSYLzRqpVASLzfrZwj6ya+cGgVlFNiMI8lIerJiC54vQl5N3xlI
 +jI=
X-SBRS: 2.7
X-MesageID: 12789056
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12789056"
Date: Tue, 18 Feb 2020 13:42:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200218124240.GV4679@Air-de-Roger>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-8-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210172829.43604-8-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMDY6Mjg6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEBAIC0yNTYsNiArMjU3LDE2IEBAIHZvaWQgZmx1c2hfYXJlYV9tYXNrKGNvbnN0
IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykKPiAg
ICAgIGlmICggKGZsYWdzICYgfkZMVVNIX09SREVSX01BU0spICYmCj4gICAgICAgICAgICFjcHVt
YXNrX3N1YnNldChtYXNrLCBjcHVtYXNrX29mKGNwdSkpICkKPiAgICAgIHsKPiArICAgICAgICBp
ZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciAmJgo+ICsgICAgICAgICAgICAgIShmbGFncyAmIH4oRkxV
U0hfVExCIHwgRkxVU0hfVExCX0dMT0JBTCB8IEZMVVNIX1ZBX1ZBTElEIHwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spKSAmJgo+ICsgICAgICAgICAgICAgIWh5
cGVydmlzb3JfZmx1c2hfdGxiKG1hc2ssIHZhLCBmbGFncyAmIEZMVVNIX09SREVSX01BU0spICkK
ClRoaXMgbmVlZHMgdG8gYmUgYWRqdXN0ZWQgdG8gKGZsYWdzIC0gMSkgJiBGTFVTSF9PUkRFUl9N
QVNLLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
