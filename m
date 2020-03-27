Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968B195866
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 14:53:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpNR-0006p1-F3; Fri, 27 Mar 2020 13:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHpNP-0006ow-Md
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:50:23 +0000
X-Inumbo-ID: e6c96f16-7031-11ea-8993-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6c96f16-7031-11ea-8993-12813bfff9fa;
 Fri, 27 Mar 2020 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585317023;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AfU1+LNWgSXWN6HdSvZWs7ZyBax5efBTGgnWljnsh7w=;
 b=MhD03JJgjrF2NtiG28AkGqpqbGVp1CXFW+6VRrFyeOwRGkHKs9pPhBcD
 OL59xLHrcE3Y20PjfBBiuES5LXKy0l7j7NkiB//z1nMnddsk4EsbKmgcc
 yYN8a9/kyUMzi1X/f+LO8bVhZJFrwbiPBXq9e/Y+Zmt82eF+qXRk0Cvcl s=;
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
IronPort-SDR: AB3pzU3y729pInrop7X51yGUtENPcr4Fm9cPbWKwqaFYvSIHAFQSrQIASSCADQMl4GRitWY0Xk
 FxGXeuZS/aEZpQY+1yB4Jrchozo2DLIcQ9YXQbldYoSsEb+quNIZYGUHdBbnTVzI1Kbni6MW9a
 pYdDSsPClIbqYOaFZDjbWRkDteMXyNRaaQScBnzbMfCeUU+K4jG05KHB27/GdiQ2gnbYhxlrY6
 sptmv8gu0u0Qu1K6CgucJqj3lJAAlb36QYZMe4c0p21WKXdN14gxqX4BUpfICF/EAvhjk7Vk2P
 Cto=
X-SBRS: 2.7
X-MesageID: 14739770
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14739770"
To: Dario Faggioli <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
References: <158524374263.32448.13098482060302794023.stgit@Palanthas>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3e6adbd8-c255-3455-2089-3233d5069b96@citrix.com>
Date: Fri, 27 Mar 2020 13:50:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158524374263.32448.13098482060302794023.stgit@Palanthas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] automation: update openSUSE Tumbleweed
 building dependencies
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
Cc: Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 17:29, Dario Faggioli wrote:
> We need python3 (and the respective -devel package), these days.
>
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Doug Goldstein <cardoe@cardoe.com>
> ---
>  .../build/suse/opensuse-tumbleweed.dockerfile      |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 2676a87c85..e80d773a79 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -54,8 +54,8 @@ RUN zypper install -y --no-recommends \
>          pandoc \
>          patch \
>          pkg-config \
> -        python \
> -        python-devel \
> +        python3 \
> +        python3-devel \

These containers get used for older Xen branches as well, so you
generally can't take deps out like this (Until we stop building the
oldest branches which need the dependency).

Will tumbleweed cope with both packages installed concurrently?

~Andrew

