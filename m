Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A191177D35
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:19:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9B8j-0006c7-UC; Tue, 03 Mar 2020 17:15:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9B8i-0006c1-GX
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:15:28 +0000
X-Inumbo-ID: 93726a24-5d72-11ea-a1cd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93726a24-5d72-11ea-a1cd-12813bfff9fa;
 Tue, 03 Mar 2020 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583255727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3yrdyCPUbKqviba5uzZ3n8lXjQ9RTQ5hBF9rvWAwbno=;
 b=GDh2nhpdJUDVRdz8/8oZjla4NH7iq3KnU4uMUfQtInJPOAA2ORanW1WE
 mDzWdVrho4pql+tKBHK+2Db3VmLaJBYGXuSJaFKqZ8isPx+219QLQZk/Q
 3pBQmbGARZ1/VfFQGFSxgDBuEVMPvpPGE7oqRvrTwpYDiUtVVnutc/Vdp w=;
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
IronPort-SDR: 89DVCJCiFcl8CfVeIEvcnk52gNI9UVmNqTUepalH1ujkKiXKGNXgSmGuKGkLRlhXyEGBkyhVQP
 BYrgxCIsyitKGWaSTmPtYoSCGle/nUjlbgLcfqwmpHrRNd8l6VCiudPEVBUj+VadB7MQOzCU7b
 aaKoctkyYOsx8RPfhvhwCzTV6nSsoPivVnb48NNg5li6P9agIyCGHkiLYpIRGQDN4yzfHF+lDp
 uN4PRt5aCV1Z6PHhLYJy/+sGu2eXveav3LkmY4EEdhc27Y8B3qgbecabCh6JM2dAxaCOsiY2pC
 nsY=
X-SBRS: 2.7
X-MesageID: 13972448
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13972448"
Date: Tue, 3 Mar 2020 18:15:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200303171520.GP24458@Air-de-Roger.citrite.net>
References: <23854915-905d-d564-eca8-10435bd361eb@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23854915-905d-d564-eca8-10435bd361eb@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: refine APIC ID restriction
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

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDU6MTc6NDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTm93IHRoYXQgd2UgZGlzdGluZ3Vpc2ggInJlc3RyaWN0ZWQiIGFuZCAiZnVsbCIgaW50
ZXJydXB0IHJlbWFwcGluZwo+IG1vZGUsIHRoZSA4LWJpdC1BUElDLUlEIHJlc3RyaWN0aW9uIGFs
c28gbmVlZHMgdG8gYmUgZW5mb3JjZWQgZm9yCj4gInJlc3RyaWN0ZWQiLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
