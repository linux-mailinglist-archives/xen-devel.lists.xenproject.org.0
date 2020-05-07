Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2411C9B28
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 21:33:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWmGJ-0001kj-Lk; Thu, 07 May 2020 19:32:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWmGI-0001ke-7u
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 19:32:50 +0000
X-Inumbo-ID: 88904901-9099-11ea-9f6d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88904901-9099-11ea-9f6d-12813bfff9fa;
 Thu, 07 May 2020 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588879968;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=r0Yky+EEud5x4Qlp7k2WR29CxCDqDGb5BK7r8BrVoDs=;
 b=L+PdsM/jHK8EVuD6n96yNF5j30vsBRApmg9JdoT54Yv2dN1abwqm8WDS
 qGIBFqJO6pNl/nwzWf9opkbSSMSdYgqMNPI9wsSnhI6kJ/a7sGdAlTcNv
 ggrsKc1wmKWfSXQKVHGXfGo6NoLy4VYNXLM4eF3ThyvxnbOUJze4k0cve Q=;
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
IronPort-SDR: w/LBYwjt8Y4xr0/Q1IpXNaALAIdfLBt/pGEAug0279zwFvA+/IcRIvVPNqYHn1qlnIoQKz0OWJ
 UC12FGZRY65cTeafzFOZY1sufk+cqvTohY8inlsRwu3WrEXJTh2oEENCqB332ohRbq9LA9VyVw
 by45Mcer2frjZt9Knus7XlkdrKXhgfsJUTroZUdOyt++8XV4odSdeCV38YnA6t2qfUIgivyOf3
 uRdcbAoJR3bmWXrupvq1KrrF7aPq6IAG2wbEP5jo/gI5foqIEZc42u0T2EVzOJ7KlO690XYPDD
 t+M=
X-SBRS: 2.7
X-MesageID: 17386065
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="17386065"
Subject: Re: [PATCH v8 04/12] x86emul: support SERIALIZE
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <0bbbf95e-48ec-ee73-5234-52cf9c6c06d8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <64de91ff-41ae-baf1-1119-0ba39df32275@citrix.com>
Date: Thu, 7 May 2020 20:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0bbbf95e-48ec-ee73-5234-52cf9c6c06d8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
> ... enabling its use by all guest kinds at the same time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> @@ -5660,6 +5661,18 @@ x86_emulate(
>                  goto done;
>              break;
>  
> +        case 0xe8:
> +            switch ( vex.pfx )
> +            {
> +            case vex_none: /* serialize */
> +                host_and_vcpu_must_have(serialize);
> +                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );

There is very little need for an actual implementation here.  The VMExit
to get here is good enough.

The only question is whether pre-unrestricted_guest Intel boxes are
liable to find this in real mode code.

~Andrew

