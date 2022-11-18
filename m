Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0D62FB7A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 18:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445860.701283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow50r-0000xa-0b; Fri, 18 Nov 2022 17:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445860.701283; Fri, 18 Nov 2022 17:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow50q-0000uW-Sx; Fri, 18 Nov 2022 17:18:48 +0000
Received: by outflank-mailman (input) for mailman id 445860;
 Fri, 18 Nov 2022 17:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTNm=3S=citrix.com=prvs=3144bca92=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ow50o-0000uP-JS
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 17:18:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0da637a9-6765-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 18:18:45 +0100 (CET)
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
X-Inumbo-ID: 0da637a9-6765-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668791925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lm4vFfQPUI68pU6CkdVXHdbmE4t7kd1xAa6hhR+i92k=;
  b=GGLZOQCeBr1/SDAOedrLe+5Y9L5O0pF0ajtKccdhntADHSe2aK3ZGc1o
   1meJEV9ovxDhYk4B8XR6olhHP/LXFJH/V6qXz9OBQyno5XmoQBEpiJEBB
   bonp+14VU7XCbilJ2AQpLRNgIlKGBO4DXYOnUpya91SV6YE+z43ro1WKG
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84191301
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sapZtKgV1ujuzBsSL4rHs8twX161EBAKZh0ujC45NGQN5FlHY01je
 htvW22AOamJNGGgco1wbI209RsC78WEm9I3QAQ9+C8yEykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QaOzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRAJAwoNSybudmH45+rSNNDl8cJDtD0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthbE/
 zOfpDygav0cHN6vxD+/9nCUusDOgiX+dag0EIW05PE/1TV/wURMUUZLBDNXu8KRqkO4QcMZF
 EUS9QInt610/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3u+YkRbpBTArFl4hSD8GdyQU4PPBuZ5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1QfHNFBz3oRZPmLy8BxkgTHqFyu5eJVfUj
 Lb74Gu8JPZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPMguLlLaoXswPBb4M4XRfK4Ey/lX1
 XCzKJfEMJrnIf4/kGreqxk1jtfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U5FyS2Lm
 +ti2zyikUgGD7SlOnaJrOb+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:rVl97ayjs/6iD3ERE5PEKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.96,175,1665460800"; 
   d="scan'208";a="84191301"
Date: Fri, 18 Nov 2022 17:18:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Message-ID: <Y3e+aWizTFL2HUvZ@perard.uk.xensource.com>
References: <20221118170213.2872-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221118170213.2872-1-andrew.cooper3@citrix.com>

On Fri, Nov 18, 2022 at 05:02:13PM +0000, Andrew Cooper wrote:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index b59bbe00bb30..68ad9763b6ba 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -1459,7 +1459,8 @@ int libxl__domain_set_paging_mempool_size(
>      int r = xc_set_paging_mempool_size(CTX->xch, domid, shadow_mem);
>      if (r) {
>          LOGED(ERROR, domid,
> -              "Failed to set paging mempool size to %"PRIu64"kB", shadow_mem);
> +              "Failed to set paging mempool size to %lukB",
> +              d_config->b_info.shadow_memkb);

Unless I miss read, `shadow_memkb` is also "uint64_t", so I'm pretty
sure the format doesn't need to be changed, and we should keep using
PRIu64.

With that changed: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

