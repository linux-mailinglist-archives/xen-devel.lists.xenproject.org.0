Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A2138E5A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 10:58:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqwRT-0003po-Ep; Mon, 13 Jan 2020 09:55:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ovw5=3C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iqwRS-0003pj-Jd
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 09:55:26 +0000
X-Inumbo-ID: cd75d166-35ea-11ea-ac27-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd75d166-35ea-11ea-ac27-bc764e2007e4;
 Mon, 13 Jan 2020 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578909318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x7xJTqB14LWoSFgsa+eCPpwC/buUotSsSvKgqBM35Yo=;
 b=dKY7z9FVWudV/rhTiuEzFU/hRXj83jaUogSIKR6swvPsj6I+4KC6TKKT
 4bvZAmhWQ6gppWjIGpSYfQ99TRP/KG3s/qjBou8wB6G58muStnKvtq/oA
 strYSdpPJaCWId6ilYRuaXBdOEk0XfOv+cXEC0WdFuDmgaObCB0GhAAvG Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JfT05Zxv6Ttu7bOIRF8cT096SWH96bNNGjcAzINGkIUCaMfRd2VuA5qaKWjU42bxNdu9S6FVSU
 kMxRM8gCs1bbBPg9Og6QUvQ3/TjuamvJwVv645LEHV/R9y6VcRYt4hjWOqr6Qj+WjzWIv5N1kq
 q4sukZK2YwbRqNq/68uhdVRuGkJMro9uHe4CSGhBbea9oVtGSNybIgs97GurbC5O5ZlRFdoxqj
 Y0/rNRUS75owEXBcJbc5/qKGsTg7GCUqtNqWdla6dMvu3fXuhIH0oqh9zsAZT4+nUaO7O10lD1
 MdU=
X-SBRS: 2.7
X-MesageID: 10812478
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,428,1571716800"; d="scan'208";a="10812478"
Date: Mon, 13 Jan 2020 10:55:07 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sjpark@amazon.com>
Message-ID: <20200113095507.GE11756@Air-de-Roger>
References: <20191218183718.31719-1-sjpark@amazon.com>
 <20200113094952.30727-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113094952.30727-1-sjpark@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v13 0/5] xenbus/backend: Add memory pressure
 handler callback
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
Cc: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 pdurrant@amazon.com, sj38.park@gmail.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTA6NDk6NTJBTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBFdmVyeSBwYXRjaCBvZiB0aGlzIHBhdGNoc2V0IGdvdCBhdCBsZWFzdCBvbmUgJ1Jl
dmlld2VkLWJ5JyBvciAnQWNrZWQtYnknIGZyb20KPiBhcHByb3ByaWF0ZSBtYWludGFpbmVycyBi
eSBsYXN0IFdlZG5lc2RheSwgYW5kIGFmdGVyIHRoYXQsIGdvdCBubyBjb21tZW50IHlldC4KPiBN
YXkgSSBhc2sgc29tZSBtb3JlIGNvbW1lbnRzPwoKSSdtIG5vdCBzdXJlIHdoeSBtb3JlIGNvbW1l
bnRzIGFyZSBuZWVkZWQsIHBhdGNoZXMgaGF2ZSBhbGwgdGhlCnJlbGV2YW50IEFja3MgYW5kIHdp
bGwgYmUgcHVzaGVkIGluIGR1ZSB0aW1lIHVubGVzcyBzb21lb25lIGhhcwpvYmplY3Rpb25zLgoK
UGxlYXNlIGJlIHBhdGllbnQgYW5kIHdhaXQgYXQgbGVhc3QgdW50aWwgdGhlIG5leHQgbWVyZ2Ug
d2luZG93LCB0aGlzCnBhdGNoZXMgYXJlIG5vdCBidWcgZml4ZXMgc28gcHVzaGluZyB0aGVtIG5v
dyB3b3VsZCBiZSB3cm9uZy4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
