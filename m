Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9BB375B6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 01:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095329.1450386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3Rl-0001Te-L0; Tue, 26 Aug 2025 23:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095329.1450386; Tue, 26 Aug 2025 23:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur3Rl-0001Qt-Hr; Tue, 26 Aug 2025 23:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1095329;
 Tue, 26 Aug 2025 23:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAYs=3G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ur3Rk-0001QL-2T
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 23:51:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a078be4-82d7-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 01:51:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F30B4170E;
 Tue, 26 Aug 2025 23:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F0FC4CEF1;
 Tue, 26 Aug 2025 23:51:07 +0000 (UTC)
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
X-Inumbo-ID: 8a078be4-82d7-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756252268;
	bh=VvrEyNpb1mSnN/cwitu39pu8cQDWyuQkLueP718y3SM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KsqbCSS32wtyFBthAhyfLqBKKo3QyEUI84PL1Orjoj3NYjikHmJbsP8iJZo1LPSI4
	 QvyEWAqnPVmT3QqIPjGuVclaOQMsktXQtGWPMBDRk3IDosNJhBRVBmIqYFUYlALyWY
	 CGbvdO3PbeV0q70He1kJ8BdTds5xj5FUkxSwv63MbbcI5KrhVcT63qqfSdk3J4TGvy
	 +b4TNhF/yHwF3wrjWIHbHi5VyYj1KQXP+6oWQxn7MxdqWD9ExxdL5cwHQF6kswCxyG
	 nhlWwpSpii34BxZdTWHAk52uXdVSUXwKiPw6eaqLNImug1cCddSrWp7JR4ouxyHafy
	 3sZXUxaDdzXLg==
Date: Tue, 26 Aug 2025 16:51:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
In-Reply-To: <97fe4a398af94ee08a15a586ac4a6b4e@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2508261648590.3391208@ubuntu-linux-20-04-desktop>
References: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com> <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com> <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com> <97fe4a398af94ee08a15a586ac4a6b4e@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Aug 2025, Nicola Vetrini wrote:
> On 2025-08-26 20:07, Dmytro Prokopchuk1 wrote:
> > On 8/25/25 13:07, Jan Beulich wrote:
> > > On 24.08.2025 16:56, Dmytro Prokopchuk1 wrote:
> > > > --- a/docs/misra/deviations.rst
> > > > +++ b/docs/misra/deviations.rst
> > > > @@ -97,6 +97,19 @@ Deviations related to MISRA C:2012 Rules:
> > > >          Xen expects developers to ensure code remains safe and reliable
> > > > in builds,
> > > >          even when debug-only assertions like `ASSERT_UNREACHABLE() are
> > > > removed.
> > > > 
> > > > +   * - R2.1
> > > > +     - The 'BUG()' macro is intentionally used in the 'prepare_acpi()'
> > > > function
> > > > +       in specific build configuration (when the config CONFIG_ACPI is
> > > > not
> > > > +       defined) to trigger an error if ACPI-related features are used
> > > > incorrectly.
> > > > +     - Tagged as `deliberate` for ECLAIR.
> > > 
> > > With
> > > 
> > > #define acpi_disabled true
> > > 
> > > in xen/acpi.h I don't see why we even have that inline stub. When it's
> > > dropped
> > > and the declaration left in place without #ifdef CONFIG_ACPI around it,
> > > the
> > > compiler will DCE the code (much like we arrange for in many other
> > > places). No
> > > deviation needed then.
> > > 
> > > If such a deviation was to be added, it would need disambiguating. A
> > > function
> > > of the given name could appear in x86 as well. That wouldn't be covered by
> > > the
> > > Eclair config then, but it would be covered by the text here.
> > > 
> > > > +   * - R2.1
> > > > +     - The 'BUG()' macro is intentionally used in 'gicv3_do_LPI'() and
> > > > +       'gicv3_its_setup_collection()' functions in specific build
> > > > configuration
> > > > +       (when the config CONFIG_HAS_ITS is not defined) to catch and
> > > > prevent any
> > > > +       unintended execution of code that should only run when ITS is
> > > > available.
> > > > +     - Tagged as `deliberate` for ECLAIR.
> > > 
> > > I didn't look at this, but I would very much hope that something similar
> > > could
> > > be done there as well.
> > > 
> > > Jan
> > 
> > After small changes related to prepare_acpi() function, Misra R2.1
> > violation has gone. The compiler really does DCE:
> > 
> >      if ( acpi_disabled <<< this is TRUE )
> >      {
> >          rc = prepare_dtb_hwdom(d, kinfo);
> >          if ( rc < 0 )
> >              return rc;
> > #ifdef CONFIG_HAS_PCI
> >          rc = pci_host_bridge_mappings(d);
> > #endif
> >      }
> >      else
> >          rc = prepare_acpi(d, kinfo); <<< DCE
> > 
> > I will publish it as separate patch.
> > Thanks to Jan, I really appreciate his help.
> > 
> > 
> > The situation with functions gicv3_do_LPI(),
> > gicv3_its_setup_collection() and config CONFIG_HAS_ITS is little bit
> > different.
> > The compiler can do DCE in case when config CONFIG_HAS_ITS is "y", and
> > Misra R2.1 violation related to these functions also can be resolved.
> > Actually, no changes in source code need for that.
> > But Eclair detects these violations because config CONFIG_HAS_ITS is
> > "n", and source code is really compiled with inline stub functions (with
> > BUG() macro).
> > This is because config CONFIG_HAS_ITS is "experimental/unsupported"
> > 
> >      config HAS_ITS
> >              bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if
> >   UNSUPPORTED
> >          depends on GICV3 && !NEW_VGIC && !ARM_32
> > 
> > and to enable it need to set additional config: "CONFIG_UNSUPPORTED=y".
> > 
> > I tried to test it (added "CONFIG_UNSUPPORTED=y" into
> > automation/gitlab-ci/analyze.yaml file). You can see my CI pipeline:
> > https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_2.1_gicv3_its_host_has_its_v2/ARM64/11144854092/PROJECT.ecd;/by_service.html#service&kind
> > 
> > Unfortunately, I observed +6 new violations with that additional config
> > "CONFIG_UNSUPPORTED=y".
> > 
> > I don't know how and why these EXTRA_XEN_CONFIG were selected in the
> > file 'automation/gitlab-ci/analyze.yaml'. And are we able to add new
> > configs here ?....
> > 
> 
> You'll have to ask Stefano about that, but I doubt at this stage. Those set of
> configs for Arm and X86 has been selected ~2 years ago.

We have migrated to a new faster ECLAIR runner.

I do not think we should change the existing configuration. If anything,
I would remove options from it rather than add more.

However, we can add additional configurations by creating more ECLAIR
jobs, and thanks to the new runner we should be able to keep up.

