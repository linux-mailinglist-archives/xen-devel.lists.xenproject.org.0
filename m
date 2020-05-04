Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B201C354E
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 11:11:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVX89-0005Ec-TG; Mon, 04 May 2020 09:11:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVX88-0005E2-Lj
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 09:11:16 +0000
X-Inumbo-ID: 35283dea-8de7-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35283dea-8de7-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 09:11:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC0B1ACF1;
 Mon,  4 May 2020 09:11:16 +0000 (UTC)
Subject: Re: [XEN PATCH v5 09/16] xen/build: use if_changed on built_in.o
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-10-anthony.perard@citrix.com>
 <6c6d20f5-d8ab-ee15-d2fc-e19b1dced99a@suse.com>
 <20200501144234.GE2116@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cb0c187-137b-46d7-c05e-0dcb39f45a46@suse.com>
Date: Mon, 4 May 2020 11:11:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501144234.GE2116@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.05.2020 16:42, Anthony PERARD wrote:
> On Tue, Apr 28, 2020 at 03:48:13PM +0200, Jan Beulich wrote:
>> On 21.04.2020 18:12, Anthony PERARD wrote:
>>> In the case where $(obj-y) is empty, we also replace $(c_flags) by
>>> $(XEN_CFLAGS) to avoid generating an .%.d dependency file. This avoid
>>> make trying to include %.h file in the ld command if $(obj-y) isn't
>>> empty anymore on a second run.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Personally I'd prefer ...
>>
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -130,15 +130,24 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
>>>  c_flags += $(CFLAGS-y)
>>>  a_flags += $(CFLAGS-y) $(AFLAGS-y)
>>>  
>>> -built_in.o: $(obj-y) $(extra-y)
>>> -ifeq ($(obj-y),)
>>> -	$(CC) $(c_flags) -c -x c /dev/null -o $@
>>> -else
>>> +quiet_cmd_ld_builtin = LD      $@
>>>  ifeq ($(CONFIG_LTO),y)
>>> -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
>>> +cmd_ld_builtin = \
>>> +    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
>>>  else
>>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
>>> +cmd_ld_builtin = \
>>> +    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
>>>  endif
>>> +
>>> +quiet_cmd_cc_builtin = LD      $@
>>> +cmd_cc_builtin = \
>>> +    $(CC) $(XEN_CFLAGS) -c -x c /dev/null -o $@
>>> +
>>> +built_in.o: $(obj-y) $(extra-y) FORCE
>>> +ifeq ($(obj-y),)
>>> +	$(call if_changed,cc_builtin)
>>> +else
>>> +	$(call if_changed,ld_builtin)
>>>  endif
>>
>> ...
>>
>>    $(call if_changed,$(if $(obj-y),ld,cc)_builtin)
>>
>> but perhaps I'm the only one.
> 
> I think so. Spelling the full name of the command makes it easier to
> look for where it is used, or for where it is defined.

   $(call if_changed,$(if $(obj-y),ld_builtin,cc_builtin))

then?

Jan


