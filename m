Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9593B197
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764208.1174561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc10-0000zE-42; Wed, 24 Jul 2024 13:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764208.1174561; Wed, 24 Jul 2024 13:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc10-0000x9-0u; Wed, 24 Jul 2024 13:26:46 +0000
Received: by outflank-mailman (input) for mailman id 764208;
 Wed, 24 Jul 2024 13:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xdhr=OY=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWc0z-0000o2-EB
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:26:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e4abfba-49c0-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 15:26:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 079824EE0738;
 Wed, 24 Jul 2024 15:26:43 +0200 (CEST)
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
X-Inumbo-ID: 5e4abfba-49c0-11ef-8776-851b0ebba9a2
MIME-Version: 1.0
Date: Wed, 24 Jul 2024 15:26:42 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Maria Celeste
 Cesario <maria.celeste.cesario@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>
Subject: Re: [XEN PATCH v5 12/17] xen: address violations of MISRA C:2012
 Directive 4.10
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2407231528040.4857@ubuntu-linux-20-04-desktop>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <42fbbb9ffb85893d049c80812b547ffb10ccda7e.1721720583.git.alessandro.zucchelli@bugseng.com>
 <alpine.DEB.2.22.394.2407231528040.4857@ubuntu-linux-20-04-desktop>
Message-ID: <5350aa753d36f8fccc3bb32b30828f40@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-24 00:29, Stefano Stabellini wrote:
> On Tue, 23 Jul 2024, Alessandro Zucchelli wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>> 
>> Modify creation rule for asm-offsets.h to conform to
>> the new standard and to not generate conflicting guards
>> between architectures (which is a violation of the directive).
>> Modify generic-y creation rule to generate code without violations
>> and to conform to the new standard.
>> 
>> Mechanical change.
>> 
>> Signed-off-by: Maria Celeste Cesario  
>> <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> I know I gave my Reviewed-by already but I have a question below...
> 
> 
>> ---
>> Changes in v5:
>> - edit inclusion guards of autogenerated files
>> Commit introduced in v3
>> ---
>>  xen/build.mk                     | 7 ++++---
>>  xen/scripts/Makefile.asm-generic | 8 +++++++-
>>  2 files changed, 11 insertions(+), 4 deletions(-)
>> 
>> diff --git a/xen/build.mk b/xen/build.mk
>> index 0f490ca71b..32624d3097 100644
>> --- a/xen/build.mk
>> +++ b/xen/build.mk
>> @@ -47,6 +47,7 @@ asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
>> 
>>  arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
>>  	@(set -e; \
>> +	  guard=$$(echo ASM__${SRCARCH}__ASM_OFFSETS_H | tr a-z A-Z); \
>>  	  echo "/*"; \
>>  	  echo " * DO NOT MODIFY."; \
>>  	  echo " *"; \
>> @@ -54,12 +55,12 @@ arch/$(SRCARCH)/include/asm/asm-offsets.h: 
>> asm-offsets.s
>>  	  echo " *"; \
>>  	  echo " */"; \
>>  	  echo ""; \
>> -	  echo "#ifndef __ASM_OFFSETS_H__"; \
>> -	  echo "#define __ASM_OFFSETS_H__"; \
>> +	  echo "#ifndef $$guard"; \
>> +	  echo "#define $$guard"; \
>>  	  echo ""; \
>>  	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
>>  	  echo ""; \
>> -	  echo "#endif") <$< >$@
>> +	  echo "#endif /* $$guard */") <$< >$@
>> 
>>  build-dirs := $(patsubst %/built_in.o,%,$(filter 
>> %/built_in.o,$(ALL_OBJS) $(ALL_LIBS)))
>> 
>> diff --git a/xen/scripts/Makefile.asm-generic 
>> b/xen/scripts/Makefile.asm-generic
>> index b0d356bfa3..2d2fd9f76e 100644
>> --- a/xen/scripts/Makefile.asm-generic
>> +++ b/xen/scripts/Makefile.asm-generic
>> @@ -32,7 +32,13 @@ old-headers := $(wildcard $(obj)/*.h)
>>  unwanted    := $(filter-out $(generic-y) 
>> $(generated-y),$(old-headers))
>> 
>>  quiet_cmd_wrap = WRAP    $@
>> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
>> +cmd_wrap = \
>> +    guard=$$(echo ASM_GENERIC__${SRCARCH}__$*_H | tr a-z A-Z); \
> 
> Shouldn't this be: ASM_GENERIC__$*_H  according to the coding style?

Yes, you are right, this slipped through.

>> +    echo "\#ifndef $$guard" >$@.new; \
>> +    echo "\#define $$guard" >>$@.new; \
>> +    echo "\#include <asm-generic/$*.h>" >>$@.new; \
>> +    echo "\#endif /* $$guard */" >>$@.new; \
>> +    mv -f $@.new $@
>> 
>>  quiet_cmd_remove = REMOVE  $(unwanted)
>>        cmd_remove = rm -f $(unwanted)
>> --
>> 2.34.1
>> 

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

