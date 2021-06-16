Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82C3A9C10
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143226.264036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVg8-0002vP-2p; Wed, 16 Jun 2021 13:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143226.264036; Wed, 16 Jun 2021 13:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVg7-0002tX-Vt; Wed, 16 Jun 2021 13:33:59 +0000
Received: by outflank-mailman (input) for mailman id 143226;
 Wed, 16 Jun 2021 13:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cid=LK=suse.de=bwiedemann@srs-us1.protection.inumbo.net>)
 id 1ltVg5-0002tR-SQ
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 13:33:58 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30d56e2a-8a82-4726-8d30-17f97bd34d25;
 Wed, 16 Jun 2021 13:33:56 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 935BA1FD49;
 Wed, 16 Jun 2021 13:33:55 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 472A0118DD;
 Wed, 16 Jun 2021 13:33:55 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ZslqDcP9yWAZPAAALh3uQQ
 (envelope-from <bwiedemann@suse.de>); Wed, 16 Jun 2021 13:33:55 +0000
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
X-Inumbo-ID: 30d56e2a-8a82-4726-8d30-17f97bd34d25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623850435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNUQ0UpcanY9AJLSfsSp40lFAXfaXAy8ZdLMbo45tPM=;
	b=ZyZuKCYSoguVYz09Mrm04YTMpRRBSorz0ed/y4k5eMopfsZBgTmaMZiIEB3XvE6jTg5bsC
	178ror+AAAN6Sb2s3mZ8bmxbqPqsIKLPfF40kyGqOXi/c/AN77myl5xQHbQc3Mbqd8XagU
	FlM4cXJqc70Mk+43EgZ/d5RECG6WQxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623850435;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNUQ0UpcanY9AJLSfsSp40lFAXfaXAy8ZdLMbo45tPM=;
	b=MTFkNflY/DCn0F6d01qpwu9NTNpXm3DpTvuz7jMtP7hUDFpT6KKzEq2rKiN0g0thy6yXhU
	C/bvS3eUOcKMl1AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623850435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNUQ0UpcanY9AJLSfsSp40lFAXfaXAy8ZdLMbo45tPM=;
	b=ZyZuKCYSoguVYz09Mrm04YTMpRRBSorz0ed/y4k5eMopfsZBgTmaMZiIEB3XvE6jTg5bsC
	178ror+AAAN6Sb2s3mZ8bmxbqPqsIKLPfF40kyGqOXi/c/AN77myl5xQHbQc3Mbqd8XagU
	FlM4cXJqc70Mk+43EgZ/d5RECG6WQxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623850435;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNUQ0UpcanY9AJLSfsSp40lFAXfaXAy8ZdLMbo45tPM=;
	b=MTFkNflY/DCn0F6d01qpwu9NTNpXm3DpTvuz7jMtP7hUDFpT6KKzEq2rKiN0g0thy6yXhU
	C/bvS3eUOcKMl1AA==
To: Olaf Hering <olaf@aepfle.de>, Michael Brown <mcb30@ipxe.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210615212613.6270-1-olaf@aepfle.de>
 <b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
 <20210616145846.305d3ce1.olaf@aepfle.de>
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC11
Message-ID: <fe5ac73a-6026-6db6-6756-911f803adc5f@suse.de>
Date: Wed, 16 Jun 2021 15:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616145846.305d3ce1.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

So this means, CentOS7 binutils has
9cb80f72d8b from 2011-12-21
but not
git blame binutils/objcopy.c|grep enable-determini
955d0b3bd75 (Roland McGrath       2013-01-07 17:40:59 +0000  549)   -D
--enable-deterministic-archives\n\
2e30cb575a1 (Cary Coutant         2012-04-25 17:50:14 +0000  555)   -D
--enable-deterministic-archives\n\


one way out could be to call objcopy -D $PARAMS || objcopy $PARAMS




On 16/06/2021 14.58, Olaf Hering wrote:
> Please revert bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e in ipxe.git, CentOS 7 apparently fails to handle '-D'.
> 
> It worked in my testing with SLE12SP5 and SLE15SP3 as a base system.
> 
> See below.
> 
> 
> I guess for xen.git, updating to just bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e^ will be good enough.
> 
> Olaf
> 
> Am Wed, 16 Jun 2021 13:33:52 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
> 
>> On 15/06/2021 22:26, Olaf Hering wrote:
>>> Use a snapshot which includes commit
>>> f3f568e382a5f19824b3bfc6081cde39eee661e8 ("[crypto] Add
>>> memory output constraints for big-integer inline assembly"),
>>> which fixes build with gcc11.
>>>
>>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>>> ---
>>>  tools/firmware/etherboot/Makefile | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
>>> index ed9e11305f..23b3f6ca9d 100644
>>> --- a/tools/firmware/etherboot/Makefile
>>> +++ b/tools/firmware/etherboot/Makefile
>>> @@ -10,7 +10,8 @@ else
>>>  IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
>>>  endif
>>>  
>>> -IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
>>> +# put an updated tar.gz on xenbits after changes to this variable
>>> +IPXE_GIT_TAG := bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e
>>
>> CI says no.
>>
>> Gitlab CI is currently fairly red because of a clang build fix which
>> hasn't made its way into master yet, but this job:
>>
>>   https://gitlab.com/xen-project/patchew/xen/-/jobs/1349871230
>>
>> shows a real failure on CentOS 7.
>>
>> ...
>>   [VERSION] bin/version.rtl8139.rom.o
>>   [AR] bin/blib.a
>> ar: creating bin/blib.a
>> objcopy: invalid option -- 'D'
>> Usage: objcopy [option(s)] in-file [out-file]
>> ...
>>
>> ~Andrew
> 

