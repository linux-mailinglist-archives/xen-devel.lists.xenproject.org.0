Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313563E1E7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 21:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450143.707355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0TfK-0004HQ-Dv; Wed, 30 Nov 2022 20:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450143.707355; Wed, 30 Nov 2022 20:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0TfK-0004Ed-A3; Wed, 30 Nov 2022 20:26:46 +0000
Received: by outflank-mailman (input) for mailman id 450143;
 Wed, 30 Nov 2022 20:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEZL=36=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0TfI-0004EW-2o
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 20:26:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cdf04b9-70ed-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 21:26:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42D35B81CB6;
 Wed, 30 Nov 2022 20:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF67C433D6;
 Wed, 30 Nov 2022 20:26:38 +0000 (UTC)
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
X-Inumbo-ID: 4cdf04b9-70ed-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669840000;
	bh=hTA7WgHQABTbX7zcxAmm6zaSiv0uvJEgBF8pD79miy4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M+vhsJ9pcR4zzihPovnTvwLKv7Rt6Lm5y3Nyue6OLRpsJKj+2uI5aEdnCrZTzWT6O
	 IM9HJNRJIFu+HlDZRy3Oi/KElAdXDuh+Dnddx2qUK2kCaSkO0Juos3K+mqNCQp25qv
	 Y7XlPWp9lDydt6MVUUkhl4kjiWwOIQF+QWRriSpMtDLntUPd6dpvftEHtKhLVHN6HK
	 7oFiMCunV4jaIQwpvjjmEPxEUznVYPiHRgTMmaTuY/iO9q5KMJexvDgPkmoDAYeQ5+
	 HdKliRi4weTOyqydD62nQ2i0acJ+ynebp3W/pA1uS/0M7zVjFPSJyuty8lUmufrtjd
	 VHa1meRgmhrRQ==
Date: Wed, 30 Nov 2022 12:26:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
In-Reply-To: <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com>
Message-ID: <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop> <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-271742979-1669837606=:4039"
Content-ID: <alpine.DEB.2.22.394.2211301209180.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-271742979-1669837606=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211301209181.4039@ubuntu-linux-20-04-desktop>

On Wed, 30 Nov 2022, Luca Fancellu wrote:
> Hi Stefano,
> 
> > I think the revert of the cppcheck integration in xen/Makefile and
> > xen/tools/merge_cppcheck_reports.py could be a separate patch. There is
> > no need to make sure cppcheck support in the xen Makefile is
> > "bisectable". That patch could have my acked-by already.
> 
> Ok I will split these changes in a following patch
> 
> > 
> > Also the document changes introduced in this patch have my reviewed-by:
> > - docs/misra/cppcheck.txt
> > - docs/misra/documenting-violations.rst
> > - docs/misra/false-positive-cppcheck.json
> > - docs/misra/xen-static-analysis.rst
> 
> Thank you, should I put those files in a separate patch with your rev-by before
> this patch or this is just a comment for you to remember which file you already
> reviewed?

If Jan and the other reviewers are OK, I think you could split them out
in a separate patch and add my reviewed-by. If Jan prefers to keep it
all together in one patch, then I wrote it down so that I remember what
I have already acked :-)



> >> +
> >> +def generate_cppcheck_deps():
> >> +    global cppcheck_extra_make_args
> >> +
> >> +    # Compile flags to pass to cppcheck:
> >> +    # - include config.h as this is passed directly to the compiler.
> >> +    # - define CPPCHECK as we use it to disable or enable some specific part of
> >> +    #   the code to solve some cppcheck issues.
> >> +    # - explicitely enable some cppcheck checks as we do not want to use "all"
> >> +    #   which includes unusedFunction which gives wrong positives as we check
> >> +    #   file per file.
> >> +    # - Explicitly suppress warnings on compiler-def.h because cppcheck throws
> >> +    #   an unmatchedSuppression due to the rule we put in suppression-list.txt
> >> +    #   to skip every finding in the file.
> >> +    #
> >> +    # Compiler defines are in compiler-def.h which is included in config.h
> >> +    #
> >> +    cppcheck_flags="""
> >> +--cppcheck-build-dir={}/{}
> >> + --max-ctu-depth=10
> >> + --enable=style,information,missingInclude
> >> + --template=\'{{file}}({{line}},{{column}}):{{id}}:{{severity}}:{{message}}\'
> >> + --relative-paths={}
> >> + --inline-suppr
> >> + --suppressions-list={}/suppression-list.txt
> >> + --suppress='unmatchedSuppression:*generated/compiler-def.h'
> >> + --include={}/include/xen/config.h
> > 
> > I noticed that some of the includes we used to have like
> > xsm/flask/include are missing here. Is that intended?
> 
> Yes it is, now that cppcheck is using the JSON compilation database, it can understand
> by the compilation argument “-I” what include path it needs to add, before we were
> adding it to every file, resulting in some false positive from the tool.
> Just --include={}/include/xen/config.h is needed because in the Xen makefile we are doing
> the same, passing the option to the compiler, resulting in every compiled file to have that
> header included.

OK, good to hear the process is improving


> >> 
> >> +    case ${OPTION} in
> >> +        -h|--help)
> >> +            help
> >> +            exit 0
> >> +            ;;
> >> +        --compiler=*)
> >> +            COMPILER="$(eval echo "${OPTION#*=}")"
> > 
> > This can be:
> > 
> > COMPILER="${OPTION#*=}"
> > 
> > and same for all the other below
> 
> Ok I’ll fix that
> 
> > 
> > 
> >> +            sm_tool_args="n"
> >> +            ;;
> >> +        --cppcheck-cmd=*)
> >> +            CPPCHECK_TOOL="$(eval echo "${OPTION#*=}")"
> >> +            sm_tool_args="y"
> >> +            ;;
> >> +        --cppcheck-html)
> >> +            CPPCHECK_HTML="y"
> >> +            sm_tool_args="n"
> >> +            ;;
> >> +        --cppcheck-plat=*)
> >> +            CPPCHECK_PLAT_PATH="$(eval echo "${OPTION#*=}")"
> >> +            sm_tool_args="n"
> >> +            ;;
> >> +        --ignore-path=*)
> >> +            IGNORE_PATH_LIST="${IGNORE_PATH_LIST} $(eval echo "${OPTION#*=}")"
> >> +            sm_tool_args="n"
> >> +            ;;
> >> +        --)
> >> +            forward_to_cc="y"
> >> +            sm_tool_args="n"
> >> +            ;;
> >> +        *)
> >> +            if [ "${sm_tool_args}" = "y" ]; then
> >> +                CPPCHECK_TOOL_ARGS="${CPPCHECK_TOOL_ARGS} ${OPTION}"
> >> +            else
> >> +                echo "Invalid option ${OPTION}"
> >> +                exit 1
> > 
> > It doesn't look like sm_tool_args is really needed? It is only set to
> > 'y' in the case of --cppcheck-cmd, and in that case we also set
> > CPPCHECK_TOOL. CPPCHECK_TOOL is the variable used below. Am I missing
> > something?
> 
> We use sm_tool_args to fill CPPCHECK_TOOL_ARGS, basically it’s a state machine where
> when we find --cppcheck-cmd=<xxx> we expect that every other space separated arguments
> passed afterwards are the args for cppcheck, so we append to CPPCHECK_TOOL_ARGS
> until we find an argument that is supposed to be only for this script.

That seems a bit unnecessary: if the user wants to pass arguments to
cppcheck, the user would do --cppcheck-cmd="cppcheck arg1 arg2" with ""
quotes. Doing that should make --cppcheck-cmd="cppcheck arg1 arg2" be
seen as a single argument from this script point of view. CPPCHECK_TOOL
would end up being set to "cppcheck arg1 arg2" which is what we want
anyway? And if we need to distinguish between the cppcheck binary and
its argument we could use "cut" to extract "cppcheck", "arg1", and
"arg2" from CPPCHECK_TOOL.  Would that work?


> > 
> >> +            fi
> >> +            ;;
> >> +    esac
> >> +done
> >> +
> >> +if [ "${COMPILER}" = "" ]
> >> +then
> >> +    echo "--compiler arg is mandatory."
> >> +    exit 1
> >> +fi
> >> +
> >> +function print_file() {
> >> +    local text="${1}"
> >> +    local init_file="${2}"
> >> +
> >> +    if [ "${init_file}" = "y" ]
> >> +    then
> >> +        echo -e -n "${text}" > "${JDB_FILE}"
> >> +    else
> >> +        echo -e -n "${text}" >> "${JDB_FILE}"
> >> +    fi
> > 
> > The >> can be used to create a file if the file is not already present.
> > So why the need for this if? In fact, we don't need print_file at all
> > and we can just 
> > 
> >  echo -e -n "something" >> "${JDB_FILE}"
> > 
> > directly from create_jcd. If you are concerned about a preexisting file,
> > then at the beginning of create_jcd you can:
> > 
> >  rm "${JDB_FILE}"
> 
> Ok I’ll remove the file in the top of create_jcd and use echo -e -n "something" >> "${JDB_FILE}”
> 
> >> 
> >> +
> >> +        # Check wchar size
> >> +        wchar_plat_suffix="t4"
> >> +        # sed prints the last occurence of -f(no-)short-wchar which is the one
> >> +        # applied to the file by the compiler
> >> +        wchar_option=$(echo "${FORWARD_FLAGS}" | \
> >> +            sed -nre 's,.*(-f(no-)?short-wchar).*,\1,p')
> >> +        if [ "${wchar_option}" = "-fshort-wchar" ]
> >> +        then
> >> +            wchar_plat_suffix="t2"
> >> +        fi
> > 
> > This seems a bit unnecessary: we should be able to find the right
> > platform file from XEN_TARGET_ARCH alone. No need to reverse engineer
> > the compiler command line?
> 
> The efi code is compiled with -fshort-wchar, but the rest of the file uses default length wchar,
> now maybe it was a bit of overthinking because I guess we have only these cases:
> 
> arm64:   arm64-wchar_t2 (efi code uses -fshort-wchar)
> arm32:   arm32-wchar_t4 (efi code is not in, but common-stub compiled with -f-no-short-wchar)
> x86_64: x86_64-wchar_t2 (efi code uses -fshort-wchar)
> 
> Am I right? 

Yes I think so too


> > 
> >> +
> >> +        # Select the right target platform, ARCH is generated from Xen Makefile
> >> +        platform="${CPPCHECK_PLAT_PATH}/${ARCH}-wchar_${wchar_plat_suffix}.xml"
> >> +        if [ ! -f "${platform}" ]
> >> +        then
> >> +            echo "${platform} not found!"
> >> +            exit 1
> >> +        fi
> >> +
> >> +        # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS, but
> >> +        # they can't be used here
> >> +        # shellcheck disable=SC2086
> >> +        ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
> >> +            --project="${JDB_FILE}" \
> >> +            --output-file="${out_file}" \
> >> +            --platform=${platform}
> >> +
> >> +        if [ "${CPPCHECK_HTML}" = "y" ]
> >> +        then
> >> +            # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS,
> >> +            # but they can't be used here
> >> +            # shellcheck disable=SC2086
> >> +            ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
> >> +                --project="${JDB_FILE}" \
> >> +                --output-file="${out_file%.txt}.xml" \
> >> +                --platform=${platform} \
> >> +                -q \
> >> +                --xml
> > 
> > This is showing my ignorance in cppcheck, but does it actually need to
> > be called twice in the html generation case? Actually three times if we
> > count the extra cppcheck-htmlreport call?
> 
> Cppcheck is not able to output a text report and an XML report at the same time,
> hence we need to call it twice, but the second call will use the cppcheck build directory
> As a “cache” to generate the results so it will be much more faster than the first one.

OK

 
> > 
> >> +        fi
> >> +    fi
> >> +fi
> >> diff --git a/xen/tools/cppcheck-plat/arm32-wchar_t4.xml b/xen/tools/cppcheck-plat/arm32-wchar_t4.xml
> >> new file mode 100644
> >> index 000000000000..3aefa7ba5c98
> >> --- /dev/null
> >> +++ b/xen/tools/cppcheck-plat/arm32-wchar_t4.xml
> >> @@ -0,0 +1,17 @@
> >> +<?xml version="1.0"?>
> >> +<platform>
> >> +  <char_bit>8</char_bit>
> >> +  <default-sign>unsigned</default-sign>
> > 
> > usually in C the default is actually "signed" not "unsigned". If you
> > write:
> > 
> >  int i;
> > 
> > i is signed
> 
> It took me a bit to understand this field, as the documentation is not clear at all, the default-sign is referring
> to the default char sign, which should be unsigned for arm, right?

OK


> Here the code to cppcheck that clarifies the field:
> 
> https://github.com/danmar/cppcheck/blob/2.7.5/lib/platform.cpp
> 
> At line 204, defaultSign is taking the value of <default-sign>, at line 64, when the platform is Native,
> defaultSign = (std::numeric_limits<char>::is_signed) ? 's' : 'u';
> 
> I’ve done some tests with this code in arm/arm64/x86_64:
> 
>    #define is_type_signed(my_type) (((my_type)-1) < 0)
>    if (is_type_signed(char))
>         printf("signed\n");
>     else
>         printf("unsigned\n");
> 
> And I have unsigned for arm/arm64 and signed for x86_64 (which I will change as it is wrong in this patch)
> 
> Can you confirm my results are right?
 
It looks like this is compiler specific. Yes, surprisingly with gcc I
got the same results as you.
--8323329-271742979-1669837606=:4039--

