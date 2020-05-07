Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53961C9BE0
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 22:14:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWmtZ-00055b-TB; Thu, 07 May 2020 20:13:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWmtY-00055W-2n
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 20:13:24 +0000
X-Inumbo-ID: 338ceaf2-909f-11ea-9f74-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 338ceaf2-909f-11ea-9f74-12813bfff9fa;
 Thu, 07 May 2020 20:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588882403;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eAz42w4G407xqjU+5HJ38ES5QkCaO1FFdhD88UNFf44=;
 b=LbHiunsagYh4EkvvHme7eRsKrHtIjKQ4B9n+1nyVfRrardnvA/7StYkH
 ZRWFLjEp8ce8lN4bN7xVx/kuvmXv5YfmQ3vA3sewTpxPIxi51tMu4ti03
 7AdZJIBThXtSktJe7qEHYty9/UmVaP/5BW4tKiQjIGozPa3mEe1XB3AJJ E=;
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
IronPort-SDR: v0YBqqoymGMg5tPVAle9c9O241E8UdcsTWn4f4cKvbplTqfI9+YPsvb+mfJb+E1KYlS1kxHalJ
 SXTLrnQWBM8slV6BAx96IxeX8vrtPOBxFDU+PuOCvGrT5ukrbNNzt6Ye9reZwo/1ea2mQy/1x/
 QbRuFoTZZ1MhSOqjdApMWZrvIzyjiAhE4OYXDxmPR4z8btxd1GQazoSUlwaaEzFosRh2kR6lRP
 E/NyUZguhTFp2mQ2hjMpLEjjFtRkPJWmxVzT0ZzAmQXl6nT1UAjtuo9PI+zhV9N2+/v0i/sSqo
 df8=
X-SBRS: 2.7
X-MesageID: 17388994
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,365,1583211600"; d="scan'208";a="17388994"
Subject: Re: [PATCH v8 05/12] x86emul: support X{SUS,RES}LDTRK
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <6e7500d2-262c-29c7-b9be-3fc9be26d198@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <feb3a6ed-b6b9-959c-8eb1-fb6ecfff034c@citrix.com>
Date: Thu, 7 May 2020 21:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6e7500d2-262c-29c7-b9be-3fc9be26d198@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:14, Jan Beulich wrote:
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -284,6 +284,9 @@ def crunch_numbers(state):
>          # as dependent features simplifies Xen's logic, and prevents the guest
>          # from seeing implausible configurations.
>          IBRSB: [STIBP, SSBD],
> +
> +        # In principle the TSXLDTRK insns could also be considered independent.
> +        RTM: [TSXLDTRK],

Why the link?  There is no relevant interaction AFAICT.

~Andrew

