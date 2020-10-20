Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08622294060
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 18:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9722.25616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUuNS-0007LT-Oe; Tue, 20 Oct 2020 16:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9722.25616; Tue, 20 Oct 2020 16:20:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUuNS-0007L4-LJ; Tue, 20 Oct 2020 16:20:46 +0000
Received: by outflank-mailman (input) for mailman id 9722;
 Tue, 20 Oct 2020 16:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUuNQ-0007Kz-V6
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 16:20:44 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13b23195-7e38-4067-87d2-de19086ed943;
 Tue, 20 Oct 2020 16:20:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUuNQ-0007Kz-V6
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 16:20:44 +0000
X-Inumbo-ID: 13b23195-7e38-4067-87d2-de19086ed943
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13b23195-7e38-4067-87d2-de19086ed943;
	Tue, 20 Oct 2020 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603210843;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=go9aa7z/q6dnIKw3qSrHR1pu5Z0g28FmdeD2H5ZgtW0=;
  b=J/M/PgAOpIYfQL2srAFOYFA84TOMQ+SOaqbF+zAQdSeZC9Qh7tq8XK+R
   TAUZMaXljqki46bQNcmVq7iSVPZaSCCFHw3MC0cg+xNetE4v2F7C7WZC6
   mCn3VkcL/G/ksVh/YzXTG64YruXWAs8xK/xrmZ9nlG6i5NgHPMB/+9piS
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Osz6V6MPdWnG4N76+1M9Pamg1UsxHFzkJ1FPj/hlSxPpYf3TYTErz2Ww50IUmM1bgg3Y4bLj4a
 d020G8k+TXK02R/bS6ANSaaQpNzA1l0m1avptX0DSHN73bSGZW0lytLZR+T08mgz+OQIbkxVBT
 iteGRlhhXNTTKo1S6KB19YeH3dDJ7xMOyVMGNEB/Vl2pst4GMKb1nlRmaOrGWaDA9Q9Hij0aHC
 pGVgJfyZ/E0SYB3g6qEeIRPHoLDpJHmaiGFGI6OAlVP7QLRQVDe0vdurAperdIgPFUUMOfRtLv
 eXg=
X-SBRS: None
X-MesageID: 29646463
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,397,1596513600"; 
   d="scan'208";a="29646463"
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201020152405.26892-1-andrew.cooper3@citrix.com>
 <a50a19ce-321a-ceef-55e4-95ffbebff59d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c359adee-1826-032b-2d07-c06c545e3b96@citrix.com>
Date: Tue, 20 Oct 2020 17:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a50a19ce-321a-ceef-55e4-95ffbebff59d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 20/10/2020 16:48, Jan Beulich wrote:
> On 20.10.2020 17:24, Andrew Cooper wrote:
>> With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
>> is from Xen's point of view (as the update only affects guest mappings), and
>> the guest is required to flush suitably after making updates.
>>
>> However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
>> writeable pagetables, etc.) is an implementation detail outside of the
>> API/ABI.
>>
>> Changes in the paging structure require invalidations in the linear pagetable
>> range for subsequent accesses into the linear pagetables to access non-stale
>> mappings.  Xen must provide suitable flushing to prevent intermixed guest
>> actions from accidentally accessing/modifying the wrong pagetable.
>>
>> For all L2 and higher modifications, flush the full TLB.  (This could in
>> principle be an order 39 flush starting at LINEAR_PT_VIRT_START, but no such
>> mechanism exists in practice.)
>>
>> As this combines with sync_guest for XPTI L4 "shadowing", replace the
>> sync_guest boolean with flush_flags and accumulate flags.  The sync_guest case
>> now always needs to flush, there is no point trying to exclude the current CPU
>> from the flush mask.  Use pt_owner->dirty_cpumask directly.
> Why is there no point? There's no need for the FLUSH_ROOT_PGTBL
> part of the flushing on the local CPU. The draft you had sent
> earlier looked better in this regard.

This was the area which broke.  It is to do with subtle difference in
the scope of L4 updates.

ROOT_PGTBL needs to resync current (if in use), and be broadcasted if
other references to the pages are found.

The TLB flush needs to be broadcast to the whole domain dirty mask, as
we can't (easily) know if the update was part of the current structure.

~Andrew

