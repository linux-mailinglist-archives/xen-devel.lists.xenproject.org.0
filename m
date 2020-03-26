Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49319455B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:23:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHWAb-0000n4-DA; Thu, 26 Mar 2020 17:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHWAZ-0000mx-Ng
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:19:51 +0000
X-Inumbo-ID: 00228df0-6f86-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00228df0-6f86-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585243191;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OXIbmCB/Hp5GVp+nE2P/aNTkGzkkAYbBcj2DPeOtj5E=;
 b=Mq+cbC1971jj/zCrej9AQ1x5hXLJj8x6KyVWdqAQLvnvH5xeZrjuUcAJ
 2Apo/ail5uqYfLD57pjRi9RlEtBJLE488FsxIHtYSHMuk1WoDRgAYFIhy
 bWKEFJvuyluxPxJ4VMYeyDlU92f9RgdJ9XxCX80xVfpxyhzv6XxXTMFkN I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tCd9E83hgAVAbg0K1fs26RJDNZlFlo6DTfOXYCgV1AvlGUXby0xmAwPYjsRRvO0CXLr2sXVLs2
 O3hm1BxHRCJJWec4xxWDFTa8CBN8OzlRv2AMiMFtuCszB7cl6FLMLisGo6Rx1Yzwv1Fod/iK6n
 5szcOnetRg2R1CE1rRjKNBKbLbhrJpfrhRSzQNqCYfNk0ifjwhT2byzK7uf1EBHvn/xPaPhLn0
 DgruX0lPRaYNj1sorcnWOuonn+lxo+J0kf2Dx4+whgVOTy5baQ5plgNXljHUhepk/BrJoRJIgP
 Dhs=
X-SBRS: 2.7
X-MesageID: 15032482
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,309,1580792400"; d="scan'208";a="15032482"
To: Dario Faggioli <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
References: <158524305235.31663.14043511848631384508.stgit@Palanthas>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f4ab2fd8-8644-cb2b-1f9e-450804eafdc6@citrix.com>
Date: Thu, 26 Mar 2020 17:19:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158524305235.31663.14043511848631384508.stgit@Palanthas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen: x86: make init_intel_cacheinfo() void.
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 17:17, Dario Faggioli wrote:
> It seems that we took this code from Linux, back when the function was
> 'unsigned int' and the return value was used.
>
> But we are currently not doing anything with such value, so let's get
> rid of it and make the function void. As an anecdote, that's pretty much
> the same that happened in Linux as, since commit 807e9bc8e2fe6 ("x86/CPU:
> Move cpu_detect_cache_sizes() into init_intel_cacheinfo()") the function
> is void there too.
>
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Furthermore, Shanghai already uses this in its form.

