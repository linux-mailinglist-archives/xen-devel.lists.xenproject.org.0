Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B91833E2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:57:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPEQ-0001f9-VK; Thu, 12 Mar 2020 14:54:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCPEP-0001f4-At
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:54:41 +0000
X-Inumbo-ID: 664082d8-6471-11ea-92cf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 664082d8-6471-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584024881;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=hILTAVJXI/arAK/rsCpaJn7OgjNvQCe7IKwaX1oc3o0=;
 b=JodGZQjf7t42QfRq9iTBmHSoyysci8akT0gx8xIjViyA17ZDLUZmuv6d
 10TJXVtWgDf9TVWTfPYIVDirUdLnh2xnlWtspx15azmBTvD4pFkqjKcuw
 pmRpFwYGY4MJoLaIg2USgNbM3yZzGyw2HjgVRo6LgBgGPl9a1b451onGW 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TPIpgEXExV2b+xBY9x/6X7bVWywt9z1Jxtz9hY8vjAug2H0V7OwGaxbIIs210NcLZj7DrLwONw
 KQ6jTR9+jVJ51/Om7JgT38ZL+1YuWlqG6kP5kilVm2YQ/B7wJf7iBvjKp+Q4CDPx/cRJUlAAs7
 BmxRlzY5S71WmlEMcULCj5zDYypBZTODGlNmjR3q5ZctfZtS3dW7cSadj7AsY6vFzy83mQHZjN
 lOYJlgWyK+qy4WU6vP20lr1TSxJ5d3V2/sIZXWMBWihjgJhs/UUdTJwdKZ9jicvnroa4gKtoBu
 OBc=
X-SBRS: 2.7
X-MesageID: 13851009
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="13851009"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.19755.421673.848790@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 14:54:35 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200312144056.10902-1-roger.pau@citrix.com>
References: <20200311172010.7777-4-roger.pau@citrix.com>
 <20200312144056.10902-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v6 4/5] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHY2IDQvNV0gZXhhbWluZTog
ZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRkIGl0IGFzIGEgaG9zdGZsYWciKToKPiBJ
bnRyb2R1Y2UgYSBuZXcgdGVzdCB0byBjaGVjayBmb3IgaW9tbXUgYXZhaWxhYmlsaXR5IGFuZCBh
ZGQgaXQgYXMgYQo+IGhvc3RmbGFnIGlmIGZvdW5kLgoKVGhhbmtzLAoKUmV2aWV3ZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
