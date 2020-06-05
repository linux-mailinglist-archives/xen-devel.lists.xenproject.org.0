Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF41EF2AD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 10:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh7J6-0002ou-5P; Fri, 05 Jun 2020 08:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jh7J4-0002op-Kn
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:02:26 +0000
X-Inumbo-ID: e496088c-a702-11ea-81bc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e496088c-a702-11ea-81bc-bc764e2007e4;
 Fri, 05 Jun 2020 08:02:26 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1Fir6SCJy07Mb9hBDhX5diiysi44fAOlzD9d6Jd24qPm0w5k3fmGO5I7YWrivQcuzvHf52DaR7
 qnL1/clsR17O7B3TH9c/gAcIQEWuhmnelNJ66y31WP5RqLhBCU+tK30QYPT6w1ZsropqvaOcqp
 O4+fVDNjaomlcOMt2iatu75FADCDbUP+PC5NH1QzMWOqQBQEL5r6u3AbUTM/d5frHG5ZbTha+l
 pcbvDDH/NLKO8L7hw3VY2OpXFYP9x3N28Db1vog8gsLn7MFFXcRnZsbNKjTwDEug9R1d3Of6Ky
 8Xk=
X-SBRS: 2.7
X-MesageID: 19653011
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,475,1583211600"; d="scan'208";a="19653011"
Date: Fri, 5 Jun 2020 10:02:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
Message-ID: <20200605080216.GI1195@Air-de-Roger>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 09:51:09AM +0200, Jan Beulich wrote:
> Both match prior generation processors as far as LBR and C-state MSRs
> go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
> (recent spec updates).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Such changes having been subject to backporting in the past, this
> change may want considering for 4.14.
> ---
> I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
> apparently addressed by ucode update, so we may not need to deal with
> it in software.
> 
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c

What about mwait-idle? I guess we pick that from Linux and no patch
has been added so far?

Thanks, Roger.

