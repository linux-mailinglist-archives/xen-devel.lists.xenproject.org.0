Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629DC1786D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 01:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152504.1483060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDtxz-0005ls-6c; Wed, 29 Oct 2025 00:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152504.1483060; Wed, 29 Oct 2025 00:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDtxz-0005jT-41; Wed, 29 Oct 2025 00:23:07 +0000
Received: by outflank-mailman (input) for mailman id 1152504;
 Wed, 29 Oct 2025 00:23:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BbVn=5G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vDtxx-0005jN-GA
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 00:23:05 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb884e8-b45d-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 01:23:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 031C9602AC;
 Wed, 29 Oct 2025 00:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FD9C4CEFD;
 Wed, 29 Oct 2025 00:23:00 +0000 (UTC)
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
X-Inumbo-ID: 6eb884e8-b45d-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761697381;
	bh=KmQvgkyZ7pUlwEWTF2JDk6BZlK87DQzw5WlfAH6oTlE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ml31WHY4oyfjLUWh5aeH/3vlJXCS1rMm6btMD4m1lREQe20slveDfeirQklt+nFSo
	 XfvwWV0OuSLrki5HNgWJGMi5yAHSV0ztqEgXxyUixKwUI5LJ6r0B0EY1H9V5Xadeja
	 g1fd6Me+nm0LgfBEm4QxBIZes7og/N55lw0uhl79/2qXvpvIAvXKHg73/c/MeqLsAc
	 RsJJ3BTipI288DRFFRcUrKKsFiUp1+a43NNWjrrXf3WXnPScpOrMRSYmIXLNq3LLko
	 myyyVOL/kLrI4mR3fk2dBDSIWsDa+uaGXMBTZmcEwpcvKAeat0IJaTLr+Es3o9ZU71
	 06CEAP/2yrnqw==
Date: Tue, 28 Oct 2025 17:22:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN PATCH v2] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <f6dbd7a74854cab064cf7ca76c68e44d@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2510281722540.495094@ubuntu-linux-20-04-desktop>
References: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2510271656380.495094@ubuntu-linux-20-04-desktop> <f6dbd7a74854cab064cf7ca76c68e44d@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Oct 2025, Nicola Vetrini wrote:
> On 2025-10-28 00:58, Stefano Stabellini wrote:
> > On Fri, 24 Oct 2025, Nicola Vetrini wrote:
> > > The following analysis jobs are performed:
> > > - eclair-{x86_64,ARM64}: analyze Xen using the default configuration for
> > >   that architecture; runs on runners tagged `eclair-analysis'.
> > > 
> > > - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration for
> > >   safety, which is more restricted; runs on runners tagged
> > >   `eclair-analysis-safety`.
> > > 
> > > - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
> > >   configuration for the purposes of testing new runner updates; runs on
> > >   runners tagged `eclair-analysis-testing`.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Do you have a link to a successful pipeline?
> > 
> > Just making sure we are not breaking things.
> > 
> 
> No; not yet, at least [1]. Without the right tags the safety runner can't pick
> up jobs.
> 
> [1] https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2117835680
> 
> > 
> > > ---
> > > Changes in v2:
> > > - rebased to current staging;
> > > - fixed regex path issue.
> > > ---
> > >  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > > 
> > > diff --git a/automation/gitlab-ci/analyze.yaml
> > > b/automation/gitlab-ci/analyze.yaml
> > > index d50721006740..7bd644d75074 100644
> > > --- a/automation/gitlab-ci/analyze.yaml
> > > +++ b/automation/gitlab-ci/analyze.yaml
> > > @@ -45,6 +45,21 @@ eclair-x86_64:
> > >      LOGFILE: "eclair-x86_64.log"
> > >      VARIANT: "X86_64"
> > >      RULESET: "monitored"
> > > +
> > > +eclair-x86_64-testing:
> > > +  extends: eclair-x86_64
> > > +  tags:
> > > +    - eclair-analysis-testing
> > > +  rules:
> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> > > +      when: always
> > > +    - !reference [.eclair-analysis:triggered, rules]
> > 
> > given that everyone can change this yaml file when pushing to their own
> > branch, I think we should remove this, or (probably better) use a
> > separate env variable to set the default
> > 
> > it is better not to use the path, I think
> > 
> 
> That is a fair concern. One option would be to just use a project runner
> assigned to the people/bugseng/xen subproject, but that might be a bit
> inconvenient if we want to swap runners around.

I think it is OK to register a project runner to people/bugseng/xen. I
am happy with this solution as well.


> Another option, as you said,
> is keeping the regex in a variable, but this wont't prevent rogue
> modifications of the YAML.

I was thinking more of a simpler boolean variable like:

rules:
  - if: $ECLAIR_TESTING

Yes, it wouldn't prevent modifications of the YAML, but it is probably
not an issue? Also, it is not less secure than the path, because the
YAML can be changed by anyone. At least the variable is more flexible
and feels more natural.


> I might have found something runner-side with [2],
> but I need to dig deeper on that one.
> 
> [2] pre_build_script at
> https://docs.gitlab.com/runner/configuration/advanced-configuration/#the-runners-section
>
> > > +eclair-x86_64-safety:
> > > +  extends: eclair-x86_64
> > > +  tags:
> > > +    - eclair-analysis-safety
> > > +  variables:
> > >      EXTRA_XEN_CONFIG: |
> > >        CONFIG_AMD=y
> > >        CONFIG_INTEL=n
> > > @@ -75,6 +90,10 @@ eclair-x86_64:
> > >        CONFIG_DEBUG_LOCKS=n
> > >        CONFIG_SCRUB_DEBUG=n
> > >        CONFIG_XMEM_POOL_POISON=n
> > > +  rules:
> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ &&
> > > $CI_COMMIT_BRANCH =~ /^staging$/
> > > +      when: always
> > > +    - !reference [.eclair-analysis:triggered, rules]
> > 
> > same here
> > 
> > 
> > >  eclair-ARM64:
> > >    extends: .eclair-analysis:triggered
> > > @@ -82,6 +101,21 @@ eclair-ARM64:
> > >      LOGFILE: "eclair-ARM64.log"
> > >      VARIANT: "ARM64"
> > >      RULESET: "monitored"
> > > +
> > > +eclair-ARM64-testing:
> > > +  extends: eclair-ARM64
> > > +  tags:
> > > +    - eclair-analysis-testing
> > > +  rules:
> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> > > +      when: always
> > > +    - !reference [.eclair-analysis:triggered, rules]
> > 
> > and here
> > 
> > 
> > > +eclair-ARM64-safety:
> > > +  extends: eclair-ARM64
> > > +  tags:
> > > +    - eclair-analysis-safety
> > > +  variables:
> > >      EXTRA_XEN_CONFIG: |
> > >        CONFIG_NR_CPUS=16
> > >        CONFIG_GICV2=n
> > > @@ -120,6 +154,10 @@ eclair-ARM64:
> > >        CONFIG_DEBUG_LOCKS=n
> > >        CONFIG_SCRUB_DEBUG=n
> > >        CONFIG_XMEM_POOL_POISON=n
> > > +  rules:
> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ &&
> > > $CI_COMMIT_BRANCH =~ /^staging$/
> > > +      when: always
> > > +    - !reference [.eclair-analysis, rules]
> > 
> > and here
> 
> -- 
> Nicola Vetrini, B.Sc.
> Software Engineer
> BUGSENG (https://bugseng.com)
> LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253
> 

