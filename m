Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE0372D4D
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 17:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122547.231129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxKr-0001Yy-1O; Tue, 04 May 2021 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122547.231129; Tue, 04 May 2021 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxKq-0001YZ-UT; Tue, 04 May 2021 15:51:44 +0000
Received: by outflank-mailman (input) for mailman id 122547;
 Tue, 04 May 2021 15:51:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldxKp-0001YM-9b
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 15:51:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bde7c29-1ae5-4789-b829-ad5f4d00b060;
 Tue, 04 May 2021 15:51:42 +0000 (UTC)
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
X-Inumbo-ID: 7bde7c29-1ae5-4789-b829-ad5f4d00b060
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620143502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z8IVQVmIERO9GuJm71umaVXvQ0TkO9n2zadsCgYDiXE=;
  b=BCLSMd16gv0le0nTJyNCnYsMCmB/WE5zTRDu3eSHpT3kUw6ZDGNAeFTQ
   9+vaNGZVW5PN8BA6RZza+84Cdms61Bx5sLmzzfFusVQ8DJVesYAGK8n0z
   1Puelli5lO4wnhSX2KVPvAU4gmpuTkx90pMJoJuRVJq4wrluPaMczLjjx
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: p+MxbggoVgEGUUprX6r7y514u77WP9E30CBgo1VtBj4ZbdaR/vM//zxoDLCg4Q9TE1jG8JRyrK
 voBq/36UmP+qWXaoQ7p3bV0fCAmuLHcaVB9+N/7OZ1HoZ6A9kFdxdXejeHEE3ZX56OHO2rZYUu
 NlFIBXQrGBXrCsbhwv/XO6/59hwG76mvTTBFF371KezQIcFesNiaH0XGSnjKtAXTXr+mVjztwy
 tMPiNvEdLlewGtwDWDY4+e7ObejUYSliX7sW3BJVwN9zVIISbb1UdjmSHbsQnpQ9zHTNpfj/BW
 6lQ=
X-SBRS: 5.1
X-MesageID: 43426162
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WG4qNaEfozHxT/fmpLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43426162"
Date: Tue, 4 May 2021 16:51:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [XEN PATCH] xl: constify cmd_table entries
Message-ID: <YJFtijH6TktVYDmp@perard>
References: <20210427161105.91731-1-anthony.perard@citrix.com>
 <5cbe94d4-2d07-b517-af9f-c5f1e47f7588@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5cbe94d4-2d07-b517-af9f-c5f1e47f7588@xen.org>

On Wed, Apr 28, 2021 at 01:54:39PM +0100, Julien Grall wrote:
> > -int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);
> > +const int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);
> 
> NIT: This can be replaced with ARRAY_SIZE().

I've thought of using it but the macro isn't available to "xl". But it's
probably a good time to add the macro and start using it.


> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks,

-- 
Anthony PERARD

