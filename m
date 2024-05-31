Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9268D56C3
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733148.1139257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCprk-0005Wd-1s; Fri, 31 May 2024 00:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733148.1139257; Fri, 31 May 2024 00:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCprj-0005Uv-Va; Fri, 31 May 2024 00:11:27 +0000
Received: by outflank-mailman (input) for mailman id 733148;
 Fri, 31 May 2024 00:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCpri-0004vF-Vw
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 00:11:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f8bfce7-1ee2-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 02:11:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14C04CE1B96;
 Fri, 31 May 2024 00:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749F4C2BBFC;
 Fri, 31 May 2024 00:11:18 +0000 (UTC)
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
X-Inumbo-ID: 4f8bfce7-1ee2-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717114279;
	bh=o05O8CFGXuLnVFy1jNXuWtwoboOu9eskAY6ksrj3EbY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fiKGXBImtUdx2vB0apWlielJ6LmtnEnn5Tw6+nOxXxHPt7WZBGshqI4p+v+0jqmqV
	 OBofDjYoBVi00ukcq1XcRoCANM/QHtvvxYl7CU7HGKGZQ71971tlxXWLx24GWQ/yfs
	 /iPP6fthxzsRL2uxLJfj/R99ev7aSvJiXhq0HvMQVSL/yt1EoWduZsrh8NrzOIBwmI
	 XIVGcYMooGkP91oCqJ33+Lbk3ZqsfV3VsYI5keaOXAo1Bl9rnCFLTu0iT5IdcD0vmX
	 W+lB2pcQg39I/WHvxuLkO+96JM+/o6c8o8vixyQCy2L2Nkc57YlWrAYLN6ol8OnLWr
	 vDQWCiey4VPyg==
Date: Thu, 30 May 2024 17:11:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/3] CI: Use a debug build of Xen for the Xilinx HW
 tests
In-Reply-To: <10676879-e0e4-4332-b8cb-732d56cda818@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405301711050.2557291@ubuntu-linux-20-04-desktop>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com> <20240529141945.41669-3-andrew.cooper3@citrix.com> <10676879-e0e4-4332-b8cb-732d56cda818@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1169749750-1717114278=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1169749750-1717114278=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 May 2024, Michal Orzel wrote:
> Hi Andrew,
> 
> On 29/05/2024 16:19, Andrew Cooper wrote:
> > 
> > 
> > ... like the other hardware tests.  This gets more value out of the testing.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Roger Pau Monné <roger.pau@citrix.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Michal Orzel <michal.orzel@amd.com>
> > CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> >  automation/gitlab-ci/test.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index efd3ad46f08e..e96ccdfad54c 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -149,7 +149,7 @@ xilinx-smoke-dom0less-arm64-gcc:
> >      - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
> >    needs:
> >      - *arm64-test-needs
> > -    - alpine-3.18-gcc-arm64
> > +    - alpine-3.18-gcc-debug-arm64
> This change should be reflected in the name of the test changed (here and below), so that it contains -debug suffix just like every other debug job.
> With that done:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Ops, good catch! I missed it
--8323329-1169749750-1717114278=:2557291--

