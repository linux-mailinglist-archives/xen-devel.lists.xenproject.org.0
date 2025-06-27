Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89FAEB175
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 10:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027401.1402055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4cI-0000CV-2I; Fri, 27 Jun 2025 08:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027401.1402055; Fri, 27 Jun 2025 08:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4cH-0000AS-Ud; Fri, 27 Jun 2025 08:39:25 +0000
Received: by outflank-mailman (input) for mailman id 1027401;
 Fri, 27 Jun 2025 08:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tt0q=ZK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uV4cF-00009M-Op
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 08:39:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38fadd11-5332-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 10:39:22 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 175704EE3C07;
 Fri, 27 Jun 2025 10:39:21 +0200 (CEST)
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
X-Inumbo-ID: 38fadd11-5332-11f0-a30f-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1751013561;
	b=TuTuTQiAKK2LL9sUUZoH9ZYakF7jB8jvyNtOIqYIYH03YfOq1uRwVmzsEnyGJWOofC07
	 8mYhklFbj875pb7+wE9kEDL29RoaZB9Yay+h/I1d3cYBsOwP6F3IqA1QnsxYLD9iDY/cz
	 48FP0v7bU6yFBDGEXOXC+nt1yvoKaKz2V2w8A7NqZfaTMNO8gvgYNeb0l4m0NhavDuENi
	 ZkZQZ5YeUZ3OHKKjbGz8SCZ8UDzZb6GDFY6Y3jGb7JmmjYWps6e+hHY/IjO6NBaNMcjBl
	 FCk25udUaJUcq/f+ZE9SLmlmSEqDQyMYydq3TML4aufw21u+zMRhyb8QVv7iuC42qu02L
	 +zhUp1IgQ584dGbEDy1aOLutTMQpFg1nofX4d+kigMjoYrkmm2mpUoSRxRwTdYqpucEq2
	 SEkM+OGUjrq9dSQOCY3zgCzlNK33LxRqaFfDV+nzzF53sLyB98fhVj5P8KJLlCxynICZ3
	 VSPS1IZnpkI3rfZNLwIWw80BQJc9nWmGWDaP+MPMp+HeEat0m0wnABFgLVltCUT6lWDeD
	 0jVdn3XUckRM+q0SWNKShVWerZqoFk8Shv2BFj51GaLWtCUCJgIhAgQs0Gh8MEGLo1els
	 Oad/lq/HC+2y/1fwpceDP8LNtvWLtAqV+vh9nXngqkqrDU0sraQuScOBmXAfjbc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1751013561;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=wI/0k16mVXhg3mrG82T4Bp6Quxy12TNzePQpSccXxJY=;
	b=HqbaE4yJ2yLzveKfNqgeHOPtOUsaFmuYnqwtFxnzFqTNwG6lfJ0QRs4K55+V2au6U/k7
	 dTi9QaciVspxgeMBTpzTKINxwuvAdUxcVlKX1yN9u6S4DFGZc5euSBV1ai8IQYDN1jIyb
	 xaZOZJBN6j+Yow2XTZeGIkKBi76VgRQkxRWnf2gOHWvgulwgPiCz8IGs08/xVbZQo0EUj
	 bh6CEMkBA1DpaBs/Qz/lq9F/DP0+Cxz3KPtUMsuozd4GHPdgbVjv7aV0OqEeigyNbriqt
	 9RQm1u+3wrJeAn2RrJ0Jm4kD3gCt2BMxsUTvOLHG64PetEf8gMhxsHIvk37hs84sbtYpU
	 5e6uyZu2fKOTVbrzS6N6EXU0yq6RNxmVV+3umFNr5/NDpPMieEeiIEOq9DjuyFPYitejH
	 vRf3H00eQibfMOa5yUBHRA0GDerU9V1frnbwPYjff5CaG/2PmbRXlabM+ojn/uBZTFxGL
	 y4UVa4MGIVHO1xDbUuXll+pf79nY/vw0Bj0xwFtXw69uaVPpnbsqJrORYrduj9iM+0xCV
	 D6+p4j1C+GaD/BYzWtmAsbhT2AlsP6sGr7u0k6Xy4xQ21phWwC8ngDsRmjayVR2V/W3xp
	 m3zLmwQLcngL/yofzbc58/IxnUsj0IRPpTnbOz5kO41tuhPorSz4we4ihjnwVdw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1751013561; bh=/+ZA6Es0JY2E3mj8mglZfQJ4zTTUDTFC0RoEe4l4Lrw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WiiC6Hb7zeo5MZrMQlWF5rAbUF5DzD1BaWQ/05s+G/JgwUoedj58P7ehMsg1oAFbB
	 O/HpIpNwWZvKBmmQrsf9b5qnJ3bCeopaGck0KTuFvlRL0l0Rvee0E97L5s5dfBolyr
	 2EQLHp/D/3BbrxX5FtAnyfA9KqpR0SdPnqiyP81z+EJ9Vv5wpF/GqKQhTZot5BEGBn
	 WKJwTGhREOUAIFyyQzX7sniy8o/jnb3ALZ7J7heycZtd1at/PDvotbGVKHc1k6yK8k
	 oFiSxZlKAs24pQZ9q3XUzaVq4j3/2MnmNQfAyDGyaYfDCDPYrJ/TS3JePQuKSy7Ft8
	 DKRm7bCRD1ovw==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 10:39:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, Alessandro
 Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [XEN PATCH] automation/eclair: Make report browsing URL
 configurable.
In-Reply-To: <aF0cGgut4-CZka3J@l14>
References: <2c0003504925e6f62b0bb1a13711c206e40f9393.1750919773.git.nicola.vetrini@bugseng.com>
 <aF0cGgut4-CZka3J@l14>
Message-ID: <194c24271abdadf062cab1b0f80a6fdc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-26 12:08, Anthony PERARD wrote:
> On Thu, Jun 26, 2025 at 08:38:18AM +0200, Nicola Vetrini wrote:
>> diff --git a/automation/eclair_analysis/ECLAIR/action.settings 
>> b/automation/eclair_analysis/ECLAIR/action.settings
>> index 1577368b613b..f822f0ea66d7 100644
>> --- a/automation/eclair_analysis/ECLAIR/action.settings
>> +++ b/automation/eclair_analysis/ECLAIR/action.settings
>> @@ -14,9 +14,6 @@ autoPRRepository="${AUTO_PR_REPOSITORY:-}"
>>  # Customized
>>  autoPRBranch="${AUTO_PR_BRANCH:-}"
>> 
>> -# Customized
>> -artifactsRoot=/var/local/eclair
>> -
>>  case "${ci}" in
>>  github)
>>      # To be customized
>> @@ -166,12 +163,34 @@ esac
>> 
>>  ECLAIR_BIN_DIR=/opt/bugseng/eclair/bin/
>> 
>> -artifactsDir="${artifactsRoot}/xen-project.ecdf/${repository}/ECLAIR_${ANALYSIS_KIND}"
>> +# Artifacts URL served by the eclair_report server
>> +if [ -z "${MACHINE_ARTIFACTS_ROOT}" ];
> 
> You don't need a ';' if you have `then` on the next line ;-)
> 
Hi Anthony,

yeah, missed that. Thanks

>> +then
>> +  echo "WARNING: No artifacts root supplied, using default"
>> +fi
>> +if [ -z "${MACHINE_ECDF_DIR}" ];
>> +then
>> +  echo "WARNING: No ecdf dir supplied, using default"
>> +fi
>> +artifactsRoot="${MACHINE_ARTIFACTS_ROOT:-/var/local/eclair}"
>> +artifactsEcdfDir="${MACHINE_ECDF_DIR:-xen-project.ecdf}"
> 
> Do we need to separate varables for these two? It might be a bit 
> simpler
> to have:
>     artifactsRoot=/var/local/eclair/xen-project.ecdf
> unless there's other path than *.ecdf. But in any case, two separate
> variables looks fine too.
> 

The main reason why I used two variables is that one may have 
differently-named .ecdf directories on different machines, but there is 
no strong reason have two variables

>> +artifactsDir="${artifactsRoot}/${artifactsEcdfDir}/${repository}/ECLAIR_${ANALYSIS_KIND}"
>>  subDir="${subDir}${variantSubDir}"
>>  jobHeadline="${jobHeadline}${variantHeadline}"
>> 
>> -# Customized
>> -eclairReportUrlPrefix=https://saas.eclairit.com:3787
>> +# Remote eclair_report hosting server
>> +if [ -z "${MACHINE_HOST}" ];
>> +then
>> +  echo "WARNING: No machine host supplied, using default"
>> +fi
>> +if [ -z "${MACHINE_PORT}" ];
>> +then
>> +  echo "WARNING: No machine port supplied, using default"
>> +fi
>> +
>> +eclairReportHost="${MACHINE_HOST:-saas.eclairit.com}"
>> +eclairReportPort="${MACHINE_PORT:-3787}"
>> +eclairReportUrlPrefix="https://${eclairReportHost}:${eclairReportPort}"
> 
> Please, don't make the port number mandatory. Can you merge both host
> and port in the same variable? This part seems to be called 
> "authority":
> 
>     https://en.wikipedia.org/wiki/URL#Syntax
> 
> Also, don't use `MACHINE` as prefix/namespace for these new variables,
> in a pipeline context, "machine" could be many things. Maybe
> "ECLAIR_REPORT_HOST" for this one? With the default been:
> 
>     ECLAIR_REPORT_HOST=saas.eclairit.com:3787
> 

I can merge host and port and change the variable prefix, but I think 
there is a misunderstanding. This address is used both as the base for 
report browsing and pushing the results. While we should alter the 
latter (e.g., ECLAIR_REPORT_PROXY_HOST) to point to the proxy so that 
the proxy is shown in the CI logs, the address where the results are 
pushed is fixed and set in the docker runner env. This is not ideal, but 
I didn't find a better way with GitLab CI to let the analysis push 
locally.

> I wonder if "https" should be configurable as well, but I guess there
> shouldn't be any need for it as we probably don't want to serve reports
> over http.
> 

Yeah, I don't think so

>> 
>>  jobDir="${artifactsDir}/${subDir}/${jobId}"
>>  updateLog="${analysisOutputDir}/update.log"
>> diff --git a/automation/eclair_analysis/ECLAIR/action_push.sh 
>> b/automation/eclair_analysis/ECLAIR/action_push.sh
>> index 45215fbf005b..5002b48522e2 100755
>> --- a/automation/eclair_analysis/ECLAIR/action_push.sh
>> +++ b/automation/eclair_analysis/ECLAIR/action_push.sh
>> @@ -1,6 +1,6 @@
>>  #!/bin/sh
>> 
>> -set -eu
>> +set -eux
> 
> Left over change from debugging?
> 

Yes

>> 
>>  usage() {
>>      echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
>> diff --git a/automation/gitlab-ci/analyze.yaml 
>> b/automation/gitlab-ci/analyze.yaml
>> index 5b00b9f25ca6..f027c6bc90b1 100644
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -8,6 +8,8 @@
>>      ENABLE_ECLAIR_BOT: "n"
>>      AUTO_PR_BRANCH: "staging"
>>      AUTO_PR_REPOSITORY: "xen-project/xen"
>> +    MACHINE_ARTIFACTS_ROOT: "/space"
>> +    MACHINE_ECDF_DIR: "XEN.ecdf"
> 
> Is this the right place for these variables? Shouldn't they be set on
> gitlab (at project or repo scope) or even set by the runner itself.
> 

Well, it was easier to set them there for debugging. The idea was to 
potentially override them at the runner config level, if needed.

>>    script:
>>      - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>>    artifacts:
>> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
>> index 0a2353c20a92..7020eaa0982f 100755
>> --- a/automation/scripts/eclair
>> +++ b/automation/scripts/eclair
>> @@ -1,4 +1,15 @@
>> -#!/bin/sh -eu
>> +#!/bin/sh -eux
>> +
>> +# Runner-specific variables
>> +ex=0
>> +export "$(env | grep MACHINE_ARTIFACTS_ROOT)" || ex=$?
>> +[ "${ex}" = 0 ] || exit "${ex}"
> 
> That's a really complicated way to check a variable is set...
> Exporting a variable that's already in env isn't useful, and I think
> `ex` is only ever set to `0`. It seems that `dash` just exit if you do
> `export=""`.
> 
> You could simply do:
> 
>     : ${MACHINE_ARTIFACTS_ROOT:?Missing MACHINE_ARTIFACTS_ROOT 
> variable}
>     : ${MACHINE_ECDF_DIR:?Missing MACHINE_ECDF_DIR variable}
> 
> To check that the variables are set. Or nothing, if you add `set -u` to
> the script (instead of the one -u in the sheband which might be ignored
> if one run `sh ./eclair` instead of just `./eclair`.) Also the variable
> should come from the env, as nothing sets it, so no need to for that.
> 
> ( The `:` at the begining of the line is necessary, and behave the same
> way as `true` does. We need it because ${parm:?msg} is expanded.)
> 
> Or you could use `if [ -z "${param}" ]` if ${param:?msg} is too 
> obscure.
> We would just have "parameter not set" instead of a nicer message, due
> to `set -u`.
> 

I agree it is ugly and counterintuitive, but the core idea here is that 
the variable is set but not exported for some reason, so just `export 
VAR` does not behave in the same way as the incantation `export "$(env | 
grep MACHINE_ARTIFACTS_ROOT)"` iirc. I'll double check if there's a 
better way to achieve this (other than switching to bash in the 
shebang).

Thanks,

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

