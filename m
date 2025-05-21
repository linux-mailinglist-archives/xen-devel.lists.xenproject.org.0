Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C03ABF957
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992091.1375870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlPz-0005QG-HK; Wed, 21 May 2025 15:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992091.1375870; Wed, 21 May 2025 15:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlPz-0005Nu-EE; Wed, 21 May 2025 15:31:43 +0000
Received: by outflank-mailman (input) for mailman id 992091;
 Wed, 21 May 2025 15:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvEX=YF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uHlPy-0005No-6X
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:31:42 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed1fce8-3658-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 17:31:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747841490516469.7242626446938;
 Wed, 21 May 2025 08:31:30 -0700 (PDT)
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
X-Inumbo-ID: aed1fce8-3658-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1747841491; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KzOdOSMBCdMezfTPObSsnAeWmoPx1HgeenyuFmbqPRQg96Xs2eGz3OZdRVCPtyiEqjIGPBd8VvQGNuWxR+mxINB9Bx8ueq+GKls8uARaz5nbqCyM2DMZe9Ep30Qy2/8h/uLjrnNTve8xicXECq81XiRKnrWyhuySiKf8C2ntUlg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747841491; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k9zwI5bASVGJQ3uKxIsfubGuwhDLMhp3SxVDuBTuMHg=; 
	b=FSnmNFSUylVKjs14VpStWvcOGtx7GdwL24YLbLBS702K3gs6/0/XOR5z34bvCFcXBHPjoMF/pIadrg9h6y9Rr03MIQC26bcYrk3rFg2nx2i0R0znf4dLJ6ceKNH6syB9jKeaUH13lzEegdwbJnQfmMYSY5vvZ4L+tXuKA8x5mM0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747841491;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=k9zwI5bASVGJQ3uKxIsfubGuwhDLMhp3SxVDuBTuMHg=;
	b=hdWMgyhU0Do++cu74BkM7qypjQKxyZ++mEnHjd4o5Xub90jBV1sjAq780w+voDQ8
	wD7h1iKcLDlCl/BqHy6M/c7t6+a13gkal732oTi2f8XvI2bKIhxnHivBV3BJLvEy2PQ
	t8l8OtvwDsJg36AkdPBvAwQknzxVTfoZ0qCK8LS4=
Message-ID: <958f591f-35ac-4a10-93e2-9301ccfc5353@apertussolutions.com>
Date: Wed, 21 May 2025 11:31:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hyperlaunch/dom0less code sharing
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Jason Andryuk <jason.andryuk@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/21/25 10:35, Alejandro Vallejo wrote:
> Hi,
> 
> (There's a TL;DR at the end)
> 
> While working on preparing and reworking the hyperlaunch series for
> upstreaming it's slowly becoming apparent the degree of duplication with
> dom0less.

Yes, this was by design so that when we got to the point of convergence 
it would be apparent where the commonalities are and thus be collapsed.

> Oleksii's latest effort to move all that code into common[*] (see
> ad03faa942b9("xen/common: dom0less: make some...) makes this even clearer.
> There are 1:1 relationships for every key data strucutre, and by deviating
> we're overcomplicating the ability to share code.
> 
>    [*] https://lore.kernel.org/xen-devel/cover.1746468003.git.oleksii.kurochko@gmail.com/
> 
>      dom0less           Hyperlaunch
>      ------------------------------
>      kernel_info        boot_domain
>      bootmodule         boot_module
>      bootmodule_kind   bootmod_type
>      membanks                memmap
>      bootinfo             boot_info

If you go back, you will see less of these differences. A lot of the 
variations have been the results of reviewer's request. And that goes to 
the fact that dom0less was developed with Arm mentality in terminology, 
eg. memory banks verse memory map.

> The difficulty in code sharing is not just unfortunate from a vague sense of
> elegance or neatness. Having different code paths parsing the same DT bindings
> means it's a matter of time before x86 and all other Xen ports have different
> bindings, which would would only worsen the situation wrt code sharing and user
> confusion.

Only if we allowed it, but with that said there are subtleties between 
the arch that will require variation. Such as mode, which is primarily 
an x86 specific.

> I've been trying to get _somewhere_ in using parts of dom0less on x86
> and develop a credible PoC that highlights the use of dom0less parsing
> code paths. The results are interesting.
> 
> While I didn't get to a full integration in the hyperlaunch series as I hoped
> due to time constraints I did get far enough to:
> 
>    1. Replace boot_module, boot_domain and bootmod_type with their dom0less
>       counterparts (pending some cleanup).
>    2. Isolate binding parsing code in common/device-tree so it's dettached from
>       the not-so-common dom0less domain building logic in dom0less-build.c
>    3. Do early module kind detection from x86 using code in (2).
>    4. Do late binding parsing also using code in (2) after unflattening the DTB.
> 
> And it works well enough under QEMU to populate boot_info to a first
> approximation. It's missing hyperlaunch-specific bindings (like "domid"
> or "mode"), but that's just a matter of adding them to the already
> existing per-arch binding parser ("mode", maybe, would be a candidate
> for this) or retrofit them in dom0less ("domid" is a very clear
> candidate for this) and integrating in the larger series to be able to
> actually boot domains.
> 
> The PoC does not go all the way due to time constraints, as I said, but
> I think it goes far enough to convince me it's both feasible and
> beneficial to go in this direction rather than that of a full
> reimplementation on x86, specially seeing how Oleksii already aims to
> have full code reuse on riscv.
> 
> A brave new world would reuse all data (including bootinfo) and code
> (bootfdt.c/bootinfo.c), but I couldn't get that far, and I don't think
> I'll be able to in a timely manner. IOW: I compiled-in device-tree.c,
> but NOT bootfdt.c or bootinfo.c, or any of the others. I merely
> extracted from those files the binding parsing bits of interest.
> 
> It'd be nice to use them, but the domain construction logic is just too
> different at present. As for the code I tested with,  I need to do some serious
> cleanup before it's ready for sharing, and even moreso for review, but before I
> go through that I'd like to reach consensus on the following points before
> investing any more of my time working on the side.
> 
> TL;DR:
> 
> I think we should aim to share binding code wherever possible, using common
> datastructures (kernel_info and bootmodule) as dumping ground for the results
> of the binding parsing functions. I seek agreement on the following 3 points
> for the end goal of DTB multidomain boots on x86 before I start slicing
> my hacks into reasonable chunks.
> 
>    1. We want common data structures, with arch-specific fields to hold
>       information from xen,domain DT nodes
>    2. We want to have a single collection of DTB parsers in the code.
>    3. We want to operate on the unflattened DTB for the majority of parsing.
>      (plus a minimal version on the FDT in order to bootstrap, also common)

As for 3, I can repost my original analysis that went to the working 
group on why using this is not the best idea. Doing 3 would require 
doing at least two, if not three passes on the DTB for x86 with zero 
benefit/need since, unlike Arm, we never have to read from it after 
boot. The way the x86 parser is today, we are walking the DTB only once.

What I would suggest for 2 is that, perhaps, it might be an opportune 
time to review the existing DTB parsing code. Providing a common 
interface to parse standard/spec DTB structures regardless if it is 
coming from an FTB or via the FTB index, aka "unflattened" DTB. Doing so 
would enable a complete reuse within the DTB parsers and remove then 
need for 3.


> (2) and (3) are tightly related. There's many reasons for wanting to use the
> unflattened blobs as much as possible. They range from quirks in specific "dtc"
> versions, to complexities parsing phandles, to corner cases involving duplicate
> properties (i.e: due to .dtsi files), etc. Unflattening an FDT brings a
> lots of "maybe-ok-after-sanitising" FDTs back into canonically correct DTs.
> 
> I'll share the PoC code as soon as as it's in a presentable state.
> Hopefully by the end of the week. But I'm sending this ahead of time to
> start collecting thoughts right away.
> 
> So. Thoughts?


v/r,
dps


