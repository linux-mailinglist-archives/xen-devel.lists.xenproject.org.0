Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568142733A4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 22:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKSYy-0001bI-TF; Mon, 21 Sep 2020 20:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIeE=C6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKSYw-0001bD-Jo
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 20:37:26 +0000
X-Inumbo-ID: bff694ab-7bda-4bd1-b4dc-2165245f6b1e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bff694ab-7bda-4bd1-b4dc-2165245f6b1e;
 Mon, 21 Sep 2020 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600720645;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PI68VIsXDHRlcHcIzjhtlnHbT/WSalbwA0HZLmELt84=;
 b=MyVqHeNK5j7Xeo5QnoNBceWpXC1y+rsSqjjFYDei5pVpU7g0YU5IY1bk
 UtesfPSyYJKwW80JwudS4myetDF1IDWaSGdzF26UXOofk71Rrk/Cwoq1K
 asU8qurVIDDpmdx1thCJmGsY/tE/EsA31vZNYsjgks3LYam7FIGRntLfl Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XH5DvnutJNQEf5sPoPe87HAX6MhglH4T+nevu+tZmObEEwXtjeRIbOfUtQFGZqLCYAQ596RgBH
 1ayXSDP8Gxy0hBKWz4zKVrdM3/xRu+NMD1TB/sJ7HThGCGNfkpX2Qb5TP4klxRi4orQsoI6fk3
 WxHK8vj9eIlA0i1vVCT0tMT4KQ9ZGjLzyutebyTQmh4/q5gUfc7900rMxDiZNrZRmar5Uv1Lah
 CBq5K9r1z25OG2gbUOkeCUVfHK37Q0J5gddrAros+mEOcOWoF0VY6oxj+EF0pW1mOPLuMPhf4n
 2MM=
X-SBRS: 2.7
X-MesageID: 27175791
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,287,1596513600"; d="scan'208";a="27175791"
Subject: Re: [PATCH v4 4/4] xen/mm: Provide dummy M2P-related helpers when
 !CONFIG_HAVE_M2P
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-5-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <26a1a029-26ec-51b4-bd1c-a1826f7d1ad7@citrix.com>
Date: Mon, 21 Sep 2020 21:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921180214.4842-5-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 21/09/2020 19:02, Julien Grall wrote:
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 4536a62940a1..15bb0aa30d22 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -685,4 +685,17 @@ static inline void put_page_alloc_ref(struct page_info *page)
>      }
>  }
>  
> +/*
> + * Dummy implementation of M2P-related helpers for common code when
> + * the architecture doesn't have an M2P.
> + */
> +#ifndef CONFIG_HAS_M2P
> +
> +#define INVALID_M2P_ENTRY        (~0UL)
> +#define SHARED_M2P(_e)           false

((void)_e, false)

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +
> +static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn) {}
> +
> +#endif
> +
>  #endif /* __XEN_MM_H__ */


