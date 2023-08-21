Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6BD7824A3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 09:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587317.918664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzVs-0000DT-Ak; Mon, 21 Aug 2023 07:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587317.918664; Mon, 21 Aug 2023 07:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzVs-0000BT-5w; Mon, 21 Aug 2023 07:39:48 +0000
Received: by outflank-mailman (input) for mailman id 587317;
 Mon, 21 Aug 2023 07:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixuA=EG=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qXzVr-0000BN-2j
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 07:39:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e46a67f2-3ff5-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 09:39:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5CC3F4EE0737;
 Mon, 21 Aug 2023 09:39:42 +0200 (CEST)
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
X-Inumbo-ID: e46a67f2-3ff5-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Mon, 21 Aug 2023 09:39:42 +0200
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation/eclair: avoid unintentional ECLAIR
 analysis
Reply-To: simone.ballarin@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2308141445470.6458@ubuntu-linux-20-04-desktop>
References: <cover.1691760935.git.simone.ballarin@bugseng.com>
 <57bc71b428d439f933cdbb0b88a36b39bc77e45e.1691760935.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308111502540.2127516@ubuntu-linux-20-04-desktop>
 <7fe34af9cbfd47fa64b4e14ae2f0dbff@bugseng.com>
 <alpine.DEB.2.22.394.2308141445470.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b7246ceed209efc84a39099b3796931b@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2023 23:45, Stefano Stabellini wrote:
> On Sat, 12 Aug 2023, Simone Ballarin wrote:
>> On 12/08/2023 00:04, Stefano Stabellini wrote:
>> > On Fri, 11 Aug 2023, Simone Ballarin wrote:
>> > > With this patch, ECLAIR jobs will need to be manually
>> > > started for "people/.*" pipelines.
>> > >
>> > > This avoids occupying the runner on analyzes that might
>> > > not be used by developers.
>> > >
>> > > If developers want to analyze their own repositories
>> > > they need to launch them from GitLab.
>> > >
>> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> > > ---
>> > >  automation/gitlab-ci/analyze.yaml | 14 ++++++++++----
>> > >  automation/gitlab-ci/build.yaml   |  6 ------
>> > >  automation/gitlab-ci/test.yaml    |  5 -----
>> > >  3 files changed, 10 insertions(+), 15 deletions(-)
>> > >
>> > > diff --git a/automation/gitlab-ci/analyze.yaml
>> > > b/automation/gitlab-ci/analyze.yaml
>> > > index 4aa4abe2ee..f04ff99093 100644
>> > > --- a/automation/gitlab-ci/analyze.yaml
>> > > +++ b/automation/gitlab-ci/analyze.yaml
>> > > @@ -20,21 +20,27 @@
>> > >        codequality: gl-code-quality-report.json
>> > >    needs: []
>> > >
>> > > -eclair-x86_64:
>> > > +.eclair-analysis:triggered:
>> > >    extends: .eclair-analysis
>> > > +  allow_failure: true
>> > > +  rules:
>> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
>> > > +      when: manual
>> > > +    - when: always
>> > > +
>> > > +eclair-x86_64:
>> > > +  extends: .eclair-analysis:triggered
>> > >    variables:
>> > >      LOGFILE: "eclair-x86_64.log"
>> > >      VARIANT: "X86_64"
>> > >      RULESET: "Set1"
>> > > -  allow_failure: true
>> > >
>> > >  eclair-ARM64:
>> > > -  extends: .eclair-analysis
>> > > +  extends: .eclair-analysis:triggered
>> > >    variables:
>> > >      LOGFILE: "eclair-ARM64.log"
>> > >      VARIANT: "ARM64"
>> > >      RULESET: "Set1"
>> > > -  allow_failure: true
>> > >
>> > >  .eclair-analysis:on-schedule:
>> > >    extends: .eclair-analysis
>> >
>> > Everything so far looks great and I am ready to Ack.
>> >
>> >
>> > > diff --git a/automation/gitlab-ci/build.yaml
>> > > b/automation/gitlab-ci/build.yaml
>> > > index 173613567c..e4b601943c 100644
>> > > --- a/automation/gitlab-ci/build.yaml
>> > > +++ b/automation/gitlab-ci/build.yaml
>> > > @@ -12,11 +12,6 @@
>> > >        - '*/*.log'
>> > >      when: always
>> > >    needs: []
>> > > -  except:
>> > > -    - master
>> > > -    - smoke
>> > > -    - /^coverity-tested\/.*/
>> > > -    - /^stable-.*/
>> > >
>> > >  .gcc-tmpl:
>> > >    variables: &gcc
>> > > @@ -269,7 +264,6 @@
>> > >  .test-jobs-artifact-common:
>> > >    stage: build
>> > >    needs: []
>> > > -  except: !reference [.test-jobs-common, except]
>> > >
>> > >  # Arm test artifacts
>> > >
>> > > diff --git a/automation/gitlab-ci/test.yaml
>> > > b/automation/gitlab-ci/test.yaml
>> > > index 8ccce1fe26..11cb97ea4b 100644
>> > > --- a/automation/gitlab-ci/test.yaml
>> > > +++ b/automation/gitlab-ci/test.yaml
>> > > @@ -1,11 +1,6 @@
>> > >  .test-jobs-common:
>> > >    stage: test
>> > >    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
>> > > -  except:
>> > > -    - master
>> > > -    - smoke
>> > > -    - /^coverity-tested\/.*/
>> > > -    - /^stable-.*/
>> > >
>> > >  .arm64-test-needs: &arm64-test-needs
>> > >    - alpine-3.18-arm64-rootfs-export
>> >
>> > These changes instead belongs to the first patch, right?
>> 
>> Yes, sorry. Moreover, it is the answer to your question on
>> the other patch.
> 
> No problem. Please re-send. One more comment. In the first patch we
> have:
> 
> +workflow:
> +  rules:
> +    - if: $CI_COMMIT_BRANCH =~
> /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
> +      when: never
> +    - when: always
> 
> I think it is an excellent idea to skip "master" as well as the others,
> but maybe we could make them "manual" instead of "never" just in case
> someone wants to see the results on master. It might happen on special
> occasions.

"manual" cannot be used at workflow-level only at job-level.
I've made a couple of experiments and I find several problems in doing 
that:


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)

