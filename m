Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D59EA0B3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 17:05:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPqRC-0001aE-EZ; Wed, 30 Oct 2019 16:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BWtK=YX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPqRA-0001a9-9T
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 16:03:08 +0000
X-Inumbo-ID: c2c3e74a-fb2e-11e9-beca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2c3e74a-fb2e-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572451387;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=AdnEzvQuP+lQF6z4mWEXRUaxyajpd5uW9H57pcPJmSk=;
 b=CVYgHgRNkByZ/bFx4Y8evEmhlL3RWcFct0mb9x24behAPWL8bUI7s4e5
 Ol11aNeH4mX+msmrUxEAbus7CcXvuAJ6JiDvvE+E+ITanjeSGAcsb7FV5
 dprB97YYWziYAR00utY6YUdwel0k89bG7sNRqJ/1P+eCOQieXIolbqlzW g=;
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
IronPort-SDR: 39c3A7+ZBhC+AKAGR/gdIyRGhhxaSYZR1ME9JsMlRfk33gC613l5ATh4trGd5TljAPUqn41Bjv
 Q6pewPwkmeqSCtXhFG48q2eaoLW3AhsWtfrXQJ9EHiAv13o/Jpsn5ZjhT+6kbDrUBG3hyMw7LQ
 vYH7bvkLySPPbqBCDvYbnmvgEKW53lR9/m4zKfesk4oNRdoBZR4Pwvmi7TH56ya8IShjuFpPHi
 GywH9oYagBArJYidkYavNKVLmfmpD/dXqueAoqhD7uPOPfZfht8MqkjKgzg1gMuHqlmO9iLwmS
 k8k=
X-SBRS: 2.7
X-MesageID: 7629754
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="7629754"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23993.46135.683190.792030@mariner.uk.xensource.com>
Date: Wed, 30 Oct 2019 16:03:03 +0000
To: <xen-devel@lists.xenproject.org>, =?iso-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
In-Reply-To: <osstest-143311-mainreport@xen.org>
References: <osstest-143311-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [osstest test] 143311: regressions - FAIL
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

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDE0MzMxMTogcmVn
cmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDE0MzMxMSBvc3N0ZXN0IHJlYWwgW3JlYWxdCj4g
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MzMxMS8K
PiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoK
PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1wdnNoaW0gICAxMiBndWVzdC1zdGFydCAgICAgICAgICAg
ICAgZmFpbCBSRUdSLiB2cy4gMTQzMjY3CgpUaGlzIGlzIHRoZSBvbmx5IHByb2JsZW0gaGVyZSwg
YW5kIGlzIHRoZSBrbm93biBpc3N1ZSBpbiB1bnN0YWJsZSwgc28KSSBhbSBnb2luZyB0byBmb3Jj
ZSBwdXNoIHRoaXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
