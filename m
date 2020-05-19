Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6221D9914
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 16:12:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb2yT-0001iY-0K; Tue, 19 May 2020 14:12:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGb=7B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jb2yQ-0001iT-Qp
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 14:12:02 +0000
X-Inumbo-ID: a82fd70e-99da-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a82fd70e-99da-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 14:11:39 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n/6oX6cGiOaqDPcC/tFnbraeFQKrlsyekU4Rv4esDDmYTujhncFqwgpA6hhyjYn3AK7AuG2g9c
 Yh4mGtQ8iDC4DyHQ+esxSQp4LrehTvUYsI/MZ5nchtA9PhaZ/yWin9Tx+nNqQYtPKVuIYRtwXf
 +v7tr1/jOVIAUhSw/G3VuwmZ3eKwFoJTvhwYfL8VdbDPFWVUs33NoFrTeQG76kWa6QHweH+geq
 jPlzWLL/2kln+QfGWEZS2JUmHQGZI/wVYjpv681o0U5RFu0w0sWYR1TRibhy00kL74dyAPJbsz
 M/4=
X-SBRS: 2.7
X-MesageID: 18593141
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18593141"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Jan Beulich <jbeulich@suse.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
Date: Tue, 19 May 2020 15:11:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 09:34, Jan Beulich wrote:
> On 18.05.2020 17:38, Andrew Cooper wrote:
>> @@ -1439,6 +1418,18 @@ void do_page_fault(struct cpu_user_regs *regs)
>>      if ( unlikely(fixup_page_fault(addr, regs) != 0) )
>>          return;
>>  
>> +    /*
>> +     * Xen have reserved bits in its pagetables, nor do we permit PV guests to
>> +     * write any.  Such entries would be vulnerable to the L1TF sidechannel.
>> +     *
>> +     * The only logic which intentionally sets reserved bits is the shadow
>> +     * MMIO fastpath (SH_L1E_MMIO_*), which is careful not to be
>> +     * L1TF-vulnerable, and handled via the VMExit #PF intercept path, rather
>> +     * than here.
> What about SH_L1E_MAGIC and sh_l1e_gnp()? The latter gets used by
> _sh_propagate() without visible restriction to HVM.

SH_L1E_MAGIC looks to be redundant with SH_L1E_MMIO_MAGIC. 
sh_l1e_mmio() is the only path which ever creates an entry like that.

sh_l1e_gnp() is a very well hidden use of reserved bits, but surely
can't be used for PV guests, as there doesn't appear to be anything to
turn the resulting fault back into a plain not-present.

> And of course every time I look at this code I wonder how we can
> get away with (quoting a comment) "We store 28 bits of GFN in
> bits 4:32 of the entry." Do we have a hidden restriction
> somewhere guaranteeing that guests won't have (emulated MMIO)
> GFNs above 1Tb when run in shadow mode?

I've raised that several times before.  Its broken.

Given that shadow frames are limited to 44 bits anyway (and not yet
levelled safely in the migration stream), my suggestion for fixing this
was just to use one extra nibble for the extra 4 bits and call it done.

~Andrew

