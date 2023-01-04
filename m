Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6565CB58
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470864.730519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsUc-0007cD-Ml; Wed, 04 Jan 2023 01:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470864.730519; Wed, 04 Jan 2023 01:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsUc-0007aP-Jr; Wed, 04 Jan 2023 01:22:58 +0000
Received: by outflank-mailman (input) for mailman id 470864;
 Wed, 04 Jan 2023 01:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsUb-0007UY-Mp
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:22:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5086befd-8bce-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:22:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EBAB61569;
 Wed,  4 Jan 2023 01:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2062BC433EF;
 Wed,  4 Jan 2023 01:22:53 +0000 (UTC)
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
X-Inumbo-ID: 5086befd-8bce-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672795374;
	bh=HDAcCFD2XNQIAh7QQfIjgmW6fh/8SiYiGhMXClePVhk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UvzSMXNCLqUTxPTOn3i50WPUc3u+G1whb1nhBH/K+q6VDacFkxcUxjRaMyJtYjF5h
	 bgUp80itAkGQFVlzPuq/slGzJ6ymuZq92HsDJi4T1AuosJ0GfVUX8zZKjVTmb56XOJ
	 eBhb6CY82i55K3quh7kKfxCLW1+7W2ZJW/Bd6AyyIDTCrpG9e5v6V1Q5XO98gLbRfS
	 94vDqcem6UK3HrbmSEUgDB/ada8ipFIGnHz3afJg+SgCfPROc6wZUWlQnqZp6/l68R
	 At0ps+ThlZ++SxrW2OFO4mQQqDCwFGs0s+RYUKtb3EpPSmb6lXM40YEaTSLapFlXlI
	 Zb4V1k5plDTHQ==
Date: Tue, 3 Jan 2023 17:22:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
In-Reply-To: <71b7e387-8607-039b-6cb3-8555a1593361@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031722250.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2301031709570.4079@ubuntu-linux-20-04-desktop> <71b7e387-8607-039b-6cb3-8555a1593361@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Jan 2023, Andrew Cooper wrote:
> On 04/01/2023 1:10 am, Stefano Stabellini wrote:
> > On Fri, 30 Dec 2022, Andrew Cooper wrote:
> >> Preserve the artefacts based on the `make` rune we actually ran, rather than
> >> guesswork about which rune we would have run based on other settings.
> >>
> >> Note that the ARM qemu smoke tests depend on finding binaries/xen even from
> >> full builds.  Also that the Jessie-32 containers build tools but not Xen.
> >>
> >> This means the x86_32 builds now store relevant artefacts.  No change in other
> >> configurations.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Doug Goldstein <cardoe@cardoe.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Anthony PERARD <anthony.perard@citrix.com>
> >> CC: Michal Orzel <michal.orzel@amd.com>
> >> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> ---
> >>  automation/scripts/build | 22 ++++++++++++++--------
> >>  1 file changed, 14 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/automation/scripts/build b/automation/scripts/build
> >> index 5dafa72ba540..8dee1cbbc251 100755
> >> --- a/automation/scripts/build
> >> +++ b/automation/scripts/build
> >> @@ -70,18 +70,24 @@ if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
> >>      cfgargs+=("--with-system-seabios=/bin/false")
> >>  fi
> >>  
> >> +# Directory for the artefacts to be dumped into
> >> +mkdir binaries
> >> +
> >>  if [[ "${hypervisor_only}" == "y" ]]; then
> >> +    # Xen-only build
> >>      make -j$(nproc) xen
> >> +
> >> +    # Preserve artefacts
> >> +    cp xen/xen binaries/xen
> >>  else
> >> +    # Full build
> >>      ./configure "${cfgargs[@]}"
> >>      make -j$(nproc) dist
> >> -fi
> >>  
> >> -# Extract artifacts to avoid getting rewritten by customised builds
> >> -mkdir binaries
> >> -if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
> >> -    cp xen/xen binaries/xen
> >> -    if [[ "${hypervisor_only}" != "y" ]]; then
> >> -        cp -r dist binaries/
> >> -    fi
> >> +    # Preserve artefacts
> >> +    # Note: Some smoke tests depending on finding binaries/xen on a full build
> >> +    # even though dist/ contains everything, while some containers don't even
> >> +    # build Xen
> >> +    cp -r dist binaries/
> >> +    if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
> > why the "if" ?
> >
> > You could just:
> >
> > cp xen/xen binaries/xen
> >
> > unconditionally?
> 
> No - the script is `set -e` and xen/xen doesn't exist in the Jessie32
> containers.
> 
> That's why the old logic had an "if not x86_32" guard (except it also
> guarded the regular dist -> binaries/ copy which is problematic).
> 
> At a guess, the other working option would be `cp xen/xen binaries/xen || :`
> 
> I don't much care which of these two gets used, but pretty much anything
> else results in a failed test.

I didn't realize that. I think your version is this patch is better,
keep it as is

