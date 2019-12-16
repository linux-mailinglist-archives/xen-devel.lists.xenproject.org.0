Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD581209EF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 16:41:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igsSV-0004Kv-RN; Mon, 16 Dec 2019 15:38:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igsST-0004Kl-Uq
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:38:54 +0000
X-Inumbo-ID: 28f2e466-201a-11ea-93c3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28f2e466-201a-11ea-93c3-12813bfff9fa;
 Mon, 16 Dec 2019 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576510732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3ggOXUxo2oC4iaEcD4rgS2U94qzwdngs052NdgUJR+M=;
 b=gnRXnCaeyiUedRBMxOUUIZOFxmCz4XnulbPvybLlFg10HBcx9z5qa5b/
 ipBh3/GKFI9pbeSHWgvYc5TL1QOXbkI6tf2oJq6kOTS/QHDpwPKiMhsP5
 neMGoJ2LDnYsU2T6JOhBZCpUCiiOCpBJEqlhlDScVySzNdSjtCI0ISUWR Q=;
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
IronPort-SDR: arMNTdJbsBuQ9EGX/XhUJkCCGxwle8rG2f2Tw8ARTXaISs3qjQ/z1wEvOzrHVlRUXuGgN0uY6z
 BsOXTtBq8L8e2kJf7p5WUqJn6Dma67staPtgX0ZIL5xBM+7XiRS2jULV4i5ECqYU3mYLkSstKo
 ysurdS8O/HrONgiA5z49Y4cHt/AW3Zfk3rNaT/K9TitM5DCVzkpFvnBVL1/K5gHVg2S3L9z+cu
 66b8niG8UdRU0kAHDQkyYWUDFFWzIEQDSY0R9Fj4+S8k9UoxGHVzwDjDfWcDHpMKVxP5zCwXxI
 yAE=
X-SBRS: 2.7
X-MesageID: 9725293
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,322,1571716800"; 
   d="scan'208";a="9725293"
Date: Mon, 16 Dec 2019 16:38:45 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191216153845.GQ11756@Air-de-Roger>
References: <20191216140227.19234-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216140227.19234-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] x86/pv: Fix `global-pages` to match the
 documentation
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDI6MDI6MjdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgNWRlOTYxZDljMDkgIng4NjogZG8gbm90IGVuYWJsZSBnbG9iYWwgcGFnZXMg
d2hlbiB2aXJ0dWFsaXplZCBvbiBBTUQgb3IKPiBIeWdvbiBoYXJkd2FyZSIgaW4gZmFjdCBkb2Vz
LiAgRml4IHRoZSBjYWxjdWxhdGlvbiBpbiBwZ2VfaW5pdCgpLgo+IAo+IFdoaWxlIGZpeGluZyB0
aGlzLCBhZGp1c3QgdGhlIGNvbW1hbmQgbGluZSBkb2N1bWVuYXRpb24sIGZpcnN0IHRvIHVzZSB0
aGUKPiBuZXdlciBzdHlsZSwgYW5kIHRvIGV4cGFuZCB0aGUgZGVzY3JpcHRpb24gdG8gZGlzY3Vz
cyBjYXNlcyB3aGVyZSB0aGUgb3B0aW9uCj4gbWlnaHQgYmUgdXNlZnVsIHRvIHVzZSwgYnV0IFhl
biBjYW4ndCBhY2NvdW50IGZvciBieSBkZWZhdWx0Lgo+IAoKRml4ZXM6IDVkZTk2MWQ5YzA5ICgn
eDg2OiBkbyBub3QgZW5hYmxlIGdsb2JhbCBwYWdlcyB3aGVuIHZpcnR1YWxpemVkIG9uIEFNRCBv
ciBIeWdvbiBoYXJkd2FyZScpCgpXb3VsZCBiZSBoZWxwZnVsIGZvciBiYWNrcG9ydCByZWFzb25z
IGlmIHNvbWVvbmUgcGlja3MgdXAgdGhlIG90aGVyCmNoYW5nZSAob3IgYXQgbGVhc3QgSSd2ZSBi
ZWVuIHRyeWluZyB0byB1c2UgaXQgaW4gb3JkZXIgdG8gaGVscApkb3duc3RyZWFtcyB0aGF0IG1p
Z2h0IGNoZXJyeS1waWNrIHN0dWZmKS4KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
