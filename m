Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FE19A667
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 09:42:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJXy1-0002kq-5t; Wed, 01 Apr 2020 07:39:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eFaW=5R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jJXy0-0002kl-7B
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 07:39:16 +0000
X-Inumbo-ID: e23dfd1e-73eb-11ea-ba7a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e23dfd1e-73eb-11ea-ba7a-12813bfff9fa;
 Wed, 01 Apr 2020 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585726755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B2kL9Gj6O9Eb6I+ziPIH8mw/albicz9XnjAC/g5MjjE=;
 b=hXxqNuCATN7kbvFt3maw1Zc8Xwt7sPHmlK1xirwf/YHI0WR8Z995pLJh
 xmVj/Ba+ZM1zfsLAR8VeEQbtp6rpAqLP/pQDSjIL6XgS4OeQcNfTChBUh
 A2wpEsPA/D/+0R8rEyfkOlsjTvk0nP9DKLzaEcKRh8gmzmD80Ly+sa4CN k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YZog0+0x+O0uPFrHyHbCLFoH4WV+bDm6NPGv5uZTci+X+gjWKrIcOHQ7hRRUMbbtcpyc1DXg6k
 QtfByZ6rV5RjZfLBey4fIGeQh4CioUG+o/HhfeOZ8Smo4TGnKsrze5LkZKPH9epx/UujmtWeR8
 E/hx4B/FnbDpyApCKEuIvgk9V6Y0wGNYhdmmqhNUawE+2fQf+iJF/tdzNWuoP7Uwp1aC8HmEra
 dRMKO5r0Ic+2txnfo2iRucXBdQtAj1uCZBRTrENXIX+geAywF7ocwSfnGu+TC+3Y16T8+tZXOa
 j9o=
X-SBRS: 2.7
X-MesageID: 14994316
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,330,1580792400"; d="scan'208";a="14994316"
Date: Wed, 1 Apr 2020 09:39:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [linux-5.4 test] 149244: regressions - FAIL
Message-ID: <20200401073905.GV28601@Air-de-Roger>
References: <osstest-149244-mainreport@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <osstest-149244-mainreport@xen.org>
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 01, 2020 at 06:45:56AM +0000, osstest service owner wrote:
> flight 149244 linux-5.4 real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/149244/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail REGR. vs. 146121

I cannot see anything obviously wrong on the logs, so I'm trying to
get hold on one of the elbling boxes in order to repro.

Roger.

