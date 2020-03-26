Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03289193ED5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 13:27:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHRZL-0006pd-GA; Thu, 26 Mar 2020 12:25:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHRZJ-0006pY-Vr
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 12:25:06 +0000
X-Inumbo-ID: d17dedbc-6f5c-11ea-87c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d17dedbc-6f5c-11ea-87c7-12813bfff9fa;
 Thu, 26 Mar 2020 12:25:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 718D6AC6E;
 Thu, 26 Mar 2020 12:25:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-8-andrew.cooper3@citrix.com>
 <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
 <3e157f6d-e237-68d2-f628-10f4d42e578b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7a03cf2-a8ce-3b82-5c0c-22f4bccc0c8e@suse.com>
Date: Thu, 26 Mar 2020 13:24:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3e157f6d-e237-68d2-f628-10f4d42e578b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 7/7] x86/ucode/intel: Fold structures
 together
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 15:32, Andrew Cooper wrote:
> On 25/03/2020 14:16, Jan Beulich wrote:
>> On 23.03.2020 11:17, Andrew Cooper wrote:
>>> Currently, we allocate an 8 byte struct microcode_patch to point at a
>>> separately allocated struct microcode_intel.  This is wasteful.
>> As indicated elsewhere I'm very much in favor of this, but I think it
>> wants doing in one of the earlier series, and then for AMD at the same
>> time.
> 
> I've got some ideas for an AMD series given the replies I got, and will
> be able to do an equivalent microcode_amd => microcode_patch folding on
> that side.  There is also further work to do, including unbreaking the
> OSVW logic (which has been totally clobbered by the start/end_update
> debacle).
> 
> However, given that it taken this whole series to make the transition
> look safe on the Intel side, I really don't see a way of doing this
> "earlier".
> 
> In particular, no amount of ifdefary suggested below can AFAICT make it
> safe to do this transform without having microcode_patch opaque to being
> with.
> 
> Yes - there is a bit of churn, but I can't see a safe alternative.

Something like the one below (compile tested only, and not really
cleaned up in any way)?

Jan

--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -60,13 +60,15 @@ struct __packed microcode_header_amd {
 #define UCODE_EQUIV_CPU_TABLE_TYPE 0x00000000
 #define UCODE_UCODE_TYPE           0x00000001
 
-struct microcode_amd {
+struct microcode_patch {
     void *mpb;
     size_t mpb_size;
     struct equiv_cpu_entry *equiv_cpu_table;
     size_t equiv_cpu_table_size;
 };
 
+#define microcode_amd microcode_patch
+
 struct mpbhdr {
     uint32_t type;
     uint32_t len;
@@ -177,13 +179,11 @@ static enum microcode_match_result micro
 
 static bool match_cpu(const struct microcode_patch *patch)
 {
-    return patch && (microcode_fits(patch->mc_amd) == NEW_UCODE);
+    return patch && (microcode_fits(patch) == NEW_UCODE);
 }
 
-static void free_patch(void *mc)
+static void free_patch(struct microcode_patch *mc_amd)
 {
-    struct microcode_amd *mc_amd = mc;
-
     if ( mc_amd )
     {
         xfree(mc_amd->equiv_cpu_table);
@@ -206,12 +206,12 @@ static enum microcode_match_result compa
 static enum microcode_match_result compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
-    const struct microcode_header_amd *new_header = new->mc_amd->mpb;
-    const struct microcode_header_amd *old_header = old->mc_amd->mpb;
+    const struct microcode_header_amd *new_header = new->mpb;
+    const struct microcode_header_amd *old_header = old->mpb;
 
     /* Both patches to compare are supposed to be applicable to local CPU. */
-    ASSERT(microcode_fits(new->mc_amd) != MIS_UCODE);
-    ASSERT(microcode_fits(new->mc_amd) != MIS_UCODE);
+    ASSERT(microcode_fits(new) != MIS_UCODE);
+    ASSERT(microcode_fits(new) != MIS_UCODE);
 
     return compare_header(new_header, old_header);
 }
@@ -230,7 +230,7 @@ static int apply_microcode(const struct
     if ( !match_cpu(patch) )
         return -EINVAL;
 
-    hdr = patch->mc_amd->mpb;
+    hdr = patch->mpb;
 
     BUG_ON(local_irq_is_enabled());
 
@@ -412,7 +412,6 @@ static struct microcode_patch *cpu_reque
 {
     struct microcode_amd *mc_amd;
     struct microcode_header_amd *saved = NULL;
-    struct microcode_patch *patch = NULL;
     size_t offset = 0, saved_size = 0;
     int error = 0;
     unsigned int current_cpu_id;
@@ -559,23 +558,18 @@ static struct microcode_patch *cpu_reque
     {
         mc_amd->mpb = saved;
         mc_amd->mpb_size = saved_size;
-        patch = xmalloc(struct microcode_patch);
-        if ( patch )
-            patch->mc_amd = mc_amd;
-        else
-        {
-            free_patch(mc_amd);
-            error = -ENOMEM;
-        }
     }
     else
+    {
         free_patch(mc_amd);
+        mc_amd = NULL;
+    }
 
   out:
-    if ( error && !patch )
-        patch = ERR_PTR(error);
+    if ( error && !mc_amd )
+        mc_amd = ERR_PTR(error);
 
-    return patch;
+    return mc_amd;
 }
 
 #ifdef CONFIG_HVM
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -245,8 +245,7 @@ static struct microcode_patch *parse_blo
 
 static void microcode_free_patch(struct microcode_patch *microcode_patch)
 {
-    microcode_ops->free_patch(microcode_patch->mc);
-    xfree(microcode_patch);
+    microcode_ops->free_patch(microcode_patch);
 }
 
 /* Return true if cache gets updated. Otherwise, return false */
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -52,11 +52,13 @@ struct microcode_header_intel {
     unsigned int reserved[3];
 };
 
-struct microcode_intel {
+struct microcode_patch {
     struct microcode_header_intel hdr;
     unsigned int bits[0];
 };
 
+#define microcode_intel microcode_patch
+
 /* microcode format is extended from prescott processors */
 struct extended_signature {
     unsigned int sig;
@@ -245,12 +247,12 @@ static bool match_cpu(const struct micro
     if ( !patch )
         return false;
 
-    return microcode_update_match(&patch->mc_intel->hdr) == NEW_UCODE;
+    return microcode_update_match(&patch->hdr) == NEW_UCODE;
 }
 
-static void free_patch(void *mc)
+static void free_patch(struct microcode_patch *patch)
 {
-    xfree(mc);
+    xfree(patch);
 }
 
 static enum microcode_match_result compare_patch(
@@ -260,10 +262,10 @@ static enum microcode_match_result compa
      * Both patches to compare are supposed to be applicable to local CPU.
      * Just compare the revision number.
      */
-    ASSERT(microcode_update_match(&old->mc_intel->hdr) != MIS_UCODE);
-    ASSERT(microcode_update_match(&new->mc_intel->hdr) != MIS_UCODE);
+    ASSERT(microcode_update_match(&old->hdr) != MIS_UCODE);
+    ASSERT(microcode_update_match(&new->hdr) != MIS_UCODE);
 
-    return (new->mc_intel->hdr.rev > old->mc_intel->hdr.rev) ? NEW_UCODE
+    return (new->hdr.rev > old->hdr.rev) ? NEW_UCODE
                                                              : OLD_UCODE;
 }
 
@@ -281,7 +283,7 @@ static int apply_microcode(const struct
     if ( !match_cpu(patch) )
         return -EINVAL;
 
-    mc_intel = patch->mc_intel;
+    mc_intel = patch;
 
     BUG_ON(local_irq_is_enabled());
 
@@ -347,7 +349,6 @@ static struct microcode_patch *cpu_reque
     long offset = 0;
     int error = 0;
     struct microcode_intel *mc, *saved = NULL;
-    struct microcode_patch *patch = NULL;
 
     while ( (offset = get_next_ucode_from_buffer(&mc, buf, size, offset)) > 0 )
     {
@@ -374,22 +375,10 @@ static struct microcode_patch *cpu_reque
     if ( offset < 0 )
         error = offset;
 
-    if ( saved )
-    {
-        patch = xmalloc(struct microcode_patch);
-        if ( patch )
-            patch->mc_intel = saved;
-        else
-        {
-            xfree(saved);
-            error = -ENOMEM;
-        }
-    }
-
-    if ( error && !patch )
-        patch = ERR_PTR(error);
+    if ( error && !saved )
+        saved = ERR_PTR(error);
 
-    return patch;
+    return saved;
 }
 
 const struct microcode_ops intel_ucode_ops = {
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -11,13 +11,7 @@ enum microcode_match_result {
     MIS_UCODE, /* signature mismatched */
 };
 
-struct microcode_patch {
-    union {
-        struct microcode_intel *mc_intel;
-        struct microcode_amd *mc_amd;
-        void *mc;
-    };
-};
+struct microcode_patch;
 
 struct microcode_ops {
     struct microcode_patch *(*cpu_request_microcode)(const void *buf,
@@ -26,7 +20,7 @@ struct microcode_ops {
     int (*apply_microcode)(const struct microcode_patch *patch);
     int (*start_update)(void);
     void (*end_update_percpu)(void);
-    void (*free_patch)(void *mc);
+    void (*free_patch)(struct microcode_patch *patch);
     bool (*match_cpu)(const struct microcode_patch *patch);
     enum microcode_match_result (*compare_patch)(
         const struct microcode_patch *new, const struct microcode_patch *old);


