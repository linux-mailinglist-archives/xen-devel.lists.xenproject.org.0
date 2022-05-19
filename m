Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7052D3BF
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 15:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332958.556727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrg1c-000206-0K; Thu, 19 May 2022 13:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332958.556727; Thu, 19 May 2022 13:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrg1b-0001wq-SW; Thu, 19 May 2022 13:17:07 +0000
Received: by outflank-mailman (input) for mailman id 332958;
 Thu, 19 May 2022 13:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qgK=V3=citrix.com=prvs=13100c9ce=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrg1a-0001wk-F5
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 13:17:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8996407-d775-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 15:17:04 +0200 (CEST)
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
X-Inumbo-ID: f8996407-d775-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652966224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kwJWUVJP9XHoEw/vpbMs72YU20U0++WYBU1e/pXt2jc=;
  b=IMILEqTsHS8nJ6nUULpsg0fgKEXc8oBHQ4YlARNUePTVK8pH9tTv2zvS
   RGAZZGTbOXgmWWaw1QoKfHsgG5NOFEANa+9jc+WoGfp53YlCxh7hkaNid
   eGha0hbRKI6I6qx3+KC17p5kanFIkHg5jEKbH9ePssPd7QT+gAQMH8Lwo
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74203548
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1NTqHKtK6zbhzjNODpZ2V7XSZefnVCJeMUV32f8akzHdYApBsoF/q
 tZmKTzUOKqJYDGkL9Bxb4q0pksOupfWm95mQABlqS4yQiND+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8NEvfhu745CyMfGh49IO5MppHVJCag5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWUzNkybPkEfUrsRIMskh/v5hUjhSWJ3jAK5oLQ70zjxyhMkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5ruO+kVWWQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwCWhkIf3uSLBPC8NcX1cK9Z4mt0zGyN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmqm
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtJ6sz67DFzFtW
 UTofODHtYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmwkdB4zbptdJ2SxC
 KM2he+2zMYDVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5LalEoECLemOUE6M+c7dDg3EJTyPriuw+Q/SwJJClMO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:mM83DqByNlqkEtHlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="74203548"
Date: Thu, 19 May 2022 14:16:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/light: update xenstore entry when setting
 max domain memory
Message-ID: <YoZDQpmdd4ESDsQB@perard.uk.xensource.com>
References: <20220502084729.13044-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220502084729.13044-1-jgross@suse.com>

On Mon, May 02, 2022 at 10:47:29AM +0200, Juergen Gross wrote:
> libxl_domain_setmaxmem() called during "xl mem-max" should update the
> domain's memory/static-max Xenstore node, as otherwise "xl mem-set"
> won't be able to set the memory size to the new maximum.
> 
> Adjust the related comments and documentation accordingly.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

