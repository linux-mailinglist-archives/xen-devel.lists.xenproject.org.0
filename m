Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5928F05B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 12:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7258.18925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0pa-00079X-51; Thu, 15 Oct 2020 10:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7258.18925; Thu, 15 Oct 2020 10:49:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0pa-000797-1b; Thu, 15 Oct 2020 10:49:58 +0000
Received: by outflank-mailman (input) for mailman id 7258;
 Thu, 15 Oct 2020 10:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT0pZ-00078q-0C
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:49:57 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77ecab16-f0e5-4532-8041-1a7527ca655a;
 Thu, 15 Oct 2020 10:49:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT0pZ-00078q-0C
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:49:57 +0000
X-Inumbo-ID: 77ecab16-f0e5-4532-8041-1a7527ca655a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 77ecab16-f0e5-4532-8041-1a7527ca655a;
	Thu, 15 Oct 2020 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602758995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d3VYg3skl8zCQfjo7vhViKGqruNJHXt8sy93k/dq4Sk=;
  b=g8xy9Vi8Z2J0w3/jT9hlT2s9Buj0nhPZCNUhkXH0EXCuBPFzLWyWRWzE
   cN5eGAoQPgpCYQhSuN1A+szhYUB6ok+FECazCMVNmqWpLNiJSqr/RcHgt
   llLf8G+XIW7H74TqXw2gbcTKthSpltNuJDpYQ7X8ScrePnULqpVLYgHHH
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ekl9EsGDazf9xR5KCY38Ne2WICljMzDBeB74mBsg8olfFKkH9GuNR+t15qKWecZuNQ7XgC1v1+
 KC5ULo/68nMV6zUK6BHQEUkiBHyeBgw6YpfBCfurNoLnxKGaNO9bMqQu4Zy3F5DwcWU8JkjWhg
 p1QdMtfzzI0qviVR98vUfYbzHiRylMX5HzEtKOOQMxLqWsE4ylqpdo9V1+JQjLL0r0g4fDPUvz
 NlYtmgIyLplOlOtZDBdEgSpzqqEvFBB3m/mzrtc5Vs/lzbsfmgVGeii0YqynM5LrtkElMcaNIs
 nP0=
X-SBRS: 2.5
X-MesageID: 29312011
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,378,1596513600"; 
   d="scan'208";a="29312011"
Date: Thu, 15 Oct 2020 12:49:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/2] xen/x86: implement NMI continuation as softirq
Message-ID: <20201015104939.GA67506@Air-de-Roger>
References: <20201007133011.18871-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20201007133011.18871-1-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 07, 2020 at 03:30:09PM +0200, Juergen Gross wrote:
> Move sending of a virq event for oprofile to the local vcpu from NMI
> to softirq context.
> 
> This has been tested with a small test patch using the continuation
> framework of patch 1 for all NMIs and doing a print to console in
> the continuation handler.
> 
> Version 1 of this small series was sent to the security list before.
> 
> Juergen Gross (2):
>   xen/x86: add nmi continuation framework
>   xen/oprofile: use set_nmi_continuation() for sending virq to guest

Apart from the comments in patch 1, I think this is a fine approach if
it allows us to restore to the previous state of the event lock.

I think we should be expecting a v3 with the nmi callback prototype?

Thanks, Roger.

