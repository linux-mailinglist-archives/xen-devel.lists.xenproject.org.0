Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EAE93AC9F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 08:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763754.1174061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVTn-0002B9-QI; Wed, 24 Jul 2024 06:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763754.1174061; Wed, 24 Jul 2024 06:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVTn-00029f-Ml; Wed, 24 Jul 2024 06:28:03 +0000
Received: by outflank-mailman (input) for mailman id 763754;
 Wed, 24 Jul 2024 06:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlgJ=OY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sWVTm-00029Z-9J
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 06:28:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df4a3428-4985-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 08:28:00 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 48D2A4EE0738;
 Wed, 24 Jul 2024 08:27:59 +0200 (CEST)
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
X-Inumbo-ID: df4a3428-4985-11ef-8776-851b0ebba9a2
MIME-Version: 1.0
Date: Wed, 24 Jul 2024 08:27:59 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: victorm.lira@amd.com
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com
Subject: Re: [RFC PATCH] automation: add linker symbol name script
In-Reply-To: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
References: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
Message-ID: <a382237f631d86292db349924a097e64@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-24 02:18, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 

Hi,

> Add a script that extracts the names of symbols in linker scripts.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Note:
> Not included are the "." location name or symbol names enclosed in 
> quotes
> since the files dont't use any.
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: roberto.bagnara@bugseng.com
> Cc: consulting@bugseng.com
> Cc: simone.ballarin@bugseng.com
> ---
>  automation/eclair_analysis/linker_symbols.sh | 41 +++++++++++++++++++
>  automation/eclair_analysis/stuff.txt         | 42 ++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100755 automation/eclair_analysis/linker_symbols.sh
>  create mode 100644 automation/eclair_analysis/stuff.txt
> 
> diff --git a/automation/eclair_analysis/linker_symbols.sh 
> b/automation/eclair_analysis/linker_symbols.sh
> new file mode 100755
> index 0000000000..c8c44e235f
> --- /dev/null
> +++ b/automation/eclair_analysis/linker_symbols.sh
> @@ -0,0 +1,41 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different 
> from 0.
> +set -e
> +
> +# Extract linker symbol names (except those starting with ".") from 
> assignments.
> +
> +script_name=`basename "$0"`
> +script_dir="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +src_dir="${script_dir}/../.."
> +
> +usage() {
> +  echo "Usage: ${script_name} <ARM64|X86_64>"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +  exit 1
> +fi
> +
> +if [ "$1" == "X86_64" ]; then
> +    filepaths=(
> +        "${src_dir}/xen/arch/x86/xen.lds.S"
> +    )
> +elif [ "$1" == "ARM64" ]; then
> +    filepaths=(
> +        "${src_dir}/xen/arch/arm/xen.lds.S"
> +    )
> +else
> +    usage
> +    exit 1
> +fi
> +
> +(
> +    for file in "${filepaths[@]}"
> +    do
> +        sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;\s*$/\1/p" 
> $filepaths
> +    done
> +)
> diff --git a/automation/eclair_analysis/stuff.txt 
> b/automation/eclair_analysis/stuff.txt
> new file mode 100644
> index 0000000000..efc33e6a59
> --- /dev/null
> +++ b/automation/eclair_analysis/stuff.txt

I wouldn't include the actual output in the patch. It' much better if I 
have a script that produces a list of symbols, and then use that to 
generate a configuration file right before the analysis.

> @@ -0,0 +1,42 @@
> +_start
> +_idmap_start
> +_idmap_end
> +__proc_info_start
> +__proc_info_end
> +__note_gnu_build_id_start
> +__note_gnu_build_id_end
> +__ro_after_init_start
> +__ro_after_init_end
> +__start___ex_table
> +__stop___ex_table
> +__start___pre_ex_table
> +__stop___pre_ex_table
> +__start_schedulers_array
> +__end_schedulers_array
> +_splatform
> +_eplatform
> +_sdevice
> +_edevice
> +_asdevice
> +_aedevice
> +_steemediator
> +_eteemediator
> +__init_begin
> +_sinittext
> +_einittext
> +__setup_start
> +__setup_end
> +__initcall_start
> +__presmp_initcall_end
> +__initcall_end
> +__alt_instructions
> +__alt_instructions_end
> +__ctors_start
> +__ctors_end
> +__init_end_efi
> +__init_end
> +__bss_start
> +__per_cpu_start
> +__per_cpu_data_end
> +__bss_end
> +_end
> --
> 2.37.6

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

