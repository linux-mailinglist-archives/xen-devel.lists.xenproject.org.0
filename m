Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A47693C8D6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 21:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765123.1175715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX4JY-00036G-Uf; Thu, 25 Jul 2024 19:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765123.1175715; Thu, 25 Jul 2024 19:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX4JY-00033G-S6; Thu, 25 Jul 2024 19:39:48 +0000
Received: by outflank-mailman (input) for mailman id 765123;
 Thu, 25 Jul 2024 19:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l8vd=OZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sX4JX-00033A-GY
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 19:39:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5f33243-4abd-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 21:39:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B8CC94EE073C;
 Thu, 25 Jul 2024 21:39:45 +0200 (CEST)
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
X-Inumbo-ID: a5f33243-4abd-11ef-bbff-fd08da9f4363
MIME-Version: 1.0
Date: Thu, 25 Jul 2024 21:39:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: victorm.lira@amd.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
In-Reply-To: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
Message-ID: <d1a08318bb28df72f95c737627c1a4e5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-25 21:01, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Notes:
> This is a utilty script for help with the MISRA process.
> This script matches all linker symbol names in linker script files for
> arm or x86.
> Not included are symbol names starting with "." or symbol names 
> enclosed
> in quotes since the files dont't use any. The regular expression also 
> does
> not match for "&=" and similar compound assignments.
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: roberto.bagnara@bugseng.com
> Cc: consulting@bugseng.com
> Cc: simone.ballarin@bugseng.com
> ---
> Changes v2:
> - address style comments
> - updated script to use .lds instead of .lds.S
> - remove sample output from patch
> 
> Changes v3:
> - use #!/bin/sh
> - update error handling and message similar to ../build.sh
> ---
>  automation/eclair_analysis/linker-symbols.sh | 34 ++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100755 automation/eclair_analysis/linker-symbols.sh
> 
> diff --git a/automation/eclair_analysis/linker-symbols.sh 
> b/automation/eclair_analysis/linker-symbols.sh
> new file mode 100755
> index 0000000000..61790fb281
> --- /dev/null
> +++ b/automation/eclair_analysis/linker-symbols.sh
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +
> +# Stop immediately if any executed command has exit status different 
> from 0.
> +set -e
> +
> +# Extract linker symbol names (except those starting with ".") from 
> assignments.
> +
> +script_name=$(basename "$0")
> +script_dir="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +src_dir="${script_dir}/../.."
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name} <arm|x86>"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +fi
> +
> +filepath="${src_dir}/xen/arch/${1}/xen.lds"
> +
> +if [ ! -f "$filepath" ]; then
> +  fatal "Could not find ${1} linker script. Must be run after arm/x86 
> build."
> +fi
> +

A doubt I came across now: since this script must be run after the build 
(and hence the analysis), but the configuration must be generated before 
the analysis, the only way this could work in my opinion is this:

- a build without analysis is performed, just enough to build xen.lds 
(maybe there is a specific Makefile target to do this)
- generate the configuration, then clean everything and then run the 
analysis

> +sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;.*$/\1/p" 
> "$filepath"
> --
> 2.25.1

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

