Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE9C186E0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 07:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152535.1483090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDzYJ-0005Py-KG; Wed, 29 Oct 2025 06:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152535.1483090; Wed, 29 Oct 2025 06:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDzYJ-0005Nc-Eg; Wed, 29 Oct 2025 06:20:59 +0000
Received: by outflank-mailman (input) for mailman id 1152535;
 Wed, 29 Oct 2025 06:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=reE9=5G=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vDzYH-0005NW-Hp
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 06:20:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d420539-b48f-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 07:20:55 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 94DC64EEBC3F;
 Wed, 29 Oct 2025 07:20:54 +0100 (CET)
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
X-Inumbo-ID: 6d420539-b48f-11f0-9d16-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1761718854;
	b=VPOZ/IJBaNvc3rB9i5rYd0tAbLwM4J0b/YMa36Hzeom8I9cVMJaw+9yGjaOkh/gOfNYs
	 LVvdNie6EZG/O4Z3VC9v9a4MkPucB1xRfvF8BomIp8GOZtTBSYGCcoDZ6MeVk/FKJCGAR
	 sqlZdbdw0ciX+Ra/4FFc7AkZuinifxXZIqfv5/NWU0vexIM2WCiY1QVmSDbfa5qfmmrOA
	 nFgnEOTzH5J4+cxYbn420725SWY2se0eU/fDp5IkFlW25kxZRHW10U3GhnTrCWAGxSeE5
	 tgN2+qVeIGDXVvTX63ip4auTad+lznnExcFnq57NcpPjSTON2fThYFBaKO3smgkPSDlFO
	 rMsNa4SB4SUDRQObRpmc6MbQ42DAXTF2nw7Fp15EgACxx0Msir9Wt7vCT1SRx/UtZONDm
	 Jg3zhtBeWLlEtV5FoAghLybAZLL7qQcYCTmy8I8TBnM2gVFME1B1ttuwApvfQLnbQdh9F
	 adqWfq2v1CdhdjTIGGO3gf2AlT8SEdl7M21QQ9n4+TB/lip+F6hbsepVhziRakAQE8ubm
	 I4HqD7cNIQdB89+/u1kdlVjlvlsTVC3vWifkHuqAU/1vDiJUNQXm17PXy6z/A8pV5RBLn
	 cU1Y8Ih+zS1QIUA9X0HjIcrOr0iRL/+3AUe/ptlubH/GvGctSW+xcbKkYSX3NyU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1761718854;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=lJamLYfGR7B5WnfmeAoHaaWcgHd+ROlUygkQf2eQeOU=;
	b=AGL7hH4ONN3ij2Ffd1QN0unDyK2BNafmFIvPlqYgKAe2z1qx5G4rqthx4XykpfxljDZL
	 MBAxItJOcGYCd5hP8he55Gx7wYUA9wxyn5Hxv39t/ocR+0+A+LvTbz6ZfytCgcS5drWz4
	 B69t8V57aBml3D/pARoOj6RSWoYzOFFSIRMm3Yoo3V3LzaZWbuR/w2o3an8dV7zcuYbJO
	 dXLVVkBpyvH0Al7qamzqDyr+kIQ/LMZk8mgOzW3Gm/+DQtFUlxh9gYrceBJEvd4IA5wMQ
	 rGRgh/ic+Uzj9OaUL8whdGIiLFqxQpaliq6y2Bk7zgQ65IAXQL5nfDIg6lddhMzLjwoUd
	 7wqMV0slS/qTElhanWMd9lujyiowOfWZNpiQmOJ/DbIvHBF/gqMAiVMjqUdKxJ3Wqk6qL
	 YXGY8pmeJ34wZ3wc5k0RZ3GZpFIxg7SJ/rYdtHKpjm5hW7Rmi3AOcTEbO3Biba9lQDGYz
	 t0kSftiTx3JjPGmHPh1TOgUJJ+dwTiAP1A6OIq+WuSMJ9q7S3/v1AXORR/DApUiKNYOlV
	 jixgFopi+ErJBz0EqPnjjxXIvjUy6jt0ih5JHnkfdkDJad1+xT4oHok+tgeALDeros8I+
	 8looGBkM3EDojzIWj9sTijhKQq8VfCgnxPYfRlZG2Od1y5TaCHgJtjOsUs5qTfQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1761718854; bh=VduphIrMAvyKSUZZLOQA0hOBx7BjGw8UOpNpqq2FaCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VSq/Vt2XvoWax0WVigOSqbO3+3bPYIPneo2s+dl6F7Vu1w/iVEWAWtWnLKbGaFVHM
	 qMvTgXxolTNA1TOLc5Zgz89yqZzqeNwM5VKlBNLJ7GXnxMVSL/proTGrkaLxkm/0b7
	 mUTF6Hv2mHwHO682DO8tyILj0J8ENn3ATEGYB9MdvjvBPAOHBAXf7iGYPU4URRYENz
	 73yaOfFM67cFqGUEbiu6fWEFBmZBN2TAgbcIskGy4edIVc4V0PShYK3jEs+6REqYIW
	 xcW7jjCuxVdte5Z6nJ4oCjY7CgeObUw/NRnCTxsWxpVyR7quxTn5cwSj9MGjjWdr8/
	 v5rpRqVPuoqcQ==
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 07:20:54 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN PATCH v2] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <alpine.DEB.2.22.394.2510281722540.495094@ubuntu-linux-20-04-desktop>
References: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2510271656380.495094@ubuntu-linux-20-04-desktop>
 <f6dbd7a74854cab064cf7ca76c68e44d@bugseng.com>
 <alpine.DEB.2.22.394.2510281722540.495094@ubuntu-linux-20-04-desktop>
Message-ID: <f27279b79ca914a27c80532fefda8b27@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-29 01:22, Stefano Stabellini wrote:
> On Tue, 28 Oct 2025, Nicola Vetrini wrote:
>> On 2025-10-28 00:58, Stefano Stabellini wrote:
>> > On Fri, 24 Oct 2025, Nicola Vetrini wrote:
>> > > The following analysis jobs are performed:
>> > > - eclair-{x86_64,ARM64}: analyze Xen using the default configuration for
>> > >   that architecture; runs on runners tagged `eclair-analysis'.
>> > >
>> > > - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration for
>> > >   safety, which is more restricted; runs on runners tagged
>> > >   `eclair-analysis-safety`.
>> > >
>> > > - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
>> > >   configuration for the purposes of testing new runner updates; runs on
>> > >   runners tagged `eclair-analysis-testing`.
>> > >
>> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> >
>> > Do you have a link to a successful pipeline?
>> >
>> > Just making sure we are not breaking things.
>> >
>> 
>> No; not yet, at least [1]. Without the right tags the safety runner 
>> can't pick
>> up jobs.
>> 
>> [1] 
>> https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2117835680
>> 
>> >
>> > > ---
>> > > Changes in v2:
>> > > - rebased to current staging;
>> > > - fixed regex path issue.
>> > > ---
>> > >  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
>> > >  1 file changed, 38 insertions(+)
>> > >
>> > > diff --git a/automation/gitlab-ci/analyze.yaml
>> > > b/automation/gitlab-ci/analyze.yaml
>> > > index d50721006740..7bd644d75074 100644
>> > > --- a/automation/gitlab-ci/analyze.yaml
>> > > +++ b/automation/gitlab-ci/analyze.yaml
>> > > @@ -45,6 +45,21 @@ eclair-x86_64:
>> > >      LOGFILE: "eclair-x86_64.log"
>> > >      VARIANT: "X86_64"
>> > >      RULESET: "monitored"
>> > > +
>> > > +eclair-x86_64-testing:
>> > > +  extends: eclair-x86_64
>> > > +  tags:
>> > > +    - eclair-analysis-testing
>> > > +  rules:
>> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
>> > > +      when: always
>> > > +    - !reference [.eclair-analysis:triggered, rules]
>> >
>> > given that everyone can change this yaml file when pushing to their own
>> > branch, I think we should remove this, or (probably better) use a
>> > separate env variable to set the default
>> >
>> > it is better not to use the path, I think
>> >
>> 
>> That is a fair concern. One option would be to just use a project 
>> runner
>> assigned to the people/bugseng/xen subproject, but that might be a bit
>> inconvenient if we want to swap runners around.
> 
> I think it is OK to register a project runner to people/bugseng/xen. I
> am happy with this solution as well.
> 
> 
>> Another option, as you said,
>> is keeping the regex in a variable, but this wont't prevent rogue
>> modifications of the YAML.
> 
> I was thinking more of a simpler boolean variable like:
> 
> rules:
>   - if: $ECLAIR_TESTING
> 
> Yes, it wouldn't prevent modifications of the YAML, but it is probably
> not an issue? Also, it is not less secure than the path, because the
> YAML can be changed by anyone. At least the variable is more flexible
> and feels more natural.
> 

Ok, let's use the variable and then change if we see any problems. I'll 
send a v3. If you could add the tags to the runners in the meantime, I 
can validate the changes with a proper CI run.

> 
>> I might have found something runner-side with [2],
>> but I need to dig deeper on that one.
>> 
>> [2] pre_build_script at
>> https://docs.gitlab.com/runner/configuration/advanced-configuration/#the-runners-section
>> 
>> > > +eclair-x86_64-safety:
>> > > +  extends: eclair-x86_64
>> > > +  tags:
>> > > +    - eclair-analysis-safety
>> > > +  variables:
>> > >      EXTRA_XEN_CONFIG: |
>> > >        CONFIG_AMD=y
>> > >        CONFIG_INTEL=n
>> > > @@ -75,6 +90,10 @@ eclair-x86_64:
>> > >        CONFIG_DEBUG_LOCKS=n
>> > >        CONFIG_SCRUB_DEBUG=n
>> > >        CONFIG_XMEM_POOL_POISON=n
>> > > +  rules:
>> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ &&
>> > > $CI_COMMIT_BRANCH =~ /^staging$/
>> > > +      when: always
>> > > +    - !reference [.eclair-analysis:triggered, rules]
>> >
>> > same here
>> >
>> >
>> > >  eclair-ARM64:
>> > >    extends: .eclair-analysis:triggered
>> > > @@ -82,6 +101,21 @@ eclair-ARM64:
>> > >      LOGFILE: "eclair-ARM64.log"
>> > >      VARIANT: "ARM64"
>> > >      RULESET: "monitored"
>> > > +
>> > > +eclair-ARM64-testing:
>> > > +  extends: eclair-ARM64
>> > > +  tags:
>> > > +    - eclair-analysis-testing
>> > > +  rules:
>> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
>> > > +      when: always
>> > > +    - !reference [.eclair-analysis:triggered, rules]
>> >
>> > and here
>> >
>> >
>> > > +eclair-ARM64-safety:
>> > > +  extends: eclair-ARM64
>> > > +  tags:
>> > > +    - eclair-analysis-safety
>> > > +  variables:
>> > >      EXTRA_XEN_CONFIG: |
>> > >        CONFIG_NR_CPUS=16
>> > >        CONFIG_GICV2=n
>> > > @@ -120,6 +154,10 @@ eclair-ARM64:
>> > >        CONFIG_DEBUG_LOCKS=n
>> > >        CONFIG_SCRUB_DEBUG=n
>> > >        CONFIG_XMEM_POOL_POISON=n
>> > > +  rules:
>> > > +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ &&
>> > > $CI_COMMIT_BRANCH =~ /^staging$/
>> > > +      when: always
>> > > +    - !reference [.eclair-analysis, rules]
>> >
>> > and here
>> 
>> --
>> Nicola Vetrini, B.Sc.
>> Software Engineer
>> BUGSENG (https://bugseng.com)
>> LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

