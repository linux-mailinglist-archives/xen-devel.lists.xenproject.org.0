Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53962108FC8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:24:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFFz-0001SJ-Dh; Mon, 25 Nov 2019 14:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nqy9=ZR=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZFFx-0001Rz-Be
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 14:22:25 +0000
X-Inumbo-ID: ffeb79de-0f8e-11ea-b08b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffeb79de-0f8e-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574691745;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3Uf2WjUMCXa5ekb3bJ1RioMhc327e1xByfxAGKW1xHs=;
 b=Upx5rYDI8KGhALZj8VBXg2aE7Q8cBZ9A6v3qhdujnv7S3/79svBymbBE
 rxygYAhIIcK8ZlFYzLCP1Xj64BOx7A5krc58w2uq5p2Bm74Ihv0RAjLGJ
 /DOnhnvgjQQvCv0/0cmyaBilh/ieV5OFs4DxG2We3NLgIWvtvzCHqVwmt o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I/sztNIOwubSFiU7zcBF7MQ5Q9amfQoPI2meAT5W1dQE9Mx09mQCURWDyxp6oG60NC+y0gS8gY
 ZDmVwbM0lNdU4cVAjHx0Q6deE3COu7/NF+bjdiBhsqpRPUt53fh6qb9DcK/HF72pWzAAz3U6wd
 4yUy/rpaRZif0JIxUjPbc/DCZ2IOuTgTsep4E3zlmK6p6VoXydj3WY0t6xTobji3FSCPXtsxek
 nVuJqrk5u8c/U116uyaYlgDm6h8bSG5hW+ljiIA9w1zp+n5r7LgDL+oIXVLTyj05y30jO0o8x1
 rg0=
X-SBRS: 2.7
X-MesageID: 8786732
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="8786732"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916113056.16592-1-wipawel@amazon.de>
 <20190916113056.16592-5-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <6528546e-913d-41d4-9ba4-e3c3a690efb3@citrix.com>
Date: Mon, 25 Nov 2019 14:22:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190916113056.16592-5-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/7] create-diff-object: Add support for
 applied/reverted marker
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMjozMCBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gV2l0aCB2
ZXJzaW9uIDIgb2YgYSBwYXlsb2FkIHN0cnVjdHVyZSBhZGRpdGlvbmFsIGZpZWxkIGlzIHN1cHBv
cnRlZAo+IHRvIHRyYWNrIHdoZXRoZXIgZ2l2ZW4gZnVuY3Rpb24gaGFzIGJlZW4gYXBwbGllZCBv
ciByZXZlcnRlZC4KPiBUaGVyZSBhbHNvIGNvbWVzIGFkZGl0aW9uYWwgOC1ieXRlIGFsaWdubWVu
dCBwYWRkaW5nIHRvIHJlc2VydmUKPiBwbGFjZSBmb3IgZnV0dXJlIGZsYWdzIGFuZCBvcHRpb25z
Lgo+IAo+IFRoZSBuZXcgZmllbGRzIGFyZSB6ZXJvLW91dCB1cG9uIC5saXZlcGF0Y2guZnVuY3Mg
c2VjdGlvbiBjcmVhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2lj
eiA8d2lwYXdlbEBhbWF6b24uZGU+CgoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3Nz
LmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
