Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF532656
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 04:00:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXcCs-0002LP-Q8; Mon, 03 Jun 2019 01:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXcCq-0002LI-Jy
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:56:12 +0000
X-Inumbo-ID: bf8f7e92-85a2-11e9-ab48-b36bd808ba1a
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf8f7e92-85a2-11e9-ab48-b36bd808ba1a;
 Mon, 03 Jun 2019 01:56:07 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 09:53:52 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <40e0b331ac1c4e349f79491dfb977c0e@sslemail.net>
 <5CF1104A0200007800233FB2@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <37db96f6-09bb-7731-5117-7b3d2af8f934@mxnavi.com>
Date: Mon, 3 Jun 2019 09:56:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF1104A0200007800233FB2@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDUvMzEvMTkgMTk6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMxLjA1LjE5IGF0
IDEyOjU1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiA1LzMxLzE5IDM6NDYg
QU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jcHUuaAo+
Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2NwdS5oCj4+PiBAQCAtMTAsOCArMTAsOCBAQCBib29s
X3QgZ2V0X2NwdV9tYXBzKHZvaWQpOwo+Pj4gICAgdm9pZCBwdXRfY3B1X21hcHModm9pZCk7Cj4+
PiAgICAKPj4+ICAgIC8qIFNhZmVseSBwZXJmb3JtIENQVSBob3RwbHVnIGFuZCB1cGRhdGUgY3B1
X29ubGluZV9tYXAsIGV0Yy4gKi8KPj4+IC1ib29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCk7
Cj4+PiAtdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpOwo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9v
bF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpIHsgcmV0dXJuIGdldF9jcHVfbWFwcygpOyB9Cj4+
PiArc3RhdGljIGlubGluZSB2b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCkgeyBwdXRfY3B1X21h
cHMoKTsgfQo+IFBsdXMgcGxlYXNlIHN3aXRjaCB0byBib29sIGF0IHRoZSBzYW1lIHRpbWUuCgpZ
ZXMsIHR5cGVzIGxpa2UgYm9vdF90IG9yIHUzMiBhcmUgZ2V0dGluZyByaWQgb2YsIHNvIHNob3Vs
ZCBOb3QgYmUgdXNlZC4KCldpbGwgYmUgZml4ZWQuCgo+Cj4gSmFuCj4KPgo+IC4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
