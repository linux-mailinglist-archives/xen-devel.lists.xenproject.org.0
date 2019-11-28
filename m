Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370110CE5E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 19:12:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaOEk-0001uM-7W; Thu, 28 Nov 2019 18:09:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iaOEj-0001uB-9r
 for xen-devel@lists.xen.org; Thu, 28 Nov 2019 18:09:53 +0000
X-Inumbo-ID: 462a384a-120a-11ea-9db0-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 462a384a-120a-11ea-9db0-bc764e2007e4;
 Thu, 28 Nov 2019 18:09:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9D8021739;
 Thu, 28 Nov 2019 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574964592;
 bh=u1VmGI+Ikhw2+KVqL8AfGuVWDHyUKibmHguPJ10+vAw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=p/L+Hx63VRVOqA/t0zaGs7pjw+FxJPhFdaUF1aE4qQPIqdjnsJpT7TYflAFXRTx0q
 v+IVLA5NjzVxFOFFjQsJYy25/x3aVTJDfjQ5f8WrZh5xIrFwQyo4p6/N1CaLn5t0QX
 Hpeko3zsOyykbYmFHge6EGZYaEXqAspQ70ozuOKA=
Date: Thu, 28 Nov 2019 10:09:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <b27d00bf-5bc4-e62b-3a09-7f5b4bded0a6@xen.org>
Message-ID: <alpine.DEB.2.21.1911281004520.15579@sstabellini-ThinkPad-T480s>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
 <alpine.DEB.2.21.1911270753580.27669@sstabellini-ThinkPad-T480s>
 <c6c26fc6-d9ab-5222-3787-3d083b3b7a97@xen.org>
 <3d63788e-b28a-c8fd-dae3-99ad9f4b9a04@suse.com>
 <9d32e677-dc13-cb56-6684-01ceabf4ae47@xen.org>
 <4b5f402d-1c24-4a27-6f6c-1c134c15d83c@suse.com>
 <b27d00bf-5bc4-e62b-3a09-7f5b4bded0a6@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>, committers@xenproject.org,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyOCBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSW4gYm90aCBjYXNl
cyBJIHNlZSBubyByZWFzb24gdG8ga2VlcCB3cm9uZyBjb2RlLgo+ID4gCj4gPiBFaXRoZXIgdGhl
IHBhdGNoIHdpbGwgbGV0IHJ1biBMaW51eCA1LjQgZmluZSAtIHRoZW4gdGhlIHBhdGNoIHNob3Vs
ZAo+ID4gZGVmaW5pdGVseSBiZSB0YWtlbi4KPiBUaGF0J3MgdXAgdG8gU3RlZmFubyBhbmQgUGVu
ZyB0byBwcm92aWRlIG1lIGluZm9ybWF0aW9uIHdoeSB0aGlzIGlzIGZpbmUuCj4gRkFPRCwgdGhl
IGN1cnJlbnQganVzdGlmaWNhdGlvbiBwcm92aWRlZCBpcyBub3QgYWNjZXB0YWJsZSBmb3IgbWUu
CgpJIGRpc2FncmVlLiBUaGlzIGlzIGEgdHlwbyBmaXguIFRoZSBvcmlnaW5hbCBkZXNpZ24gd2Fz
IG5ldmVyIHNwZWMKY29tcGxpYW50LiBZb3UgY2Fubm90IGV4cGVjdCB0aGUgdHlwbyBmaXggdG8g
ZXhwbGFpbiB3aHkgdGhlIG9yaWdpbmFsCmJlaGF2aW9yIGlzIHRvbGVyYWJsZS4gVGhhdCBpcyBv
dXQgb2Ygc2NvcGUgYW5kIHNob3VsZCAqbm90KiBiZSByZXF1aXJlZApmb3IgdGhpcyBmaXguCgpX
ZSBjYW5ub3QgZXhwZWN0IHR5cG8gZml4ZXMgdG8gZ28gYW5kIHRyaWdnZXIgdmdpYy9naWMgcmV3
b3JrcyBhbmQgZGVlcAppbnZlc3RpZ2F0aW9ucy4gVGhpcyBpcyBhIHdyb25nIGV4cGVjdGF0aW9u
IG5vdywgYW5kIGdvaW5nIGZvcndhcmQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
