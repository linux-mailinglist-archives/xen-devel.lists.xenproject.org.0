Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35072171880
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 14:19:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7J1o-0003F4-I3; Thu, 27 Feb 2020 13:16:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7J1m-0003Ey-Kw
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 13:16:34 +0000
X-Inumbo-ID: 5fbfdd64-5963-11ea-9688-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fbfdd64-5963-11ea-9688-12813bfff9fa;
 Thu, 27 Feb 2020 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582809393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+wCizziVMa0qwt6Gr1EXR4ostZUU2M8NN7g1TGGm//4=;
 b=EvuJ3Cb5yJEHE+W3qwr2zIhco4Ba0Rvwe668KsyjHtJAXYts8jDT9pbr
 26ePywnsUbNI0KVACBQOTkyLmsBnIgHCcYYhMOsKWl49H4U21WubVc3Fs
 NF77sH/+qYJYiZmmGeeHOV0UCKeI7ZtMeiX+O1y72iKrtsM6ACmZpBM6F A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ui15XZb5wFHTIea4pikYInlktdN+OVmYDK8RuesNz+oV3hsr+tje8Pdqo3qGjlPFX5Mcgr2ZUt
 Zwa9boaRvtIxV8Sx1+6gR0Xn8xpRYLCv92d5kRVcK1SCDciiTFtg9SvSn5mJ8JzQpaTpe53K/y
 xHfwfAiw1OF1NYLCfN/Ehmdmb82SCv0HVtAg1Q2z2dSj46MH/wzU0km0kvw4ZhgAL1u0t5DoSB
 Tj8QikRgNa2RQaaHoysxZ3uLwC3Dva1zn18AO8IdpfPJjSSOIqGyiimRVMDNLVzqyj9cc1OCi8
 iOo=
X-SBRS: 2.7
X-MesageID: 13726827
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13726827"
Date: Thu, 27 Feb 2020 14:16:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200227131625.GQ24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-22-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-22-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 21/23] xen/build: Use if_changed for
 prelink*.o
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6NTNBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gV2UgY2hhbmdlIHRoZSBkZXBlbmRlbmNpZXMgb2YgcHJlbGluay1lZmkubyBzbyB0
aGF0IHdlIGNhbiB1c2UgdGhlCj4gc2FtZSBjb21tYW5kIGxpbmUuIFRoZSBkZXBlbmRlbmN5IG9u
IGVmaS9idWlsdF9pbi5vIGlzbid0IG5lZWRlZAo+IGJlY2F1c2UsIHdlIGFscmVhZHkgaGF2ZToK
PiAgICAgZWZpLyoubzogZWZpL2J1aWx0X2luLm8KPiB0byBidWlsZCBlZmkvKi5vIGZpbGVzIHRo
YXQgcHJlbGluay1lZmkubyBuZWVkcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
