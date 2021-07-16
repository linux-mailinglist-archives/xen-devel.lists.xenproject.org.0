Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F83CBA2F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 17:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157625.290300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QCO-0001FR-Lc; Fri, 16 Jul 2021 15:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157625.290300; Fri, 16 Jul 2021 15:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QCO-0001DE-IQ; Fri, 16 Jul 2021 15:56:24 +0000
Received: by outflank-mailman (input) for mailman id 157625;
 Fri, 16 Jul 2021 15:56:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4QCN-0001D8-SJ
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 15:56:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5de37c66-e64e-11eb-8993-12813bfff9fa;
 Fri, 16 Jul 2021 15:56:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5de37c66-e64e-11eb-8993-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626450982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OVT3TKsp7587VJh7JP9hbNWyUdtqtuz8NeV2ZLQl4B8=;
  b=EtYMLDlZcd7IGRjvYlvaWvF6hoAUqFVSwvRYZPkElPDorkZ4KoGTdhf0
   yiWu7beSwwNKoyoh3WBTOWutsMBGS2wnGMN/vog6DKDs8V/ma0Fb3Xap4
   j/ZnRk8/8vxQmEc0CGRYg5s/GSzxGdF89qeb7Ce2c/88xTIPw43FRIfr/
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 64+1SX+S6gVK3jLfp5qQLGDPIbWvh7DFFMXXlEQkLeszC0zHQapgIP3u24nYC5Wyoi7IJGc4VK
 zdAATMxfaN13t/5p6u5lyU7RMLYbmhLfOU/cCk6x3HBBx3wFaD/tzvBXebeM3uxlh/chjJY9EP
 3E1WCCcfuUe1OzJbAumPQPAeIxeq8yEsgJFrNuFDTyEh8eDGRLDfY5WZ/xFgV3w7BrUvP9J+MP
 //5h43nZjFLLm9J2Qc7SCclROQtBantsisXWshRabIozYuqM4jLCzubom/rCqKFI2ZWt/auHqk
 1HA=
X-SBRS: 5.1
X-MesageID: 48453275
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0TxUDqDfco6TIC3lHemU55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG+85rsyMc6QxhPE3I9urtBEDtexzhHNtOkPAs1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaXN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="48453275"
Date: Fri, 16 Jul 2021 16:56:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <YPGsIuO20fmz+h+Q@perard>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>

On Fri, Jul 16, 2021 at 04:26:39PM +0100, George Dunlap wrote:
> 
> 
> > On Jul 14, 2021, at 5:17 PM, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > 
> > This will help prevent the CI loop from having build failures when
> > `checkpolicy` isn't available, when doing "randconfig" jobs.
> 
> Hang on, just to clarify what’s going on here.
> 
> ‘randconfig’ is setting CONFIG_XSM_FLASK_POLICY in the .config file; and then when the build happens, we error out because one of the required components isn’t there.
> 
> What this patch does is to make it so that if someone explicitly sets CONFIG_XSM_FLASK_POLICY=y, but doesn’t have checkpolicy, the build system will silently disable the policy behind their backs without telling them?
> 
> Or does the randconfig test run kConfig one more time, at which point *then* the .config will be disabled?
> 
> The former I think is broken; the latter I think is fine.

That's right, Xen's build system is broken.

Kconfig doesn't say whether a given .config is correct or not, it
removes non existing CONFIG_* setting as well as those that are missing
dependencies. This isn't new, this is the default, this is how Linux is
using Kconfig.

But there's a way out of that.
There's an option to prevent Kconfig from updating .config, setting
KCONFIG_NOSILENTUPDATE in the environment (see docs/misc/kconfig.rst).
But that won't work as expected with the Xen build system because to
update the config via "syncconfig" doesn't prevent the build system from
building Xen (and probably fail later).
If it were working, build would fail, and user would have to run
"oldconfig" or other *config targets, and check the result (diff
.config.old .config).

Cheers,

-- 
Anthony PERARD

