Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF924ECA1
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:51:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9meX-0001wY-3Z; Sun, 23 Aug 2020 09:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9meV-0001wQ-AN
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:51:03 +0000
X-Inumbo-ID: 4a238935-e42b-45b3-abff-8a009a8d5166
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a238935-e42b-45b3-abff-8a009a8d5166;
 Sun, 23 Aug 2020 09:51:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02299AC7F;
 Sun, 23 Aug 2020 09:51:31 +0000 (UTC)
Subject: Re: [PATCH v3 07/38] stubdom: add correct dependencies for Xen
 libraries
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-8-jgross@suse.com>
 <20200823094722.o2o63bi2tb4vukqu@function>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <204570fa-d8e0-a83b-5652-b937fb36185d@suse.com>
Date: Sun, 23 Aug 2020 11:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200823094722.o2o63bi2tb4vukqu@function>
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

On 23.08.20 11:47, Samuel Thibault wrote:
> Juergen Gross, le dim. 23 août 2020 11:34:48 +0200, a ecrit:
>> The stubdom Makefile is missing several dependencies between Xen
>> libraries. Add them.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> In case another round of review is needed, perhaps you can just
> factorize:
> 
>> @@ -387,6 +394,7 @@ $(TARGETS_MINIOS): mini-os-%:
>>   
>>   .PHONY: libxentoolcore
>>   libxentoolcore: libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a
>> +libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: $(LIBDEPS_toolcore)
>>   libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
>>   	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toolcore
>>   
>> @@ -396,6 +404,7 @@ libs-$(XEN_TARGET_ARCH)/toolcore/libxentoolcore.a: mk-headers-$(XEN_TARGET_ARCH)
>>   
>>   .PHONY: libxentoollog
>>   libxentoollog: libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a
>> +libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: $(LIBDEPS_toollog)
>>   libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
>>   	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/toollog
> 
> etc.
> by iterating over LIBS_LIBS?  That'll make the maintenance easier.

Look at the next patch. :-)


Juergen

