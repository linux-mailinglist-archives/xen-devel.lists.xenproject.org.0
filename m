Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BEE5989A3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 19:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389702.626801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiZo-00038r-Ol; Thu, 18 Aug 2022 16:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389702.626801; Thu, 18 Aug 2022 16:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiZo-00035S-Lo; Thu, 18 Aug 2022 16:41:00 +0000
Received: by outflank-mailman (input) for mailman id 389702;
 Thu, 18 Aug 2022 16:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6Qq=YW=citrix.com=prvs=222213ea0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOiZm-000356-Ot
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 16:40:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87850f2a-1f14-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 18:40:57 +0200 (CEST)
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
X-Inumbo-ID: 87850f2a-1f14-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660840857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sYa9e9ZSpCnwjz/Oj/kQj9VA9mcVxe2CpPm4qtarYCM=;
  b=NiKUR0B1IMkjMaO+Y3p7jSrWk9bKUoHXbQGVRezuyU7KKt1btDrXWiWL
   XoZZoqoyB6QS36icrdS4X7F79Ue1YZmP1XoRt4ZfrM1WDfEpfooUiapDj
   LfmuwxEoy69CPk5av/hfEzvzNPBGbZT+Pg1F3iRuFT2wXvpWz8Rt2Qonk
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78146787
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mgt+ZKMH7H4Jeq/vrR3Rl8FynXyQoLVcMsEvi/4bfWQNrUon3jABn
 GIfCGuBP/eLM2DyKoggOY3k80wDu5WGyNc2Hgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/vT8EgHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPMmex3U1kQJbQjxf1OB31/6
 tISA280O0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyzeDlVAvj+iyWDbTUoK0G+4FuFffn
 0ecx26kJjElPeGO2xPQpxpAgceQxHimCer+DoaQ6fpCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHkOeMUC2F0K+tlgypAC4JHHAsbwRbdF5QizX8m73fni4jX/46TvDt0IavRWCtq
 9yZhHNg3utO1Kbnw43+pAma2Gz0+/AlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBho81XRdlFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 heM51oLvMAMYCvCgUpLj2SZUZxCIU/IRLzYug38NIISMvCdiifdlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4nNEiT9xLvHr91+eJ6mUgDKZb7H8+TI+KPjeXDPxZ4iN4tbDOzUwzOxPnV/l2Kq
 I0HbpHiJtc2eLSWXxQ7OLU7dTgiRUXXz7iqwyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:BcI/9KzPZvenPcFaE1pYKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="78146787"
Date: Thu, 18 Aug 2022 17:40:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/3] console/client: properly use time_t in get_pty_fd()
Message-ID: <Yv5rkTq0pX+g5GGW@perard.uk.xensource.com>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
 <990f432f-1f40-04e4-dfb9-97c8db679f36@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <990f432f-1f40-04e4-dfb9-97c8db679f36@suse.com>

On Thu, Aug 18, 2022 at 04:06:20PM +0200, Jan Beulich wrote:
> "int" is not a suitable type to hold time()'s return value.
> 
> Coverity ID: 1509376
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

