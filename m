Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D547E581B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 14:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629295.981391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0isL-0000Br-Fn; Wed, 08 Nov 2023 13:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629295.981391; Wed, 08 Nov 2023 13:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0isL-00009X-DE; Wed, 08 Nov 2023 13:45:45 +0000
Received: by outflank-mailman (input) for mailman id 629295;
 Wed, 08 Nov 2023 13:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7seD=GV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0isK-00009R-9K
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 13:45:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c78d8b1-7e3d-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 14:45:43 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B20DC4EE0737;
 Wed,  8 Nov 2023 14:45:42 +0100 (CET)
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
X-Inumbo-ID: 1c78d8b1-7e3d-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 14:45:42 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <49ea5252-b06c-4b2f-8600-c58cbbfb4957@citrix.com>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <49ea5252-b06c-4b2f-8600-c58cbbfb4957@citrix.com>
Message-ID: <a2267b9f513b6943a86b154edc284ed0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-08 14:37, Andrew Cooper wrote:
> On 03/11/2023 5:58 pm, Nicola Vetrini wrote:
>> Static analysis tools may detect a possible null
>> pointer dereference at line 760 (the memcpy call)
>> of xen/common/domain.c. This ASSERT helps them in
>> detecting that such a condition is not possible
>> and also provides a basic sanity check.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> The check may be later improved by proper error checking
>> instead of relying on the semantics explained here:
>> https://lore.kernel.org/xen-devel/61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com/
>> 
>> This addresses the caution reported by ECLAIR for MISRA C:2012 D4.11
>> ---
>>  xen/common/domain.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 8f9ab01c0cb7..9378c0417645 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -700,6 +700,8 @@ struct domain *domain_create(domid_t domid,
>> 
>>      if ( !is_idle_domain(d) )
>>      {
>> +        ASSERT(config);
>> +
>>          watchdog_domain_init(d);
>>          init_status |= INIT_watchdog;
>> 
> 
> I have an idea that might resolve this differently and in an easier 
> way.
> 
> Would you be happy waiting for a couple of days for me to experiment? 
> Absolutely no guarantees of it turning into a workable solution.
> 

Sure, no problem.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

