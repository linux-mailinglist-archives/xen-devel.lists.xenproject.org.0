Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934661D5527
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 17:52:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZcdT-0003zp-Ce; Fri, 15 May 2020 15:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZcdS-0003zk-2a
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 15:52:30 +0000
X-Inumbo-ID: 14506526-96c4-11ea-ae69-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14506526-96c4-11ea-ae69-bc764e2007e4;
 Fri, 15 May 2020 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589557949;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LqOMgwBCraexW+x7DyWMRZYdT+fJD87gTxi9XiSBgi4=;
 b=DsoVeDZTDoNNW9T9qhZpPgCdJstIVgALrYZiak0GImRfyT+dSd5DO3mX
 GB11Jv3sP/5g41SbDTNafcTCZI5RdKofYM4g13Ktz0H6412ffMCu2vgWm
 aPJFjvrIDhlx3hQJZtvI7TY+k79KxMTOiMtdKyYJPVGAZ0Gxgwple9Wx4 o=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: TIBIMGfxpy5XlkH/PD9FtukFDItMTCgr0iPsjmHbKlkHhK/SGR3c28LsiAT60nOYjq0vt0Mm7Y
 sHaZBoBW8M5oPzP26eZVDzneEuZz/JW2znJx6PRgZoRux2jTczclDeimrr1s5vIV6YrWFVh+21
 sTQ77LK7jiSomjUO23ebRLnH54JloAp8geGjb/1cG7pn4wziw0sYsF18toLZ0Ct1H+vb62FZfv
 +SWNdv+jqEUlHsEUSJlhjvzZ6yWj/K0Zr8pATE9bqezyham03yvIUntCHIA7Kn1/ueLtkCAJZL
 /XM=
X-SBRS: 2.7
X-MesageID: 17672619
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17672619"
Subject: Re: [PATCH v2 6/6] x86/mem-paging: consistently use gfn_t
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <b50f9677-3b62-b071-decc-007e6a92701d@suse.com>
 <d1a87f81-4373-8174-b54a-c98e25a12a99@citrix.com>
Message-ID: <fe2f6c75-9cdf-a359-8be9-71066ac13ae4@citrix.com>
Date: Fri, 15 May 2020 16:52:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d1a87f81-4373-8174-b54a-c98e25a12a99@citrix.com>
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

On 15/05/2020 16:49, Andrew Cooper wrote:
> On 23/04/2020 09:39, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/hap/guest_walk.c
>> +++ b/xen/arch/x86/mm/hap/guest_walk.c
>> @@ -68,7 +68,7 @@ unsigned long hap_p2m_ga_to_gfn(GUEST_PA
>>          *pfec = PFEC_page_paged;
>>          if ( top_page )
>>              put_page(top_page);
>> -        p2m_mem_paging_populate(p2m->domain, cr3 >> PAGE_SHIFT);
>> +        p2m_mem_paging_populate(p2m->domain, _gfn(PFN_DOWN(cr3)));
> addr_to_gfn()

Sorry - gaddr_to_gfn()

~Andrew

>
> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>


