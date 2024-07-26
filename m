Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D693CE41
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 08:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765251.1175836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXEdO-0006S5-9U; Fri, 26 Jul 2024 06:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765251.1175836; Fri, 26 Jul 2024 06:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXEdO-0006Qb-6k; Fri, 26 Jul 2024 06:40:58 +0000
Received: by outflank-mailman (input) for mailman id 765251;
 Fri, 26 Jul 2024 06:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v01E=O2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sXEdN-0006QT-Dg
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 06:40:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c57151-4b1a-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 08:40:56 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2CE024EE073C;
 Fri, 26 Jul 2024 08:40:55 +0200 (CEST)
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
X-Inumbo-ID: 02c57151-4b1a-11ef-bbff-fd08da9f4363
MIME-Version: 1.0
Date: Fri, 26 Jul 2024 08:40:55 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org, Jan Beulich
 <jbeulich@suse.com>, roberto.bagnara@bugseng.com, consulting@bugseng.com,
 simone.ballarin@bugseng.com
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
In-Reply-To: <alpine.DEB.2.22.394.2407251542230.4857@ubuntu-linux-20-04-desktop>
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
 <d1a08318bb28df72f95c737627c1a4e5@bugseng.com>
 <alpine.DEB.2.22.394.2407251542230.4857@ubuntu-linux-20-04-desktop>
Message-ID: <0d4bd08ca7e9054b04c7eda6c03c7621@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-26 00:43, Stefano Stabellini wrote:
> On Thu, 25 Jul 2024, Nicola Vetrini wrote:
>> On 2024-07-25 21:01, victorm.lira@amd.com wrote:
>> > From: Victor Lira <victorm.lira@amd.com>
>> >
>> > Requested-by: Jan Beulich <jbeulich@suse.com>
>> > Signed-off-by: Victor Lira <victorm.lira@amd.com>
>> > ---
>> > Notes:
>> > This is a utilty script for help with the MISRA process.
>> > This script matches all linker symbol names in linker script files for
>> > arm or x86.
>> > Not included are symbol names starting with "." or symbol names enclosed
>> > in quotes since the files dont't use any. The regular expression also does
>> > not match for "&=" and similar compound assignments.
>> > ---
>> > Cc: Jan Beulich <jbeulich@suse.com>
>> > Cc: Stefano Stabellini <sstabellini@kernel.org>
>> > Cc: roberto.bagnara@bugseng.com
>> > Cc: consulting@bugseng.com
>> > Cc: simone.ballarin@bugseng.com
>> > ---
>> > Changes v2:
>> > - address style comments
>> > - updated script to use .lds instead of .lds.S
>> > - remove sample output from patch
>> >
>> > Changes v3:
>> > - use #!/bin/sh
>> > - update error handling and message similar to ../build.sh
>> > ---
>> >  automation/eclair_analysis/linker-symbols.sh | 34 ++++++++++++++++++++
>> >  1 file changed, 34 insertions(+)
>> >  create mode 100755 automation/eclair_analysis/linker-symbols.sh
>> >
>> > diff --git a/automation/eclair_analysis/linker-symbols.sh
>> > b/automation/eclair_analysis/linker-symbols.sh
>> > new file mode 100755
>> > index 0000000000..61790fb281
>> > --- /dev/null
>> > +++ b/automation/eclair_analysis/linker-symbols.sh
>> > @@ -0,0 +1,34 @@
>> > +#!/bin/sh
>> > +
>> > +# Stop immediately if any executed command has exit status different from
>> > 0.
>> > +set -e
>> > +
>> > +# Extract linker symbol names (except those starting with ".") from
>> > assignments.
>> > +
>> > +script_name=$(basename "$0")
>> > +script_dir="$(
>> > +  cd "$(dirname "$0")"
>> > +  echo "${PWD}"
>> > +)"
>> > +src_dir="${script_dir}/../.."
>> > +
>> > +fatal() {
>> > +  echo "${script_name}: $*" >&2
>> > +  exit 1
>> > +}
>> > +
>> > +usage() {
>> > +  fatal "Usage: ${script_name} <arm|x86>"
>> > +}
>> > +
>> > +if [ $# -ne 1 ]; then
>> > +  usage
>> > +fi
>> > +
>> > +filepath="${src_dir}/xen/arch/${1}/xen.lds"
>> > +
>> > +if [ ! -f "$filepath" ]; then
>> > +  fatal "Could not find ${1} linker script. Must be run after arm/x86
>> > build."
>> > +fi
>> > +
>> 
>> A doubt I came across now: since this script must be run after the 
>> build (and
>> hence the analysis), but the configuration must be generated before 
>> the
>> analysis, the only way this could work in my opinion is this:
>> 
>> - a build without analysis is performed, just enough to build xen.lds 
>> (maybe
>> there is a specific Makefile target to do this)
>> - generate the configuration, then clean everything and then run the 
>> analysis
> 
> Yes, that is one option and it should work. The other option is to run
> this script against the xen.lds.S files instead (if it works.)
> 

However, as Jan pointed out in v1, this second option may yield 
incomplete results.
The way we can notice if there's a discrepancy is by running the 
analysis with the automatically generated deviation and tell whether the 
resulting reports for Rule 18.2 there are any about linker-defined 
symbols.

> 
>> > +sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;.*$/\1/p" "$filepath"

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

