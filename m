Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CC49382
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 23:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hczB5-0005xH-L6; Mon, 17 Jun 2019 21:28:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hczB4-0005xC-SY
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 21:28:34 +0000
X-Inumbo-ID: dbdf4fb6-9146-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dbdf4fb6-9146-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 21:28:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF9012082C;
 Mon, 17 Jun 2019 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560806913;
 bh=EP4wEvdREsJoPDuxPCj+wwpI/Yxuqw7WXmbJuSH4K5Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=G7MTFpCsUQE8vkXklcq1XDDcm8DGTSnZXN5VTgCuryHZcS1rjIsQjLo2Pmrcsvng7
 Kd1yZQKjJ/KH2d9+GAHWtmNHaatV80xrzP20lErjIN12kMuZzwdDnADy3CKN4O9A1Y
 6pF37ICD3EyaBZ2K4bg5gUdj8VZmF/gu0P3xqDFo=
Date: Mon, 17 Jun 2019 14:28:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1906171428080.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMzAuMDQuMTkg
YXQgMjM6MDIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oCj4gPiBAQCAtNTcxLDEyICs1NzEsMjQgQEAgc3RydWN0IHhlbl9kb21jdGxfYmluZF9wdF9p
cnEgewo+ID4gICovCj4gPiAgI2RlZmluZSBEUENJX0FERF9NQVBQSU5HICAgICAgICAgMQo+ID4g
ICNkZWZpbmUgRFBDSV9SRU1PVkVfTUFQUElORyAgICAgIDAKPiA+ICsvKgo+ID4gKyAqIERlZmF1
bHQgbWVtb3J5IHBvbGljeS4gQ29ycmVzcG9uZHMgdG86Cj4gPiArICogQXJtOiBNRU1PUllfUE9M
SUNZX0FSTV9ERVZfbkdSRQo+ID4gKyAqIHg4NjogTUVNT1JZX1BPTElDWV9YODZfVUMKPiA+ICsg
Ki8KPiA+ICsjZGVmaW5lIE1FTU9SWV9QT0xJQ1lfREVGQVVMVCAgICAwCj4gPiArLyogeDg2IG9u
bHkuIE1lbW9yeSB0eXBlIFVOQ0FDSEFCTEUgKi8KPiA+ICsjZGVmaW5lIE1FTU9SWV9QT0xJQ1lf
WDg2X1VDICAgICAwCj4gCj4gSSdtIGFmcmFpZCB0aGlzIG1heSBlbmQgdXAgbWlzbGVhZGluZywg
YXMgb24gTlBUIGFuZCBpbgo+IHNoYWRvdyBtb2RlIHdlIHVzZSBVQy0gaW5zdGVhZCBvZiBVQyBh
ZmFpY3MuIEFuZHJldywKPiBkbyB5b3UgaGF2ZSBhbiBvcGluaW9uIGVpdGhlciB3YXkgd2hhdCBl
eGFjdGx5IHNob3VsZAo+IGJlIHN0YXRlZCBoZXJlPwoKUGluZz8KCkkgYW0gaGFwcHkgdG8gdXNl
IGFueSBuYW1pbmcgc2NoZW1lIHlvdSBwcmVmZXIsIHBsZWFzZSBwcm92aWRlIGlucHV0LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
