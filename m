Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCF80984C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:02:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650294.1015685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPFX-0006QB-PQ; Fri, 08 Dec 2023 01:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650294.1015685; Fri, 08 Dec 2023 01:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPFX-0006OY-Mf; Fri, 08 Dec 2023 01:01:51 +0000
Received: by outflank-mailman (input) for mailman id 650294;
 Fri, 08 Dec 2023 01:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBPFV-0006OQ-Ro
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:01:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c9f7a64-9565-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 02:01:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB47162230;
 Fri,  8 Dec 2023 01:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72100C433C8;
 Fri,  8 Dec 2023 01:01:45 +0000 (UTC)
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
X-Inumbo-ID: 5c9f7a64-9565-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701997306;
	bh=+Op+MLX4b6ErPrPJ6OE6SL8onuGy3uuY5pHMvE76CD4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FW+90h8mRq8vtW1k89REnvZNo5bZmF+c9saYjQKFGXj/tRw/vru/6AvZ4TUOOevhD
	 oS5xhlxKtjUX5d5v0wukL9uPZ9Gy/FB31yyIazncECB4VNsaED7Cdp3+biT00X4AoT
	 TFQTIh/q8EiDmggqqgZjVHwq/Oyz+bOefrSAnc+8zU7V2YxTKfnN6tCtGW2uoOyxtB
	 yNY5xf2Bygcedh5UlU7Kny8qH8Fa2wiySS88wosK2AHU+J1npH699hFhTt71tM1IE3
	 8klJ/LS7Zp8ojOxVtZZnHfI9bOlvhXDKoI5MIHEakwjxl4ygZWKyXdIarXnYaIBjOD
	 e91TpEnS85otA==
Date: Thu, 7 Dec 2023 17:01:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii <oleksii.kurochko@gmail.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG
 for randconfig
In-Reply-To: <6e435d2b4772e75544e9201bcfbe00e5cf5eab6e.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2312071659210.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>  <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>  <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
 <6e435d2b4772e75544e9201bcfbe00e5cf5eab6e.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1404926384-1701997250=:1265976"
Content-ID: <alpine.DEB.2.22.394.2312071701140.1265976@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1404926384-1701997250=:1265976
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312071701141.1265976@ubuntu-linux-20-04-desktop>

On Thu, 7 Dec 2023, Oleksii wrote:
> On Thu, 2023-12-07 at 20:17 +0000, Andrew Cooper wrote:
> > On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> > > ARCH_FIXED_CONFIG is required in the case of randconfig
> > > and CI for configs that aren't ready or are not
> > > supposed to be implemented for specific architecture.
> > > These configs should always be disabled to prevent randconfig
> > > related tests from failing.
> > > 
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > ---
> > >  xen/Makefile | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/Makefile b/xen/Makefile
> > > index ca571103c8..8ae8fe1480 100644
> > > --- a/xen/Makefile
> > > +++ b/xen/Makefile
> > > @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> > >  # *config targets only - make sure prerequisites are updated, and
> > > descend
> > >  # in tools/kconfig to make the *config target
> > >  
> > > +ARCH_FORCED_CONFIG :=
> > > $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> > > +
> > >  # Create a file for KCONFIG_ALLCONFIG which depends on the
> > > environment.
> > >  # This will be use by kconfig targets
> > > allyesconfig/allmodconfig/allnoconfig/randconfig
> > >  filechk_kconfig_allconfig = \
> > >      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo
> > > 'CONFIG_XSM_FLASK_POLICY=n';) \
> > > -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
> > > +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
> > > +    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat
> > > $(ARCH_FORCED_CONFIG);) ) \
> > >      :
> > >  
> > >  .allconfig.tmp: FORCE
> > 
> > We already have infrastructure for this.  What's wrong with
> > EXTRA_FIXED_RANDCONFIG?
> Everything is fine; I don't know why there was only an issue with
> CONFIG_GRANT_TABLE on PPC. On the RISC-V side, there were more configs
> issues, prompting me to include all the configurations not implemented
> for RISC-V in EXTRA_FIXED_RANDCONFIG. You can find the added
> configurations in this commit:
> https://lore.kernel.org/xen-devel/b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com/#Z31automation:gitlab-ci:build.yaml
> 
> One challenge is that the same configurations need to be added multiple
> times for each build test using randconfig.

That's a lot of extra configs to add. Could you use a yaml anchor or a
.something to include? So that you define the full list only once at the
top of the file and then reuse it everywhere as needed.


> Another reason for this approach is a suggestion from Jan (probably I
> misunderstood it), who proposed using a template to instruct randconfig
> not to modify currently unnecessary configurations. You can find the
> suggestion and discussion here:
> https://lore.kernel.org/xen-devel/008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com/
> 
> Perhaps we could enhance the build script to fetch "fixed" configs from
> the architecture-specific fixed-defconfig instead of modifying the
> Makefile directly.

Sorry I missed the original thread somehow. Please use "automation" as
subject line tag for automation patches.
--8323329-1404926384-1701997250=:1265976--

