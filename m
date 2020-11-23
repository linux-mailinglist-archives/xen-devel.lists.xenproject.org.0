Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF862C0FE1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34809.66043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEU2-0005WQ-S6; Mon, 23 Nov 2020 16:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34809.66043; Mon, 23 Nov 2020 16:14:30 +0000
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
	id 1khEU2-0005W1-Oo; Mon, 23 Nov 2020 16:14:30 +0000
Received: by outflank-mailman (input) for mailman id 34809;
 Mon, 23 Nov 2020 16:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khEU0-0005Vw-JU
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:14:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b69dc372-cbeb-4cc8-b3fe-d2f9d882f0ae;
 Mon, 23 Nov 2020 16:14:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khEU0-0005Vw-JU
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:14:28 +0000
X-Inumbo-ID: b69dc372-cbeb-4cc8-b3fe-d2f9d882f0ae
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b69dc372-cbeb-4cc8-b3fe-d2f9d882f0ae;
	Mon, 23 Nov 2020 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606148067;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mFjkAR5xlPZJepJuz48GvEajQvwesyj66AWmS6z40oY=;
  b=VWHzCUZIplIZSFwKS0uevGKM0cGUJUhUWU9skbsyVYu8UFtDnOtCs1HR
   3PpjybUm2nGiD6V+pLj64pAfYGUJHJgytx9D8SaiFSxSZDrvG/x8QohyJ
   VY/AoNOmagPQMtqgiZO+7LlUAnDVVf4AfoQSEbr27fpKD9iPvBjw1TWAX
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QB4QenefA4x6DchwyXOHMn3V5uWHRlQfYIbLRrUQovGBujfLnFbOjaTB5xe7fp7ZUVTAqjoT2S
 rl/rzBXr2H/zCHy3DBwQ4hf5/XuU3SZQ3lqVSjOdgfyKXqPlApwrhDOebGkPNVczjKPfq9pWyl
 l6+JWklCfi37AMbbp9cT8KOTIEeoi7AIdRYGxc/DnYqc0F1pRXoBMzMRBB2QsrUAFJ9d4/LVg4
 EihUOHa5wZrBqdiZ1XDTTsAUL92Vf7NZCE6rwaGS3s6c30vYmRjh47qsqBVcxMdoSzdZsEHD4a
 B0I=
X-SBRS: None
X-MesageID: 32101061
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32101061"
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
 <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
 <20201123160752.uzczcxnz5ytvtd46@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe2ec163-c6c7-12d6-0c89-57a238514e25@citrix.com>
Date: Mon, 23 Nov 2020 16:14:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123160752.uzczcxnz5ytvtd46@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 23/11/2020 16:07, Roger Pau Monné wrote:
> On Mon, Nov 23, 2020 at 04:30:05PM +0100, Jan Beulich wrote:
>> On 23.11.2020 16:24, Roger Pau Monné wrote:
>>> On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/acpi/power.c
>>>> +++ b/xen/arch/x86/acpi/power.c
>>>> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
>>>>      if ( state != ACPI_STATE_S3 )
>>>>          return;
>>>>  
>>>> -    wakeup_vector_va = __acpi_map_table(
>>>> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
>>>> -
>>>>      /* TBoot will set resume vector itself (when it is safe to do so). */
>>>>      if ( tboot_in_measured_env() )
>>>>          return;
>>>>  
>>>> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
>>>> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
>>>> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
>>>> +
>>>>      if ( acpi_sinfo.vector_width == 32 )
>>>>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>>>>      else
>>>>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>>>> +
>>>> +    clear_fixmap(FIX_ACPI_END);
>>> Why not use vmap here instead of the fixmap?
>> Considering the S3 path is relatively fragile (as in: we end up
>> breaking it more often than about anything else) I wanted to
>> make as little of a change as possible. Hence I decided to stick
>> to the fixmap use that was (indirectly) used before as well.
> Unless there's a restriction to use the ACPI fixmap entry I would just
> switch to use vmap, as it's used extensively in the code and less
> likely to trigger issues in the future, or else a bunch of other stuff
> would also be broken.
>
> IMO doing the mapping differently here when it's not required will end
> up turning this code more fragile in the long run.

We can't enter S3 at all until dom0 has booted, as one detail has to
come from AML.

Therefore, we're fully up and running by this point, and vmap() will be
fine.

However, why are we re-writing the wakeup vector every time?  Its fixed
by the position of the trampoline, so we'd actually simplify the S3 path
by only setting it up once.

~Andrew

(The fix for fragility is to actually test it, not shy away from making
any change)

