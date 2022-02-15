Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE74B7433
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 18:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273491.468697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK1zx-0002wy-TX; Tue, 15 Feb 2022 17:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273491.468697; Tue, 15 Feb 2022 17:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK1zx-0002vB-QM; Tue, 15 Feb 2022 17:52:21 +0000
Received: by outflank-mailman (input) for mailman id 273491;
 Tue, 15 Feb 2022 17:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FBm=S6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nK1zw-0002v5-7c
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 17:52:20 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f8aa0d-8e88-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 18:52:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:56038)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nK1zq-000AtD-L3 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 15 Feb 2022 17:52:14 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1E02D1FA96;
 Tue, 15 Feb 2022 17:52:14 +0000 (GMT)
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
X-Inumbo-ID: 03f8aa0d-8e88-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <8c6d9714-7e45-1603-a5ad-d49fc060304e@srcf.net>
Date: Tue, 15 Feb 2022 17:52:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-8-andrew.cooper3@citrix.com>
 <95c29039-302c-256b-d381-2b5b8b9c1a4a@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 07/70] x86: Build check for embedded endbr64
 instructions
In-Reply-To: <95c29039-302c-256b-d381-2b5b8b9c1a4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/02/2022 15:12, Jan Beulich wrote:
> On 14.02.2022 13:50, Andrew Cooper wrote:
>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Embedded endbr64 instructions mark legal indirect branches as far as the CPU
>> is concerned, which aren't legal as far as the logic is concerned.
> I think it would help if it was clarified what "embedded" actually means
> here.

Oh yeah, that's lost a bit of context now I've split it out of the patch
introducing endbr.h

>
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -155,6 +155,9 @@ $(TARGET)-syms: prelink.o xen.lds
>>  	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
>>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>>  	    $(@D)/.$(@F).1.o -o $@
>> +ifeq ($(CONFIG_XEN_IBT),y)
>> +	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
>> +endif
>>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>>  		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>  		>$(@D)/$(@F).map
> The same wants doing on xen.efi, I guess?

Probably.

>
>> --- /dev/null
>> +++ b/xen/tools/check-endbr.sh
>> @@ -0,0 +1,76 @@
>> +#!/bin/sh
>> +
>> +#
>> +# Usage ./$0 xen-syms
>> +#
>> +
>> +set -e
>> +
>> +OBJCOPY="${OBJCOPY:-objcopy} -j .text $1"
>> +OBJDUMP="${OBJDUMP:-objdump} -j .text $1"
>> +
>> +D=$(mktemp -d)
>> +trap "rm -rf $D" EXIT
>> +
>> +TEXT_BIN=$D/xen-syms.text
>> +VALID=$D/valid-addrs
>> +ALL=$D/all-addrs
>> +BAD=$D/bad-addrs
>> +
>> +#
>> +# First, look for all the valid endbr64 instructions.
>> +# A worst-case disassembly, viewed through cat -A, may look like:
>> +#
>> +# ffff82d040337bd4 <endbr64>:$
>> +# ffff82d040337bd4:^If3 0f 1e fa          ^Iendbr64 $
>> +# ffff82d040337bd8:^Ieb fe                ^Ijmp    ffff82d040337bd8 <endbr64+0x4>$
>> +# ffff82d040337bda:^Ib8 f3 0f 1e fa       ^Imov    $0xfa1e0ff3,%eax$
>> +#
>> +# Want to grab the address of endbr64 instructions only, ignoring function
>> +# names/jump labels/etc, so look for 'endbr64' preceeded by a tab and with any
>> +# number of trailing spaces before the end of the line.
>> +#
>> +${OBJDUMP} -d | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
> Since you look at only .text the risk of the disassembler coming
> out of sync with the actual instruction stream is lower than when
> 32- and 16-bit code was also part of what is disassembled, but it's
> not zero.

I'm not sure that we have any interesting non-64bit code at all in .text.

_start is technically 32bit but is mode-invariant as far as decoding goes.

The kexec trampoline is here too, but when I dust off my cleanup patch,
there will no longer be data or mode-dependent things to disassemble.

Everything else I can think of is in .init.text.

> Any zero-padding inserted anywhere by the linker can
> result in an immediately following ENDBR to be missed (because
> sequences of zeros resemble 2-byte insns).

I'm not sure this is a problem.  This pass is looking for everything
that objdump thinks is a legal endbr64 instruction, and it splits at labels.

Only the hand-written stubs can legitimately have an endbr64 without a
symbol pointing at it.

We also don't have any 0 padding.  It's specified as 0x90 in the linker
file, although I've been debating switching this to 0xcc for a while now
already.

>  While this risk may be
> acceptable, I think it wants mentioning at least in the description,
> maybe even at the top of the script (where one would likely look
> first after it spitting out an error).
>
> Do you perhaps want to also pass -w to objdump, to eliminate the
> risk of getting confused by split lines?

I think that's probably a good move irrespective.  This particular pipe
is the longest single task in the script which is why I backgrounded it
while the second scan occurs.  -w means fewer lines so hopefully a minor
speedup.

>> +#
>> +# Second, look for any endbr64 byte sequence
>> +# This has a couple of complications:
>> +#
>> +# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, causing
>> +#    the grep offset to be from the start of .text.
>> +#
>> +# 2) AWK can't add 64bit integers, because internally all numbers are doubles.
>> +#    When the upper bits are set, the exponents worth of precision is lost in
>> +#    the lower bits, rounding integers to the nearest 4k.
>> +#
>> +#    Instead, use the fact that Xen's .text is within a 1G aligned region, and
>> +#    split the VMA in half so AWK's numeric addition is only working on 32 bit
>> +#    numbers, which don't lose precision.
>> +#
>> +eval $(${OBJDUMP} -h | awk '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
>> +
>> +${OBJCOPY} -O binary $TEXT_BIN
>> +grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN |
>> +    awk -F':' '{printf "%s%x\n", "'$vma_hi'", strtonum(0x'$vma_lo') + $1}' > $ALL
> None of the three options passed to grep look to be standardized.
> Is this going to cause problems on non-Linux systems? Should this
> checking perhaps be put behind a separate Kconfig option?

CI says that FreeBSD is entirely happy, while Alpine Linux isn't.  This
is because Alpine has busybox's grep unless you install the GNU grep
package, and I'm doing a fix to our container.

My plan to fix this is to just declare a "grep capable of binary
searching" a conditional build requirement for Xen.  I don't think this
is onerous, and there no other plausible alternatives here.

The other option is to detect the absence of support an skip the check. 
It is after all a defence in depth scheme, and anything liable to cause
a problem would be caught in CI anyway.

>> +# Wait for $VALID to become complete
>> +wait
>> +
>> +# Sanity check $VALID and $ALL, in case the string parsing bitrots
>> +val_sz=$(stat -c '%s' $VALID)
>> +all_sz=$(stat -c '%s' $ALL)
>> +[ "$val_sz" -eq 0 ]         && { echo "Error: Empty valid-addrs" >&2; exit 1; }
>> +[ "$all_sz" -eq 0 ]         && { echo "Error: Empty all-addrs" >&2; exit 1; }
>> +[ "$all_sz" -lt "$val_sz" ] && { echo "Error: More valid-addrs than all-addrs" >&2; exit 1; }
>> +
>> +# $BAD = $ALL - $VALID
>> +join -v 2 $VALID $ALL > $BAD
>> +nr_bad=$(wc -l < $BAD)
>> +
>> +# Success
>> +[ "$nr_bad" -eq 0 ] && exit 0
>> +
>> +# Failure
>> +echo "Fail: Found ${nr_bad} embedded endbr64 instructions" >&2
>> +addr2line -afip -e $1 < $BAD >&2
> There probably also wants to be an ADDR2LINE variable then. If
> one overrides objdump and objcopy, one would likely want/need to
> override this one as well.

Ah yes.  Will fix.

~Andrew



