Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F8BE7C85
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 11:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145097.1478264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9grC-0006Tf-HS; Fri, 17 Oct 2025 09:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145097.1478264; Fri, 17 Oct 2025 09:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9grC-0006SE-EV; Fri, 17 Oct 2025 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 1145097;
 Fri, 17 Oct 2025 09:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YhSQ=42=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1v9gr9-0006S8-Ry
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 09:34:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fdab025-ab3c-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 11:34:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id EE26F4EEBC65;
 Fri, 17 Oct 2025 11:34:36 +0200 (CEST)
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
X-Inumbo-ID: 7fdab025-ab3c-11f0-9d15-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1760693677;
	b=qIvqJUjXdp+Ac5mT7biKLpmV30r/KEgsO80CGJfx8uUyqp7cjPbcfeCfphaHaHLtOzvc
	 o2ewnldi3/H0Y7Jgcd3tt19sWvx37J3sAfXPuUaAi/uuVrrVpmZEWnysHY7aTPWSyLMhB
	 rftN8YY7ARiL5oayXb8RU5BGDh1eJd/d3TSkL7DDEZ9CYtUlD82UFTBI25cx1DTgwr5lN
	 0ZipUsBNkx1RoTnpYGRXCzlWjndCtXJ2WCVL/DJQuXHFKQuLeuOoBhyQTGrlekaX6ZC9Z
	 vr/OuVLr4u12JEJwpA4mspKIavqtUXQGFSW+Xr8F0oYhKz3OgTSehK4sonCK2WKq18kUY
	 KrYLdKSlqIHeVYbIRU6OEdbqKCQ+FlXJiJ9PlGHvdoASmcvQiUCBA8gZDuUq91f7oEKOT
	 L/I2ZgWTmEzXuR7uPQp4vpeh6qX+N3sVVOtei1QCfPtKjQkN8GBAmqVdAdmPjtS9iRt4s
	 efq/GzxVJ6+iNsCrw08xfDQQZfFVF/hL68JMrUAYG9YLGwkV8qp1uks0XuAdDXXZY58GY
	 hkjyWpz+vzJvikBEt5dmShiBV8XJHGUHvTcqSgSWoGKrE1Daw6Ao8PDEkhLnYaxCxGZXk
	 frLROMyy+ovxn8e0gYD2WtXP2cDlmK+ArNSjAI+weddtOm0l0tWtlZbENF458Ng=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1760693677;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=8Dob8iM2aHXfbBl911tqjtAcDC5iDNRSRymFWrDdxoE=;
	b=jCewZDLNKIxlwq080BobSwR2Hx5b+97EpiEtxibpdDFUX+cnAiZmK8SnmrC+scwDxiPz
	 Pn8XWDuxo+TeArCPctyQ/Cv+vLvOLAcMVq7run5ottfFbpTHjPPGvBZM6uvpKUTca5z8H
	 jkmsh8Q4m+9tmGbmGkFR7+EDkDxxRMTWH3F396ZUDxzo9bFZbZ34DOMr+l57Fejz6VBb2
	 oANYJFbZTgzZbbVzUUN9FI0renpLBiKRTM1gKFVfu8LiXLF3eLZ0fXFFO6eVcEY71+Wkr
	 wRvwvJ3SsfMLObJxlw3WC+mP8sgbYeUGfO7aAoVeWMEpPwmSrGHAqLiZQmYjbFhM2KBUG
	 9Df+sSsSO25IuoKJVFc2DI4/En2sIiQEKeNBqgj8GLc5lcniJQ5DKJUc/3EyPL9lijIcK
	 lxtGKWAiHC+AE71ro4qcib5YoSvmWLRU6GHqv15Kmxo+ZNo5UettQDfEEwwM5i+2ikGyV
	 X4sdC8JYqEXQN34G/6MKpBt61Ewy2IMKNtITlIH1Dco50dHBGM1C6cqCYfGTZa8MZuq/k
	 G6S0SEFeCxubFKejMJCx9uj4J60uLS0HKlZfb+pMjOyhQmsGhAL+WQsSVUzheHFxO4n5O
	 Y+eIC8nu7jpKN1oaNGaabnB8mQmgffMnbbWodyxmsq9M3o3LtiTivgA0e8u4gS8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1760693677; bh=2ldG8JCSdbKXFxu9jFZ/g3aH/dmvLGXIYiExH2g/NRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pzUjOzF4ryJgOEcHiSQzjDrcIlNisyUS78cFfRYovPXc7EuaYWIakAtBkVt+NWUjO
	 ZaUBIyfchRd59FjYFHJ0EpxMoRX7NqigRv63tBGTGF7aAVbg8AQNXbXacvhHqX37Jq
	 gNX2LCyIG6ap0+t5ZUWEAykkMcRF8vGBiH94RUh6AqKyEJrPApVzeO7CyAGjg8QPxg
	 L0QQdFOBoZLHiuSONVmVQDA8a60OiKHVXdDTJ1yhdoPUGK/NBr6lu1sCNrjU8nxWLN
	 KJErrMSm+5O9LSdVXyjZkTE4flo+ZiRn/26rV9hbHStkLUxdTw1PCawgGu7fJdiezB
	 O+GtJ4zH2HTzw==
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 11:34:36 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>
Subject: [Ping] Re: [XEN PATCH] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <d4a0924c84e78b3f677b0d987c2f8e4b3f6b80a5.1758226234.git.nicola.vetrini@bugseng.com>
References: <d4a0924c84e78b3f677b0d987c2f8e4b3f6b80a5.1758226234.git.nicola.vetrini@bugseng.com>
Message-ID: <adf715553750d344517f8818233af41e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-18 22:16, Nicola Vetrini wrote:
> The following analysis jobs are performed:
> - eclair-{x86_64,ARM64}: analyze Xen using the default configuration 
> for
>   that architecture; runs on runners tagged `eclair-analysis'.
> 
> - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration for
>   safety, which is more restricted; runs on runners tagged
>   `eclair-analysis-safety`.
> 
> - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
>   configuration for the purposes of testing new runner updates; runs on
>   runners tagged `eclair-analysis-testing`.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Naturally the right tags to the runners should be set beforehand for
> this to work as intended:
> 
> xen-eclair-runner -> eclair-analysis-testing
> xen-eclair-runner2 -> eclair-analysis, eclair-analysis-safety
> TBD -> eclair-analysis-safety
> 
> The last runner is not set up yet, but due to the redundancy can be
> brought up anytime.

This runner has been brought up, it just needs the correct tags to be 
set up. Can I get some feedback on the overall architecture?

> ---
>  automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml 
> b/automation/gitlab-ci/analyze.yaml
> index d50721006740..a4cca00fd100 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -45,6 +45,21 @@ eclair-x86_64:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "monitored"
> +
> +eclair-x86_64-testing:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]
> +
> +eclair-x86_64-safety:
> +  extends: eclair-x86_64
> +  tags:
> +    - eclair-analysis-safety
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_AMD=y
>        CONFIG_INTEL=n
> @@ -75,6 +90,10 @@ eclair-x86_64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && 
> /$CI_COMMIT_BRANCH =~ /^staging$/
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]
> 
>  eclair-ARM64:
>    extends: .eclair-analysis:triggered
> @@ -82,6 +101,21 @@ eclair-ARM64:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "monitored"
> +
> +eclair-ARM64-testing:
> +  extends: eclair-ARM64
> +  tags:
> +    - eclair-analysis-testing
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
> +      when: always
> +    - !reference [.eclair-analysis:triggered, rules]
> +
> +eclair-ARM64-safety:
> +  extends: eclair-ARM64
> +  tags:
> +    - eclair-analysis-safety
> +  variables:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_NR_CPUS=16
>        CONFIG_GICV2=n
> @@ -120,6 +154,10 @@ eclair-ARM64:
>        CONFIG_DEBUG_LOCKS=n
>        CONFIG_SCRUB_DEBUG=n
>        CONFIG_XMEM_POOL_POISON=n
> +  rules:
> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && 
> /$CI_COMMIT_BRANCH =~ /^staging$/
> +      when: always
> +    - !reference [.eclair-analysis, rules]
> 
>  .eclair-analysis:on-schedule:
>    extends: .eclair-analysis

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

