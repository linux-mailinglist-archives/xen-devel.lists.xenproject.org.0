Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED419CCDF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 00:31:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK8Mi-0005DG-MC; Thu, 02 Apr 2020 22:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK8Mh-0005DB-EB
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 22:31:11 +0000
X-Inumbo-ID: a6efc2d2-7531-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6efc2d2-7531-11ea-83d8-bc764e2007e4;
 Thu, 02 Apr 2020 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585866670;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=c2nQkuxQNUaWQm1e+Z4FNYDbSxWQmDFJ7gTDJN/Vsdw=;
 b=NohrZcyJw2VUHKg+OhWUBdaoPcV9msjfQMD2uY1PAKVtHI/FWz8zn1s5
 OuEfEUIpCQKsBMbSzsEMSuLODA6bSsEjqQZexQHH+B5HgoGhpjSEaKL4Q
 REV7NZGIj1OvZB2lF2dwcRrFUxVtdg+8IL/qtYuxHvwz2ILbU2huo59p0 Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w2wAchyD0EEP5+skqV6pmzbKVV3yiSNoOJujJWgpwPw7K5LXZDdR5BGwQ/ILbe/XOVkqAdj4Mr
 IQMR0NkWrXWAxPAes6VyIL0ENT925pONtMBQup1OwYvCXdiaYP3UJ5O6gSVsi+oI8DwVKN7yQs
 La9NmavEfjvw+btPNHElFaW82S6X7p9IzKmPdyIQ4eJ5VFHzhW1QmdT/VsPPD1yqm3uDbD8tk6
 Ty3SU5yl01xFdZoEEbHh5rOH85V8+xg0u6qkG5WBIuGuwEbsVHwHQU1tChzm1w9GuPHF+99amC
 kkU=
X-SBRS: 2.7
X-MesageID: 15509126
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,337,1580792400"; d="scan'208";a="15509126"
Subject: Re: [PATCH 1/5] x86/p2m: don't ignore p2m_remove_page()'s return value
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
 <88aa25d4-9772-8a2b-48c4-c0138ef000b9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6bae2e4a-4bc5-87ad-484c-0debfbc33961@citrix.com>
Date: Thu, 2 Apr 2020 23:31:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <88aa25d4-9772-8a2b-48c4-c0138ef000b9@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 01/04/2020 12:38, Jan Beulich wrote:
> It's not very nice to return from guest_physmap_add_entry() after
> perhaps already having made some changes to the P2M, but this is pre-
> existing practice in the function, and imo better than ignoring errors.
>
> Take the liberty and replace an mfn_add() instance with a local variable
> already holding the result (as proven by the check immediately ahead).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

