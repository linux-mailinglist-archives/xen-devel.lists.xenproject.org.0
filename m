Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FF817F88
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 03:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656480.1024675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFPRx-0006ay-Lj; Tue, 19 Dec 2023 02:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656480.1024675; Tue, 19 Dec 2023 02:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFPRx-0006Yz-J7; Tue, 19 Dec 2023 02:03:13 +0000
Received: by outflank-mailman (input) for mailman id 656480;
 Tue, 19 Dec 2023 02:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFPRw-0006Yt-Fx
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 02:03:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fbea79-9e12-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 03:03:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6CF30CE1410;
 Tue, 19 Dec 2023 02:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C181C433C7;
 Tue, 19 Dec 2023 02:03:03 +0000 (UTC)
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
X-Inumbo-ID: c0fbea79-9e12-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702951384;
	bh=dpgWT01fU4hhboUDI1MXZ5wydri4P15xWeYtybGoqss=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X9MkZ5U3ga9Grza6T1S4GM6kuF4OvzR5sHeKsLKWMOhA/b/Mamy16JUmrkjcONSOQ
	 IKt2jkKgdIl1W7Mg8k50OHE7efBJVj4wGOqJoy/nwpn7J7UeDWzkns9Amh3xryrD/W
	 RZ4uuAYebQsSXZ2sEpUglJMYOK25p53f0HIJxxkNcyU/MbXRBvcC0Uc0StIxmvweIa
	 k7ezK+5WCprX1b/XJWlcBUG5LF2cVtxBBfwCaIFJLIgjf3C+dUOE2B4pgqT338uzBN
	 5Zi2Rzg/QqDx2k0944A6whBNSzOoEVuNDxi88nSEAVlGDserzoDJz3+R6qi7jaXUSh
	 nAeZYrsphX1vA==
Date: Mon, 18 Dec 2023 18:03:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG
 for randconfig
In-Reply-To: <d56aa264-41f2-4cff-97dd-1a222750a389@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312181753160.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com> <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com> <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com> <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
 <95d3e8e9-66d3-4097-b2ed-c808369a08ac@citrix.com> <d56aa264-41f2-4cff-97dd-1a222750a389@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-655612109-1702950853=:3175268"
Content-ID: <alpine.DEB.2.22.394.2312181754260.3175268@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-655612109-1702950853=:3175268
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312181754261.3175268@ubuntu-linux-20-04-desktop>

On Mon, 18 Dec 2023, Jan Beulich wrote:
> On 18.12.2023 17:07, Andrew Cooper wrote:
> > On 11/12/2023 3:56 pm, Jan Beulich wrote:
> >> On 07.12.2023 21:17, Andrew Cooper wrote:
> >>> On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> >>>> ARCH_FIXED_CONFIG is required in the case of randconfig
> >>>> and CI for configs that aren't ready or are not
> >>>> supposed to be implemented for specific architecture.
> >>>> These configs should always be disabled to prevent randconfig
> >>>> related tests from failing.
> >>>>
> >>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>>> ---
> >>>>  xen/Makefile | 5 ++++-
> >>>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/Makefile b/xen/Makefile
> >>>> index ca571103c8..8ae8fe1480 100644
> >>>> --- a/xen/Makefile
> >>>> +++ b/xen/Makefile
> >>>> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> >>>>  # *config targets only - make sure prerequisites are updated, and descend
> >>>>  # in tools/kconfig to make the *config target
> >>>>  
> >>>> +ARCH_FORCED_CONFIG := $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> >>>> +
> >>>>  # Create a file for KCONFIG_ALLCONFIG which depends on the environment.
> >>>>  # This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
> >>>>  filechk_kconfig_allconfig = \
> >>>>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
> >>>> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
> >>>> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
> >>>> +    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat $(ARCH_FORCED_CONFIG);) ) \
> >>>>      :
> >>>>  
> >>>>  .allconfig.tmp: FORCE
> >>> We already have infrastructure for this.  What's wrong with
> >>> EXTRA_FIXED_RANDCONFIG?
> >> What I don't understand here is why dealing with the issue would want
> >> limiting to gitlab-CI. Anyone could run randconfig on their own, and
> >> imo it would be helpful if the same issue(s) could be prevented there,
> >> too. Hence my earlier suggestion to have a snippet which can be used
> >> by "interested" parties. And once dealt with in e.g. the makefile
> >> there should not be a need for any overrides in the CI config anymore.
> > 
> > This is trying to find a solution to a problem which doesn't exist.
> > 
> > RISC-V and PPC are experimental in Xen.  Noone else is going to come and
> > randconfig them until they're rather more production ready, and a
> > prerequisite of that is removing this list of exclusions.
> > 
> > Until you can actually find an interested party to comment, I think this
> > is just churn for no useful improvement.  If nothing else, calling it
> > randomforced.config isn't appropriate given the explanation of what this
> > target is used for...
> 
> "random" in the name can't possibly be right anyway. Such collection of
> fixed settings would also be relevant to e.g. all{yes,no}config. Yet
> that's still not the same as any kind of "default" config, which the
> two architectures presently kind of abuse for the purpose of defining
> required-fixed settings.

One thing for sure, I don't think it would be a good idea to add extra
temporary Kconfig changes like these:

[1] https://lore.kernel.org/xen-devel/cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/d42a34866edc70a12736b5c6976aa1b44b4ebd8a.1701453087.git.oleksii.kurochko@gmail.com/


I agree with Andrew that RISC-V and PPC are experimental so whatever
works to enable them to make progress on this issue with a small effort
is sufficient. I would be happy with a quick respin of this series
following the gitlab-ci approach. This is good enough.

And I think that having some sort of fixed seed (seed.config?) for
randconfig would also be fine and potentially more reusable.

But I think Oleksii should go forward with whatever approach he prefers
and he is more comfortable with, as long as it is not [1] and [2].
--8323329-655612109-1702950853=:3175268--

