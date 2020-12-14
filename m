Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A695E2D9A19
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 15:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52288.91360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kooym-0002w0-6O; Mon, 14 Dec 2020 14:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52288.91360; Mon, 14 Dec 2020 14:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kooym-0002vb-33; Mon, 14 Dec 2020 14:37:36 +0000
Received: by outflank-mailman (input) for mailman id 52288;
 Mon, 14 Dec 2020 14:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oe/o=FS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kooyk-0002vW-IW
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 14:37:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6323ce07-4dab-422d-a998-5e1b712a4c68;
 Mon, 14 Dec 2020 14:37:33 +0000 (UTC)
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
X-Inumbo-ID: 6323ce07-4dab-422d-a998-5e1b712a4c68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607956653;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nmNIe/ATa0jzxlCrAQ4P1sJQEdCuhqzkG5l6Bd27eYY=;
  b=LJpelrdM43gOT83VqO6YhDpT6TcP9kVsWREtFvYAhXthl0ac1akz2zQT
   wr7Yv+cyQnvD75uzeb3LwrEj94wEgA8SgJoh4Jb3p/qb8DNnyVn4H28W0
   n4gaCL4cV092/hBaw51w+gsvwEgZXIBAsVvKG0/3n1r+BABBs+I7sdmrZ
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dko5nyLuNZiqVXaAGA9niPDUim9pTpy9+1cOSEfvAozg2DPcGfy4bhYqIl7w9ruz7Ni3VBPmQ/
 DQfIX1z94jGlAlN9F2yQXp61BOjZ1MOHGUhXVtgGrU7sCabF5ymXWq5f8Lwjl6Tl9z8YoZTMDL
 TRogQBlZ1mHi4LHDY/XtLcK6amROih9m2a2lyjTggaXwYWHvu5vILYK5+SZmOY7EdXrYjDMzdm
 VCP1ikvBdZVxta4OkwiSm8Chu/5jUaMhfpWRgtFcZSdgUn8onPwvXNdhQ8HJSVXgJFFopv0fzg
 4zk=
X-SBRS: 5.2
X-MesageID: 33141525
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,419,1599537600"; 
   d="scan'208";a="33141525"
Subject: Re: [PATCH] x86/PV: guest_get_eff_kern_l1e() may still need to switch
 page tables
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Manuel Bouyer <bouyer@antioche.eu.org>
References: <89ae6a3b-bfbf-a701-53f5-4dfc80065924@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <76e5b234-9469-c0b0-c237-ac4d538edbbb@citrix.com>
Date: Mon, 14 Dec 2020 14:37:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89ae6a3b-bfbf-a701-53f5-4dfc80065924@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 14/12/2020 13:57, Jan Beulich wrote:
> While indeed unnecessary for pv_ro_page_fault(), pv_map_ldt_shadow_page()
> may run when guest user mode is active, and hence may need to switch to
> the kernel page tables in order to retrieve an LDT page mapping.
>
> Fixes: 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")
> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Manuel, could you test this again, just to be on the safe side
> before we throw it in (at which point we could then also again
> add a Tested-by)? Thanks.

I've got a repro of the issue (literally - just booting the
netinstaller), and this does fix it.

~Andrew

