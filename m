Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D54203C81
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:26:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnPGh-0000vo-Kd; Mon, 22 Jun 2020 16:25:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnPGg-0000vh-1W
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:25:58 +0000
X-Inumbo-ID: 0cd64172-b4a5-11ea-beaa-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd64172-b4a5-11ea-beaa-12813bfff9fa;
 Mon, 22 Jun 2020 16:25:57 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JPCS0cf80VYvtfI+8vgub0sN+VBISTRtnfsNXZzckre2EgeRDcSdOil7WWcERMKRmwwpNq2svd
 92QQGK6sXKJkASCg1kpXaaTpmxOHvlOWH+cEvs9n6NtebPFzxuov0oSGVp2mew4pkcOSeou5RO
 Kmd2uzdRPIbcS30yPLOe/9I2clK/8ZJkx9gvoCmMsGM0Q0fNcno+Lypx1dsr0bqM0rQBqPRy1e
 qkdXBs2ISYQWTUThmzaGtVlo1mcDCER2yAi93ckXTgyFf85m/UdPrpStWv/RrgJeYFNNZ2tX+W
 gMg=
X-SBRS: 2.7
X-MesageID: 20639313
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,267,1589256000"; d="scan'208";a="20639313"
Date: Mon, 22 Jun 2020 18:25:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
Message-ID: <20200622162237.GN735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tamas
 K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 06:16:57PM +0200, Jan Beulich wrote:
> On 22.06.2020 18:02, Michał Leszczyński wrote:
> > ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisał(a):
> >> On 22.06.2020 16:35, Michał Leszczyński wrote:
> >>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisał(a):
> > It's also not "many gigabytes". In most use cases a buffer of 16/32/64 MB
> > would suffice, I think.
> 
> But that one such buffer per vCPU, isn't it? Plus these buffers
> need to be physically contiguous, which is an additional possibly
> severe constraint.

FTR, from my reading of the SDM you can use a mode called ToPA where
the buffer is some kind of linked list of tables that map to output
regions. That would be nice, but IMO it should be implemented in a
next iteration after the basic support is in.

Roger.

