Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0372E28AF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 20:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58797.103614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksVst-0008Ez-Ra; Thu, 24 Dec 2020 19:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58797.103614; Thu, 24 Dec 2020 19:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksVst-0008Ea-OK; Thu, 24 Dec 2020 19:02:47 +0000
Received: by outflank-mailman (input) for mailman id 58797;
 Thu, 24 Dec 2020 19:02:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7aL=F4=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1ksVsr-0008EV-J5
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 19:02:45 +0000
Received: from syrinx.knorrie.org (unknown [82.94.188.77])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d61c699d-f5f5-4200-872a-7deb88ea165a;
 Thu, 24 Dec 2020 19:02:39 +0000 (UTC)
Received: from [IPv6:2a02:a213:2b81:e600::12] (unknown
 [IPv6:2a02:a213:2b81:e600::12])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id 2091260B8E57A;
 Thu, 24 Dec 2020 20:02:38 +0100 (CET)
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
X-Inumbo-ID: d61c699d-f5f5-4200-872a-7deb88ea165a
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
References: <8b4564696cae00041848af8c5793172b80edadd5.1608742171.git.maxi@daemonizer.de>
From: Hans van Kranenburg <hans@knorrie.org>
Subject: Re: [XEN PATCH v2] docs: set date to SOURCE_DATE_EPOCH if available
Message-ID: <f602c6d8-2e3d-806f-0584-ddb478b151b0@knorrie.org>
Date: Thu, 24 Dec 2020 20:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8b4564696cae00041848af8c5793172b80edadd5.1608742171.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 12/23/20 5:56 PM, Maximilian Engelhardt wrote:
> check if a GNU date that supports the '-u -d @...' options and syntax or
> a BSD date are available. If so, use the appropriate options for the
> date command to produce a custom date if SOURCE_DATE_EPOCH is defined.
> If SOURCE_DATE_EPOCH is not defined or no suitable date command was
> found, use the current date. This enables reproducible builds.
> 
> Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
> 
> Changes in v2:
> - add capability detection for the 'date' command using ax_prog_date.m4
> - add information about detected date command to config/Docs.mk
> - only call a supported date command in docs/Makefile
> ---
> Please note the ax_prog_date.m4 macro is taken from the autoconf-archive
> repository [1] and it's license is GPL v3 or later with an exception for
> the generated configure script.
> 
> [1] https://www.gnu.org/software/autoconf-archive/
> ---
>  config/Docs.mk.in  |   3 +
>  docs/Makefile      |  16 +++-
>  docs/configure     | 213 +++++++++++++++++++++++++++++++++++++++++++++
>  docs/configure.ac  |   9 ++
>  m4/ax_prog_date.m4 | 139 +++++++++++++++++++++++++++++
>  5 files changed, 379 insertions(+), 1 deletion(-)
>  create mode 100644 m4/ax_prog_date.m4

Wait, what. The comment about the -d option already existing since 2005
(in the previous thread) is relevant here...

I guess there would be other reasons why the whole current Xen master
branch would not compile on e.g. Debian Sarge 3.1 from 2005... Like,
amd64 did not even exist as release architecture yet, back then...

I'd prefer

  1 file changed, 7 insertions(+), 1 deletion(-)

over

  5 files changed, 379 insertions(+), 1 deletion(-)

in this case.

Hans

> diff --git a/config/Docs.mk.in b/config/Docs.mk.in
> index e76e5cd5ff..cc2abd8fcc 100644
> --- a/config/Docs.mk.in
> +++ b/config/Docs.mk.in
> @@ -7,3 +7,6 @@ POD2HTML            := @POD2HTML@
>  POD2TEXT            := @POD2TEXT@
>  PANDOC              := @PANDOC@
>  PERL                := @PERL@
> +
> +# Variables
> +DATE_TYPE_AT        := @DATE_TYPE_AT@
> diff --git a/docs/Makefile b/docs/Makefile
> index 8de1efb6f5..c79fe0b63e 100644
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -3,7 +3,21 @@ include $(XEN_ROOT)/Config.mk
>  -include $(XEN_ROOT)/config/Docs.mk
>  
>  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
> -DATE		:= $(shell date +%Y-%m-%d)
> +
> +DATE_FMT	:= +%Y-%m-%d
> +ifdef SOURCE_DATE_EPOCH
> +ifeq ($(DATE_TYPE_AT),GNU)
> +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)")
> +else
> +ifeq ($(DATE_TYPE_AT),BSD)
> +DATE		:= $(shell date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)")
> +else
> +DATE		:= $(shell date "$(DATE_FMT)")
> +endif
> +endif
> +else
> +DATE		:= $(shell date "$(DATE_FMT)")
> +endif
>  
>  DOC_ARCHES      := arm x86_32 x86_64
>  MAN_SECTIONS    := 1 5 7 8
> diff --git a/docs/configure b/docs/configure
> index f55268564e..9c3218f560 100755
> --- a/docs/configure
> +++ b/docs/configure
> @@ -587,6 +587,7 @@ PACKAGE_URL='https://www.xen.org/'
>  ac_unique_file="misc/xen-command-line.pandoc"
>  ac_subst_vars='LTLIBOBJS
>  LIBOBJS
> +DATE_TYPE_AT
>  PERL
>  PANDOC
>  POD2TEXT
> @@ -1808,6 +1809,86 @@ case "$host_os" in
>  esac
>  
>  
> +# Fetched from https://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_prog_date.m4
> +# Commit ID: fd1d25c14855037f6ccd7dbc7fe9ae5fc9bea8f4
> +# ===========================================================================
> +#       https://www.gnu.org/software/autoconf-archive/ax_prog_date.html
> +# ===========================================================================
> +#
> +# SYNOPSIS
> +#
> +#   AX_PROG_DATE()
> +#
> +# DESCRIPTION
> +#
> +#   This macro tries to determine the type of the date (1) command and some
> +#   of its non-standard capabilities.
> +#
> +#   The type is determined as follow:
> +#
> +#     * If the version string contains "GNU", then:
> +#       - The variable ax_cv_prog_date_gnu is set to "yes".
> +#       - The variable ax_cv_prog_date_type is set to "gnu".
> +#
> +#     * If date supports the "-v 1d" option, then:
> +#       - The variable ax_cv_prog_date_bsd is set to "yes".
> +#       - The variable ax_cv_prog_date_type is set to "bsd".
> +#
> +#     * If both previous checks fail, then:
> +#       - The variable ax_cv_prog_date_type is set to "unknown".
> +#
> +#   The following capabilities of GNU date are checked:
> +#
> +#     * If date supports the --date arg option, then:
> +#       - The variable ax_cv_prog_date_gnu_date is set to "yes".
> +#
> +#     * If date supports the --utc arg option, then:
> +#       - The variable ax_cv_prog_date_gnu_utc is set to "yes".
> +#
> +#   The following capabilities of BSD date are checked:
> +#
> +#     * If date supports the -v 1d  option, then:
> +#       - The variable ax_cv_prog_date_bsd_adjust is set to "yes".
> +#
> +#     * If date supports the -r arg option, then:
> +#       - The variable ax_cv_prog_date_bsd_date is set to "yes".
> +#
> +#   All the aforementioned variables are set to "no" before a check is
> +#   performed.
> +#
> +# LICENSE
> +#
> +#   Copyright (c) 2017 Enrico M. Crisostomo <enrico.m.crisostomo@gmail.com>
> +#
> +#   This program is free software: you can redistribute it and/or modify it
> +#   under the terms of the GNU General Public License as published by the
> +#   Free Software Foundation, either version 3 of the License, or (at your
> +#   option) any later version.
> +#
> +#   This program is distributed in the hope that it will be useful, but
> +#   WITHOUT ANY WARRANTY; without even the implied warranty of
> +#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
> +#   Public License for more details.
> +#
> +#   You should have received a copy of the GNU General Public License along
> +#   with this program. If not, see <http://www.gnu.org/licenses/>.
> +#
> +#   As a special exception, the respective Autoconf Macro's copyright owner
> +#   gives unlimited permission to copy, distribute and modify the configure
> +#   scripts that are the output of Autoconf when processing the Macro. You
> +#   need not follow the terms of the GNU General Public License when using
> +#   or distributing such scripts, even though portions of the text of the
> +#   Macro appear in them. The GNU General Public License (GPL) does govern
> +#   all other use of the material that constitutes the Autoconf Macro.
> +#
> +#   This special exception to the GPL applies to versions of the Autoconf
> +#   Macro released by the Autoconf Archive. When you make and distribute a
> +#   modified version of the Autoconf Macro, you may extend this special
> +#   exception to the GPL to apply to your modified version as well.
> +
> +#serial 3
> +
> +
>  
>  
>  test "x$prefix" = "xNONE" && prefix=$ac_default_prefix
> @@ -2267,6 +2348,138 @@ then
>      as_fn_error $? "Unable to find perl, please install perl" "$LINENO" 5
>  fi
>  
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for GNU date" >&5
> +$as_echo_n "checking for GNU date... " >&6; }
> +if ${ax_cv_prog_date_gnu+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +    ax_cv_prog_date_gnu=no
> +    if date --version 2>/dev/null | head -1 | grep -q GNU
> +    then
> +      ax_cv_prog_date_gnu=yes
> +    fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_gnu" >&5
> +$as_echo "$ax_cv_prog_date_gnu" >&6; }
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for BSD date" >&5
> +$as_echo_n "checking for BSD date... " >&6; }
> +if ${ax_cv_prog_date_bsd+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +    ax_cv_prog_date_bsd=no
> +    if date -v 1d > /dev/null 2>&1
> +    then
> +      ax_cv_prog_date_bsd=yes
> +    fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_bsd" >&5
> +$as_echo "$ax_cv_prog_date_bsd" >&6; }
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for date type" >&5
> +$as_echo_n "checking for date type... " >&6; }
> +if ${ax_cv_prog_date_type+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +    ax_cv_prog_date_type=unknown
> +    if test "x${ax_cv_prog_date_gnu}" = "xyes"
> +    then
> +      ax_cv_prog_date_type=gnu
> +    elif test "x${ax_cv_prog_date_bsd}" = "xyes"
> +    then
> +      ax_cv_prog_date_type=bsd
> +    fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_type" >&5
> +$as_echo "$ax_cv_prog_date_type" >&6; }
> +  if test "x$ax_cv_prog_date_gnu" = xyes; then :
> +
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether GNU date supports --date" >&5
> +$as_echo_n "checking whether GNU date supports --date... " >&6; }
> +if ${ax_cv_prog_date_gnu_date+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +      ax_cv_prog_date_gnu_date=no
> +      if date --date=@1512031231 > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_gnu_date=yes
> +      fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_gnu_date" >&5
> +$as_echo "$ax_cv_prog_date_gnu_date" >&6; }
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether GNU date supports --utc" >&5
> +$as_echo_n "checking whether GNU date supports --utc... " >&6; }
> +if ${ax_cv_prog_date_gnu_utc+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +      ax_cv_prog_date_gnu_utc=no
> +      if date --utc > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_gnu_utc=yes
> +      fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_gnu_utc" >&5
> +$as_echo "$ax_cv_prog_date_gnu_utc" >&6; }
> +
> +fi
> +  if test "x$ax_cv_prog_date_bsd" = xyes; then :
> +
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether BSD date supports -r" >&5
> +$as_echo_n "checking whether BSD date supports -r... " >&6; }
> +if ${ax_cv_prog_date_bsd_date+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +      ax_cv_prog_date_bsd_date=no
> +      if date -r 1512031231 > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_bsd_date=yes
> +      fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_bsd_date" >&5
> +$as_echo "$ax_cv_prog_date_bsd_date" >&6; }
> +
> +fi
> +    if test "x$ax_cv_prog_date_bsd" = xyes; then :
> +
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether BSD date supports -v" >&5
> +$as_echo_n "checking whether BSD date supports -v... " >&6; }
> +if ${ax_cv_prog_date_bsd_adjust+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +
> +      ax_cv_prog_date_bsd_adjust=no
> +      if date -v 1d > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_bsd_adjust=yes
> +      fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_prog_date_bsd_adjust" >&5
> +$as_echo "$ax_cv_prog_date_bsd_adjust" >&6; }
> +
> +fi
> +
> +if test "$ax_cv_prog_date_gnu_date:$ax_cv_prog_date_gnu_utc" = yes:yes; then :
> +  DATE_TYPE_AT="GNU"
> +else
> +  if test "x$ax_cv_prog_date_bsd_date" = xyes; then :
> +  DATE_TYPE_AT="BSD"
> +else
> +  DATE_TYPE_AT="Unknown"
> +fi
> +fi
> +
> +
>  cat >confcache <<\_ACEOF
>  # This file is a shell script that caches the results of configure
>  # tests run on this system so they can be shared between configure
> diff --git a/docs/configure.ac b/docs/configure.ac
> index cb5a6eaa4c..c87471e706 100644
> --- a/docs/configure.ac
> +++ b/docs/configure.ac
> @@ -17,6 +17,7 @@ m4_include([../m4/docs_tool.m4])
>  m4_include([../m4/path_or_fail.m4])
>  m4_include([../m4/features.m4])
>  m4_include([../m4/paths.m4])
> +m4_include([../m4/ax_prog_date.m4])
>  
>  AX_XEN_EXPAND_CONFIG()
>  
> @@ -29,4 +30,12 @@ AX_DOCS_TOOL_PROG([PANDOC], [pandoc])
>  AC_ARG_VAR([PERL], [Path to Perl parser])
>  AX_PATH_PROG_OR_FAIL([PERL], [perl])
>  
> +AX_PROG_DATE
> +AS_IF([test "$ax_cv_prog_date_gnu_date:$ax_cv_prog_date_gnu_utc" = yes:yes],
> +    [DATE_TYPE_AT="GNU"],
> +    [AS_IF([test "x$ax_cv_prog_date_bsd_date" = xyes],
> +        [DATE_TYPE_AT="BSD"],
> +        [DATE_TYPE_AT="Unknown"])])
> +AC_SUBST([DATE_TYPE_AT])
> +
>  AC_OUTPUT()
> diff --git a/m4/ax_prog_date.m4 b/m4/ax_prog_date.m4
> new file mode 100644
> index 0000000000..675412bac2
> --- /dev/null
> +++ b/m4/ax_prog_date.m4
> @@ -0,0 +1,139 @@
> +# Fetched from https://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_prog_date.m4
> +# Commit ID: fd1d25c14855037f6ccd7dbc7fe9ae5fc9bea8f4
> +# ===========================================================================
> +#       https://www.gnu.org/software/autoconf-archive/ax_prog_date.html
> +# ===========================================================================
> +#
> +# SYNOPSIS
> +#
> +#   AX_PROG_DATE()
> +#
> +# DESCRIPTION
> +#
> +#   This macro tries to determine the type of the date (1) command and some
> +#   of its non-standard capabilities.
> +#
> +#   The type is determined as follow:
> +#
> +#     * If the version string contains "GNU", then:
> +#       - The variable ax_cv_prog_date_gnu is set to "yes".
> +#       - The variable ax_cv_prog_date_type is set to "gnu".
> +#
> +#     * If date supports the "-v 1d" option, then:
> +#       - The variable ax_cv_prog_date_bsd is set to "yes".
> +#       - The variable ax_cv_prog_date_type is set to "bsd".
> +#
> +#     * If both previous checks fail, then:
> +#       - The variable ax_cv_prog_date_type is set to "unknown".
> +#
> +#   The following capabilities of GNU date are checked:
> +#
> +#     * If date supports the --date arg option, then:
> +#       - The variable ax_cv_prog_date_gnu_date is set to "yes".
> +#
> +#     * If date supports the --utc arg option, then:
> +#       - The variable ax_cv_prog_date_gnu_utc is set to "yes".
> +#
> +#   The following capabilities of BSD date are checked:
> +#
> +#     * If date supports the -v 1d  option, then:
> +#       - The variable ax_cv_prog_date_bsd_adjust is set to "yes".
> +#
> +#     * If date supports the -r arg option, then:
> +#       - The variable ax_cv_prog_date_bsd_date is set to "yes".
> +#
> +#   All the aforementioned variables are set to "no" before a check is
> +#   performed.
> +#
> +# LICENSE
> +#
> +#   Copyright (c) 2017 Enrico M. Crisostomo <enrico.m.crisostomo@gmail.com>
> +#
> +#   This program is free software: you can redistribute it and/or modify it
> +#   under the terms of the GNU General Public License as published by the
> +#   Free Software Foundation, either version 3 of the License, or (at your
> +#   option) any later version.
> +#
> +#   This program is distributed in the hope that it will be useful, but
> +#   WITHOUT ANY WARRANTY; without even the implied warranty of
> +#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
> +#   Public License for more details.
> +#
> +#   You should have received a copy of the GNU General Public License along
> +#   with this program. If not, see <http://www.gnu.org/licenses/>.
> +#
> +#   As a special exception, the respective Autoconf Macro's copyright owner
> +#   gives unlimited permission to copy, distribute and modify the configure
> +#   scripts that are the output of Autoconf when processing the Macro. You
> +#   need not follow the terms of the GNU General Public License when using
> +#   or distributing such scripts, even though portions of the text of the
> +#   Macro appear in them. The GNU General Public License (GPL) does govern
> +#   all other use of the material that constitutes the Autoconf Macro.
> +#
> +#   This special exception to the GPL applies to versions of the Autoconf
> +#   Macro released by the Autoconf Archive. When you make and distribute a
> +#   modified version of the Autoconf Macro, you may extend this special
> +#   exception to the GPL to apply to your modified version as well.
> +
> +#serial 3
> +
> +AC_DEFUN([AX_PROG_DATE], [dnl
> +  AC_CACHE_CHECK([for GNU date], [ax_cv_prog_date_gnu], [
> +    ax_cv_prog_date_gnu=no
> +    if date --version 2>/dev/null | head -1 | grep -q GNU
> +    then
> +      ax_cv_prog_date_gnu=yes
> +    fi
> +  ])
> +  AC_CACHE_CHECK([for BSD date], [ax_cv_prog_date_bsd], [
> +    ax_cv_prog_date_bsd=no
> +    if date -v 1d > /dev/null 2>&1
> +    then
> +      ax_cv_prog_date_bsd=yes
> +    fi
> +  ])
> +  AC_CACHE_CHECK([for date type], [ax_cv_prog_date_type], [
> +    ax_cv_prog_date_type=unknown
> +    if test "x${ax_cv_prog_date_gnu}" = "xyes"
> +    then
> +      ax_cv_prog_date_type=gnu
> +    elif test "x${ax_cv_prog_date_bsd}" = "xyes"
> +    then
> +      ax_cv_prog_date_type=bsd
> +    fi
> +  ])
> +  AS_VAR_IF([ax_cv_prog_date_gnu], [yes], [
> +    AC_CACHE_CHECK([whether GNU date supports --date], [ax_cv_prog_date_gnu_date], [
> +      ax_cv_prog_date_gnu_date=no
> +      if date --date=@1512031231 > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_gnu_date=yes
> +      fi
> +    ])
> +    AC_CACHE_CHECK([whether GNU date supports --utc], [ax_cv_prog_date_gnu_utc], [
> +      ax_cv_prog_date_gnu_utc=no
> +      if date --utc > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_gnu_utc=yes
> +      fi
> +    ])
> +  ])
> +  AS_VAR_IF([ax_cv_prog_date_bsd], [yes], [
> +    AC_CACHE_CHECK([whether BSD date supports -r], [ax_cv_prog_date_bsd_date], [
> +      ax_cv_prog_date_bsd_date=no
> +      if date -r 1512031231 > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_bsd_date=yes
> +      fi
> +    ])
> +  ])
> +    AS_VAR_IF([ax_cv_prog_date_bsd], [yes], [
> +    AC_CACHE_CHECK([whether BSD date supports -v], [ax_cv_prog_date_bsd_adjust], [
> +      ax_cv_prog_date_bsd_adjust=no
> +      if date -v 1d > /dev/null 2>&1
> +      then
> +        ax_cv_prog_date_bsd_adjust=yes
> +      fi
> +    ])
> +  ])
> +])dnl AX_PROG_DATE
> 


