Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176796AF695
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 21:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507897.782072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZdoO-0000DQ-Rz; Tue, 07 Mar 2023 20:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507897.782072; Tue, 07 Mar 2023 20:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZdoO-0000AW-P3; Tue, 07 Mar 2023 20:21:28 +0000
Received: by outflank-mailman (input) for mailman id 507897;
 Tue, 07 Mar 2023 20:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLjA=67=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZdoN-00008I-C6
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 20:21:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2ed491e-bd25-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 21:21:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B255AB819C2;
 Tue,  7 Mar 2023 20:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D65C433D2;
 Tue,  7 Mar 2023 20:21:23 +0000 (UTC)
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
X-Inumbo-ID: a2ed491e-bd25-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220484;
	bh=U/pYfYRo9Djrixu9CWArV1jRelEyrYQ0WssXdbHj114=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=clyrzHtXATttoaL2y8EOtOOpO/5PuoV7WMBpf0GlnHSLixdpKW7o1CBy/VRpOZULZ
	 xnEpBI/MC7hHsANhjDgbAm1lPhwy26wzHLY76dD2ybm7jH1UrfA+2pQUNtkzjDnDg5
	 cv71BWZwlUyUYbIWrXueEhutz74y2/Hqpb2s6wGYxhfWtrmD/brb5QcWiUsMyz8Cz6
	 ZUTqt8Qb2Br4z4zwokc4jGKgr/SRtd5Qcv7Kd6o7fTDVfEKzSCeT64Mx9GAg6Am0ze
	 nKsfOtP4JdpPN0EBCt/aO8S0e7WL1IKddyIc7KMzKmy46Kzhm5jQOuU0EyBjo8d5bP
	 IRHg4wJVv51Iw==
Date: Tue, 7 Mar 2023 12:21:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    cardoe@cardoe.com, michal.orzel@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
In-Reply-To: <ZAdWbrW74dcPYhnM@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2303071221110.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop> <20230303235719.1181690-2-sstabellini@kernel.org> <290dec66-c5a5-0609-f95f-7e3bcfd3fc94@citrix.com> <alpine.DEB.2.22.394.2303061450530.863724@ubuntu-linux-20-04-desktop>
 <ZAdWbrW74dcPYhnM@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1775438825-1678220441=:863724"
Content-ID: <alpine.DEB.2.22.394.2303071220440.863724@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1775438825-1678220441=:863724
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303071220441.863724@ubuntu-linux-20-04-desktop>

On Tue, 7 Mar 2023, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 06, 2023 at 03:02:51PM -0800, Stefano Stabellini wrote:
> > On Mon, 6 Mar 2023, Andrew Cooper wrote:
> > > On 03/03/2023 11:57 pm, Stefano Stabellini wrote:
> > > > +  only:
> > > > +    variables:
> > > > +      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> > > 
> > > We don't want to protect every branch of a tree that only a select
> > > number of people can push to,
> > 
> > Actually this is useful, more on this below
> > 
> > 
> > > nor (for this, or others configured with
> > > the runner), want to impose branching conventions on them.
> > > 
> > > In all anticipated cases, those able to push would also be able to
> > > reconfigure the protected-ness of branches, so this doesn't gain us any
> > > security I don't think, but it certainly puts more hoops in the way to
> > > be jumped through.
> > 
> > It is true that it adds a small inconvenience to the user, but I think
> > the benefits outweigh the inconvenience at the moment (that could change
> > though.)
> > 
> > With this, I can register the gitlab runner with a specific gitlab
> > project (for instance
> > https://gitlab.com/xen-project/people/sstabellini/xen) then I can mark
> > all branches as "protected" and select very specific access permissions,
> > e.g. I can give individual access to Julien, Bertrand, Michal, anyone,
> > to specific branches, which is great to allow them to run individual
> > pre-commit tests permanently or temporarily.
> > 
> > I couldn't find another way to do it at the moment, as non-protected
> > branches don't come with detailed access permissions. But it is possible
> > that as we setup a new sub-group under https://gitlab.com/xen-project
> > for people with access to the runner, then we might be able to remove
> > this restriction because it becomes unnecessary. We can remove the
> > protected check at that point.
> 
> You can configure runner to run only jobs from protected branches. This
> way it actually prevent running jobs from non-protected branches. Just a
> condition in .gitlab-ci.yml can be simply removed by anybody who wants
> to abuse your runner (and have push access to non-protected branch -
> which may or may not include all of patchew).

Yes, I did configure the runner only to execute protected jobs. The
$CI_COMMIT_REF_PROTECTED check in automation/gitlab-ci/test.yaml is
needed so that the xilinx job won't be created on pipelines for
non-protected branches where the runner won't run, hence the job has no
chance of completing successfully.

If I don't add the $CI_COMMIT_REF_PROTECTED check, the job will be
created in the pipeline but it will remain stuck as "paused" waiting for
the runner to become available (but the runner never will.)
--8323329-1775438825-1678220441=:863724--

