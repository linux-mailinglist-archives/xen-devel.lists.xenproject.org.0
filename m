Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089725696CD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 02:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362672.592819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9FD7-0000k2-GI; Thu, 07 Jul 2022 00:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362672.592819; Thu, 07 Jul 2022 00:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9FD7-0000gq-DB; Thu, 07 Jul 2022 00:17:37 +0000
Received: by outflank-mailman (input) for mailman id 362672;
 Thu, 07 Jul 2022 00:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tNfF=XM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9FD6-0000gk-8a
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 00:17:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3297939a-fd8a-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 02:17:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5529061F9D;
 Thu,  7 Jul 2022 00:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C81C3411C;
 Thu,  7 Jul 2022 00:17:32 +0000 (UTC)
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
X-Inumbo-ID: 3297939a-fd8a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657153052;
	bh=4aNjuGa9IHa9ISuWx3EdpyLorE0D2wrPjTcdXxdfNfA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=grMyzpm3FqXYRPpoknH9qUn5wxpQb+omW6/pPst636ubdPLMhDkcch1Y64Cpwntp5
	 NNzvUKg7HHEKMXYBGXxRO+R8K1dCRKLVw53K745uHuAh0VO7ct8WgjvL5a30rcB3Fb
	 rvsLJWI8src+x6L2eJTfSiVoENBL26gz6WRp6nFJIUuNlvErMcxCUdgT+DN/yiVAcZ
	 4aumODLH11Sro8svhOpL03XxYM2aM59ipDhtYIKgSzvBVlQ2g8Mj79TjTSUe+z8ve5
	 22vMn5ZZj2KHhhQAKmVsoM4HrCrJfOzJoko83JRfFyr7Kieowyjuk/5Zc6Rk9PLkdX
	 Ar49I8GYKe2EA==
Date: Wed, 6 Jul 2022 17:17:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net, 
    sstabellini@kernel.org, Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [ImageBuilder][PATCH v2 3/4] uboot-script-gen: Enable appending
 extra commands to boot script
In-Reply-To: <20220630140028.3227385-4-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2207061715040.2354836@ubuntu-linux-20-04-desktop>
References: <20220630140028.3227385-1-andrei.cherechesu@oss.nxp.com> <20220630140028.3227385-4-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jun 2022, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added the "-a" parameter which stands for APPEND_EXTRA_CMDS option,
> which enables the user to specify the path to a text file that contains,
> on each line, u-boot commands that will be added to the generated script as
> "fixups", before the boot command.
> 
> The file specified via the "-a" parameter will be copied as-is in the
> generated script.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>  scripts/uboot-script-gen | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index f8d2fb0..444c65a 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -416,6 +416,10 @@ function check_file_type()
>      elif [ "$type" = "Device Tree Blob" ]
>      then
>          type="Device Tree Blob\|data"
> +
> +    elif [ "$type" = "text" ]
> +    then
> +        type="ASCII text"
>      fi
>  
>      file -L $filename | grep "$type" &> /dev/null
> @@ -973,7 +977,7 @@ function print_help
>  {
>      script=`basename "$0"`
>      echo "usage:"
> -    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
> +    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s] [-a APPEND_EXTRA_CMDS]"
>      echo "	$script -h"
>      echo "where:"
>      echo "	CONFIG_FILE - configuration file"
> @@ -991,6 +995,7 @@ function print_help
>      echo "	-f - enable generating a FIT image"
>      echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
>      echo "	-s - enable dynamic loading of binaries by storing their addresses and sizes u-boot env variables"
> +    echo "	APPEND_EXTRA_CMDS - absolute path to file containing extra u-boot cmds (fixups) to be run before booting"
>      echo "	-h - prints out the help message and exits "
>      echo "Defaults:"
>      echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"

Instead of adding it as a command line option, would it make sense to
just source it from the ImageBuilder config file? Like:

---
UBOOT_SOURCE="boot.source"
UBOOT_SCRIPT="boot.scr"
APPEND_EXTRA_CMDS="extra.txt"
---

In other words I think we can skip parsing "-a" and just check if
APPEND_EXTRA_CMDS is set


> @@ -998,7 +1003,7 @@ function print_help
>      echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
>  }
>  
> -while getopts ":c:t:d:ho:k:u:fp:s" opt; do
> +while getopts ":c:t:d:ho:k:u:fp:sa:" opt; do
>      case ${opt} in
>      t )
>          case $OPTARG in
> @@ -1043,6 +1048,9 @@ while getopts ":c:t:d:ho:k:u:fp:s" opt; do
>      s )
>          dynamic_loading_opt=y
>          ;;
> +    a )
> +        extra_cmds_file=$OPTARG
> +        ;;
>      h )
>          print_help
>          exit 0
> @@ -1235,6 +1243,13 @@ load_file $DEVICE_TREE "host_fdt"
>  bitstream_load_and_config  # bitstream is loaded last but used first
>  device_tree_editing $device_tree_addr
>  
> +# append extra u-boot commands (fixups) to script before boot command
> +if test "$extra_cmds_file"
> +then
> +    check_file_type "$extra_cmds_file" "text"
> +    cat $extra_cmds_file >> $UBOOT_SOURCE
> +fi

I think it should be below the setenv fdt_high command below. (Just
before the echo "$BOOT_CMD...

Other than that, it is fine, thank you!


>  # disable device tree reloation
>  echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
>  
> -- 
> 2.35.1
> 

