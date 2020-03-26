Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9F19411F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:19:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTJX-00081e-JV; Thu, 26 Mar 2020 14:16:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKeT=5L=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jHTJW-00081X-0n
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:16:54 +0000
X-Inumbo-ID: 6fea5af7-6f6c-11ea-87f1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fea5af7-6f6c-11ea-87f1-12813bfff9fa;
 Thu, 26 Mar 2020 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585232212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TesHsCUYgcxK4YVl/u4XwvPWjveS41a+p8Zw4ZxNTtQ=;
 b=RFFTLhGsIbSwPrUn4CCzIfDLpOQs0cGaYeKObRD+SygCAz9fO0+jrcAL
 ssTTh1KG4Om91DBnrSGp6Nbk+YL1GCUnFieMSUq1Fk6YAPFJ3H6rS1NDO
 c20vtWU4XBWdoM2+Z67Wpl44qPRWt5uhJVPR7IUk6nKM13SBYcianjjgW U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zjdPUFy9XLZff5bAzHsLgumJZAktGGAb5Ku8yOObXz1d7ezAlgyrTEcpGNT+WArnCFhfhrgjra
 x4a8xBTStchxfeTErL6aOA5jN30lu+/48WQuj3mL2a+IK0v47lhyo5a/Vubt7NXQQVyXpDARh6
 pKLvCWCpZ6mk7r+lkSA/GMRUwz/rX6Z+i+9OVKxNKkMNZ4sArz/D2/JOGlOrDYWx0LQlV5X65g
 4aBxI4PvKW0t8tpmczK/7uKUAkWv+yraRabsMuT0McDIeZjWhoOdFYZv2CfYV8Tqag5gIKC0xI
 Bg8=
X-SBRS: 2.7
X-MesageID: 15095812
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15095812"
Date: Thu, 26 Mar 2020 14:16:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200326141647.GQ4088@perard.uk.xensource.com>
References: <20200326135621.687685-1-anthony.perard@citrix.com>
 <d925ee1c-10ff-6099-bde3-c571075cf579@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d925ee1c-10ff-6099-bde3-c571075cf579@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH] build: detect compiler upgrade to rerun
 kconfig
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
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 02:02:43PM +0000, Andrew Cooper wrote:
> On 26/03/2020 13:56, Anthony PERARD wrote:
> > This simple comment allows to detect when $(CC) changes version.
> > Kconfig will be rerun in this case. (Rerun is forced by
> > include/config.auto.cmd which detects changes of CC_VERSION_TEXT

:-(, there's a typo here, the path should read
"include/config/auto.conf.cmd".

> > value).
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> I'd suggest s/upgrade/change/ in the subject.  When developing with two
> different compilers, one half of the transitions will be a downgrade.

Change of $(CC) is already been taken care of ;-). "upgrade" is what
Linux choose to call it but "change" might be ok too.

> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks,

-- 
Anthony PERARD

