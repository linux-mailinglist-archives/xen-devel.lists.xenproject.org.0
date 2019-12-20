Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A31279BD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 12:04:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiG1s-0001Ma-FB; Fri, 20 Dec 2019 11:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiG1q-0001MV-Fu
 for xen-devel@lists.xen.org; Fri, 20 Dec 2019 11:01:06 +0000
X-Inumbo-ID: 0228ee2f-2318-11ea-932a-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0228ee2f-2318-11ea-932a-12813bfff9fa;
 Fri, 20 Dec 2019 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576839664;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=rFpY6bCu+s42wcpF+vvxNZD24pOX7gy7ua7QPq3xHmM=;
 b=FCH3g9WiN5dGHsFZfmjvug7HWWRMJZr6OCfQH5vG+1leMB9eNDkOpKr+
 KsBsK9yOo+UB83xTqb4XGahwX/IFnBxUVSA+qD4eB1fk9W9btUJ+SkjkB
 6jVI2lwApO2uCn+lDnA+3AUG3f18hAHlexGpN4fxgR3krG/SENeZibKB1 M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PXdTLrW5R9OWuZibGaPv2/Z255wglNhsx9X6AAwNOtZJYO0mwCehC4V/IW0Vw2S6nq7oYXmHTp
 chRPHfbtt3GnqdjrrBJ6VRUfeHB/KiWmRf8obMMJO1i3OdpGkTiWMkekbjmOQL4skLE4Q7jaKX
 x8j53YPPHb7R+l7PbfmRdxT8aFBNXi7/ZCBnNyW+EA+UBoaGZ1L9v/JmhDeUlWjVn2q7JaYfTI
 v+mEuQnUjED7wo7wITGB41gB86VulDpU6ELYBr+6zdztMIgBq1pG5qnAcrKAGIn1uqrfFhiqEL
 Tzg=
X-SBRS: 2.7
X-MesageID: 9971103
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,335,1571716800"; 
   d="scan'208";a="9971103"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24060.43499.827330.958322@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 11:00:59 +0000
To: <xen-devel@lists.xen.org>
In-Reply-To: <osstest-144980-mainreport@xen.org>
References: <osstest-144980-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [osstest test] 144980: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDE0NDk4MDogcmVn
cmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDE0NDk4MCBvc3N0ZXN0IHJlYWwgW3JlYWxdCj4g
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDk4MC8K
PiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoK
PiAgdGVzdC1hcm1oZi1hcm1oZi14bC12aGQgICAgICAxOCBsZWFrLWNoZWNrL2NoZWNrICAgICAg
ICAgZmFpbCBSRUdSLiB2cy4gMTQ0NzY4CgpUaGlzIGlzIHRoZSBrbm93biBxZW11IHNodXRkb3du
IGNvcmVkdW1wIGJ1Zy4KSSBhbSBnb2luZyB0byBmb3JjZSBwdXNoIHRoaXMuCgpJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
