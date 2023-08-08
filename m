Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7D773A87
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579917.908118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMvk-00021S-GA; Tue, 08 Aug 2023 13:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579917.908118; Tue, 08 Aug 2023 13:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMvk-0001yz-DO; Tue, 08 Aug 2023 13:39:24 +0000
Received: by outflank-mailman (input) for mailman id 579917;
 Tue, 08 Aug 2023 13:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTMvi-0001nd-NT
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:39:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f99ed504-35f0-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:39:21 +0200 (CEST)
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
X-Inumbo-ID: f99ed504-35f0-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691501961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JMjH+v1dEhayh9NSbcXKavTJC0JEFjd/xZ2S7oZ0Qo=;
  b=c4C8ycuFJf7RlCfwiJpfTA1mysrN7+wSXHdelUffabzPWQM6N50/Pd4k
   S3bDwAN1YwIeZwhdwjfhxWKF+fE+kaaxsWbBl+UYY3c1vvo31Y8EDdfYZ
   b4RjtRyKP99fRtfQqme/ZKtED5S2LC+WZLL4H7CXBV6hXvICyNKVR+BMs
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118870632
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:V5V9Gqo5QsA6bNdPmkAFd/MU/OpeBmI+ZRIvgKrLsJaIsI4StFCzt
 garIBnTPa2OYmKgct5+O4vk8hsEupDSx9NhTFNvqSAyF35G9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzylNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACoGUAGyo8Sm/Le+QMdSqpUTL/moZ7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufrzSmWk9BbrRzzxK54Civ27DDlx/4UbIrMvqf1tJBuXKMkzl75Bo+CgLg/KjRZlSFc9BQM
 UsP4QI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vgHTF1uaeZYW6c/LyT6zi1PEAowXQqPHFeC1Ffup+6/d9110iUJjp+LEKrpsf+JyDB5
 xaakC07jZstoZ871JX4pmmS1lpAuaP1ZgIy4wzWWEes4QV4eJOpauSU1LTL0RpTBN3HFwfc5
 RDoj+DbtblTVs/VyERhVc1XRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9BrcJZBNGjoctOepd7vjGKoC+fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yXC9GUv89nWbmHrd1PVoXKscWnzq7eHwG507/jer2iIC9Ft/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 i3hCxYHlQeu3xUq62yiMxheVV8mZr4nxVpTAMDmFQ3AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:nnY7KKutZkHtMDEM7668U4dD7skDTNV00zEX/kB9WHVpm5qj5q
 eTdZMgpHzJYVcqOE3I9urqBEDtexnhHP1OgLX5X43MYOC8ghrNEGgK1+KL/9SHIUDDH4Vmu5
 uIHZITNDVeZ2IK6/oTTGODYrQdKHjsytHMudvj
X-Talos-CUID: 9a23:al8m1mCXpTrEkuD6EzNsyl8lPuY1TnjYxlnuDx6IClYqE4TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AibQmAw9ze2AHv8CTgkeOY3+Qf/t6uafzV0wHrZY?=
 =?us-ascii?q?Pi/CicgtQFxykoyviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,156,1684814400"; 
   d="scan'208";a="118870632"
Date: Tue, 8 Aug 2023 14:39:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] tools: add configure option for disabling pygrub
Message-ID: <ff25b6fa-60c7-4dc8-9a7d-5aface0c1c4c@perard>
References: <20230808132219.6422-1-jgross@suse.com>
 <20230808132219.6422-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808132219.6422-2-jgross@suse.com>

On Tue, Aug 08, 2023 at 03:22:17PM +0200, Juergen Gross wrote:
> Add a "--disable-pygrub" option for being able to disable the build
> and installation of pygrub.
> 
> There are two main reasons to do so:
> 
> - A main reason to use pygrub is to allow a PV guest to choose its
>   bitness (32- or 64-bit). Pygrub allows that by looking into the boot
>   image and to start the guest in the correct mode depending on the
>   kernel selected. With 32-bit PV guests being deprecated and the
>   possibility to even build a hypervisor without 32-bit PV support,
>   this use case is gone for at least some configurations.
> 
> - Pygrub is running in dom0 with root privileges. As it is operating
>   on guest controlled data (the boot image) and taking decisions based
>   on this data, there is a higher security risk. Not being possible
>   to use pygrub is thus a step towards a reduction of attack surface.
> 
> Default is still to build and install pygrub.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

