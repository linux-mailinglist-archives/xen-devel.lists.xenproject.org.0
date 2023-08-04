Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09776FE94
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577088.903952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRs7U-0002q4-N8; Fri, 04 Aug 2023 10:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577088.903952; Fri, 04 Aug 2023 10:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRs7U-0002oK-KP; Fri, 04 Aug 2023 10:33:20 +0000
Received: by outflank-mailman (input) for mailman id 577088;
 Fri, 04 Aug 2023 10:33:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRs7S-0002oE-L5
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:33:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRs7R-0007zJ-MG; Fri, 04 Aug 2023 10:33:17 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.104.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRs7R-00006G-Fs; Fri, 04 Aug 2023 10:33:17 +0000
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
	bh=i5i3A0jW9drB3euuJ61j+0z5/5MW6KwEZ/0NENb6JkM=; b=Iz2GQ0CrK+47yFKEig/WYl5Wy2
	USAUWqIX/UNw/Ja++/Z4F9lGBj3BKX7Z9zbCkAQgHvMV5qhoYOMSA1ipgQqtnypfg+vdFzNv0mRXy
	j6p9NpN6eXi9167b82S1jp2mSlS+QsSbKLr6ym7HOOdxXrk2fTHY+limQV8mA7WV73B8=;
Message-ID: <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
Date: Fri, 4 Aug 2023 11:33:15 +0100
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
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
 <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 04/08/2023 11:17, Juergen Gross wrote:
> On 04.08.23 12:00, Julien Grall wrote:
>> Hi,
>>
>> On 04/08/2023 10:35, Juergen Gross wrote:
>>> On 03.08.23 23:46, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 24/07/2023 12:02, Juergen Gross wrote:
>>>>> Today is_valid_nodename() is always called directly after calling
>>>>> canonicalize(), with the exception of do_unwatch(), where the call
>>>>> is missing (which is not correct, but results just in a wrong error
>>>>> reason being returned).
>>>>
>>>> While this change makes sense...
>>>>
>>>>>
>>>>> Merge is_valid_nodename() into canonicalize(). While at it merge
>>>>> valid_chars() into it, too.
>>>>
>>>> ... I am not in favor of folding the code is_valid_nodename() and 
>>>> valid_chars() into canonicalize() because the code is now more 
>>>> difficult to read. Also, the keeping the split would allow to free 
>>>> the 'name' in case of an error without adding too much goto in the 
>>>> code.
>>>
>>> I don't think we can easily free name in an error case, at that would 
>>> require
>>> to keep knowledge that name was just allocated in the non-canonical 
>>> case.
>>
>> How about this:
>>
>> const char *canonicalize(struct connection *conn, const void *ctx,
>>                           const char *node, bool allow_special)
>> {
>>          const char *prefix;
>>          const char *name;
>>
>>          if (!node)
>>                  return NULL;
>>
>>          if (node[0] == '@' && !allow_special)
>>                  return NULL;
>>
>>          if (!node || (node[0] == '/') || (node[0] == '@'))
>>                  return node;
>>          prefix = get_implicit_path(conn);
>>          if (prefix) {
>>                  name = talloc_asprintf(ctx, "%s/%s", prefix, node);
>>                  if (name)
>>                          return NULL;
>>          } else
>>                  name = node;
>>
>>          if (!is_valid_nodename(conn, node, allow_special)) {
>>                  /* Release the memory if 'name' was allocated by us */
>>                  if ( name != node )
>>                          talloc_free(name);
>>                  return NULL;
>>          }
>>
>>          return name;
>> }
>>
>> And before you ask, I don't see the benefits to partially validate the 
>> name before allocating. Hence why I suggest to keep 
>> is_valid_nodename() as this keep the function small.
> 
> Partially validating before doing the allocation is a benefit as it doesn't
> spend cycles on validating the known good prefix.

Which is pretty much a drop in the ocean in the context of Xenstored :). 
In reality most of the validation can be done before the allocation with 
a bit of work.

> 
> Additionally your example won't validate an absolute pathname at all.

That's an error in the logic. This can be sorted out.

> 
> What about this variant:

I still don't see the value of folding is_valid_node_name(). But if the 
other agrees with you then...

> 
> const char *canonicalize(struct connection *conn, const void *ctx,
>                           const char *node, bool allow_special)
> {
>          const char *name;
>          int local_off = 0;
>          unsigned int domid;
> 
>          /*
>           * Invalid if any of:
>           * - no node at all
>           * - illegal character in node
>           * - starts with '@' but no special node allowed
>           */
>          errno = EINVAL;
>          if (!node ||
>              strspn(node, 
> "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
>                           "0123456789-/_@") != strlen(node) ||

... I would rather keep calling valid_chars() here. The rest looks fine 
even though this is definitely not my preference.

>              (node[0] == '@' && !allow_special))
>                  return NULL;
> 
>          if (node[0] != '/' && node[0] != '@') {
>                  name = talloc_asprintf(ctx, "%s/%s", 
> get_implicit_path(conn),
>                                         node);
>                  if (!name)
>                          return NULL;
>          } else
>                  name = node;
> 
>          if (sscanf(name, "/local/domain/%5u/%n", &domid, &local_off) != 1)
>                  local_off = 0;
> 
>          /*
>           * Only valid if:
>           * - doesn't end in / (unless it's just "/")
>           * - no double //
>           * - not violating max allowed path length
>           */
>          if (!(strends(name, "/") && !streq(name, "/")) &&
>              !strstr(name, "//") &&
>              !domain_max_chk(conn, ACC_PATHLEN, strlen(name) - local_off))
>                  return name;
> 
>          /* Release the memory if 'name' was allocated by us. */
>          if (name != node)
>                  talloc_free(name);
>          return NULL;
> }

Cheers,

-- 
Julien Grall

