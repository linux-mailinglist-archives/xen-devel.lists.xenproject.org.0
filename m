Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44BB50857
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 23:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117366.1463493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw65G-00027A-NE; Tue, 09 Sep 2025 21:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117366.1463493; Tue, 09 Sep 2025 21:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw65G-000241-KD; Tue, 09 Sep 2025 21:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1117366;
 Tue, 09 Sep 2025 21:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO0K=3U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uw65F-00023v-0d
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 21:41:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aab51dec-8dc5-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 23:40:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4999141567;
 Tue,  9 Sep 2025 21:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C9AC4CEF4;
 Tue,  9 Sep 2025 21:40:54 +0000 (UTC)
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
X-Inumbo-ID: aab51dec-8dc5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757454055;
	bh=nOhI9cDajzpPCbgqvJnEAb3690mEQOIT7F21OwyyW34=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=irFS9iqiorXLswyGmqcrqrmVl6oj5iY4pRKU0Jv8wSaSlC/GJK9ROZyikHNukMclO
	 KDYhVrJB6ncB1wpLINYcr4OhpwNniEduJr8plVYwaRMiRriT6A+PjwTysbm8rUHXpK
	 ruL0Uufk3vNkjpeN3etxE5mNfq4JAM2sGSF96BIbhj8hryTAv+kGj7USnflFfXBNx9
	 9yPRJecONWK1uSjK11D79yDWlgVrAV10KzSwSSV7bmguQPzFPdV3m7Cqz9kcWHkeQ/
	 9+09l4GsVAh84rKhC2cNyOwAUHi0FPGfI70vOExAKP2w+8VrAZIwigtje4lW0RAC5v
	 NeO3e9AisH5Qw==
Date: Tue, 9 Sep 2025 14:40:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder] Use LOAD_CMD by default if not specified in
 load_file()
In-Reply-To: <0330174b-bda4-44fc-825b-6a680070b9dd@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509091438390.1405870@ubuntu-linux-20-04-desktop>
References: <20250909074141.7356-1-michal.orzel@amd.com> <CAGeoDV8zpHc0Rqmo4Vra5sZSh-mOjsTVPvursqZ42S=4HcRRYg@mail.gmail.com> <0330174b-bda4-44fc-825b-6a680070b9dd@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-325911015-1757454055=:1405870"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-325911015-1757454055=:1405870
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Sep 2025, Orzel, Michal wrote:
> On 09/09/2025 11:22, Mykola Kvach wrote:
> > Hi Michal,
> > 
> > Thank you for the patch and the detailed explanation.
> > 
> > On Tue, Sep 9, 2025 at 10:42 AM Michal Orzel <michal.orzel@amd.com> wrote:
> >>
> >> Commit 061d6782756f modified load_file() to take load command as
> >> argument but did not change all the invocations (e.g. loading standalone
> >> Linux, bitstream, etc.) which broke the output script (load command
> >> empty). Fix it by defaulting to LOAD_CMD if not specified.
> >>
> >> Fixes: 061d6782756f ("Add config option to use separate load commands for Xen, DOM0 and DOMU binaries")
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  scripts/uboot-script-gen | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> >> index 849b8f939e81..4f9261035d73 100755
> >> --- a/scripts/uboot-script-gen
> >> +++ b/scripts/uboot-script-gen
> >> @@ -736,6 +736,12 @@ function load_file()
> >>      local base="$(realpath $PWD)"/
> >>      local relative_path=${absolute_path#"$base"}
> >>
> >> +    # Default to LOAD_CMD if not specified
> >> +    if test -z "${load_cmd}"
> >> +    then
> >> +        load_cmd="${LOAD_CMD}"
> >> +    fi
> >> +
> > 
> > I was wondering if we could use a slightly more concise notation here, like:
> > : "${load_cmd:=$LOAD_CMD}"
> > 
> > It does the same thing but is a bit more idiomatic for Bash scripts.
> Some time ago, Stefano requested me to use a simpler notation in ImageBuilder,
> so that it's immediately clear what the script does. Therefore I followed this
> suggestion here as well. I will let him choose what suits the project best.

I prefer the way Michal wrote it.

This is one of those cases where there is no right or wrong answer.
Mykola's suggestion is a more modern and concise version. The code style
I used was an attempt to be more verbose but also clearer. As always,
when it comes to clarity, each individual finds different approaches
more understandable.
--8323329-325911015-1757454055=:1405870--

