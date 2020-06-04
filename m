Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F31EE3C1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 13:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgoSy-0008Ud-UA; Thu, 04 Jun 2020 11:55:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgoSw-0008UY-Lp
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 11:55:22 +0000
X-Inumbo-ID: 44763d34-a65a-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44763d34-a65a-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 11:55:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2671AC52;
 Thu,  4 Jun 2020 11:55:23 +0000 (UTC)
Subject: Re: [PATCH] build: fix dependency tracking for preprocessed files
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <bb246053-f49b-58af-5381-fe0674f645de@suse.com>
 <0f8afd27-2af5-580e-48f8-65c01881e568@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfc36283-e4ac-e73e-8c23-ca411d327018@suse.com>
Date: Thu, 4 Jun 2020 13:55:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <0f8afd27-2af5-580e-48f8-65c01881e568@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 13:35, Andrew Cooper wrote:
> On 04/06/2020 11:22, Jan Beulich wrote:
>> While the issue is more general, I noticed that asm-macros.i not getting
>> re-generated as needed. This was due to its .*.d file mentioning
>> asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
>> it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
>> dependency tracking files. While there, further avoid open-coding $(CPP)
>> and drop the bogus -Ui386.
> 
> Its not bogus.  It really is needed to prevent OUTPUT_ARCH(i386:x86-64)
> being preprocessed to OUTPUT_ARCH(1:x86-64)
> 
> This explodes properly with 32bit builds, but we might get away with it
> now on a 64bit build (preprocessing without -m32 does appear to skip
> this transformation).

We haven't been doing 32-bit builds for quite a while, hence I continue
to assert the -U option is bogus; I'm not claiming it always has been
(that's true just for Arm).

> However, the robust way to deal with it is:
> 
> /* Don't clobber the ld directive */
> #undef i386
> 
> unconditionally in xen.lds.S

This would mean to add code with no effect, which I'd prefer to avoid.

>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -201,13 +201,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y)
>>  	$(call if_changed,obj_init_o)
>>  
>>  quiet_cmd_cpp_i_c = CPP     $@
>> -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
>> +cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@ -MQ $@
> 
> Please can -MQ come before $<, so the input and output files are still
> at the end of the command.  It is a very useful property of the current
> setup, when playing build system surgery.

Ah yes, but then I'll make it " -MQ $@ -o $@ $<", better matching the
.lds rules (where I'll also move -MQ ahead of -o).

> If you're happy with both of these suggestions, Reviewed-by: Andrew
> Cooper <andrew.cooper3@citrix.com> to save another round trip.

As per above, only the latter, so for now I won't put it into the
patch.

> Alternatively, I'm happy to submit the i386 as a prereq patch, seeing as
> it isn't now such a trivial change any more.

As per above, I don't think such an adjustment is wanted or needed.

Jan

