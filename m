Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E6E1C9954
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 20:31:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWlIA-0004vd-DZ; Thu, 07 May 2020 18:30:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWlI8-0004vY-Tl
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 18:30:40 +0000
X-Inumbo-ID: d9f58b2e-9090-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9f58b2e-9090-11ea-b9cf-bc764e2007e4;
 Thu, 07 May 2020 18:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588876239;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Bn0REZY4DYzTaHDC1DeENYqjKeohP8/OFI0dK20j1Oc=;
 b=HKZuls+8XHU5q4eDl8ziOrFPzt57RV5CV0WE19jod/Tzfs19GqJzJ2lK
 Th631Vw0HKaK7mVdk3ZtKFUH+6mgT/IN+xS4iUwQRKwAv/39vV9jPcvlD
 c9C5jX88QJqTbaDXSRUSYvbP+SeaSdg6aYlvsvWT2LFhf/B3VC3UErhL4 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: lTj4GoppG+Sk4bMBahGjFEaeaKNdNtMGKbUjyhZJ9LBdt9ZKgyiTCKUrPWPALdAyDliHWs2Khl
 Ilq65Z6NGBtBqYg/YDsiBmXNL+j2jDLfpPN2KwLzd9BLwMS8L1a2MR2+Wsq0mAPlDAWICe4dbx
 uW6yS7iR/XiC9ATn7Kut1lTflTO9fZ0k+N8L+SyitszhUbu4CbUeN3/ajdkOOj8DxcoDOc6F+A
 +qbajDXyMJ1zhnF5E9dkKa1gjgXrMUXlrj1Tb07RToBVEtyG4tvj3nKiOMGGGXz0DOoAaFmois
 nQo=
X-SBRS: 2.7
X-MesageID: 17696929
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="17696929"
Subject: Re: [PATCH v8 02/12] x86emul: support MOVDIR{I,64B} insns
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <04e52d0a-fcce-eba4-0341-3b8838c0faae@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <37726d04-6fb8-5747-82ae-d206737905cf@citrix.com>
Date: Thu, 7 May 2020 19:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <04e52d0a-fcce-eba4-0341-3b8838c0faae@suse.com>
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

On 05/05/2020 09:13, Jan Beulich wrote:
> Introduce a new blk() hook, paralleling the rmw() one in a certain way,
> but being intended for larger data sizes, and hence its HVM intermediate
> handling function doesn't fall back to splitting the operation if the
> requested virtual address can't be mapped.
>
> Note that SDM revision 071 doesn't specify exception behavior for
> ModRM.mod == 0b11; assuming #UD here.

Still stale?  It does #UD on current hardware, and will cease to #UD in
the future when the encoding space gets used for something else.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

