Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B31BA9A8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6D7-0001tw-D3; Mon, 27 Apr 2020 16:02:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzTj=6L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jT6D6-0001tp-5B
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:02:20 +0000
X-Inumbo-ID: 7865be62-88a0-11ea-ae69-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7865be62-88a0-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588003339;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Dai7Q/Zx0jChj1lAaZFDtJzKdmUoogQnUUXhDiXNpbs=;
 b=Bz5ynJh7xwamSaiam3ROzrZbnDf1oucrc/pykJrhmyQ/jLyE/2ycqSwQ
 fHAHATDFOy5TRGKhTFFAxlGHX+1NhlPPPJWthBamfAb0VxRpXyT42PIyy
 71UiLbVx9sZfw9+/d9ZULDZaKQCNN5GwdD1J0bmOXRMGZjFK+QMDbro3D E=;
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
IronPort-SDR: fjbrm+tdmofxt+CTMxCMPUq0+QuiqNE6yMJC5sMD5JwvOHBvJIGLiOX5UnI7WAI/+SVpLTt4wz
 okXkyHqBGBrYd3n9/G+fJUTuHy0+kjag4S3SzcW8PopFHur6ipuBBe/kBQJM3Ecj3k1Hd8uOyS
 F16DKM877GXr5y6rK9VCq6+Rcaq0lvKc8+pBkBqQ6zA629dTtObgu4R7APzaD+B7d9xuPIHZgZ
 rAOqIod57GRyW9BR8m2BeUZSOtAGPg9MMlqFY2ftzMBVxZMAlRhs+X4z7D3Snns4fZ9bTaBoaG
 4os=
X-SBRS: 2.7
X-MesageID: 16328364
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16328364"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24231.513.288498.17105@mariner.uk.xensource.com>
Date: Mon, 27 Apr 2020 17:02:09 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 10/17] tools/libxl: Plumb a restore boolean into
 libxl__domain_build_state
In-Reply-To: <20200414202321.17580-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-11-andrew.cooper3@citrix.com>
 <20200414202321.17580-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH v3 10/17] tools/libxl: Plumb a restore boolean into libxl__domain_build_state"):
> To fix CPUID handling, libxl__build_pre() is going to have to distinguish
> between a brand new VM vs one which is being migrated-in/resumed.
> 
> Transcribe dcs->restore_fd into dbs->restore in initiate_domain_create()
> only (specifically avoiding the stubdom state in libxl__spawn_stub_dm()).
> 
> While tweaking initiate_domain_create(), make a new dbs alias and simplify
> later code, and drop the local restore_fd alias as the new dbs->restore is
> more intuitive in context.
> 
> No functional change.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

