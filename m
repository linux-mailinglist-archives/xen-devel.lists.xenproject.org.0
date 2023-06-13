Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AB72E7A3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 17:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548241.856078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96JF-0004WF-NI; Tue, 13 Jun 2023 15:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548241.856078; Tue, 13 Jun 2023 15:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96JF-0004UP-KZ; Tue, 13 Jun 2023 15:51:53 +0000
Received: by outflank-mailman (input) for mailman id 548241;
 Tue, 13 Jun 2023 15:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q96JE-0004UJ-Bb
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 15:51:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34536c49-0a02-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 17:51:49 +0200 (CEST)
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
X-Inumbo-ID: 34536c49-0a02-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686671509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vinrkEBxhJi3lAQy3F5JzVAKRRCOx2wpkGpS81AX3wk=;
  b=Oz8cj/D+K8tcZHPOp988ZV/mE0Um7c6FN/dDFiO2FYAoKsGYO+wWjMbp
   RX+fKfuMtTt6BATITJdIO3M9aQSRxProcI/8XmtkMb+Phpt7h1HvaNDHz
   JtMWfrK5R1s0jl4LRZgvT2Hc7xwt9EoRa2624zOh82VAEXcXg7CSHWg3g
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111959888
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Wnld06gENheTPvqw3J4DuvziX161ohAKZh0ujC45NGQN5FlHY01je
 htvX2zTaKzbamOkKt10ad62pEpUvZHcz95mSAdvpH9kQn4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQXGBkkS1fbiN7m5+yaZNJn1+cFFMDkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 zuXojWpUkFy2Nq38GOMz3S0vO72libhdKkoDaOVq9lmnwjGroAUIEJPDgbqyRWjsWa8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaESQNNmoDeS8sRBMI+cX+u5o0ig/TT9FlC+i+ididMTjoz
 iqDtiQWm7QZhslN3KK+lW0rmBr1+MKPFFRsoFyKACT8tFgRiJOZi5KA5mjyxNMHdImlHn7fn
 VY/kJm9ytgHAsTY/MCSe9nhDI1F9t7cbm2C3wQzR8Z9n9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Sc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBc2B2y8nTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035geTDNSLKEuZZYALmggUFAEWs+l29H
 zF3bZLi9vmieLemPnm/HXA7cDjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yF7Mdz1sPZBJsZfkHtO3LUL8MOYh
 sItI62oasmjgByck9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:noU7Da50gO911nshCAPXwPLXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssQgb6La90cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKgjVQxexQpeW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3AmadUy2vMlwa0BBbILYJN2hcl6IsqQlT06TCILHP?=
 =?us-ascii?q?oLjhIZoaeGHy2wKprxp8=3D?=
X-Talos-MUID: 9a23:DYTAKwrpzvS3MephWkUezwg7Pfpu+56vMUsIi7ktgdCaGHFXNyjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="111959888"
Date: Tue, 13 Jun 2023 16:51:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Daniel Smith
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Message-ID: <05729d2e-d503-48e4-a8f3-3d65293f544d@perard>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>

On Mon, Jun 12, 2023 at 01:46:19PM +0200, Jan Beulich wrote:
> The variable needs to be properly set only on the error paths.
> 
> Coverity ID: 1532311
> Fixes: ab4440112bec ("xl / libxl: push parsing of SSID and CPU pool ID down to libxl")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

