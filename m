Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B439DE9A34
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 11:41:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPlNj-0006na-G8; Wed, 30 Oct 2019 10:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPlNh-0006nL-EM
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 10:39:13 +0000
X-Inumbo-ID: 82f3a8ee-fb01-11e9-8aca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82f3a8ee-fb01-11e9-8aca-bc764e2007e4;
 Wed, 30 Oct 2019 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572431952;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GmkrWCb1DqiaHXi6X5G38PzC3fbcCLqaU0gn1exWjYg=;
 b=TwVhvTkEdzvZc3FOlj4ishAd8ynL76WRTykCjRqKuMYNB2DLAnMOP2Fa
 XQQhx3Po4JVrq+B+i4trBFbwkq/JJe6AvnXF10XOivokvY9m2Lk5Y67dl
 HKdFVfYMuMRqFxp0fgv7xCasQ5jnDckcKOBCpL6easXp4OHl1eM8UN/8C g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ff0FTcYiEsSsIHz6i244zMSZCVo/AA6tMogxRIMVNmO4PCCDv3Z2XX2IxJEo+vnMhAAcgHjqDY
 5JuijlmS0EFrbEMbGomiFNZdBy8kX1dK3zRH98FXl9MBspqAElEePUYSLzcL8h3VNVr8IvgCSr
 8Ct8xthTfW0hUVPgyPncv4xhiMvpMI3oBvG/+tWriNPcsgQa09scRPK+tcXDhwKrCc3aQ6loEE
 AF3Pk1HIwEpM83CsPiFh50b9PJ2MYntR8F+scf2Bhh9V+MG6hXqDqD4aKmpV/RHAOxav87iiAN
 a+A=
X-SBRS: 2.7
X-MesageID: 8079724
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="8079724"
Date: Wed, 30 Oct 2019 10:39:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191030103909.GB2381@perard.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
 <20191029155436.14376-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029155436.14376-2-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 1/4] tools/libxl:
 gentypes.py: Prefer init_val to init_fn
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDM6NTQ6MzNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2hlbiBib3RoIGFyZSBwcm92aWRlZCwgaW5pdF92YWwgaXMgbGlrZWx5IHRvIGJlIG1v
cmUgZGlyZWN0Lgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIHdpdGggZXhpc3RpbmcgdHlwZXM6
IEMgb3V0cHV0IGlzIGlkZW50aWNhbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
