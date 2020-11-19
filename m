Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895822B904F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:44:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30593.60728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfhQR-0002A1-5z; Thu, 19 Nov 2020 10:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30593.60728; Thu, 19 Nov 2020 10:44:27 +0000
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
	id 1kfhQR-00029c-2n; Thu, 19 Nov 2020 10:44:27 +0000
Received: by outflank-mailman (input) for mailman id 30593;
 Thu, 19 Nov 2020 10:44:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfhQP-00029X-KR
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:44:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f966afc-7310-4ac1-94b4-2d0eb4304aba;
 Thu, 19 Nov 2020 10:44:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19745ACBA;
 Thu, 19 Nov 2020 10:44:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfhQP-00029X-KR
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:44:25 +0000
X-Inumbo-ID: 3f966afc-7310-4ac1-94b4-2d0eb4304aba
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3f966afc-7310-4ac1-94b4-2d0eb4304aba;
	Thu, 19 Nov 2020 10:44:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605782663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=us09E1uDgSD5oB0WgVAYFdVn4vjHFq+Sxej+KHinsUE=;
	b=BBOXlw+CPKXQE+kXujmWCHYYuds27F5djntIlfgWoKBgWTO+y3mAvS3lDoYj4bGnLJdz5T
	ybPT4isdRFHm1k5DEWuxBOJhuox+BCw+I1x4E/cAUuMt4FFP7zGsfBWNOiO/C4BS0ceBmu
	6Cv9KyfMrKoQ6Wy7kv8YDw8DG/OkNHc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 19745ACBA;
	Thu, 19 Nov 2020 10:44:23 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] lib: collect library files in an archive
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <78dccec2-064f-d4b1-1865-eb3f1f14247a@suse.com>
 <8ff6d14d-fb3f-79d0-888a-3da2b68d1aad@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36e5b417-bd6c-8e94-9b95-aec7a5dc6e31@suse.com>
Date: Thu, 19 Nov 2020 11:44:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <8ff6d14d-fb3f-79d0-888a-3da2b68d1aad@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 18:31, Julien Grall wrote:
> On 23/10/2020 11:17, Jan Beulich wrote:
>> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
>> just to avoid bloating binaries when only some arch-es and/or
>> configurations need generic library routines, combine objects under lib/
>> into an archive, which the linker then can pick the necessary objects
>> out of.
>>
>> Note that we can't use thin archives just yet, until we've raised the
>> minimum required binutils version suitably.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   xen/Rules.mk          | 33 +++++++++++++++++++++++++++------
>>   xen/arch/arm/Makefile |  6 +++---
>>   xen/arch/x86/Makefile |  8 ++++----
>>   xen/lib/Makefile      |  3 ++-
>>   4 files changed, 36 insertions(+), 14 deletions(-)
> 
> I can't build Xen on Arm after this patch:
> 
>    AR      lib.a
> aarch64-linux-gnu-ld    -EL  -r -o built_in.o
> aarch64-linux-gnu-ld: no input files
> /home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/Rules.mk:154: recipe for 
> target 'built_in.o' failed

Oh, indeed, this triggers a pre-existing bug. I didn't notice it
because for Arm I build-tested only the series as a whole. Will
add a fix for the issue as prereq patch.

Thanks for noticing,
Jan

