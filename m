Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E152246519
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 13:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7czX-0005hN-6j; Mon, 17 Aug 2020 11:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7czW-0005hI-JM
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 11:07:50 +0000
X-Inumbo-ID: a46b8f8c-8ea1-4c51-b7b0-210f8d07ead2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a46b8f8c-8ea1-4c51-b7b0-210f8d07ead2;
 Mon, 17 Aug 2020 11:07:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDB4AADAD;
 Mon, 17 Aug 2020 11:08:13 +0000 (UTC)
Subject: Re: [PATCH II v2 01/17] stubdom: add correct dependencies for Xen
 libraries
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
References: <20200817094922.15768-1-jgross@suse.com>
 <20200817094922.15768-2-jgross@suse.com>
 <20200817101243.vxb6feikogjv6rqj@function>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6da9feb2-62ff-794c-7122-75df60a18bfb@suse.com>
Date: Mon, 17 Aug 2020 13:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817101243.vxb6feikogjv6rqj@function>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.08.20 12:12, Samuel Thibault wrote:
> Hello,
> 
> Juergen Gross, le lun. 17 août 2020 11:49:06 +0200, a ecrit:
>> The stubdom Makefile is missing several dependencies between Xen
>> libraries. Add them.
> 
>> @@ -405,6 +405,7 @@ libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $
>>   
>>   .PHONY: libxenevtchn
>>   libxenevtchn: libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a
>> +libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: libxentoolcore
> 
> I see
> 
> evtchn/Makefile:USELIBS  := toollog toolcore
> 
> So it'd actually need libxentoollog as well?
> 
>> @@ -423,6 +425,7 @@ libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(N
>>   
>>   .PHONY: libxencall
>>   libxencall: libs-$(XEN_TARGET_ARCH)/call/libxencall.a
>> +libs-$(XEN_TARGET_ARCH)/call/libxencall.a: libxentoolcore
> 
> Same with
> 
> call/Makefile:USELIBS  := toollog toolcore
> 
> ?
> 
>> @@ -432,6 +435,7 @@ libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLI
>>   
>>   .PHONY: libxenforeignmemory
>>   libxenforeignmemory: libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
>> +libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: libxentoolcore
> 
> Same with
> 
> foreignmemory/Makefile:USELIBS  := toollog toolcore
> 
> ?
> 
> Possibly they are actually already coming from somewhere by
> transitivity, but it'd probably better to just make sure we match
> Makefiles' USELIBS.

Yes. Thanks for catching those.

When all libraries have been switched to the USELIBS scheme I'll add a
patch using those variables in the stubdom Makefile, too. This will
avoid duplicate work when adding new libs or changing dependencies.


Juergen

