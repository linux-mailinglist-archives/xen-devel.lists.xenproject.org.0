Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197B17BBC0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:32:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABAW-0006rY-38; Fri, 06 Mar 2020 11:29:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F9yt=4X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jABAU-0006rT-Pv
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:29:26 +0000
X-Inumbo-ID: bbb05e1a-5f9d-11ea-a7ae-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbb05e1a-5f9d-11ea-a7ae-12813bfff9fa;
 Fri, 06 Mar 2020 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583494166;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=aSTuzG5HuFFcumfFcSdMIqisTUtpUfxZ0OEyHAriCkI=;
 b=hUGVcPUDAPHqdtCydEPai6tjdIy4GE+ZK9AIs4XnX/v3jmJz/ppQopPJ
 2IVdPUDZiUv9zeFB03/rB8kjNEFv63d5ZYv62NdRLyPLxz1M4cQD+fla9
 jBCJGRnpIP9WroYGDqQ3KK2rwTlyxoWlhBTLXTj4rGhM22s/VLsrxmh6W U=;
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
IronPort-SDR: A3Q0PxYPt5ih/kKbrQqNl5GeEx9T9utFYtEmv1PBTSMb25RE8jWZ7fO4XFBs11crCA9YQ0Ewmy
 8Wz63M32D9buACG9Uu3PhMYr2QEP6nOLMpvsgPKRwPHcbYjKFFa6EvfW7eqjP4CEujMTKLL5aI
 MJhIA/C6ajo4kcL3kZTWfxf1BlK6jaYXTktYa8CBRnOcPg/Fa5WUmoe6c9NFIqaQ1/AQC7+lnU
 1gl/WyIxcvhi0ol2Tv+X/+du/MZnykVeEDrmvRdUJPtSkibmPt1zq6BPqpqgMgq7w0Av8MBW/+
 5aI=
X-SBRS: 2.7
X-MesageID: 13530094
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,521,1574139600"; d="scan'208";a="13530094"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24162.13327.417800.625444@mariner.uk.xensource.com>
Date: Fri, 6 Mar 2020 11:29:19 +0000
To: "paul@xen.org" <paul@xen.org>
In-Reply-To: <20200306112417.6458-1-paul@xen.org>
References: <20200306112417.6458-1-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Update my entries (again again)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amzn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGF1bEB4ZW4ub3JnIHdyaXRlcyAoIltQQVRDSF0gTUFJTlRBSU5FUlM6IFVwZGF0ZSBteSBlbnRy
aWVzIChhZ2FpbiBhZ2FpbikiKToKPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtem4u
Y29tPgo+IAo+IFVuZm9ydHVuYXRlbHkgSSBuZWVkIHRvIHN0b3AgdXNpbmcgYWxsIG15IEFtYXpv
biBlbWFpbCBhZGRyZXNzZXMgZm9yIGFsbAo+IG9wZW4gc291cmNlIHdvcmsuCgpBY2tlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBbmQgYXBwbGllZC4KCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
