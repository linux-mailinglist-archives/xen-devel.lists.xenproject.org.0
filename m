Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C619A350
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 00:57:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0vxU-0002Lh-OS; Thu, 22 Aug 2019 22:53:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0vxT-0002Lc-8o
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 22:53:31 +0000
X-Inumbo-ID: a9048506-c52f-11e9-adde-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9048506-c52f-11e9-adde-12813bfff9fa;
 Thu, 22 Aug 2019 22:53:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F26621848;
 Thu, 22 Aug 2019 22:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566514409;
 bh=2TazAl2p9yBtl3SFOdWgEAEq81HbH+UaOCYgvw7z+cI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BaxWiXZkHuz9G+PskAF2IAG52YawChYqh+yW8vAiUU659e/vpe0WpRKYlWGSuAJhf
 jVukGWMiKvrSJWit+Vwd5/go4Haw+BeXnnoLJ7ihPJ5fzUk0CCN8wFCJKlh4LuLufh
 1HdlPltmnaIptPyI12n+4ahwzhBgyMQmBYg4kmbQ=
Date: Thu, 22 Aug 2019 15:53:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <937b6185-9a3e-f8b5-8335-2d948b3bb11a@arm.com>
Message-ID: <alpine.DEB.2.21.1908221551080.25445@sstabellini-ThinkPad-T480s>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-21-julien.grall@arm.com>
 <alpine.DEB.2.21.1908221101110.22783@sstabellini-ThinkPad-T480s>
 <937b6185-9a3e-f8b5-8335-2d948b3bb11a@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 20/28] xen/arm32: head: Remove 1:1
 mapping as soon as it is not used
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiAgICAgICAgICAg
ICovCj4gPiA+IC0gICAgICAgIGRzYgo+ID4gPiArICAgICAgICBsc3IgICByMSwgcjksICNGSVJT
VF9TSElGVAo+ID4gPiArICAgICAgICBtb3ZfdyByMCwgTFBBRV9FTlRSWV9NQVNLCj4gPiAKPiA+
IGxkcj8KPiAKPiBXaGF0J3Mgd3Jvbmcgd2l0aCB0aGUgbW92X3c/IE9rIGl0IGlzIHR3byBpbnN0
cnVjdGlvbnMgYnV0Li4uIHRoZSBjb25zdGFudAo+IHdpbGwgYmUgc3RvcmVkIGluIGEgbGl0ZXJh
bCBhbmQgdGhlcmVmb3JlIGluZHVjZSBhIG1lbW9yeSBsb2FkIChzZWUgcGF0Y2ggIzgpLgoKSSBh
bSBqdXN0IHdvbmRlcmluZyB3aHkgeW91IHdvdWxkIGNob29zZSBtb3ZfdyB3aGVuIHlvdSBjYW4g
anVzdCBkbyBhCnNpbmdsZSBzaW1wbGUgbGRyLgogCgo+ID4gCj4gPiA+ICsgICAgICAgIGFuZCAg
cjEsIHIxLCByMCAgICAgICAgICAgICAgLyogcjEgOj0gZmlyc3Qgc2xvdCAqLwo+ID4gPiArICAg
ICAgICBjbXAgIHIxLCAjWEVOX0ZJUlNUX1NMT1QKPiA+IAo+ID4gTklUOiBhbGlnbgo+IAo+IGFs
aWduIG9mPwoKVGhpcyBpcyBqdXN0IGEgY29kZSBzdHlsZSB0aGluZy4gSXQgZG9lc24ndCBzaG93
IGhlcmUgYnV0IHdlIHVzdWFsbHkKaGF2ZSAzIHNwYWNlcyBiZXR3ZWVuIHRoZSBjb21tYW5kIHRo
ZSB0aGUgcmVnaXN0ZXIsIHdoaWxlIGhlcmUgdGhlcmUgYXJlCm9ubHkgMi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
