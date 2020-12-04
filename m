Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77C2CEA81
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 10:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44254.79339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl777-0001XY-3D; Fri, 04 Dec 2020 09:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44254.79339; Fri, 04 Dec 2020 09:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl776-0001X9-WE; Fri, 04 Dec 2020 09:10:53 +0000
Received: by outflank-mailman (input) for mailman id 44254;
 Fri, 04 Dec 2020 09:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl775-0001X4-17
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 09:10:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ef017ed-80da-4caa-b087-48b7b011fd06;
 Fri, 04 Dec 2020 09:10:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CBA8ACC4;
 Fri,  4 Dec 2020 09:10:49 +0000 (UTC)
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
X-Inumbo-ID: 0ef017ed-80da-4caa-b087-48b7b011fd06
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607073049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvPAS1fnvtQTnWbCJURw87a677mWEVHMf028tHQFHsk=;
	b=LRQQpUASSPqqIUaI0Mpc6Ypf/1QddP+2MJh3QPxm/qUritoutBVhUdmOM84wybYYS3CR1p
	imvAiLNm1mEA2tqEvIDYRmASZMCiqQBPPnYGssVkJ//LAeAwlNd2A9iO61Ap451ArFAI2K
	fMpG+b76+WFMMHOHXMo98wMBUu44wRQ=
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e14fa4a4-3a3e-ceac-af38-8561baf58aa8@suse.com>
Date: Fri, 4 Dec 2020 10:10:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-16-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> @@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb = {
>      .notifier_call = cpu_callback
>  };
>  
> +#ifdef CONFIG_HYPFS
> +static const struct hypfs_entry *cpupool_pooldir_enter(
> +    const struct hypfs_entry *entry);
> +
> +static struct hypfs_funcs cpupool_pooldir_funcs = {

Yet one more const missing?

> +    .enter = cpupool_pooldir_enter,
> +    .exit = hypfs_node_exit,
> +    .read = hypfs_read_dir,
> +    .write = hypfs_write_deny,
> +    .getsize = hypfs_getsize,
> +    .findentry = hypfs_dir_findentry,
> +};
> +
> +static HYPFS_VARDIR_INIT(cpupool_pooldir, "%u", &cpupool_pooldir_funcs);
> +
> +static const struct hypfs_entry *cpupool_pooldir_enter(
> +    const struct hypfs_entry *entry)
> +{
> +    return &cpupool_pooldir.e;
> +}
> +
> +static int cpupool_dir_read(const struct hypfs_entry *entry,
> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    int ret = 0;
> +    const struct cpupool *c;
> +    unsigned int size = 0;
> +
> +    list_for_each_entry(c, &cpupool_list, list)
> +    {
> +        size += hypfs_dynid_entry_size(entry, c->cpupool_id);

Why do you maintain size here? I can't spot any use.

With this dropped the function then no longer depends on its
"entry" parameter, which makes me wonder ...

> +        ret = hypfs_read_dyndir_id_entry(&cpupool_pooldir, c->cpupool_id,
> +                                         list_is_last(&c->list, &cpupool_list),
> +                                         &uaddr);
> +        if ( ret )
> +            break;
> +    }
> +
> +    return ret;
> +}
> +
> +static unsigned int cpupool_dir_getsize(const struct hypfs_entry *entry)
> +{
> +    const struct cpupool *c;
> +    unsigned int size = 0;
> +
> +    list_for_each_entry(c, &cpupool_list, list)
> +        size += hypfs_dynid_entry_size(entry, c->cpupool_id);

... why this one does. To be certain their results are consistent
with one another, I think both should produce their results from
the same data.

> +    return size;
> +}
> +
> +static const struct hypfs_entry *cpupool_dir_enter(
> +    const struct hypfs_entry *entry)
> +{
> +    struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_alloc_dyndata(sizeof(*data));

I generally like the added type safety of the macro wrappers
around _xmalloc(). I wonder if it wouldn't be a good idea to have
such here as well, to avoid random mistakes like

    data = hypfs_alloc_dyndata(sizeof(data));

However I further notice that the struct allocated isn't cpupool
specific at all. It would seem to me that such an allocation
therefore doesn't belong here. Therefore I wonder whether ...

> +    if ( !data )
> +        return ERR_PTR(-ENOMEM);
> +    data->id = CPUPOOLID_NONE;
> +
> +    spin_lock(&cpupool_lock);

... these two properties (initial ID and lock) shouldn't e.g. be
communicated via the template, allowing the enter/exit hooks to
become generic for all ID templates.

Yet in turn I notice that the "id" field only ever gets set, both
in patch 14 and here. But yes, I've now spotted the consumers in
patch 16.

> +    return entry;
> +}
> +
> +static void cpupool_dir_exit(const struct hypfs_entry *entry)
> +{
> +    spin_unlock(&cpupool_lock);
> +
> +    hypfs_free_dyndata();
> +}
> +
> +static struct hypfs_entry *cpupool_dir_findentry(
> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
> +{
> +    unsigned long id;
> +    const char *end;
> +    const struct cpupool *cpupool;
> +
> +    id = simple_strtoul(name, &end, 10);
> +    if ( end != name + name_len )
> +        return ERR_PTR(-ENOENT);
> +
> +    cpupool = __cpupool_find_by_id(id, true);

Silent truncation from unsigned long to unsigned int?

> +    if ( !cpupool )
> +        return ERR_PTR(-ENOENT);
> +
> +    return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
> +}
> +
> +static struct hypfs_funcs cpupool_dir_funcs = {

Yet another missing const?

> +    .enter = cpupool_dir_enter,
> +    .exit = cpupool_dir_exit,
> +    .read = cpupool_dir_read,
> +    .write = hypfs_write_deny,
> +    .getsize = cpupool_dir_getsize,
> +    .findentry = cpupool_dir_findentry,
> +};
> +
> +static HYPFS_VARDIR_INIT(cpupool_dir, "cpupool", &cpupool_dir_funcs);

Why VARDIR? This isn't a template, is it? Or does VARDIR really
serve multiple purposes?

> +static void cpupool_hypfs_init(void)
> +{
> +    hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
> +    hypfs_add_dyndir(&cpupool_dir, &cpupool_pooldir);
> +}
> +#else
> +
> +static void cpupool_hypfs_init(void)
> +{
> +}
> +#endif

I think you want to be consistent with the use of blank lines next
to #if / #else / #endif. In cases when they enclose multiple entities,
I think it's generally better to have intervening blank lines
everywhere. I also think in such cases commenting #else and #endif is
helpful. But you're the maintainer of this code ...

Jan

