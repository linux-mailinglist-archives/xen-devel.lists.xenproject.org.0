Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82184969A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675726.1051126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvNs-0006MJ-JF; Mon, 05 Feb 2024 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675726.1051126; Mon, 05 Feb 2024 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvNs-0006Js-GB; Mon, 05 Feb 2024 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 675726;
 Mon, 05 Feb 2024 09:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rWvNq-0006Jm-CZ
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:35:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWvNp-0001TZ-PK; Mon, 05 Feb 2024 09:35:21 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWvNp-0002Fp-HJ; Mon, 05 Feb 2024 09:35:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=PP1+qCJlAuvRneLYsJZF3rvQSzbheGF6lMKfJbyQ5Nw=; b=EF+ix0/5o266rNdOct2qWjC/Is
	LNtjevm5gpyp3QDDkBJXzoM97MvHUFkNQesfT0I8133X46XHAHfAu7jO+hh9GEoViH97JCKISB12V
	gfOvhp5LWI1pHf8fQjlTh39sYBAA44trPqGGwVv1nFu50U1blopv4lKeuCZh5tjzirtw=;
Message-ID: <916f4c54-c045-44d9-bff1-bec93936710a@xen.org>
Date: Mon, 5 Feb 2024 09:35:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/33] tools/xenstored: move all socket handling into
 posix.c
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-26-jgross@suse.com>
 <dcc477bd-b7cf-40e8-85be-3cde5b9cfd61@xen.org>
 <6abe490f-c8c5-4a7c-9ca0-0ef71845d576@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6abe490f-c8c5-4a7c-9ca0-0ef71845d576@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 05/02/2024 08:07, Juergen Gross wrote:
> On 26.01.24 17:22, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 04/01/2024 09:00, Juergen Gross wrote:
>>> All of the socket handling is needed only when running as daemon.
>>>
>>> Move it into posix.c, allowing to remove the NO_SOCKETS macro.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V3:
>>> - new patch
>>> ---
>>>   tools/xenstored/Makefile.common |   4 -
>>>   tools/xenstored/core.c          | 156 +-------------------------------
>>>   tools/xenstored/core.h          |   8 +-
>>>   tools/xenstored/domain.c        |   9 +-
>>>   tools/xenstored/minios.c        |   6 ++
>>>   tools/xenstored/posix.c         | 153 +++++++++++++++++++++++++++++++
>>>   6 files changed, 167 insertions(+), 169 deletions(-)
>>>
>>> diff --git a/tools/xenstored/Makefile.common 
>>> b/tools/xenstored/Makefile.common
>>> index 189ab81b8d..ef63ef650c 100644
>>> --- a/tools/xenstored/Makefile.common
>>> +++ b/tools/xenstored/Makefile.common
>>> @@ -16,10 +16,6 @@ CFLAGS += $(CFLAGS_libxenctrl)
>>>   CFLAGS += $(CFLAGS_libxenguest)
>>>   CFLAGS += $(CFLAGS_libxentoolcore)
>>> -ifdef CONFIG_STUBDOM
>>> -CFLAGS += -DNO_SOCKETS=1
>>> -endif
>>> -
>>>   $(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
>>>   xenstored.a: $(XENSTORED_OBJS-y)
>>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>>> index 650c1d1574..8ff1faccef 100644
>>> --- a/tools/xenstored/core.c
>>> +++ b/tools/xenstored/core.c
>>> @@ -20,10 +20,6 @@
>>>   #include <sys/types.h>
>>>   #include <sys/stat.h>
>>>   #include <poll.h>
>>> -#ifndef NO_SOCKETS
>>> -#include <sys/socket.h>
>>> -#include <sys/un.h>
>>> -#endif
>>>   #include <sys/time.h>
>>>   #include <time.h>
>>>   #include <unistd.h>
>>> @@ -61,7 +57,7 @@ static unsigned int current_array_size;
>>>   static unsigned int nr_fds;
>>>   static unsigned int delayed_requests;
>>> -static int sock = -1;
>>> +int sock = -1;
>>
>> Similar comment to 'fds' on the previous patch. This name is quite 
>> generic. Can we either pass it as an argument (or return) or rename it?
> 
> What about to make it local to posix.c and adding a get_socket_fd() 
> function
> for its only usage in core.c (with a related stub in minios.c, of course)?

That looks fine to me in principle.

Cheers,

-- 
Julien Grall

