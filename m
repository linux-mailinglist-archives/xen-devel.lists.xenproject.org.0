Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60BC24866C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k820W-0000nT-Da; Tue, 18 Aug 2020 13:50:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k820U-0000nD-OA
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:50:30 +0000
X-Inumbo-ID: 1fb5d5e7-dde2-4a5a-95ad-5490a8e863be
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fb5d5e7-dde2-4a5a-95ad-5490a8e863be;
 Tue, 18 Aug 2020 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597758629;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9YWLx8O7bGKNVPiZAVfg5B3ynF/H3KjBgWNKABpk8ms=;
 b=H/fdDmSbBK1xstJZ7dhlhfZI+RdyMs96Awd3QCnKd6/43RqQVwajej6+
 9TPsrE2dqHyJ2P8GLCpT78HvgI07BthmZVbfMB12NHw/XmM9v+GI+0bhH
 628sAxRtuh068ZGdCzObmiwFsg6Fz+FZVvNrVc4PyCXN9G4NfO4BT8q5s A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: q2qXaAqcSfgdVZsEZGrjPqSoAB0q0jA/WSBafc+SR00ReBGotJsw3pUYrhZAJTIxyZPe0+wxN6
 31oCF+AWEfUGQ2s/2AZJQIUo75psxvjnQhGhhwUyDusZNPCT3FcSYkYs2Co7bJ9W1NCO/50PEF
 liwdSVcJYHvtPxRo10ONsEAMJHcvUlmWai3ZHONT9mvrjGVFmEwl2Yr3dptolrqccLl1PbdaXv
 CEo3F5qvIr6cZtMB26VDb1uI6gIquNIuUQVkKLstXA21Nj+Ffp3/gM4xxp6u+c0LtWl6D/gITy
 7gc=
X-SBRS: 2.7
X-MesageID: 24753459
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24753459"
Subject: Re: [PATCH 4/8] x86/pv: handle reads to the PAT MSR
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-5-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ce957bd1-a0b7-a68a-68ed-2b6756809779@citrix.com>
Date: Tue, 18 Aug 2020 14:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-5-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> The value in the PAT MSR is part of the ABI between Xen and PV guests,
> and there's no reason to not allow a PV guest to read it.

This is faster than using RDMSR to find the constant.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

(Can fix up on commit)

