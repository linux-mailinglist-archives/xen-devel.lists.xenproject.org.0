Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7401B295BA0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10295.27338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWmp-000276-Ac; Thu, 22 Oct 2020 09:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10295.27338; Thu, 22 Oct 2020 09:21:31 +0000
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
	id 1kVWmp-00026h-70; Thu, 22 Oct 2020 09:21:31 +0000
Received: by outflank-mailman (input) for mailman id 10295;
 Thu, 22 Oct 2020 09:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVWmn-00026b-PR
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:21:29 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0478d580-44dc-40c7-8dce-2c237b880a2a;
 Thu, 22 Oct 2020 09:21:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVWmn-00026b-PR
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:21:29 +0000
X-Inumbo-ID: 0478d580-44dc-40c7-8dce-2c237b880a2a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0478d580-44dc-40c7-8dce-2c237b880a2a;
	Thu, 22 Oct 2020 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603358488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=C9aqx/jjtwxMn9vAhpNQPx4C33vcoB8dih4gv2oWmT0=;
  b=WQnYZYleHNmYc7bL/gPOuftZkn8yTxyu8JGr094ibMOI77KE4A5xo0BY
   vvflK0ukEYGS1yrkx4J5tjyg+l4I6oCjZNjHzHC2qAy0TCGv36yF965L4
   9YogE3IAPeCQduybIXt+hDS3LEVPQPeFHFqQkuumEtZ0lDxUwjxcDL60q
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kc51BmvvoDlcX8H+s15aRLIDcnoWU9hX00MmrF9NuEuAwhoa98UlGweTntLtzSJNZBYC4TObxV
 bVZ/6LuRPfS8Sg2/LnH5HchSSBoKrWB5ZZcU2Wwyfe6f90rjlOP0RVkkXCHxAdILG5MHvWtZlA
 G2DctSc7095U7pou1ObfgXyK6BoZEt7oCJ0KWpR+MkWk5QvTz4LqQ3EjwipK5M8sR8zSbygRh2
 kxF9OK3k/Z7o4SLbBOz0b2O/QhZjYot9FLmKXDJZmOorV1GLHL2LN01Hkg8U639gSRqveDYfuo
 6Rs=
X-SBRS: 2.5
X-MesageID: 29794353
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29794353"
Date: Thu, 22 Oct 2020 11:21:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
Message-ID: <20201022092119.kgm3nrwuwjhphcc7@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 04:08:13PM +0200, Jan Beulich wrote:
> There's no global lock around the updating of this global piece of data.
> Make use of cmpxchgptr() to avoid two entities racing with their
> updates.
> 
> While touching the functionality, mark xen_consumers[] read-mostly (or
> else the if() condition could use the result of cmpxchgptr(), writing to
> the slot unconditionally).
> 
> The use of cmpxchgptr() here points out (by way of clang warning about
> it) that its original use of const was slightly wrong. Adjust the
> placement, or else undefined behavior of const qualifying a function
> type will result.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

