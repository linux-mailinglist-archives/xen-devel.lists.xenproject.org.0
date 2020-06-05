Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B91EFB32
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:25:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDHE-00010G-4Y; Fri, 05 Jun 2020 14:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVi9=7S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jhDHC-00010A-9j
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:24:54 +0000
X-Inumbo-ID: 5285b6fa-a738-11ea-afc6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5285b6fa-a738-11ea-afc6-12813bfff9fa;
 Fri, 05 Jun 2020 14:24:53 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RY+uxOVeYebOuMAokqH+tSQYKTML2T/3cbBs7cY3ALr6XzlIrpRV2LGJ/OreCAYExL7TTqrCVD
 c0PRoqriPfoSDUMFCNo0JY2uL0tmM1YYAFKBFaUWq+VA1kR4yGXMx8b85kcpv7OozUvmW/gAuN
 vfehKIFMpGWOt1LBL9XF7bCqU/I2YGb1nn7ApuLkHN/ATpYp2OUrnw07/evz326jh+kSlBse6o
 BM/oLn2KZGCrlCtOZt8SFUi9weZsg8CjPmtDxe1odoDb5d6EaNHRMNK6TCBboc43Sg0UfBYKD9
 VVg=
X-SBRS: 2.7
X-MesageID: 19680950
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; d="scan'208";a="19680950"
Subject: Re: [PATCH v2] build: fix dependency tracking for preprocessed files
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <df282991-5471-a1a7-143c-cfb1cafab5dd@citrix.com>
Date: Fri, 5 Jun 2020 15:24:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/06/2020 15:22, Jan Beulich wrote:
> While the issue is more general, I noticed that asm-macros.i not getting
> re-generated as needed. This was due to its .*.d file mentioning
> asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
> it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
> dependency tracking files. While there, further avoid open-coding $(CPP)
> and drop the bogus (Arm) / stale (x86) -Ui386.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

