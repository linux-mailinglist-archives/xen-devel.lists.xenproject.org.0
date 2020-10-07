Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD3285F78
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 14:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3487.9973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ8p3-00029T-DP; Wed, 07 Oct 2020 12:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3487.9973; Wed, 07 Oct 2020 12:45:33 +0000
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
	id 1kQ8p3-000294-93; Wed, 07 Oct 2020 12:45:33 +0000
Received: by outflank-mailman (input) for mailman id 3487;
 Wed, 07 Oct 2020 12:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ8p2-00028z-7b
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:45:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8f494f3-7cb3-4e5e-8db1-ca818a68ba8e;
 Wed, 07 Oct 2020 12:45:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C18ECAB5C;
 Wed,  7 Oct 2020 12:45:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ8p2-00028z-7b
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:45:32 +0000
X-Inumbo-ID: b8f494f3-7cb3-4e5e-8db1-ca818a68ba8e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b8f494f3-7cb3-4e5e-8db1-ca818a68ba8e;
	Wed, 07 Oct 2020 12:45:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602074729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWF1yRt0kN+PEK237vryMnLfWYYGc5wFoG+ssNdfOfU=;
	b=lFXucfJkjm5jSKkOkT18HGmtk61c5Nh26UO5C1tPSB7BD3Eil7iK6EU5k3rzKdqmhKbL8A
	xxPV7mv/tSmUYEVQvOEL5QSt4oNrEan9/NShYkWQi9FQ9WHJZLKb+YNji6K4NAzg/yeYxR
	z2dNnGGo58qFpB/7Cka7C0Yf8og4zHs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C18ECAB5C;
	Wed,  7 Oct 2020 12:45:29 +0000 (UTC)
Subject: Re: [PATCH 3/5] tools/libs/store: drop read-only functionality
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20201002154141.11677-1-jgross@suse.com>
 <20201002154141.11677-4-jgross@suse.com>
 <20201007105448.c7scd5hoellddfwd@liuwe-devbox-debian-v2>
 <d03ef7db-8752-ac00-99f1-6c40f62e1162@suse.com>
 <f4b6a87c-ac65-cb3e-d4b2-4504340b81e3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <72542057-f5d8-99d5-55d9-2a21b7cb2d93@suse.com>
Date: Wed, 7 Oct 2020 14:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f4b6a87c-ac65-cb3e-d4b2-4504340b81e3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.10.20 13:50, Andrew Cooper wrote:
> On 07/10/2020 11:57, Jürgen Groß wrote:
>> On 07.10.20 12:54, Wei Liu wrote:
>>> On Fri, Oct 02, 2020 at 05:41:39PM +0200, Juergen Gross wrote:
>>>> Today it is possible to open the connection in read-only mode via
>>>> xs_daemon_open_readonly(). This is working only with Xenstore running
>>>> as a daemon in the same domain as the user. Additionally it doesn't
>>>> add any security as accessing the socket used for that functionality
>>>> requires the same privileges as the socket used for full Xenstore
>>>> access.
>>>>
>>>> So just drop the read-only semantics in all cases, leaving the
>>>> interface existing only for compatibility reasons. This in turn
>>>> requires to just ignore the XS_OPEN_READONLY flag.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>>    tools/libs/store/include/xenstore.h | 8 --------
>>>>    tools/libs/store/xs.c               | 7 ++-----
>>>>    2 files changed, 2 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/tools/libs/store/include/xenstore.h
>>>> b/tools/libs/store/include/xenstore.h
>>>> index cbc7206a0f..158e69ef83 100644
>>>> --- a/tools/libs/store/include/xenstore.h
>>>> +++ b/tools/libs/store/include/xenstore.h
>>>> @@ -60,15 +60,12 @@ typedef uint32_t xs_transaction_t;
>>>>    /* Open a connection to the xs daemon.
>>>>     * Attempts to make a connection over the socket interface,
>>>>     * and if it fails, then over the  xenbus interface.
>>>> - * Mode 0 specifies read-write access, XS_OPEN_READONLY for
>>>> - * read-only access.
>>>>     *
>>>>     * * Connections made with xs_open(0) (which might be shared page or
>>>>     *   socket based) are only guaranteed to work in the parent after
>>>>     *   fork.
>>>>     * * xs_daemon_open*() and xs_domain_open() are deprecated synonyms
>>>>     *   for xs_open(0).
>>>> - * * XS_OPEN_READONLY has no bearing on any of this.
>>>>     *
>>>>     * Returns a handle or NULL.
>>>>     */
>>>> @@ -83,11 +80,6 @@ void xs_close(struct xs_handle *xsh /* NULL ok */);
>>>>     */
>>>>    struct xs_handle *xs_daemon_open(void);
>>>>    struct xs_handle *xs_domain_open(void);
>>>> -
>>>> -/* Connect to the xs daemon (readonly for non-root clients).
>>>> - * Returns a handle or NULL.
>>>> - * Deprecated, please use xs_open(XS_OPEN_READONLY) instead
>>>> - */
>>>>    struct xs_handle *xs_daemon_open_readonly(void);
>>>>      /* Close the connection to the xs daemon.
>>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>>> index 320734416f..4ac73ec317 100644
>>>> --- a/tools/libs/store/xs.c
>>>> +++ b/tools/libs/store/xs.c
>>>> @@ -302,7 +302,7 @@ struct xs_handle *xs_daemon_open(void)
>>>>      struct xs_handle *xs_daemon_open_readonly(void)
>>>>    {
>>>> -    return xs_open(XS_OPEN_READONLY);
>>>> +    return xs_open(0);
>>>>    }
>>>
>>> This changes the semantics of this function, isn't it? In that the user
>>> expects a readonly connection but in fact a read-write connection is
>>> returned.
>>>
>>> Maybe we should return an error here?
>>
>> No, as the behavior is this way already if any of the following is true:
>>
>> - a guest is opening the connection
>> - Xenstore is running in a stubdom
>> - oxenstored is being used
> 
> Right, and these are just some of the reasons why dropping the R/O
> socket is a sensible thing to do.
> 
> However, I do think xenstore.h needs large disclaimers next to the
> relevant constants and functions that both XS_OPEN_* flags are now
> obsolete and ignored (merged into appropriate patches in the series).

Fine with me.


Juergen


