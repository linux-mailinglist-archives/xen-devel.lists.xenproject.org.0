Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F67AF5A4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 23:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608537.947078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlFRf-0000dK-F7; Tue, 26 Sep 2023 21:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608537.947078; Tue, 26 Sep 2023 21:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlFRf-0000bS-CH; Tue, 26 Sep 2023 21:18:15 +0000
Received: by outflank-mailman (input) for mailman id 608537;
 Tue, 26 Sep 2023 21:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAuE=FK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlFRd-0000bK-Iu
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 21:18:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31cfe4f8-5cb2-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 23:18:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CBC2614B8;
 Tue, 26 Sep 2023 21:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D696C433BF;
 Tue, 26 Sep 2023 21:18:08 +0000 (UTC)
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
X-Inumbo-ID: 31cfe4f8-5cb2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763089;
	bh=8lgzuo2zOnD44H3Qr1XjRoqV9c6lbudhHO3HMVDASgQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WqPitVzI1sWqljw7ux3gk5u0KQ5TssvyOwQfO5z7hQqI+W+VYvVjN0FsjcqZr9PRY
	 7IBTkbuAv7CPmvGLdHOQrxaW6hwvPH857r9lAU6u1IP+io22VcStFyYDN8hsDbj+cy
	 ecmUtlCTc1qx50M0RV5OubWsYOB47leo3Z9ubAE1N8D0sffktD0wRfVrxR06/JIms9
	 uoNXQLj25KEQGOOxNOKhpBJXWgRJwntG4ThC3T25mqV+l7cLCxgHaPSBqmClfermqY
	 iEPQ8dvyZNot6Lgt8El+X8WcJtsZ8c+h95KBQ1G2iSoPmg1x45SQwtp0sctcu4S4Ed
	 0XBQ07ljCyoCw==
Date: Tue, 26 Sep 2023 14:18:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Shawn Anastasio <sanastasio@raptorengineering.com>, 
    xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/2] automation: Change build script to use arch
 defconfig
In-Reply-To: <0eda179a-2f64-39b3-c604-7aaa3b2659be@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2309261418010.1403502@ubuntu-linux-20-04-desktop>
References: <cover.1695754185.git.sanastasio@raptorengineering.com> <a949070e4730f55ac214e22a3dea92a5cc6ec7fa.1695754185.git.sanastasio@raptorengineering.com> <0eda179a-2f64-39b3-c604-7aaa3b2659be@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-752359079-1695763089=:1403502"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-752359079-1695763089=:1403502
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 26 Sep 2023, Andrew Cooper wrote:
> On 26/09/2023 7:54 pm, Shawn Anastasio wrote:
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index b4edcf010e..19dd9e8270 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
> >      # RANDCONFIG implies HYPERVISOR_ONLY
> >      HYPERVISOR_ONLY="y"
> >  else
> > -    echo "CONFIG_DEBUG=${debug}" > xen/.config
> > +    # Start off with arch's defconfig
> > +    make -C xen defconfig
> > +
> > +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
> > +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
> > +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
> 
> Kconfig is latest-takes precedence, which is why we always append for
> this and the other related options.  There's no need for sed to drop the
> old value.

+1
--8323329-752359079-1695763089=:1403502--

