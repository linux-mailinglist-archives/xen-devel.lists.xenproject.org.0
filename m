Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687702221A3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 13:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw2Gh-0004s1-Pn; Thu, 16 Jul 2020 11:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw2Gg-0004rw-E9
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 11:41:38 +0000
X-Inumbo-ID: 4e9453ee-c759-11ea-94a5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e9453ee-c759-11ea-94a5-12813bfff9fa;
 Thu, 16 Jul 2020 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594899697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GSo6+S84yGEpCHdoBUFu/eMIj/LXkStHwfl7+iH6gHY=;
 b=Sutngue4IPHv792Wv6IJb3tfopSatQ9fxv2o7NbJq5VjOC2iFVjAunp7
 QyRKnNf3Q04A7Wb4Cc8k5ea1gyRvAxlESAQx0HAfqm79HDTMAqbSUjIci
 VHPWI0hyNQmQi4+FsUyQJu4MQutF3kJ/Y2pshWEq0hmhs9YXQOD0af5gW k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3H88suKxwGm3a3+3NSWMAjkXsT76LRHv8f00wQwjNoQo9p19eU9K7XOKR4D07zkZjnwcxJengj
 Kyin4DMI18exrzbdZFMEdDiRnjx5Rvr29rK6p4TGVl43+RiROPqCTbCzHudTJc15+d1WN3PSpu
 GZHmTvO4wB5BK+LZYjBBqin62vDCpJn/wdPEZZ3WuGBK6VBYc/AWL1HkO581/BKscCcfaVqGkL
 BsMCRQrGZGMxFIG0VTv9cf7DMUAMzbsWgaEqqWzjXgbXTL6V+iOdGd0Z6onulpwc8d68ZdnxWk
 Dm8=
X-SBRS: 2.7
X-MesageID: 22712951
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22712951"
Date: Thu, 16 Jul 2020 13:41:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
Message-ID: <20200716114128.GO7191@Air-de-Roger>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
> Use ENXIO instead of EINVAL to cover the two cases of the address not
> satisfying the requirements. This will make an issue here better stand
> out at the call site.

Not sure whether I would use EFAULT instead of ENXIO, as the
description of it is 'bad address' which seems more inline with the
error that we are trying to report.

> Also add a missing compat-mode related size check: If the sizes
> differed, other code in the function would need changing. Accompany this
> by a change to the initial sizeof() expression, tying it to the type of
> the variable we're actually after (matching e.g. the alignof() added by
> XSA-327).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

