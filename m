Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9221F5606
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 15:42:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj0yS-0001lk-PT; Wed, 10 Jun 2020 13:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5j5l=7X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jj0yQ-0001lQ-FT
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 13:40:58 +0000
X-Inumbo-ID: 005fcfe6-ab20-11ea-b441-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 005fcfe6-ab20-11ea-b441-12813bfff9fa;
 Wed, 10 Jun 2020 13:40:52 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mcqXY4eDf3smpv7yilUtFR0V6rTDEP04Yid3QsdysGtdhas2vtoHzBJDiSHuQ3AlLRYLyZaW6F
 huATiSVfbjCIo/vvGpQ9eXOd+aobzD4S3d77Dtw2ff06wHDrxp8kZOaVhFBhh8b0Zn3ONYoxH1
 LGs1LH7qrFCD46St7bdcnLhHYG4Y23vfCc8q3vJWCQp8vAqqKpFWvUErWQCNNqVl++Ra5EZdf+
 SgfsanppFI0KrhqNSdFyr78za3OOBPcsEgncD03ROPay9UdlWzzU7nk6Jcyinug8uog47I7TQF
 EbI=
X-SBRS: 2.7
X-MesageID: 19684861
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="19684861"
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
To: Martin Lucina <martin@lucina.net>, <xen-devel@lists.xenproject.org>,
 <mirageos-devel@lists.xenproject.org>
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
 <20200610132225.GA16839@nodbug.lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <46e87834-bf47-4003-1f32-89a47255155d@citrix.com>
Date: Wed, 10 Jun 2020 14:40:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610132225.GA16839@nodbug.lucina.net>
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

On 10/06/2020 14:22, Martin Lucina wrote:
> On Tuesday, 09.06.2020 at 11:22, Andrew Cooper wrote:
>> There is a little bit of history here...
>>
>> GNTTABOP_setup_table was the original PV way of doing things (specify
>> size as an input, get a list of frames as an output to map), and
>> XENMAPSPACE_grant_table was the original HVM way of doing things (as
>> mapping is the other way around - I specify a GFN which I'd like to turn
>> into a grant table mapping).
>>
>> When grant v2 came along, it was only XENMAPSPACE_grant_table updated to
>> be compatible.  i.e. you have to use XENMAPSPACE_grant_table to map the
>> status frames even if you used GNTTABOP_setup_table previously.
>>
>> It is a mistake that GNTTABOP_setup_table was usable in HVM guests to
>> being with.  Returning -1 is necessary to avoid an information leak (the
>> physical address of the frames making up the grant table) which an HVM
>> guest shouldn't, and has no use knowing.
>>
>> An with that note, ARM is extra special because the grant API is
>> specified to use host physical addresses rather than guest physical (at
>> least for dom0, for reasons of there generally not being an IOMMU),
>> which is why it does use the old PV way.
>>
>> It is all a bit of a mess.
> Thanks for explaining, this is helpful.
>
> So, going with the grant v2 ABI, is there a modern equivalent of
> GNTTABOP_get_status_frames? Reading memory.h I'm guessing that it might be
> XENMEM_add_to_physmap with space=XENMAPSPACE_grant_table and
> idx=(XENMAPIDX_grant_table_status + N) where N is the frame I want, but
> this is not explicitly mentioned anywhere and Linux uses the GNTTABOP
> mechanism.
>
> Further to that, what is the format of the grant status frames?
> grant_table.h doesn't have much to say about it.
>
> And lastly, given that I want the v2 grant ABI exclusively, I presume it's
> sufficient to call GNTTABOP_set_version (version=2) first thing and abort
> if it failed? Presumably the default is always v1 at start of day?

What kind of guests are you trying to target here?

Since my reply, I tried to experiment, and I think you're forced to use
GNTTABOP_setup_table/GNTTABOP_get_status_frames for x86 PV guests, and
XENMEM_add_to_physmap for x86 HVM/PVH guests.

You can't depend on version 2 being available.  Its not available for
ARM at all, and may be disabled for security reasons on x86 (there was
some extended fun with transitive grants in the past, and we offered
"totally disable grant v2" as one mitigation).

Use v1 unless you have a specific need to use v2 (transitive grants or
subpage copies, or support for >16TB VMs (HVM) or hosts (PV)).  Amongst
other things, its far more simple to use correctly.  (v2 devolves to
infinite loops to use correctly, because there is no way to do an atomic
option covering both the flags and status entries at the same time.)

If you need to use v2, you must cleanly cope with it not being
available, and fall back to v1.

~Andrew

