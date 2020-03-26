Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F09194393
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:52:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUks-0000uy-VQ; Thu, 26 Mar 2020 15:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHUkr-0000uD-MC
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:49:13 +0000
X-Inumbo-ID: 566e832e-6f79-11ea-8817-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 566e832e-6f79-11ea-8817-12813bfff9fa;
 Thu, 26 Mar 2020 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585237753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uipxpMs9G/58hSlqNelbJrzoQ1PV4/2hij9DUHJkn+0=;
 b=XZA0uOZV94nNBReC2ZXMwfK+SOuIMtwFFuKgcZBY35WGSWB5pbhjwela
 V5Bca4+ieD01m8NqPuxk5hnBU7JReAG2lqJpuHQ50L0/jRFlXXunQu0FY
 6T9OHup831E1EHrprsQFXwq9krYyqaNXPOnPSrbm2pMeqozaaUd01UYur o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DHqR2XPeEGKDdfezntFAj5z9C4NJ6ri27hW+jj7eaLDuM1Inc9Hu+Chog2CZRS5BXoucHoZhuH
 +pwTYtSojVo4BRXtcezeJ6RxGByOUFkqjC6lZQ5XQC1VpraDxQbP3bwWsbb95SsXh4+EQ/Zb5e
 hZbUQ2uY+njr5cm+XmFelpgU+8i1TJTlkRm/StpySWxubbaudJY5eFTn06A9CQ/IJWcpxqLnCn
 5TsgJGAuy4DOhfjCpPzEqFfG5uBSonnRewGp8xCHIvwBbLg2Wpq8vZcS9q9NVm9ttGViRAuG9e
 ql4=
X-SBRS: 2.7
X-MesageID: 14703730
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14703730"
Date: Thu, 26 Mar 2020 16:49:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200326154903.GL28601@Air-de-Roger>
References: <20200326152720.36970-1-roger.pau@citrix.com>
 <4c7cb463-bb92-a57c-9654-52536c874a8c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4c7cb463-bb92-a57c-9654-52536c874a8c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 0/4] x86/nvmx: fixes for interrupt
 injection
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 04:41:15PM +0100, Jan Beulich wrote:
> On 26.03.2020 16:27, Roger Pau Monne wrote:
> > Hello,
> > 
> > osstest identified a regression caused by my earlier attempt to fix
> > interrupt injection when using nested VMX. This series aims to fix the
> > regression, and should unblock several osstest branches.
> > 
> > The following report is from osstest with this series applied:
> > 
> > http://logs.test-lab.xenproject.org/osstest/logs/149051/
> > 
> > Note the last patch (4/4) is the one that actually fixes the issue. Xen
> > will always use the Ack on exit feature so patches 2/4 and 3/4 don't
> > change the functionality when running a nested Xen, as it always
> > requires SVI to be updated.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (4):
> >   Revert "x86/vvmx: fix virtual interrupt injection when Ack on exit
> >     control is used"
> >   x86/nvmx: only update SVI when using Ack on exit
> 
> You probably didn't notice that these two got committed earlier today?

Urg no, sorry. I rebased before lunch and then triggered the osstest
job. Thanks for committing those two!

Roger.

