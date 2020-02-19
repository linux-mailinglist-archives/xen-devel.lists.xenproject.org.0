Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B6F164399
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:44:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4NjN-0003wf-9b; Wed, 19 Feb 2020 11:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4NjL-0003wa-AD
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:41:27 +0000
X-Inumbo-ID: c2e1ce28-530c-11ea-aa99-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2e1ce28-530c-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582112487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FLIg4Ys5rnRtEaeuwMblmYHcF9j6afuTGjOXwQc4PrM=;
 b=H3e96jMP1hopDNJnE7/9nl6p1ctnZJSM6yzIUBCkSnHcahzYaKEs58rB
 WJ7vldzr1MOWKlJl013dpZ7ez8utTQi0svmz3y7TL9myzkqIqMQctzEcD
 bTdyS2g2ExQB3pWuJcOwFDggpbvQLhnIPzQkMD0hlso53NTJwDf4xRh9L 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z7qg2WwtOO+ExMqSarar7nbOqwXpYhuyHWKDmm5QMwXYlHbbX+0dHv3CaWwtCuatWdS6N8g06p
 PVKRzf92qYr7QDqCspHqT0E3CX5yoRsoYsAhdnun9D5p+ZRDCLyOQV+x0o60kE+DOjC7Fss0GO
 1In3Uq08UOOjSaSGld4WwWdHvQmtjKDXuvCHDFVWbBPYumLffabk9thDPAGd7iedM3lUidsGEQ
 Ru+bPfjpYml6LYdJSQcVKTO2DDkuTmW3zDd3OyCwZUvIRNVTpDMncYZYkTyMXUxLYqKx5viFTd
 JSE=
X-SBRS: 2.7
X-MesageID: 12686874
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="12686874"
Date: Wed, 19 Feb 2020 12:41:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200219114118.GZ4679@Air-de-Roger>
References: <20200219102256.81594-1-roger.pau@citrix.com>
 <20200219102256.81594-2-roger.pau@citrix.com>
 <c0a6422b-c664-2967-94c9-a4b2698e28c0@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0a6422b-c664-2967-94c9-a4b2698e28c0@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 1/3] arm: rename BIT_{WORD/MASK/PER_WORD)
 to BITOP_*
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMTE6MzU6MTZBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIDE5LzAyLzIwMjAgMTA6MjIsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPiA+IFNvIEJJVF9XT1JEIGNhbiBiZSBpbXBvcnRlZCBmcm9tIExpbnV4LiBUaGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIGN1cnJlbnQKPiA+IExpbnV4IGltcGxlbWVudGF0aW9uIG9mIEJJ
VF9XT1JEIGlzIHRoYXQgdGhlIHNpemUgb2YgdGhlIHdvcmQgdW5pdCBpcwo+ID4gYSBsb25nIGlu
dGVnZXIsIHdoaWxlIHRoZSBYZW4gb25lIGlzIGhhcmRjb2RlZCB0byAzMiBiaXRzLgo+ID4gCj4g
PiBDdXJyZW50IHVzZXJzIG9mIEJJVE9QX1dPUkQgb24gQXJtICh3aGljaCBjb25zaWRlcnMgYSB3
b3JkIGEgbG9uZwo+ID4gaW50ZWdlcikgYXJlIHN3aXRjaGVkIHRvIHVzZSB0aGUgZ2VuZXJpYyBC
SVRfV09SRCB3aGljaCBhbHNvIG9wZXJhdGVzCj4gPiBvbiBsb25nIGludGVnZXJzLgo+ID4gCj4g
PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiA+IAo+ID4gU3VnZ2VzdGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+ID4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4KPiAKPiBEaWQgeW91IGJ1aWxkIHRlc3QgaXQgb24gQXJtPwoKRGlkIGEgZ2l0
bGFiIHJ1biwgYnVpbGQgd2FzIGZpbmU6CgpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3Qv
cGVvcGxlL3JveWdlci94ZW4vcGlwZWxpbmVzLzExODg3ODU0NAoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
