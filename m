Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E89B372E6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094978.1450138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqz8r-0004tn-0z; Tue, 26 Aug 2025 19:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094978.1450138; Tue, 26 Aug 2025 19:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqz8q-0004qg-UI; Tue, 26 Aug 2025 19:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1094978;
 Tue, 26 Aug 2025 19:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnfn=3G=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uqz8p-0004q8-U1
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:15:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a2364b8-82b1-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 21:15:34 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8BDA84EE3C0D;
 Tue, 26 Aug 2025 21:15:32 +0200 (CEST)
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
X-Inumbo-ID: 0a2364b8-82b1-11f0-a32c-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756235732;
	b=OSMvDq+iQop8QmgtE2QwYacgeAQ8au8hnngdllHkZnTFamaG6JBwXpuWmelPaauvEFNk
	 VrVXZYTnZ7f3ZrovVbN9z/k+5jNz/0d+JFs04BaAJQzxIDwA1CspQzIwuQTZNDG0Ey/vy
	 OGenF3vsdBfxS3FtsPxhsS/eUiaYJnlXw1hXqXDdZte3beolpvqM8ujM0mbK8nZBoENOP
	 56ZorLlt7PW/JmFfnAdfpCc0GFOIp5UZisMzuRde4YF7Kebf7REcT4fBRSElX+15cX45U
	 QN37nDeAbYeKShu51Z0e8WeID0t7Y9S49SM1zFUyRQPPcKT++QKYrlUatqR40x1BwjKO8
	 C31xGtN7mm7VT25SjZWN83hurQHCJOPOnC0yWQi2TkZ1DRoqA4PqhU6Xx5G39bPHdsGqG
	 epFgf5+GgoTjnPXa6UiiTf2VdEMEPUh6CSGJ1wtCBgkecMZK6Gw7u7TRx0E0tU25OmcGl
	 2COSEWYEyjGh27GIhEF77lYit31EzTTL+0+1GADS8WLwfPeEpgtJ+p8/o9S/cix8lQUwv
	 POdbjJ0qO+iOpdip6qR4UgGTtk4RdIxpO/eAfsXiu+7U0e+OMDhg2TEHu3NRPvHeHOh3L
	 rgluKSwhgXKPt63D9/fMvx1ANGPHgFsPjHeO1V1Z5TPhxirw0nJswUMgbsCLJwA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756235732;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=AaIHmQqbHvgGLPp6UHHU6Lec4UMPyucpeDT3xDGnFYg=;
	b=zx1zNefE8ocDn40AuGfskscVIt/7UkFacRrszldM4edoXbQCEJPaIGOQ08r8/rLoYP6H
	 yYm9uiJfyEEPyhL9mR49J5KGV09QNhBqDeaKADi6XwQKJD3Vy4mQ25dpvhUm/1x49GMIA
	 JcFxJy34GOsxmtP0xErsMHVBuL2AgkqRvUE/y09yQNqbBmqQfLIkn9Jp29vCUpxpPPN8Y
	 54OiRlXI23Orc3jFfTmG/qSq0KHFPYKp9NQu4HanNe16+TrxwHcolfPLt4kSzDCaLIxxG
	 AvluUoK3FjvOJoJbaBImS4KEVKYvCWzeDYkGYVLGkGO6byASXWtQFakcjiysHEJnw3YwD
	 NanxvSwll6G+4WTkYk/kEziYUd0LeEVIV5ywjms3mdgf7ZjZX9hJaV4nIlAPoQFu/GD9S
	 1CGE6mSnaSOB+W3bMdDero+i3O62PEYwggbBQVebiGKF48hoaMutTgS16GQoPPVe2OgMO
	 uDwwonNVTT39UK6lGsYo/x2Wj6hnFhlQVdrgSIRlJm8ID7RASejITq6nO5m3kA3RE04Dy
	 yk3X0pdlDskJ/EvHUN3eCGhAWQ/SOWnArVa/dtS0Z6L4fo1Eo8PE7qJAtGkgQiiLuMzRq
	 OWmk2j582jyBdGkdGPMca3R3JfwPG2D/GlnyTimXtwfxIPetWLqkIoTAB267vds=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756235732; bh=i5c5627eZghBiQ6BnSaC7lH2CtrKVXfm59nnThaOP90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ydLZRhhI8IY+2I81pgHiTkmjwmgWAisIfrwaocLOt4umB9Pk3Jlote3fY7t8xPn/S
	 1qlM+2K6WtnSQdWL8r8ccMHzYmfyVLcQo2pCYMr3YMkL8m+MS6YIV1HNenw/8xWjSA
	 6Nh9UmOxyta8d8yBgLODJdONRpchIiByhujqrmtycG6g4nozUMRyowVQ95bjBNszJb
	 uYmLpMtHZmGSNxu6zF6JGZTUSWe2iUugq7NSWUvwmVsOCkcqYJrEU5xXJtEuuIxgia
	 ZR3n1wpGOCmfEkSMY+rr5FjwMITIS1KeudapocuDJj62sz2jffy5Dkq9pLU69sQpoN
	 RL43o9BGmWEPA==
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 21:15:32 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
In-Reply-To: <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com>
References: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
 <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
 <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com>
Message-ID: <97fe4a398af94ee08a15a586ac4a6b4e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-26 20:07, Dmytro Prokopchuk1 wrote:
> On 8/25/25 13:07, Jan Beulich wrote:
>> On 24.08.2025 16:56, Dmytro Prokopchuk1 wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -97,6 +97,19 @@ Deviations related to MISRA C:2012 Rules:
>>>          Xen expects developers to ensure code remains safe and 
>>> reliable in builds,
>>>          even when debug-only assertions like `ASSERT_UNREACHABLE() 
>>> are removed.
>>> 
>>> +   * - R2.1
>>> +     - The 'BUG()' macro is intentionally used in the 
>>> 'prepare_acpi()' function
>>> +       in specific build configuration (when the config CONFIG_ACPI 
>>> is not
>>> +       defined) to trigger an error if ACPI-related features are 
>>> used incorrectly.
>>> +     - Tagged as `deliberate` for ECLAIR.
>> 
>> With
>> 
>> #define acpi_disabled true
>> 
>> in xen/acpi.h I don't see why we even have that inline stub. When it's 
>> dropped
>> and the declaration left in place without #ifdef CONFIG_ACPI around 
>> it, the
>> compiler will DCE the code (much like we arrange for in many other 
>> places). No
>> deviation needed then.
>> 
>> If such a deviation was to be added, it would need disambiguating. A 
>> function
>> of the given name could appear in x86 as well. That wouldn't be 
>> covered by the
>> Eclair config then, but it would be covered by the text here.
>> 
>>> +   * - R2.1
>>> +     - The 'BUG()' macro is intentionally used in 'gicv3_do_LPI'() 
>>> and
>>> +       'gicv3_its_setup_collection()' functions in specific build 
>>> configuration
>>> +       (when the config CONFIG_HAS_ITS is not defined) to catch and 
>>> prevent any
>>> +       unintended execution of code that should only run when ITS is 
>>> available.
>>> +     - Tagged as `deliberate` for ECLAIR.
>> 
>> I didn't look at this, but I would very much hope that something 
>> similar could
>> be done there as well.
>> 
>> Jan
> 
> After small changes related to prepare_acpi() function, Misra R2.1
> violation has gone. The compiler really does DCE:
> 
>      if ( acpi_disabled <<< this is TRUE )
>      {
>          rc = prepare_dtb_hwdom(d, kinfo);
>          if ( rc < 0 )
>              return rc;
> #ifdef CONFIG_HAS_PCI
>          rc = pci_host_bridge_mappings(d);
> #endif
>      }
>      else
>          rc = prepare_acpi(d, kinfo); <<< DCE
> 
> I will publish it as separate patch.
> Thanks to Jan, I really appreciate his help.
> 
> 
> The situation with functions gicv3_do_LPI(),
> gicv3_its_setup_collection() and config CONFIG_HAS_ITS is little bit
> different.
> The compiler can do DCE in case when config CONFIG_HAS_ITS is "y", and
> Misra R2.1 violation related to these functions also can be resolved.
> Actually, no changes in source code need for that.
> But Eclair detects these violations because config CONFIG_HAS_ITS is
> "n", and source code is really compiled with inline stub functions 
> (with
> BUG() macro).
> This is because config CONFIG_HAS_ITS is "experimental/unsupported"
> 
>      config HAS_ITS
>              bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if
>   UNSUPPORTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> 
> and to enable it need to set additional config: "CONFIG_UNSUPPORTED=y".
> 
> I tried to test it (added "CONFIG_UNSUPPORTED=y" into
> automation/gitlab-ci/analyze.yaml file). You can see my CI pipeline:
> https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_2.1_gicv3_its_host_has_its_v2/ARM64/11144854092/PROJECT.ecd;/by_service.html#service&kind
> 
> Unfortunately, I observed +6 new violations with that additional config
> "CONFIG_UNSUPPORTED=y".
> 
> I don't know how and why these EXTRA_XEN_CONFIG were selected in the
> file 'automation/gitlab-ci/analyze.yaml'. And are we able to add new
> configs here ?....
> 

You'll have to ask Stefano about that, but I doubt at this stage. Those 
set of configs for Arm and X86 has been selected ~2 years ago.

> So, I see the next plan (just from my point of view):
> 1. Add "CONFIG_UNSUPPORTED=y" and resolve new violations.
> 2. Continue with proposed deviation
> 3. ... ?
> 
> Thank you in advance.
> Dmytro.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

