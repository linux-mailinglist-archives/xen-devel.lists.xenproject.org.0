Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED2A9983A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 20:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965182.1355822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7fJd-0006jF-8W; Wed, 23 Apr 2025 18:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965182.1355822; Wed, 23 Apr 2025 18:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7fJd-0006hB-61; Wed, 23 Apr 2025 18:59:25 +0000
Received: by outflank-mailman (input) for mailman id 965182;
 Wed, 23 Apr 2025 18:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUzE=XJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u7fJa-0006h5-Vh
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 18:59:23 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1b9666-2075-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 20:59:20 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745434745049964.6327896254859;
 Wed, 23 Apr 2025 11:59:05 -0700 (PDT)
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
X-Inumbo-ID: 0f1b9666-2075-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745434748; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JO2jUlYYsLOr9jDPLK1CESCTAuQhGnkCQWj4ayIxJqoB8nKCrlWizLsbi2jtGfH2iqa62nx52mTGockjlKmNbYZK0vvPTEo+IkpllbXJ+z55JCv4+dryQtr9SkGVW0bQZI7gc4u2Rd3g2nb2Ib6C1ifmgSJd+xPsNNL8Dvm5NyI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745434748; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t3URwDPujiqFvfPeLPUB47AxMqRO5A7Ca2XFEvvTeg4=; 
	b=dRZapdQTQirCcMUW1XtSP9jGe6MkBKMWaVaJSkipVAiZzFRIAuEY88j+sbENHSzZwpYSsoqRZ1L2r44a7Mln8depWPzG4a2D86oVtEs6tAezHM+VXvPItV57A/m2RfHCHwNSaFZCcFGHgVEymoZSwAc73Wl++55Q5Jn7lmUII+U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745434748;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t3URwDPujiqFvfPeLPUB47AxMqRO5A7Ca2XFEvvTeg4=;
	b=BvzHuFxI0W4DOUoNOm0f/+29DqKwAttlgOLTkMVM43FUL7Miar+id0zOqASmuEKq
	7Avf9xqV4hLYLtXxpKe5pJBg0XYN6s4SZ2oSOG4an/HatWpFH1q7LyaH39XKP7Rjc2T
	T7nkh3FwCKpNUh2Zx7EMQ4Bs64hIXDlO5MIGChjM=
Message-ID: <c2940798-11d0-4aaa-a013-64bef9bbdb82@apertussolutions.com>
Date: Wed, 23 Apr 2025 14:59:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
Content-Language: en-US
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/22/25 11:06, Sergii Dmytruk wrote:
> The aim of the [TrenchBoot] project is to provide an implementation of
> DRTM that is generic enough to cover various use cases:
>   - Intel TXT and AMD SKINIT on x86 CPUs
>   - legacy and UEFI boot
>   - TPM1.2 and TPM2.0
>   - (in the future) DRTM on Arm CPUs
> 
> DRTM is a version of a measured launch that starts on request rather
> than at the start of a boot cycle.  One of its advantages is in not
> including the firmware in the chain of trust.
> 
> Xen already supports DRTM via [tboot] which targets Intel TXT only.
> tboot employs encapsulates some of the DRTM details within itself while
> with TrenchBoot Xen (or Linux) is meant to be a self-contained payload
> for a TrenchBoot-enabled bootloader (think GRUB).  The one exception is
> that UEFI case requires calling back into bootloader to initiate DRTM,
> which is necessary to give Xen a chance of querying all the information
> it needs from the firmware before performing DRTM start.
> 
>  From reading the above tboot might seem like a more abstracted, but the
> reality is that the payload needs to have DRTM-specific knowledge either
> way.  TrenchBoot in principle allows coming up with independent
> implementations of bootloaders and payloads that are compatible with
> each other.
> 
> The "x86/boot: choose AP stack based on APIC ID" patch is shared with
> [Parallelize AP bring-up] series which is required here because Intel
> TXT always releases all APs simultaneously.  The rest of the patches are
> unique.
> 

Sergii,

Thanks so much to you and the team over at 3mdeb for taking the lead on 
getting Secure Launch written for Xen.

One quick comment, Secure Launch will eventually support other 
architectures, and we really should not let the maintenance fall on the 
x86 maintainers, or eventually to "the rest". I would like to suggest 
adding an entry into the MAINTAINERS file for "TrenchBoot Secure Launch" 
and list any new files that are being introduced for Secure Launch. When 
adding the section to MAINTAINERS, I would kindly like to request that 
myself be included as a maintainer and Ross Phillipson as a reviewer.

V/r,
Daniel P. Smith


