Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0813CAB7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 18:14:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irmCw-0001mO-He; Wed, 15 Jan 2020 17:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5wAN=3E=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irmCv-0001mE-3E
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:11:53 +0000
X-Inumbo-ID: 1abfd950-37ba-11ea-ac27-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1abfd950-37ba-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579108304;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=wYuA+w8fFk30xmjf0mEqQk4lgdRH2HV0dFBOxnoBzU4=;
 b=XxpBhyn9ZceUIx1Pp4+7OLNcX+Oh/m7S9z8qHs8rey1df/V+ZElpGfTc
 oZ4UN1cY4vT6rJOrKj4+Sz7geo2eztT8i+W+Rm4SEjNrTWxIrRaaBCgZc
 2nYuRICv4WF+QWzEbnZg4DJ/HWts2cPIpgH3Pj2B7GeKaDIUQ4qH0PfN1 g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eitucuupESIdkwU/9r5y0YLw3nhmJTHMMayMxX9rdxo7J7PVtMikQqVFtL0dPgvQlXMYvp/VIg
 UICXeI/68S+P7KnkQ/T6gfQSabz72off9ynHFwuI5xcgkpfTSEF8R/e7UeDUkgGzkbWde0w1Pa
 wBZozgkXuysQfy3T+ZhJv8R2g2Qmhc22Ca1XV7r2dpBnylKkBbUZQ0JaC9AG/b1MfDw+xUr727
 WHPb52HyjNHH+xuDo6jT/lYlmUGPHfjgXjOc70GroVet+lqcaSr0DgugnTeuLmZNMnyfxFzDab
 3GY=
X-SBRS: 2.7
X-MesageID: 11387763
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11387763"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24095.18381.287221.48484@mariner.uk.xensource.com>
Date: Wed, 15 Jan 2020 17:11:41 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20200115164455.247202-1-anthony.perard@citrix.com>
References: <20200115164455.247202-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH] linkfarm: Exclude .*.tmp
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSF0gbGlua2Zhcm06IEV4Y2x1ZGUgLiou
dG1wIik6Cj4gRXhjbHVkZSBpbnRlcm1pZGlhdGUgZmlsZXMgLioudG1wIGZyb20gdGhlIGxpbmtm
YXJtLCB0aG9zZSBhcmUKPiBnZW5lcmF0ZWQgYnkgJS5vOiUuYyBydWxlcyBpbiB4ZW4vUnVsZXMu
bWsgd2hlbgo+IENPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xTPXkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
