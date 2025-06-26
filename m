Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED1AE9AD3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 12:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026096.1401373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUjWy-00080i-4q; Thu, 26 Jun 2025 10:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026096.1401373; Thu, 26 Jun 2025 10:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUjWy-0007yH-1k; Thu, 26 Jun 2025 10:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1026096;
 Thu, 26 Jun 2025 10:08:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uUjWw-0007y9-4D
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 10:08:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uUjWv-003aCJ-1T;
 Thu, 26 Jun 2025 10:08:29 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uUjWv-005d3f-0I;
 Thu, 26 Jun 2025 10:08:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=4yJb8br+8EIUswdpssPtJLAqKPvkBi0TBobjJi2jxSU=; b=FzM8OJY9LN+3JmcM4KyhXig9Aa
	k0gpcfL3quyFM/c1FmNeiwSotqjwt+ya3a2pu0m8/6QcEbVz9k6PZk+wrQCs96eaPA42dCCi0G+SU
	+xCuvpTiSeIHitfRJF7C5meIUOnlRzp+NfDKdcWxlP/+clL6MRQqOWJus9UId3sOiQ/w=;
Date: Thu, 26 Jun 2025 12:08:26 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [XEN PATCH] automation/eclair: Make report browsing URL
 configurable.
Message-ID: <aF0cGgut4-CZka3J@l14>
References: <2c0003504925e6f62b0bb1a13711c206e40f9393.1750919773.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c0003504925e6f62b0bb1a13711c206e40f9393.1750919773.git.nicola.vetrini@bugseng.com>

On Thu, Jun 26, 2025 at 08:38:18AM +0200, Nicola Vetrini wrote:
> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
> index 1577368b613b..f822f0ea66d7 100644
> --- a/automation/eclair_analysis/ECLAIR/action.settings
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -14,9 +14,6 @@ autoPRRepository="${AUTO_PR_REPOSITORY:-}"
>  # Customized
>  autoPRBranch="${AUTO_PR_BRANCH:-}"
>  
> -# Customized
> -artifactsRoot=/var/local/eclair
> -
>  case "${ci}" in
>  github)
>      # To be customized
> @@ -166,12 +163,34 @@ esac
>  
>  ECLAIR_BIN_DIR=/opt/bugseng/eclair/bin/
>  
> -artifactsDir="${artifactsRoot}/xen-project.ecdf/${repository}/ECLAIR_${ANALYSIS_KIND}"
> +# Artifacts URL served by the eclair_report server
> +if [ -z "${MACHINE_ARTIFACTS_ROOT}" ];

You don't need a ';' if you have `then` on the next line ;-)

> +then
> +  echo "WARNING: No artifacts root supplied, using default"
> +fi
> +if [ -z "${MACHINE_ECDF_DIR}" ];
> +then
> +  echo "WARNING: No ecdf dir supplied, using default"
> +fi
> +artifactsRoot="${MACHINE_ARTIFACTS_ROOT:-/var/local/eclair}"
> +artifactsEcdfDir="${MACHINE_ECDF_DIR:-xen-project.ecdf}"

Do we need to separate varables for these two? It might be a bit simpler
to have:
    artifactsRoot=/var/local/eclair/xen-project.ecdf
unless there's other path than *.ecdf. But in any case, two separate
variables looks fine too.

> +artifactsDir="${artifactsRoot}/${artifactsEcdfDir}/${repository}/ECLAIR_${ANALYSIS_KIND}"
>  subDir="${subDir}${variantSubDir}"
>  jobHeadline="${jobHeadline}${variantHeadline}"
>  
> -# Customized
> -eclairReportUrlPrefix=https://saas.eclairit.com:3787
> +# Remote eclair_report hosting server
> +if [ -z "${MACHINE_HOST}" ];
> +then
> +  echo "WARNING: No machine host supplied, using default"
> +fi
> +if [ -z "${MACHINE_PORT}" ];
> +then
> +  echo "WARNING: No machine port supplied, using default"
> +fi
> +
> +eclairReportHost="${MACHINE_HOST:-saas.eclairit.com}"
> +eclairReportPort="${MACHINE_PORT:-3787}"
> +eclairReportUrlPrefix="https://${eclairReportHost}:${eclairReportPort}"

Please, don't make the port number mandatory. Can you merge both host
and port in the same variable? This part seems to be called "authority":

    https://en.wikipedia.org/wiki/URL#Syntax

Also, don't use `MACHINE` as prefix/namespace for these new variables,
in a pipeline context, "machine" could be many things. Maybe
"ECLAIR_REPORT_HOST" for this one? With the default been:

    ECLAIR_REPORT_HOST=saas.eclairit.com:3787

I wonder if "https" should be configurable as well, but I guess there
shouldn't be any need for it as we probably don't want to serve reports
over http.

>  
>  jobDir="${artifactsDir}/${subDir}/${jobId}"
>  updateLog="${analysisOutputDir}/update.log"
> diff --git a/automation/eclair_analysis/ECLAIR/action_push.sh b/automation/eclair_analysis/ECLAIR/action_push.sh
> index 45215fbf005b..5002b48522e2 100755
> --- a/automation/eclair_analysis/ECLAIR/action_push.sh
> +++ b/automation/eclair_analysis/ECLAIR/action_push.sh
> @@ -1,6 +1,6 @@
>  #!/bin/sh
>  
> -set -eu
> +set -eux

Left over change from debugging?

>  
>  usage() {
>      echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 5b00b9f25ca6..f027c6bc90b1 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -8,6 +8,8 @@
>      ENABLE_ECLAIR_BOT: "n"
>      AUTO_PR_BRANCH: "staging"
>      AUTO_PR_REPOSITORY: "xen-project/xen"
> +    MACHINE_ARTIFACTS_ROOT: "/space"
> +    MACHINE_ECDF_DIR: "XEN.ecdf"

Is this the right place for these variables? Shouldn't they be set on
gitlab (at project or repo scope) or even set by the runner itself.

>    script:
>      - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
>    artifacts:
> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> index 0a2353c20a92..7020eaa0982f 100755
> --- a/automation/scripts/eclair
> +++ b/automation/scripts/eclair
> @@ -1,4 +1,15 @@
> -#!/bin/sh -eu
> +#!/bin/sh -eux
> +
> +# Runner-specific variables
> +ex=0
> +export "$(env | grep MACHINE_ARTIFACTS_ROOT)" || ex=$?
> +[ "${ex}" = 0 ] || exit "${ex}"

That's a really complicated way to check a variable is set...
Exporting a variable that's already in env isn't useful, and I think
`ex` is only ever set to `0`. It seems that `dash` just exit if you do
`export=""`.

You could simply do:

    : ${MACHINE_ARTIFACTS_ROOT:?Missing MACHINE_ARTIFACTS_ROOT variable}
    : ${MACHINE_ECDF_DIR:?Missing MACHINE_ECDF_DIR variable}

To check that the variables are set. Or nothing, if you add `set -u` to
the script (instead of the one -u in the sheband which might be ignored
if one run `sh ./eclair` instead of just `./eclair`.) Also the variable
should come from the env, as nothing sets it, so no need to for that.

( The `:` at the begining of the line is necessary, and behave the same
way as `true` does. We need it because ${parm:?msg} is expanded.)

Or you could use `if [ -z "${param}" ]` if ${param:?msg} is too obscure.
We would just have "parameter not set" instead of a nicer message, due
to `set -u`.

Thanks,

-- 
Anthony PERARD

