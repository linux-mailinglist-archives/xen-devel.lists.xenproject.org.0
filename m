Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F855F25F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 02:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357436.585968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LXz-00065n-ND; Wed, 29 Jun 2022 00:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357436.585968; Wed, 29 Jun 2022 00:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LXz-00062u-KI; Wed, 29 Jun 2022 00:27:11 +0000
Received: by outflank-mailman (input) for mailman id 357436;
 Wed, 29 Jun 2022 00:27:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6LXz-00062o-2V
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 00:27:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34e84464-f742-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 02:27:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6282661B7F;
 Wed, 29 Jun 2022 00:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E9EC341CB;
 Wed, 29 Jun 2022 00:27:05 +0000 (UTC)
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
X-Inumbo-ID: 34e84464-f742-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656462425;
	bh=XrB+7s7nUnWRhJKddWbY4OOYoUdoajsrk+NZ+jGW7f8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d6lKJTudWeJXg6OmnwxdU4Otk72TwAGscBkR4z6C/w+0DHoKGENpE3HqkmjrotX5+
	 sLxxlnu1jvWMP6MnL/FbekW2dsCJwGnby+JjHSpp2rnMQtLHSf7+0YtuklEuUp5/mf
	 OUnCj4jBUzWDoMmhJZ4JzwpwTVdDphIf1QPncXl9cWmAlIzqSkcULvdNzhPJQEXDpb
	 P3PkmkfqJzqCYJdEqGHvC6cqBFwGm9ACASR1ItD1ngWcCwE568ulyxqN8KeZc85yJs
	 EJ4QkvHOyJjEHGgmgaXA+mG62WZUuf9wLsSG4N2Q22fXNAedSjDgymOh2Ji4rSqu15
	 s2lHjP5xsYasw==
Date: Tue, 28 Jun 2022 17:27:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    viryaos-discuss@lists.sourceforge.net
Subject: Re: [PATCH 1/2] uboot-script-gen: prevent user mistakes due to
 DOM0_KERNEL becoming optional
In-Reply-To: <20220626184536.666647-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281726560.4389@ubuntu-linux-20-04-desktop>
References: <20220626184536.666647-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
> Before enabling true dom0less configuration, the script was failing instantly
> if DOM0_KERNEL parameter was not specified. This behaviour has changed and
> this needs to be communicated to the user.
> 
> Mention in README.md that for dom0less configurations, the parameter
> DOM0_KERNEL is optional.
> 
> If DOM0_KERNEL is not set, check that no other dom0 specific parameters are
> specified by the user. Fail the script early with an appropriate error
> message, if it was invoked with erroneous configuration settings.
> 
> Change message "Dom0 kernel is not specified, continue with dom0less setup."
> to "Dom0 kernel is not specified, continue with true dom0less setup."
> to refer more accurately to a dom0less setup without dom0.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  README.md                |  1 +
>  scripts/uboot-script-gen | 21 ++++++++++++++-------
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 17ff206..cb15ca5 100644
> --- a/README.md
> +++ b/README.md
> @@ -100,6 +100,7 @@ Where:
>    been specified in XEN_PASSTHROUGH_PATHS.
>  
>  - DOM0_KERNEL specifies the Dom0 kernel file to load.
> +  For dom0less configurations, the parameter is optional.
>  
>  - DOM0_MEM specifies the amount of memory for Dom0 VM in MB. The default
>    is 1024. This is only applicable when XEN_CMD is not specified.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index e85c6ec..085e29f 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -410,6 +410,20 @@ function find_root_dev()
>  
>  function xen_config()
>  {
> +    if test -z "$DOM0_KERNEL"
> +    then
> +        if test "$NUM_DOMUS" -eq "0"
> +        then
> +            echo "Neither dom0 or domUs are specified, exiting."
> +            exit 1
> +        elif test "$DOM0_MEM" || test "$DOM0_VCPUS" || test "$DOM0_COLORS" || test "$DOM0_CMD" || test "$DOM0_RAMDISK" || test "$DOM0_ROOTFS"
> +        then
> +            echo "For dom0less configuration without dom0, no dom0 specific parameters should be specified, exiting."
> +            exit 1
> +        fi
> +        echo "Dom0 kernel is not specified, continue with true dom0less setup."
> +    fi
> +
>      if [ -z "$XEN_CMD" ]
>      then
>          if [ -z "$DOM0_MEM" ]
> @@ -457,13 +471,6 @@ function xen_config()
>      fi
>      if test -z "$DOM0_KERNEL"
>      then
> -        if test "$NUM_DOMUS" -eq "0"
> -        then
> -            echo "Neither dom0 or domUs are specified, exiting."
> -            exit 1
> -        fi
> -        echo "Dom0 kernel is not specified, continue with dom0less setup."
> -        unset DOM0_RAMDISK
>          # Remove dom0 specific parameters from the XEN command line.
>          local params=($XEN_CMD)
>          XEN_CMD="${params[@]/dom0*/}"
> -- 
> 2.34.1
> 

