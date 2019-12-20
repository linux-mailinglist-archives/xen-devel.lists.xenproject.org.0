Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F3127977
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 11:36:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiFbs-0007EC-B8; Fri, 20 Dec 2019 10:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiFbq-0007E7-Tu
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 10:34:14 +0000
X-Inumbo-ID: 3e87d302-2314-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e87d302-2314-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 10:34:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5D34AAC3;
 Fri, 20 Dec 2019 10:34:03 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <cf29db3bde903a5788322381ef6eac1a6ed9b2b9.1576630344.git.elnikety@amazon.com>
 <729be010-5721-3eca-8a95-63987b61d897@suse.com>
 <e456ffdd-6c93-8f8c-9385-f169fa984dfb@amazon.com>
 <980abeb1-4c86-2618-9ab2-094af86d47ab@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <35344302-b1e6-01a5-955c-f600b3e94d5a@suse.com>
Date: Fri, 20 Dec 2019 11:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <980abeb1-4c86-2618-9ab2-094af86d47ab@suse.com>
Content-Type: multipart/mixed; boundary="------------FFB2586521BB5932E00D3F3E"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/microcode: Support builtin CPU
 microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------FFB2586521BB5932E00D3F3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.12.19 11:12, Jan Beulich wrote:
> On 19.12.2019 23:11, Eslam Elnikety wrote:
>> On 18.12.19 13:42, Jan Beulich wrote:
>>> On 18.12.2019 02:32, Eslam Elnikety wrote:
>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +Xen can bundle microcode updates within its image. This support is conditional
>>>> +on the build configuration BUILTIN_UCODE being enabled. Builtin microcode is
>>>> +useful to ensure that, by default, a minimum microcode patch level will be
>>>> +applied to the underlying CPU.
>>>> +
>>>> +To use microcode updates available on the build system as builtin,
>>>> +use BUILTIN_UCODE_DIR to refer to the directory containing the firmware updates
>>>> +and specify the individual microcode patches via either BUILTIN_UCODE_AMD or
>>>> +BUILTIN_UCODE_INTEL for AMD microcode or INTEL microcode, respectively. For
>>>> +instance, the configuration below is suitable for a build system which has a
>>>> +``/lib/firmware/`` directory which, in turn, includes the individual microcode
>>>> +patches ``amd-ucode/microcode_amd_fam15h.bin``, ``intel-ucode/06-3a-09``, and
>>>> +``intel-ucode/06-2f-02``.
>>>> +
>>>> +  CONFIG_BUILTIN_UCODE=y
>>>> +  CONFIG_BUILTIN_UCODE_DIR="/lib/firmware/"
>>>> +  CONFIG_BUILTIN_UCODE_AMD="amd-ucode/microcode_amd_fam15h.bin"
>>>> +  CONFIG_BUILTIN_UCODE_INTEL="intel-ucode/06-3a-09 intel-ucode/06-2f-02"
>>>
>>> Rather than a blank as separator, the more conventional one on
>>> Unix and alike would be : I think. Of course ideally there wouldn't
>>> be any restriction at all on the characters usable here for file
>>> names.
>>>
>>
>> It would be great if there is a particular convention. The blank
>> separator is aligned with Linux way of doing builtin microcode.
> 
> Well, this is then another area where I would question whether we
> really want to follow the Linux approach, but I'm not bothered
> enough to make less non-conventional behavior here a requirement.
> 
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -218,6 +218,36 @@ config MEM_SHARING
>>>>    	bool "Xen memory sharing support" if EXPERT = "y"
>>>>    	depends on HVM
>>>>    
>>>> +config BUILTIN_UCODE
>>>> +	bool "Support for Builtin Microcode"
>>>> +	---help---
>>>> +	  Include the CPU microcode update in the Xen image itself. With this
>>>> +	  support, Xen can update the CPU microcode upon boot using the builtin
>>>> +	  microcode, with no need for an additional microcode boot modules.
>>>> +
>>>> +	  If unsure, say N.
>>>
>>> I continue to be unconvinced that this separate option is needed.
>>> Albeit compared to the v1 approach I will agree that handling
>>> would become more complicated without.
>>
>> Any particular preference between the v1 vs v2 approach?
> 
> I definitely like the vendor separation.
> 
>>>> @@ -701,7 +747,13 @@ static int __init microcode_init(void)
>>>>         */
>>>>        if ( ucode_blob.size )
>>>>        {
>>>> +#ifdef CONFIG_BUILTIN_UCODE
>>>> +        /* No need to destroy module mappings if builtin was used */
>>>> +        if ( !ucode_builtin )
>>>> +            bootstrap_map(NULL);
>>>> +#else
>>>>            bootstrap_map(NULL);
>>>> +#endif
>>>
>>> First of all - is there no ucode unrelated side effect of this
>>> invocation? I.e. can it safely be skipped?
>>
>> Maybe I am missing something. Are you asking if we can safely skip the
>> bootstrap_map(NULL)? (Quoting your response on PATCH v2 2/4 "And of
>> course we really want these mappings to be gone")
> 
> Yes - my point is that invoking the function here may in
> principle cover for other mappings. However - this is the
> invocation you've added in an earlier patch, isn't it? In
> which case omitting it should be fine. Nevertheless I don't
> see and harm in invoking the function, i.e. I'd rather keep
> the code here simple.
> 
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/microcode/Makefile
>>>> @@ -0,0 +1,46 @@
>>>> +# Copyright (C) 2019 Amazon.com, Inc. or its affiliates.
>>>> +# Author: Eslam Elnikety <elnikety@amazon.com>
>>>> +#
>>>> +# This program is free software; you can redistribute it and/or modify
>>>> +# it under the terms of the GNU General Public License as published by
>>>> +# the Free Software Foundation; either version 2 of the License, or
>>>> +# (at your option) any later version.
>>>> +#
>>>> +# This program is distributed in the hope that it will be useful,
>>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> +# GNU General Public License for more details.
>>>> +
>>>> +# Remove quotes and excess spaces from configuration strings
>>>> +UCODE_DIR=$(strip $(subst $\",,$(CONFIG_BUILTIN_UCODE_DIR)))
>>>> +UCODE_AMD=$(strip $(subst $\",,$(CONFIG_BUILTIN_UCODE_AMD)))
>>>> +UCODE_INTEL=$(strip $(subst $\",,$(CONFIG_BUILTIN_UCODE_INTEL)))
>>>> +
>>>> +# AMD and INTEL microcode blobs. Use 'wildcard' to filter for existing blobs.
>>>> +amd-blobs := $(wildcard $(addprefix $(UCODE_DIR),$(UCODE_AMD)))
>>>> +intel-blobs := $(wildcard $(addprefix $(UCODE_DIR),$(UCODE_INTEL)))
>>>> +
>>>> +ifneq ($(amd-blobs),)
>>>> +obj-y += ucode_amd.o
>>>> +endif
>>>> +
>>>> +ifneq ($(intel-blobs),)
>>>> +obj-y += ucode_intel.o
>>>> +endif
>>>> +
>>>> +ifeq ($(amd-blobs)$(intel-blobs),)
>>>> +obj-y += ucode_dummy.o
>>>> +endif
>>>> +
>>>> +ucode_amd.o: Makefile $(amd-blobs)
>>>> +	cat $(amd-blobs) > $@.bin
>>>> +	$(OBJCOPY) -I binary -O elf64-x86-64 -B i386:x86-64 --rename-section .data=.builtin_amd_ucode,alloc,load,readonly,data,contents $@.bin $@
>>>> +	rm -f $@.bin
>>>> +
>>>> +ucode_intel.o: Makefile $(intel-blobs)
>>>> +	cat $(intel-blobs) > $@.bin
>>>> +	$(OBJCOPY) -I binary -O elf64-x86-64 -B i386:x86-64 --rename-section .data=.builtin_intel_ucode,alloc,load,readonly,data,contents $@.bin $@
>>>> +	rm -f $@.bin
>>>
>>> This can be had with a pattern rule (with the vendor being the stem)
>>> and hence without duplication, I think.
>>>
>>> Also - is simply concatenating the blobs reliable enough? There's no
>>> build time diagnostic that the result would actually be understood
>>> at runtime.
>>>
>>
>> Concatenation is reliable (as long as the individual microcode blobs are
>> not malformed, and in that case the builtin is not making matters worse
>> compared to presenting the malformed update via <integer> | scan).
> 
> A malformed update found the other way is a bug in the tools
> constructing the respective images. A malformed built-in
> update is a bug in the Xen build system. The put the question
> differently: Is it specified somewhere that the blobs all have
> to have certain properties, which the straight concatenation
> relies upon?
> 
>>>> +ucode_dummy.o: Makefile
>>>> +	$(CC) $(CFLAGS) -c -x c /dev/null -o $@;
>>>
>>> Since the commit message doesn't explain why this is needed, I
>>> have to ask (I guess we somewhere have a dependency on $(obj-y)
>>> not being empty).
>>
>> Your guess is correct. All sub-directories of xen/arch/x86 are expected
>> to produce built_in.o. If there are not amd nor intel microcode blobs,
>> there will be no build dependencies and the build fails preparing the
>> built_in.o
> 
> That's rather poor, but it's of course not your task to get this
> fixed (it shouldn't be very difficult to create an empty
> built_in.o for an empty $(obj-y)).
> 
>>> _If_ it is needed, I don't see why you need
>>> ifeq() around its use. In fact you could have
>>>
>>> obj-y := ucode-dummy.o
>>>
>>> right at the top of the file.
>>>
>>> Furthermore I don't really understand why you need this in the
>>> first place. While cat won't do what you want with an empty
>>> argument list, can't you simply prepend / append /dev/null?
>>>
>>
>> To make sure we are on the same page. You are suggesting using
>> "/dev/null" in case there are no amd/intel ucode to generate the
>> ucode_amd/intel.o? If so, objcopy does not allow using /dev/null as
>> input (complains about empty binary).
> 
> That's again rather poor, this time of the utility - it should be
> easy enough to produce an object with an empty .data (or whatever
> it is) section. As above - I'm fine with you keeping the logic
> then as is, provided you say in the description why it can't be
> simplified.

What about using the attached patch for including the binary files?

I wanted to post that for my hypervisor-fs series, but I think it would
fit here quite nice.


Juergen

--------------FFB2586521BB5932E00D3F3E
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-add-a-generic-way-to-include-binary-files-as-var.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-add-a-generic-way-to-include-binary-files-as-var.pa";
 filename*1="tch"

From 1181c103c4d0ee77d518ac9b168ef91adcac4405 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Date: Thu, 19 Dec 2019 10:00:56 +0100
Subject: [PATCH] xen: add a generic way to include binary files as variables

Add a new script xen/tools/binfile for including a binary file at build
time being usable via a pointer and a size variable in the hypervisor.

Make use of that generic tool in xsm.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                   |  1 +
 xen/tools/binfile            | 29 +++++++++++++++++++++++++++++
 xen/xsm/flask/Makefile       |  5 ++++-
 xen/xsm/flask/flask-policy.S | 16 ----------------
 4 files changed, 34 insertions(+), 17 deletions(-)
 create mode 100755 xen/tools/binfile
 delete mode 100644 xen/xsm/flask/flask-policy.S

diff --git a/.gitignore b/.gitignore
index 3ada0c4f0b..6a34db2507 100644
--- a/.gitignore
+++ b/.gitignore
@@ -315,6 +315,7 @@ xen/test/livepatch/xen_replace_world.livepatch
 xen/tools/kconfig/.tmp_gtkcheck
 xen/tools/kconfig/.tmp_qtcheck
 xen/tools/symbols
+xen/xsm/flask/flask-policy.S
 xen/xsm/flask/include/av_perm_to_string.h
 xen/xsm/flask/include/av_permissions.h
 xen/xsm/flask/include/class_to_string.h
diff --git a/xen/tools/binfile b/xen/tools/binfile
new file mode 100755
index 0000000000..122111ff6d
--- /dev/null
+++ b/xen/tools/binfile
@@ -0,0 +1,29 @@
+#!/bin/sh
+# usage: binfile [-i] <target-src.S> <binary-file> <varname>
+# -i     add to .init.rodata (default: .rodata) section
+
+[ "$1" = "-i" ] && {
+    shift
+    section=".init"
+}
+
+target=$1
+binsource=$2
+varname=$3
+
+cat <<EOF >$target
+#include <asm/asm_defns.h>
+
+        .section $section.rodata, "a", %progbits
+
+        .global $varname
+$varname:
+        .incbin "$binsource"
+.Lend:
+
+        .type $varname, %object
+        .size $varname, . - $varname
+
+        .global ${varname}_size
+        ASM_INT(${varname}_size, .Lend - $varname)
+EOF
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 7c3f381287..a807521235 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -30,6 +30,9 @@ $(AV_H_FILES): $(AV_H_DEPEND)
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 flask-policy.o: policy.bin
 
+flask-policy.S: $(XEN_ROOT)/xen/tools/binfile
+	$(XEN_ROOT)/xen/tools/binfile -i $@ policy.bin xsm_flask_init_policy
+
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
@@ -39,4 +42,4 @@ policy.bin: FORCE
 
 .PHONY: clean
 clean::
-	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC)
+	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC) flask-policy.S
diff --git a/xen/xsm/flask/flask-policy.S b/xen/xsm/flask/flask-policy.S
deleted file mode 100644
index d38aa39964..0000000000
--- a/xen/xsm/flask/flask-policy.S
+++ /dev/null
@@ -1,16 +0,0 @@
-#include <asm/asm_defns.h>
-
-        .section .init.rodata, "a", %progbits
-
-/* const unsigned char xsm_flask_init_policy[] __initconst */
-        .global xsm_flask_init_policy
-xsm_flask_init_policy:
-        .incbin "policy.bin"
-.Lend:
-
-        .type xsm_flask_init_policy, %object
-        .size xsm_flask_init_policy, . - xsm_flask_init_policy
-
-/* const unsigned int __initconst xsm_flask_init_policy_size */
-        .global xsm_flask_init_policy_size
-        ASM_INT(xsm_flask_init_policy_size, .Lend - xsm_flask_init_policy)
-- 
2.16.4


--------------FFB2586521BB5932E00D3F3E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------FFB2586521BB5932E00D3F3E--

