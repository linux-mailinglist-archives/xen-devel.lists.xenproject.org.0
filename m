Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F0974151
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795954.1205453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so567-0001ns-A7; Tue, 10 Sep 2024 17:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795954.1205453; Tue, 10 Sep 2024 17:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so567-0001mN-67; Tue, 10 Sep 2024 17:56:15 +0000
Received: by outflank-mailman (input) for mailman id 795954;
 Tue, 10 Sep 2024 17:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so565-0001kk-Pd
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:56:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f76f5cb1-6f9d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 19:56:12 +0200 (CEST)
Received: from [192.168.1.20] (host-79-37-206-90.retail.telecomitalia.it
 [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 708874EE07CB;
 Tue, 10 Sep 2024 19:56:11 +0200 (CEST)
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
X-Inumbo-ID: f76f5cb1-6f9d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725990971; bh=PYa0mC+lVOrLiVWAnxc16WP3emnuMFO+766v2q0+rhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=x/8xewRx/xYVVl6O5d8qxrMIZNavko578PLuuU0FAK4ru6/MM+h//a3X5t3RdS7Xd
	 YkdivUWcin3ToIW/9JZkLcsyQ8VePBOOZEeXXdNZl4BIbHdazNhfJy660xNgYxpWBg
	 RiWRYi77jAN36s0JNGaYjX/X05gEV4+o0Pjgjxe3iPWAvTHvMxOPubB6TaTv/ewe6n
	 qZRM6jxLhJCXEOIMTi1g75siCQ0i+9uwv/gdsmrm7wgRToiZn054ypSPoJxzsoy/nR
	 2H4fxLZc+NzwzhubnpNAerUTBvG95QUUdcjgL2xQYfmAW/gnmDpt94CwsB0g1XOgv0
	 dzFi5taWB3ZpQ==
Message-ID: <31c95075-2db3-4084-b89f-4ae3730d2c67@bugseng.com>
Date: Tue, 10 Sep 2024 19:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 06/12] x86/mm: address violations of MISRA C Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <0773f4b5678ee340af201b454e37178e750cbd8d.1725958416.git.federico.serafini@bugseng.com>
 <96062540-8265-4d50-a7d1-767fa608e8ea@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <96062540-8265-4d50-a7d1-767fa608e8ea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/24 16:55, Jan Beulich wrote:
> On 10.09.2024 12:08, Federico Serafini wrote:
>> Address violations of MISRA C:2012 Rule 16.3:
>> "An unconditional `break' statement shall terminate every
>> switch-clause".
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/mm/guest_walk.c     | 1 +
>>   xen/arch/x86/mm/hap/hap.c        | 2 +-
>>   xen/arch/x86/mm/hap/nested_hap.c | 1 +
>>   xen/arch/x86/mm/paging.c         | 2 +-
>>   4 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
>> index fe7393334f..bc032d697c 100644
>> --- a/xen/arch/x86/mm/guest_walk.c
>> +++ b/xen/arch/x86/mm/guest_walk.c
>> @@ -497,6 +497,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>>               paging_mark_dirty(d, gw->l4mfn);
>>               hvmemul_write_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e));
>>           }
>> +        break;
>>   #endif
>>       }
> 
> This wants inserting after the #endif, I think. If you agree, I'm happy to
> adjust while committing. With the adjustment:
> Acked-by: Jan Beulich <jbeulich@suse.com>

You are right, thanks.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

