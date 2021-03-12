Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89C338E98
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 14:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97101.184254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhgl-0001AQ-2c; Fri, 12 Mar 2021 13:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97101.184254; Fri, 12 Mar 2021 13:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhgk-0001A1-VK; Fri, 12 Mar 2021 13:18:46 +0000
Received: by outflank-mailman (input) for mailman id 97101;
 Fri, 12 Mar 2021 13:18:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKhgj-00019w-J7
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:18:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e332d14a-f276-4e33-b902-34eabe31da73;
 Fri, 12 Mar 2021 13:18:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F106AF4D;
 Fri, 12 Mar 2021 13:18:43 +0000 (UTC)
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
X-Inumbo-ID: e332d14a-f276-4e33-b902-34eabe31da73
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615555123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUfjyU7YmCpl1tB6qq8jEeha7KvF4k+/iVu3tJ6jnMU=;
	b=nLdA8ybP40ksHs76pgaqJ8XixDl9v+FfxEyYVvqf0nqa18exXNOVDc8RMhf9ZA2zf9atDS
	5EgX+GjoLhPpOOUB06u2O/bV9fsOX7tHlref5KGPk2niJ7ncGRXcGZ5dzm2J9tgYvzLc4c
	Mq+aAUjNVSmHm7T/ZOKwyOKcg855B14=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
 <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
Message-ID: <24c07e5f-4ca4-95cd-503d-2dd87579ee5c@suse.com>
Date: Fri, 12 Mar 2021 14:18:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.03.2021 14:08, Jan Beulich wrote:
> On 12.03.2021 12:32, Andrew Cooper wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4059,6 +4059,16 @@ int gnttab_acquire_resource(
>>      if ( rc )
>>          goto out;
>>  
>> +    /*
>> +     * Some older toolchains can't spot that vaddrs is non-NULL on
>> non-error
>> +     * paths.  Leave some runtime safety.
>> +     */
>> +    if ( !vaddrs )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        goto out;
>> +    }
>> +
>>      for ( i = 0; i < nr_frames; ++i )
>>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
> 
> Oh, I didn't realize this. Will add, but did you really mean to
> have the function return success in this case (on a release
> build)? I'd be inclined to put it ahead of if "if ( rc )" and
> set rc (to e.g. -ENODATA) in this case.

But I think the comment isn't really correct - the problem isn't
NULL or not, but uninitialized without setting it to NULL. How
about

    /*
     * Some older toolchains can't spot that vaddrs won't remain uninitialized
     * on non-error paths, and hence it needs setting to NULL at the top of the
     * function.  Leave some runtime safety.
     */

?

Jan

