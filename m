Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D012DC3DA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 17:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55325.96423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZTt-0003rW-Ud; Wed, 16 Dec 2020 16:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55325.96423; Wed, 16 Dec 2020 16:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZTt-0003r7-R6; Wed, 16 Dec 2020 16:16:49 +0000
Received: by outflank-mailman (input) for mailman id 55325;
 Wed, 16 Dec 2020 16:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZEz=FU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpZTs-0003r2-Az
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 16:16:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8ba603e-181b-41e3-a9c7-ed6cfb341051;
 Wed, 16 Dec 2020 16:16:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E73DAC7B;
 Wed, 16 Dec 2020 16:16:45 +0000 (UTC)
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
X-Inumbo-ID: e8ba603e-181b-41e3-a9c7-ed6cfb341051
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608135405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vfulspyiYTcLTUA37KSOyWnDLJHc/Y2+s317T6X6/g=;
	b=qTKa5QgPfmDDSUDd0DxmwUMmb4gnDDMvehWf3kRjIQrLvoz7fuJc+45Dv/iMn2zP1D/2Oe
	+Elee6up4ioggGHlb2g9OD+/ONMLJAnCxDMd/EXEpqWPdOi7GWQINPS8RWi1SQMj9+vxiw
	4pkUPHa7zo25IYrAK/nEjPzIRJkR4us=
Subject: Re: [PATCH v3 3/8] xen/hypfs: add new enter() and exit() per node
 callbacks
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36469295-8c77-0e58-654a-35fd992c11a1@suse.com>
Date: Wed, 16 Dec 2020 17:16:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209160956.32456-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:09, Juergen Gross wrote:
> In order to better support resource allocation and locking for dynamic
> hypfs nodes add enter() and exit() callbacks to struct hypfs_funcs.
> 
> The enter() callback is called when entering a node during hypfs user
> actions (traversing, reading or writing it), while the exit() callback
> is called when leaving a node (accessing another node at the same or a
> higher directory level, or when returning to the user).
> 
> For avoiding recursion this requires a parent pointer in each node.
> Let the enter() callback return the entry address which is stored as
> the last accessed node in order to be able to use a template entry for
> that purpose in case of dynamic entries.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> 
> V3:
> - add ASSERT(entry); (Jan Beulich)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/hypfs.c      | 80 +++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/hypfs.h |  5 +++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
> index 6f822ae097..f04934db10 100644
> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -25,30 +25,40 @@ CHECK_hypfs_dirlistentry;
>       ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
>  
>  const struct hypfs_funcs hypfs_dir_funcs = {
> +    .enter = hypfs_node_enter,
> +    .exit = hypfs_node_exit,
>      .read = hypfs_read_dir,
>      .write = hypfs_write_deny,
>      .getsize = hypfs_getsize,
>      .findentry = hypfs_dir_findentry,
>  };
>  const struct hypfs_funcs hypfs_leaf_ro_funcs = {
> +    .enter = hypfs_node_enter,
> +    .exit = hypfs_node_exit,
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_deny,
>      .getsize = hypfs_getsize,
>      .findentry = hypfs_leaf_findentry,
>  };
>  const struct hypfs_funcs hypfs_leaf_wr_funcs = {
> +    .enter = hypfs_node_enter,
> +    .exit = hypfs_node_exit,
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_leaf,
>      .getsize = hypfs_getsize,
>      .findentry = hypfs_leaf_findentry,
>  };
>  const struct hypfs_funcs hypfs_bool_wr_funcs = {
> +    .enter = hypfs_node_enter,
> +    .exit = hypfs_node_exit,
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_bool,
>      .getsize = hypfs_getsize,
>      .findentry = hypfs_leaf_findentry,
>  };
>  const struct hypfs_funcs hypfs_custom_wr_funcs = {
> +    .enter = hypfs_node_enter,
> +    .exit = hypfs_node_exit,
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_custom,
>      .getsize = hypfs_getsize,
> @@ -63,6 +73,8 @@ enum hypfs_lock_state {
>  };
>  static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
>  
> +static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_entered);
> +
>  HYPFS_DIR_INIT(hypfs_root, "");
>  
>  static void hypfs_read_lock(void)
> @@ -100,11 +112,59 @@ static void hypfs_unlock(void)
>      }
>  }
>  
> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
> +{
> +    return entry;
> +}
> +
> +void hypfs_node_exit(const struct hypfs_entry *entry)
> +{
> +}
> +
> +static int node_enter(const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
> +
> +    entry = entry->funcs->enter(entry);
> +    if ( IS_ERR(entry) )
> +        return PTR_ERR(entry);
> +
> +    ASSERT(entry);
> +    ASSERT(!*last || *last == entry->parent);
> +
> +    *last = entry;
> +
> +    return 0;
> +}
> +
> +static void node_exit(const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
> +
> +    if ( !*last )
> +        return;

To my question regarding this in v2 you replied

"I rechecked and have found that this was a remnant from an earlier
 variant. *last won't ever be NULL, so the if can be dropped (a NULL
 will be catched by the following ASSERT())."

Now this if() is still there. Why? (My alternative suggestion was
to have ASSERT(!entry->parent) inside the if() body, since prior to
that you said this would be an indication of the root entry.)

Jan

