Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B372AF431
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24994.52529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrY1-0005Cm-Au; Wed, 11 Nov 2020 14:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24994.52529; Wed, 11 Nov 2020 14:56:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrY1-0005CN-7l; Wed, 11 Nov 2020 14:56:33 +0000
Received: by outflank-mailman (input) for mailman id 24994;
 Wed, 11 Nov 2020 14:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcrY0-0005CI-3d
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:56:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 731c2158-0509-4b89-b917-84741edeb113;
 Wed, 11 Nov 2020 14:56:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8763BAC82;
 Wed, 11 Nov 2020 14:56:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcrY0-0005CI-3d
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:56:32 +0000
X-Inumbo-ID: 731c2158-0509-4b89-b917-84741edeb113
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 731c2158-0509-4b89-b917-84741edeb113;
	Wed, 11 Nov 2020 14:56:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605106590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuBmGDUwTqtZ2R7oR1kUVhRcvTDdyhHiiXws3ny2u/A=;
	b=Vf7jnXs8apupPg07yG1/5CRecJnZle5MCJMZPIkI3TRTRlNHN+V0qnCHTmjc++9mzDnol5
	/Tg3Sy5hJASkjnWhF+moTnYcjKQdYsPoL2PgZu/K9HmfRvbXF32HEszec6Vd3GLfc8puQU
	Ks1xeMDZNWzl/vsY/PGSjgd16J+oJek=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8763BAC82;
	Wed, 11 Nov 2020 14:56:30 +0000 (UTC)
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-11-jgross@suse.com>
 <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b2cf5d0-9c6d-07bd-51d3-9fd34cd8d1a5@suse.com>
Date: Wed, 11 Nov 2020 15:56:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.11.2020 15:51, Dario Faggioli wrote:
> On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
>> Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
>> dynamic, so the related hypfs access functions need to be
>> implemented.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
> So, I'm almost sold... Just one comment:
> 
>> --- a/xen/common/sched/cpupool.c
>> +++ b/xen/common/sched/cpupool.c
>> @@ -999,6 +1073,10 @@ static int __init cpupool_init(void)
>>  
>>      cpupool_gran_init();
>>  
>> +#ifdef CONFIG_HYPFS
>> +    hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
>> +#endif
>> +
> What would you think about doing this in an helper function
> (hypfs_cpupool_init() ?), implemented inside the above #ifdef and as an
> empty stub if !CONFIG_HYPFS ?
> 
> That will save us from having the #ifdef-s again here.

Having a hypfs_add_dir() stub would also allow to achieve this, and
then, going forward, perhaps also elsewhere.

Jan

