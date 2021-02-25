Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3701324B23
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 08:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89615.168921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFAxI-0004jY-Nb; Thu, 25 Feb 2021 07:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89615.168921; Thu, 25 Feb 2021 07:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFAxI-0004j9-IP; Thu, 25 Feb 2021 07:21:00 +0000
Received: by outflank-mailman (input) for mailman id 89615;
 Thu, 25 Feb 2021 07:20:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFAxH-0004j4-5o
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 07:20:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9a62473-23e2-44ac-8d82-1e71ed1fa690;
 Thu, 25 Feb 2021 07:20:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D6C5ACD4;
 Thu, 25 Feb 2021 07:20:57 +0000 (UTC)
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
X-Inumbo-ID: c9a62473-23e2-44ac-8d82-1e71ed1fa690
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614237657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XBXe1Cf9nkyNUF7o/vTMFDBr3U8RRUw+NuVPfTSB2g=;
	b=jTl303D87a4Nxt92oIlhvnJTFGW53xVN8sPgxWPgU2nkH0NUeT39WSVyJAHQdEg63OOwMi
	Xx38BlV3K0CXt/pMj17i+QDL2hgicDxlgzx4kRqzcx3JSIbfBhbF7ILBFG2/U1PhIPRp/J
	yMeEqDIKv8mNtTPpbxaok6dwKjVMMdk=
Subject: [4.15] Re: [PATCH] x86/EFI: suppress GNU ld 2.36'es creation of base
 relocs
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <6ce5b1a7-d7c2-c30c-ad78-233379ea130b@suse.com>
 <53c7a708-1664-0186-1fd6-1056f8e7839c@citrix.com>
 <f8e56c90-f51c-01f7-0987-4c0697a17bb0@suse.com>
 <a35dd0b7-b804-9c75-b93c-e764345df46b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fff8e64c-f724-11e8-daa5-80147c6925dd@suse.com>
Date: Thu, 25 Feb 2021 08:20:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a35dd0b7-b804-9c75-b93c-e764345df46b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.02.2021 18:17, Andrew Cooper wrote:
> On 23/02/2021 07:53, Jan Beulich wrote:
>> On 22.02.2021 17:36, Andrew Cooper wrote:
>>> On 19/02/2021 08:09, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -123,8 +123,13 @@ ifneq ($(efi-y),)
>>>>  # Check if the compiler supports the MS ABI.
>>>>  export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>>>>  # Check if the linker supports PE.
>>>> -XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -S -o efi/check.efi efi/check.o 2>/dev/null && echo y))
>>>> +EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
>>>> +XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
>>>>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>>>> +# Check if the linker produces fixups in PE by default (we need to disable it doing so for now).
>>>> +XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI), \
>>>> +                         $(shell $(LD) $(EFI_LDFLAGS) --disable-reloc-section -o efi/check.efi efi/check.o 2>/dev/null && \
>>>> +                                 echo --disable-reloc-section))
>>> Why does --strip-debug move?
>> -S and --strip-debug are the same. I'm simply accumulating in
>> EFI_LDFLAGS all that's needed for the use in the probing construct.
> 
> Oh ok.
> 
> It occurs to me that EFI_LDFLAGS now only gets started in an ifneq
> block, but appended to later on while unprotected.  That said, I'm
> fairly sure it is only consumed inside a different ifeq section, so I
> think there is a reasonable quantity of tidying which ought to be done here.
> 
>> Also I meanwhile have a patch to retain debug info, for which this
>> movement turns out to be a prereq. (I've yet to test that the
>> produced binary actually works, and what's more I first need to get
>> a couple of changes accepted into binutils for the linker to actually
>> cope.)
>>
>>> What's wrong with $(call ld-option ...) ?  Actually, lots of this block
>>> of code looks to be opencoding of standard constructs.
>> It looks like ld-option could indeed be used here (there are marginal
>> differences which are likely acceptable), despite its brief comment
>> talking of just "flag" (singular, plus not really covering e.g. input
>> files).
>>
>> But:
>> - It working differently than cc-option makes it inconsistent to
>>   use (the setting of XEN_BUILD_EFI can't very well be switched to
>>   use cc-option); because of this I'm not surprised that we have
>>   only exactly one use right now in the tree.
>> - While XEN_BUILD_PE wants to be set to "y", for XEN_NO_PE_FIXUPS
>>   another transformation would then be necessary to translate "y"
>>   into "--disable-reloc-section".
>> - Do you really suggest to re-do this at this point in the release
>>   cycle?
> 
> I'm looking to prevent this almost-incompressible mess from getting worse.
> 
> But I suppose you want this to backport, so I suppose it ought to be
> minimally invasive.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Since getting Andrew's ack has taken across the firm-freeze boundary,
may I ask for a release-ack here? As noted this change (alongside
the earlier one) will want backporting, perhaps even to security-
support-only branches.

Jan

