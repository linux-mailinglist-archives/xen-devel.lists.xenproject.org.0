Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF329426D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 20:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9770.25757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUweE-0004FK-0i; Tue, 20 Oct 2020 18:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9770.25757; Tue, 20 Oct 2020 18:46:13 +0000
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
	id 1kUweD-0004Eu-Tb; Tue, 20 Oct 2020 18:46:13 +0000
Received: by outflank-mailman (input) for mailman id 9770;
 Tue, 20 Oct 2020 18:46:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUweC-0004Ep-AA
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 18:46:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05c95d79-f021-4f54-8eb1-f753cc125ad7;
 Tue, 20 Oct 2020 18:46:07 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUweC-0004Ep-AA
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 18:46:12 +0000
X-Inumbo-ID: 05c95d79-f021-4f54-8eb1-f753cc125ad7
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 05c95d79-f021-4f54-8eb1-f753cc125ad7;
	Tue, 20 Oct 2020 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603219568;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wo7w9azPULKlvQIJ7Y/jP3i6QqYtsuiVG3CAvIZ9gac=;
  b=KxKROrWNZjI+Uf+Nkyo7Op2gcmwsapo0FSbHaRuZV7JyBFX36r321yu/
   jFyj/KcKRttfKjb0zLuZDGYLfctmKQECrBvWM9oGOgBEUvO+/7cZIUON0
   ziHtTKcwZMK4rjswcu/5Zx1iG3UFl71ZeDKrKtIAEoj9xX1uV695RjS57
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: z+X/ByM7+eqYJQGmuMfKCkjL/3AomXb9/xzc0yhCt07tJESOqx2KN/GQE8BOdDZq5VHz8TZSfw
 ueLuPaeSeGLh4G4o9GZctARzR5xAEFhB2EDFJfDNEA01yup/psbA9MPau/NAM8Ia5QrNmOmvFL
 PydIBlaqs9xQeZfnj7ySBAh2s43PHqM737MlTGt+SelzS44nLNMLiGimj7/+9lWeJWPHDPSFYy
 jPJ6kmePwh2jaREPAq1IVgQgONJY0BtHYWgJD3kLtN4oLae5chqz0nDvmZt190ZJxWvGo/WWdB
 awc=
X-SBRS: None
X-MesageID: 29394201
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,398,1596513600"; 
   d="scan'208";a="29394201"
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201020152405.26892-1-andrew.cooper3@citrix.com>
 <a50a19ce-321a-ceef-55e4-95ffbebff59d@suse.com>
 <c359adee-1826-032b-2d07-c06c545e3b96@citrix.com>
 <b24c21b0-607b-6add-e156-a37fcf7f2352@citrix.com>
Message-ID: <9b54113c-9df2-2f44-1545-67ffe4831934@citrix.com>
Date: Tue, 20 Oct 2020 19:46:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b24c21b0-607b-6add-e156-a37fcf7f2352@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 20/10/2020 18:10, Andrew Cooper wrote:
> On 20/10/2020 17:20, Andrew Cooper wrote:
>> On 20/10/2020 16:48, Jan Beulich wrote:
>>> On 20.10.2020 17:24, Andrew Cooper wrote:
>>>> With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
>>>> is from Xen's point of view (as the update only affects guest mappings), and
>>>> the guest is required to flush suitably after making updates.
>>>>
>>>> However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
>>>> writeable pagetables, etc.) is an implementation detail outside of the
>>>> API/ABI.
>>>>
>>>> Changes in the paging structure require invalidations in the linear pagetable
>>>> range for subsequent accesses into the linear pagetables to access non-stale
>>>> mappings.  Xen must provide suitable flushing to prevent intermixed guest
>>>> actions from accidentally accessing/modifying the wrong pagetable.
>>>>
>>>> For all L2 and higher modifications, flush the full TLB.  (This could in
>>>> principle be an order 39 flush starting at LINEAR_PT_VIRT_START, but no such
>>>> mechanism exists in practice.)
>>>>
>>>> As this combines with sync_guest for XPTI L4 "shadowing", replace the
>>>> sync_guest boolean with flush_flags and accumulate flags.  The sync_guest case
>>>> now always needs to flush, there is no point trying to exclude the current CPU
>>>> from the flush mask.  Use pt_owner->dirty_cpumask directly.
>>> Why is there no point? There's no need for the FLUSH_ROOT_PGTBL
>>> part of the flushing on the local CPU. The draft you had sent
>>> earlier looked better in this regard.
>> This was the area which broke.  It is to do with subtle difference in
>> the scope of L4 updates.
>>
>> ROOT_PGTBL needs to resync current (if in use), and be broadcasted if
>> other references to the pages are found.
>>
>> The TLB flush needs to be broadcast to the whole domain dirty mask, as
>> we can't (easily) know if the update was part of the current structure.
> Actually - we can know whether an L4 update needs flushing locally or
> not, in exactly the same way as the sync logic currently works.
>
> However, unlike the opencoded get_cpu_info()->root_pgt_changed = true,
> we can't just flush locally for free.
>
> This is quite awkward to express.

And not safe.  Flushes may accumulate from multiple levels in a batch,
and pt_owner may not be equal to current.

I stand by the version submitted as the security fix.

~Andrew

