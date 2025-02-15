Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829DA36B6F
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 03:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889297.1298472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj7uw-0005Y1-Ls; Sat, 15 Feb 2025 02:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889297.1298472; Sat, 15 Feb 2025 02:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj7uw-0005WV-Hw; Sat, 15 Feb 2025 02:28:30 +0000
Received: by outflank-mailman (input) for mailman id 889297;
 Sat, 15 Feb 2025 02:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj7uu-0005WN-SV
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 02:28:28 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 889fdace-eb44-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 03:28:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BD837A44C2A;
 Sat, 15 Feb 2025 02:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3ABC4CED1;
 Sat, 15 Feb 2025 02:28:23 +0000 (UTC)
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
X-Inumbo-ID: 889fdace-eb44-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739586504;
	bh=lS5gGLB58tj6THhxLKKgni0jqoYEzvzBNkqQQfXFzBM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TAPu2F2QouXQjDb63isHsHKN/9Qu4513bSIwFwiB9pDfDs7qOyLnmTUg5X5u1Nuua
	 C1uNrheP5Jo4xY+mk94RnGF1AYNhCSgEagNLbaKcrxUxG3U/KQRK/RWp/TNwBoGwls
	 BE64vShWBe7B3hNO0+QrckQGm+LuLlswkw6h0qKPzOCPOu5urrntEJsGvlbayVV15v
	 7mtWFpNaUJ1KSAEEk/MVe6VPVWkTTyfzly4PEOMAnZpQrwpv/UQJbCzWdxNbKpbpi8
	 LwB/eTA/MoviI+qoH0trehdt6TSH2hl9U5QYCpHkmfhhwAzYFm7SHTw5grjDzx9xlr
	 SR1zHDREeG7gQ==
Date: Fri, 14 Feb 2025 18:28:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 3/4] automation: allow selecting individual jobs via
 CI variables
In-Reply-To: <Z6_qe_t46ZHN0DOG@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2502141817490.3858257@ubuntu-linux-20-04-desktop>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com> <53730b7d7120635ce9079b57fc7e25b610569316.1739496480.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2502141627210.3858257@ubuntu-linux-20-04-desktop>
 <Z6_qe_t46ZHN0DOG@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1356861742-1739586155=:3858257"
Content-ID: <alpine.DEB.2.22.394.2502141825520.3858257@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1356861742-1739586155=:3858257
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502141825521.3858257@ubuntu-linux-20-04-desktop>

On Sat, 15 Feb 2025, Marek Marczykowski-Górecki wrote:
> On Fri, Feb 14, 2025 at 04:29:17PM -0800, Stefano Stabellini wrote:
> > On Fri, 14 Feb 2025, Marek Marczykowski-Górecki wrote:
> > > Debugging sometimes involves running specific jobs on different
> > > versions. It's useful to easily avoid running all of the not interesting
> > > ones (for given case) to save both time and CI resources. Doing so used
> > > to require changing the yaml files, usually in several places.
> > > Ease this step by adding SELECTED_JOBS_ONLY variable that takes a regex.
> > > Note that one needs to satisfy job dependencies on their own (for
> > > example if a test job needs a build job, that specific build job
> > > needs to be included too).
> > > 
> > > The variable can be specified via Gitlab web UI when scheduling a
> > > pipeline, but it can be also set when doing git push directly:
> > > 
> > >     git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"
> > > 
> > > More details at https://docs.gitlab.co.jp/ee/user/project/push_options.html
> > > 
> > > The variable needs to include regex for selecting jobs, including
> > > enclosing slashes.
> > 
> > Does it work with a single job like this?
> > 
> > git push -o ci.variable=SELECTED_JOBS_ONLY="job1"
> 
> No, it works with:
> 
>     git push -o ci.variable=SELECTED_JOBS_ONLY="/job1/"
> 
> or rather:
> 
>     git push -o ci.variable=SELECTED_JOBS_ONLY="/^job1$/"
> 
> > If it does, is there any way we could use to automatically whitelist its
> > dependencies too? Because that would be so much easier to use...
> 
> I guess it should be possible to add some extra condition for
> dependencies, like extending rules for alpine-3.18-gcc-debug
> specifically with
> 
>   - if: $SELECTED_JOBS_ONLY && "adl-smoke-x86-64-gcc-debug" =~ $SELECTED_JOBS_ONLY
>     when: always
> 
> (and repeated for other tests depending on this build job)
> 
> But that means dependencies need to be kept in sync manually, in two
> places. The absolute lack of any variables processing (even a simple
> string concatenation...) at this stage of gitlab yaml processing makes
> it challenging to propose any even semi-reasonable solution...

Yeah I agree with you


> On the other hand, if you care about specific test, you can easily get
> its dependencies by either looking at test.yaml, or clicking "show
> depdendencies" in gitlab ui and hovering over the job you want.

I am less sure about this. It becomes a matter of personal taste but if
I need to figure out the dependencies, I prefer to do it with vim, and
if I do that, I can very quickly edit the yaml file deleting all the
unneeded jobs. I can see someone else might instead prefer to write down
the list and setup the regex for SELECTED_JOBS_ONLY.

In an ideal world, we wouldn't need to do that because there would be a
way to do this automatically. Unfortunately it is not the case.

I am OK with this patch, I am sure someone will find it useful. It is
just that its usefulness is limited due to the restrictions we have with
Gitlab.



> > > A coma/space separated list of jobs to select would be friendlier UX,
> > > but unfortunately that is not supported:
> > > https://gitlab.com/gitlab-org/gitlab/-/issues/209904 (note the proposed
> > > workaround doesn't work for job-level CI_JOB_NAME).
> > > On the other hand, the regex is more flexible (one can select for
> > > example all arm32 jobs).
> > > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > > This probably wants documenting beyond this commit message. I don't
> > > think we have any CI-related docs anywhere, do we? Some new file in
> > > docs/misc?
> > 
> > Please add documentation for it. Other than that, I think it could be
> > committed. I would prefer you also added documentation about alternative
> > methods such as removing all the jobs except the ones you care about.
> 
> Do we really want to recommend removing unnecessary jobs, given a better
> option exists now?
> I know https://xkcd.com/1171/, but still...

Not recommend! Only document as a way of explanation.


> > > And also, it's possible to extend web ui for starting pipelines to
> > > include pre-defined variables. I use it in qubes here if you want to
> > > see:
> > > https://gitlab.com/QubesOS/qubes-continuous-integration/-/pipelines/new
> > > Does it make sense to include SELECTED_JOBS_ONLY this way too?
> > > Personally, I'll probably use it via cmdline push only anyway, but I
> > > don't know what workflows other people have.
> > > ---
> > >  automation/gitlab-ci/build.yaml |  6 ++++++
> > >  automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
> > >  2 files changed, 20 insertions(+)
> > > 
> > > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> > > index 35e224366f62..f12de00a164a 100644
> > > --- a/automation/gitlab-ci/build.yaml
> > > +++ b/automation/gitlab-ci/build.yaml
> > > @@ -12,6 +12,12 @@
> > >        - '*/*.log'
> > >      when: always
> > >    needs: []
> > > +  rules:
> > > +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> > > +    when: always
> > > +  - if: $SELECTED_JOBS_ONLY
> > > +    when: never
> > > +  - when: on_success
> > >  
> > >  .gcc-tmpl:
> > >    variables: &gcc
> > > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > > index c21a37933881..93632f1f9204 100644
> > > --- a/automation/gitlab-ci/test.yaml
> > > +++ b/automation/gitlab-ci/test.yaml
> > > @@ -1,6 +1,11 @@
> > >  .test-jobs-common:
> > >    stage: test
> > >    image: ${XEN_REGISTRY}/${CONTAINER}
> > > +  rules:
> > > +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> > > +  - if: $SELECTED_JOBS_ONLY
> > > +    when: never
> > > +  - when: on_success
> > >  
> > >  .arm64-test-needs: &arm64-test-needs
> > >    - alpine-3.18-arm64-rootfs-export
> > > @@ -99,6 +104,9 @@
> > >        - '*.dtb'
> > >      when: always
> > >    rules:
> > > +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> > > +    - if: $SELECTED_JOBS_ONLY
> > > +      when: never
> > >      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> > >    tags:
> > >      - xilinx
> > > @@ -117,6 +125,9 @@
> > >        - '*.log'
> > >      when: always
> > >    rules:
> > > +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> > > +    - if: $SELECTED_JOBS_ONLY
> > > +      when: never
> > >      - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> > >    tags:
> > >      - xilinx
> > > @@ -137,6 +148,9 @@
> > >        - '*.log'
> > >      when: always
> > >    rules:
> > > +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> > > +    - if: $SELECTED_JOBS_ONLY
> > > +      when: never
> > >      - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> > >    tags:
> > >      - qubes-hw2
> > > -- 
> > > git-series 0.9.1
> > > 
--8323329-1356861742-1739586155=:3858257--

