Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0D5031E8
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 01:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305971.521126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfVaM-0007oh-3k; Fri, 15 Apr 2022 23:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305971.521126; Fri, 15 Apr 2022 23:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfVaM-0007mz-0R; Fri, 15 Apr 2022 23:42:42 +0000
Received: by outflank-mailman (input) for mailman id 305971;
 Fri, 15 Apr 2022 23:42:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfVaK-0007mt-Ho
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 23:42:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbdc95b0-bd15-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 01:42:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CFD3B82FAE;
 Fri, 15 Apr 2022 23:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EFAC385A4;
 Fri, 15 Apr 2022 23:42:35 +0000 (UTC)
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
X-Inumbo-ID: bbdc95b0-bd15-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650066156;
	bh=Ov+uoU9Mc5w1Tn66KpXzUke9yX7nZixhdesKNbF7kCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LQ9x8WKH7aujfYxbJUYU+3Rq3dJNPtnYYhCddTsFUjmZkvbKpDWVsHlwI9ti1tgw5
	 0+wRL/rYkSPZI7a3bcGPysbWRaLygsZzEDG22EGx94vkPLnoem1umMMzguBxomQ0OM
	 C2uPAhmWrSYqCl1IOpbn0dwO1iKt0eW/TEqug14YsBFl8sI+Q4zkPIm1h462kkwUiY
	 dAo+xLul5RDculs2BENK2fGkdGWnWfq2dWQPyQxoAhFPUk2UT0Z6mR5mmB8Wl76vge
	 aBth8ukmlFWboZ89rRZ2jnlUx3LUhvxSaW9xSM3cXlTW1s/L5cGd1Xc1ba2tVCRH6Z
	 6sQUaclcd8qvQ==
Date: Fri, 15 Apr 2022 16:42:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v2] xen/build: Add cppcheck and cppcheck-html make
 rules
In-Reply-To: <74b35aab0706fc977a3c5c3dfa20b52fda6f4698.1649855186.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204151637350.915916@ubuntu-linux-20-04-desktop>
References: <74b35aab0706fc977a3c5c3dfa20b52fda6f4698.1649855186.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Apr 2022, Bertrand Marquis wrote:
> cppcheck can be used to check Xen code quality.
> 
> To create a report do "make cppcheck" on a built tree adding any options
> you added during the process you used to build xen (like CROSS_COMPILE
> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
> 
> To create a html report do "make cppcheck-html" in the same way and a
> full report to be seen in a browser will be generated in
> cppcheck-htmlreport/index.html.
> 
> For better results it is recommended to build your own cppcheck from the
> latest sources that you can find at [1].
> Development and result analysis has been done with cppcheck 2.7.
> 
> The Makefile rule is searching for all C files which have been compiled
> (ie which have a generated .o file) and is running cppcheck on all of
> them using the current configuration of xen so only the code actually
> compiled is checked.
> 
> A new tool is introduced to merge all cppcheck reports into one global
> report including all findings and removing duplicates.
> 
> Some extra variables can be used to customize the report:
> - CPPCHECK can be used to give the full path to the cppcheck binary to
> use (default is to use the one from the standard path).
> - CPPCHECK_HTMLREPORT can be used to give the full path to
> cppcheck-htmlreport (default is to use the one from the standard path).
> 
> This has been tested on several arm configurations (x86 should work but
> has not been tested).
> 
> [1] https://cppcheck.sourceforge.io/
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

This is better, thanks! I don't have a lot of comments as it looks
pretty OK to me already. Only one comment on the python script.


> ---
> Changes in v2:
> - catch parsing errors during merge and tell the user to update cppcheck
> - fix alignments in Makefile
> - use srctree and objtree instead of BASEDIR
> - remove SCTLR invalid change
> - add a check of cppcheck version and mandate version 2.7 or greater
> - rework the merge script to make it faster and display progress
> ---
>  .gitignore                           |  3 +
>  xen/Makefile                         | 84 +++++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/processor.h |  2 +
>  xen/include/xen/config.h             |  4 ++
>  xen/include/xen/kconfig.h            |  5 ++
>  xen/tools/merge_cppcheck_reports.py  | 83 +++++++++++++++++++++++++++
>  6 files changed, 179 insertions(+), 2 deletions(-)
>  create mode 100755 xen/tools/merge_cppcheck_reports.py
> 
> diff --git a/.gitignore b/.gitignore
> index d425be4bd9..0d2d60b8f1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -7,6 +7,7 @@
>  *.o
>  *.d
>  *.d2
> +*.c.cppcheck
>  *.opic
>  *.a
>  *.so
> @@ -296,6 +297,7 @@ xen/.banner
>  xen/.config
>  xen/.config.old
>  xen/.xen.elf32
> +xen/xen-cppcheck.xml
>  xen/System.map
>  xen/arch/x86/boot/mkelf32
>  xen/arch/x86/boot/cmdline.S
> @@ -316,6 +318,7 @@ xen/arch/*/efi/runtime.c
>  xen/arch/*/include/asm/asm-offsets.h
>  xen/common/config_data.S
>  xen/common/config.gz
> +xen/cppcheck-htmlreport
>  xen/include/headers*.chk
>  xen/include/compat/*
>  xen/include/config/
> diff --git a/xen/Makefile b/xen/Makefile
> index ebc7854c08..734f9f2b4f 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -335,7 +335,7 @@ export CFLAGS_UBSAN
>  
>  endif # need-config
>  
> -main-targets := build install uninstall clean distclean MAP
> +main-targets := build install uninstall clean distclean MAP cppcheck cppcheck-html
>  .PHONY: $(main-targets)
>  ifneq ($(XEN_TARGET_ARCH),x86_32)
>  $(main-targets): %: _% ;
> @@ -423,15 +423,17 @@ _clean:
>  	$(Q)$(MAKE) $(clean)=tools/kconfig
>  	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
>  		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
> -		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
> +		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.c.cppcheck' \
>  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
>  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map
>  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
>  	rm -f .banner .allconfig.tmp include/xen/compile.h
> +	rm -f xen-cppcheck.xml
>  
>  .PHONY: _distclean
>  _distclean: clean
>  	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config
> +	rm -rf $(CPPCHECK_HTMLREPORT_OUTDIR)
>  
>  $(TARGET).gz: $(TARGET)
>  	gzip -n -f -9 < $< > $@.new
> @@ -505,6 +507,84 @@ cloc:
>  	    done; \
>  	done | cloc --list-file=-
>  
> +# What cppcheck command to use.
> +# To get proper results, it is recommended to build cppcheck manually from the
> +# latest source and use CPPCHECK to give the full path to the built version.
> +CPPCHECK ?= cppcheck
> +
> +# What cppcheck-htmlreport to use.
> +# If you give the full path to a self compiled cppcheck, this should be set
> +# to the full path to cppcheck-html in the htmlreport directory of cppcheck.
> +# On recent distribution, this is available in the standard path.
> +CPPCHECK_HTMLREPORT ?= cppcheck-htmlreport
> +
> +# By default we generate the report in cppcheck-htmlreport directory in the
> +# build directory. This can be changed by giving a directory in this variable.
> +CPPCHECK_HTMLREPORT_OUTDIR ?= cppcheck-htmlreport
> +
> +# Compile flags to pass to cppcheck:
> +# - include directories and defines Xen Makefile is passing (from CFLAGS)
> +# - include config.h as this is passed directly to the compiler.
> +# - define CPPCHECK as we use to disable or enable some specific part of the
> +#   code to solve some cppcheck issues.
> +# - explicitely enable some cppcheck checks as we do not want to use "all"
> +#   which includes unusedFunction which gives wrong positives as we check file
> +#   per file.
> +#
> +# Compiler defines are in compiler-def.h which is included in config.h
> +#
> +CPPCHECKFLAGS := -DCPPCHECK --max-ctu-depth=10 \
> +                 --enable=style,information,missingInclude \
> +                 --include=$(srctree)/include/xen/config.h \
> +                 -I $(srctree)/xsm/flask/include \
> +                 -I $(srctree)/include/xen/libfdt \
> +                 $(filter -D% -I%,$(CFLAGS))
> +
> +# We need to find all C files (as we are not checking assembly files) so
> +# we find all generated .o files which have a .c corresponding file.
> +CPPCHECKFILES := $(wildcard $(patsubst $(objtree)/%.o,$(srctree)/%.c, \
> +                 $(filter-out $(objtree)/tools/%, \
> +                 $(shell find $(objtree) -name "*.o"))))
> +
> +quiet_cmd_cppcheck_xml = CPPCHECK $(patsubst $(srctree)/%,%,$<)
> +cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
> +                   --output-file=$@ $<
> +
> +quiet_cmd_merge_cppcheck_reports = CPPCHECK-MERGE $@
> +cmd_merge_cppcheck_reports = $(srctree)/tools/merge_cppcheck_reports.py $^ $@
> +
> +quiet_cmd_cppcheck_html = CPPCHECK-HTML $<
> +cmd_cppcheck_html = $(CPPCHECK_HTMLREPORT) --file=$< --source-dir=$(srctree) \
> +                    --report-dir=$(CPPCHECK_HTMLREPORT_OUTDIR) --title=Xen
> +
> +PHONY += _cppcheck _cppcheck-html cppcheck-version
> +
> +_cppcheck-html: xen-cppcheck.xml
> +	$(call if_changed,cppcheck_html)
> +
> +_cppcheck: xen-cppcheck.xml
> +
> +xen-cppcheck.xml: $(patsubst $(srctree)/%.c,$(objtree)/%.c.cppcheck,$(CPPCHECKFILES))
> +ifeq ($(CPPCHECKFILES),)
> +	$(error Please build Xen before running cppcheck)
> +endif
> +	$(call if_changed,merge_cppcheck_reports)
> +
> +$(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)/include/generated/autoconf.h $(objtree)/include/generated/compiler-def.h | cppcheck-version
> +	$(call if_changed,cppcheck_xml)
> +
> +cppcheck-version:
> +ifeq ($(shell which $(CPPCHECK)),)
> +	$(error Cannot find cppcheck executable: $(CPPCHECK))
> +endif
> +ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
> +	$(error Please upgrade your cppcheck to version 2.7 or greater)
> +endif
> +
> +# Put this in generated headers this way it is cleaned by include/Makefile
> +$(objtree)/include/generated/compiler-def.h:
> +	$(Q)$(CC) -dM -E -o $@ - < /dev/null
> +
>  endif #config-build
>  
>  PHONY += FORCE
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 852b5f3c24..ef37cfa16f 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -219,9 +219,11 @@
>                           SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>                           SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>  
> +#ifndef CPPCHECK
>  #if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffUL
>  #error "Inconsistent SCTLR_EL2 set/clear bits"
>  #endif
> +#endif
>  
>  #endif
>  
> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
> index 85c6f59be9..d888b2314d 100644
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -7,6 +7,10 @@
>  #ifndef __XEN_CONFIG_H__
>  #define __XEN_CONFIG_H__
>  
> +#ifdef CPPCHECK
> +#include <generated/compiler-def.h>
> +#endif
> +
>  #include <xen/kconfig.h>
>  
>  #ifndef __ASSEMBLY__
> diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
> index 4d58c5bb3c..a717b0819c 100644
> --- a/xen/include/xen/kconfig.h
> +++ b/xen/include/xen/kconfig.h
> @@ -8,6 +8,10 @@
>   * these only work with boolean option.
>   */
>  
> +/* cppcheck is failing to parse the macro so use a dummy one */
> +#ifdef CPPCHECK
> +#define IS_ENABLED(option) option
> +#else
>  /*
>   * Getting something that works in C and CPP for an arg that may or may
>   * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
> @@ -27,5 +31,6 @@
>   * otherwise.
>   */
>  #define IS_ENABLED(option) config_enabled(option)
> +#endif
>  
>  #endif /* __XEN_KCONFIG_H */
> diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cppcheck_reports.py
> new file mode 100755
> index 0000000000..eabf558768
> --- /dev/null
> +++ b/xen/tools/merge_cppcheck_reports.py
> @@ -0,0 +1,83 @@
> +#!/usr/bin/env python
> +
> +"""
> +This script acts as a tool to merge XML files created by cppcheck.
> +Usage:
> +    merge_cppcheck_reports.py [FILES] [OUTPUT]
> +
> +    FILES  - list of XML files with extension .cppcheck
> +    OUTPUT - file to store results (with .xml extension).
> +             If not specified, the script will print results to stdout.
> +"""
> +
> +import sys
> +from xml.etree import ElementTree
> +
> +def elements_equal(el1, el2):
> +    if type(el1) != type(el2): return False
> +
> +    el1_location = str(el1.find('location').attrib)
> +    el2_location = str(el2.find('location').attrib)

I managed to repro another stacktrace:

  CPPCHECK-MERGE xen-cppcheck.xml
 123 / 191Traceback (most recent call last):
  File "./tools/merge_cppcheck_reports.py", line 83, in <module>
    run()
  File "./tools/merge_cppcheck_reports.py", line 72, in run
    result = merge(files)
  File "./tools/merge_cppcheck_reports.py", line 53, in merge
    if not contain_element(xml_error_elem, curr_elem_list):
  File "./tools/merge_cppcheck_reports.py", line 28, in contain_element
    if elements_equal(new, elem):
  File "./tools/merge_cppcheck_reports.py", line 19, in elements_equal
    el1_location = str(el1.find('location').attrib)
AttributeError: 'NoneType' object has no attribute 'attrib'
make: *** [Makefile:685: xen-cppcheck.xml] Error 1

It must be a natural talent :-)

Should we have a try/except also here as well?

FYI I added:

    if el1.find('location') is None: return False
    if el2.find('location') is None: return False

And that solved the issue for me


> +    if el1_location != el2_location: return False
> +
> +    return True
> +
> +def contain_element(new, lst):
> +    for elem in lst:
> +        if elements_equal(new, elem):
> +            return True
> +    return False
> +
> +def merge(files):
> +    try:
> +        result_xml_root = ElementTree.parse(files[0]).getroot()
> +    except ParseError:
> +        print("Xml parsing error in %s\n" % (files[0]))
> +        print("Please upgrade your cppcheck to version 2.7 or greater")
> +        sys.exit(1)
> +    insert_point = result_xml_root.findall("errors")[0]
> +    curr = 1
> +    total = len(files)
> +    numelem = len(insert_point)
> +    for xml_file in files[1:]:
> +        try:
> +            xml_root = ElementTree.parse(xml_file).getroot()
> +        except ParseError:
> +            print("Xml parsing error in %s\n" % (xml_file))
> +            print("Please upgrade your cppcheck to version 2.7 or greater")
> +            sys.exit(1)
> +        curr_elem_list = list(insert_point)
> +        new_elem_list = list(xml_root.findall("errors")[0])
> +        for xml_error_elem in new_elem_list:
> +            if not contain_element(xml_error_elem, curr_elem_list):
> +                insert_point.insert(1,xml_error_elem)
> +                numelem = numelem + 1
> +        curr = curr + 1
> +        sys.stdout.write('\r')
> +        sys.stdout.write(" %d / %d" % (curr,total))
> +        sys.stdout.flush()
> +
> +    sys.stdout.write('\r\n')
> +    print("Done: %d elements" % (numelem))
> +    return result_xml_root
> +
> +def run():
> +    files = []
> +    output = None
> +    for i in sys.argv[1:]:
> +        output = i if '.xml' in i else None
> +        files.append(i) if '.cppcheck' in i else None
> +
> +    result = merge(files)
> +
> +    if result is None:
> +        return
> +
> +    if output is not None:
> +        ElementTree.ElementTree(result).write(output)
> +    else:
> +        print(ElementTree.tostring(result).decode('utf-8'))
> +
> +if __name__ == '__main__':
> +    run()
> -- 
> 2.25.1
> 

