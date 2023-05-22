Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9AA70C804
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 21:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538082.837842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1BJ3-0004GO-5P; Mon, 22 May 2023 19:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538082.837842; Mon, 22 May 2023 19:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1BJ3-0004DO-2f; Mon, 22 May 2023 19:34:57 +0000
Received: by outflank-mailman (input) for mailman id 538082;
 Mon, 22 May 2023 19:34:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q1BJ1-0004DI-LJ
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 19:34:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q1BJ0-0000V1-Ko; Mon, 22 May 2023 19:34:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q1BJ0-0005ie-Fu; Mon, 22 May 2023 19:34:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Irn1Cg7gBaFqvIZrMdYcTS+cLcoPNbY4R08SgynHaIY=; b=05AAonTa1UCWacF2zlO3XTrPKw
	ZkPmoHV15Baye4qS9ltXjwzobYZRz/JrJf2Ew7ggK31rc/Q/fVvMr6RpIybbYihR4qjDwxl4CdciT
	SthMy7OhjK31PIkc5QuFqdLeyi8pwHgFdPBNG2lxX8mSaqRIjBPm0vKPbyhbBqIpG1Q8=;
Message-ID: <b18f7dcb-b790-2571-93e1-aa9a9132276a@xen.org>
Date: Mon, 22 May 2023 20:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN PATCH] tools/xendomains: Don't auto save/restore/migrate on
 Arm*
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Wei Liu <wl@xen.org>
References: <d52c31c7-57b1-41c1-af35-a9b847683c0a@perard>
 <20230519162454.50337-1-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230519162454.50337-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

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

Quite likely, a developer adding a new arch will first look at the 
definition of LIXBL_HAVE_NO_SUSPEND_RESUME. So it would be good if we 
have a similar message there to remind them to update this case. That 
said...

> +case "$host_cpu" in
> +    arm*|aarch64)
> +        XENDOMAINS_SAVE_DIR=
> +        ;;
> +    *)
> +        XENDOMAINS_SAVE_DIR="$XEN_LIB_DIR/save"
> +        ;;
> +esac

... I am wondering if the switch should be the other way around. IOW, 
the default should be no support for suspend/resume. This will make 
easier to add support for RISC-V (I suspect support for suspend/resume 
will not be in the first version) or any new other arch.

Cheers,

-- 
Julien Grall

