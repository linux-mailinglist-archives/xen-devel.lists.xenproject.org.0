Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB971CAC55
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 14:54:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2W7-000494-3K; Fri, 08 May 2020 12:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX2W5-00048x-Cl
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 12:54:13 +0000
X-Inumbo-ID: 0311327a-912b-11ea-9fe5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0311327a-912b-11ea-9fe5-12813bfff9fa;
 Fri, 08 May 2020 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588942451;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5aNK6xTRklf7K2GontuyiPQPstkJsRBOU6hDzb0VAQA=;
 b=WWxF9dxtweloiGhqQpibu3Ugrb1Ruf6BhqXvka/MjIUvzG+Q0YmCdLvb
 vfKhbhIMvMQJN6ZNwelF/4BsRgiYscu98HW71nrzKZ8pulpCGKGOt/MoZ
 C4RWn2biSyqNtMhdE16KmDS6O7/2bYa4VEBi9dTeTRDkiR+wfoCdDPptT g=;
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
IronPort-SDR: 4+f0sYDL0We9F1/Uxd/U+80BDXDR48WPKMcJpAmkXHZZO6y/ktO1Q1csYKu0az2Ts24IDRwmQ8
 Zpma19IxKdIWC+eAWpK7CR/vIwLTiUQyCLsjljMd5KOZnBumiEnElg6a3jVtuaudfNLmAP42B7
 miEEwdYXuVW8QuFTcjmrKh1EVeQ2a2E+Dx5rIHdpLPe60tr3nXpRSfZANmsZXozxeSt/vn9lGY
 Tdz1u5akYnVoAhFP+gWgB3Gez2F09leHkXQCu7VijoTR7wtV1z8gnxQpv0oN6DbXtVdR4wJDA6
 fkY=
X-SBRS: 2.7
X-MesageID: 17756052
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,367,1583211600"; d="scan'208";a="17756052"
Subject: Re: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c8826959-8dbe-cc39-80b0-8ba03c6a6f30@citrix.com>
Date: Fri, 8 May 2020 13:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/05/2020 13:43, Jan Beulich wrote:
> The op has a register/unregister flag, and hence registration shouldn't
> happen unilaterally. Introduce unregister_vpci_mmcfg_handler() to handle
> this case.
>
> Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I agree in principle that registration shouldn't be unilateral, but why
on earth does the API behave like that to begin with?

There is no provision to move or update MMCFG regions in any spec I'm
aware of, and hardware cannot in practice update memory routing like this.

Under what circumstances should we tolerate an unregister in the first
place?

~Andrew

