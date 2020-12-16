Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59782DC460
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 17:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55345.96471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZnI-000680-IZ; Wed, 16 Dec 2020 16:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55345.96471; Wed, 16 Dec 2020 16:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZnI-00067b-FD; Wed, 16 Dec 2020 16:36:52 +0000
Received: by outflank-mailman (input) for mailman id 55345;
 Wed, 16 Dec 2020 16:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZEz=FU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpZnH-00067T-7H
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 16:36:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9affa49e-fc23-4965-a64e-119840d108ab;
 Wed, 16 Dec 2020 16:36:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C57FACBD;
 Wed, 16 Dec 2020 16:36:48 +0000 (UTC)
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
X-Inumbo-ID: 9affa49e-fc23-4965-a64e-119840d108ab
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608136608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQH3sfUNlgwjFpO8zC7ngq+VaMEQ8WGlQc8Sc++NJsA=;
	b=RbhaTE/IsGVCvcRsOmEy8x+Iq/SaKJTmse/Z3uznae4Va3A8vwJM9DGmDFBn4Jfn8XwkH/
	2GghH8n7inq2uEgYxekvD7ZWFI5YjEo01jilS6HzuvK+BSM4qSldks3V5dV2HXdvbDCOuz
	Llz+qHdPYtEQR6g7OZZJtpGB43+33pw=
Subject: Re: [PATCH v3 3/8] xen/hypfs: add new enter() and exit() per node
 callbacks
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-4-jgross@suse.com>
 <36469295-8c77-0e58-654a-35fd992c11a1@suse.com>
 <aad9131f-ca42-94b4-1ce2-18c6db0ac381@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <227825e7-d704-fd36-a327-1dbd6aa391c8@suse.com>
Date: Wed, 16 Dec 2020 17:36:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aad9131f-ca42-94b4-1ce2-18c6db0ac381@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.12.2020 17:24, Jürgen Groß wrote:
> On 16.12.20 17:16, Jan Beulich wrote:
>> On 09.12.2020 17:09, Juergen Gross wrote:
>>> In order to better support resource allocation and locking for dynamic
>>> hypfs nodes add enter() and exit() callbacks to struct hypfs_funcs.
>>>
>>> The enter() callback is called when entering a node during hypfs user
>>> actions (traversing, reading or writing it), while the exit() callback
>>> is called when leaving a node (accessing another node at the same or a
>>> higher directory level, or when returning to the user).
>>>
>>> For avoiding recursion this requires a parent pointer in each node.
>>> Let the enter() callback return the entry address which is stored as
>>> the last accessed node in order to be able to use a template entry for
>>> that purpose in case of dynamic entries.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - new patch
>>>
>>> V3:
>>> - add ASSERT(entry); (Jan Beulich)
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   xen/common/hypfs.c      | 80 +++++++++++++++++++++++++++++++++++++++++
>>>   xen/include/xen/hypfs.h |  5 +++
>>>   2 files changed, 85 insertions(+)
>>>
>>> diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
>>> index 6f822ae097..f04934db10 100644
>>> --- a/xen/common/hypfs.c
>>> +++ b/xen/common/hypfs.c
>>> @@ -25,30 +25,40 @@ CHECK_hypfs_dirlistentry;
>>>        ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
>>>   
>>>   const struct hypfs_funcs hypfs_dir_funcs = {
>>> +    .enter = hypfs_node_enter,
>>> +    .exit = hypfs_node_exit,
>>>       .read = hypfs_read_dir,
>>>       .write = hypfs_write_deny,
>>>       .getsize = hypfs_getsize,
>>>       .findentry = hypfs_dir_findentry,
>>>   };
>>>   const struct hypfs_funcs hypfs_leaf_ro_funcs = {
>>> +    .enter = hypfs_node_enter,
>>> +    .exit = hypfs_node_exit,
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_deny,
>>>       .getsize = hypfs_getsize,
>>>       .findentry = hypfs_leaf_findentry,
>>>   };
>>>   const struct hypfs_funcs hypfs_leaf_wr_funcs = {
>>> +    .enter = hypfs_node_enter,
>>> +    .exit = hypfs_node_exit,
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_leaf,
>>>       .getsize = hypfs_getsize,
>>>       .findentry = hypfs_leaf_findentry,
>>>   };
>>>   const struct hypfs_funcs hypfs_bool_wr_funcs = {
>>> +    .enter = hypfs_node_enter,
>>> +    .exit = hypfs_node_exit,
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_bool,
>>>       .getsize = hypfs_getsize,
>>>       .findentry = hypfs_leaf_findentry,
>>>   };
>>>   const struct hypfs_funcs hypfs_custom_wr_funcs = {
>>> +    .enter = hypfs_node_enter,
>>> +    .exit = hypfs_node_exit,
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_custom,
>>>       .getsize = hypfs_getsize,
>>> @@ -63,6 +73,8 @@ enum hypfs_lock_state {
>>>   };
>>>   static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
>>>   
>>> +static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_entered);
>>> +
>>>   HYPFS_DIR_INIT(hypfs_root, "");
>>>   
>>>   static void hypfs_read_lock(void)
>>> @@ -100,11 +112,59 @@ static void hypfs_unlock(void)
>>>       }
>>>   }
>>>   
>>> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
>>> +{
>>> +    return entry;
>>> +}
>>> +
>>> +void hypfs_node_exit(const struct hypfs_entry *entry)
>>> +{
>>> +}
>>> +
>>> +static int node_enter(const struct hypfs_entry *entry)
>>> +{
>>> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
>>> +
>>> +    entry = entry->funcs->enter(entry);
>>> +    if ( IS_ERR(entry) )
>>> +        return PTR_ERR(entry);
>>> +
>>> +    ASSERT(entry);
>>> +    ASSERT(!*last || *last == entry->parent);
>>> +
>>> +    *last = entry;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void node_exit(const struct hypfs_entry *entry)
>>> +{
>>> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
>>> +
>>> +    if ( !*last )
>>> +        return;
>>
>> To my question regarding this in v2 you replied
>>
>> "I rechecked and have found that this was a remnant from an earlier
>>   variant. *last won't ever be NULL, so the if can be dropped (a NULL
>>   will be catched by the following ASSERT())."
>>
>> Now this if() is still there. Why?
> 
> I really thought I did remove the if(). Seems as if I did that on
> my test machine only and not in my git tree. Sorry for that.

So should I drop it while committing and adding
Reviewed-by: Jan Beulich <jbeulich@suse.com>
?

Jan

