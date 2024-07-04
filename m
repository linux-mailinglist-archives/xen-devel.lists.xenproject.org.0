Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2D927163
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 10:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753591.1161781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHbp-000079-Rg; Thu, 04 Jul 2024 08:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753591.1161781; Thu, 04 Jul 2024 08:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHbp-00005d-P6; Thu, 04 Jul 2024 08:14:29 +0000
Received: by outflank-mailman (input) for mailman id 753591;
 Thu, 04 Jul 2024 08:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PC/7=OE=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sPHbo-00005X-Ej
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 08:14:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d988c2f-39dd-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 10:14:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7894B4EE0739;
 Thu,  4 Jul 2024 10:14:25 +0200 (CEST)
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
X-Inumbo-ID: 6d988c2f-39dd-11ef-8776-851b0ebba9a2
MIME-Version: 1.0
Date: Thu, 04 Jul 2024 10:14:25 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com, Maria Celeste
 Cesario <maria.celeste.cesario@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 12/17] xen: address violations of MISRA C:2012 Directive
 4.10
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <ac3885eb-ae04-4362-b94d-117694fbdaac@suse.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <8305a914d1f1ee01d1b0b83cb86c2a48a2a2be0b.1719829101.git.alessandro.zucchelli@bugseng.com>
 <ac3885eb-ae04-4362-b94d-117694fbdaac@suse.com>
Message-ID: <6b066505be32b7b22974fca8217ade93@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-03 14:51, Jan Beulich wrote:
> On 01.07.2024 15:43, Alessandro Zucchelli wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>> 
>> Modify creation rule for asm-offsets.h to conform to
>> the new standard and to not generate conflicting guards
>> between architectures (which is a violation of the directive).
>> Modify generic-y creation rule to generate code without violations
>> and to conform to the new standard.
>> 
>> Mechanical change.
>> ---
>> Changes in v4:
>> - improve inclusion guard generation
>> 
>> Signed-off-by: Maria Celeste Cesario  
>> <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> 
>> ---
>>  xen/build.mk                     | 7 ++++---
>>  xen/scripts/Makefile.asm-generic | 8 +++++++-
>>  2 files changed, 11 insertions(+), 4 deletions(-)
>> 
>> diff --git a/xen/build.mk b/xen/build.mk
>> index 0f490ca71b..bbd4c2970f 100644
>> --- a/xen/build.mk
>> +++ b/xen/build.mk
>> @@ -47,6 +47,7 @@ asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
>> 
>>  arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
>>  	@(set -e; \
>> +	  guard=$$(echo ASM_${SRCARCH}_ASM_OFFSETS_H | tr a-z A-Z); \
> 
> Was this and ...
> 
>> --- a/xen/scripts/Makefile.asm-generic
>> +++ b/xen/scripts/Makefile.asm-generic
>> @@ -32,7 +32,13 @@ old-headers := $(wildcard $(obj)/*.h)
>>  unwanted    := $(filter-out $(generic-y) 
>> $(generated-y),$(old-headers))
>> 
>>  quiet_cmd_wrap = WRAP    $@
>> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
>> +cmd_wrap = \
>> +    guard=$$(echo ASM_GENERIC_${SRCARCH}_$*_H | tr a-z A-Z); \
> 
> ... this mean to be using $(ARCHDIR) as well then?

The introduction of ARCHDIR is a slip-up from amending the previous 
version of the patch series.
This script is correct as it is.

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

