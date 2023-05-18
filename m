Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2DF708580
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 18:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536448.834780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzg4V-0006LF-Tn; Thu, 18 May 2023 16:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536448.834780; Thu, 18 May 2023 16:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzg4V-0006It-R7; Thu, 18 May 2023 16:01:43 +0000
Received: by outflank-mailman (input) for mailman id 536448;
 Thu, 18 May 2023 16:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvkS=BH=citrix.com=prvs=495754ba3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pzg4U-0006In-Ic
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 16:01:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455115db-f595-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 18:01:39 +0200 (CEST)
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
X-Inumbo-ID: 455115db-f595-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684425699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuHFcbnouck4+Y5DtNKw2g6vnG+PHUITkuDdurVMx30=;
  b=VJRvURBM6U4Bmr/P1j5KhxXZY/X+frjJFYNUdiuj7TSZpsbMJr3MJpwD
   wOLLxzqj22JqzX1pWyVTVmqSQxhPXJSqJxnGmF1E1Ci6CW8KeTfHDzHtR
   6KVnnJb+ryZzAKsqt6dLWogjA2C7qSWkOvnnP/iV0H77BhszPWCW7s6C4
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108303028
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dn43nKoA6Ss0E1egx29LsGrAXDVeBmL5ZRIvgKrLsJaIsI4StFCzt
 garIBmObPreZ2vyLt10OYq08UICscTWnNVkSFdkqilhEiwV8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAhQVhGAoOuR+aqidupn3vUDdfXoJLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 juerz+hWUlAZLRzzxLazXCCp7fVxhinc4kOGL+eqfhQo2OMkzl75Bo+CgLg/KjRZlSFc8xeK
 FYd/2whpLIy60WvZtD4U1uzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkA9KG4JZSYACwwf8dTniIg2glTESdMLOLGxps34H3f32
 T/ihCoxnbIIluYQyr62u1vAhlqEr4DEVAcv6i3LX2iu6UVyY4vNWmCzwQGFt7Aadt/fFwTf+
 iFewKBy8dziE7m1yRSMQ8IEO4ix/sqGO2XtoQdTHIEYomHFF2GYQahc5zR3JUFMO8kCeCP0b
 EK7hT699KO/L1PxM/YpPtvZ59ACiPG5SI+7Dqy8gs9mOMAZSeORwM15iad8NUjJmVNkr6wwM
 IzznS2EXSdDUvQPINZbqo4gPV4XKsIWnzu7qXPTlU7PPV+iiJm9F9843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyhnXsym9pUPKrfbSuaDJI3GI665/F/cU9Y9w/Q9ehngp
 RlRpXO0OHKg3CaaeG1mm1hoaa/1XIYXkE/XyRcEZA7ys1B6ONbH0UvqX8dvFVXR3LA5nKEco
 jhsU5noP8mjvRybom1HNcGg8dwzHPlp7CrXVxeYjPEEV8YIb2T0FhXMJ2MDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:low69qlbYIu12nZmmxgBE8NO7k/pDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJ8SRzJ8+6Y
 5QN4R4Fd3sHRxboK/BkWyF+g8bsbq6zJw=
X-Talos-CUID: 9a23:rTmZwWFcc59NQDziqmJfqXYVGecsVUTF1UvTKBeJKT9VS6WsHAo=
X-Talos-MUID: 9a23:NSNSrQTdjTQfJCnGRXSzuzNMFZ9yuJ/yI0sRnZcg5M++FhJvbmI=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="108303028"
Date: Thu, 18 May 2023 17:01:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<michal.orzel@amd.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][PATCH v6 17/19] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <8a78ce55-a677-4006-b04b-8fc600b3f75e@perard>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-18-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502233650.20121-18-vikram.garhwal@amd.com>

On Tue, May 02, 2023 at 04:36:48PM -0700, Vikram Garhwal wrote:
> xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
> operation type i.e. add or remove to xen.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

