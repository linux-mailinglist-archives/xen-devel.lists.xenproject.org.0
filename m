Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13F23EFD8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 17:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4434-0002d1-5d; Fri, 07 Aug 2020 15:12:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k4432-0002cw-NC
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 15:12:44 +0000
X-Inumbo-ID: 6e73d427-1216-4706-998b-76718d023b63
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e73d427-1216-4706-998b-76718d023b63;
 Fri, 07 Aug 2020 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596813162;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iWe7U1LSxZC/AETA/35Xuxm0unXNKWryeklFWGAW/5A=;
 b=Mak56FsSH1oyTqFmFDYgQkvPmOIlCozJQLd30r4LNVa1Dgvj+pvf3tjm
 ce+C7ZsJpk30NgeAJlAPg2gzfTxznSR/hky47Ncboy/ptgMzgSxagADwV
 +vvprgmf7Ukb8eyNU9RyuIvyAZGPqG3jKDFOnYIHIJ6Mw4dU1J9S0R139 s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sItmGOFlMv+DnxvJprH98OAaukHpi19xFUrQhHgAVsoiJokVCvfC55M7C+EWKhjd77jrRJdLrv
 3NaT12TvtHyMcv6JKR0+B+WzR1pbqIC1w0xJr1854GNIC9wbumJDtRWpAn0QsHGlEgvFakOcYZ
 v0XWPEHWHxyFml42ssnFzHf6vvRY5oOcIx4oRVLFIg+Bz211OjzASSoqoNIC1krG+UsmUm8Lrs
 gGNs1tFeIp2cYcyoh267I/PqdnnXHwx+YDZsvZA94fIrjF6dB1ulth/POGhrVugU2jCWepCBBr
 oaM=
X-SBRS: 2.7
X-MesageID: 24971644
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24971644"
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Jan Beulich <jbeulich@suse.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
 <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
 <61481966-3052-ebf2-e23b-aac292cd09a1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9a3cd872-bc6c-3113-fdf9-2f80ad8fabce@citrix.com>
Date: Fri, 7 Aug 2020 16:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61481966-3052-ebf2-e23b-aac292cd09a1@suse.com>
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 11:56, Jan Beulich wrote:
> On 06.08.2020 18:16, Andrew Cooper wrote:
>> On 06/08/2020 10:05, Jan Beulich wrote:
>> Can't we remove all of this by having CONFIG_XEN_PE expressed/selectable
>> properly in Kconfig, and gathering all the objects normally, rather than
>> bodging all of common/efi/ through arch/efi/ ?
> _If_ we settle on Kconfig to be allowed to check compiler (and linker)
> features, then yes. This continues to be a pending topic though, so
> the switch can't be made like this at this point in time. (It could be
> made a Kconfig item now - which, when enabled, implies the assertion
> that a capable tool chain is in use.)

I am still of the opinion that nothing needs discussing, but you are
obviously not.

Please raise this as a topic and lets discuss it, because it has a
meaningful impacting on a large number of pending series.

~Andrew

