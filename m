Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC51757D1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:59:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hnr-0006QH-Gx; Mon, 02 Mar 2020 09:55:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j8hnq-0006QC-9G
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:55:58 +0000
X-Inumbo-ID: 0336b139-5c6c-11ea-9f1d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0336b139-5c6c-11ea-9f1d-12813bfff9fa;
 Mon, 02 Mar 2020 09:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583142957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yjWkvDJEJkbWiDe/8VwknXBYiW9Db+Phv7mooKHBGXU=;
 b=aX22RqfOM6eefDzFmdswVBsGAISFuBFVbgHLF/DwuoEu8oEUbfqTACRI
 BsZYHkXb1HCxAhyTjXbrBWGRECi19pwdPDXWI4E2kAnr9cdu1nA74TOZE
 1X9IGogZKN3854V51Pxbu/EWOWASEEU8JUIYFxbVIkuvZ+tiN5P12DOIm k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ehrk/CKL/GqkRvSwCYP8tnoacwJtY5sL+kUDIoFkl5Nim3JDyppMj+Tx7/JfzIzqsGWBD9ZFwe
 erqYdY48DGDBJIe91meSf00rCQbM0HtM1PUtgAeOEMDxxSxJcrWJK2rVOWxpB3BmW+UxxBwN5V
 3sWZGv5JmUEB0ZKMrSQob5HMt5bL0HG5xwP1JOnbpLfjo8oc10iwYEMW5pwemwcwD8QDN8LdmT
 SpQvyNID2UT5TiRw3UDVixTfju+vKhaRoBgl3BJEai25/F4SdA4WnI3Y9rvHbrblwepBB5SiYe
 prI=
X-SBRS: 2.7
X-MesageID: 13437013
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,506,1574139600"; d="scan'208";a="13437013"
Date: Mon, 2 Mar 2020 10:55:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200302095543.GI24458@Air-de-Roger.citrite.net>
References: <f320d25d-7fc8-8f34-932c-31b3a5f2d115@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f320d25d-7fc8-8f34-932c-31b3a5f2d115@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] IOMMU/x86: don't bypass softirq processing
 in arch_iommu_hwdom_init()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMTA6NDk6NDhBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRXZlbiB3aGVuIGEgcGFnZSBkb2Vzbid0IG5lZWQgbWFwcGluZywgd2Ugc2hvdWxkIGNo
ZWNrIHdoZXRoZXIgc29mdGlycQo+IHByb2Nlc3Npbmcgc2hvdWxkIGJlIGludm9rZWQuIE90aGVy
d2lzZSB3aXRoIHN1ZmZpY2llbnRseSBtdWNoIFJBTQo+IGNoYW5jZXMgb2YgYSB0by1iZS1tYXBw
ZWQgcGFnZSBhY3R1YWxseSBvY2N1cnJpbmcgd2l0aCB0aGUgbG9vcCBjb3VudGVyCj4gaGF2aW5n
IHRoZSAicmlnaHQiIHZhbHVlIG1heSBiZWNvbWUgZGltaW5pc2hpbmdseSBzbWFsbC4KPiAKPiBS
ZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
