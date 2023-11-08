Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54167E5C1D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 18:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629375.981562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0m6b-0003Xb-4a; Wed, 08 Nov 2023 17:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629375.981562; Wed, 08 Nov 2023 17:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0m6b-0003Us-1L; Wed, 08 Nov 2023 17:12:41 +0000
Received: by outflank-mailman (input) for mailman id 629375;
 Wed, 08 Nov 2023 17:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7seD=GV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0m6Z-0003Ul-51
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 17:12:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0397578d-7e5a-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 18:12:36 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5366C4EE0737;
 Wed,  8 Nov 2023 18:12:36 +0100 (CET)
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
X-Inumbo-ID: 0397578d-7e5a-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 18:12:36 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v3 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <0c853769-8d59-4ce4-95d3-8acefddd8ed8@xen.org>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com>
 <fd60f0f3c777652bd305a97b559cb7ee23293e8d.1696231870.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310021531430.2348112@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311071240240.3478774@ubuntu-linux-20-04-desktop>
 <0c853769-8d59-4ce4-95d3-8acefddd8ed8@xen.org>
Message-ID: <791354c61840c8e37cd2ee3c99689236@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-08 17:25, Julien Grall wrote:
> Hi Stefano,
> 
> On 07/11/2023 20:41, Stefano Stabellini wrote:
>> +Julien, Andrew
>> 
>> Julien and Andrew raised concerns on this patch on the Xen Matrix
>> channel. Please provide further details.
> 
> Thanks! It looks like I was already CCed but this likely got lost with 
> all the MISRA patches...
> 
> On Matrix, there was concerned raised that the documentation now have a 
> dependency on C compiler and you are also build C files in docs.
> 
> In addition to that, I have a few more comments.
> 

The .rst file was chosen to have a human-readable format for the runtime 
failures
documentation. The other option that is otherwise viable is having a 
dummy .c or .h in
the sources (in this case it would likely be under xen/).

The transformation of this file into a .c file could be done from xen's 
Makefile of course,
but I reckoned that would have been more difficult, as the Makefile for 
the docs is
far shorter.

>>>> diff --git a/docs/Makefile b/docs/Makefile
>>>> index 966a104490ac..ff991a0c3ca2 100644
>>>> --- a/docs/Makefile
>>>> +++ b/docs/Makefile
>>>> @@ -43,7 +43,7 @@ DOC_PDF  := $(patsubst 
>>>> %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
>>>>   all: build
>>>>     .PHONY: build
>>>> -build: html txt pdf man-pages figs
>>>> +build: html txt pdf man-pages figs misra
> 
> This means you always generate and compile the C files when it seems to 
> be only useful for Eclair. I think we should consider to only call 
> 'misra' for the Eclair build.
> 
> The files should also be generated/compiled in an Eclair specific 
> directory rather than in docs.
> 

Hmm, that is not a bad idea

>>>>     .PHONY: sphinx-html
>>>>   sphinx-html:
>>>> @@ -66,9 +66,14 @@ endif
>>>>   .PHONY: pdf
>>>>   pdf: $(DOC_PDF)
>>>>   +.PHONY: misra
>>>> +misra:
>>>> +	$(MAKE) -C misra
>>>> +
>>>>   .PHONY: clean
>>>>   clean: clean-man-pages
>>>>   	$(MAKE) -C figs clean
>>>> +	$(MAKE) -C misra clean
>>>>   	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>>>>   	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>>>>   	rm -rf html txt pdf sphinx/html
>>>> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
>>>> new file mode 100644
>>>> index 000000000000..949458ff9e15
>>>> --- /dev/null
>>>> +++ b/docs/misra/Makefile
>>>> @@ -0,0 +1,22 @@
>>>> +TARGETS := C-runtime-failures.o
> 
> We don't usually have uppercase in the file name. Is this something 
> that Eclair mandates? In fact, looking at the series, it is not clear 
> how Eclair will find the file. Can you clarify?
> 

Not really. I was just following the naming convention of 
C-language-toolchain.rst, as the
two files are in some ways related.

ECLAIR intercepts toolchain invocations, so the compilation can happen 
anywhere* in the
repository in the current setup.

* I actually need to test this, but an ECLAIR-specific directory is 
indeed a good fit.

>>>> +
>>>> +all: $(TARGETS)
>>>> +
>>>> +# This Makefile will generate the object files indicated in TARGETS 
>>>> by taking
>>>> +# the corresponding .rst file, converting its content to a C block 
>>>> comment and
>>>> +# then compiling the resulting .c file. This is needed for the 
>>>> file's content to
>>>> +# be available when performing static analysis with ECLAIR on the 
>>>> project.
> 
> I am a bit lost with the explanation. The generated object will be 
> empty. So why do you require to generate it?
> 

See above. The only requirement is that some intercepted toolchain 
invocation happens
and that the processed file has a comment block containing the strings 
specified below.
The resulting artifact isn't needed in any way.

> Furthermore, the content doesn't seem to follow a specific syntax (or 
> at least it is not clear that it should follow one). So why do you need 
> to expose the content to Eclair?
> 

Under the hood there's a regex matching the resulting comment block 
against a set of default
templates used to indicate that the project has some form of 
documentation around runtime
failures. The default templates are along these lines (the comment begin 
and end markers
need not be on the same line):

/* Documentation for MISRA C:2012 Dir 4.1: overflow <description> */

If the string is matched, then documentation for that particular 
category of runtime
failures is deemed present, otherwise a violation will be reported (one 
for each category).
Both the categories and format of the string to be matched can be 
customized, but I'd like
to avoid doing that.

>>>> +
>>>> +# sed is used in place of cat to prevent occurrences of '*/'
>>>> +# in the .rst from breaking the compilation
>>>> +$(TARGETS:.o=.c): %.c: %.rst
>>>> +	printf "/*\n\n" > $@.tmp
>>>> +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
>>>> +	printf "\n\n*/\n" >> $@.tmp
>>>> +	mv $@.tmp $@
>>>> +
>>>> +%.o: %.c
>>>> +	$(CC) -std=c99 -c $< -o $@
> 
> AFAICT, this will generate a file using the host compiler. This may be 
> different from the compiler used to build Xen.
> 
> So I will repeat myself, how all of this matters? Maybe it would be 
> useful if you provide some documentation from Eclair.
> 
> Cheers,

The only non-trivial bit is that the file 
automation/eclair_analysis/ECLAIR/toolchain.ecl
specifies some compilers (if this needs to be adjusted to something 
other that $(CC), then I
may need some additional guidance) and the c99 standard, hence if you 
use a different
compiler ECLAIR will complain that you didn't document the toolchain 
assumptions according
to D1.1 (which is incidentally why we created the file 
C-language-toolchain.rst).

I hope this clears up any doubts about the patch.

Kind Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

