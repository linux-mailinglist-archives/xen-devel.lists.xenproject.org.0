Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E43A1495
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:21:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GZc-000627-NX; Thu, 29 Aug 2019 09:18:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HRfl=WZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i3GZb-00061g-Cu
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:18:31 +0000
X-Inumbo-ID: f6eb0959-ca3d-11e9-ae63-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6eb0959-ca3d-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567070310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Gr1WhsJST/8C3pRLJ4JyzoVSXPlUtSdcSMIxDJ6vcBU=;
 b=EmGrqqvOpR3WQT1Ov83z5LxPMhlVS/q8mosphwSc8t2suSYZnPsR0F37
 h83Set+qoBhifiMOGlgnyr/Px+vgv4/t3/OWiIjfxbVX7RzVJyx+WDoqs
 rQI25E8UzCHZCXddtFR0uyfRsOkXCQkXbW5AoW/swDVqoyDoIXh9RH7z4 k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V/xcYI13lS3/HIFgJgHvZxRKFfbYtuPQpsU78ptg2dZgX6/m6+jQzZWaV/dJR2SjOm52nHqs0d
 isVNdxsv1bdAq1/GwRXdQelCrdZpRLYa/ObPIbhXNZk1wmyZonMU42ZHVqmGsdHY02wTxLbG8k
 cgltT3gAZnlr6PxXxcKEqRPUXjzl/YpUnsvdHYmLo1jRq9eB63cNgR+MBpLFmP+2AKRNMU4RIr
 tCjIfyWxMhNd5ovuLpisFHlQKRHh0lLARik3WSaqG74Tfl53EIcSCKrqSE/3jSfC/Gh93oeO2c
 xhg=
X-SBRS: 2.7
X-MesageID: 5093537
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5093537"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 29 Aug 2019 10:17:19 +0100
Message-ID: <20190829091719.25605-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190829091719.25605-1-ian.jackson@eu.citrix.com>
References: <20190829091719.25605-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/3] mg-hosts mknetbootdir: Introduce
 and require -F<firmware>
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
Cc: Dominic Brekau <dominic.brekau@credativ.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgb25lIHJ1bnMKICAuL21nLWhvc3RzIG1rbmV0Ym9vdGRpciBIT1NUCmJlZm9yZSBoYXZpbmcg
c29ydGVkIG91dCBhbGwgdGhlIGhvc3QgY29uZmlndXJhdGlvbiwgaXQgdXNlcyB0aGUKZGVmYXVs
dCBjb25maWd1cmF0aW9uIHZhbHVlIGZvciB0aGUgaG9zdCdzIGZpcm13YXJlIGtpbmQsIHdoaWNo
IGlzCiJiaW9zIi4gIElmIHRoZSBjb25maWd1cmF0aW9uIGlzIHRoZW4gY2hhbmdlZCwgdGhpbmdz
IGRvbid0IHdvcmsuClRoaXMgaXMgY29uZnVzaW5nLgoKU28gYXNrIHRoZSB1c2VyIHRvIHNwZWNp
Znkgb25lIG9yIG1vcmUgLUY8ZmlybXdhcmU+LCBvciAtRmFueS4KCkNDOiBEb21pbmljIEJyZWth
dSA8ZG9taW5pYy5icmVrYXVAY3JlZGF0aXYuZGU+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1nLWhvc3RzIHwgMTIgKysrKysrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL21nLWhvc3RzIGIvbWctaG9zdHMKaW5kZXggZDY4ZjdiNGUuLjE0ZjgxNmFlIDEw
MDc1NQotLS0gYS9tZy1ob3N0cworKysgYi9tZy1ob3N0cwpAQCAtMTksNyArMTksNyBAQAogCiAj
IFVzYWdlczoKICMKLSMgIC4vbWctaG9zdHMgbWtuZXRib290ZGlyIEhPU1QuLi4KKyMgIC4vbWct
aG9zdHMgbWtuZXRib290ZGlyIC1GYW55IHwgLUY8ZmlybXdhcmU+Li4uIEhPU1QuLi4KICMgICAg
ICAgICAgICAgICBDcmVhdGUgZGlyZWN0b3JpZXMgZm9yIG5ldGJvb3QgYXMgZXhwZWN0ZWQgYnkg
dGhlIHJlc3QKICMgICAgICAgICAgICAgICBvZiBvc3N0ZXN0LiAgV2lsbCB1c2UgInN1ZG8iLiBU
aGUgSE9TVChzKSBtdXN0IGJlCiAjICAgICAgICAgICAgICAgYWxsb2NhdGVkICh2aWEgbWctYWxs
b2NhdGUgSE9TVCkuCkBAIC0xMjEsMTkgKzEyMSwyOSBAQCBzdWIgbCAoJCkgeyByZXR1cm4gc3Bs
aXQgLywvLCAkX1swXTsgfQogCiBzdWIgY21kX21rbmV0Ym9vdGRpciAoKSB7CiAgICAgbXkgJGRy
eXJ1biA9IDA7CisgICAgbXkgJWV4cGVjdF9maXJtd2FyZTsKICAgICB3aGlsZSAoQEFSR1YgJiYg
JEFSR1ZbMF0gPX4gbS9eLS8pIHsKIAkkXyA9IHNoaWZ0IEBBUkdWOwogCWxhc3QgaWYgJF8gPX4g
bS9eLS0/JC87CiAJd2hpbGUgKG0vXi0uLykgewogCSAgICBpZiAocy9eLW4vLS8pIHsgJGRyeXJ1
bj0gMTsgfQorCSAgICBlbHNpZiAocy9eLUYoLiopLy8pIHsgJGV4cGVjdF9maXJtd2FyZXskMX0g
PSAxIH0KIAkgICAgZWxzZSB7IGRpZSAidW5rbm93biBta25ldGJvb3RkaXIgb3B0aW9uICRfIjsg
fQogCX0KICAgICB9CisgICAgZGllICJuZWVkIGF0IGxlYXN0IG9uZSAtRjxmaXJtd2FyZT4gb3Ig
LUZhbnkgb3B0aW9uIgorCXVubGVzcyAlZXhwZWN0X2Zpcm13YXJlOwogICAgIGRpZSB1bmxlc3Mg
QEFSR1Y+PTE7CiAgICAgbXkgJHN1ZG8gPSAkRU5WeydPU1NURVNUX1NVRE8nfSAvLyAnc3Vkbyc7
CiAgICAgZm9yZWFjaCBteSAkaG4gKEBBUkdWKSB7CiAgICAgICAgIG15ICRobz0gc2VsZWN0aG9z
dCgiaG9zdD0kaG4iKTsKIAlteSAoJGRpciwgJGZpbGUpID0gaG9zdF9uZXRib290X2ZpbGUoJGhv
KTsKKwlpZiAoISRleHBlY3RfZmlybXdhcmV7YW55fSkgeworCSAgICBteSAkZ290X2Zpcm13YXJl
ID0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAiZmlybXdhcmUiKTsKKwkgICAgZGllCisgImhvc3Qg
JGhuIGNvbmZpZ3VyYXRpb24gc2F5cyBmaXJtd2FyZSBcYCRnb3RfZmlybXdhcmUnLCBub3QgYXMg
ZXhwZWN0ZWRcbiIKKwkJdW5sZXNzICRleHBlY3RfZmlybXdhcmV7JGdvdF9maXJtd2FyZX07CisJ
fQogICAgICAgICBkaWUgdW5sZXNzIGRlZmluZWQgJGRpcjsKIAlteSAoJHJkaXIsICRyZWFsZmls
ZSkgPSBob3N0X25ldGJvb3RfZmlsZSgkaG8sICdUZW1wbGF0ZXNSZWFsJyk7CiAJJHJlYWxmaWxl
IC8vPSAkZmlsZTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
