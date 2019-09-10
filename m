Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A000AEB8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:28:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gAk-0007sJ-RS; Tue, 10 Sep 2019 13:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w7W/=XF=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i7gAj-0007s8-Aw
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:27:05 +0000
X-Inumbo-ID: adb2248f-d3ce-11e9-ac1e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adb2248f-d3ce-11e9-ac1e-12813bfff9fa;
 Tue, 10 Sep 2019 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568122024;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=S4BDWmWsfK/Ys+n7M/WjIe4X/FZFZ18zG9kHjeYOJB4=;
 b=PLrP44WQZGIjIbipE8/li215L12/YCpn3vEklUXyxmXZmU2FF6ekRbGj
 tdmc74Y19sRrcYP+0l97E7kyOhYjXrg7Fzf+4S8yYIifjLVZZffVzKmBH
 DG0LD2PZTMRjqYR/WqJbByVhqYwpN76dwK2ydz39GNkizptiJqcmnZtFN 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tNnYuU9zJpjM4M3xf317QsE1KGAVeM+ZSMDW1Lwh6ltbvBeLfGzzMK5sVkQAjTEaXtULe2S2v+
 dkjfuqWCIDYaKY3hlZs6tKpBMd2kUhDBkKywRoRvfxYznR8TefLx0OyPrbPV+RzzUyEpTSnCT/
 +weMum3vgwJ/X+Uhl8x61Sd3Xom9ZZAeEhKgKSEowIbJexTkZUC7ydr1op82YnmBbVuDojZf5/
 wpslNuv05ApZ9sb++DdBFQIZuffM0raY+SBMmLgn9nIP8sY3z/exu+HVVftLxIDZPhFrcWoCbM
 oHE=
X-SBRS: 2.7
X-MesageID: 5561791
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5561791"
To: Ian Jackson <ian.jackson@citrix.com>, David Scott <dave@recoil.org>, "Jan
 Beulich" <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>,
 "Wei
 Liu" <wl@xen.org>, Julien Grall <julien.grall@arm.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, "Tim
 (Xen.org)" <tim@xen.org>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <23927.41969.760363.770886@mariner.uk.xensource.com>
From: Christian Lindig <christian.lindig@citrix.com>
Message-ID: <0e8864d9-e88f-6b3d-38f8-da80b6529a10@citrix.com>
Date: Tue, 10 Sep 2019 14:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <23927.41969.760363.770886@mariner.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 00/12] ocaml abi fixes
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wOS8yMDE5IDE0OjI0LCBJYW4gSmFja3NvbiB3cm90ZToKPiBDaHJpc3RpYW4sIGFy
ZSB5b3UgaGFwcHkgd2l0aCBteSBvdGhlciBjaGFuZ2VzIGluIHRvb2xzL29jYW1sID8KPiBJIGRv
bid0IGZlZWwgSSBuZWVkIGEgZm9ybWFsIG9jYW1sIGFjayBmb3IgdGhlIGNoYW5nZXMgdG8gYWRk
IHRoZQo+IG1pc3NpbmcgZW50cmllcyB0byB0aGUgZW51bSB0eXBlcyAoc2luY2UgdGhvc2UgYXJl
IHN1cHBvc2VkIHRvIGZvbGxvdwo+IHRoZSBoeXBlcnZpc29yIEFCSSkgYnV0IEkgdGhpbmsgSSBu
ZWVkIHlvdXIgYWNrIGZvciB0aGUgZnVydGhlciBzY3JpcHQKPiBhbmQgeGVuY3RybF9zdHVicyBj
aGFuZ2VzIGluIHYzIChvciB2My4xKSBvZiB0aGlzIHNlcmllcy4KCkFja2VkLWJ5OiBDaHJpc3Rp
YW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
