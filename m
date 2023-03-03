Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB666A9D95
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 18:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506146.779181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY99H-0004uv-76; Fri, 03 Mar 2023 17:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506146.779181; Fri, 03 Mar 2023 17:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY99H-0004sV-4N; Fri, 03 Mar 2023 17:24:51 +0000
Received: by outflank-mailman (input) for mailman id 506146;
 Fri, 03 Mar 2023 17:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csqk=63=citrix.com=prvs=4196fa7ca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pY99F-0004sP-HT
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 17:24:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a41102c-b9e8-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 18:24:47 +0100 (CET)
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
X-Inumbo-ID: 4a41102c-b9e8-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677864287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OGd1B43vpGlou4isA0dW5MPsOTZUetkoVqF0AbM9xe4=;
  b=R8SjVJw81WlZDoDEPmzfjGw47rEVLucOEHuS6yyDK2fdFfQh5322hXHb
   +EidB4rdUoF0oKIgU+01Gzko3sfBRwDQq+yIF61wlCJr5qo9OP9vtFMro
   fuvz433AYG9ssawqPd+UryUuW0IYSuwuNnjHUodveZ2qTWHLB9678IgT8
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99372835
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xCByFqJUjbAfKFh5FE+R5JUlxSXFcZb7ZxGr2PjKsXjdYENS3zdWz
 TBOUWHSb6neajChf49wbYq2o0tUvZ7UmtFqSABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QRlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c51G1B2s
 vUALAoWfw2IhMzn/+uLVbhz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbFJ4KxBbD+
 woq+UymJDMlbNGtzQan91OunMyXunz1WJ4dQejQGvlC3wTImz175ActfUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpY9U8uMg7bTcjz
 FOOkpXiAjkHmLSNRGiU7Lu8sTK4Mi9TJmgHDRLoViNcvYOl+ttqyEuSEJA6SvXdYsDJ9S/Yw
 Sq7lG83n7Eplt8W3KaVrG+esy39uc2cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6zdWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfUqC25SI55wpUQFKTgCfqG8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo4k2XmHb9NjuN3nUjSIF8/orihknyaPUe2PibJGd/pznPVBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07dDg3wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkgGv2yWbcl3VAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:7uLtTq467OMjUeRsTAPXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.98,231,1673931600"; 
   d="scan'208";a="99372835"
Date: Fri, 3 Mar 2023 17:24:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC XEN PATCH 0/7] automation, RFC prototype, Have GitLab CI
 built its own containers
Message-ID: <ZAItWIy7oUqRmulW@perard>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
 <alpine.DEB.2.22.394.2303021836450.863724@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303021836450.863724@ubuntu-linux-20-04-desktop>

On Thu, Mar 02, 2023 at 06:48:35PM -0800, Stefano Stabellini wrote:
> On Thu, 2 Mar 2023, Anthony PERARD wrote:
> > Patch series available in this git branch:
> > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-auto-rebuild-v1
> > 
> > Hi,
> > 
> > I have done some research to be able to build containers in the CI. This works
> > only for x86 containers as I've setup only a single x86 gitlab-runner to be
> > able to run docker-in-docker.
> > 
> > The runner is setup to only accept jobs from a branch that is "protected" in
> > gitlab. Also, one need credential to push to the container register, those are
> > called "Group deploy tokens", and I've set the variables CI_DEPLOY_USER and
> > CI_DEPLOY_PASSWORD in the project "xen-project/xen" (variables only visible on
> > a pipeline running on a protected branch).
> > 
> > These patch introduce quite a lot of redundancies in jobs, 2 new jobs per
> > containers which build/push containers, and duplicate most of build.yaml.
> > This mean that if we go with this, we have to duplicate and keep in sync many
> > jobs.
> > 
> > To avoid having to do the duplicated jobs by hand, I could look at
> > creating a script that use "build.yaml" as input and produce the 3
> > stages needed to update a container, but that script would need to be
> > run by hand, as gitlab can't really use it, unless ..
> > 
> > I've look at generated pipeline, and they look like this in gitlab:
> >     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/777665738
> > But the result of the generated/child pipeline doesn't seems to be taken into
> > account in the original pipeline, which make me think that we can't use them to
> > generate "build.yaml". But maybe the could be use for generating the pipeline
> > that will update a container.
> > Doc:
> >     https://docs.gitlab.com/ee/ci/pipelines/downstream_pipelines.html#dynamic-child-pipelines
> > 
> > So, with all of this, is it reasonable to test containers before
> > pushing them to production? Or is it to much work? We could simply have jobs
> > tacking care of rebuilding a container and pushing them to production without
> > testing.
> 
> I don't think it is a good idea to duplicate build.yaml, also because
> some of the containers are used in the testing stage too, so an updated
> container could be OK during the build phase and break the testing
> phase. We would need to duplicate both build.yaml and test.yaml, which
> is not feasible.
> 
> In practice today people either:
> 1) re-build a container locally & test it locally before pushing
> 2) re-build a container locally, docker push it, then run a private
>    gitlab pipeline, if it passes send out a patch to xen-devel
> 
> 1) is not affected by this series
> 2) is also not affected because by the time the pipeline is created, the
> container is already updated
> 
> However, there are cases where it would definitely be nice to have a
> "button" to press to update a container. For instance, when a pipeline
> failis due to a Debian unstable apt-get failure, which can be easily fixed
> by updating the Debian unstable container.
> 
> So I think it would be nice to have jobs that can automatically update
> the build containers but I would set them to manually trigger instead of
> automatically (when: manual).

What I was looking at with this work was to be able to have container
been rebuild automatically on a schedule. We have/had containers that
were 3yr old, and when it's a container that supposed to test the lasted
version of a distro, or a rolling release distro, they are kind of
useless if they aren't rebuild regularly. So I was looking to take the
human out of the loop and have computers the tedious work of rebuilding a
container every month or two.

Containers that needs to be rebuilt regularly to stay relevant are
archlinux, debian/unstable, fedora/latest, propably opensuse/leap and
opensuse/tumbleweed. I don't know if they are others.


> Alternatively, we could move the "containers.yaml" stage to be the first
> step, rebuild the containers and push them to a "staging" area
> (registry.gitlab.com/xen-project/xen/staging), run the build and test
> steps fetching from the staging area instead of the regular, if all
> tests pass, then push the containers to
> registry.gitlab.com/xen-project/xen as last step.

Sounds good, I can look into how easily it would be to use a different
registry to run a pipeline.

Cheers,

-- 
Anthony PERARD

