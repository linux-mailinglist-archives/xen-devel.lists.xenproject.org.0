Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEA264778
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMzP-0000Mb-7j; Thu, 10 Sep 2020 13:51:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP7I=CT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGMzO-0000MN-5p
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 13:51:50 +0000
X-Inumbo-ID: 248df837-ddfb-4dbf-8672-756bca2f8c4a
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 248df837-ddfb-4dbf-8672-756bca2f8c4a;
 Thu, 10 Sep 2020 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599745909;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TxJJJc8ne9kYw9e05f9qiHVYMUo1EuX2fTiABEUEDPg=;
 b=Mu3Ng+NZQTFH3SrUV3wvJwsvdjNqLr/wO8bMI3QyiIer6ZiYREFqqzGC
 h2utyaRSlpvn55mWrgBwVTLLbq9PexYfV4sxpdk2mQwHLW29+4d6eQHab
 8Ryx6VQ8Khpe44bSygpWXBmldqhs17vid663xbJeekNrvG0N5UpTxvB8t 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4GyIGLCF4JhovU3x5A2/xZLTMC8bxHJNsb+lRoxTzSJXX+qpw6TFGpXSwFNtjCIrQMTBvDxFJb
 osZJcVsC3Z+mlmEJ0UIDRzCAu0LnJ9sZDiPZgsovA5asF/Q36F3acLFYDs6drNU4rvJy0tZ2oE
 R6zjnpoDKgkOVNliCaTQbozTGjKbmwRUZUzp1/c4TJa6q+6Bxd8YjdYmkxDXIdjyBhoW1FuHH0
 v+ViIC9lKIjRGwt2KGc/LqyICUi8QiYIwJwv2Mn/Gi3L2pQPmLNW3rJ4/xDq+uID7taJvABdK+
 qbk=
X-SBRS: 2.7
X-MesageID: 26384783
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,413,1592884800"; d="scan'208";a="26384783"
Subject: Re: [PATCH 0/6] tools/include: adjustments to the population of xen/
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2d5579e4-74cf-fd35-da7d-a8f4de2c2c86@citrix.com>
Date: Thu, 10 Sep 2020 14:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 10/09/2020 13:09, Jan Beulich wrote:
> While looking at what it would take to move around libelf/
> in the hypervisor subtree, I've run into this rule, which I
> think can do with a few improvements and some simplification.

I realise this might be a controversial move, but can we *please*
address this by removing our use of symlinking, rather than kicking the
problem down the road.

For header files in particular, there is no need to symlink at all. 
Some properly formed -I runes for the compiler will do the right thing,
and avoid all intermediate regeneration issues.

~Andrew

