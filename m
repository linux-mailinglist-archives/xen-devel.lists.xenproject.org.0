Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277981702CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:40:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ylu-0002ud-R0; Wed, 26 Feb 2020 15:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6ylt-0002uX-3i
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:38:49 +0000
X-Inumbo-ID: 13fa11df-58ae-11ea-9464-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13fa11df-58ae-11ea-9464-12813bfff9fa;
 Wed, 26 Feb 2020 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582731528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5+zEv90JuVwlXjLyjUnKAfzQWFaT3/IgjpdFfZjh7f4=;
 b=bL7t/XQmcnE3ZIwNftAs9z8WnrEQHl2tJBbRX01rndcu6oGIbFAoTUmI
 f+eLIGCzLzx1w1SXD1LG29VgjkXABmCmJkLOBcln+0YnkpKpbnNJq3zP9
 v77zdbjW7htbsPMgmoyM3ZMRaclOfATB6Q2fe21KMMAS/YblskZUI+pKw k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AFgPMxnxbDcoBRFCdIsxOroB+VxirXyin19fgli4LIE5e0zQTx4JAVBoUDpqxGSAxzLQxFYQVJ
 BFHMHvs+FXuT77B0sEe6sG+6mFA72jiMb2TIz+SoAd9a6ZsmcGnuXtyhbWm3N4RjMgF4RzxYdz
 xlX+AIFx8aJhb9KPxhP2vZ61fXfJCSspZS5Y3KnaXC9dRGbkDPpTv/Fic7tgotTb18l2aRWUHp
 9bqqNioOPYHwMFfsN5n+2w/WRxrzzEPT7YrPMthxwVZkLBm5lh42eYhYxg4B26gYrMWYvTlR+D
 YI4=
X-SBRS: 2.7
X-MesageID: 13400514
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13400514"
Date: Wed, 26 Feb 2020 16:38:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200226153837.GI24458@Air-de-Roger.citrite.net>
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <628c5cdc73c589e45a19cc0ddb5cf972b00eb3dd.1582658216.git.tamas.lengyel@intel.com>
 <20200226152556.GG24458@Air-de-Roger.citrite.net>
 <CABfawh=PtWhB_GsjAj1aT0uJ6ayEE1Z9T3MbEa7Ur9vq1yZ2kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=PtWhB_GsjAj1aT0uJ6ayEE1Z9T3MbEa7Ur9vq1yZ2kQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v10 2/3] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDg6Mjg6MzFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4gWW91IGFsc28gbmVlZCB0byByZXNldCB0aGUgY29udGVudHMgb2YgdGhlIHNw
ZWNpYWwgcGFnZXMsIHRoZQo+ID4gdmNwdV9pbmZvIHBhZ2VzIGFuZCB0aGUgc2hhcmVkX2luZm8g
cGFnZSBpbiBvcmRlciB0byBtYXRjaCB0aGUgc3RhdGUKPiA+IHRoZSBWTSB3YXMgaW4gd2hlbiBm
b3JraW5nLgo+IAo+IEFjay4KPiAKPiA+Cj4gPiBQViB0aW1lcnMgc2hvdWxkIGFsc28gYmUgcmVz
ZXQgdG8gcGFyZW50J3Mgc3RhdGUgQUZBSUNULCBvciBlbHNlIHlvdQo+ID4gd2lsbCBnZXQgc3B1
cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPiAKPiBDb3VsZCB5b3UgcG9pbnQgbWUgdG8gdGhlIHJp
Z2h0IGRpcmVjdGlvbiBoZXJlIGZvciB3aGVyZSB0aGUgdGltZXJzCj4gYXJlIGxvY2F0ZWQgaW4g
dGhlIGNvZGViYXNlPwoKVGhlIGNvZGUgcGF0aHMgc3RhcnQgYXQgVkNQVU9QX3NldF9wZXJpb2Rp
Y190aW1lciwKVkNQVU9QX3N0b3BfcGVyaW9kaWNfdGltZXIsIFZDUFVPUF9zZXRfc2luZ2xlc2hv
dF90aW1lciBhbmQKVkNQVU9QX3N0b3Bfc2luZ2xlc2hvdF90aW1lci4gQUZBSUNUIGl0J3MgbW9z
dGx5IGEgbWF0dGVyIG9mIGNvcHlpbmcKdGhlIHN0YXRlIGFuZCBzdGFyaW5nIHRoZSB0aW1lciBp
ZiBpdCB3YXMgYWxyZWFkeSBhY3RpdmUgb24gdGhlCnBhcmVudC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
