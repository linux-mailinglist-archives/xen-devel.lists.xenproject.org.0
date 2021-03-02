Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90AD329C04
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 12:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92279.174133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH35q-0008ID-9c; Tue, 02 Mar 2021 11:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92279.174133; Tue, 02 Mar 2021 11:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH35q-0008Ho-6a; Tue, 02 Mar 2021 11:21:34 +0000
Received: by outflank-mailman (input) for mailman id 92279;
 Tue, 02 Mar 2021 11:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH35o-0008Hj-M8
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 11:21:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecd13e1a-7d21-47bb-a6c8-f3c728b2b81e;
 Tue, 02 Mar 2021 11:21:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2C33AAC5;
 Tue,  2 Mar 2021 11:21:30 +0000 (UTC)
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
X-Inumbo-ID: ecd13e1a-7d21-47bb-a6c8-f3c728b2b81e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614684091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGPAB5S61zjztiSLu+LQA71756ntUrrWCIg+SgnA3Tc=;
	b=mrsC1cQVk2HmAz1AXDOUGa2m0Iggt6epMpS8evOhshj5oydgMKgPqXthGK0bIkcLZIfWVD
	pWTLefWAy6C/12bXmu6oMrWX4U9n5zaj9x/UTzLuspxMHA0hOKtxpWNOoeHmU3a2LG+utT
	KIhwUcqhfN64mC+iZuz7EhZuzLaS17A=
Subject: Re: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable
 libraries
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
 <20210301170044.23295-3-andrew.cooper3@citrix.com>
 <677223c5-e661-a132-35b8-2e9424817c7b@suse.com>
 <d53399b1-7053-10b1-b5a2-38244dc2f154@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c06e2a00-6f23-5ddc-3404-572682a0bd51@suse.com>
Date: Tue, 2 Mar 2021 12:21:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d53399b1-7053-10b1-b5a2-38244dc2f154@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.03.2021 12:17, Andrew Cooper wrote:
> On 02/03/2021 10:45, Jürgen Groß wrote:
>> On 01.03.21 18:00, Andrew Cooper wrote:
>>> These dumps were produced from the RELEASE-4.14.0 tag, with the
>>> abi-dumper
>>> tooling backported from staging.
>>>
>>> For each stable library, add a PKG_OLD_ABI variable pointing at the
>>> 4.14 ABI.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Ian Jackson <iwj@xenproject.org>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump   |  924 +++++++++++
>>>   .../abi/libxendevicemodel.so.1.3-x86_64-abi.dump   | 1491
>>> +++++++++++++++++
>>>   tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump |  719 ++++++++
>>>   .../abi/libxenforeignmemory.so.1.3-x86_64-abi.dump |  847 ++++++++++
>>>   tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump | 1199
>>> ++++++++++++++
>>>   tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump  |  597 +++++++
>>>   .../libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump  | 1711
>>> ++++++++++++++++++++
>>>   .../libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump |  239 +++
>>>   .../libs/abi/libxentoollog.so.1.0-x86_64-abi.dump  |  882 ++++++++++
>>>   tools/libs/call/Makefile                           |    2 +
>>>   tools/libs/devicemodel/Makefile                    |    2 +
>>>   tools/libs/evtchn/Makefile                         |    2 +
>>>   tools/libs/foreignmemory/Makefile                  |    2 +
>>>   tools/libs/gnttab/Makefile                         |    2 +
>>>   tools/libs/hypfs/Makefile                          |    2 +
>>>   tools/libs/store/Makefile                          |    2 +
>>>   tools/libs/toolcore/Makefile                       |    2 +
>>>   tools/libs/toollog/Makefile                        |    2 +
>>>   18 files changed, 8627 insertions(+)
>>>   create mode 100644 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
>>>   create mode 100644
>>> tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
>>>   create mode 100644 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
>>>   create mode 100644
>>> tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
>>>   create mode 100644 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
>>>   create mode 100644 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
>>>   create mode 100644 tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
>>>   create mode 100644
>>> tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
>>>   create mode 100644 tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump
>>>
>>
>>> diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
>>> index 4ed201b3b3..37a7db5395 100644
>>> --- a/tools/libs/call/Makefile
>>> +++ b/tools/libs/call/Makefile
>>> @@ -11,4 +11,6 @@ SRCS-$(CONFIG_SunOS)   += solaris.c
>>>   SRCS-$(CONFIG_NetBSD)  += netbsd.c
>>>   SRCS-$(CONFIG_MiniOS)  += minios.c
>>>   +PKG_OLD_ABI =
>>> ../abi/libxen$(LIBNAME).so.1.2-$(XEN_TARGET_ARCH)-abi.dump
>>> +
>>
>> Any reason you don't add
>>
>> PKG_OLD_ABI =
>> ../abi/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)-$(XEN_TARGET_ARCH)-abi.dump
>>
>> to tools/libs/libs.mk, maybe with some way to override/disable the
>> setting (e.g. by setting a different value for PKG_OLD_ABI just
>> after including $(XEN_ROOT)/tools/libs/libs.mk) ?
> 
> The problem is with libraries which have changed in staging, where
> $MINOR differs by 1.  I chose not to wildcard in ../abi/ to reduce the
> chance of picking up the wrong ABI to check against.
> 
> Something needs to be a statement of which is the appropriate $MINOR to
> use, and it shouldn't be the change to bump the soname, as that is a
> change we want to be tested.

Introduce OLD_MINOR or ABI_OLD_MINOR?

Jan

