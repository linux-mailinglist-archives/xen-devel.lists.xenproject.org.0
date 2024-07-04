Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90959270ED
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 09:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753569.1161761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHEV-0004Wf-Ng; Thu, 04 Jul 2024 07:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753569.1161761; Thu, 04 Jul 2024 07:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHEV-0004VB-KQ; Thu, 04 Jul 2024 07:50:23 +0000
Received: by outflank-mailman (input) for mailman id 753569;
 Thu, 04 Jul 2024 07:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PC/7=OE=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sPHET-0004V5-Tp
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 07:50:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ffab665-39da-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 09:50:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D0DDD4EE0739;
 Thu,  4 Jul 2024 09:50:19 +0200 (CEST)
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
X-Inumbo-ID: 0ffab665-39da-11ef-bbf9-fd08da9f4363
MIME-Version: 1.0
Date: Thu, 04 Jul 2024 09:50:19 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3re?=
 =?UTF-8?Q?cki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 10/17] x86/asm: address violations of MISRA C:2012
 Directive 4.10
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <8a0c0cec-c168-471f-88ad-228ddcdd4f0a@suse.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <efb272c9eaad24875f34b396a75fed9577dedbda.1719829101.git.alessandro.zucchelli@bugseng.com>
 <8a0c0cec-c168-471f-88ad-228ddcdd4f0a@suse.com>
Message-ID: <5f68a556c6bc263fe958a105b87dcf1e@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-03 14:49, Jan Beulich wrote:
> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -90,6 +90,14 @@
>>              "name": "Dir 4.10: direct inclusion guard before",
>>              "text": "Headers with just the direct inclusion guard 
>> before the inclusion guard are safe."
>>          },
>> +        {
>> +            "id": "SAF-11-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.D4.10"
>> +            },
>> +            "name": "Dir 4.10: file intended for multiple inclusion",
>> +            "text": "Files intended for multiple inclusion are not 
>> supposed to comply with D4.10."
>> +        },
>>          {
>>              "id": "SAF-11-safe",
> 
> This can't be right; the sentinel must have its number changed.

Yes, this must have been overlooked during the rebasing of the previous 
patch version's commits.

> 
>> --- a/xen/include/Makefile
>> +++ b/xen/include/Makefile
>> @@ -104,10 +104,17 @@ $(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst 
>> FORCE
>>  xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 
>> 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | 
>> uniq)
>>  xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
>> 
>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
> 
> Why is this being added here? It's not used ...

It was mistakenly left here from the previous version of the patch 
series.

> 
>>  quiet_cmd_xlat_h = GEN     $@
>> -cmd_xlat_h = \
>> -	cat $(filter %.h,$^) >$@.new; \
>> +define cmd_xlat_h
>> +	guard=$$(echo ASM_${SRCARCH}_COMPAT_XLAT_H | tr a-z A-Z); \
>> +	echo "#ifndef $$guard" > $@.new; \
>> +	echo "#define $$guard" >> $@.new; \
>> +	cat $(filter %.h,$^) >> $@.new; \
>> +	echo "#endif /* $$guard */" >> $@.new; \
>>  	mv -f $@.new $@
>> +endef
>> 
>>  $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) 
>> FORCE
>>  	$(call if_changed,xlat_h)
> 
> ... anywhere. Did you mean to use it in place of ${SRCARCH}?

No, SRCARCH is correct, as ARCHDIR was supposed to be removed.

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

