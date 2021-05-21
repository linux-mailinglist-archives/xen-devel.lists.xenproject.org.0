Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB68438C82B
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 15:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131298.245465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5Fb-0000tC-6C; Fri, 21 May 2021 13:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131298.245465; Fri, 21 May 2021 13:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5Fb-0000r3-2N; Fri, 21 May 2021 13:31:39 +0000
Received: by outflank-mailman (input) for mailman id 131298;
 Fri, 21 May 2021 13:31:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qZ6I=KQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lk5FY-0000qx-Or
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 13:31:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 973b7e06-c570-49aa-8e04-11fa01becfca;
 Fri, 21 May 2021 13:31:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D4DEAC7A;
 Fri, 21 May 2021 13:31:34 +0000 (UTC)
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
X-Inumbo-ID: 973b7e06-c570-49aa-8e04-11fa01becfca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621603894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqYoKHr/OUSjW/0A9yXkvaNEkKfdi2ibW6kI/dsMNb8=;
	b=cvrGykJ7GBRIFe2WqEHRv6zGcU699awRp6T1im/y9c/GIu6naITbpZY8YMG4VsaEf2XRHt
	NwDaodBCGX2fv2jET8tdm4YJaRalVqM7h8sNaCpFD8npMirpr9rasly6g1ZSJgOHsk9hsu
	h7FVujJp3f2113Vm7t3v4iHQYlttCKw=
Subject: Re: [PATCH v3 1/2] libelf: don't attempt to parse __xen_guest for PVH
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210520123012.89855-1-roger.pau@citrix.com>
 <20210520123012.89855-2-roger.pau@citrix.com>
 <29ecaaaf-d096-e8af-fc6f-292ff2b3d5ae@suse.com>
Message-ID: <6dd3d6fe-04cc-4b9d-e92f-6d4c81785300@suse.com>
Date: Fri, 21 May 2021 15:31:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <29ecaaaf-d096-e8af-fc6f-292ff2b3d5ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.05.2021 14:35, Jan Beulich wrote:
> On 20.05.2021 14:30, Roger Pau Monne wrote:
>> The legacy __xen_guest section doesn't support the PHYS32_ENTRY
>> elfnote, so it's pointless to attempt to parse the elfnotes from that
>> section when called from an hvm container.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v2:
>>  - New in this version.
>> ---
>>  xen/common/libelf/libelf-dominfo.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
>> index 69c94b6f3bb..abea1011c18 100644
>> --- a/xen/common/libelf/libelf-dominfo.c
>> +++ b/xen/common/libelf/libelf-dominfo.c
>> @@ -577,10 +577,8 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
>>  
>>      }
>>  
>> -    /*
>> -     * Finally fall back to the __xen_guest section.
>> -     */
>> -    if ( xen_elfnotes == 0 )
>> +    /* Finally fall back to the __xen_guest section for PV guests only. */
>> +    if ( xen_elfnotes == 0 && !hvm )
> 
> Isn't this depending on the 2nd patch adding the function parameter?
> IOW doesn't this break the build, even if just transiently? With the
> respective hunk from patch 2 moved here
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

With the intention of committing I did this hunk movement, noticing
that
- it's more than just one hunk,
- a tool stack maintainer ack is actually going to be needed (all
  respective hunks are now in the first patch).
I'll keep the massaged patches locally, until the missing ack arrives.

Jan

