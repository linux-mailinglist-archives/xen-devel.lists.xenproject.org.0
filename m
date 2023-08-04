Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C276FDFD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577065.903901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrbb-0005WG-9S; Fri, 04 Aug 2023 10:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577065.903901; Fri, 04 Aug 2023 10:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrbb-0005Tc-6R; Fri, 04 Aug 2023 10:00:23 +0000
Received: by outflank-mailman (input) for mailman id 577065;
 Fri, 04 Aug 2023 10:00:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRrbZ-0005TW-EL
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:00:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRrbY-0007Gr-O0; Fri, 04 Aug 2023 10:00:20 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.104.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRrbY-0007Gi-GN; Fri, 04 Aug 2023 10:00:20 +0000
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
	bh=AUdSYoW/av4g7UYR5WlJMgpsOl6GS4o3nE3JsCZ1kXo=; b=wbwSTmDgiQG0f2IcN4nHhic7A5
	Q8eFriT8GR62CMXHb4dFgXz+lxn+4qIgBsJ8hFukaYxc+iuh2HYemvBPc7Ts4O95L5th5ePCD+YRz
	8HZT8OgPLCDFqH6CIBzmTEj/Dn4WGnhXEy6auBGPKyr+TNVeUEAxQBbqV9TByLPeajzk=;
Message-ID: <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
Date: Fri, 4 Aug 2023 11:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/08/2023 10:35, Juergen Gross wrote:
> On 03.08.23 23:46, Julien Grall wrote:
>> Hi,
>>
>> On 24/07/2023 12:02, Juergen Gross wrote:
>>> Today is_valid_nodename() is always called directly after calling
>>> canonicalize(), with the exception of do_unwatch(), where the call
>>> is missing (which is not correct, but results just in a wrong error
>>> reason being returned).
>>
>> While this change makes sense...
>>
>>>
>>> Merge is_valid_nodename() into canonicalize(). While at it merge
>>> valid_chars() into it, too.
>>
>> ... I am not in favor of folding the code is_valid_nodename() and 
>> valid_chars() into canonicalize() because the code is now more 
>> difficult to read. Also, the keeping the split would allow to free the 
>> 'name' in case of an error without adding too much goto in the code.
> 
> I don't think we can easily free name in an error case, at that would 
> require
> to keep knowledge that name was just allocated in the non-canonical case.

How about this:

const char *canonicalize(struct connection *conn, const void *ctx,
                          const char *node, bool allow_special)
{
         const char *prefix;
         const char *name;

         if (!node)
                 return NULL;

         if (node[0] == '@' && !allow_special)
                 return NULL;

         if (!node || (node[0] == '/') || (node[0] == '@'))
                 return node;
         prefix = get_implicit_path(conn);
         if (prefix) {
                 name = talloc_asprintf(ctx, "%s/%s", prefix, node);
                 if (name)
                         return NULL;
         } else
                 name = node;

         if (!is_valid_nodename(conn, node, allow_special)) {
                 /* Release the memory if 'name' was allocated by us */
                 if ( name != node )
                         talloc_free(name);
                 return NULL;
         }

         return name;
}

And before you ask, I don't see the benefits to partially validate the 
name before allocating. Hence why I suggest to keep is_valid_nodename() 
as this keep the function small.

>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V3:
>>> - new patch
>>> ---
>>>   tools/xenstore/xenstored_core.c  | 89 ++++++++++++++------------------
>>>   tools/xenstore/xenstored_core.h  |  6 +--
>>>   tools/xenstore/xenstored_watch.c | 16 ++----
>>>   3 files changed, 45 insertions(+), 66 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c 
>>> b/tools/xenstore/xenstored_core.c
>>> index ea5a1a9cce..ec20bc042d 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -1210,42 +1210,6 @@ void send_ack(struct connection *conn, enum 
>>> xsd_sockmsg_type type)
>>>       send_reply(conn, type, "OK", sizeof("OK"));
>>>   }
>>> -static bool valid_chars(const char *node)
>>> -{
>>> -    /* Nodes can have lots of crap. */
>>> -    return (strspn(node,
>>> -               "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
>>> -               "abcdefghijklmnopqrstuvwxyz"
>>> -               "0123456789-/_@") == strlen(node));
>>> -}
>>> -
>>> -bool is_valid_nodename(const struct connection *conn, const char *node,
>>> -               bool allow_special)
>>> -{
>>> -    int local_off = 0;
>>> -    unsigned int domid;
>>> -
>>> -    /* Must start in / or - if special nodes are allowed - in @. */
>>> -    if (!strstarts(node, "/") && (!allow_special || !strstarts(node, 
>>> "@")))
>>> -        return false;
>>> -
>>> -    /* Cannot end in / (unless it's just "/"). */
>>> -    if (strends(node, "/") && !streq(node, "/"))
>>> -        return false;
>>> -
>>> -    /* No double //. */
>>> -    if (strstr(node, "//"))
>>> -        return false;
>>> -
>>> -    if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
>>> -        local_off = 0;
>>> -
>>> -    if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off))
>>> -        return false;
>>> -
>>> -    return valid_chars(node);
>>> -}
>>> -
>>>   /* We expect one arg in the input: return NULL otherwise.
>>>    * The payload must contain exactly one nul, at the end.
>>>    */
>>> @@ -1279,16 +1243,46 @@ static char *perms_to_strings(const void 
>>> *ctx, const struct node_perms *perms,
>>>   }
>>>   const char *canonicalize(struct connection *conn, const void *ctx,
>>> -             const char *node)
>>> +             const char *node, bool allow_special)
>>>   {
>>> -    const char *prefix;
>>> +    char *name;
>>> +    int local_off = 0;
>>> +    unsigned int domid;
>>> -    if (!node || (node[0] == '/') || (node[0] == '@'))
>>> -        return node;
>>> -    prefix = get_implicit_path(conn);
>>> -    if (prefix)
>>> -        return talloc_asprintf(ctx, "%s/%s", prefix, node);
>>> -    return node;
>>> +    errno = EINVAL;
>>> +    if (!node)
>>> +        return NULL;
>>> +
>>> +    if (strspn(node, 
>>> "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
>>> +             "0123456789-/_@") != strlen(node))
>>> +        return NULL;
>>> +
>>> +    if (node[0] == '@' && !allow_special)
>>> +        return NULL;
>>> +
>>> +    if (node[0] != '/' && node[0] != '@') {
>>> +        name = talloc_asprintf(ctx, "%s/%s", get_implicit_path(conn),
>>> +                       node);
>>
>> This is allocated but not freed on error. I understand this is part of 
>> the 'ctxt' and therefore will be free later on. But this means 
>> temporary memory will be allocated for longer. So best to clean-up 
>> when you can.
> 
> Really?

Let me reply with a different question. Why should we keep the memory 
allocated longer than necessary?

> 
> It is possible, of course, but it is adding more code churn. Remember that
> "name" is allocated only in case of a relative path, so freeing it needs
> to be conditional, too (yes, it would be possible via comparing name to 
> node).

See above, a proposal.

> 
> In case you want me to go this route, I can rearrange the code in order to
> avoid multiple error exits by having only one large if () testing for all
> possible violations.
> 
>>
>>> +        if (!name)
>>> +            return NULL;
>>> +    } else
>>> +        name = (char *)node;
>>
>> Why does name need to be const?
> 
> I think the question was posed in a wrong way. :-)

Whoops yes.

> 
> I'll change name to be const char *.

Cheers,

-- 
Julien Grall

