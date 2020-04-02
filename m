Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13419CD0B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 00:47:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK8cb-0006ZI-De; Thu, 02 Apr 2020 22:47:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK8cZ-0006ZC-AC
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 22:47:35 +0000
X-Inumbo-ID: f16948c2-7533-11ea-b4f4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f16948c2-7533-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 22:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585867654;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9qjndwR6LrS3lrCmbsd9h17W7vgSHucDbBPEjLvw8g4=;
 b=c/DDm3JIMYHUYWoPEMTHl12NcUYXvBTfbNL8LFyEBAoE3QyKPQLU7BEN
 ZdrorphvSAzq4gfO+lm7l3HQbn0+manqmfEtivZIT91Cbrhr1FICiwjtf
 X0qUqzP0SJXW8R/5w6/1xAcFE/RT2lO8u8zvBnNXq+dXd4dMbmdaBeU/8 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 3X1dTwt2Sk0NQg48e3B3vtiN9DCjSH2YTL6Jiy84bjCVAh0DqH94nzyOSqB6tiwIcE8jEejvZR
 dVLrrhgPwqIV1S9SfOck9hhQ9NvZiz8M/3ZX0CnXyT4eLJZMJ+taizktOz7An+hlqgSbVzK+Wu
 Url5rpSOFojcTKTON5CFyTSpNqoKJtcdAZ6eoKPl2v9xovrBfYQ01U09v7r06rLg0g/b32miRU
 Yyez7t/8tqLrujKx7a9RJ0jkOygetDJC7Q8JD8IlZe6isM/x6YnbO+7WAi95cdbQpn7A36SQTD
 QuI=
X-SBRS: 2.7
X-MesageID: 15764217
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,337,1580792400"; d="scan'208";a="15764217"
Subject: Re: [PATCH 5/5] x86/p2m: use available local variable in
 guest_physmap_add_entry()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
 <3a8a7eb3-4822-0234-47de-c83973b4b5eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e4cc2f64-7b08-01a3-8900-6ba5b3aaa0a6@citrix.com>
Date: Thu, 2 Apr 2020 23:47:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3a8a7eb3-4822-0234-47de-c83973b4b5eb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 01/04/2020 12:40, Jan Beulich wrote:
> The domain is being passed in - no need to obtain it from p2m->domain.
> Also drop a pointless cast while touching this code anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -905,7 +905,7 @@ guest_physmap_add_entry(struct domain *d
>          if ( p2m_is_shared(ot) )
>          {
>              /* Do an unshare to cleanly take care of all corner cases. */
> -            rc = mem_sharing_unshare_page(p2m->domain, gfn_x(gfn_add(gfn, i)));
> +            rc = mem_sharing_unshare_page(d, gfn_x(gfn_add(gfn, i)));

Same as patch 3.  I'd recommend "gfn_x(gfn) + i" in preference (seeing
as you're cleaning up this line anyway).

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> seeing as you didn't
introduce it, but preferably with it changed.

~Andrew

