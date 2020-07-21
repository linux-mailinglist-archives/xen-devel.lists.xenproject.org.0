Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5B227D1F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpaN-00056r-Lr; Tue, 21 Jul 2020 10:33:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5W=BA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxpaM-00056m-2z
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:33:22 +0000
X-Inumbo-ID: 98303ea4-cb3d-11ea-a09d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98303ea4-cb3d-11ea-a09d-12813bfff9fa;
 Tue, 21 Jul 2020 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595327600;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QCzr/dm7szt2McrHFnYkDUuaTcGnxpCxhc8NWR5qIF8=;
 b=YTeC5gb0CRFrL5cvjpTpm2BpB6QxcBgs17pRiCmD1Vxr/eGBoIsISBdk
 16g5/RY9E7vuVFX8GbUyue7+030Gu4wG4clBNlUyvlHJ0OYe5noKzaRcU
 4a6oqVUofIBtC6KE7w3kAtnUWWE/Km1wHie01HXwOnSdOiA28ILVPfUty w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sRNp8pp8E0NRvLaym25bW5MavIq1VeggUU5eatcRvv+yzBzArIOoM/ylorEPqrCcY2ydlFl5vx
 MIXK36TrcuCk8FnZT6n/CBHartvr7isb2i1oF8x2SvBGXyMpsUwVNmK/5+s949nYZTUAbtjshT
 zO7YHWJYDcvrKOW9mDqaNAZLq9WpePNjqGpf++oylKqqpYcvKHVi+gsLBSrHK7hjUCwg3scLLo
 M6zhKIz560yoV3cz2RWJgBury+G+bFPvD6Zv35nieBstdAy9fE2ebXSZb1/146XthRvYNdjBHN
 1Ng=
X-SBRS: 2.7
X-MesageID: 23160836
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23160836"
Subject: Re: [PATCH] x86emul: support AVX512_VP2INTERSECT insns
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <08083899-7348-63d2-1f28-0932e2295d64@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <120bdf92-15b6-3616-5cdb-75b9c38155d4@citrix.com>
Date: Tue, 21 Jul 2020 11:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <08083899-7348-63d2-1f28-0932e2295d64@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/07/2020 11:23, Jan Beulich wrote:
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -160,7 +160,7 @@ static const char *const str_7d0[32] =
>      [ 2] = "avx512_4vnniw", [ 3] = "avx512_4fmaps",
>      [ 4] = "fsrm",
>  
> -    /*  8 */                [ 9] = "srbds-ctrl",
> +    [ 8] = "avx512_vp2intersect", [ 9] = "srbds-ctrl",
>      [10] = "md-clear",
>      /* 12 */                [13] = "tsx-force-abort",
>      [14] = "serialize",

Are we using underscores or dashes?  I realise its is already
inconsistent, but this is a debugging tool only, and we can change our
minds.

~Andrew

