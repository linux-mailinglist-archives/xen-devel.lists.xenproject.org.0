Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7805194117
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:17:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTHh-0007u0-5j; Thu, 26 Mar 2020 14:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHTHg-0007tv-1L
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:15:00 +0000
X-Inumbo-ID: 2ceb226c-6f6c-11ea-bec1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ceb226c-6f6c-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585232100;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sVom5Zh6BIgPb1v9Y6FSzPHoNxTptcps9VfN5SY3c1Q=;
 b=MaJoZwpDSJqDhKpVCoQwAwSIxu3HRFCEhAfgBNsRylWSpYtDILoLQppk
 D6Kr+Hx+SF5Tpy3wzp9nr2tF8R6MoWCrXhLlYCNCcYpXu9tP8pgQINNdM
 DsHN6c35BO5+0hmEAJL67O9xVR9E96xLKcQJK4lmkkujV49ykf73y+hGj Y=;
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
IronPort-SDR: mXqRQvIAvR+YDPRx/jn/R8dJNDCjujYLx2TRDK2pv8YKKdOwzU66mfr6T5PoayxQtCdf/HGkuD
 W2inhnTXK+u8aLAAdHDxVEtd0SIejZRQt+Vs/uHWGKsIoUnYws05N2Q2WaMhcpTdnTWkwMXpEj
 q7dAnPv7BvN1bHGlucuvDsnsteWP20O/y2tl6fyFI22CH4X98eno+o+bow8ktbYQilOO52o5MA
 ZzXhr98R2D3SD3qUDN9glXpbJSnYAkJXpUSEVCsytufjZk1vGmR6nRVwwqbTf6pLVVEZYjHIp2
 lSE=
X-SBRS: 2.7
X-MesageID: 14671006
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14671006"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <75c077bc-ecf3-45fe-1a71-0804fe6aaaf4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <24711002-4cd6-02a1-951b-d63cdcbca984@citrix.com>
Date: Thu, 26 Mar 2020 14:14:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <75c077bc-ecf3-45fe-1a71-0804fe6aaaf4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libx86/CPUID: fix (not just) leaf 7
 processing
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/03/2020 12:06, Jan Beulich wrote:
> For one, subleaves within the respective union shouldn't live in
> separate sub-structures.

Oops, and of course this stays hidden right now because there is no
overlap in known bits between subleaf 0 and 1 yet.

> And then x86_cpuid_policy_fill_native() should,
> as it did originally, iterate over all subleaves here as well as over
> all main leaves.

I was clearly asleep when writing that bugfix.  Again - it says hidden
because our local max_leaves are lower than ~all hardware these days.

>  Switch to using a "<= MIN()"-based approach similar to
> that used in x86_cpuid_copy_to_buffer(). Also follow this for the
> extended main leaves then.
>
> Fixes: 1bd2b750537b ("libx86: Fix 32bit stubdom build of x86_cpuid_policy_fill_native()")
> Fixes: 97e4ebdcd765 ("x86/CPUID: support leaf 7 subleaf 1 / AVX512_BF16")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

