Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773145F4A4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233425.405018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfyb-00052p-3Q; Fri, 26 Nov 2021 18:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233425.405018; Fri, 26 Nov 2021 18:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfyb-00050K-0S; Fri, 26 Nov 2021 18:29:37 +0000
Received: by outflank-mailman (input) for mailman id 233425;
 Fri, 26 Nov 2021 18:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqfyZ-00050E-Lr
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:29:35 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd757919-4ee6-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:29:34 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:33990)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqfyT-000vFm-9Y (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 18:29:29 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B605F1FBF1;
 Fri, 26 Nov 2021 18:29:29 +0000 (GMT)
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
X-Inumbo-ID: cd757919-4ee6-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <3956f47c-307c-1ebb-bada-9168f0a5ba9a@srcf.net>
Date: Fri, 26 Nov 2021 18:29:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64
 instructions
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163340.26714-1-andrew.cooper3@citrix.com>
 <YaEmv7C4JJtJYe7i@mail-itl>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <YaEmv7C4JJtJYe7i@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 18:26, Marek Marczykowski-Górecki wrote:
> On Fri, Nov 26, 2021 at 04:33:40PM +0000, Andrew Cooper wrote:
>> ... to prevent the optimiser creating unsafe code.  See the code comment for
>> full details.
>>
>> Also add a build time check for endbr64 embedded in imm32 operands, which
>> catches the obvious cases where the optimiser has done an unsafe thing.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/Makefile       |  4 ++++
>>  xen/include/asm-x86/endbr.h | 55 +++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 59 insertions(+)
>>  create mode 100644 xen/include/asm-x86/endbr.h
>>
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index 69b6cfaded25..64a5c0d20018 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -190,6 +190,10 @@ $(TARGET)-syms: prelink.o xen.lds
>>  	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
>>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>>  	    $(@D)/.$(@F).1.o -o $@
>> +ifeq ($(CONFIG_XEN_IBT),y)
>> +	$(OBJDUMP) -d $@ | grep 0xfa1e0ff3 >/dev/null && \
>> +		{ echo "Found embedded endbr64 instructions" >&2; false; } || :
>> +endif
> Some more robust check can be done this way (warning, PoC quality bash):
>
>     objcopy -j .text xen-syms xen-syms.text
>     offset=$(objdump -h xen-syms -j .text | tail -2|head -1|awk '{printf "%x\n", (strtonum("0x" $4) - strtonum("0x" $6))}')
>     objdump --adjust-vma=-0x$offset -d xen-syms.text|grep endbr | cut -f 1 -d ':' | tr -d ' ' > valid-addrs
>     grep -aob $'\xf3\x0f\x1e\xfa' xen-syms.text|cut -f 1 -d :|xargs printf '%x\n' > all-addrs
>     join -v 2 <(sort valid-addrs) <(sort all-addrs) | awk '{ printf "%x\n", 0x'$offset' + strtonum("0x" $1)}' | addr2line -e xen-syms
>
> Currently it finds just one match:
> xen/arch/x86/alternative.c:145

To be clear, this one match is on the xen-cet-ibt v1.1 branch, which
also includes the next task (runtime clobbering of unused ENDBR
instructions) which I'm currently cleaning up to post.

~Andrew

