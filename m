Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B6DE3BF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 07:32:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMQGs-0004VK-5X; Mon, 21 Oct 2019 05:30:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QP7N=YO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMQGq-0004VA-W2
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 05:30:21 +0000
X-Inumbo-ID: de62effe-f3c3-11e9-943e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de62effe-f3c3-11e9-943e-12813bfff9fa;
 Mon, 21 Oct 2019 05:30:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63AEBACB7;
 Mon, 21 Oct 2019 05:30:18 +0000 (UTC)
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20191021052747.31543-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <383da9a4-862f-f199-76d6-124711095de4@suse.com>
Date: Mon, 21 Oct 2019 07:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191021052747.31543-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/netback: cleanup init and deinit code
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
Cc: Wei Liu <wei.liu@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Paul Durrant <paul@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMTkgMDc6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gRG8gc29tZSBjbGVhbnVw
IG9mIHRoZSBuZXRiYWNrIGluaXQgYW5kIGRlaW5pdCBjb2RlOgo+IAo+IC0gYWRkIGFuIG9tbmlw
b3RlbnQgcXVldWUgZGVpbml0IGZ1bmN0aW9uIHVzYWJsZSBmcm9tCj4gICAgeGVudmlmX2Rpc2Nv
bm5lY3RfZGF0YSgpIGFuZCB0aGUgZXJyb3IgcGF0aCBvZiB4ZW52aWZfY29ubmVjdF9kYXRhKCkK
PiAtIG9ubHkgaW5zdGFsbCB0aGUgaXJxIGhhbmRsZXJzIGFmdGVyIGluaXRpYWxpemluZyBhbGwg
cmVsZXZhbnQgaXRlbXMKPiAgICAoZXNwZWNpYWxseSB0aGUga3RocmVhZHMgcmVsYXRlZCB0byB0
aGUgcXVldWUpCj4gLSB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSBnZXRfdGFza19zdHJ1Y3QoKSBh
ZnRlciBjcmVhdGluZyBhIGt0aHJlYWQKPiAgICBhbmQgdXNpbmcgcHV0X3Rhc2tfc3RydWN0KCkg
YWdhaW4gYWZ0ZXIgaGF2aW5nIHN0b3BwZWQgaXQuCj4gLSB1c2Uga3RocmVhZF9ydW4oKSBpbnN0
ZWFkIG9mIGt0aHJlYWRfY3JlYXRlKCkgdG8gc3BhcmUgdGhlIGNhbGwgb2YKPiAgICB3YWtlX3Vw
X3Byb2Nlc3MoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgpTb3JyeSwgZm9yZ290IHRvIGFkZCB0aGUgIlJldmlld2VkLWJ5OiIgb2YgUGF1bC4g
V2lsbCByZXNlbmQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
