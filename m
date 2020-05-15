Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430D1D5515
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 17:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZcaP-0003DT-TR; Fri, 15 May 2020 15:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZcaO-0003DO-7r
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 15:49:20 +0000
X-Inumbo-ID: a362c6b0-96c3-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a362c6b0-96c3-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589557759;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AC3U4/QPe+c8htFYdAMgNCnvefMoc9sYFxJWm49ju0Y=;
 b=DIsPiCDZGE4t1anD6M0Q6eiocathdJ+dTwupeUy4rS5zb7fzmI98CLEQ
 QRENmsEz8QEJ9jQCbmZ4zYoj398gL9OEBHh/L/Ao3R8TbGd0+V4ujUcwf
 6D/X/JE68JRdwPO5IcV6T5O4kYYt/gbNjgZnAqkmqx9biVPK5hF9mGARv E=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: qOGkNWPVO24HXQZMG8Wg3OJqdpcopAbjjmOxVC6xHj7c1WxIHRZh5v1KZbu6feispD/OzCWJHc
 7xNnCKqmXmvGZUrcVtB4tpw+ivhne3VYhUcflQkIdtr6KQljvSKLVPxFGApTZttg7TNZTFPVii
 ndh9jP51q/WGCfVefsE82KeEEEhK3dYuY17nXsEJYj24/GeFQuM02a9Ueyi1JZVv1tPxmXXo/U
 Iypyrl4CFeZsPmQkvGBV23Tuvhq74tB8i+jAYGiIZ0TkwgewVntTTme4+ApQvCz+O22nU45ZAr
 oy8=
X-SBRS: 2.7
X-MesageID: 18343889
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="18343889"
Subject: Re: [PATCH v2 6/6] x86/mem-paging: consistently use gfn_t
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <b50f9677-3b62-b071-decc-007e6a92701d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d1a87f81-4373-8174-b54a-c98e25a12a99@citrix.com>
Date: Fri, 15 May 2020 16:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b50f9677-3b62-b071-decc-007e6a92701d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/04/2020 09:39, Jan Beulich wrote:
> --- a/xen/arch/x86/mm/hap/guest_walk.c
> +++ b/xen/arch/x86/mm/hap/guest_walk.c
> @@ -68,7 +68,7 @@ unsigned long hap_p2m_ga_to_gfn(GUEST_PA
>          *pfec = PFEC_page_paged;
>          if ( top_page )
>              put_page(top_page);
> -        p2m_mem_paging_populate(p2m->domain, cr3 >> PAGE_SHIFT);
> +        p2m_mem_paging_populate(p2m->domain, _gfn(PFN_DOWN(cr3)));

addr_to_gfn()

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

