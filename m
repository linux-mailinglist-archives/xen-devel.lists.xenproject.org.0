Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F61D2BBF
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 11:50:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZAVa-0007NS-GP; Thu, 14 May 2020 09:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZAVZ-0007NK-Cw
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:50:29 +0000
X-Inumbo-ID: 57515ada-95c8-11ea-a464-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57515ada-95c8-11ea-a464-12813bfff9fa;
 Thu, 14 May 2020 09:50:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D533AF0D;
 Thu, 14 May 2020 09:50:29 +0000 (UTC)
Subject: Re: [PATCH v8 04/12] xen: add basic hypervisor filesystem support
To: Jan Beulich <jbeulich@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-5-jgross@suse.com>
 <db277779-5b1e-a2aa-3948-9e6dd8e8bef0@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <23938228-e947-fe36-8b19-0e89886db9ac@suse.com>
Date: Thu, 14 May 2020 11:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <db277779-5b1e-a2aa-3948-9e6dd8e8bef0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.20 09:59, Jan Beulich wrote:
> On 08.05.2020 17:34, Juergen Gross wrote:
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -10,6 +10,7 @@ obj-y += domain.o
>>   obj-y += event_2l.o
>>   obj-y += event_channel.o
>>   obj-y += event_fifo.o
>> +obj-$(CONFIG_HYPFS) += hypfs.o
>>   obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
>>   obj-$(CONFIG_GRANT_TABLE) += grant_table.o
>>   obj-y += guestcopy.o
> 
> I guess I could/should have noticed this earlier - this isn't the
> correct insertion point, considering that we try to keep these
> alphabetically sorted.

Oh, the placement seems to be leftover from an early version when the
file was named fs.c or so.

> 
>> +static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
>> +                                               const char *path)
>> +{
>> +    const char *end;
>> +    struct hypfs_entry *entry;
>> +    unsigned int name_len;
>> +
>> +    if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
>> +        return NULL;
>> +
>> +    if ( !*path )
>> +        return &dir->e;
>> +
>> +    end = strchr(path, '/');
>> +    if ( !end )
>> +        end = strchr(path, '\0');
>> +    name_len = end - path;
>> +
>> +    list_for_each_entry ( entry, &dir->dirlist, list )
>> +    {
>> +        int cmp = strncmp(path, entry->name, name_len);
>> +        struct hypfs_entry_dir *d = container_of(entry,
>> +                                                 struct hypfs_entry_dir, e);
>> +
>> +        if ( cmp < 0 )
>> +            return NULL;
>> +        if ( !cmp && strlen(entry->name) == name_len )
>> +            return *end ? hypfs_get_entry_rel(d, end + 1) : entry;
> 
> The compiler may translate this into a tail call, but shouldn't
> we be worried about the nesting depth in case it doesn't?
> Perhaps this doesn't need addressing here, but rather by limiting
> the depth at which new entries can be created?

Hmm, it should be possible to solve this without recursion. I'll have a
try.

> 
>> +int hypfs_read_dir(const struct hypfs_entry *entry,
>> +                   XEN_GUEST_HANDLE_PARAM(void) uaddr)
>> +{
>> +    const struct hypfs_entry_dir *d;
>> +    const struct hypfs_entry *e;
>> +    unsigned int size = entry->size;
>> +
>> +    d = container_of(entry, const struct hypfs_entry_dir, e);
>> +
>> +    list_for_each_entry ( e, &d->dirlist, list )
> 
> This function, in particular because of being non-static, makes
> me wonder how, with add_entry() taking a lock, it can be safe
> without any locking. Initially I thought the justification might
> be because all adding of entries is an init-time-only thing, but
> various involved functions aren't marked __init (and it is at
> least not implausible that down the road we might see new
> entries getting added during certain hotplug operations).
> 
> I do realize that do_hypfs_op() takes the necessary read lock,
> but then you're still building on the assumption that the
> function is reachable through only that code path, despite
> being non-static. An ASSERT() here would be the minimum I guess,
> but with read locks now being recursive I don't see why you
> couldn't read-lock here again.

Right, will add the read-lock.

> 
> The same goes for other non-static functions, albeit things may
> become more interesting for functions living on the
> XEN_HYPFS_OP_write_contents path (because write locks aren't

Adding an ASSERT() in this regard should be rather easy.

> recursive [yet]). I notice even hypfs_get_entry() is non-static,
> albeit I can't see why that is (perhaps a later patch needs it).

No need for non-static, will change to static.

> 
>> +int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
>> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
>> +{
>> +    char *buf;
>> +    int ret;
>> +
>> +    if ( leaf->e.type != XEN_HYPFS_TYPE_STRING &&
>> +         leaf->e.type != XEN_HYPFS_TYPE_BLOB && ulen != leaf->e.size )
>> +        return -EDOM;
> 
> hypfs_write() checks ulen against max_size, but the function
> being non-static makes me once again wonder whether at the very
> leaset an ASSERT() wouldn't be wanted here.

Okay.

> 
>> +    buf = xmalloc_array(char, ulen);
>> +    if ( !buf )
>> +        return -ENOMEM;
>> +
>> +    ret = -EFAULT;
>> +    if ( copy_from_guest(buf, uaddr, ulen) )
>> +        goto out;
>> +
>> +    ret = -EINVAL;
>> +    if ( leaf->e.type == XEN_HYPFS_TYPE_STRING &&
>> +         memchr(buf, 0, ulen) != (buf + ulen - 1) )
>> +        goto out;
> 
> How does this check play with gzip-ed strings?

Hmm, right, will add a check for XEN_HYPFS_ENC_PLAIN.

> 
>> +long do_hypfs_op(unsigned int cmd,
>> +                 XEN_GUEST_HANDLE_PARAM(const_char) arg1, unsigned long arg2,
>> +                 XEN_GUEST_HANDLE_PARAM(void) arg3, unsigned long arg4)
>> +{
>> +    int ret;
>> +    struct hypfs_entry *entry;
>> +    static char path[XEN_HYPFS_MAX_PATHLEN];
>> +
>> +    if ( xsm_hypfs_op(XSM_PRIV) )
>> +        return -EPERM;
>> +
>> +    if ( cmd == XEN_HYPFS_OP_get_version )
>> +        return XEN_HYPFS_VERSION;
> 
> Check that all args are zero/null for this sub-op, to allow future
> extension?

Yes, good idea.

> 
>> +#define HYPFS_FIXEDSIZE_INIT(var, typ, nam, contvar, wr) \
>> +    struct hypfs_entry_leaf __read_mostly var = {        \
>> +        .e.type = typ,                                   \
>> +        .e.encoding = XEN_HYPFS_ENC_PLAIN,               \
>> +        .e.name = nam,                                   \
>> +        .e.size = sizeof(contvar),                       \
>> +        .e.max_size = wr ? sizeof(contvar) : 0,          \
>> +        .e.read = hypfs_read_leaf,                       \
>> +        .e.write = wr,                                   \
>> +        .content = &contvar,                             \
>> +    }
> 
> At the example of this, some of the macros look like they want
> parentheses added around uses of some of their parameters.

Hmm, which ones? As I've understood from previous patch reviews by you
you only want those parameters with parantheses where they are really
needed.

- var is a plain variable, so no parantheses
- typ _should_ be a XEN_HYPFS_TYPE_* define, so probably no parantheses
   (its usage in the macro doesn't call for using parantheses anyway)
- nam might be a candidate, but I can't come up with a reason to put it
   in parantheses here
- contvar has to be a variable (otherwise sizeof(contvar) wouldn't
   work), so no parantheses
- wr is a function pointer or NULL, so no parantheses


Juergen

