Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07854B7009
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273389.468555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0SJ-0003ET-9a; Tue, 15 Feb 2022 16:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273389.468555; Tue, 15 Feb 2022 16:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0SJ-0003BH-67; Tue, 15 Feb 2022 16:13:31 +0000
Received: by outflank-mailman (input) for mailman id 273389;
 Tue, 15 Feb 2022 16:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLD3=S6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nK0SH-0003BB-Qj
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:13:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34b5809c-8e7a-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 17:13:28 +0100 (CET)
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
X-Inumbo-ID: 34b5809c-8e7a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644941607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ovKE4XIz8gE4XZcO9a9G34fbK7KOG2SOPsUDCGOpP5o=;
  b=H5U1c+dC30Fap2g5gDgVDSidqG20fIbJ+5Zlu+BMZIFpE9GYbBZcKB/C
   3pvwXFQyt7/RNWSDl9Q8925ud4EAhupfXkqZe6uBrevfFbvQc36idQQpQ
   K2y6ebpq5We2wpsVRpSwk3JmQjktZKDgi+2yF2VJSRTFieyWa2sS/aROx
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HlZlE89tZQ1DGqZo6cQ2qZWp5fAscMbhlk7cgFRug8sb6D7UlMgNmnHpCUm+gboYmWYRY9AdZj
 UlzplqMLjuNfZ6kaHZ0MQ/b5QtMoKRdyzBfdzsXsV9Kh/vLCseMwNSNDoCEmgMH8/EDZ8+rjN4
 Z1tGHakLDyErwFwqKe2w1P91eixmvePSbyJxixs9p8RPQzVw8j7/+W9T9krMPSxxmbjeXf1cH9
 ZH/r4O4AniExz746ZIj0FZHGlY/nd/9T32EvNHq5F7WGhh+67O8btSWasMa2xwUYHMGa8TBm6o
 IWWwO/iHLjXel7SDRKseR0SR
X-SBRS: 5.1
X-MesageID: 64260135
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KFtb6a4pjJ+2dJt/Dv2PwgxRtBLAchMFZxGqfqrLsTDasY5as4F+v
 mQYDG3SMvyCZjDweNsgYdy/pxxQvpTRzNJqS1ds/y5hHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Mw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 uhA6aCXFSsVIqDBpdQxWBd+SB5nFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQayAP
 5NCNFKDajyRbiYUEGcmB6hvs8GJhkj1Imdl+VaK8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTWogfCbm5/f5Cm0CIyyoYDxh+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1ZtfAUkGEhyKoggIRVudgP+Y0zlqy04OBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG++Nlbs/7Zcjp0/EdZZPXRECq4/
 T2FpTNWa1473Z9SjPXTEbwqbluRSnn1ouwdu1+/soGNtFoRiGuZi2uAswaz0Bq4BNzFJmRtR
 VBd8yRk0MgADIuWiAuGS/gXEbei6p6taWOA3QE/T8R8r232oRZPmLy8Bxkkei9U3jssI2e1M
 Cc/RysNjHOsAJdaRfAuON/gYyjb5aPhCc7kRpjpgilmOfBMmPu81Hg2Pya4hjm1+GB1yP1XE
 crLIK6EUCdBYYw6nWXeegvo+eJyrszI7TiIHs6TItXO+ef2WUN5vp9cawXQN7hgtvvbyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7djjm9FA3WsL7rdJ5bOmGLlY0EW0tEaaJk7ggZ5Zkj+JekeKRp
 iOxXUpRyVzeg3zbKFrVNiA/Oe23BZsv/2gmOSEMPEqz3yRxa4iY86pCJYA8eqMq9bI/wKcsH
 eUFYciJHt9GVi/Dp2YGdZD4oYE7LEariAuCMjCLej86e5I8FQXF9sW9Jlnk9TUUDzrxvsw7+
 uXy2gTeSJsFZgJjEMeJN67/kwLv5SAQwbsgUVHJL99ffFTX3LJrcyGh3OUqJ8wsKAnYwmfI3
 QihHhpF9/LGpJU48YeViPnc/ZupCeZ3AmFTA3LfseStLSDf82eund1AXeKPcWyPXW/44vz/N
 +BczvW6O/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LynUx9RLu41M2qRd6Fm/V
 U+489VHPamEZZH+G1kLKQt5NumO2Jn4QNUJASjZ9Kki2BJKwQ==
IronPort-HdrOrdr: A9a23:ek4CqqudMiPMRsR2SAJhCF+O7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="64260135"
Date: Tue, 15 Feb 2022 16:13:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: tools backports
Message-ID: <YgvRIszzjM/UB3Hh@perard.uk.xensource.com>
References: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>

On Mon, Feb 14, 2022 at 11:18:44AM +0100, Jan Beulich wrote:
> I have a couple of simple tool stack backports queued, which - with your
> agreement - I would want to put onto the stable tree whenever I get
> around to applying the next batch of backports:
> 
> d9d3496e817a tools/libs/light: don't touch nr_vcpus_out if listing vcpus and returning NULL
> e62cc29f9b6c tools/libs: Fix build dependencies
> 
> For 4.15 additionally
> 
> dd6c062a7a4a tools/libxl: Correctly align the ACPI tables
> 
> Please let me know if that's okay with you.

All looks good to go.

Thanks,


-- 
Anthony PERARD

