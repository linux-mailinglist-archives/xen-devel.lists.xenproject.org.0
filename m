Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1CD1BF9AC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 15:38:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU9N3-0006V1-MA; Thu, 30 Apr 2020 13:36:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLHY=6O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jU9N2-0006Uu-7U
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 13:36:56 +0000
X-Inumbo-ID: a7c6f538-8ae7-11ea-9a4e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7c6f538-8ae7-11ea-9a4e-12813bfff9fa;
 Thu, 30 Apr 2020 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588253815;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tKHTrswLZqWU3bWqcbH3P8MMvB8kyTpecbbl/gntUO0=;
 b=KnwXkBykeIlEWHRQvepS7cDMOjF/FKQrZ57H215alZDdaboRoZApI+Hc
 6I4gQCgsIVdGhWwIHxLNEdNZvzKQcLzFh2IuH0ow8MmuzZZK5q4icsVgj
 UpPdN9uIVLaQQiZCyjEI76MtXKgPaSXHM0S9WLolyacEKXYtRaDexjNTL Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J4vXe4bX9qcPev/7haIPJkvCvNDM02JO93GIZDG+WVj25KobvXl79siOIpkLu/JVhikakFRBV4
 Thw2N1T2clWjzIsYZQDfwRCkxGINUsVYOXQT92cGIZpHp1jZUHciIHYRW0vXPrGFdOeioykKbS
 cPMKng/8czHOmL7n069LFs/29knDovUgKDfxYNntxWssAQAR6HU3jr6BFH3IYTCGeZlNS27KjV
 jcQNBscdfXNzA4mywFbCkgaYNaO+rhz9nW0mQX5vQeTR9Lb/Oy7bEyE3TNSxOR4NWZCZ1viXfr
 UuI=
X-SBRS: 2.7
X-MesageID: 16494974
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,336,1583211600"; d="scan'208";a="16494974"
Subject: Re: [PATCH] x86/EFI: correct section offsets in mkreloc diagnostics
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <5708d246-694a-424f-0998-261f26ccd118@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <917b9609-56d9-2e63-819f-2ed5e2741025@citrix.com>
Date: Thu, 30 Apr 2020 14:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5708d246-694a-424f-0998-261f26ccd118@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/04/2020 11:24, Jan Beulich wrote:
> These are more helpful if they point at the address where the relocated
> value starts, rather than at the specific byte of the difference.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

