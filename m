Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AA897AC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 09:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx4aU-0000W3-5U; Mon, 12 Aug 2019 07:17:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2okp=WI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hx4aR-0000Vy-TG
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 07:17:47 +0000
X-Inumbo-ID: 47f1a818-bcd1-11e9-a2fc-7f8bd513b1d4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47f1a818-bcd1-11e9-a2fc-7f8bd513b1d4;
 Mon, 12 Aug 2019 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565594266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xCDPS+sdVm+NP2TDz4N9iBsHwbFxFBTUU3XVXrGvrxQ=;
 b=dwNhHJ549TWRgCf+hMY0TSeLxrw/A8z5DT3nNF/wCLD2VCGxeiktvV3S
 UQ1XoeK42qHBJtCv5N403sXEt6srDi6Im+Irs2eaJRnb0pe/x57xCC0jz
 CTJkh6nRawIGyLwwzw5kfgA8LCwwPg4r7JgRrtEArfmMXM7Velrf/ULgu k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gi2/Yb06IEtIOxfkerqw826bZD5cVOJf4sh4EximYvGxfGlT7/lVAn1SHYOlvbQy7WkSfrxf8d
 wlzhQ/EL1eDMaoi8vdhcOsuxEW/XLJBg6rrbO8zBmEMO7T/XNHA0E8Jp7sj3pk3jxE1lLwZZod
 /LRLJX6Yk1lytl/9f2/zun0pIYVom7BW4V5ss1BQR1KP6ZeCQ6qRFJOL9qmGUNpQv/zFpIt/n9
 2wKUiinwBq02F+Nko1rOZkKlTpCqZfhVXYg5TG9814TXCtFPDIa5Udk9jTdrHlu4Ooe9K6DtjG
 /Zk=
X-SBRS: 2.7
X-MesageID: 4183513
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,376,1559534400"; 
   d="scan'208";a="4183513"
Date: Mon, 12 Aug 2019 09:17:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190812071735.qg3sldfx3j3xqzo7@Air-de-Roger>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDI6MjM6NDRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWxsLAo+IAo+IHRoZSByZWxlYXNlIGlzIGR1ZSBpbiBlYXJseSBBdWd1c3QuIFBsZWFz
ZSBwb2ludCBvdXQgYmFja3BvcnRzIHlvdQo+IGZpbmQgbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0
aXZlIHN0YWdpbmcgYnJhbmNoLCBidXQgd2hpY2ggeW91Cj4gY29uc2lkZXIgcmVsZXZhbnQuIFRo
ZSBvbmUgY29tbWl0IEkndmUgcXVldWVkIGFscmVhZHkgb24gdG9wIG9mCj4gd2hhdCB3YXMganVz
dCBwdXNoZWQgaXMKPiAKPiBlYzJhYjQ5MWI1CXg4Ni9lcHQ6IHBhc3MgY29ycmVjdCBsZXZlbCB0
byBwMm1fZW50cnlfbW9kaWZ5CgpNYXliZSBJJ20gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBmcm9t
IHRoZSB0ZXh0IGFib3ZlIEkgYXNzdW1lZAplYzJhYjQ5MWI1IHdhcyBhbHJlYWR5IGNvbW1pdHRl
ZCB0byB0aGUgNC4xMiBicmFuY2gsIHlldCBJIGRvbid0IHNlZW0KdG8gYmUgYWJsZSB0byBzcG90
IGl0IGFueXdoZXJlIGV4Y2VwdCBzdGFnaW5nL21hc3Rlci4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
