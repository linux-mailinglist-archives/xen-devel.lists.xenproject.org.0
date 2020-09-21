Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2DB2722C4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 13:41:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKKAh-0007NE-7N; Mon, 21 Sep 2020 11:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKKAg-0007N9-BR
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 11:39:50 +0000
X-Inumbo-ID: 8f0a9483-388e-456a-a704-a94c2b0ddf4b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f0a9483-388e-456a-a704-a94c2b0ddf4b;
 Mon, 21 Sep 2020 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=XsK6/RZCmM7OzaHfvKKDgUYwUULbRrGtcwIWNtCJ0q4=; b=WlyBPNZpFFHoua1HwhNmAJMXeA
 ySa2f0jMfKu3lstezNLK0jS3vKPJj4dbvqmmePneJxFmcA8aC3cjFnUhoDwIpa0CREOMHUTSAFvCs
 Y7ln21wvHMBBPZdxtM4ohiO2uOT8t8fHMqat9CcoCjAjnHrGhzPr9ldOR1CnrKwewFFs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKKAd-0007lO-0J; Mon, 21 Sep 2020 11:39:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKKAc-0006gq-IN; Mon, 21 Sep 2020 11:39:46 +0000
Subject: Re: Ping: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
 <de999174-604d-5874-cf11-4fab15c583d4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <43a4240c-baba-ca52-0a9f-a884c0f297be@xen.org>
Date: Mon, 21 Sep 2020 12:39:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <de999174-604d-5874-cf11-4fab15c583d4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 21/09/2020 11:17, Jan Beulich wrote:
> On 14.09.2020 12:15, Jan Beulich wrote:
>> Switch to $(call if_changed,ld) where possible; presumably not doing so
>> in e321576f4047 ("xen/build: start using if_changed") right away was an
>> oversight, as it did for Arm in (just) one case. It failed to add
>> prelink.o to $(targets), though, causing - judging from the observed
>> behavior on x86 - undue rebuilds of the final binary (because of
>> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
>> because of .prelink.o.cmd not getting read) during "make install-xen".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   xen/arch/arm/Makefile |  4 +++-
>>   xen/arch/x86/Makefile | 18 ++++++++++--------
>>   2 files changed, 13 insertions(+), 9 deletions(-)
> 
> May I ask for an Arm-side ack (or otherwise) here, please?

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> Jan
> 
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 51173d97127e..296c5e68bbc3 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -95,12 +95,14 @@ prelink_lto.o: $(ALL_OBJS)
>>   
>>   # Link it with all the binary objects
>>   prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>> +	$(call if_changed,ld)
>>   else
>>   prelink.o: $(ALL_OBJS) FORCE
>>   	$(call if_changed,ld)
>>   endif
>>   
>> +targets += prelink.o
>> +
>>   $(TARGET)-syms: prelink.o xen.lds
>>   	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
>>   	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index 74152f2a0dad..9b368632fb43 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -136,19 +136,21 @@ prelink_lto.o: $(ALL_OBJS)
>>   	$(LD_LTO) -r -o $@ $^
>>   
>>   # Link it with all the binary objects
>> -prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y)
>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>> +prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y) FORCE
>> +	$(call if_changed,ld)
>>   
>> -prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>> +prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
>> +	$(call if_changed,ld)
>>   else
>> -prelink.o: $(ALL_OBJS) $(EFI_OBJS-y)
>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>> +prelink.o: $(ALL_OBJS) $(EFI_OBJS-y) FORCE
>> +	$(call if_changed,ld)
>>   
>> -prelink-efi.o: $(ALL_OBJS)
>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>> +prelink-efi.o: $(ALL_OBJS) FORCE
>> +	$(call if_changed,ld)
>>   endif
>>   
>> +targets += prelink.o prelink-efi.o
>> +
>>   $(TARGET)-syms: prelink.o xen.lds
>>   	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>>   	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
>>
> 

-- 
Julien Grall

