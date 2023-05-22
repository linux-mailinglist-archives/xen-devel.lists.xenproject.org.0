Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C670070C3BA
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 18:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538040.837784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q18hJ-0002K2-Di; Mon, 22 May 2023 16:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538040.837784; Mon, 22 May 2023 16:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q18hJ-0002HQ-8w; Mon, 22 May 2023 16:47:49 +0000
Received: by outflank-mailman (input) for mailman id 538040;
 Mon, 22 May 2023 16:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDGG=BL=arm.com=Peter.Hoyes@srs-se1.protection.inumbo.net>)
 id 1q18hH-0002HK-Sv
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 16:47:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 60632598-f8c0-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 18:47:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C6E11FB;
 Mon, 22 May 2023 09:48:29 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B8BE3F762;
 Mon, 22 May 2023 09:47:44 -0700 (PDT)
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
X-Inumbo-ID: 60632598-f8c0-11ed-b22d-6b7b168915f2
Message-ID: <f59cf610-7e1c-8143-8608-f76dc43e13b6@arm.com>
Date: Mon, 22 May 2023 17:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH] tools/xendomains: Don't auto save/restore/migrate on
 Arm*
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <d52c31c7-57b1-41c1-af35-a9b847683c0a@perard>
 <20230519162454.50337-1-anthony.perard@citrix.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20230519162454.50337-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2023 17:24, Anthony PERARD wrote:
> Saving, restoring and migrating domains are not currently supported on
> arm and arm64 platforms, so xendomains prints the warning:
>
>    An error occurred while saving domain:
>    command not implemented
>
> when attempting to run `xendomains stop`. It otherwise continues to shut
> down the domains cleanly, with the unsupported steps skipped.
>
> Also in sysconfig.xendomains, change "Default" to "Example" as the
> real default is an empty value.
>
> Reported-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Peter, what do you think of this approach?

Thanks for preparing this. Just validated that the warning above is not 
present with both qemu-aarch64 and an internal stack.

Tested-by: Peter Hoyes <peter.hoyes@arm.com>

>
> For reference, there's also a way to findout if a macro exist, with
> AC_CHECK_DECL(), but the libxl.h header depends on other headers that
> needs to be generated.
> ---
>   tools/configure                                    | 11 +++++++++++
>   tools/configure.ac                                 | 13 +++++++++++++
>   tools/hotplug/Linux/init.d/sysconfig.xendomains.in |  4 ++--
>   3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/tools/configure b/tools/configure
> index 52b4717d01..a722f72c08 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -624,6 +624,7 @@ ac_includes_default="\
>   
>   ac_subst_vars='LTLIBOBJS
>   LIBOBJS
> +XENDOMAINS_SAVE_DIR
>   pvshim
>   ninepfs
>   SYSTEMD_LIBS
> @@ -10155,6 +10156,16 @@ if test "$ax_found" = "0"; then :
>   fi
>   
>   
> +case "$host_cpu" in
> +    arm*|aarch64)
> +        XENDOMAINS_SAVE_DIR=
> +        ;;
> +    *)
> +        XENDOMAINS_SAVE_DIR="$XEN_LIB_DIR/save"
> +        ;;
> +esac
> +
> +
>   cat >confcache <<\_ACEOF
>   # This file is a shell script that caches the results of configure
>   # tests run on this system so they can be shared between configure
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 3cccf41960..0f0983f6b7 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -517,4 +517,17 @@ AS_IF([test "x$pvshim" = "xy"], [
>   
>   AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
>   
> +dnl Disable autosave of domain in xendomains on shutdown
> +dnl due to missing support. This should be in sync with
> +dnl LIBXL_HAVE_NO_SUSPEND_RESUME in libxl.h
> +case "$host_cpu" in
> +    arm*|aarch64)
> +        XENDOMAINS_SAVE_DIR=
> +        ;;
> +    *)
> +        XENDOMAINS_SAVE_DIR="$XEN_LIB_DIR/save"
> +        ;;
> +esac
> +AC_SUBST(XENDOMAINS_SAVE_DIR)
> +
>   AC_OUTPUT()
> diff --git a/tools/hotplug/Linux/init.d/sysconfig.xendomains.in b/tools/hotplug/Linux/init.d/sysconfig.xendomains.in
> index f61ef9c4d1..3c49f18bb0 100644
> --- a/tools/hotplug/Linux/init.d/sysconfig.xendomains.in
> +++ b/tools/hotplug/Linux/init.d/sysconfig.xendomains.in
> @@ -45,7 +45,7 @@ XENDOMAINS_CREATE_USLEEP=5000000
>   XENDOMAINS_MIGRATE=""
>   
>   ## Type: string
> -## Default: @XEN_LIB_DIR@/save
> +## Example: @XEN_LIB_DIR@/save
>   #
>   # Directory to save running domains to when the system (dom0) is
>   # shut down. Will also be used to restore domains from if # XENDOMAINS_RESTORE
> @@ -53,7 +53,7 @@ XENDOMAINS_MIGRATE=""
>   # (e.g. because you rather shut domains down).
>   # If domain saving does succeed, SHUTDOWN will not be executed.
>   #
> -XENDOMAINS_SAVE=@XEN_LIB_DIR@/save
> +XENDOMAINS_SAVE=@XENDOMAINS_SAVE_DIR@
>   
>   ## Type: string
>   ## Default: "--wait"

