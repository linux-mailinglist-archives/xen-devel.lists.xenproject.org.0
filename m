Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556C80173C
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 00:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645790.1008138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9CW6-0005gu-08; Fri, 01 Dec 2023 23:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645790.1008138; Fri, 01 Dec 2023 23:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9CW5-0005eD-Tm; Fri, 01 Dec 2023 23:01:49 +0000
Received: by outflank-mailman (input) for mailman id 645790;
 Fri, 01 Dec 2023 23:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7my=HM=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1r9CW4-0005e4-Dc
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 23:01:48 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a1cd2d5-909d-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 00:01:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C65088285496;
 Fri,  1 Dec 2023 17:01:45 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xurLKxvRr7JS; Fri,  1 Dec 2023 17:01:45 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D977282856B0;
 Fri,  1 Dec 2023 17:01:44 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id J6oPcrO6Ab09; Fri,  1 Dec 2023 17:01:44 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A996A8285496;
 Fri,  1 Dec 2023 17:01:44 -0600 (CST)
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
X-Inumbo-ID: 9a1cd2d5-909d-11ee-98e5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D977282856B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701471704; bh=r6B8UVs+UZ/IEmwf7QetgNvELJn57r/q8IdnKxERrFs=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=fO/Mig7pwnig5QRnsSgHplUD460xKgdtIBKuDmTgFxoThJRJLJygZIheCr6CGbsWX
	 g4gGZPKw5JUUjq3bNxIDcv7tDrRDX62+XgT+7QorXxiAla8TJqbHBZ2v+IPA8VMvhx
	 FT0EnswfZtSh8et7na6G1VdeB3/VKAKjjkY1hJns=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Fri, 1 Dec 2023 17:01:44 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Julien Grall <julien@xen.org>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksii <oleksii.kurochko@gmail.com>
Message-ID: <536439989.51518893.1701471704571.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1981531f-a919-4569-9b6b-8f962f9d7cfb@xen.org>
References: <cover.1701384928.git.sanastasio@raptorengineering.com> <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com> <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org> <7e0ea8d9ca0a3a90550eb7b9e65fe86c.squirrel@vali.starlink.edu> <1981531f-a919-4569-9b6b-8f962f9d7cfb@xen.org>
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: xen/ppc: Enable Boot Allocator
Thread-Index: DaF2BIYnhldWCJYJ83PZexzm5UYCqg==



----- Original Message -----
> From: "Julien Grall" <julien@xen.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Shawn Anastasio" <sanastasio@raptorengineering.com>, "xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich"
> <jbeulich@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
> "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Oleksii"
> <oleksii.kurochko@gmail.com>
> Sent: Friday, December 1, 2023 4:35:55 PM
> Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator

> Hi,
> 
> On 01/12/2023 22:10, tpearson@raptorengineering.com wrote:
>>> (+ Arm and RISC-V folks)
>>>
>>> Hi Shawn,
>>>
>>> On 01/12/2023 20:59, Shawn Anastasio wrote:
>>>> Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
>>>> allocator. Routines for parsing arm-specific devicetree nodes (e.g.
>>>> multiboot) were excluded, reducing the overall footprint of code that
>>>> was copied.
>>>
>>> I expect RISC-V to want similar code. I am not really thrilled in the
>>> idea of having 3 similar copy of the parsing. So can we extract the
>>> common bits (or harmonize it) so it can be shared?
>>>
>>> Maybe Oleksii has already a version doing that.
>> 
>> Just my $0.02, but wouldn't it make more sense to have the RISC-V port
>> handle the deduplication, seeing as the POWER support came first here?  We
>> don't know if/when the RISC-V port will be ready for submission, so I'm
>> not sure why we should be on the hook for this particular work.
> 
> That would have been a valid point if you were writing a brand new
> implementation. But this was *copied* from Arm.
> 
> Looking at the diff between arm/bootfdt.c and ppc/bootfdt.c, you seem to
> have:
>    - As well copied some code from arm/setup.c
>    - Re-order some statement (not clear why)
>    - Remove some code which you say are Arm specific. Yet some is part
> of the Device-Tree spec and I would expect to be used in the future.
> 
> So my question here stands. Why are you mainly copying verbatimly the
> Arm code rather than consolidating in one place?

That's fair, with the future RISC-V port removed from the discussion and good reasons still being put forth it makes more sense to deduplicate now.  Thank you for clarifying the objection! :)

