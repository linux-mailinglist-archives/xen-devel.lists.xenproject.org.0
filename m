Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D41151BE1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 15:10:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyys3-0001Az-HC; Tue, 04 Feb 2020 14:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8X2i=3Y=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1iyys1-0001Au-Uq
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 14:08:06 +0000
X-Inumbo-ID: c1abd8ac-4757-11ea-8f53-12813bfff9fa
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1abd8ac-4757-11ea-8f53-12813bfff9fa;
 Tue, 04 Feb 2020 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1580825282; i=@ts.fujitsu.com;
 bh=uxAMJFTllZZXZYPeN7ourYiUC8YEiPEgDyTDrh3eNVI=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type;
 b=rlUjRHlb2YJsKIpskqgmlam6kM4PMLfJWm5pHDlsZzS8A/b9DkTtesxsJWUMo5dme
 alz8t5EqO0TDDb0LA2Bhw0MGwqmnywMeXzdeQhkFGoJAGhQG2rGFprxW8wtIbwJJtE
 TNiNF5ZC2suVsvohCQgsf49o3gf3c3mlAvQDpOcdASi94aR23YgetLURuqo9bi62k2
 FaIAK22RDYaeSYbr22jWHlRcjae7XLgtFZSL6ZSukmZEtGkpYkTY+77EwVH+7b4DT3
 a89Z7lAGUd/yJqL/g9kh7uOHHWX41540J5/Eat8WC+9hYbBeSCiue6Xx5Ql2X8pU4v
 o03VHR0Hjqxrw==
Received: from [100.112.193.15] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-west-1.aws.symcld.net id E6/26-20798-2CA793E5;
 Tue, 04 Feb 2020 14:08:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVfdglWW
 cwazDRharN01ns/i+ZTKTA5PH68kTGD0Of7jCEsAUxZqZl5RfkcCacfTveraCfzwVD461MzYw
 HuTqYuTiEBKYzSix8tAnNghnOaNE//1Gxi5GTg42AQOJXa8OMXcxcnCICOhJtBzRAwkzC7hKr
 Hz4lAXEFhYIltjUtIsdxGYRUJWYs2QTWCuvgKHEnZu/wOKcAnYSPzb8ZAOxhQSSJWZ/WsYMUS
 MocXLmExaImfISHZcbWSFsHYkFuz+xTWDknYWkbBaSsllIyhYwMq9itEgqykzPKMlNzMzRNTQ
 w0DU0NNI1tDTSNTIx10us0k3USy3VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDMWUggPfdzCe
 X/5e7xCjJAeTkijvITvLOCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvO6VQDnBotT01Iq0zBxgX
 MCkJTh4lER4H1cApXmLCxJzizPTIVKnGBWlxHmlgNEkJACSyCjNg2uDxeIlRlkpYV5GBgYGIZ
 6C1KLczBJU+VeM4hyMSsK8T0C282TmlcBNfwW0mAlosbS3BcjikkSElFQD0/GDlZIL8yo+qnb
 YK9e1vI6KY3Rh+edzeMlqFn5DtWOTrN7kRuuKu97KOPeST2OT+q11q0S1XTzrZL9Fe53/MXPp
 mzZRCTnGYzrGuVFTLTt3WO8LPLOPa/k3e77O8v1zHPbcD1Y4EGoxb1csY8SWRX+ufJ87r69qd
 9rzXzsz5jLt//7g2Iyr2+y+ZN5/qumnvmUC1xu9zoNak41/OU3Ydkzah39rzeyILwylOYz5ba
 Eycqvc85mYNVsT7t7JUV95W3X5lLDG+RaGncqX3ltbLm3+bn927rPqCpaLU+c2GehomuScX8F
 0JLxuZcD+GhmX6nNf9DfEPk+JOL/h0SkbfaHugy55PnuUtZWu6z08pMRSnJFoqMVcVJwIABTx
 7b9AAwAA
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-14.tower-265.messagelabs.com!1580825281!284945!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12647 invoked from network); 4 Feb 2020 14:08:01 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-14.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Feb 2020 14:08:01 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 014E7w1B003489;
 Tue, 4 Feb 2020 14:07:58 GMT
Received: from amur.mch.fsc.net (amur.mch.fsc.net [10.172.102.28])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 6DA60A03EE0;
 Tue,  4 Feb 2020 15:07:50 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Date: Tue, 04 Feb 2020 15:07:50 +0100
Message-ID: <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
In-Reply-To: <3936e4e4-f424-20b9-07d2-3a16433f65ae@citrix.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <3936e4e4-f424-20b9-07d2-3a16433f65ae@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gRnJlaXRhZywgMzEuIEphbnVhciAyMDIwLCAyMjo1OToxOSBDRVQgc2NocmllYiBJZ29yIERy
dXpoaW5pbjoKPiBPbiAzMC8wMS8yMDIwIDEzOjAzLCBEaWV0bWFyIEhhaG4gd3JvdGU6Cj4gPiBI
aSwKPiA+IAo+ID4gd2UgdXNlIFNMRVMxMiB3aXRoIGtlcm5lbC1kZWZhdWx0LTQuMTIuMTQtOTUu
NDUuMS54ODZfNjQgYW5kIAo+ID4geGVuLTQuMTEuM18wMi0yLjIwLjEueDg2XzY0Cj4gPiAKPiA+
IFRoZSBkdW1wIGtlcm5lbCBkb2Vzbid0IHN0YXJ0IGFmdGVyICJlY2hvIGMgPiAvcHJvYy9zeXNy
cV90cmlnZ2VyIi4KPiA+IExhc3QgbWVzc2FnZXMgb24gY29uc29sZSBhcmU6Cj4gPiBbICAzODUu
NzE3NTMyXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uCj4gPiBb
ICAzODUuNzM0NTY1XSBLZXJuZWwgT2Zmc2V0OiBkaXNhYmxlZAo+ID4gKFhFTikgSGFyZHdhcmUg
RG9tMCBjcmFzaGVkOiBFeGVjdXRpbmcga2V4ZWMgaW1hZ2Ugb24gY3B1NTgKPiA+IChYRU4pIFNo
b3QgZG93biBhbGwgQ1BVcwo+ID4gCj4gPiBBZnRlciBhIHNob3J0IHRpbWUgYSByZWJvb3QgaXMg
aW5pdGlhdGVkLgo+ID4gV2l0aG91dCB4ZW4gdGhlIGtkdW1wIHdvcmtzLgo+ID4gCj4gPiBXZSBz
ZWUgdGhpcyBiZWhhdmlvdXIgb25seSBvbiBuZXdlciBoYXJkd2FyZSwgZm9yIGV4YW1wbGUgYSBz
ZXJ2ZXIgd2l0aAo+ID4gSW50ZWwoUikgWGVvbihSKSBHb2xkIDYyNDIgQ1BVIEAgMi44MEdIego+
ID4gCj4gPiBJIGJ1aWx0IHRoZSBmcmVzaCByZWxlYXNlZCB4ZW4tNC4xMyBteXNlbGYgYW5kIHRy
aWVkIGl0IGJ1dCB0aGlzIGRvZXNuJ3QgaGVscC4KPiA+IAo+ID4gSSB0cmllZCB4MmFwaWM9b2Zm
IG9uIHRoZSB4ZW4gc2lkZSBhbmQgbm94MmFwaWMgb24gdGhlIGxpbnV4IHNpZGUgYnV0IG5vIHN1
Y2Nlc3MuCj4gCj4gU3RhcnRpbmcgZnJvbSBYZW4gNC4xMiB3ZSBrZWVwIElPTU1VIGVuYWJsZWQg
ZHVyaW5nIGtleGVjIHRyYW5zaXRpb24KPiB3aGljaCByZXNvbHZlZCB0aGUgcHJvYmxlbSB5b3Un
cmUgZGVzY3JpYmluZy4gQnV0IHlvdSBhbHNvIG5lZWQgdG8gbWFrZQo+IHN1cmUgSU9NTVUgaXMg
ZW5hYmxlZCBpbiB5b3VyIGtleGVjIGtlcm5lbCAod2hpY2ggSSB0aGluayBpcyBub3cgdGhlCj4g
ZGVmYXVsdCBmb3IgbW9zdCBkaXN0cm9zKS4gWW91IGNhbiBzdGlsbCB0cnkgdG8gd29ya2Fyb3Vu
ZCB0aGUgaXNzdWUKPiB5b3UncmUgc2VlaW5nIG9uIDQuMTEgYnkgdXNpbmcgImlvbW11PWRvbTAt
cGFzc3Rob3VnaCIgWGVuIG9wdGlvbi4KCkkgYWRkZWQgImlvbW11PWRvbTAtcGFzc3Rocm91Z2gi
IHRvIHRoZSB4ZW4tNC4xMSBjb21tYW5kIGxpbmUgYnV0IG5vIHN1Y2Nlc3MuCkZ1cnRoZXIgSSBh
ZGRlZCBlYXJseXByaW50az0uLi4gdG8gdGhlIHRoZSBrZHVtcCBrZXJuZWwgYW5kIEkgY291bGQg
c2VlIHRoZQpkdW1wIGtlcm5lbCBzdGFydGVkIGFuZCBvbmx5IG9uZSBtZXNzYWdlIGZyb20gZXh0
cmFjdF9rZXJuZWwoKQp3YXMgcHJpbnRlZC4gVGhlbiB0aGUgcmVib290IGZvbGxvd2VkLgoKQmVj
YXVzZSBJJ20gbm90IHRoYXQgZmFtaWxpYXIgd2l0aCB0aGlzIHBhcnQgb2YgSSB3b3VsZCBhcHBy
ZWNpYXRlIGhpbnRzIHdoZXJlCnRvIGRpZyBkZWVwZXIuClRoYW5rcy4KRGlldG1hci4KCgo+IAo+
IElnb3IKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
