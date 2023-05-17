Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD07A705BFB
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 02:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535741.833721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz57y-0007Oi-FD; Wed, 17 May 2023 00:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535741.833721; Wed, 17 May 2023 00:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz57y-0007MC-Bt; Wed, 17 May 2023 00:34:50 +0000
Received: by outflank-mailman (input) for mailman id 535741;
 Wed, 17 May 2023 00:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pz57w-0007M3-7K
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 00:34:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f6f58cc-f44a-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 02:34:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61B0E60AB0;
 Wed, 17 May 2023 00:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AE0C433EF;
 Wed, 17 May 2023 00:34:43 +0000 (UTC)
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
X-Inumbo-ID: 9f6f58cc-f44a-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684283684;
	bh=jTidJcjLSbTguKlPt0yffWmq1ys/89ao202AwH6GW8A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CmDNQL+Zvg/vVRAYrLbzSltX49xBbyBn2txukws9k9Ie3ZuU6c3O5oy+KY9sGaCO4
	 BOVKG/fmK7sL7haa4t1AoBxv85cWanVgH5R3bn0xSAOHrCD2R8FdwNDOCiS7OrUC01
	 usq2rLlLFNjcSQdjnCjUfuW7KPYZq8gAnS+86I+B3tBhxYfwRHAX9tPKg3ayd6WgVL
	 E25A5JPSy74klyJ8qoHZrHh2k/v930q15kqHlEHh8x5p7LvLtW5OJkhMfXMiZVbT1P
	 BdS8+Wymi2kI/Boze+v2Q7Q6pzQIgMnl8fOgdw5eFeyc3iefaWYvzJnyVWY/uzJWTM
	 T2hXV+fWaauQw==
Date: Tue, 16 May 2023 17:34:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/3] xen/misra: xen-analysis.py: fix parallel analysis
 Cppcheck errors
In-Reply-To: <20230504131245.2985400-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305161733010.128889@ubuntu-linux-20-04-desktop>
References: <20230504131245.2985400-1-luca.fancellu@arm.com> <20230504131245.2985400-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 May 2023, Luca Fancellu wrote:
> Currently Cppcheck has a limitation that prevents to use make with
> parallel build and have a parallel Cppcheck invocation on each
> translation unit (the .c files), because of spurious internal errors.
> 
> The issue comes from the fact that when using the build directory,
> Cppcheck saves temporary files as <filename>.c.<many-extensions>, but
> this doesn't work well when files with the same name are being
> analysed at the same time, leading to race conditions.
> 
> Fix the issue creating, under the build directory, the same directory
> structure of the file being analysed to avoid any clash.
> 
> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/xen_analysis/cppcheck_analysis.py |  8 +++-----
>  xen/tools/cppcheck-cc.sh                      | 19 ++++++++++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
> index ab52ce38d502..658795bb9f5b 100644
> --- a/xen/scripts/xen_analysis/cppcheck_analysis.py
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -139,7 +139,6 @@ def generate_cppcheck_deps():
>      # Compiler defines are in compiler-def.h which is included in config.h
>      #
>      cppcheck_flags="""
> ---cppcheck-build-dir={}/{}
>   --max-ctu-depth=10
>   --enable=style,information,missingInclude
>   --template=\'{{file}}({{line}},{{column}}):{{id}}:{{severity}}:{{message}}\'
> @@ -150,8 +149,7 @@ def generate_cppcheck_deps():
>   --suppress='unusedStructMember:*'
>   --include={}/include/xen/config.h
>   -DCPPCHECK
> -""".format(settings.outdir, CPPCHECK_BUILD_DIR, settings.xen_dir,
> -           settings.outdir, settings.xen_dir)
> +""".format(settings.xen_dir, settings.outdir, settings.xen_dir)
>  
>      invoke_cppcheck = utils.invoke_command(
>              "{} --version".format(settings.cppcheck_binpath),
> @@ -204,9 +202,9 @@ def generate_cppcheck_deps():
>  
>      cppcheck_cc_flags = """--compiler={} --cppcheck-cmd={} {}
>   --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
> - --ignore-path=arch/x86/efi/check.c
> + --ignore-path=arch/x86/efi/check.c --build-dir={}/{}
>  """.format(xen_cc, settings.cppcheck_binpath, cppcheck_flags,
> -           settings.tools_dir)
> +           settings.tools_dir, settings.outdir, CPPCHECK_BUILD_DIR)
>  
>      if settings.cppcheck_html:
>          cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"
> diff --git a/xen/tools/cppcheck-cc.sh b/xen/tools/cppcheck-cc.sh
> index f6728e4c1084..16a965edb7ec 100755
> --- a/xen/tools/cppcheck-cc.sh
> +++ b/xen/tools/cppcheck-cc.sh
> @@ -24,6 +24,7 @@ Options:
>  EOF
>  }
>  
> +BUILD_DIR=""
>  CC_FILE=""
>  COMPILER=""
>  CPPCHECK_HTML="n"
> @@ -66,6 +67,10 @@ do
>              help
>              exit 0
>              ;;
> +        --build-dir=*)
> +            BUILD_DIR="${OPTION#*=}"
> +            sm_tool_args="n"
> +            ;;
>          --compiler=*)
>              COMPILER="${OPTION#*=}"
>              sm_tool_args="n"
> @@ -107,6 +112,12 @@ then
>      exit 1
>  fi
>  
> +if [ "${BUILD_DIR}" = "" ]
> +then
> +    echo "--build-dir arg is mandatory."
> +    exit 1
> +fi
> +
>  function create_jcd() {
>      local line="${1}"
>      local arg_num=0
> @@ -199,13 +210,18 @@ then
>              exit 1
>          fi
>  
> +        # Generate build directory for the analysed file
> +        cppcheck_build_dir="${BUILD_DIR}/${OBJTREE_PATH}"
> +        mkdir -p "${cppcheck_build_dir}"
> +
>          # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS, but
>          # they can't be used here
>          # shellcheck disable=SC2086
>          ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
>              --project="${JDB_FILE}" \
>              --output-file="${out_file}" \
> -            --platform="${platform}"
> +            --platform="${platform}" \
> +            --cppcheck-build-dir=${cppcheck_build_dir}
>  
>          if [ "${CPPCHECK_HTML}" = "y" ]
>          then
> @@ -216,6 +232,7 @@ then
>                  --project="${JDB_FILE}" \
>                  --output-file="${out_file%.txt}.xml" \
>                  --platform="${platform}" \
> +                --cppcheck-build-dir=${cppcheck_build_dir} \
>                  -q \
>                  --xml
>          fi
> -- 
> 2.34.1
> 

