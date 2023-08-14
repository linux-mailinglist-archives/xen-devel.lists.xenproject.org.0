Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490BE77B57F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 11:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583523.913750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTsE-0001kO-VT; Mon, 14 Aug 2023 09:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583523.913750; Mon, 14 Aug 2023 09:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTsE-0001ij-SA; Mon, 14 Aug 2023 09:28:30 +0000
Received: by outflank-mailman (input) for mailman id 583523;
 Mon, 14 Aug 2023 09:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVTsD-0001id-55
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 09:28:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea71d9a0-3a84-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 11:28:24 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7E20C4EE0737;
 Mon, 14 Aug 2023 11:28:23 +0200 (CEST)
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
X-Inumbo-ID: ea71d9a0-3a84-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 14 Aug 2023 11:28:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/6] drivers/video: make declarations of defined
 functions available
In-Reply-To: <71a796d3-6808-460f-7abf-10adc07f4329@suse.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
 <d021c6a0-6826-351b-1613-82ec9ad85868@suse.com>
 <fe1c5eeeb01cb2690d80acec2bfdf721@bugseng.com>
 <71a796d3-6808-460f-7abf-10adc07f4329@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <37c94d1d61242c1a9ec1743323e491ed@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2023 10:12, Jan Beulich wrote:
> On 14.08.2023 09:56, Nicola Vetrini wrote:
>> On 14/08/2023 09:47, Jan Beulich wrote:
>>> On 11.08.2023 09:19, Nicola Vetrini wrote:
>>>> --- a/xen/drivers/video/vga.c
>>>> +++ b/xen/drivers/video/vga.c
>>>> @@ -9,6 +9,7 @@
>>>>  #include <xen/mm.h>
>>>>  #include <xen/param.h>
>>>>  #include <xen/vga.h>
>>>> +#include <xen/console.h>
>>> 
>>> xen/vga.h, which you move the declarations to, is already included
>>> here.
>>> Why the need for xen/console.h?
>> 
>> vga.c needs a declaration for fill_console_start_info, which is 
>> declared
>> in console.h, as
>> stated in the commit message (it could be clarified perhaps).
> 
> Ah, I see. It's not very fortunate mixing of two separate adjustments.

Well, they are not so separate, because they both deal with what the 
functions in vga.c need
to be compliant with Rule 8.4.

> But then I'm inclined to ask: When fill_console_start_info() is
> defined in vga.c, wouldn't it make sense to move its declaration to
> vga.h? The more considering the type of its parameter?
> 
> Jan

I see no downside. This change would imply having to include <xen/vga.h> 
in both
- x86/platform_hypercall.c
- x86/pv/dom0_build.c
which seems okay.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

