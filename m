Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34F2A4377
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18227.43178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtzP-0004wP-1T; Tue, 03 Nov 2020 10:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18227.43178; Tue, 03 Nov 2020 10:56:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtzO-0004vy-U5; Tue, 03 Nov 2020 10:56:34 +0000
Received: by outflank-mailman (input) for mailman id 18227;
 Tue, 03 Nov 2020 10:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41xg=EJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kZtzN-0004vj-5I
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:56:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9134783-9da0-4d9c-8ca2-f7f7338c729c;
 Tue, 03 Nov 2020 10:56:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=41xg=EJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kZtzN-0004vj-5I
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:56:33 +0000
X-Inumbo-ID: b9134783-9da0-4d9c-8ca2-f7f7338c729c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b9134783-9da0-4d9c-8ca2-f7f7338c729c;
	Tue, 03 Nov 2020 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604400990;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4a/o2HIbskxD+OMC2wnXN4PLrvWgZz4D8VfelyDZl54=;
  b=APqr6+c4ngzg/2S0Ds5DHaKwYK2rT+FQGZMJ1+NDiv9tIzNafweCMD51
   WFD6Q/GjAw9Ei+AkOtGnKIjoxTRvA6uto3cHRICT0+wqzWGJM7uQSUoQw
   UxIkzDsz4Zr87hRUgW6s55dQpU78Gju0Rb4xMCCOSWcisn3nuAlUeAhth
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ni+TYlycDocH0KZY4Jpi9OCSCMZerC2bTdGnC8k/vxXMq0UR3sCi3eWMP5anzVrz2rJqmxUO+z
 zetNB5+W4Ebgd7hkJnrZ+ooONILwK/t87ByjQy5kEud9GEvgTTBi0c13R1EsMnjQeLNFHhDGxw
 0v81akX4N5UkS4zxUA5Vrrt4nNWXT0X5DXTu7J0hbQ5tbp7jIFUFSKwY7KCOrhpWvhrttbau4g
 d6a5Uvaz4YKU2Mkk9w4Jffe8rAR38K999xrJ9r4PXQhQPQM/dzvdZ353daGFGfwXSF71uvFE/v
 98E=
X-SBRS: None
X-MesageID: 30694830
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,447,1596513600"; 
   d="scan'208";a="30694830"
Subject: Re: [PATCH] x86/mm: drop guest_get_eff_l1e()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <8a94e96d-14e6-d145-3532-91dab96c8209@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c7add7b3-f01e-043f-6fdd-4c6e3e37d33e@citrix.com>
Date: Tue, 3 Nov 2020 10:56:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8a94e96d-14e6-d145-3532-91dab96c8209@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 03/11/2020 10:48, Jan Beulich wrote:
> There's no actual user of it: pv_ro_page_fault() has a
> guest_kernel_mode() conditional around its only call site.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

