Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776F8607E3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 01:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684587.1064528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJt6-0004ap-Tr; Fri, 23 Feb 2024 00:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684587.1064528; Fri, 23 Feb 2024 00:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJt6-0004Yc-Qz; Fri, 23 Feb 2024 00:58:04 +0000
Received: by outflank-mailman (input) for mailman id 684587;
 Fri, 23 Feb 2024 00:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdJt5-0004YW-6l
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 00:58:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9501a8fa-d1e6-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 01:57:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AAD2BCE2999;
 Fri, 23 Feb 2024 00:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD6C433C7;
 Fri, 23 Feb 2024 00:57:54 +0000 (UTC)
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
X-Inumbo-ID: 9501a8fa-d1e6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708649874;
	bh=njJxp1qIWrm69elf9jtOs1FBORbdgE+hleoAV17yg98=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DTSLI0ZbO6TWYGW72vmkAdITmO8kFz5yGeoDg7N4RgjXJG5T4DA+bf4j/B73SCVbD
	 nz8KTv1c4HOmy7ZVyZszEUI4d1prKmBBpLLhg5Ajsvt+CW2RmsExZ2pV9SSAsKexny
	 XVPalUTb6h+lEJ5SXzh/ICAFhYmY+FGh2Yvw+bgzn+6eWxpHJ0f0VrwLZT14iAaEyw
	 +FFEdftUsQT05T28klerAFwaG1ewLQUnxOPbfXD2kJPPFllRo9SueM/Lx+wYbZCKVE
	 APC5bCxmhrW2CZaQg9bBouujhPNUw8VsIfVJsCBcgkq99xVMFaepgPkW9T6BV+ss9B
	 09sb3E6+CcBqw==
Date: Thu, 22 Feb 2024 16:57:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Rework "build-each-commit-gcc" test
In-Reply-To: <20240220140733.40980-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2402221656150.754277@ubuntu-linux-20-04-desktop>
References: <20240220140733.40980-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Feb 2024, Anthony PERARD wrote:

> Current issues with this test are:
> - when the job timeout, the log file is lost as there is no chance to
>   run the `mv` command.
> - GitLab job log is limited in size, so one usually have to download
>   the artifacts, which may be missing.
> 
> Use $GITLAB_CI to detect when the script is run as part of a GitLab
> pipeline. GitLab will add "GITLAB_CI=true" in the environment
> variables.
> 
> When run as part of $GITLAB_CI, ignore "dirty" worktree to allow to
> write "build-each-commit-gcc.log", which can then be grabbed as
> artifacts, even when the job timeout. The `git clean` command is
> changed to keep those build logs.
> 
> When run as part of $GITLAB_CI, we will also store the build output in
> a log file instead of writing it to stdout, because GitLab's job log
> is limited. But we will write the log to stdout in case of error, so
> we can find out more quickly why there's been an error.
> 
> This patch also make use of a GitLab feature, "log sections", which we
> will collapse by default. One section per commit been built.
> 
> There's a bit of colour added to the logs.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Notes:
>     Examples:
>     - on success:
>       https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/6212972041
>     - on failure:
>       https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/6212993231
> 
>  automation/gitlab-ci/build-each-commit.sh |  2 +-
>  automation/gitlab-ci/test.yaml            |  4 +-
>  automation/scripts/build-test.sh          | 55 ++++++++++++++++++++---
>  3 files changed, 50 insertions(+), 11 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build-each-commit.sh b/automation/gitlab-ci/build-each-commit.sh
> index 19e337b468..08fddecbbe 100755
> --- a/automation/gitlab-ci/build-each-commit.sh
> +++ b/automation/gitlab-ci/build-each-commit.sh
> @@ -15,4 +15,4 @@ fi
>  echo "Building ${BASE}..${TIP}"
>  
>  NON_SYMBOLIC_REF=1 ./automation/scripts/build-test.sh ${BASE} ${TIP} \
> -    bash -c "git clean -ffdx && ./automation/scripts/build"
> +    bash -c "git clean -ffdx -e '/build-*.log' && ./automation/scripts/build"
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 3b27cc9f41..50056c1372 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -136,9 +136,7 @@ build-each-commit-gcc:
>      XEN_TARGET_ARCH: x86_64
>      CC: gcc
>    script:
> -    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> -  after_script:
> -    - mv ../build-each-commit-gcc.log .
> +    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee build-each-commit-gcc.log
>    artifacts:
>      paths:
>        - '*.log'
> diff --git a/automation/scripts/build-test.sh b/automation/scripts/build-test.sh
> index da643adc01..355d4bf7f6 100755
> --- a/automation/scripts/build-test.sh
> +++ b/automation/scripts/build-test.sh
> @@ -9,6 +9,37 @@
>  # Set NON_SYMBOLIC_REF=1 if you want to use this script in detached HEAD state.
>  # This is currently used by automated test system.
>  
> +# Colors with ANSI escape sequences
> +txt_info='[32m'
> +txt_err='[31m'
> +txt_clr='[0m'
> +
> +# $GITLAB_CI should be "true" or "false".
> +if [ "$GITLAB_CI" != true ]; then
> +    GITLAB_CI=false
> +fi
> +
> +gitlab_log_section() {
> +    if $GITLAB_CI; then
> +        echo -n "[0Ksection_$1:$(date +%s):$2[0K"
> +    fi
> +    if [ $# -ge 3 ]; then
> +        echo "$3"
> +    fi
> +}
> +log_section_last=
> +log_section_start() {
> +    log_section_last="${1%\[collapsed=true\]}"
> +    gitlab_log_section 'start' "$1" "${txt_info}$2${txt_clr}"
> +}
> +log_section_end() {
> +    if [ "$log_section_last" ]; then
> +        gitlab_log_section 'end' "$log_section_last"
> +        log_section_last=
> +    fi
> +}
> +
> +
>  if test $# -lt 2 ; then
>      echo "Usage:"
>      echo " $0 <BASE> <TIP> [CMD]"
> @@ -19,10 +50,12 @@ fi
>  
>  pushd `git rev-parse --show-toplevel`
>  
> -status=`git status -s`
> -if test -n "$status"; then
> -    echo "Tree is dirty, aborted"
> -    exit 1
> +if ! $GITLAB_CI; then
> +    status=`git status -s`
> +    if test -n "$status"; then
> +        echo "Tree is dirty, aborted"
> +        exit 1
> +    fi
>  fi
>  
>  BASE=$1; shift
> @@ -40,26 +73,34 @@ fi
>  
>  ret=1
>  while read num rev; do
> -    echo "Testing $num $rev"
> +    log_section_start "commit_$rev[collapsed=true]" "Testing #$num $(git log -1 --abbrev=12 --format=tformat:'%h ("%s")' $rev)"
>  
>      git checkout $rev
>      ret=$?
>      if test $ret -ne 0; then
> -        echo "Failed to checkout $num $rev with $ret"
> +        log_section_end
> +        echo "${txt_err}Failed to checkout $num $rev with $ret${txt_clr}"
>          break
>      fi
>  
>      if test $# -eq 0 ; then
>          git clean -fdx && ./configure && make -j4
> +    elif $GITLAB_CI; then
> +        "$@" > "build-$num.log" 2>&1
>      else
>          "$@"
>      fi
>      ret=$?
>      if test $ret -ne 0; then
> -        echo "Failed at $num $rev with $ret"
> +        if $GITLAB_CI; then
> +            cat "build-$num.log"
> +        fi
> +        log_section_end
> +        echo "${txt_err}Failed at $num $rev with $ret${txt_clr}"
>          break
>      fi
>      echo
> +    log_section_end
>  done < <(git rev-list $BASE..$TIP | nl -ba | tac)
>  
>  echo "Restoring original HEAD"
> -- 
> Anthony PERARD
> 

