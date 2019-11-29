Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F410D814
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:48:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaiU9-00037y-2M; Fri, 29 Nov 2019 15:47:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iaiU7-00037m-Ob
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:47:07 +0000
X-Inumbo-ID: 7e1c4e4a-12bf-11ea-a3e7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e1c4e4a-12bf-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575042426;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=1CJ02mkK2O/vW+VhVv65WCwSG5Tby28NfRDFtHW3LCo=;
 b=YSE6b1dbWnPxE4OzDuU6kidiisJnH5xximOzNS7uLW5RqOcxZtdXW9L5
 zhxpXfpnohVvVBhm4Q+y9422SDEGCIE46DIDMGfxC1FwhRimC0N0zzoZt
 3CTqsizjdli+oJuBy0Wga9ikzaes0bY+XXCcEcU2rnlPmkPZXPmKBOqlx w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RUXUGTz3eMzfzIVHw/4lTowIudn/j6YGtYNxOVQiX/j2OKeBNcJQdcyoTTU7CdhtKhBs5SnI45
 GGmB2S5CVNu+dvRcdrGR4wFsN9oP3nDg7lovO3WHkAO4NtDr9kiwApOcvgmpnpT6kHWyXFCoAx
 29buke/iQNQrn6th+7bDLeB6UhvS+lpkj4zm2+8DeFwRmfScPe7nxi9wOgArqV23e08tI8tJNS
 KysqSF1t8F/++JfOYBMI/MM7ImIQbFIzBxZaai0vKkxeCqjedFvRZnH+l/LrICtVVfKzWiveB/
 nMo=
X-SBRS: 2.7
X-MesageID: 8996126
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8996126"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24033.15733.686597.694978@mariner.uk.xensource.com>
Date: Fri, 29 Nov 2019 15:47:01 +0000
To: Wei Liu <wl@xen.org>
In-Reply-To: <20191129124427.l7wyupz5mcn7nx57@debian>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124427.l7wyupz5mcn7nx57@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENILWZvci00LjEzIHY1XSBSYXRpb25hbGl6ZSBtYXhf
Z3JhbnRfZnJhbWVzIGFuZCBtYXhfbWFwdHJhY2tfZnJhbWVzIGhhbmRsaW5nIik6Cj4gV2hhdCBp
ZiB3ZSB1c2UgMHhmZmZmZmZmZiB0byBkZW5vdGUgZGVmYXVsdCBpbnN0ZWFkPyBUaGF0IHdvdWxk
bid0Cj4gcmVxdWlyZSBjaGFuZ2luZyB0aGUgdHlwZSBoZXJlLgoKSXMgdGhlcmUgc29tZSByZWFz
b24gd2Ugd291bGRuJ3QgdXNlIH4wIHRvIG1lYW4gZGVmYXVsdCA/CgpJbiB0aGUgdG9vbHMgYXJl
YSB3ZSBub3JtYWxseSBzcGVsbCB0aGlzIGFzCiAgICAgfihzb21lIGFwcHJvcHJpYXRlIHR5cGUp
MAp0byBtYWtlIHN1cmUgaXQgaGFzIHRoZSByaWdodCB3aWR0aC4gIEJ1dCBpZiB3ZSBrbm93IHRo
ZSB0eXBlIGFuZCBpdAppcyBvZiBmaXhlZCBsZW5ndGgsIGFzIGhlcmUsIDB4ZmZmZmZmZmZ1IGlz
IE9LIHRvby4KCj4gVGhlIHR5cGUgY2hhbmdlIGhlcmUgbWFrZXMgbWUgZmVlbCBhIGJpdCB1bmNv
bWZvcnRhYmxlLCB0aG91Z2ggaW4KPiBwcmFjdGljZSBpdCBtYXkgbm90IG1hdHRlci4gSSBkb24n
dCBzZWUgYW55b25lIHdvdWxkIHNwZWNpZnkgYSB2YWx1ZQo+IHRoYXQgd291bGQgYmVjb21lIG5l
Z2F0aXZlIHdoZW4gY2FzdCBmcm9tIHVpbnQzMiB0byBpbnRlZ2VyLgoKVGhlIHByb2JsZW0gd2l0
aCB0aGUgdHlwZSBjaGFuZ2UgaXMgdGhhdCBpbiBwcmluY2lwbGUgd2UgaGF2ZSB0byBhdWRpdAph
bGwgdGhlIHBsYWNlcyB0aGUgdmFyaWFibGVzIGFyZSB1c2VkLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
