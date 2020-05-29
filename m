Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFFA1E792F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:20:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebAu-0000Uz-3M; Fri, 29 May 2020 09:19:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jebAt-0000Uo-37
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:19:35 +0000
X-Inumbo-ID: 81c3ecd0-a18d-11ea-a882-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81c3ecd0-a18d-11ea-a882-12813bfff9fa;
 Fri, 29 May 2020 09:19:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA5FFAB3D;
 Fri, 29 May 2020 09:19:31 +0000 (UTC)
Subject: Re: [PATCH v10 07/12] xen: provide version information in hypfs
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-8-jgross@suse.com>
 <88b80e61-3fb4-8f89-0597-d6959033478b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <65af43c0-2ed4-4330-501f-d561468b7a0e@suse.com>
Date: Fri, 29 May 2020 11:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <88b80e61-3fb4-8f89-0597-d6959033478b@suse.com>
Content-Type: multipart/mixed; boundary="------------447C7EB7590E9151B9414CFF"
Content-Language: en-US
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------447C7EB7590E9151B9414CFF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.05.20 10:34, Jan Beulich wrote:
> On 19.05.2020 09:21, Juergen Gross wrote:
>> @@ -373,6 +374,52 @@ void __init do_initcalls(void)
>>           (*call)();
>>   }
>>   
>> +#ifdef CONFIG_HYPFS
>> +static unsigned int __read_mostly major_version;
>> +static unsigned int __read_mostly minor_version;
>> +
>> +static HYPFS_DIR_INIT(buildinfo, "buildinfo");
>> +static HYPFS_DIR_INIT(compileinfo, "compileinfo");
>> +static HYPFS_DIR_INIT(version, "version");
>> +static HYPFS_UINT_INIT(major, "major", major_version);
>> +static HYPFS_UINT_INIT(minor, "minor", minor_version);
> 
> These two lines fail to build with gcc 4.1 ("unknown field 'content'
> specified in initializer"), which I've deliberately tried as a last
> minute post-commit, pre-push check. I therefore reverted this change
> before pushing.
> 
> Paul, Jürgen - please advise how to proceed, considering today's
> deadline. I'd accept pushing the rest of the series, if a fix for
> the issue will then still be permitted in later. Otherwise I'd have
> to wait for a fixed (incremental) version

The attached patch should fix this problem (assuming the anonymous
union is to blame).

Could you verify that, please?

In case the patch is fine, I'll resend the rest of the series with
that patch included, as there are adaptions in later patches needed.


Juergen

--------------447C7EB7590E9151B9414CFF
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-hypfs-make-struct-hypfs_entry_leaf-initializers-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-hypfs-make-struct-hypfs_entry_leaf-initializers-.pa";
 filename*1="tch"

From 1b56440bd50a523bbdbd96f0e1e96c85793108db Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Fri, 29 May 2020 11:09:43 +0200
Subject: [PATCH] xen/hypfs: make struct hypfs_entry_leaf initializers work
 with gcc 4.1

gcc 4.1 has problems with static initializers for anonymous unions.
Fix this by naming the union in struct hypfs_entry_leaf.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c      | 8 ++++----
 xen/include/xen/hypfs.h | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 9c2213a068..a111c2f86d 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -126,7 +126,7 @@ int hypfs_add_leaf(struct hypfs_entry_dir *parent,
 {
     int ret;
 
-    if ( !leaf->content )
+    if ( !leaf->u.content )
         ret = -EINVAL;
     else
         ret = add_entry(parent, &leaf->e);
@@ -255,7 +255,7 @@ int hypfs_read_leaf(const struct hypfs_entry *entry,
 
     l = container_of(entry, const struct hypfs_entry_leaf, e);
 
-    return copy_to_guest(uaddr, l->content, entry->size) ? -EFAULT: 0;
+    return copy_to_guest(uaddr, l->u.content, entry->size) ? -EFAULT: 0;
 }
 
 static int hypfs_read(const struct hypfs_entry *entry,
@@ -317,7 +317,7 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
         goto out;
 
     ret = 0;
-    memcpy(leaf->write_ptr, buf, ulen);
+    memcpy(leaf->u.write_ptr, buf, ulen);
     leaf->e.size = ulen;
 
  out:
@@ -341,7 +341,7 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
     if ( copy_from_guest(&buf, uaddr, ulen) )
         return -EFAULT;
 
-    *(bool *)leaf->write_ptr = buf;
+    *(bool *)leaf->u.write_ptr = buf;
 
     return 0;
 }
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index 5c6a0ccece..39845ec5ae 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -26,7 +26,7 @@ struct hypfs_entry_leaf {
     union {
         const void *content;
         void *write_ptr;
-    };
+    } u;
 };
 
 struct hypfs_entry_dir {
@@ -68,7 +68,7 @@ struct hypfs_entry_dir {
 static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
                                               const char *str)
 {
-    leaf->content = str;
+    leaf->u.content = str;
     leaf->e.size = strlen(str) + 1;
 }
 
@@ -81,7 +81,7 @@ static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
         .e.max_size = (wr) ? sizeof(contvar) : 0,        \
         .e.read = hypfs_read_leaf,                       \
         .e.write = (wr),                                 \
-        .content = &(contvar),                           \
+        .u.content = &(contvar),                         \
     }
 
 #define HYPFS_UINT_INIT(var, nam, contvar)                       \
-- 
2.26.2


--------------447C7EB7590E9151B9414CFF--

