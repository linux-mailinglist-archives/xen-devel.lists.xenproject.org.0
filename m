Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927D24FE0E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABvp-0007EK-2a; Mon, 24 Aug 2020 12:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kABvn-0007EF-7r
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:50:35 +0000
X-Inumbo-ID: 2cda99c7-003e-4815-85d4-e7362523e480
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cda99c7-003e-4815-85d4-e7362523e480;
 Mon, 24 Aug 2020 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598273433;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/VnDnfQGmYYaWIQ6zG3a5ryOTssFziXXloaXpXo4UfY=;
 b=LPASm/PQoKbgVPHA7Y0iddb8CW1c/gSbGO2oXI7QFCj/STXtIC+2NjJ3
 yxOOO1RauUgyJ/8BEzT9NLwxze++/U5HnlE/FGc9JQQEEWxv2wZTZEmvG
 gsmRK8b6lWJtyQRWo8pGpsjcRR/xKJ4zZS95pXnKpZn0i/jqgouEeyWy1 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xzxmE0IdO3u53g4PXSSCZ90DAdmLblzaz9mjNX5LrlJ9lydAZi6mFXBakvECStIbQeThwuWBIu
 JHASEoV7SE6ExWUbfzXbJUreQLcj5/7myV8NkF3Z51OXAu6JJV2RpEslqbAwKEAxkf0vA5oX8g
 ztChESH2pC5Fm/oBirs//YjOGNpYdiNaVw2+s6JuI8HfR18xEpfSuD6CPrCqlnXpdLjJdiYNYM
 NYscJ5ifqIOrCGkokYIAVwW+keoJAOd/mqX2HgIpYTd/Cj6Kc8VDs8OqiRfu9KwoSfyW2R5SWm
 jpw=
X-SBRS: 2.7
X-MesageID: 25453347
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="25453347"
Subject: Re: [PATCH v2 5/5] x86: simplify is_guest_l2_slot()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <08de75ba-36e3-5860-bbd2-d95bc48bff74@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f1df42f2-2761-7858-6257-28f3e047aba5@citrix.com>
Date: Mon, 24 Aug 2020 13:50:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <08de75ba-36e3-5860-bbd2-d95bc48bff74@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/08/2020 13:35, Jan Beulich wrote:
> is_pv_32bit_domain() has become expensive, and its use here is
> redundant: Only 32-bit guests would ever get PGT_pae_xen_l2 set on
> their L2 page table pages anyway.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Possibly "if some other error does lead to PGT_pae_xen_l2 ending up
anywhere else, we still don't want to allow a guest to control the
entries" ?

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

