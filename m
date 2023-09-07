Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6859C797DF1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 23:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597633.931874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeMaP-0001BC-UH; Thu, 07 Sep 2023 21:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597633.931874; Thu, 07 Sep 2023 21:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeMaP-00018Q-Qq; Thu, 07 Sep 2023 21:30:49 +0000
Received: by outflank-mailman (input) for mailman id 597633;
 Thu, 07 Sep 2023 21:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qeMaP-000172-34
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 21:30:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cebc74a4-4dc5-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 23:30:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F5E76125E;
 Thu,  7 Sep 2023 21:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2E4C433C7;
 Thu,  7 Sep 2023 21:30:44 +0000 (UTC)
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
X-Inumbo-ID: cebc74a4-4dc5-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694122245;
	bh=SwYxNPn/Kw5sa+SDdClosy4NFn+p95oz2Z6d8Bky08w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TXQArCRXs2/BzqRjlHhpPQqZUjjbrcGejhK9uOaanZiS2mGGOXwjhO0WCUZuLb0H7
	 mOtpurgIDqo2j3Dwu+6C6ptTnvAj7usfvrO1I/rCOLmcfjeAlSTMpZO1RHVP4s5DS1
	 xy84pzn93blENWCVwXRPyBzUX7CNt2+8DV+1WhfpwC2XpgAlgXfI1o4rzWSmg1MZMi
	 MVgxQAl7elhyBLc4oBe/8nfbq0vOkEi6jVWdfdsEi0Q3XlNCiHshxZc42HAG9t/jkz
	 Iq4irs18D6mNoFz4Bpm91AA9WhoBATgHSX9o9P+JSJScwA28jkdNB5JrbiYju+PNBz
	 HSWVqQ+IFYZsA==
Date: Thu, 7 Sep 2023 14:30:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simon Gaiser <simon@invisiblethingslab.com>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <5364a4af-6447-519f-8a2c-bc1c441b374a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309071430350.6458@ubuntu-linux-20-04-desktop>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com> <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com> <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <5364a4af-6447-519f-8a2c-bc1c441b374a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Sep 2023, Jan Beulich wrote:
> On 06.09.2023 22:49, Stefano Stabellini wrote:
> > On Fri, 1 Sep 2023, Jan Beulich wrote:
> >> On 07.08.2023 11:38, Simon Gaiser wrote:
> >>> It seems some firmwares put dummy entries in the ACPI MADT table for non
> >>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
> >>> 0xff. Linux already has code to handle those cases both in
> >>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
> >>> same check to Xen.
> >>>
> >>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
> >>> entries with a valid APIC ID. Linux would still ignore those because
> >>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
> >>> this check is only active for madt_revision >= 5. But since this version
> >>> check seems to be intentionally I leave that alone.
> >>>
> >>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
> >>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
> >>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> >>
> >> This patch was committed with unaddressed review comments. The normal action
> >> in such a case would be to revert, expecting a v2 to arrive. One alternative
> >> here would be a timely incremental patch submission. Another alternative,
> >> considering in particular Thomas's most recent reply, would be to properly
> >> downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry in
> >> CHANGELOG.md).
> > 
> > I am in favor of downgrading physical CPU hotplug support in
> > SUPPORT.md.
> > 
> > I noticed that there is no entry for physical CPU hotplug support in
> > SUPPORT.md today. Should we assume that it is not supported already as
> > it is not listed as supported?
> 
> Hmm, I see
> 
> ## Host hardware support
> 
> ### Physical CPU Hotplug
> 
>     Status, x86: Supported
> 
> pretty close to the top of the file.

Ops, it must have been the case-sensitive search that failed me


> > Specifically, would it be a good idea to add a sentence at the top of
> > the file saying that anything not explicitly listed is not supported?
> 
> Iirc that was the plan to do for 4.18, but then we need to be sure that
> things don't unintentionally become unsupported. I've no clear idea how
> this plan was meant to be carried out, though.

it would be interesting to discuss it again

