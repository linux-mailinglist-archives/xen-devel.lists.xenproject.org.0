Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45A11B2588
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:06:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQrfp-0007WA-6T; Tue, 21 Apr 2020 12:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BlT=6F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQrfn-0007W4-R4
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:06:43 +0000
X-Inumbo-ID: 9038c62e-83c8-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9038c62e-83c8-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587470802;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=m7bdbXp9cMzUM/xm0bUXvtCsqniWLj+1XboG0CODW/0=;
 b=W7DCUPXb9sVDxjEMHa0gf2PA11bLWNib0ocd2+AzgsJbIgunnE6pA3DN
 RsrOIXnJ5KUZD8yAJAUhS+pkKqJ4gH7hLW8upsJCAlMr0vI4q6yqvxQP1
 kJC3ptFI0jdppM/DZGuut9qbmVguZBhU05ikcvm+3RVTnIa6LC7C9YFHw E=;
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
IronPort-SDR: 0P02j3QqbONlKvcutAPWqJZdrE/2CPFs12A/Ddem9i9YTJRyD605q2losRnp4ilFF582bIc0XT
 aAMKVXLNJsCxM9dduL/RJVylE5uUQP+7KuA6+AkPiO6p9n+a6c5uIPB3sZ/Neb3ii9TSLCsFQh
 Zaarp1QURL16EzQ/nQB5Hs/09qGBfi1ZySW4Sm8mrR04KnouXd0j5Q5/ImdLeUKOHEP00rXw2O
 JLfKGgoVK2DHrMXCT/Ffc2cEEQagXhPgLJRsfZhR26lwceEYrmagokjWRfZLccwcjujgPz91Sj
 iP0=
X-SBRS: 2.7
X-MesageID: 16395615
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16395615"
Subject: Re: [PATCH] x86/shadow: make sh_remove_write_access() helper HVM only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2a339346-ed09-22b6-88fb-6f9d997b10b4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9ac15077-7888-603e-410e-c7d0bc0a9f9d@citrix.com>
Date: Tue, 21 Apr 2020 13:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2a339346-ed09-22b6-88fb-6f9d997b10b4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/04/2020 13:05, Jan Beulich wrote:
> Despite the inline attribute at least some clang versions warn about
> trace_shadow_wrmap_bf() being unused in !HVM builds. Include the helper
> in the #ifdef region.
>
> Fixes: 8b8d011ad868 ("x86/shadow: the guess_wrmap() hook is needed for HVM only")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

