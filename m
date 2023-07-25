Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C711760396
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 02:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569280.889714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO5by-0007RP-0j; Tue, 25 Jul 2023 00:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569280.889714; Tue, 25 Jul 2023 00:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO5bx-0007O5-Su; Tue, 25 Jul 2023 00:09:09 +0000
Received: by outflank-mailman (input) for mailman id 569280;
 Tue, 25 Jul 2023 00:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO5bv-0007Nw-4H
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 00:09:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c4f875-2a7f-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 02:09:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5698F61479;
 Tue, 25 Jul 2023 00:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E6CC433C7;
 Tue, 25 Jul 2023 00:08:58 +0000 (UTC)
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
X-Inumbo-ID: 75c4f875-2a7f-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690243740;
	bh=pLvPK3SESVxCzqOo9IdyqWgmPHzBauHaicS0+AMw9Rw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pjqv8a8lR0DGlf6kkXRGMJSQfvDtHFzgiMFfn48v+sUJNau/8upcDo4KIf69PPgjx
	 UVfTExx3jNeqCUjwiMzN1T32qfq68xkjy6UGTYANCc08RrMVuaq+5vaaHMQ8/IJ4OH
	 7qNSKtWBCDVVULiWdU1Nnr1fz+Wju1H1eiD7bKlMQ114f895YBuhQajxDV3cg+jRW2
	 qicXVjfGrLNHVi3Xd7GHtVFsLbAzlwO1CcckNijZqajOg9U1pcjUR3roB3IqiN93tf
	 F/kTbogFvuvuAmsskIjxf/iijW2yL5N93liEx9S/4Xk15vsRqZTLLNH7fVNcqzwBEX
	 gFj0K5WH1Gpwg==
Date: Mon, 24 Jul 2023 17:08:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v2] automation: add ECLAIR pipeline
In-Reply-To: <c3a0495afe01cca1b0caf6e1caa2d0a3451ecc00.1690219502.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241643140.3118466@ubuntu-linux-20-04-desktop>
References: <c3a0495afe01cca1b0caf6e1caa2d0a3451ecc00.1690219502.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1672649101-1690242549=:3118466"
Content-ID: <alpine.DEB.2.22.394.2307241649110.3118466@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1672649101-1690242549=:3118466
Content-Type: text/plain; CHARSET=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307241649111.3118466@ubuntu-linux-20-04-desktop>

On Mon, 24 Jul 2023, Simone Ballarin wrote:
> Add two pipelines that analyze an ARM64 and a X86_64 build with the
> ECLAIR static analyzer on the guidelines contained in Set1.
> 
> The analysis configuration is stored in automation/eclair_analysis.
> 
> All commits on the xen-project/xen:staging branch will be analyzed
> and their artifacts will be stored indefinitely; the integration will
> report differential information with respect to the previous analysis.
> 
> All commits on other branches or repositories will be analyzed and
> only the last ten artifacts will be kept; the integration will report
> differential information with respect to the analysis done on the common
> ancestor with xen-project/xen:staging (if available).
> 
> Currently the pipeline variable ENABLE_ECLAIR_BOT is set to "n".
> Doing so disables the generation of comments with the analysis summary
> on the commit threads. The variable can be set to "y" if the a masked
> variable named ECLAIR_BOT_TOKEN is set with the impersonation token of
> an account with enough privileges to write on all repositories.
> 
> Additionaly any repository should be able to read a masked variable
> named WTOKEN with the token provided by BUGSENG.
> 
> The analysis fails if it contains violations of guidelines tagged as
> clean:added. The list of clean guidelines are maintained in
> automation/eclair_analysis/ECLAIR/tagging.ecl.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> --
> 
> Changes in v2:
> - add ECLAIR configuration files (before they were fetched from a separate
>   repository);
> - now the pipeline fails if there are new violations of guidelines tagged
>   with clean:added.
> ---
>  .gitlab-ci.yml                                |   2 +
>  MAINTAINERS                                   |   6 +
>  automation/eclair_analysis/ECLAIR/Set1.ecl    |  59 ++++
>  automation/eclair_analysis/ECLAIR/Set2.ecl    |  25 ++
>  automation/eclair_analysis/ECLAIR/Set3.ecl    |  67 ++++
>  .../eclair_analysis/ECLAIR/action.helpers     | 193 ++++++++++++
>  .../eclair_analysis/ECLAIR/action.settings    | 172 ++++++++++
>  .../ECLAIR/action_clean_added.sh              |  36 +++
>  .../eclair_analysis/ECLAIR/action_log.sh      |  15 +
>  .../ECLAIR/action_pull_request.sh             |  57 ++++
>  .../eclair_analysis/ECLAIR/action_push.sh     |  95 ++++++
>  .../ECLAIR/action_upload_sarif.sh             |  31 ++
>  .../eclair_analysis/ECLAIR/analysis.ecl       |  25 ++
>  automation/eclair_analysis/ECLAIR/analyze.sh  | 106 +++++++
>  .../ECLAIR/call_properties.ecl                | 106 +++++++
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 298 ++++++++++++++++++
>  .../eclair_analysis/ECLAIR/out_of_scope.ecl   | 127 ++++++++
>  .../ECLAIR/print_analyzed_files.sh            |  66 ++++
>  .../eclair_analysis/ECLAIR/public_APIs.ecl    |   6 +
>  automation/eclair_analysis/ECLAIR/report.ecl  |   4 +
>  automation/eclair_analysis/ECLAIR/tagging.ecl |  34 ++
>  .../eclair_analysis/ECLAIR/toolchain.ecl      | 275 ++++++++++++++++
>  automation/eclair_analysis/Makefile.prepare   |   6 +
>  automation/eclair_analysis/build.sh           |  44 +++
>  automation/eclair_analysis/prepare.sh         |  42 +++
>  automation/eclair_analysis/xen_arm_config     | 147 +++++++++
>  automation/eclair_analysis/xen_x86_config     | 152 +++++++++
>  automation/gitlab-ci/analyze.yaml             |  37 +++
>  automation/gitlab-ci/build.yaml               |   1 +
>  automation/scripts/eclair                     |  32 ++
>  30 files changed, 2266 insertions(+)
>  create mode 100644 automation/eclair_analysis/ECLAIR/Set1.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/Set2.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/Set3.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/action.helpers
>  create mode 100644 automation/eclair_analysis/ECLAIR/action.settings
>  create mode 100755 automation/eclair_analysis/ECLAIR/action_clean_added.sh
>  create mode 100755 automation/eclair_analysis/ECLAIR/action_log.sh
>  create mode 100644 automation/eclair_analysis/ECLAIR/action_pull_request.sh
>  create mode 100755 automation/eclair_analysis/ECLAIR/action_push.sh
>  create mode 100755 automation/eclair_analysis/ECLAIR/action_upload_sarif.sh
>  create mode 100644 automation/eclair_analysis/ECLAIR/analysis.ecl
>  create mode 100755 automation/eclair_analysis/ECLAIR/analyze.sh
>  create mode 100644 automation/eclair_analysis/ECLAIR/call_properties.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/deviations.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/out_of_scope.ecl
>  create mode 100755 automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
>  create mode 100644 automation/eclair_analysis/ECLAIR/public_APIs.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/report.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/tagging.ecl
>  create mode 100644 automation/eclair_analysis/ECLAIR/toolchain.ecl
>  create mode 100644 automation/eclair_analysis/Makefile.prepare
>  create mode 100755 automation/eclair_analysis/build.sh
>  create mode 100755 automation/eclair_analysis/prepare.sh
>  create mode 100644 automation/eclair_analysis/xen_arm_config
>  create mode 100644 automation/eclair_analysis/xen_x86_config
>  create mode 100644 automation/gitlab-ci/analyze.yaml
>  create mode 100755 automation/scripts/eclair

This is a lot of changes, I think we need to split it in 3 patches to
make them "digestible":

- 1 patch to introduce the ECLAIR configuration under
  automation/eclair_analysis/

- 1 patch to add xen_arm_config and xen_x86_config

- 1 patch to introduce the gitlab-ci integration; changes similar to the
  previous version of the patch, touching .gitlab-ci.yml,
  automation/gitlab-ci/, automation/scripts/eclair

- 1 patch to update the maintainers file


I think the gitlab-ci integration is already good enough to be
committed. I only have a few comments on all the files added under 
automation/eclair_analysis.

It is important that we keep the configuration files under xen.git,
things like deviations.ecl, out_of_scope.ecl and toolchain.ecl. But I
wonder if we need to keep all the others under xen.git.


> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index c8bd7519d5..ee5430b8b7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,7 +1,9 @@
>  stages:
> +  - analyze
>    - build
>    - test
>  
>  include:
> +  - 'automation/gitlab-ci/analyze.yaml'
>    - 'automation/gitlab-ci/build.yaml'
>    - 'automation/gitlab-ci/test.yaml'
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 180e57dac4..c3b99e8560 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,12 @@ F:	xen/include/xen/libfdt/
>  F:	xen/include/xen/device_tree.h
>  F:	xen/drivers/passthrough/device_tree.c
>  
> +ECLAIR
> +M: Simone Ballarin <simone.ballarin@bugseng.com>
> +S: Supported
> +F: xen/automation/eclair_analysis/
> +F: xen/automation/scripts/eclair
> +
>  EFI
>  M:	Jan Beulich <jbeulich@suse.com>
>  S:	Supported
> diff --git a/automation/eclair_analysis/ECLAIR/Set1.ecl b/automation/eclair_analysis/ECLAIR/Set1.ecl
> new file mode 100644
> index 0000000000..b5ca499037
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/Set1.ecl
> @@ -0,0 +1,59 @@
> +-doc_begin="Set 1 as defined in Xen MISRA C Task (a): Xen Coding Guidelines v1.0, May 31, 2023"

We need a different description. Please remove "Task (a)" which doesn't
have a meaning here. If you cannot come up with anything to describe Set
1, then just go with: "Set 1 of MISRA C rules".


> +-enable=MC3R1.R9.1
> +-enable=MC3R1.R12.5
> +-enable=MC3R1.R17.3
> +-enable=MC3R1.R17.4
> +-enable=MC3R1.R17.6
> +-enable=MC3R1.R19.1
> +-enable=MC3R1.R21.13
> +-enable=MC3R1.R21.17
> +-enable=MC3R1.R21.18
> +-enable=MC3R1.R21.19
> +-enable=MC3R1.R21.20
> +-enable=MC3R1.R21.21
> +-enable=MC3R1.R22.2
> +-enable=MC3R1.R22.4
> +-enable=MC3R1.R22.5
> +-enable=MC3R1.R22.6
> +-enable=MC3R1.D1.1
> +-enable=MC3R1.D2.1
> +-enable=MC3R1.D4.1
> +-enable=MC3R1.D4.3
> +-enable=MC3R1.D4.7
> +-enable=MC3R1.D4.10
> +-enable=MC3R1.D4.11
> +-enable=MC3R1.D4.14
> +-enable=MC3R1.R1.1
> +-enable=MC3R1.R1.3
> +-enable=MC3R1.R1.4
> +-enable=MC3R1.R2.1
> +-enable=MC3R1.R2.2
> +-enable=MC3R1.R3.1
> +-enable=MC3R1.R3.2
> +-enable=MC3R1.R4.1
> +-enable=MC3R1.R5.1
> +-enable=MC3R1.R5.2
> +-enable=MC3R1.R5.3
> +-enable=MC3R1.R5.4
> +-enable=MC3R1.R5.6
> +-enable=MC3R1.R6.1
> +-enable=MC3R1.R6.2
> +-enable=MC3R1.R7.1
> +-enable=MC3R1.R7.2
> +-enable=MC3R1.R7.3
> +-enable=MC3R1.R7.4
> +-enable=MC3R1.R8.1
> +-enable=MC3R1.R8.2
> +-enable=MC3R1.R8.3
> +-enable=MC3R1.R8.4
> +-enable=MC3R1.R8.5
> +-enable=MC3R1.R8.6
> +-enable=MC3R1.R8.8
> +-enable=MC3R1.R8.10
> +-enable=MC3R1.R8.12
> +-enable=MC3R1.R8.14
> +-enable=MC3R1.R9.2
> +-enable=MC3R1.R9.3
> +-enable=MC3R1.R9.4
> +-enable=MC3R1.R9.5
> +-doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/Set2.ecl b/automation/eclair_analysis/ECLAIR/Set2.ecl
> new file mode 100644
> index 0000000000..741fe4d470
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/Set2.ecl
> @@ -0,0 +1,25 @@
> +-doc_begin="Set 2 as defined in Xen MISRA C Task (a): Xen Coding Guidelines v1.0, May 31, 2023"

same here


> +-enable=MC3R1.R10.1
> +-enable=MC3R1.R10.2
> +-enable=MC3R1.R10.3
> +-enable=MC3R1.R10.4
> +-enable=MC3R1.R10.6
> +-enable=MC3R1.R10.7
> +-enable=MC3R1.R10.8
> +-enable=MC3R1.R11.1
> +-enable=MC3R1.R11.2
> +-enable=MC3R1.R11.3
> +-enable=MC3R1.R11.6
> +-enable=MC3R1.R11.7
> +-enable=MC3R1.R11.8
> +-enable=MC3R1.R11.9
> +-enable=MC3R1.R12.2
> +-enable=MC3R1.R13.1
> +-enable=MC3R1.R13.2
> +-enable=MC3R1.R13.5
> +-enable=MC3R1.R13.6
> +-enable=MC3R1.R14.1
> +-enable=MC3R1.R14.2
> +-enable=MC3R1.R14.3
> +-enable=MC3R1.R14.4
> +-doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/Set3.ecl b/automation/eclair_analysis/ECLAIR/Set3.ecl
> new file mode 100644
> index 0000000000..1b1afe4f3b
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/Set3.ecl
> @@ -0,0 +1,67 @@
> +-doc_begin="Set 3 as defined in Xen MISRA C Task (a): Xen Coding Guidelines v1.0, May 31, 2023"

same here


> +-enable=MC3R1.D4.12
> +-enable=MC3R1.R5.5
> +-enable=MC3R1.R5.7
> +-enable=MC3R1.R5.8
> +-enable=MC3R1.R15.2
> +-enable=MC3R1.R15.3
> +-enable=MC3R1.R15.6
> +-enable=MC3R1.R15.7
> +-enable=MC3R1.R16.1
> +-enable=MC3R1.R16.2
> +-enable=MC3R1.R16.3
> +-enable=MC3R1.R16.4
> +-enable=MC3R1.R16.5
> +-enable=MC3R1.R16.6
> +-enable=MC3R1.R16.7
> +-enable=MC3R1.R17.1
> +-enable=MC3R1.R17.2
> +-enable=MC3R1.R17.5
> +-enable=MC3R1.R17.7
> +-enable=MC3R1.R18.1
> +-enable=MC3R1.R18.2
> +-enable=MC3R1.R18.3
> +-enable=MC3R1.R18.6
> +-enable=MC3R1.R18.7
> +-enable=MC3R1.R18.8
> +-enable=MC3R1.R20.2
> +-enable=MC3R1.R20.3
> +-enable=MC3R1.R20.4
> +-enable=MC3R1.R20.6
> +-enable=MC3R1.R20.7
> +-enable=MC3R1.R20.8
> +-enable=MC3R1.R20.9
> +-enable=MC3R1.R20.11
> +-enable=MC3R1.R20.12
> +-enable=MC3R1.R20.13
> +-enable=MC3R1.R20.14
> +-enable=MC3R1.R21.1
> +-enable=MC3R1.R21.2
> +-enable=MC3R1.R21.3
> +-enable=MC3R1.R21.4
> +-enable=MC3R1.R21.5
> +-enable=MC3R1.R21.6
> +-enable=MC3R1.R21.7
> +-enable=MC3R1.R21.8
> +-enable=MC3R1.R21.9
> +-enable=MC3R1.R21.10
> +-enable=MC3R1.R21.12
> +-enable=MC3R1.R21.14
> +-enable=MC3R1.R21.15
> +-enable=MC3R1.R21.16
> +-enable=MC3R1.R22.1
> +-enable=MC3R1.R22.3
> +-enable=MC3R1.R22.7
> +-enable=MC3R1.R22.8
> +-enable=MC3R1.R22.9
> +-enable=MC3R1.R22.10
> +-enable=MC3R1.R2.6
> +-enable=MC3R1.R4.2
> +-doc_end
> +
> +-doc_begin="Guidelines added with Xen MISRA C Task (a): Xen Coding Guidelines v1.1, June 1, 2023"
> +-enable=MC3R1.R21.11
> +-enable=MC3R1.D4.4
> +-enable=MC3R1.R8.9
> +-enable=MC3R1.R12.4
> +-doc_end

These 3 files are important and I would definitely add them to xen.git



> diff --git a/automation/eclair_analysis/ECLAIR/action.helpers b/automation/eclair_analysis/ECLAIR/action.helpers
> new file mode 100644
> index 0000000000..2ad6428eaa
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action.helpers
> @@ -0,0 +1,193 @@
> +if [ -n "${GITLAB_CI:-}" ]; then
> +    ci=gitlab
> +elif [ -n "${GITHUB_ACTION:-}" ]; then
> +    ci=github
> +elif [ -n "${JENKINS_HOME:-}" ]; then
> +    ci=jenkins
> +else
> +    echo "Unexpected CI/CD context" >&2
> +    exit 1
> +fi
> +
> +esc=$(printf '\e')
> +cr=$(printf '\r')
> +
> +open_section() {
> +    id=$1
> +    title=$2
> +    collapsed=$3
> +    echo "${esc}[0Ksection_start:$(date +%s):${id}${collapsed}${cr}${esc}[0K${esc}[1m${esc}[36m${title}${esc}[m"
> +}
> +
> +close_section() {
> +    id=$1
> +    echo "${esc}[0Ksection_end:$(date +%s):${id}${cr}${esc}[0K"
> +}
> +
> +summary() {
> +    fixedReports=
> +    newReports=
> +    unfixedReports=
> +    while read -r line; do
> +        var=${line%%: *}
> +        val=${line#*: }
> +        eval "${var}=${val}"
> +    done <"${updateLog}"
> +
> +    case "${ci}" in
> +    github)
> +        nl="\\"
> +        ;;
> +    gitlab)
> +        nl=
> +        ;;
> +    jenkins)
> +        nl="<br/>"
> +        ;;
> +    *)
> +        nl=
> +        ;;
> +    esac
> +
> +    if [ -z "${newReports}" ]; then
> +        fixedMsg=
> +        unfixedMsg="Unfixed reports: ${unfixedReports}"
> +        countsMsg="${unfixedMsg}"
> +    else
> +        fixedMsg="Fixed reports: ${fixedReports}"
> +        unfixedMsg="Unfixed reports: ${unfixedReports} [new: ${newReports}]"
> +        countsMsg="${fixedMsg}${nl}
> +${unfixedMsg}"
> +    fi
> +    case "${ci}" in
> +    jenkins)
> +        cat <<EOF >"${summaryTxt}"
> +${countsMsg}                                                                              ${nl}
> +<a href="https://www.bugseng.com/eclair">
> +  <img src="${eclairReportUrlPrefix}/rsrc/eclair.svg" width="100" />
> +</a>
> +<h3>${jobHeadline}</h3>
> +<a href="${indexHtmlUrl}">Browse analysis results</a>
> +EOF
> +        ;;
> +    *)
> +        cat <<EOF >"${summaryTxt}"
> +<a href="https://www.bugseng.com/eclair">
> +  <img src="${eclairReportUrlPrefix}/rsrc/eclair.svg" width="100" />
> +</a>
> +Analysis Summary
> +
> +${jobHeadline}${nl}
> +${countsMsg}${nl}
> +[Browse analysis](${indexHtmlUrl})
> +EOF
> +        ;;
> +    esac
> +
> +    case ${ci} in
> +    github)
> +        cat "${summaryTxt}" >"${GITHUB_STEP_SUMMARY}"
> +        ;;
> +    gitlab)
> +        open_section ECLAIR_summary "ECLAIR analysis summary" ""
> +        # Generate summary and print it (GitLab-specific)
> +        cat <<EOF
> +${jobHeadline}
> +${countsMsg}
> +Browse analysis: ${esc}[33m${indexHtmlUrl}${esc}[m
> +EOF
> +        close_section ECLAIR_summary
> +        ;;
> +    jenkins)
> +        cat <<EOF
> +${jobHeadline}
> +${fixedMsg}
> +${unfixedMsg}
> +Browse analysis: ${indexHtmlUrl}
> +EOF
> +        ;;
> +    *)
> +        echo "Unexpected CI/CD context" >&2
> +        exit 1
> +        ;;
> +    esac
> +}
> +
> +log_file() {
> +    section_id=$1
> +    section_name=$2
> +    file=$3
> +    exit_code=$4
> +    if [ "${exit_code}" = 0 ]; then
> +        collapsed=[collapsed=true]
> +    else
> +        collapsed=
> +    fi
> +
> +    case ${ci} in
> +    github | jenkins)
> +        echo "${section_name}"
> +        ;;
> +    gitlab)
> +        open_section "${section_id}" "${section_name}" "${collapsed}"
> +        ;;
> +    *)
> +        echo "Unexpected CI/CD context" >&2
> +        exit 1
> +        ;;
> +    esac
> +
> +    cat "${file}"
> +
> +    case ${ci} in
> +    github | jenkins) ;;
> +    gitlab)
> +        close_section "${section_id}"
> +        ;;
> +    *) ;;
> +    esac
> +}
> +
> +maybe_log_file_exit() {
> +    section_id=$1
> +    section_name=$2
> +    file=$3
> +    exit_code=$4
> +
> +    case ${ci} in
> +    github | jenkins)
> +        echo "${section_name}"
> +        ;;
> +    gitlab)
> +        open_section "${section_id}" "${section_name}" ""
> +        ;;
> +    *)
> +        echo "Unexpected CI/CD context" >&2
> +        exit 1
> +        ;;
> +    esac
> +
> +    if [ "${exit_code}" != 0 ]; then
> +        cat "${file}"
> +    fi
> +
> +    case ${ci} in
> +    github | jenkins) ;;
> +    gitlab)
> +        close_section "${section_id}"
> +        ;;
> +    *) ;;
> +    esac
> +    return "${exit_code}"
> +}
> +
> +is_enabled() {
> +    case "$1" in
> +    true | TRUE | y | Y | yes | YES | 1)
> +        return 0
> +        ;;
> +    *)
> +        return 1
> +        ;;
> +    esac
> +}

This seems imporant too


> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
> new file mode 100644
> index 0000000000..0f7950f5ab
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -0,0 +1,172 @@
> +variantSubDir=
> +variantHeadline=
> +if [ -n "${VARIANT:-}" ]; then
> +    variantSubDir="/${VARIANT}"
> +    variantHeadline=" [${VARIANT}]"
> +fi
> +
> +# AUTO PR Feature
> +# If the following variables are defined, then all pipelines
> +# of other branches will be considered pull-requests to
> +# autoPRBranch.
> +# Customized
> +autoPRRepository="${AUTO_PR_REPOSITORY:-}"
> +# Customized
> +autoPRBranch="${AUTO_PR_BRANCH:-}"
> +
> +# Customized
> +artifactsRoot=/var/local/eclair
> +
> +case "${ci}" in
> +github)
> +    # To be customized
> +    repository="${GITHUB_REPOSITORY}"
> +    jobId="${GITHUB_RUN_NUMBER}"
> +
> +    autoPRRemoteUrl="${GITHUB_SERVER_URL}/${autoPRRepository:-}"
> +
> +    case "${GITHUB_EVENT_NAME}" in
> +    pull_request*)
> +        event=pull_request
> +        pullRequestId="${GITHUB_EVENT_PULL_REQUEST_NUMBER}"
> +        pullRequestHeadRepo="${PR_HEAD_REPO}"
> +        pullRequestHeadRef="${PR_HEAD_REF}"
> +        pullRequestBaseRef="${PR_BASE_REF}"
> +        pullRequestUser="${PR_USER}"
> +        # baseCommitId and headCommitId are the most recent merge points without conflicts
> +        git fetch -q --deepen=2
> +        baseCommitId=$(git show -s --pretty=%H HEAD^1)
> +        headCommitId=$(git show -s --pretty=%H HEAD^2)
> +        ;;
> +    push | workflow_dispatch)
> +        event=push
> +        # Extract the branch name from "refs/heads/<branch>"
> +        branch="${GITHUB_REF#refs/heads/}"
> +        headCommitId="${GITHUB_SHA}"
> +        pushUser="${GITHUB_ACTOR}"
> +        ;;
> +    *)
> +        echo "Unexpected GITHUB_REF ${GITHUB_REF}" >&2
> +        exit 1
> +        ;;
> +    esac
> +    ;;
> +gitlab)
> +    # Customized
> +    repository="${CI_PROJECT_PATH}"
> +    jobId="${CI_JOB_ID}"
> +
> +    gitlabApiUrl="${CI_SERVER_PROTOCOL}://${CI_SERVER_HOST}:${CI_SERVER_PORT}/api/v4"
> +    autoPRRemoteUrl="${CI_SERVER_PROTOCOL}://${CI_SERVER_HOST}:${CI_SERVER_PORT}/${autoPRRepository:-}"
> +
> +    # Customized
> +    gitlabBotToken="${ECLAIR_BOT_TOKEN:-}"
> +
> +    case "${CI_PIPELINE_SOURCE}" in
> +    merge_request_event)
> +        event=pull_request
> +        pullRequestId="${CI_MERGE_REQUEST_IID}"
> +        pullRequestHeadRef="${CI_MERGE_REQUEST_SOURCE_BRANCH_NAME}"
> +        pullRequestHeadRepo="${CI_MERGE_REQUEST_SOURCE_PROJECT_PATH}"
> +        pullRequestBaseRef="${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}"
> +        pullRequestUser="${GITLAB_USER_LOGIN}"
> +        headCommitId="${CI_COMMIT_SHA}"
> +        baseCommitId="${CI_MERGE_REQUEST_DIFF_BASE_SHA}"
> +        ;;
> +    push | pipeline | web)
> +        event=push
> +        branch="${CI_COMMIT_BRANCH}"
> +        headCommitId="${CI_COMMIT_SHA}"
> +        pushUser="${GITLAB_USER_NAME}"
> +        ;;
> +    *)
> +        echo "Unexpected event ${CI_PIPELINE_SOURCE}" >&2
> +        exit 1
> +        ;;
> +    esac
> +    ;;
> +jenkins)
> +    # To be customized
> +    repository="${JOB_BASE_NAME}"
> +    project="${JOB_NAME}"
> +    jobId="${BUILD_NUMBER}"
> +
> +    jenkinsApiUrl="${JENKINS_URL}"
> +    autoPRRemoteUrl="${JENKINS_URL}/${autoPRRepository:-}"
> +
> +    # To be customized
> +    jenkinsBotUsername="${ECLAIR_BOT_USERNAME:-}"
> +    jenkinsBotToken="${ECLAIR_BOT_TOKEN:-}"
> +
> +    event=push
> +    branch="${GIT_BRANCH}"
> +    headCommitId="${GIT_COMMIT}"
> +    pushUser=$(git show --pretty='format:%aN' -s)
> +    ;;
> +*)
> +    echo "Unexpected CI/CD context" >&2
> +    exit 1
> +    ;;
> +esac
> +
> +if [ "${event}" = "push" ] && [ -n "${autoPRBranch:-}" ]; then
> +    # AUTO PR Feature enabled
> +    if ! [ "${branch}" = "${autoPRBranch}" ] ||
> +        ! [ "${repository}" = "${autoPRRepository}" ]; then
> +        event=auto_pull_request
> +    fi
> +fi
> +
> +case "${event}" in
> +pull_request)
> +    subDir="${pullRequestHeadRepo}.ecdf/${pullRequestBaseRef}"
> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pullRequestUser} wants to merge ${pullRequestHeadRepo}:${pullRequestHeadRef} (${headCommitId}) into ${pullRequestBaseRef} (${baseCommitId})"
> +    ;;
> +push)
> +    subDir="${branch}"
> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: branch ${branch} (${headCommitId})"
> +    badgeLabel="ECLAIR ${ANALYSIS_KIND} ${branch}${variantHeadline} #${jobId}"
> +    ;;
> +auto_pull_request)
> +    git remote remove autoPRRemote || true
> +    git remote add autoPRRemote "${autoPRRemoteUrl}"
> +    git fetch autoPRRemote
> +    subDir="${branch}"
> +    baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD)
> +    jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${branch} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
> +    ;;
> +*)
> +    echo "Unexpected event ${event}" >&2
> +    exit 1
> +    ;;
> +esac
> +
> +case "${repository}" in
> +xen-project/xen)
> +    # Customized
> +    keepOldAnalyses=0
> +    ;;
> +xen-project/*)
> +    # Customized
> +    keepOldAnalyses=10
> +    ;;
> +*)
> +    echo "Unexpected repository" >&2
> +    exit 1
> +    ;;
> +esac
> +
> +ECLAIR_BIN_DIR=/opt/bugseng/eclair/bin/
> +
> +artifactsDir="${artifactsRoot}/xen-project.ecdf/${repository}/ECLAIR_${ANALYSIS_KIND}"
> +subDir="${subDir}${variantSubDir}"
> +jobHeadline="${jobHeadline}${variantHeadline}"
> +
> +# Customized
> +eclairReportUrlPrefix=https://saas.eclairit.com:3787
> +
> +jobDir="${artifactsDir}/${subDir}/${jobId}"
> +updateLog="${analysisOutputDir}/update.log"
> +commentLog="${analysisOutputDir}/comment.json"
> +indexHtmlUrl="${eclairReportUrlPrefix}/fs${jobDir}/index.html"
> +summaryTxt="${analysisOutputDir}/summary.txt"

I see here a bunch of things, some of them related to github and
jenking that we don't use. For the sake of not having dead code under
xen.git, I wonder if it makes sense to have the script under xen.git or
if it would be better to keep it outside in another repository. I am
open to suggestions.


> diff --git a/automation/eclair_analysis/ECLAIR/action_clean_added.sh b/automation/eclair_analysis/ECLAIR/action_clean_added.sh
> new file mode 100755
> index 0000000000..59bc35fd13
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action_clean_added.sh
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +set -eu
> +
> +usage() {
> +    echo "Usage: $0 ANALYSIS_OUTPUT_DIR" >&2
> +    exit 2
> +}
> +
> +[ $# -eq 1 ] || usage
> +
> +analysisOutputDir=$1
> +
> +cleanAddedTxt="${analysisOutputDir}/clean_added.log"
> +
> +# Load settings and helpers
> +. "$(dirname "$0")/action.helpers"
> +. "$(dirname "$0")/action.settings"
> +
> +unexpectedReports=$("${ECLAIR_BIN_DIR}eclair_report" \
> +    "-db='${analysisOutputDir}/PROJECT.ecd'" \
> +    "-sel_unfixed=unfixed" \
> +    "-sel_tag_glob=clean_added,clean,added" \
> +    "-print='',reports_count()")
> +
> +if [ "${unexpectedReports}" -gt 0 ]; then
> +    cat <<EOF >"${cleanAddedTxt}"
> +Failure: ${unexpectedReports} unexpected reports found.
> +Unexpected reports are tagged 'clean:added'.
> +EOF
> +    exit 1
> +else
> +    cat <<EOF >"${cleanAddedTxt}"
> +Success: No unexpected reports.
> +EOF
> +fi
> diff --git a/automation/eclair_analysis/ECLAIR/action_log.sh b/automation/eclair_analysis/ECLAIR/action_log.sh
> new file mode 100755
> index 0000000000..67125b08f3
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action_log.sh
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +set -eu
> +
> +usage() {
> +    echo "Usage: $0 SECTION_ID SECTION_NAME FILE EXIT_CODE" >&2
> +    exit 2
> +}
> +
> +[ $# -eq 4 ] || usage
> +
> +# Load settings and helpers
> +. "$(dirname "$0")/action.helpers"
> +
> +log_file "$@"
> diff --git a/automation/eclair_analysis/ECLAIR/action_pull_request.sh b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
> new file mode 100644
> index 0000000000..68f7e6282e
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action_pull_request.sh
> @@ -0,0 +1,57 @@
> +#!/bin/sh
> +
> +set -eu
> +
> +usage() {
> +    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR COMMIT_ID" >&2
> +    exit 2
> +}
> +
> +[ $# -eq 2 ] || usage
> +
> +wtoken=$1
> +analysisOutputDir=$2
> +
> +# Load settings and helpers
> +. "$(dirname "$0")/action.helpers"
> +. "$(dirname "$0")/action.settings"
> +
> +curl -sS "${eclairReportUrlPrefix}/ext/update_pull_request" \
> +    -F "wtoken=${wtoken}" \
> +    -F "artifactsDir=${artifactsDir}" \
> +    -F "subDir=${subDir}" \
> +    -F "jobId=${jobId}" \
> +    -F "jobHeadline=${jobHeadline}" \
> +    -F "baseCommitId=${baseCommitId}" \
> +    -F "keepOldAnalyses=${keepOldAnalyses}" \
> +    -F "db=@${analysisOutputDir}/PROJECT.ecd" \
> +    >"${updateLog}"
> +ex=0
> +grep -Fq "unfixedReports: " "${updateLog}" || ex=$?
> +maybe_log_file_exit PUBLISH_RESULT "Publishing results" "${updateLog}" "${ex}"
> +
> +summary
> +
> +if is_enabled "${ENABLE_ECLAIR_BOT:-}"; then
> +    case ${ci} in
> +    github)
> +        ex=0
> +        gh api \
> +            --method POST \
> +            "/repos/${repository}/issues/${pullRequestId}/comments" \
> +            -F "body=@${summaryTxt}" \
> +            --silent >"${commentLog}" 2>&1 || ex=$?
> +        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "${ex}"
> +        ;;
> +    gitlab)
> +        curl -sS --request POST \
> +            "${gitlabApiUrl}/projects/${CI_PROJECT_ID}/merge_requests/${pullRequestId}/notes" \
> +            -H "PRIVATE-TOKEN: ${gitlabBotToken}" \
> +            -F "body=<${summaryTxt}" >"${commentLog}"
> +        ex=0
> +        grep -Fq "Unfixed reports: " "${commentLog}" || ex=$?
> +        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "${ex}"
> +        ;;
> +    *) ;;
> +    esac
> +fi
> diff --git a/automation/eclair_analysis/ECLAIR/action_push.sh b/automation/eclair_analysis/ECLAIR/action_push.sh
> new file mode 100755
> index 0000000000..45215fbf00
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action_push.sh
> @@ -0,0 +1,95 @@
> +#!/bin/sh
> +
> +set -eu
> +
> +usage() {
> +    echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
> +    exit 2
> +}
> +
> +[ $# -eq 2 ] || usage
> +
> +wtoken=$1
> +analysisOutputDir=$2
> +
> +# Load settings and helpers
> +. "$(dirname "$0")/action.helpers"
> +. "$(dirname "$0")/action.settings"
> +
> +case "${event}" in
> +push)
> +    curl -sS "${eclairReportUrlPrefix}/ext/update_push" \
> +        -F "wtoken=${wtoken}" \
> +        -F "artifactsDir=${artifactsDir}" \
> +        -F "subDir=${subDir}" \
> +        -F "jobId=${jobId}" \
> +        -F "jobHeadline=${jobHeadline}" \
> +        -F "commitId=${headCommitId}" \
> +        -F "badgeLabel=${badgeLabel}" \
> +        -F "keepOldAnalyses=${keepOldAnalyses}" \
> +        -F "db=@${analysisOutputDir}/PROJECT.ecd" \
> +        >"${updateLog}"
> +    ;;
> +auto_pull_request)
> +    curl -sS "${eclairReportUrlPrefix}/ext/update_pull_request" \
> +        -F "wtoken=${wtoken}" \
> +        -F "artifactsDir=${artifactsDir}" \
> +        -F "subDir=${subDir}" \
> +        -F "jobId=${jobId}" \
> +        -F "jobHeadline=${jobHeadline}" \
> +        -F "baseCommitId=${baseCommitId}" \
> +        -F "keepOldAnalyses=${keepOldAnalyses}" \
> +        -F "db=@${analysisOutputDir}/PROJECT.ecd" \
> +        >"${updateLog}"
> +    ;;
> +*)
> +    echo "Unexpected event ${event}" >&2
> +    exit 1
> +    ;;
> +esac
> +
> +ex=0
> +grep -Fq "unfixedReports: " "${updateLog}" || ex=$?
> +maybe_log_file_exit PUBLISH_RESULT "Publishing results" "${updateLog}" "${ex}"
> +
> +summary
> +
> +if is_enabled "${ENABLE_ECLAIR_BOT:-}"; then
> +    case ${ci} in
> +    github)
> +        ex=0
> +        gh api \
> +            --method POST \
> +            "/repos/${repository}/commits/${headCommitId}/comments" \
> +            -F "body=@${summaryTxt}" \
> +            --silent >"${commentLog}" 2>&1 || ex=$?
> +        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "${ex}"
> +        ;;
> +    gitlab)
> +        curl -sS --request POST \
> +            "${gitlabApiUrl}/projects/${CI_PROJECT_ID}/repository/commits/${CI_COMMIT_SHA}/comments" \
> +            -H "PRIVATE-TOKEN: ${gitlabBotToken}" \
> +            -F "note=<${summaryTxt}" >"${commentLog}"
> +        ex=0
> +        grep -Fq "Unfixed reports: " "${commentLog}" || ex=$?
> +        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "${ex}"
> +        ;;
> +    jenkins)
> +        ex=0
> +        curl \
> +            --user "${jenkinsBotUsername}:${jenkinsBotToken}" \
> +            --data-urlencode "description=$(cat "${summaryTxt}")" \
> +            --data-urlencode "Submit=Submit" \
> +            "${jenkinsApiUrl}job/${project}/${jobId}/submitDescription" \
> +            >"${commentLog}" 2>&1 || ex=$?
> +        curl \
> +            --user "${jenkinsBotUsername}:${jenkinsBotToken}" \
> +            --data-urlencode "description=$(cat "${summaryTxt}")" \
> +            --data-urlencode "Submit=Submit" \
> +            "${jenkinsApiUrl}job/${project}/submitDescription" \
> +            >"${commentLog}" 2>&1 || ex=$?
> +        maybe_log_file_exit ADD_COMMENT "Adding comment" "${commentLog}" "${ex}"
> +        ;;
> +    *) ;;
> +    esac
> +fi
> diff --git a/automation/eclair_analysis/ECLAIR/action_upload_sarif.sh b/automation/eclair_analysis/ECLAIR/action_upload_sarif.sh
> new file mode 100755
> index 0000000000..60b8034fcc
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/action_upload_sarif.sh
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +
> +set -eu
> +
> +usage() {
> +    echo "Usage: $0 SARIF_FILE" >&2
> +    exit 2
> +}
> +
> +[ $# -eq 1 ] || usage
> +
> +HERE=$( (
> +    cd "$(dirname "$0")"
> +    echo "${PWD}"
> +))
> +
> +. "${HERE}/action.helpers"
> +
> +sarifFile=$1
> +sarifPayload=${HERE}/sarif.gz.b64
> +uploadLog=${HERE}/upload_sarif.log
> +
> +gzip -c "${sarifFile}" | base64 -w0 >"${sarifPayload}"
> +
> +ex=0
> +gh api --method POST -H "Accept: application/vnd.github+json" \
> +    "/repos/${GITHUB_REPOSITORY}/code-scanning/sarifs" \
> +    -f "commit_sha=${GITHUB_SHA}" -f "ref=${GITHUB_REF}" \
> +    -F "sarif=@${sarifPayload}" \
> +    --silent >"${uploadLog}" 2>&1 || ex=$?
> +maybe_log_file_exit ADD_COMMENT "Uploading SARIF" "${uploadLog}" "${ex}"

Same for the scripts up until this point.

Instead, below it looks the information is a lot more critical to the
ECLAIR configuration and tied to the information we have under
docs/misra.

My suggestion is to add all the config file and script below to
automation/eclair_analysis under xen.git. For these ones above, I'll
leave it to you. If it makes it easier to have them under xen.git for
your ECLAIR runner maintainance, then let's add them. Otherwise if not,
let's not added them.

Under xen.git, it is key that we have all the config files and scripts
that would need to change if we decide to change something in
docs/misra/rules.rst, docs/misra/C-language-toolchain.rst or
docs/misra/exclude-list.rst. Everything else is optional and we could
decide to keep them out of xen.git especially if they have
functionalities that are not needed by the Xen community (e.g. jenkins
integration). We can also decide to keep them all together in xen.git as
long as you are happy to keep maintaining them.

Cheers,

Stefano


> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> new file mode 100644
> index 0000000000..fe418d6da1
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -0,0 +1,25 @@
> +-setq=set,getenv("SET")
> +-project_name=getenv("ECLAIR_PROJECT_NAME")
> +-project_root=getenv("ECLAIR_PROJECT_ROOT")
> +
> +-setq=data_dir,getenv("ECLAIR_DATA_DIR")
> +
> +-verbose
> +
> +-enable=B.REPORT.ECB
> +-config=B.REPORT.ECB,output=join_paths(data_dir,"FRAME.@FRAME@.ecb")
> +-config=B.REPORT.ECB,preprocessed=show
> +-config=B.REPORT.ECB,macros=10
> +
> +-enable=B.EXPLAIN
> +
> +-eval_file=toolchain.ecl
> +-eval_file=public_APIs.ecl
> +-eval_file=out_of_scope.ecl
> +-eval_file=deviations.ecl
> +-eval_file=call_properties.ecl
> +-eval_file=tagging.ecl
> +-eval_file=concat(set,".ecl")
> +
> +-doc="Hide reports in external code."
> +-reports+={hide,all_exp_external}
> diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
> new file mode 100755
> index 0000000000..47cdbb03ce
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/analyze.sh
> @@ -0,0 +1,106 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +set -o pipefail
> +
> +script_name="$(basename "$0")"
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name} <ARM64|X86_64> <Set0|Set1|Set2|Set3>"
> +}
> +
> +if [[ $# -ne 2 ]]; then
> +  usage
> +fi
> +
> +# Absolute path of the ECLAIR bin directory.
> +export ECLAIR_BIN_DIR=/opt/bugseng/eclair/bin/
> +
> +# Directory where this script resides: usually in a directory named "ECLAIR".
> +SCRIPT_DIR="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +# Directory where to put all ECLAIR output and temporary files.
> +if [[ -z "${ECLAIR_OUTPUT_DIR:-}" ]]; then
> +  ECLAIR_OUTPUT_DIR="${PWD}/ECLAIR/out"
> +fi
> +
> +export ECLAIR_DIAGNOSTICS_OUTPUT="${ECLAIR_OUTPUT_DIR}/ANALYSIS.log"
> +# Set the variable for the build log file.
> +ECLAIR_BUILD_LOG=${ECLAIR_OUTPUT_DIR}/BUILD.log
> +# Set the variable for the report log file.
> +ECLAIR_REPORT_LOG=${ECLAIR_OUTPUT_DIR}/REPORT.log
> +
> +if [[ "$1" = "X86_64" ]]; then
> +  export CROSS_COMPILE=
> +  export XEN_TARGET_ARCH=x86_64
> +  EXTRA_ECLAIR_ENV_OPTIONS=-disable=MC3R1.R20.7
> +elif [[ "$1" = "ARM64" ]]; then
> +  export CROSS_COMPILE=aarch64-linux-gnu-
> +  export XEN_TARGET_ARCH=arm64
> +else
> +  fatal "Unknown configuration: $1"
> +fi
> +
> +VARIANT="${XEN_TARGET_ARCH}"
> +
> +# Used in analysis.ecl
> +case "$2" in
> +Set0|Set1|Set2|Set3)
> +  export SET="$2"
> +  ;;
> +*)
> +  fatal "Unknown configuration: $2"
> +  ;;
> +esac
> +
> +export CC_ALIASES="${CROSS_COMPILE}gcc-12"
> +export CXX_ALIASES="${CROSS_COMPILE}g++-12"
> +export LD_ALIASES="${CROSS_COMPILE}ld"
> +export AR_ALIASES="${CROSS_COMPILE}ar"
> +export AS_ALIASES="${CROSS_COMPILE}as"
> +export FILEMANIP_ALIASES="cp mv ${CROSS_COMPILE}objcopy"
> +
> +# ECLAIR binary data directory and workspace.
> +export ECLAIR_DATA_DIR="${ECLAIR_OUTPUT_DIR}/.data"
> +# ECLAIR workspace.
> +export ECLAIR_WORKSPACE="${ECLAIR_DATA_DIR}/eclair_workspace"
> +
> +# Identifies the particular build of the project.
> +export ECLAIR_PROJECT_NAME="XEN_${VARIANT}-${SET}"
> +# All paths mentioned in ECLAIR reports that are below this directory
> +# will be presented as relative to ECLAIR_PROJECT_ROOT.
> +export ECLAIR_PROJECT_ROOT="${PWD}"
> +
> +# Erase and recreate the output directory and the data directory.
> +rm -rf "${ECLAIR_OUTPUT_DIR:?}/*"
> +mkdir -p "${ECLAIR_DATA_DIR}"
> +
> +# Perform the build (from scratch) in an ECLAIR environment.
> +"${ECLAIR_BIN_DIR}eclair_env" \
> +    "-config_file='${SCRIPT_DIR}/analysis.ecl'" \
> +    "${EXTRA_ECLAIR_ENV_OPTIONS}" \
> +  -- "${SCRIPT_DIR}/../build.sh" "$1" | tee "${ECLAIR_BUILD_LOG}"
> +
> +
> +# Create the project database.
> +PROJECT_ECD="${ECLAIR_OUTPUT_DIR}/PROJECT.ecd"
> +find "${ECLAIR_DATA_DIR}" -maxdepth 1 -name "FRAME.*.ecb" |
> +  sort | xargs cat |
> +  "${ECLAIR_BIN_DIR}eclair_report" \
> +    "-create_db='${PROJECT_ECD}'" \
> +    -load=/dev/stdin > "${ECLAIR_REPORT_LOG}" 2>&1
> +
> +# Create the Jenkins reports file.
> +"${ECLAIR_BIN_DIR}eclair_report" \
> +  "-db='${PROJECT_ECD}'" \
> +  "-eval_file='${SCRIPT_DIR}/report.ecl'" \
> +  >> "${ECLAIR_REPORT_LOG}" 2>&1
> +
> +"${SCRIPT_DIR}/print_analyzed_files.sh" "${PROJECT_ECD}" "${ECLAIR_OUTPUT_DIR}"
> diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automation/eclair_analysis/ECLAIR/call_properties.ecl
> new file mode 100644
> index 0000000000..3f7794bf8b
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
> @@ -0,0 +1,106 @@
> +
> +-call_properties+={"name(printk)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"name(debugtrace_printk)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"name(panic)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"macro(^domain_crash$)", {"pointee_write(2..=never)", "taken()"}}
> +-call_properties+={"macro(^(g?d|mm_)?printk$)", {"pointee_write(2..=never)", "taken()"}}
> +-call_properties+={"macro(^guest_bug_on_failed$)", {"pointee_write(1=never)", "taken()"}}
> +-call_properties+={"macro(^spin_lock_init_prof$)", {"pointee_write(2=never)", "taken()"}}
> +-call_properties+={"macro(^sched_test_func$)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"macro(^dev_(info|warn)$)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"macro(^PAGING_DEBUG$)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"macro(^ACPI_(WARNING|ERROR|INFO)$)", {"pointee_write(1..=never)", "taken()"}}
> +-call_properties+={"name(fdt_get_property_by_offset_)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(read_atomic_size)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(device_tree_get_reg)", {"pointee_write(4..=always)", "pointee_read(4..=never)", "taken()"}}
> +-call_properties+={"name(dt_get_range)", {"pointee_write(3..=always)", "pointee_read(3..=never)", "taken()"}}
> +-call_properties+={"name(parse_static_mem_prop)", {"pointee_write(2..=always)", "pointee_read(2..=never)", "taken()"}}
> +-call_properties+={"name(get_ttbr_and_gran_64bit)", {"pointee_write(1..2=always)", "pointee_read(1..2=never)", "taken()"}}
> +-call_properties+={"name(hvm_emulate_init_once)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(__vmread)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(hvm_pci_decode_addr)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(vpci_mmcfg_decode_addr)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(x86emul_decode)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(unmap_grant_ref)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(arm_smmu_cmdq_build_cmd)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(pci_size_mem_bar)", {"pointee_write(4=always)", "pointee_read(4=never)", "taken()"}}
> +-call_properties+={"name(_hvm_read_entry)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(hvm_map_guest_frame_rw)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(guest_cpuid)", {"pointee_write(4=always)", "pointee_read(4=never)", "taken()"}}
> +-call_properties+={"name(epte_get_entry_emt)", {"pointee_write(5=always)", "pointee_read(5=never)", "taken()"}}
> +-call_properties+={"name(mcheck_mca_logout)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(set_field_in_reg_u32)", {"pointee_write(5=always)", "pointee_read(5=never)", "taken()"}}
> +-call_properties+={"name(alloc_affinity_masks)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(xasprintf)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(find_non_smt)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(call_rcu)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(getdomaininfo)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"^MAPPING_(INSERT|SEARCH)\\(.*$", {"pointee_write(2..=always)", "pointee_read(2..=never)", "taken()"}}
> +-call_properties+={"name(FormatDec)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(FormatHex)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(p2m_get_ioreq_server)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(elf_memset_unchecked)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(set_iommu_pte_present)", {"pointee_write(7=always)", "pointee_read(7=never)", "taken()"}}
> +-call_properties+={"name(clear_iommu_pte_present)", {"pointee_write(4=always)", "pointee_read(4=never)", "taken()"}}
> +-call_properties+={"name(vcpu_runstate_get)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(va_start)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(sgi_target_init)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(get_hw_residencies)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(x86_cpu_policy_to_featureset)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"^simple_strtou?ll?\\(.*$", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(msi_compose_msg)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(print_tainted)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(get_hvm_registers)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(x86_insn_modrm)", {"pointee_write(2..3=always)", "pointee_read(2..3=never)", "taken()"}}
> +-call_properties+={"name(cpuid_count_leaf)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(rcu_lock_remote_domain_by_id)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(cpuid_count)", {"pointee_write(3..=always)", "pointee_read(3..=never)", "taken()"}}
> +-call_properties+={"name(efi_boot_mem_unused)", {"pointee_write(1..=always)", "pointee_read(1..=never)", "taken()"}}
> +-call_properties+={"name(collect_time_info)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(setup_xstate_comp)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"name(map_domain_gfn)", {"pointee_read(5=never)", "taken()"}}
> +-call_properties+={"name(fdt_getprop)", {"pointee_read(4=never)", "taken()"}}
> +-call_properties+={"name(fdt_get_name)", {"pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(fdt_get_property)", {"pointee_read(4=never)", "taken()"}}
> +-call_properties+={"name(pci_get_host_bridge_segment)", {"pointee_read(2=never)", "taken()"}}
> +-call_properties+={"name(dt_get_property)", {"pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(dt_property_read_u32)", {"pointee_read(3=never)", "taken()"}}
> +-call_properties+={"name(dt_device_get_paddr)", {"pointee_read(3..4=never)", "taken()"}}
> +-call_properties+={"name(get_evtchn_dt_property)", {"pointee_write(2..3=maybe)", "pointee_read(2..3=never)", "taken()"}}
> +-call_properties+={"name(setup_chosen_node)", {"pointee_write(2..3=maybe)", "pointee_read(2..3=never)", "taken()"}}
> +-call_properties+={"name(queue_remove_raw)", {"pointee_read(2=never)", "taken()"}}
> +-call_properties+={"macro(^memset$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"macro(^va_start$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"macro(^memcmp$)", {"pointee_write(1..2=never)", "taken()"}}
> +-call_properties+={"macro(^memcpy$)", {"pointee_write(1=always&&2..=never)", "pointee_read(1=never&&2..=always)", "taken()"}}
> +
> +-doc_begin="Property inferred as a consequence of the semantics of device_tree_get_reg"
> +-call_properties+={"name(acquire_static_memory_bank)", {"pointee_write(4..=always)", "pointee_read(4..=never)", "taken()"}}
> +-doc_end
> +
> +-doc_begin="Property inferred as a consequence of the semantics of dt_set_cell"
> +-call_properties+={"name(set_interrupt)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-doc_end
> +
> +-doc_begin="Property inferred as a consequence of the semantics of __p2m_get_mem_access"
> +-call_properties+={"name(p2m_get_mem_access)", {"pointee_write(3=always)", "pointee_read(3=never)", "taken()"}}
> +-doc_end
> +
> +-doc_begin="This function has alternative definitions with props {write=always,read=never} and {write=never,read=never}"
> +-call_properties+={"name(alloc_cpumask_var)", {"pointee_write(1=maybe)", "pointee_read(1=never)", "taken()"}}
> +-doc_end
> +
> +-doc_begin="Property inferred as a consequence of the semantics of alloc_cpumask_var"
> +-call_properties+={"name(xenctl_bitmap_to_cpumask)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-doc_end
> +
> +-doc_begin="The call to bitmap_and causes the pointee of dstp to be always written"
> +-call_properties+={"^cpumask_(and|andnot|clear|copy|complement).*$", {"pointee_write(1=always)", "pointee_read(1=never)" "taken()"}}
> +-call_properties+={"^bitmap_(andnot|complement|fill).*$", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-doc_end
> +
> +-doc_begin="The .*copy_(to|from).* helpers all have a memcpy-like expectation that the destination is a copy of the source.
> +Furthermore, their uses do initialize the involved variables as needed by futher uses in the caller."
> +-call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
> +-call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
> +-doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> new file mode 100644
> index 0000000000..e1a06daf2f
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -0,0 +1,298 @@
> +### Set 1 ###
> +
> +#
> +# Series 2.
> +#
> +
> +-doc_begin="The compiler implementation guarantees that the unreachable code is removed.
> +Constant expressions and unreachable branches of if and switch statements are expected."
> +-config=MC3R1.R2.1,+reports={safe,"first_area(^.*has an invariantly.*$)"}
> +-config=MC3R1.R2.1,+reports={safe,"first_area(^.*incompatible with labeled statement$)"}
> +-doc_end
> +
> +-doc_begin="Some functions are intended to be not referenced."
> +-config=MC3R1.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
> +-doc_end
> +
> +-doc_begin="Unreachability in the following macros are expected and safe."
> +-config=MC3R1.R2.1,statements+={safe,"macro(name(BUG||assert_failed||ERROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
> +-doc_end
> +
> +-doc_begin="Proving compliance with respect to Rule 2.2 is generally impossible:
> +see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gives us
> +confidence that no evidence of errors in the program's logic has been missed due
> +to undetected violations of Rule 2.2, if any. Testing on time behavior gives us
> +confidence on the fact that, should the program contain dead code that is not
> +removed by the compiler, the resulting slowdown is negligible."
> +-config=MC3R1.R2.2,reports+={disapplied,"any()"}
> +-doc_end
> +
> +#
> +# Series 3.
> +#
> +
> +-doc_begin="Comments starting with '/*' and containing hyperlinks are safe as
> +they are not instances of commented-out code."
> +-config=MC3R1.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
> +-doc_end
> +
> +#
> +# Series 4.
> +#
> +
> +-doc_begin="The directive has been accepted only for the ARM codebase."
> +-config=MC3R1.D4.3,reports+={disapplied,"!(any_area(any_loc(file(^xen/arch/arm/arm64/.*$))))"}
> +-doc_end
> +
> +-doc_begin="Depending on the compiler, rewriting the following function-like
> +macros as inline functions is not guaranteed to have the same effect."
> +-config=MC3R1.D4.9,macros+={deliberate,"name(likely)"}
> +-config=MC3R1.D4.9,macros+={deliberate,"name(unlikely)"}
> +-config=MC3R1.D4.9,macros+={deliberate,"name(unreachable)"}
> +-doc_end
> +
> +-doc_begin="These macros can be used on both pointers and unsigned long type values."
> +-config=MC3R1.D4.9,macros+={safe,"name(virt_to_maddr)"}
> +-config=MC3R1.D4.9,macros+={safe,"name(virt_to_mfn)"}
> +-doc_end
> +
> +-doc_begin="Rewriting variadic macros as variadic functions might have a negative impact on safety."
> +-config=MC3R1.D4.9,macros+={deliberate,"variadic()"}
> +-doc_end
> +
> +-doc_begin="Rewriting macros with arguments that are, in turn, arguments of
> +__builtin_constant_p() can change the behavior depending on the optimization
> +level."
> +-config=MC3R1.D4.9,macro_argument_context+="skip_to(class(type||expr||decl,any),
> +                                            call(name(__builtin_constant_p)))"
> +-doc_end
> +
> +-doc_begin="Function-like macros defined in public headers are meant to be
> +usable in C89 mode without any extensions. Hence they cannot be replaced by
> +inline functions."
> +-config=MC3R1.D4.9,macros+={deliberate, "loc(file(api:public))"}
> +-doc_end
> +
> +-doc_begin="This header file is autogenerated or empty, therefore it poses no
> +risk if included more than once."
> +-file_tag+={empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
> +-file_tag+={autogen_headers, "^xen/include/xen/compile\\.h$||^xen/include/generated/autoconf.h$||^xen/include/xen/hypercall-defs.h$"}
> +-config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(file(empty_header||autogen_headers)))"}
> +-doc_end
> +
> +-doc_begin="Files that are intended to be included more than once do not need to
> +conform to the directive."
> +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
> +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
> +-doc_end
> +
> +#
> +# Series 5.
> +#
> +
> +-doc_begin="The project adopted the rule with an exception listed in
> +'docs/misra/rules.rst'"
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^READ_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max_t$))&&any_exp(macro(^min_t$))))"}
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read[bwlq]$))&&any_exp(macro(^read[bwlq]_relaxed$))))"}
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^per_cpu$))&&any_exp(macro(^this_cpu$))))"}
> +-doc_end
> +
> +-doc_begin="The identifier 'fdt' is a widely-used name, for which no suitable
> +substitute can be found. It is understood in 'xen/arch/arm/efi-boot.h' that the
> +static variable 'fdt' cannot be confused with parameter names of the function
> +declarations that are present in the file."
> +-file_tag+={efi_boot_h, "^xen/arch/arm/efi/efi-boot\\.h$"}
> +-config=MC3R1.R5.3,reports+={deliberate, "any_area(decl(kind(var)&&static_storage()&&^fdt$)&&any_loc(file(efi_boot_h)))"}
> +-doc_end
> +
> +-doc_begin="The identifier 'start' is a widely-used name, for which no suitable
> +substitute can be found. It is understood in 'xen/include/xen/kernel.h' that the
> +extern variable 'start' cannot be confused with omonymous parameter names of the
> +function declarations where that variable is visible."
> +-file_tag+={kernel_h, "^xen/include/xen/kernel\\.h$"}
> +-config=MC3R1.R5.3,reports+={deliberate, "any_area(decl(kind(var)&&linkage(external)&&^start$)&&any_loc(file(kernel_h)))"}
> +-doc_end
> +
> +-doc_begin="Function-like macros cannot be confused with identifiers that are
> +neither functions nor pointers to functions."
> +-config=MC3R1.R5.5,reports={safe,"all_area(decl(node(enum_decl||record_decl||field_decl||param_decl||var_decl)&&!type(canonical(address((node(function||function_no_proto))))))||macro(function_like()))"}
> +-doc_end
> +
> +-doc_begin="The use of these identifiers for both macro names and other entities
> +is deliberate and does not generate developer confusion."
> +-config=MC3R1.R5.5,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R5\\.5.*$, begin-1))"}
> +-doc_end
> +
> +-doc_begin="The definition of macros and functions ending in '_bit' that use the
> +same identifier in 'bitops.h' is deliberate and safe."
> +-file_tag+={bitops_h, "^xen/arch/x86/include/asm/bitops\\.h$"}
> +-config=MC3R1.R5.5,reports+={safe, "all_area((decl(^.*_bit\\(.*$)||macro(^.*_bit$))&&all_loc(file(bitops_h)))"}
> +-doc_end
> +
> +-doc_begin="The definition of macros and functions beginning in 'str' or 'mem'
> +that use the same identifier in 'xen/include/xen/string.h' is deliberate and
> +safe."
> +-file_tag+={string_h, "^xen/include/xen/string\\.h$"}
> +-config=MC3R1.R5.5,reports+={safe, "any_area((decl(^(mem|str).*$)||macro(^(mem|str).*$))&&all_loc(file(string_h)))"}
> +-doc_end
> +
> +#
> +# Series 7.
> +#
> +
> +-doc_begin="Usage of the following constants is safe, since they are given as-is
> +in the inflate algorithm specification and there is therefore no risk of them
> +being interpreted as decimal constants."
> +-config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> +-doc_end
> +
> +-doc_begin="Violations in files that maintainers have asked to not modify in the
> +context of R7.2."
> +-file_tag+={adopted_r7_2,"^xen/include/xen/libfdt/.*$"}
> +-file_tag+={adopted_r7_2,"^xen/arch/x86/include/asm/x86_64/efibind.h$"}
> +-file_tag+={adopted_r7_2,"^xen/include/efi/efiapi\\.h$"}
> +-file_tag+={adopted_r7_2,"^xen/include/efi/efidef\\.h$"}
> +-file_tag+={adopted_r7_2,"^xen/include/efi/efiprot\\.h$"}
> +-file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/intel\\.c$"}
> +-file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/amd\\.c$"}
> +-file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/common\\.c$"}
> +-config=MC3R1.R7.2,reports+={deliberate,"any_area(any_loc(file(adopted_r7_2)))"}
> +-doc_end
> +
> +-doc_begin="Violations caused by __HYPERVISOR_VIRT_START are related to the
> +particular use of it done in xen_mk_ulong."
> +-config=MC3R1.R7.2,reports+={deliberate,"any_area(any_loc(macro(name(BUILD_BUG_ON))))"}
> +-doc_end
> +
> +-doc_begin="The following string literals are assigned to pointers to non
> +const-qualified char."
> +-config=MC3R1.R7.4,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R7\\.4.*$, begin-1))"}
> +-doc_end
> +
> +-doc_begin="Allow pointers of non-character type as long as the pointee is
> +const-qualified."
> +-config=MC3R1.R7.4,same_pointee=false
> +-doc_end
> +
> +#
> +# Series 8.
> +#
> +
> +-doc_begin="The following variables are compiled in multiple translation units
> +belonging to different executables and therefore are safe."
> +-config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> +-doc_end
> +
> +-doc_begin="Declarations without definitions are allowed (specifically when the
> +definition is compiled-out or optimized-out by the compiler)"
> +-config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
> +-doc_end
> +
> +-doc_begin="The gnu_inline attribute without static is deliberately allowed."
> +-config=MC3R1.R8.10,declarations+={deliberate,"property(gnu_inline)"}
> +-doc_end
> +
> +#
> +# Series 9.
> +#
> +
> +-doc_begin="The following variables are written before being set, therefore no
> +access to uninitialized memory locations happens, as explained in the deviation
> +comment."
> +-config=MC3R1.R9.1,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R9\\.1.*$, begin-1))"}
> +-doc_end
> +
> +-doc_begin="Violations in files that maintainers have asked to not modify in the
> +context of R9.1."
> +-file_tag+={adopted_r9_1,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
> +-config=MC3R1.R9.1,reports+={deliberate,"any_area(any_loc(file(adopted_r9_1)))"}
> +-doc_end
> +
> +-doc_begin="The possibility of committing mistakes by specifying an explicit
> +dimension is higher than omitting the dimension."
> +-config=MC3R1.R9.5,reports+={deliberate, "any()"}
> +-doc_end
> +
> +### Set 2 ###
> +
> +#
> +# Series 10.
> +#
> +
> +-doc_begin="The value-preserving conversions of integer constants are safe"
> +-config=MC3R1.R10.1,etypes={safe,"any()","preserved_integer_constant()"}
> +-config=MC3R1.R10.3,etypes={safe,"any()","preserved_integer_constant()"}
> +-config=MC3R1.R10.4,etypes={safe,"any()","preserved_integer_constant()||sibling(rhs,preserved_integer_constant())"}
> +-doc_end
> +
> +-doc_begin="Shifting non-negative integers to the right is safe."
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(node(binary_operator)&&operator(shr))",
> +  "src_expr(definitely_in(0..))"}
> +-doc_end
> +
> +-doc_begin="Shifting non-negative integers to the left is safe if the result is
> +still non-negative."
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(node(binary_operator)&&operator(shl)&&definitely_in(0..))",
> +  "src_expr(definitely_in(0..))"}
> +-doc_end
> +
> +-doc_begin="Bitwise logical operations on non-negative integers are safe."
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(node(binary_operator)&&operator(and||or||xor))",
> +  "src_expr(definitely_in(0..))"}
> +-doc_end
> +
> +-doc_begin="The implicit conversion to Boolean for logical operator arguments is well known to all Xen developers to be a comparison with 0"
> +-config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
> +-doc_end
> +
> +### Set 3 ###
> +
> +#
> +# Series 18.
> +#
> +
> +-doc_begin="FIXME: explain why pointer differences involving this macro are safe."
> +-config=MC3R1.R18.2,reports+={safe,"all_area(all_loc(any_exp(macro(^ACPI_PTR_DIFF$))))"}
> +-doc_end
> +
> +-doc_begin="FIXME: explain why pointer differences involving this macro are safe."
> +-config=MC3R1.R18.2,reports+={safe,"all_area(all_loc(any_exp(macro(^page_to_mfn$))))"}
> +-doc_end
> +
> +-doc_begin="FIXME: explain why pointer differences involving this macro are safe."
> +-config=MC3R1.R18.2,reports+={safe,"all_area(all_loc(any_exp(macro(^page_to_pdx$))))"}
> +-doc_end
> +
> +#
> +# Series 20.
> +#
> +
> +-doc_begin="Code violating Rule 20.7 is safe when macro parameters are used: (1)
> +as function arguments; (2) as macro arguments; (3) as array indices; (4) as lhs
> +in assignments."
> +-config=MC3R1.R20.7,expansion_context=
> +{safe, "context(__call_expr_arg_contexts)"},
> +{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(array_subscript_expr), subscript)))"},
> +{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(operator(assign), lhs)))"},
> +{safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
> +-doc_end
> +
> +#
> +# Developer confusion
> +#
> +
> +-doc="Selection for reports that are fully contained in adopted code."
> +-report_selector+={adopted_report,"all_area(!kind(culprit||evidence)||all_loc(all_exp(adopted||pseudo)))"}
> +
> +-doc_begin="Adopted code is not meant to be read, reviewed or modified by human
> +programmers:no developers' confusion is not possible. In addition, adopted code
> +is assumed to work as is. Reports that are fully contained in adopted code are
> +hidden/tagged with the 'adopted' tag."
> +-service_selector={developer_confusion_guidelines,"^(MC3R1\\.R2\\.1|MC3R1\\.R2\\.2|MC3R1\\.R2\\.3|MC3R1\\.R2\\.4|MC3R1\\.R2\\.5|MC3R1\\.R2\\.6|MC3R1\\.R2\\.7|MC3R1\\.R4\\.1|MC3R1\\.R5\\.3|MC3R1\\.R5\\.6|MC3R1\\.R5\\.7|MC3R1\\.R5\\.8|MC3R1\\.R5\\.9|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\.3|MC3R1\\.R8\\.7|MC3R1\\.R8\\.8|MC3R1\\.R8\\.9|MC3R1\\.R8\\.11|MC3R1\\.R8\\.12|MC3R1\\.R8\\.13|MC3R1\\.R9\\.3|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R10\\.2|MC3R1\\.R10\\.5|MC3R1\\.R10\\.6|MC3R1\\.R10\\.7|MC3R1\\.R10\\.8|MC3R1\\.R11\\.9|MC3R1\\.R12\\.1|MC3R1\\.R12\\.3|MC3R1\\.R12\\.4|MC3R1\\.R13\\.5|MC3R1\\.R14\\.1|MC3R1\\.R14\\.2|MC3R1\\.R14\\.3|MC3R1\\.R15\\.1|MC3R1\\.R15\\.2|MC3R1\\.R15\\.3|MC3R1\\.R15\\.4|MC3R1\\.R15\\.5|MC3R1\\.R15\\.6|MC3R1\\.R15\\.7|MC3R1\\.R16\\.1|MC3R1\\.R16\\.2|MC3R1\\.R16\\.3|MC3R1\\.R16\\.4|MC3R1\\.R16\\.5|MC3R1\\.R16\\.6|MC3R1\\.R16\\.7|MC3R1\\.R17\\.7|MC3R1\\.R17\\.8|MC3R1\\.R18\\.4|MC3R1\\.R18\\.5)$"
> +}
> +-config=developer_confusion_guidelines,reports+={relied,adopted_report}
> +-doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> new file mode 100644
> index 0000000000..44db6997b5
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> @@ -0,0 +1,127 @@
> +-doc_begin="Imported from Linux: ignore for now."
> +-file_tag+={adopted,"^xen/common/libfdt/.*$"}
> +-file_tag+={adopted,"^xen/include/xen/libfdt/.*$"}
> +-file_tag+={adopted,"^xen/common/xz/.*$"}
> +-file_tag+={adopted,"^xen/common/zstd/.*$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/apei/.*$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/tables/.*$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/utilities/.*$"}
> +-file_tag+={adopted,"^xen/drivers/video/font_.*$"}
> +-file_tag+={adopted,"^xen/arch/arm/arm64/cpufeature\\.c$"}
> +-file_tag+={adopted,"^xen/arch/arm/arm64/insn\\.c$"}
> +-file_tag+={adopted,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
> +-file_tag+={adopted,"^xen/common/bitmap\\.c$"}
> +-file_tag+={adopted,"^xen/common/bunzip2\\.c$"}
> +-file_tag+={adopted,"^xen/common/earlycpio\\.c$"}
> +-file_tag+={adopted,"^xen/common/inflate\\.c$"}
> +-file_tag+={adopted,"^xen/common/lzo\\.c$"}
> +-file_tag+={adopted,"^xen/common/lz4/decompress\\.c$"}
> +-file_tag+={adopted,"^xen/common/radix-tree\\.c$"}
> +-file_tag+={adopted,"^xen/common/ubsan/ubsan\\.c$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/hwregs\\.c$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/numa\\.c$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/osl\\.c$"}
> +-file_tag+={adopted,"^xen/drivers/acpi/tables\\.c$"}
> +-file_tag+={adopted,"^xen/lib/list-sort\\.c$"}
> +-file_tag+={adopted,"^xen/lib/rbtree\\.c$"}
> +-file_tag+={adopted,"^xen/lib/xxhash.*\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/acpi/boot\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/acpi/cpufreq/cpufreq\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/acpi/cpuidle_menu\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/acpi/lib\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/amd\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/centaur\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/common\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/hygon\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/intel\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/intel_cacheinfo\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/mcheck/non-fatal\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/mtrr/.*$"}
> +-file_tag+={adopted,"^xen/arch/x86/cpu/mwait-idle\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/delay\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/dmi_scan\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/mpparse\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/srat\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/time\\.c$"}
> +-file_tag+={adopted,"^xen/arch/x86/x86_64/mmconf-fam10h\\.c$"}
> +-doc_end
> +
> +-doc_begin="Intel specific source files are out of scope."
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/intel\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/intel_cacheinfo\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/microcode/intel\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/shanghai\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/hvm/vmx/.*$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/include/asm/hvm/vmx/.*$"}
> +-file_tag+={out_of_scope,"^xen/drivers/passthrough/vtd/.*$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/mcheck/mce_intel\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/mwait-idle\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/cpu/vpmu_intel\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/tsx\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/mm/altp2m\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/mm/p2m-ept\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/mm/hap/nested_ept\\.c$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/include/asm/altp2m\\.h$"}
> +-file_tag+={out_of_scope,"^xen/arch/x86/include/asm/intel-family\\.h$"}
> +-doc_end
> +
> +-doc_begin="Not in scope initially as it generates many violations and it is not enabled in safety configurations."
> +-file_tag+={adopted,"^xen/xsm/flask/.*$"}
> +-doc_end
> +
> +-doc_begin="unlz4.c implementation by Yann Collet, the others un* are from Linux, ignore for now."
> +-file_tag+={adopted,"^xen/common/un.*\\.c$"}
> +-doc_end
> +
> +-doc_begin="Origin is external and documented in xen/crypto/README.source ."
> +-file_tag+={adopted,"^xen/crypto/.*$"}
> +-doc_end
> +
> +-doc_begin="Files imported from the gnu-efi package"
> +-file_tag+={adopted,"^xen/include/efi/.*$"}
> +-file_tag+={adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
> +-doc_end
> +
> +-doc_begin="Build tools are out of scope."
> +-file_tag+={out_of_scope_tools,"^xen/tools/.*$"}
> +-file_tag+={out_of_scope_tools,"^xen/arch/x86/efi/mkreloc\\.c$"}
> +-file_tag+={out_of_scope_tools,"^xen/arch/x86/boot/mkelf32\\.c$"}
> +-doc_end
> +
> +-doc_begin="Out of scope headers."
> +-file_tag+={out_of_scope,"^xen/include/xen/bitmap\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/earlycpio\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/lzo\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/lz4\\.h$"}
> +-file_tag+={out_of_scope,"^xen/common/lz4/defs\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/list_sort\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/rbtree\\.h$"}
> +-file_tag+={out_of_scope,"^xen/include/xen/xxhash\\.h$"}
> +-doc_end
> +
> +-doc_begin="Headers under xen/include/public/ are the description of the public
> +hypercall ABI so the community is extremely conservative in making changes
> +there, because the interface is maintained for backward compatibility: ignore
> +for now."
> +-file_tag+={hypercall_ABI, "^xen/include/public/.*$"}
> +-source_files+={hide, hypercall_ABI}
> +-doc_end
> +
> +-doc_begin="Consider out-of-scope files external to the project."
> +-file_tag+={external, out_of_scope}
> +-doc_end
> +
> +-doc_begin="Consider adopted files external to the project."
> +-file_tag+={external, adopted}
> +-doc_end
> +
> +-doc_begin="Disregard out-of-scope tools."
> +-frames+={hide,"main(out_of_scope_tools)"}
> +-doc_end
> +
> +-doc_begin="The build performs speculative calls with target /dev/null: this
> +frames should be ignored."
> +-frames+={hide,"target(^/dev/null$)"}
> +-doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh b/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
> new file mode 100755
> index 0000000000..163228ea96
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
> @@ -0,0 +1,66 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different from 0.
> +set -eux
> +
> +script_name="$(basename "$0")"
> +script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name} DATABASE OUT_DIR"
> +}
> +
> +extrapolate_regex() {
> +  lookbehind=$1
> +  file=$2
> +  grep -Po "(?<=${lookbehind}\"\\^).*(?=\\$\")" "${file}" | sed 's/\\\\/\\/'
> +}
> +
> +if [ $# -lt 2 ]; then
> +  usage
> +fi
> +
> +DB=$1
> +OUT_DIR=$2
> +
> +files_txt="${OUT_DIR}/files.txt"
> +files_c_txt="${OUT_DIR}/files_c.txt"
> +files_h_txt="${OUT_DIR}/files_h.txt"
> +exclusions_txt="${OUT_DIR}/exclusions.txt"
> +
> +
> +if [[ ! -d "${OUT_DIR}" ]]; then
> +  mkdir -p "${OUT_DIR}"
> +else
> +  rm -f "${files_txt}"
> +  rm -f "${files_c_txt}"
> +  rm -f "${files_h_txt}"
> +  rm -f "${exclusions_txt}"
> +fi
> +
> +# Generating txt report with files
> +"${ECLAIR_BIN_DIR}eclair_report" -db="${DB}" -files_txt="${files_txt}"
> +
> +{
> +  # Extracting out of scope code
> +  out_of_scope_ecl="${script_dir}/out_of_scope.ecl"
> +  extrapolate_regex adopted,             "${out_of_scope_ecl}"
> +  extrapolate_regex out_of_scope_tools,  "${out_of_scope_ecl}"
> +  extrapolate_regex out_of_scope,        "${out_of_scope_ecl}"
> +  extrapolate_regex hypercall_ABI,       "${out_of_scope_ecl}"
> +  extrapolate_regex "hide, "             "${out_of_scope_ecl}"
> +} >"${exclusions_txt}"
> +sort -o "${exclusions_txt}" -u "${exclusions_txt}"
> +
> +# Removing exclusions from files_txt
> +grep -E -v "(object: |/dev/pipe)" "${files_txt}" > "${files_txt}.tmp"
> +grep -vf "${exclusions_txt}" "${files_txt}.tmp" > "${files_txt}"
> +rm "${files_txt}.tmp"
> +# Creating files with only headers
> +grep -Ev "(xen.*\.(h\w+|[^h]\w*) |.*ecl)" "${files_txt}" > "${files_h_txt}"
> +# Creating files with only c files
> +grep -Ev "(xen.*\.(c\w+|[^c]\w*) |.*ecl)" "${files_txt}" > "${files_c_txt}"
> diff --git a/automation/eclair_analysis/ECLAIR/public_APIs.ecl b/automation/eclair_analysis/ECLAIR/public_APIs.ecl
> new file mode 100644
> index 0000000000..9701a295e6
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/public_APIs.ecl
> @@ -0,0 +1,6 @@
> +# Definition of the public APIs.
> +
> +-doc="All Xen public headers."
> +-file_tag+={api:public,"^xen/include/public/.*\\.h$"}
> +
> +-public_files+=api:public
> diff --git a/automation/eclair_analysis/ECLAIR/report.ecl b/automation/eclair_analysis/ECLAIR/report.ecl
> new file mode 100644
> index 0000000000..6ee324746c
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/report.ecl
> @@ -0,0 +1,4 @@
> +# eclair_report
> +
> +reports_codeclimate("gl-code-quality-report.json")
> +
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> new file mode 100644
> index 0000000000..ef2e56e186
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -0,0 +1,34 @@
> +-doc="Hide reports marked as compliant."
> +-remap_rtag={compliant,hide}
> +
> +-doc="Hide reports marked as safe."
> +-remap_rtag={safe,hide}
> +
> +-doc="Hide reports marked as relied."
> +-remap_rtag={relied,hide}
> +
> +-doc="Hide reports marked as deliberate."
> +-remap_rtag={deliberate,hide}
> +
> +-doc="Hide reports marked as disapplied."
> +-remap_rtag={disapplied,hide}
> +
> +#######################
> +# Accepted guidelines #
> +#######################
> +
> +-doc="Accepted guidelines as reported in XEN/docs/misra/rules.rst"
> +-service_selector={accepted_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.3|MC3R1\\.D4\\.7|MC3R1\\.D4\\.10|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.1|MC3R1\\.R2\\.6|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R4\\.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.3|MC3R1\\.R5\\.4|MC3R1\\.R5\\.6|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\.3|MC3R1\\.R7\\.4|MC3R1\\.R8\\.1|MC3R1\\.R8\\.2|MC3R1\\.R8\\.3|MC3R1\\.R8\\.4|MC3R1\\.R8\\.5|MC3R1\\.R8\\.6|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.1|MC3R1\\.R9\\.2|MC3R1\\.R9\\.3|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R13\\.6|MC3R1\\.R13\\.1|MC3R1\\.R14\\.1|MC3R1\\.R16\\.7|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|MC3R1\\.R18\\.3|MC3R1\\.R19\\.1|MC3R1\\.R20\\.7|MC3R1\\.R20\\.13|MC3R1\\.R20\\.14|MC3R1\\.R21\\.13|MC3R1\\.R21\\.17|MC3R1\\.R21\\.18|MC3R1\\.R21\\.19|MC3R1\\.R21\\.20|MC3R1\\
 .R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5|MC3R1\\.R22\\.6)$"
> +}
> +-doc="All reports of accepted guidelines are tagged as accepted."
> +-reports+={status:accepted,"service(accepted_guidelines)"}
> +
> +####################
> +# Clean guidelines #
> +####################
> +
> +-doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
> +-service_selector={clean_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5)$"
> +}
> +-reports+={clean:added,"service(clean_guidelines)"}
> +-doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> new file mode 100644
> index 0000000000..e6cd289b5e
> --- /dev/null
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -0,0 +1,275 @@
> +# Compilers.
> +-file_tag+={GCC_ARM64,"^/usr/bin/aarch64-linux-gnu-gcc-12$"}
> +-file_tag+={GCC_X86_64,"^/usr/bin/x86_64-linux-gnu-gcc-12$"}
> +
> +# Manuals.
> +-setq=GCC_MANUAL,"https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gcc.pdf"
> +-setq=CPP_MANUAL,"https://gcc.gnu.org/onlinedocs/gcc-12.1.0/cpp.pdf"
> +-setq=ARM64_ABI_MANUAL,"https://github.com/ARM-software/abi-aa/blob/60a8eb8c55e999d74dac5e368fc9d7e36e38dda4/aapcs64/aapcs64.rst"
> +-setq=X86_64_ABI_MANUAL,"https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build"
> +-setq=ARM64_LIBC_MANUAL,"https://www.gnu.org/software/libc/manual/pdf/libc.pdf"
> +-setq=X86_64_LIBC_MANUAL,"https://www.gnu.org/software/libc/manual/pdf/libc.pdf"
> +-setq=C99_STD,"ISO/IEC 9899:1999"
> +
> +-doc_begin="
> +    _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
> +    asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
> +    __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 Volatile\" of "GCC_MANUAL".
> +    __const__, __inline__, __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
> +    typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
> +    __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" and \"6.44 Determining the Alignment of Functions, Types or Variables\" of "GCC_MANUAL".
> +    __attribute__: see Section \"6.39 Attribute Syntax\" of "GCC_MANUAL".
> +    __builtin_types_compatible_p: see Section \"6.59 Other Built-in Functions Provided by GCC\" of "GCC_MANUAL".
> +    __builtin_va_arg: non-documented GCC extension.
> +    __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
> +"
> +-config=STD.tokenext,behavior+={c99, GCC_ARM64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|__inline__|typeof|__typeof__|__alignof__|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
> +-config=STD.tokenext,behavior+={c99, GCC_X86_64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|__inline__|__inline|typeof|__typeof__|__alignof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
> +-doc_end
> +
> +-doc_begin="Non-documented GCC extension."
> +-config=STD.emptinit,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.emptinit,behavior+={c99,GCC_X86_64,specified}
> +#-config=STD.emptinit,behavior+={c18,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.24 Arithmetic on void- and Function-Pointers\" of "GCC_MANUAL"."
> +-config=STD.vptrarth,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.vptrarth,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.1 Statements and Declarations in Expressions\" of "GCC_MANUAL"."
> +-config=STD.stmtexpr,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.stmtexpr,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.19 Structures with No Members\" of "GCC_MANUAL"."
> +-config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL"."
> +-config=STD.arayzero,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.arayzero,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.8 Conditionals with Omitted Operands\" of "GCC_MANUAL"."
> +-config=STD.bincondl,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.bincondl,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.30 Case Ranges\" of "GCC_MANUAL"."
> +-config=STD.caseuplw,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.caseuplw,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="See Section \"6.63 Unnamed Structure and Union Fields\" of "GCC_MANUAL"."
> +-config=STD.anonfild,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.anonfild,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="Non-documented GCC extension."
> +-config=STD.emptdecl,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.emptdecl,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="Non-documented GCC extension."
> +-config=STD.emptenum,behavior+={c99,GCC_ARM64,specified}
> +-doc_end
> +
> +-doc_begin="Non-documented GCC extension."
> +-config=STD.pteincmp,behavior+={c99,GCC_ARM64,specified}
> +-config=STD.pteincmp,behavior+={c99,GCC_X86_64,specified}
> +#-config=STD.pteincmp,behavior+={c18,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="Non-documented GCC extension."
> +-config=STD.funojptr,behavior+={c99,GCC_X86_64,specified}
> +-doc_end
> +
> +-doc_begin="
> +    ext_paste_comma: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
> +    ext_missing_varargs_arg: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
> +    ext_named_variadic_macro: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
> +    ext_return_has_void_expr: see the documentation for -Wreturn-type in Section \"3.8 Options to Request or Suppress Warnings\" of "GCC_MANUAL".
> +    ext_gnu_statement_expr_macro: see Section \"6.1 Statements and Declarations in Expressions\" of "GCC_MANUAL".
> +    ext_sizeof_alignof_void_type: see Section \"6.24 Arithmetic on void- and Function-Pointers\" of "GCC_MANUAL".
> +    ext_forward_ref_enum_def: see Section \"6.49 Incomplete enum Types\" of "GCC_MANUAL".
> +    ext_flexible_array_in_struct: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
> +    ext_flexible_array_in_array: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
> +    ext_enum_value_not_int: non-documented GCC extension.
> +    ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "GCC_MANUAL".
> +"
> +-config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
> +-config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
> +-doc_end
> +
> +-doc_begin="The maximum size of an object is defined in the MAX_SIZE macro, and for a 32 bit architecture is 8MB.
> +    The maximum size for an array is defined in the PTRDIFF_MAX and in a 32 bit architecture is 2^30-1.
> +    See occurrences of these macros in "GCC_MANUAL"."
> +-config=STD.byteobjt,behavior+={c99, GCC_ARM64, 8388608}
> +-config=STD.byteobjt,behavior+={c99, GCC_X86_64, 8388608}
> +-doc_end
> +
> +-doc_begin="See Section \"11.2 Implementation limits\" of "CPP_MANUAL"."
> +-config=STD.charline,behavior+={c99, GCC_ARM64, 5000}
> +-config=STD.charline,behavior+={c99, GCC_X86_64, 12000}
> +-doc_end
> +
> +-doc_begin="See Section \"11.2 Implementation limits\" of "CPP_MANUAL"."
> +-config=STD.inclnest,behavior+={c99, GCC_ARM64, 24}
> +-config=STD.inclnest,behavior+={c99, GCC_X86_64, 32}
> +-doc_end
> +
> +-doc_begin="FIXME: why is C90 used?"
> +-config=STD.ppifnest,behavior+={c90, GCC_X86_64, 32}
> +-doc_end
> +
> +-doc_begin="See Section \"4.12 Statements\" of "GCC_MANUAL"."
> +-config=STD.caselimt,behavior+={c99, GCC_X86_64, 1500}
> +-doc_end
> +
> +-doc_begin="See Section \"6.9 128-bit Integers\" of "GCC_MANUAL"."
> +-config=STD.stdtypes,behavior+={c99, GCC_X86_64, "__uint128_t"}
> +-doc_end
> +
> +-doc_begin="FIXME: Non-documented GCC extension?"
> +-config=STD.charescp,behavior={c99, GCC_X86_64, "^m$"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.9 Structures, Unions, Enumerations, and Bit-Fields\" of "GCC_MANUAL"."
> +-config=STD.bitfldtp, +behavior={c99, GCC_ARM64, "unsigned char;unsigned short;unsigned long;unsigned long long"}
> +-config=STD.bitfldtp, +behavior={c99, GCC_X86_64, "unsigned char;unsigned short;unsigned long;enum"}
> +-doc_end
> +
> +-doc_begin="
> +    #pragma pack: see Section \"6.62.11 Structure-Layout Pragmas\" of "GCC_MANUAL".
> +    #pragma GCC visibility: see Section \"6.62.14 Visibility Pragmas\" of "GCC_MANUAL".
> +"
> +-config=STD.nonstdc,behavior={c99, GCC_ARM64, "^(pack\\(|GCC visibility (push|pop)).*$"}
> +-config=STD.nonstdc,behavior={c99, GCC_X86_64, "^(pack\\(|GCC visibility (push|pop)).*$"}
> +-doc_end
> +
> +-doc_begin="See Section \"1.1 Character sets\" of "CPP_MANUAL".  We assume the locale is not restricting any UTF-8 characters being part of the source character set."
> +-config=STD.charset,behavior={c99, GCC_ARM64, "utf8"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
> +-config=STD.extidsig, behavior+={c99, GCC_ARM64, "63"}
> +-config=STD.extidsig, behavior+={c99, GCC_X86_64, "63"}
> +-doc_end
> +
> +#
> +# Documentation for relied-upon implementation-defined behaviors (Dir 1.1)
> +#
> +
> +-doc_begin="See Section \"4.4 Characters\" of "GCC_MANUAL" and Section \"8.1 Data types\" of "ARM64_ABI_MANUAL"."
> +-config=STD.bytebits,behavior={c99, GCC_ARM64, "8"}
> +-config=STD.charsobj,behavior={c99, GCC_ARM64, "utf8"}
> +-config=STD.charsval,behavior={c99, GCC_ARM64, "utf8"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.4 Characters\" of "GCC_MANUAL" and Section \"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
> +-config=STD.bytebits,behavior={c99, GCC_X86_64, "8"}
> +-config=STD.charsobj,behavior={c99, GCC_X86_64, "utf8"}
> +-config=STD.charsval,behavior={c99, GCC_X86_64, "utf8"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.4 Characters\" of "GCC_MANUAL" and the documentation for -finput-charset=charset in the same manual."
> +-config=STD.charsmap,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.charsmap,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.4 Characters\" of "GCC_MANUAL" and the documentation for -fexec-charset=charset and -finput-charset=charset in the same manual."
> +-config=STD.charsmem,behavior={c99, GCC_ARM64, "utf8"}
> +-config=STD.charsmem,behavior={c99, GCC_X86_64, "utf8"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.1 Translation\" of "GCC_MANUAL"."
> +-config=STD.diagidnt,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.diagidnt,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.4 Characters\" of "GCC_MANUAL" and the documentation for -fexec-charset=charset in the same manual."
> +-config=STD.execvals,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.execvals,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="Given that Xen is compiled in hosted mode, ECLAIR cannot exclude the independency from program termination implementation-defined behavior.  See \"Section 25.7 Program Termination\" of "ARM64_LIBC_MANUAL"."
> +-config=STD.exitstat,behavior={c99, GCC_ARM64, "specified"}
> +-doc_end
> +
> +-doc_begin="Given that Xen is compiled in hosted mode, ECLAIR cannot exclude the independency from program termination implementation-defined behavior.  See \"Section 25.7 Program Termination\" of "X86_64_LIBC_MANUAL"."
> +-config=STD.exitstat,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Chapter \"2 Header Files\" of "CPP_MANUAL"."
> +-config=STD.inclangl,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.inclangl,behavior={c99, GCC_X86_64, "specified"}
> +-config=STD.inclfile,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.inclfile,behavior={c99, GCC_X86_64, "specified"}
> +-config=STD.inclhead,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.inclhead,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.5 Integers\" of "GCC_MANUAL"."
> +-config=STD.signdint,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.signdint,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.15 Architecture\" of "GCC_MANUAL" and Chapter \"5   Data types and alignment\" of "ARM64_ABI_MANUAL"."
> +-config=STD.objbytes,behavior={c99, GCC_ARM64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.15 Architecture\" of "GCC_MANUAL" and Section \"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
> +-config=STD.objbytes,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"3.4 Stringizing\" of "CPP_MANUAL"."
> +-config=STD.stringfy,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.stringfy,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.9 Structures, Unions, Enumerations, and Bit-Fields\"
> + of "GCC_MANUAL" and Section \"8.1.8 Bit-fields\" of "ARM64_ABI_MANUAL"."
> +-config=STD.bitfldby,+behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.bitfldor,+behavior={c99, GCC_ARM64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.9 Structures, Unions, Enumerations, and Bit-Fields\"
> + of "GCC_MANUAL" and Section \"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
> +-config=STD.bitfldby,+behavior={c99, GCC_X86_64, "specified"}
> +-config=STD.bitfldor,+behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.10 Qualifiers\" of "GCC_MANUAL"."
> +-config=STD.volatltp,+behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.volatltp,+behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.15 Architecture\" of "GCC_MANUAL" and Chapter \"5   Data types and alignment\" of "ARM64_ABI_MANUAL"."
> +-config=STD.stdmacro,behavior={c99, GCC_ARM64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.15 Architecture\" of "GCC_MANUAL" and Section \"3.1.2 Data Representation\" of "X86_64_ABI_MANUAL"."
> +-config=STD.stdmacro,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.4 Characters\" of "GCC_MANUAL" and Section \"11.1 Implementation-defined behavior\" of "CPP_MANUAL"."
> +-config=STD.widestng,behavior={c99, GCC_ARM64, "specified"}
> +-config=STD.widestng,behavior={c99, GCC_X86_64, "specified"}
> +-config=STD.multbtsl,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.13 Preprocessing Directives\" of "GCC_MANUAL" and Section \"7 Pragmas\" of "CPP_MANUAL"."
> +-config=STD.pragmdir,behavior={c99, GCC_ARM64, "^(pack\\(|GCC visibility (push|pop)).*$"}
> +-config=STD.pragmdir,behavior={c99, GCC_X86_64, "^(pack\\(|GCC visibility (push|pop)).*$"}
> +-doc_end
> +
> +-doc_begin="See Section \"6.9 128-bit Integers\" of "GCC_MANUAL"."
> +-config=STD.extinttp,behavior={c99, GCC_X86_64, "__uint128_t"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.13 Preprocessing Directives\" of "GCC_MANUAL" and Section \"11.1 Implementation-defined behavior\" of "CPP_MANUAL"."
> +-config=STD.inclexpd,behavior={c99, GCC_X86_64, "specified"}
> +-doc_end
> diff --git a/automation/eclair_analysis/Makefile.prepare b/automation/eclair_analysis/Makefile.prepare
> new file mode 100644
> index 0000000000..90f4a31172
> --- /dev/null
> +++ b/automation/eclair_analysis/Makefile.prepare
> @@ -0,0 +1,6 @@
> +include Makefile
> +prepare:
> +	$(Q)$(MAKE) $(build)=tools
> +	$(Q)$(MAKE) $(build)=. include/xen/compile.h
> +	$(Q)$(MAKE) $(build)=include all
> +	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
> diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
> new file mode 100755
> index 0000000000..ec087dd822
> --- /dev/null
> +++ b/automation/eclair_analysis/build.sh
> @@ -0,0 +1,44 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +
> +script_name="$(basename "$0")"
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name} <ARM64|X86_64>"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +fi
> +
> +if [ "$1" = "X86_64" ]; then
> +  export CROSS_COMPILE=
> +  export XEN_TARGET_ARCH=x86_64
> +elif [ "$1" = "ARM64" ]; then
> +  export CROSS_COMPILE=aarch64-linux-gnu-
> +  export XEN_TARGET_ARCH=arm64
> +else
> +  fatal "Unknown configuration: $1"
> +fi
> +
> +if [[ -f /proc/cpuinfo ]]; then
> +  PROCESSORS=$(grep -c ^processor /proc/cpuinfo)
> +else
> +  PROCESSORS=6
> +fi
> +
> +(
> +  cd xen
> +
> +  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
> +       "CROSS_COMPILE=${CROSS_COMPILE}"         \
> +       "CC=${CROSS_COMPILE}gcc-12"              \
> +       "CXX=${CROSS_COMPILE}g++-12"             \
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
> +)
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> new file mode 100755
> index 0000000000..275a1a3f51
> --- /dev/null
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -0,0 +1,42 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +
> +script_name="$(basename "$0")"
> +script_dir="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name}"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +  exit 1
> +fi
> +
> +export XEN_TARGET_ARCH
> +
> +if [ "$1" = "X86_64" ]; then
> +  CONFIG_FILE="${script_dir}/xen_x86_config"
> +  XEN_TARGET_ARCH=x86_64
> +elif [ "$1" = "ARM64" ]; then
> +  CONFIG_FILE="${script_dir}/xen_arm_config"
> +  XEN_TARGET_ARCH=arm64
> +else
> +  fatal "Unknown configuration: $1"
> +fi
> +
> +(
> +    cd xen
> +    cp "${CONFIG_FILE}" .config
> +    make clean
> +    make -f ${script_dir}/Makefile.prepare prepare
> +)
> diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_analysis/xen_arm_config
> new file mode 100644
> index 0000000000..82102b889e
> --- /dev/null
> +++ b/automation/eclair_analysis/xen_arm_config
> @@ -0,0 +1,147 @@
> +# File provided in
> +# Re: Xen MISRA C: Source files in scope and out of scope
> +# from:	Stefano Stabellini <stefano.stabellini@amd.com>
> +# date:	6 giu 2023, 02:53
> +
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Xen/arm 4.18-unstable Configuration
> +#
> +CONFIG_CC_IS_GCC=y
> +CONFIG_GCC_VERSION=90400
> +CONFIG_CLANG_VERSION=0
> +CONFIG_LD_IS_GNU=y
> +CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=y
> +CONFIG_ARM_64=y
> +CONFIG_ARM=y
> +CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
> +
> +# UBSAN
> +CONFIG_UBSAN=n
> +
> +#
> +# Architecture Features
> +#
> +CONFIG_ARM64_SVE=n
> +CONFIG_64BIT=y
> +CONFIG_NR_CPUS=4
> +# CONFIG_ACPI is not set
> +CONFIG_ARM_EFI=y
> +CONFIG_GICV3=y
> +CONFIG_HAS_ITS=y
> +CONFIG_HVM=y
> +# CONFIG_NEW_VGIC is not set
> +CONFIG_SBSA_VUART_CONSOLE=y
> +CONFIG_ARM_SSBD=y
> +CONFIG_HARDEN_BRANCH_PREDICTOR=y
> +# CONFIG_TEE is not set
> +# CONFIG_STATIC_SHM is not set
> +# end of Architecture Features
> +
> +#
> +# ARM errata workaround via the alternative framework
> +#
> +CONFIG_ARM64_ERRATUM_827319=y
> +CONFIG_ARM64_ERRATUM_824069=y
> +CONFIG_ARM64_ERRATUM_819472=y
> +CONFIG_ARM64_ERRATUM_843419=y
> +CONFIG_ARM64_ERRATUM_832075=y
> +CONFIG_ARM64_ERRATUM_834220=y
> +CONFIG_ARM_ERRATUM_858921=y
> +CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=y
> +CONFIG_ARM64_ERRATUM_1286807=y
> +# end of ARM errata workaround via the alternative framework
> +
> +CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
> +# CONFIG_ALL_PLAT is not set
> +# CONFIG_QEMU is not set
> +# CONFIG_RCAR3 is not set
> +CONFIG_MPSOC=y
> +# CONFIG_NO_PLAT is not set
> +CONFIG_MPSOC_PLATFORM=y
> +
> +#
> +# Common Features
> +#
> +CONFIG_GRANT_TABLE=y
> +CONFIG_HAS_ALTERNATIVE=y
> +CONFIG_HAS_DEVICE_TREE=y
> +CONFIG_HAS_FAST_MULTIPLY=y
> +CONFIG_HAS_PDX=y
> +CONFIG_HAS_PMAP=y
> +# CONFIG_MEM_ACCESS is not set
> +CONFIG_STATIC_MEMORY=y
> +
> +#
> +# Speculative hardening
> +#
> +CONFIG_SPECULATIVE_HARDEN_ARRAY=y
> +# end of Speculative hardening
> +
> +# CONFIG_HYPFS is not set
> +CONFIG_IOREQ_SERVER=y
> +# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
> +# CONFIG_XSM is not set
> +# CONFIG_ARGO is not set
> +
> +#
> +# Schedulers
> +#
> +# CONFIG_SCHED_CREDIT is not set
> +CONFIG_SCHED_CREDIT2=y
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +CONFIG_SCHED_NULL=y
> +CONFIG_SCHED_CREDIT2_DEFAULT=y
> +# CONFIG_SCHED_NULL_DEFAULT is not set
> +CONFIG_SCHED_DEFAULT="credit2"
> +# end of Schedulers
> +
> +CONFIG_BOOT_TIME_CPUPOOLS=y
> +# CONFIG_LIVEPATCH is not set
> +# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
> +CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> +CONFIG_CMDLINE=""
> +CONFIG_DOM0_MEM=""
> +CONFIG_DTB_FILE=""
> +# CONFIG_TRACEBUFFER is not set
> +# end of Common Features
> +
> +#
> +# Device Drivers
> +#
> +# CONFIG_HAS_NS16550 is not set
> +CONFIG_HAS_CADENCE_UART=y
> +# CONFIG_HAS_IMX_LPUART is not set
> +# CONFIG_HAS_MVEBU is not set
> +# CONFIG_HAS_MESON is not set
> +CONFIG_HAS_PL011=y
> +# CONFIG_HAS_SCIF is not set
> +CONFIG_SERIAL_TX_BUFSIZE=16384
> +CONFIG_HAS_PASSTHROUGH=y
> +CONFIG_ARM_SMMU=y
> +CONFIG_ARM_SMMU_V3=y
> +# CONFIG_IPMMU_VMSA is not set
> +CONFIG_IOMMU_FORCE_PT_SHARE=y
> +# end of Device Drivers
> +
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +
> +#
> +# Debugging Options
> +#
> +CONFIG_DEBUG=y
> +CONFIG_FRAME_POINTER=y
> +CONFIG_COVERAGE=y
> +CONFIG_DEBUG_LOCK_PROFILE=y
> +CONFIG_DEBUG_LOCKS=y
> +CONFIG_PERF_COUNTERS=y
> +CONFIG_PERF_ARRAYS=y
> +CONFIG_VERBOSE_DEBUG=y
> +CONFIG_DEVICE_TREE_DEBUG=y
> +CONFIG_SCRUB_DEBUG=y
> +CONFIG_DEBUG_TRACE=y
> +CONFIG_XMEM_POOL_POISON=y
> +CONFIG_DEBUG_INFO=y
> +# end of Debugging Options
> diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_analysis/xen_x86_config
> new file mode 100644
> index 0000000000..9b2709bfc8
> --- /dev/null
> +++ b/automation/eclair_analysis/xen_x86_config
> @@ -0,0 +1,152 @@
> +# File provided in
> +# Re: Xen MISRA C: Source files in scope and out of scope
> +# from:	Stefano Stabellini <stefano.stabellini@amd.com> 
> +# date:	6 giu 2023, 02:53
> +
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Xen/x86 4.18-unstable Configuration
> +#
> +CONFIG_CC_IS_GCC=y
> +CONFIG_GCC_VERSION=90400
> +CONFIG_CLANG_VERSION=0
> +CONFIG_LD_IS_GNU=y
> +CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=y
> +CONFIG_X86_64=y
> +CONFIG_X86=y
> +CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
> +CONFIG_CC_HAS_INDIRECT_THUNK=y
> +CONFIG_HAS_AS_CET_SS=y
> +CONFIG_HAS_CC_CET_IBT=y
> +
> +CONFIG_REQUIRE_NX=n
> +
> +#
> +# Architecture Features
> +#
> +CONFIG_64BIT=y
> +CONFIG_NR_CPUS=16
> +CONFIG_NR_NUMA_NODES=2
> +# CONFIG_PV is not set
> +CONFIG_HVM=y
> +# CONFIG_XEN_SHSTK is not set
> +# CONFIG_XEN_IBT is not set
> +# CONFIG_SHADOW_PAGING is not set
> +# CONFIG_BIGMEM is not set
> +# CONFIG_HVM_FEP is not set
> +# CONFIG_TBOOT is not set
> +CONFIG_XEN_ALIGN_DEFAULT=y
> +# CONFIG_XEN_ALIGN_2M is not set
> +CONFIG_X2APIC_PHYSICAL=y
> +# CONFIG_XEN_GUEST is not set
> +# CONFIG_HYPERV_GUEST is not set
> +# CONFIG_MEM_PAGING is not set
> +# CONFIG_MEM_SHARING is not set
> +# end of Architecture Features
> +
> +#
> +# Common Features
> +#
> +CONFIG_COMPAT=y
> +CONFIG_CORE_PARKING=y
> +CONFIG_GRANT_TABLE=y
> +CONFIG_ALTERNATIVE_CALL=y
> +CONFIG_ARCH_MAP_DOMAIN_PAGE=y
> +CONFIG_GENERIC_BUG_FRAME=y
> +CONFIG_HAS_ALTERNATIVE=y
> +CONFIG_HAS_COMPAT=y
> +CONFIG_HAS_EX_TABLE=y
> +CONFIG_HAS_FAST_MULTIPLY=y
> +CONFIG_HAS_IOPORTS=y
> +CONFIG_HAS_KEXEC=y
> +CONFIG_HAS_PDX=y
> +CONFIG_HAS_SCHED_GRANULARITY=y
> +CONFIG_HAS_UBSAN=y
> +CONFIG_MEM_ACCESS_ALWAYS_ON=y
> +CONFIG_MEM_ACCESS=y
> +CONFIG_NEEDS_LIBELF=y
> +CONFIG_NUMA=y
> +
> +#
> +# Speculative hardening
> +#
> +CONFIG_INDIRECT_THUNK=y
> +CONFIG_SPECULATIVE_HARDEN_ARRAY=y
> +CONFIG_SPECULATIVE_HARDEN_BRANCH=y
> +# end of Speculative hardening
> +
> +# CONFIG_HYPFS is not set
> +CONFIG_IOREQ_SERVER=y
> +# CONFIG_KEXEC is not set
> +# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
> +# CONFIG_XENOPROF is not set
> +# CONFIG_XSM is not set
> +# CONFIG_ARGO is not set
> +
> +#
> +# Schedulers
> +#
> +# CONFIG_SCHED_CREDIT is not set
> +CONFIG_SCHED_CREDIT2=y
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +CONFIG_SCHED_NULL=y
> +CONFIG_SCHED_CREDIT2_DEFAULT=y
> +# CONFIG_SCHED_NULL_DEFAULT is not set
> +CONFIG_SCHED_DEFAULT="credit2"
> +# end of Schedulers
> +
> +# CONFIG_LIVEPATCH is not set
> +# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
> +# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
> +CONFIG_CMDLINE=""
> +CONFIG_DOM0_MEM=""
> +# CONFIG_TRACEBUFFER is not set
> +# end of Common Features
> +
> +#
> +# Device Drivers
> +#
> +CONFIG_ACPI=y
> +CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
> +CONFIG_ACPI_NUMA=y
> +CONFIG_HAS_NS16550=y
> +CONFIG_HAS_EHCI=y
> +CONFIG_SERIAL_TX_BUFSIZE=16384
> +# CONFIG_XHCI is not set
> +CONFIG_HAS_CPUFREQ=y
> +CONFIG_HAS_PASSTHROUGH=y
> +CONFIG_AMD_IOMMU=y
> +# CONFIG_INTEL_IOMMU is not set
> +# CONFIG_IOMMU_QUARANTINE_NONE is not set
> +CONFIG_IOMMU_QUARANTINE_BASIC=y
> +# CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE is not set
> +CONFIG_HAS_PCI=y
> +CONFIG_HAS_PCI_MSI=y
> +CONFIG_VIDEO=y
> +CONFIG_VGA=y
> +CONFIG_HAS_VPCI=y
> +# end of Device Drivers
> +
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +CONFIG_ARCH_SUPPORTS_INT128=y
> +
> +#
> +# Debugging Options
> +#
> +CONFIG_DEBUG=y
> +# CONFIG_CRASH_DEBUG is not set
> +CONFIG_GDBSX=y
> +CONFIG_FRAME_POINTER=y
> +# CONFIG_COVERAGE is not set
> +# CONFIG_DEBUG_LOCK_PROFILE is not set
> +CONFIG_DEBUG_LOCKS=y
> +# CONFIG_PERF_COUNTERS is not set
> +CONFIG_VERBOSE_DEBUG=y
> +CONFIG_SCRUB_DEBUG=y
> +# CONFIG_UBSAN is not set
> +# CONFIG_DEBUG_TRACE is not set
> +CONFIG_XMEM_POOL_POISON=y
> +CONFIG_DEBUG_INFO=y
> +# end of Debugging Options
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> new file mode 100644
> index 0000000000..9ce2a287fb
> --- /dev/null
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -0,0 +1,37 @@
> +.eclair-analysis:
> +  stage: analyze
> +  tags:
> +    - eclair-analysis
> +  variables:
> +    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
> +    ANALYSIS_KIND: "normal"
> +    ENABLE_ECLAIR_BOT: "n"
> +    AUTO_PR_BRANCH: "staging"
> +    AUTO_PR_REPOSITORY: "xen-project/xen"
> +  artifacts:
> +    when: always
> +    paths:
> +      - "${ECLAIR_OUTPUT_DIR}"
> +      - '*.log'
> +    reports:
> +      codequality: gl-code-quality-report.json
> +
> +eclair-x86_64:
> +  extends: .eclair-analysis
> +  variables:
> +    LOGFILE: "eclair-x86_64.log"
> +    VARIANT: "X86_64"
> +    RULESET: "Set1"
> +  script:
> +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
> +  allow_failure: true
> +
> +eclair-ARM64:
> +  extends: .eclair-analysis
> +  variables:
> +    LOGFILE: "eclair-ARM64.log"
> +    VARIANT: "ARM64"
> +    RULESET: "Set1"
> +  script:
> +    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
> +  allow_failure: true
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index c401f62d61..f01e2c32bb 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -11,6 +11,7 @@
>        - '*.log'
>        - '*/*.log'
>      when: always
> +  needs: []
>    except:
>      - master
>      - smoke
> diff --git a/automation/scripts/eclair b/automation/scripts/eclair
> new file mode 100755
> index 0000000000..c4a3bb57d7
> --- /dev/null
> +++ b/automation/scripts/eclair
> @@ -0,0 +1,32 @@
> +#!/bin/sh -eu
> +
> +ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
> +ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
> +ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
> +
> +"${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"
> +
> +ex=0
> +"${ECLAIR_DIR}/analyze.sh" "${VARIANT}" "${RULESET}" || ex=$?
> +"${ECLAIR_DIR}/action_log.sh" ANALYSIS_LOG \
> +                             "ECLAIR analysis log" \
> +                             "${ECLAIR_OUTPUT_DIR}/ANALYSIS.log" \
> +                             "${ex}"
> +"${ECLAIR_DIR}/action_log.sh" REPORT_LOG \
> +                             "ECLAIR report log" \
> +                             "${ECLAIR_OUTPUT_DIR}/REPORT.log" \
> +                             "${ex}"
> +[ "${ex}" = 0 ] || exit "${ex}"
> +"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
> +
> +# Fail in case of new reports
> +"${ECLAIR_DIR}/action_clean_added.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
> +"${ECLAIR_DIR}/action_log.sh" DIFF_CHECK_LOG \
> +                             "ECLAIR diff check" \
> +                             "${ECLAIR_OUTPUT_DIR}/clean_added.log" \
> +                             "${ex}"
> +
> +rm -rf "${ECLAIR_OUTPUT_DIR}/.data"
> +rm -rf "${ECLAIR_OUTPUT_DIR}/PROJECT.ecd"
> +
> +[ "${ex}" = 0 ] || exit "${ex}"
> -- 
> 2.34.1
> 
--8323329-1672649101-1690242549=:3118466--

