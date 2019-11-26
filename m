Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1DB10A713
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 00:20:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZk5W-0000DY-Dv; Tue, 26 Nov 2019 23:17:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZk5V-0000DN-7f
 for xen-devel@lists.xen.org; Tue, 26 Nov 2019 23:17:41 +0000
X-Inumbo-ID: f10d9860-10a2-11ea-a3a9-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f10d9860-10a2-11ea-a3a9-12813bfff9fa;
 Tue, 26 Nov 2019 23:17:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A60CA2068E;
 Tue, 26 Nov 2019 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574810260;
 bh=LioD3Km5lB8e/IfvH7MTPIzvcll/9X5xmaQzfUI0P0M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MoPB4LaOgu+Hk6n49xC6r5X87C87cSVIifbbjsnjXA1r2pH3gIxluAY9CRS9lc034
 qOH90Lcelu1w67g9pOZ8C/k9sZ2Che8c+wm/nQ4csqRO+2BtWsGeN7g8H8Y7AqAZnD
 KhYI0+K50SyKDnR8h1YmpQhhK3VJdEmiauibdY5Y=
Date: Tue, 26 Nov 2019 15:17:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
Message-ID: <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: jgross@suse.com, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyNiBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI2
LzExLzIwMTkgMjA6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ICsgSnVlcmdlbgo+
ID4gCj4gPiBJIG1pc3NlZCB0aGF0IHlvdSB3ZXJlbid0IGluIENDIHRvIHRoZSBvcmlnaW5hbCBw
YXRjaCwgc29ycnkuCj4gPiBJIHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGdvIGluLCBhcyBvdGhl
cndpc2UgTGludXggNS40IGNvdWxkIHJ1biBpbnRvCj4gPiBwcm9ibGVtcy4gSXQgaXMgYWxzbyBh
IHByZXR0eSBzdHJhaWdodGZvcndhcmQgNCBsaW5lcyBwYXRjaC4KPiAKPiA1LjUgKG9yIDUuNikg
aXMgbm90IGdvaW5nIHRvIHJ1biBvbiBYZW4gZm9yIG90aGVyIHJlYXNvbnMgKHN0aWxsIGluIHRo
ZQo+IHZHSUMpLi4uIFNvIEkgd291bGQgbm90IHZpZXcgdGhpcyBhcyBjcml0aWNhbC4KCjUuNSBp
cyBub3Qgb3V0IHlldCwgaW4gZmFjdCwgdGhlIGRldiB3aW5kb3cgaGFzIGp1c3Qgb3BlbmVkLiBJ
c24ndCB5b3VyCnN0YXRlbWVudCBhIGJpdCBwcmVtYXR1cmU/CgpJbiBhbnkgY2FzZSwgZXZlbiBp
ZiBwb3RlbnRpYWwgZnV0dXJlIExpbnV4IHJlbGVhc2VzIGNvdWxkIGhhdmUgb3RoZXIKYWRkaXRp
b25hbCBpc3N1ZXMsIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGNoYW5nZSBvdXIgY3VycmVudCB2
aWV3IG9uCnRoaXMgc3BlY2lmaWMgaXNzdWUgd2hpY2ggYWZmZWN0cyA1LjQsIGp1c3QgcmVsZWFz
ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
