Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E45258D85
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:42:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4fD-0003xu-O1; Tue, 01 Sep 2020 11:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kD4fC-0003xp-9I
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:41:22 +0000
X-Inumbo-ID: 5d452c0d-59bd-4279-839f-fbc805eecd26
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d452c0d-59bd-4279-839f-fbc805eecd26;
 Tue, 01 Sep 2020 11:41:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE856B713;
 Tue,  1 Sep 2020 11:41:20 +0000 (UTC)
Subject: Re: [PATCH] tools: don't use = after "define" in Rules.mk
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <1cd1289b-f63a-a74e-a331-b93351781457@suse.com>
 <81fece45-1bbb-22f4-f229-3894c07e186e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62d20484-ecd4-b16b-3549-84deecc1e9ff@suse.com>
Date: Tue, 1 Sep 2020 13:41:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <81fece45-1bbb-22f4-f229-3894c07e186e@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.09.2020 12:55, Jürgen Groß wrote:
> On 01.09.20 12:27, Jan Beulich wrote:
>> The assignment operator is optional, and use of it breaks with make 3.81.
>>
>> Fixes: ded08cdfa72b ("tools: generate most contents of library make variables")
>> Suggested-by: Juergen Gross <jgross@suse.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/Rules.mk
>> +++ b/tools/Rules.mk
>> @@ -94,7 +94,7 @@ INSTALL_DIR_ROOT = [ $$UID -ne 0 ] || $(
>>   # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
>>   # $(SHLIB_libfoo)
>>   
>> -define LIB_defs =
>> +define LIB_defs
>>    XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
>>    CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
>>    SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
>>
> 
> I'd suggest to fix stubdom/Makefile, too (that was introduced with
> commit ddb2934a914df). I have a patch doing both fixes lying here. Do
> you want me to send it instead, or fix it yourself?

Please do, since you say you have it ready.

Jan

