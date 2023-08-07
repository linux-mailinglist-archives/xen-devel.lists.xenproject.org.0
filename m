Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBD2771D0F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577908.905023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwT1-0006Nb-8k; Mon, 07 Aug 2023 09:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577908.905023; Mon, 07 Aug 2023 09:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwT1-0006LJ-5c; Mon, 07 Aug 2023 09:23:59 +0000
Received: by outflank-mailman (input) for mailman id 577908;
 Mon, 07 Aug 2023 09:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSwSz-0005tu-WE
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:23:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2220a417-3504-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 11:23:56 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 467444EE0737;
 Mon,  7 Aug 2023 11:23:56 +0200 (CEST)
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
X-Inumbo-ID: 2220a417-3504-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 11:23:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
In-Reply-To: <9918b8ef-0629-d8fb-3c58-6b20b56b1a93@suse.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
 <fed4b27c-91ec-7605-1a71-a0b7c6d7e2e2@suse.com>
 <486ba9e1-2bf0-4446-9ac4-33a256f8d51e@xen.org>
 <9918b8ef-0629-d8fb-3c58-6b20b56b1a93@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <43b45003191044cbae170404f6f4ba46@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 11:15, Jan Beulich wrote:
> On 07.08.2023 11:01, Julien Grall wrote:
>> On 07/08/2023 09:14, Jan Beulich wrote:
>>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>>> --- a/xen/include/xen/delay.h
>>>> +++ b/xen/include/xen/delay.h
>>>> @@ -5,6 +5,6 @@
>>>> 
>>>>   #include <asm/delay.h>
>>>>   #define mdelay(n) (\
>>>> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
>>>> +	{unsigned long msec_=(n); while (msec_--) udelay(1000);})
>>> 
>>> As elsewhere, please also adjust style while touching the line, at
>>> least as far as the obviously wrong case goes:
>>> 
>>> #define mdelay(n) (\
>>> 	{unsigned long msec_ = (n); while (msec_--) udelay(1000);})
>>> 
>>> Even better would be
>>> 
>>> #define mdelay(n) ({ \
>>> 	unsigned long msec_ = (n); while (msec_--) udelay(1000); \
>>> })
>> 
>> If you are touching the style, about converting to a staging inline 
>> and
>> also splitting the line in multiple one?
> 
> I'd be happy about this being done, but I wouldn't want to go as far 
> with
> on-commit adjustments. Nicola, are you up to doing so in v2?
> 
> Jan

I'm afraid I don't understand what "staging inline" refers to. Other 
than that, sure thing.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

