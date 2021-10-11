Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A342944D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206312.361855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxu7-0003UJ-IX; Mon, 11 Oct 2021 16:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206312.361855; Mon, 11 Oct 2021 16:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxu7-0003Rp-F2; Mon, 11 Oct 2021 16:11:55 +0000
Received: by outflank-mailman (input) for mailman id 206312;
 Mon, 11 Oct 2021 16:11:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZxu5-0003Rj-R8
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:11:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f23bf278-2aad-11ec-80ea-12813bfff9fa;
 Mon, 11 Oct 2021 16:11:52 +0000 (UTC)
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
X-Inumbo-ID: f23bf278-2aad-11ec-80ea-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633968712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kHnH15i0qivd7SFggkd8dQ2cplydQdin0DQ90iSslHw=;
  b=bzbEuQT8UszJ/yZaleeV/dGxEZcl48XKPE8VlvgWbjFLWNpBcaokcelb
   uPvDGKZxj/yqXLe0pHf/hIz70dpZ1d5k+1ebhybq2bTWYVi2oUHjWGGA4
   fJhrYM1pt6knKt/IT4S89+9GxI2UOJSA/9ks7NmUNIdO3bkb04WjyqHYV
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eCdfDTlIc5OpWFhg9EVx3rxgydQlRh8Hnjzdk/Z73LTRuiuCkgBgdHSlw3JSPWkKPcn6aiefCn
 4Vw/G4leb3I9E0sRN07OdxA11PXe3SBCdY3nNQPFzWf8G39W0YA1XtOW764cp7yYEZKvbb92pG
 GClmpo+TSBH23pfvpOe4xwXkhwW7MiImWy4jEokakU/GhntXea7lj76EO/nLgwyltgT+K45six
 we008kkqtn3cC3E9Xb+/mSM7HXoZ5xZ9xKZDCKSylqftcADQV0I14qPlYmzI/X3n/a9GmD3gNR
 7ubYyWxLmSGrii52AWLMOdrT
X-SBRS: 5.1
X-MesageID: 54472851
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qTz9d6gVDqbXjAV3AGitbFpWX161thYKZh0ujC45NGQN5FlHY01je
 htvXWmEMvyPNzOhKNkgPYqw9E9SsMWBxtU3SQo9r3pjESMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yx2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1wv7auaj4SHpHLibkacTJzPWZMN6lvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauCO
 5VDOWc2BPjGSzFXK1UUD883pb+lgVbOKRNYhwyb9ZNitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfXlD7/cJIfEvu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M/pFI
 kwJ/mw1rK499GSiVNy7VBq9yFaGsQQbQMF4CPAh5UeGza+8yweGBEAUQzhZctskucQqAzsw2
 TehmNfkBidmtrGPfnub+q2JtjO5OSUTLmgqaDcNSE0O5NyLiIMuihPCSP5zHajzicf6cRngz
 jbPoCUgirE7ic8Qy7797V3BmyirpJXCUkgy/Aq/dmuj4hkjPNb9T4Ot4Fnfq/1HKe6xVUKdt
 XIJn8yf6uEmDpyXkiGJBuIXE9mBzuyZPTjrpE9gFpgs6Ryg43emO4tX5VlWOkBtNcoVfC7zV
 0XaswhR+Zx7MWOjaOl8ZIfZI8MuwKv7HNLpTMfIf8FOaZh8cgyA1Cx2bEvW1Gfo+HXAiolmZ
 83dK5z1Sy9HV+I3l1JaWtvxz5cWzAog5lroZaz83kmg85G1SjmnQ7MsZQ7mgv8C0IuIpwDc8
 tB6PsSMyglCXOCWXhQ74bL/PnhRciBlXcGeR9h/M7fZeFI/ST5J5+r5mOt5I+RYc7JpevAkF
 51XcnRTz0bjnjX5IAGOZ2ELhFjHDMsn8yxT0cDBOz+VN5kfjWSHsPd3m3gfJ+BPGAlfIRhcF
 aRtlyKoWKUnd9g/025BBaQRVaQ7HPhRuSqAPjC+fB80dIN6SgrC97fMJ1W0r3lfVnXu7Jdg+
 NVMMz83p7JYHWyO6+6MOZqSI66Z5yBByIqeoWOZSjWsRKkc2NczcHGg5hPGC8oNNQ/C1lOnO
 /W+Wn8lSR32i9ZtqrHh3Pncx6/wSrcWNhcKTgHzsOftXQGHrzXL/GO1eLvRFdwrfDivo/vKi
 CQ856yUDcDra34T69AiTO0xkf5njzYtzpcDpjlZ8LzwRwzDIttdzrOugKGjb4VBme1UvxWYQ
 EWK9oUIMLmFIpq9QlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJJE4QKIlRd3YM2NiTpZ9jrQIyVYAbknrJwTHKTilhEvlgNZeZXZByKvuMOPZtxAP1MEO
 DiRgKae1b1QylCbKyg4FGTX3PobjpML4UgYwFgHLlWPu9zEmv5og0EBrWVpFlxYl0wV3fhyN
 25nM1xOCZ+Ppzo41tJeW22MGh1aAEHL8ELG1FZUxnbSSFOlVzKRITRla/qN5k0Q70lVYiNfo
 OOD0G/gXDvnIJPx0y81VRI3ovDvV4UspAjLmcThFMWZBZgqJzHih/b2N2YPrhLmB+I3hVHG+
 rY2rLohN/WjOH5CubA/Bqmbya8UGUKNK2F1SP18+L8EQDPHczao1DnSc028d6uh/RARHZNU3
 yC2Gv9yag==
IronPort-HdrOrdr: A9a23:HynqN62AmmFidJbj7iynYwqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54472851"
Date: Mon, 11 Oct 2021 17:11:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<roger.pau@citrix.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <paul@xen.org>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <iwj@xenproject.org>,
	"Juergen Gross" <jgross@suse.com>
Subject: Re: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types
 of domains
Message-ID: <YWRiNlygslYUEr7u@perard>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-7-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211008055535.337436-7-andr2000@gmail.com>

On Fri, Oct 08, 2021 at 08:55:31AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> The PCI device remove path may now be used by PVH on ARM, so the
> assert is no longer valid.

Is there maybe a patch or a commit you could point to which say that
there can be PCI passthrough on PVH?

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>

In any case,
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

