Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78628189FBE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 16:35:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEah4-0004KT-9g; Wed, 18 Mar 2020 15:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qhng=5D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEah2-0004KI-FZ
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 15:33:16 +0000
X-Inumbo-ID: c8e67814-692d-11ea-92cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8e67814-692d-11ea-92cf-bc764e2007e4;
 Wed, 18 Mar 2020 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584545596;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OuX84q4nCfQe1PFNtn8HMM0d1q3p37d5AaAtx6Qv14Q=;
 b=FUwgg4zHzLT2vDAClXqg35o/RIGkONE7i16hljgIppYLZ4vinOLRHFpb
 PhuuBSs37tcBwFCcKs2ubXJR0mV91FghmJHwCiLuuMXNQIbbxO6ee0O89
 JMLgXzik8lyoc0ksWIarLhAS7kf7zJcL2g1BnyndWfE1/dERr45Q53TNJ g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vAZPI4lSTNK2xP2XcZHEgyhXFp1cG+NFtDczh2E8pkQbvhym/rNrfmk+RZT935BXY9SwkWxFYP
 G3+R1z/Yc+tD9E8duoCDHIbGk6rLFPW+A0mVnAUczVyiydZCmpytooZegsL0QrOZmMor51iLv8
 sMKGtWMRUpx/G8Kpw9PAb/jb+5SNFRd8i8GBXKopjZMx9YZ+/I60ELPx8GclYYUUwZZFkE/96B
 m3pDk3mXlVndihuJJD6uBM9DQ8FqnR3DMJt8D7GgPwIWojR+v9fZmo8DF6sr6ev2D8zSvqPdw6
 OnQ=
X-SBRS: 2.7
X-MesageID: 14407466
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,568,1574139600"; d="scan'208";a="14407466"
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
References: <20200318153106.118281-1-tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <59ffd323-4718-a2e7-810f-71da29ec251e@citrix.com>
Date: Wed, 18 Mar 2020 15:33:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318153106.118281-1-tamas@tklengyel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/mem_sharing: move mem_sharing_domain
 declaration
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDMvMjAyMCAxNTozMSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IER1ZSB0byByZWNl
bnQgcmVzaHVmZmxpbmcgb2YgaGVhZGVyIGluY2x1ZGUgcGF0aHMgbWVtX3NoYXJpbmcgbm8gbG9u
Z2VyCj4gY29tcGlsZXMuIEZpeCBpdCBieSBtb3ZpbmcgbWVtX3NoYXJpbmdfZG9tYWluIGRlY2xh
cmF0aW9uIHRvIGxvY2F0aW9uIGl0Cj4gaXMgdXNlZCBpbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
