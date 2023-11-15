Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40587EC110
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633559.988472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3DfZ-0007Af-FZ; Wed, 15 Nov 2023 11:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633559.988472; Wed, 15 Nov 2023 11:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3DfZ-00078Z-Bm; Wed, 15 Nov 2023 11:02:53 +0000
Received: by outflank-mailman (input) for mailman id 633559;
 Wed, 15 Nov 2023 11:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWFF=G4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3DfY-00078T-Ta
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:02:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8433555d-83a6-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 12:02:50 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9CF2D4EE073D;
 Wed, 15 Nov 2023 12:02:49 +0100 (CET)
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
X-Inumbo-ID: 8433555d-83a6-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 12:02:49 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
In-Reply-To: <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
 <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
 <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org>
Message-ID: <1689d4b47d708098c43601a58e867f1c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-14 23:12, Julien Grall wrote:
> Hi,
> 
> On 14/11/2023 15:36, Nicola Vetrini wrote:
>> To be able to check for the existence of the necessary subsections in
>> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a 
>> source
>> file that is built.
>> 
>> This file is generated from 'C-runtime-failures.rst' in docs/misra
>> and the configuration is updated accordingly.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes from RFC:
>> - Dropped unused/useless code
>> - Revised the sed command
>> - Revised the clean target
>> 
>> Changes in v2:
>> - Added explanative comment to the makefile
>> - printf instead of echo
>> 
>> Changes in v3:
>> - Terminate the generated file with a newline
>> - Build it with -std=c99, so that the documentation
>>    for D1.1 applies.
>> Changes in v5:
>> - Transform and build the file directly in the eclair-specific 
>> directory
>> ---
>>   automation/eclair_analysis/build.sh   | 21 +++++++++++++++++++--
>>   automation/eclair_analysis/prepare.sh |  7 ++++---
>>   2 files changed, 23 insertions(+), 5 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/build.sh 
>> b/automation/eclair_analysis/build.sh
>> index ec087dd822fa..f24292ed0643 100755
>> --- a/automation/eclair_analysis/build.sh
>> +++ b/automation/eclair_analysis/build.sh
>> @@ -33,12 +33,29 @@ else
>>     PROCESSORS=6
>>   fi
>>   +runtime_failures_docs() {
>> +  doc="C-runtime-failures.rst"
>> +  builddir="automation/eclair_analysis"
>> +
>> +  cp "docs/misra/${doc}" "${builddir}"
> 
> Is it necessary to copy the .rst? IOW, would it be sufficient to use...
> 
>> +  cd "${builddir}"
>> +  printf "/*\n\n" >"${doc}.tmp"
>> +  sed -e 's|\*/|*//*|g' "${doc}" >>"${doc}.tmp"
> 
> ... docs/misc/${doc} here?
> 

I didn't want to leave a stray file under docs/misra, but it's not 
essential.

>> +  printf "\n\n*/\n" >>"${doc}.tmp"
>> +  mv "${doc}.tmp" "${doc}.c"
> 
> NIT: I am not sure why you need to first create .tmp and then create.c.
> 

Wasn't this a pattern to defend against interruptions of the build, just 
as I did in v3?

+$(TARGETS:.o=.c): %.c: %.rst
+    printf "/*\n\n" > $@.tmp
+    sed -e 's|\*/|*//*|g' $< >> $@.tmp
+    printf "\n\n*/\n" >> $@.tmp
+    mv $@.tmp $@

>> +
>> +  # Cannot redirect to /dev/null because it would be excluded from 
>> the analysis
>> +  "${CROSS_COMPILE}gcc-12" -std=c99 -c "${doc}.c" -o "${doc}.o"
> 
> NIT: It would be helpful to specify why -std=c99 is used. Above, you 
> suggest this is to enable D1.1.
> 

Yeah, the comment in the changelog should be pasted here

> NIT: Can we define CC and use here and ...
> 
>> +  cd -
>> +}
>> +
>>   (
>> -  cd xen
>> +  runtime_failures_docs
>>       make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>>          "CROSS_COMPILE=${CROSS_COMPILE}"         \
>>          "CC=${CROSS_COMPILE}gcc-12"              \
> 
> ...? This would make easier to re-use the code.
> 

I don't expect this build script to be changed much to be honest, but if 
you think
this is beneficial then it's ok.

>>          "CXX=${CROSS_COMPILE}g++-12"             \
>> -       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
>> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
>> +       -C xen
>>   )
>> diff --git a/automation/eclair_analysis/prepare.sh 
>> b/automation/eclair_analysis/prepare.sh
>> index 0cac5eba00ae..fe9d16e48ecc 100755
>> --- a/automation/eclair_analysis/prepare.sh
>> +++ b/automation/eclair_analysis/prepare.sh
>> @@ -35,11 +35,12 @@ else
>>   fi
>>     (
>> -    cd xen
>> -    cp "${CONFIG_FILE}" .config
>> +    ./configure
>> +    cp "${CONFIG_FILE}" xen/.config
>>       make clean
>>       find . -type f -name "*.safparse" -print -delete
>> -    make -f ${script_dir}/Makefile.prepare prepare
>> +    cd xen
>> +    make -f "${script_dir}/Makefile.prepare" prepare
>>       # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
>>       scripts/xen-analysis.py --run-eclair --no-build --no-clean
>>   )
> 
> Cheers,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

