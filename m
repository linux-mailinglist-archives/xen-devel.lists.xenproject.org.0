Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA88362024
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 14:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111715.213639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXNuD-0004rt-Ge; Fri, 16 Apr 2021 12:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111715.213639; Fri, 16 Apr 2021 12:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXNuD-0004rU-DQ; Fri, 16 Apr 2021 12:49:05 +0000
Received: by outflank-mailman (input) for mailman id 111715;
 Fri, 16 Apr 2021 12:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXNuC-0004rP-G5
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 12:49:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b46c08a-3eac-41a0-a191-ef09ae074a6b;
 Fri, 16 Apr 2021 12:49:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51C62B0B3;
 Fri, 16 Apr 2021 12:49:02 +0000 (UTC)
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
X-Inumbo-ID: 0b46c08a-3eac-41a0-a191-ef09ae074a6b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618577342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RE3KhTF6xhoyS2gvohxFvwhNUtvcN0Jh9rO3BalleBE=;
	b=rYE78VhIlAwMgD1q7gWn1s//IrV7ApTwTslkbkqxZhskalZh1mqqrc2Amx7+7cwhRcSuB+
	17MmXfhaQ+aDn/R0+bVTGe8hHdWB8tvV9+sK9OrtZ8+EQAOfHQTMpMeH7ys2AoTP6X246e
	BgRXLr7IxX2FCcHiaUdC15sEx1LsfNo=
Subject: Re: [PATCH] x86/shadow: depend on PV || HVM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eee69a8e-36d5-b9eb-d8f1-1a7e1c3dfdc0@suse.com>
 <4cab02d4-121a-4898-d0af-7c992b157785@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0dd00856-a7fa-da3d-9328-cf87e1adbafe@suse.com>
Date: Fri, 16 Apr 2021 14:49:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <4cab02d4-121a-4898-d0af-7c992b157785@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.04.2021 14:39, Andrew Cooper wrote:
> On 16/04/2021 13:32, Jan Beulich wrote:
>> With the building of guest_?.o now depending on PV or HVM, without
>> further #ifdef-ary shadow code won't link anymore when !PV && !HVM.
>> Since this isn't a useful configuration anyway, exclude shadow code from
>> being built in this case.
>>
>> Fixes: aff8bf94ce65 ("x86/shadow: only 4-level guest code needs building when !HVM")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -121,6 +121,7 @@ config XEN_SHSTK
>>  config SHADOW_PAGING
>>  	bool "Shadow Paging"
>>  	default !PV_SHIM_EXCLUSIVE
> 
> Hang on - this is bug, and is what needs dropping.
> 
> PV Shim uses Shadow, in default configurations, for L1TF protections to
> keep userspace out of the guest kernel.  Without it, the shim'd guest
> will be crashed when it writes an L1TF-vulnerable PTE.
> 
> OSSTest ought to have blocked this as a regression, but I suspect its
> not running the XTF PV guests in shim mode.

One thing at a time please - if there's an issue here, this wants
addressing in a separate change (which then also may need
backporting).

Jan

