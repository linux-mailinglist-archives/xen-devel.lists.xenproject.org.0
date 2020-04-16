Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57431ABE0B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 12:37:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP1t1-0001wR-P2; Thu, 16 Apr 2020 10:36:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HCIP=6A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jP1t0-0001wM-Kq
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 10:36:46 +0000
X-Inumbo-ID: 2b16453a-7fce-11ea-8b73-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b16453a-7fce-11ea-8b73-12813bfff9fa;
 Thu, 16 Apr 2020 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587033406;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=B3F9vmUKCZWW8pKxejUrfxO+dZqnQtTncGLehYdGxzc=;
 b=eOkpOmwWbr3UQoZHovoRy6Rw1Z8SHpeBOM5NNsQwsdC6mFouf55A3pa4
 zv2sOsYlDfBh1Qrg7+JJLmT7o3oaFw54MPRy6Mm/eBMmfRs5Kt//D2bwL
 bbN1AckfZEVN+3yuV2kzuw5ka6hkDNCPMZSCcVHDFYCOyCTRjK1sKLkqu M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: GZ1+DEOi9kEEdEQ6ewAZITP9zQ10gRfnfEpqTye1jakNMNmizl1LM8+8DgopAp0G4+Xg0hX9Qj
 x7m5SBGgwVsApyUhm3K0oBS8VCjfho4AEKgwSfmWE8V89FPptAj0jWthPXurchbGKGrNT29fcb
 8Biu23djIsEN4Wvomn56eiUGqOjbFXKcv5HpJU7K1nAqX5mEElnkDAKG54bwq4A7QCeUJGawc/
 gUDuZrvys//5mIOWAV889zqkqkcREfdRdvea0p8g/GIhGbme5oXltwU4KnkwCbrXO8MMP80h7U
 lw8=
X-SBRS: 2.7
X-MesageID: 15783033
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="15783033"
Subject: Re: [XTF 4/4] setup: Setup PV console for HVM guests on xen >4.2
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-5-wipawel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e1e910a7-ed94-46e9-6987-fecdd704e104@citrix.com>
Date: Thu, 16 Apr 2020 11:36:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416094141.65120-5-wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: semelpaul@gmail.com, Paul Semel <phentex@amazon.de>, julien@xen.org,
 nmanthey@amazon.de, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 10:41, Pawel Wieczorkiewicz wrote:
> @@ -272,9 +274,23 @@ void arch_setup(void)
>  
>      init_hypercalls();
>  
> -    if ( !is_initdomain() )
> +    xen_version = hypercall_xen_version(XENVER_version, NULL);
> +    if ( version )
> +        *version = xen_version;
> +
> +    /*
> +     * The setup_pv_console function registers a writing function
> +     * that makes hvm guests crash on Xen 4.2

This comment in particular is rather concerning.  Even if there is a
configuration issue in 4.2 stopping the PV console from being wired up
properly, nothing involved in transmitting on the console should crash
the guest.

~Andrew

