Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4D8F0A2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 18:32:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyIdX-0001AN-RP; Thu, 15 Aug 2019 16:30:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kPzP=WL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hyIdW-0000z3-3n
 for xen-devel@lists.xen.org; Thu, 15 Aug 2019 16:30:02 +0000
X-Inumbo-ID: eb024ff8-bf79-11e9-8ba2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb024ff8-bf79-11e9-8ba2-12813bfff9fa;
 Thu, 15 Aug 2019 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565886598;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=emUUhGRvrw+QQ1pJv4vnHdnyjr+fOruJ22z5V6kkZIg=;
 b=DbZh/rxpz36zyrjS0biEYjt0nbSLVraMj3GSjEAyFyeR5Y6LM4TpiD2k
 Fq1Bfh6PQRlI2zsJfl6+Pp+zkV0+fvwqi1xDmwZ51Ke7mUzn4P8IwgZZv
 wuzk+hJqHcyd6PGbYrK0VJ0gDIgkbnRsKFxikA2JF9nk7BdBSozS6EeoP k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GNed1QZQUx+lTwywiCfyvxoxH7l3lZG+X0ea2WtHs7RiBWLL8MCaoqAYe5WU5eceQhGSZL1R5R
 HqbBNL8GqHxFJclrqEEkJ1cLbPWxNkGbh96iqVptzRXJ93NV008WOyVY1FrGbeN1G8gxJNxSVf
 P0+o7EYFOMx/HGPHo58hsswflPECMbqVlVi1Ij/yDq87PwVWQInVswXPGinVbMW1LsgoYu821Y
 GrVRoFTO3g0r3DEpVUfVfav7FYsbjVAlXAEzdH46krJ5sEY0GUBjHgR1+hv+qmQYXUMbsVvzWZ
 CZU=
X-SBRS: 2.7
X-MesageID: 4313861
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,389,1559534400"; 
   d="scan'208";a="4313861"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>, Julien Grall
 <julien.grall@arm.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
 <CFEA0BB3-F344-4672-A731-19F0D80DAF46@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bd7a904d-83dd-2499-28ea-0adb294587c8@citrix.com>
Date: Thu, 15 Aug 2019 17:29:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CFEA0BB3-F344-4672-A731-19F0D80DAF46@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDgvMjAxOSAxNjo0MiwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+IFRoYW5r
cyBKdWxpZW4uIEkgd2lsbCBkbyB0aGF0IG5leHQgdGltZSAodW5sZXNzIHlvdSBndXlzIHdhbnQg
bWUgdG8KPiByZS1zZW5kIGFsbCB0aGlzIDstKSkuCj4KPiBCVFcsIEkgYWxzbyBwdXNoZWQgbXkg
Y2hhbmdlcyBvbnRvIHRoZSB4ZW5iaXRzIHNlcnZlcjoKPiBodHRwOi8veGVuYml0cy54ZW5wcm9q
ZWN0Lm9yZy9naXR3ZWIvP3A9cGVvcGxlL3dpcGF3ZWwvbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzO2E9
c3VtbWFyeQo+IGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD1wZW9wbGUv
d2lwYXdlbC94ZW47YT1zdW1tYXJ5Cj4KPiBJIGhvcGUgdGhhdCBtYWtlcyBuYXZpZ2F0aW9uIGFu
ZCBkZWFsaW5nIHdpdGggdGhlIHN3YXJtIG9mIHBhdGNoZXMgYQo+IGJpdCBlYXNpZXIuCgpQbGVh
c2UgKHJlKXNlbmQgdHdvIHBhdGNoIHNlcmllcywgb25lIGZvciBYZW4gYW5kIG9uZSBmb3IgYnVp
bGQgdG9vbHMuwqAKRXZlbiBmb3IgaGUgc3Vic2V0IHlvdSBwb3N0ZWQgYmVmb3JlLCBJIGNhbid0
IGZpZ3VyZSBvdXQgd2hldGhlciB0aGV5J3JlCm9rIHRvIHB1c2ggc3RyYWlnaHQgYXdheSwgb3Ig
bmVlZCBtb3JlIHJldmlldy7CoCBUaGlzIHdpbGwgYmUgZmFyIGVhc2llcgp0byBkbyBpbiBvbmUg
c2luZ2xlIGdvIChwZXIgcmVwbykuCgpNeSB3b3JrZmxvdyBmb3Igc2VyaWVzIGlzIHNvbWV0aGlu
ZyBsaWtlIHRoaXM6CgpGaXJzdCwgY29uZmlybSB5b3VyIGdpdCBzZXR0aW5ncyAoZGV0YWlscyBh
cyBhcHByb3ByaWF0ZSkKCiQgZ2l0IGNvbmZpZyAtbCB8IGdyZXAgc2VuZGVtYWlsCnNlbmRlbWFp
bC5zbXRwc2VydmVyPSAkU0VSVkVSCnNlbmRlbWFpbC5jaGFpbnJlcGx5dG89ZmFsc2UKc2VuZGVt
YWlsLnRvPVhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgpzZW5kZW1h
aWwuZnJvbT0gJE1FIDwkTUVAZXhhbXBsZS5jb20+CgpTZWNvbmQsIHJlbmRlciB0aGUgcGF0Y2gg
c2VyaWVzOgoKJCBta2RpciBmb28tdjEKJCBjZCBmb28tdjEKJCBnaXQgZm9ybWF0LXBhdGNoIG1h
c3RlciAtLWNvdmVyLWxldHRlcgowMDAwLWNvdmVyLWxldHRlci5wYXRjaAowMDAxLSAuLi4uCi4u
Li4KCiQgJEVESVRPUiAwMDAwLWNvdmVyLWxldHRlci5wYXRjaAoKRmlsbCBpbiBhcyBhcHByb3By
aWF0ZS7CoCBQcm92aWRlIGEgYnJpZWYgb3ZlcnZpZXcsIG5vdGUgdGhlIHN1YmplY3Qgb2YKY29t
cGFuaW9uIHNlcmllcywgZXRjLsKgIEkgYWxzbyBpbmNsdWRlIHRoZSB1bmlvbiBvZiBhbGwgQ0Mn
ZCBwZW9wbGUgaW4KZWFjaCBwYXRjaCBqdXN0IGJlbG93IHRoZSBTdWJqZWN0OiBoZWFkZXIgd2hp
Y2ggYXZvaWRzIGhhdmluZyB0bwptYW51YWxseSBzcGVjaWZ5IHRoZW0gbGF0ZXIuwqAgQmUgYXdh
cmUgdGhhdCBpdCBpcyBzdHJpY3QgYWJvdXQgUkZDcywgc28KaGFzIHRvIGJlIENjOiBhbmQgbm90
IENDOgoKVGhpcmQsIGRvdWJsZSBjaGVjayBldmVyeXRoaW5nOgoKJCBnaXQgc2VuZC1lbWFpbCAt
LWRyeS1ydW4gKi5wYXRjaAoKRm91cnRoLCBzcGFtIHRoZSBsaXN0IGJ5IGRyb3BwaW5nIHRoZSAt
LWRyeS1ydW4uCgpGaWZ0aCwgc2l0IGJhY2sgYW5kIHdhdGNoIHRoZSByZXZpZXdzIGNvbWUgaW5b
MV0uCgp+QW5kcmV3CgpbMV0gV2hvIGFtIEkga2lkZGluZz8gVGhpcyBpcyBpbnZhcmlhYmx5ICJw
aWNrIHVwIG9uZSBvZiB0aGUgb3RoZXIKdXJnZW50IHRhc2tzIHRoYXQgeW91IHB1dCB0byBvbmUg
c2lkZSBhIGxpdHRsZSB3aGlsZSBhZ28uLi4iwqAgOykKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
