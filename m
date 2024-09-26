Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F0986EB0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 10:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805029.1216033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stjlY-0006r8-Iy; Thu, 26 Sep 2024 08:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805029.1216033; Thu, 26 Sep 2024 08:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stjlY-0006oa-Fw; Thu, 26 Sep 2024 08:22:24 +0000
Received: by outflank-mailman (input) for mailman id 805029;
 Thu, 26 Sep 2024 08:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stjlX-0006oU-5h
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 08:22:23 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73ef7071-7be0-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 10:22:22 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso1294082a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 01:22:22 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5002sm2856165a12.65.2024.09.26.01.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:22:20 -0700 (PDT)
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
X-Inumbo-ID: 73ef7071-7be0-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727338941; x=1727943741; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NajRVZv/ltXucNdIrwfQjPOgDxz/vIboAECXVtg4ZI0=;
        b=ScjKtN0rZjj9V+Am6uHME1n6iKtLz//LP0hx1nbm0c6HGxMovvw53Zd7AQdg6w3pwv
         XfoktgPZhVUaQKvlAo2l/rb5Xe+o32pJq6tjOCCPcHTgJ7bYM0XnwFyROtLoXiF/97b3
         eejEVDgdXKTcjzaOGYNgon+Ij9ro1Vd41QzoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727338941; x=1727943741;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NajRVZv/ltXucNdIrwfQjPOgDxz/vIboAECXVtg4ZI0=;
        b=RgEPRI3g+doWS5g/i/VoVm0wu2Y/vEiG9zthMOQTjKiqd1ZRFBiIAGkrYek2ZqDIHI
         it1S4eNioL8dLvxUOVAHnfT6ApmJhLnQNy3Ot6+A/wsCMxW3Y4rhwWz3J/QRzqgZpBVP
         O6R1p3kdCiPcnRMgkkCDIHSoizviVXpPM+/+YX2HoKSgm0IY0+X0gXR7f0fwBSA1VOwX
         NiFjVMLfsRy71CGOgI5e5RUzzn/g8Hb9qSJv392sx3R4jWYTdH/9p4hzYMB+LcohAxEf
         5Qq4LFOtjU3LmhEKE2CGj2nXFvmJxSCN7gaVVI8FdussrXJGGsG/MCXzP5Sje8uyBbK4
         3WFg==
X-Gm-Message-State: AOJu0Yzgg3gKIdF6LijtnOL4Zb9G9t3ZiCR8M+hFQfrFTf7g4ih+AT83
	yvB5YZKqoIw1Gm4wH+9WXApaGNzqhNWzlDe37LvBI7FNe0uIwIrXOxyVjjMy8bo=
X-Google-Smtp-Source: AGHT+IFQF6QEyS0VMWS2XoIqndjQQV2d+xvoZFQZVJJ24rIynHmN2eglKCV92KYCikEwV5Ah/nYbdQ==
X-Received: by 2002:a05:6402:348d:b0:5c8:7770:52df with SMTP id 4fb4d7f45d1cf-5c8777b378amr2247069a12.3.1727338941302;
        Thu, 26 Sep 2024 01:22:21 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:22:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/6] xen/livepatch: zero pointer to temporary load
 buffer
Message-ID: <ZvUZu8wDk9aBiscx@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-3-roger.pau@citrix.com>
 <c357ec68-bfd2-427e-8f33-5826a2252b0e@citrix.com>
 <ZvPfVokJHOpzEZXc@macbook.local>
 <14e0bb5d-7f68-418e-8313-48593ceea7d5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14e0bb5d-7f68-418e-8313-48593ceea7d5@citrix.com>

On Wed, Sep 25, 2024 at 07:28:42PM +0100, Andrew Cooper wrote:
> On 25/09/2024 11:00 am, Roger Pau Monné wrote:
> > On Wed, Sep 25, 2024 at 10:33:39AM +0100, Andrew Cooper wrote:
> >> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> >>> The livepatch_elf_sec data field points to the temporary load buffer, it's the
> >>> load_addr field that points to the stable loaded section data.  Zero the data
> >>> field once load_addr is set, as it would otherwise become a dangling pointer
> >>> once the load buffer is freed.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Changes since v1:
> >>>  - New in this version.
> >>> ---
> >>>  xen/common/livepatch.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> >>> index df41dcce970a..87b3db03e26d 100644
> >>> --- a/xen/common/livepatch.c
> >>> +++ b/xen/common/livepatch.c
> >>> @@ -383,6 +383,9 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
> >>>              }
> >>>              else
> >>>                  memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
> >>> +
> >>> +            /* Avoid leaking pointers to temporary load buffers. */
> >>> +            elf->sec[i].data = NULL;
> >>>          }
> >>>      }
> >>>  
> >> Where is the data allocated and freed?
> >>
> >> I don't see it being freed in this loop, so how is freed subsequently?
> > It's allocated and freed by livepatch_upload(), it's the raw_data
> > buffer that's allocated in the context of that function.
> 
> Well, this is a mess isn't it.
> 
> Ok, so livepatch_upload() makes a temporary buffer to copy everything into.
> 
> In elf_resolve_sections(), we set up sec[i].data pointing into this
> temporary buffer.
> 
> And here, we copy the data from the temporary buffer, into the final
> destination in the Xen .text/data/rodata region.
> 
> So yes, this does end up being a dangling pointer, and clobbering it is
> good.
> 
> 
> But, seeing the `n = sec->load_addr ?: sec->data` in patch 4, wouldn't
> it be better to drop this second pointer and just have move_payload()
> update it here?
> 
> I can't see anything good which can come from having two addresses, nor
> a reason why we'd need both.
> 
> Then again, if this is too hard to arrange, it probably can be left as
> an exercise to a future developer.

So this is how it ends up looking,  there's a bit of churn due to
having to drop const on some function parameters.

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index d50066564666..d1a89dde6ea3 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -243,7 +243,7 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
 
             symndx = ELF32_R_SYM(r_a->r_info);
             type = ELF32_R_TYPE(r_a->r_info);
-            dest = base->load_addr + r_a->r_offset; /* P */
+            dest = base->data + r_a->r_offset; /* P */
             addend = r_a->r_addend;
         }
         else
@@ -252,7 +252,7 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
 
             symndx = ELF32_R_SYM(r->r_info);
             type = ELF32_R_TYPE(r->r_info);
-            dest = base->load_addr + r->r_offset; /* P */
+            dest = base->data + r->r_offset; /* P */
             addend = get_addend(type, dest);
         }
 
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index dfb72be44fb8..46a390da42a3 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -248,7 +248,7 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
     {
         const Elf_RelA *r = rela->data + i * rela->sec->sh_entsize;
         unsigned int symndx = ELF64_R_SYM(r->r_info);
-        void *dest = base->load_addr + r->r_offset; /* P */
+        void *dest = base->data + r->r_offset; /* P */
         bool overflow_check = true;
         int ovf = 0;
         uint64_t val;
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 4f76127e1f77..89a62b33cd9c 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -260,7 +260,7 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
     {
         const Elf_RelA *r = rela->data + i * rela->sec->sh_entsize;
         unsigned int symndx = ELF64_R_SYM(r->r_info);
-        uint8_t *dest = base->load_addr + r->r_offset;
+        uint8_t *dest = base->data + r->r_offset;
         uint64_t val;
 
         if ( symndx == STN_UNDEF )
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 87b3db03e26d..a74f2ffce683 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -371,21 +371,21 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
 
             ASSERT(offset[i] != UINT_MAX);
 
-            elf->sec[i].load_addr = buf + offset[i];
+            buf += offset[i];
 
             /* Don't copy NOBITS - such as BSS. */
             if ( elf->sec[i].sec->sh_type != SHT_NOBITS )
             {
-                memcpy(elf->sec[i].load_addr, elf->sec[i].data,
+                memcpy(buf, elf->sec[i].data,
                        elf->sec[i].sec->sh_size);
                 dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Loaded %s at %p\n",
-                        elf->name, elf->sec[i].name, elf->sec[i].load_addr);
+                        elf->name, elf->sec[i].name, buf);
             }
             else
-                memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
+                memset(buf, 0, elf->sec[i].sec->sh_size);
 
-            /* Avoid leaking pointers to temporary load buffers. */
-            elf->sec[i].data = NULL;
+            /* Replace the temporary buffer with the relocated one. */
+            elf->sec[i].data = buf;
         }
     }
 
@@ -619,7 +619,7 @@ static inline int livepatch_check_expectations(const struct payload *payload)
         break;                                                                            \
     if ( !section_ok(elf, __sec, sizeof(*hook)) || __sec->sec->sh_size != sizeof(*hook) ) \
         return -EINVAL;                                                                   \
-    hook = __sec->load_addr;                                                              \
+    hook = __sec->data;                                                              \
 } while (0)
 
 /*
@@ -633,7 +633,7 @@ static inline int livepatch_check_expectations(const struct payload *payload)
         break;                                                                            \
     if ( !section_ok(elf, __sec, sizeof(*hook)) )                                         \
         return -EINVAL;                                                                   \
-    hook = __sec->load_addr;                                                              \
+    hook = __sec->data;                                                              \
     nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
 } while (0)
 
@@ -653,7 +653,7 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*payload->funcs)) )
             return -EINVAL;
 
-        payload->funcs = funcs = sec->load_addr;
+        payload->funcs = funcs = sec->data;
         payload->nfuncs = sec->sec->sh_size / sizeof(*payload->funcs);
 
         payload->fstate = xzalloc_array(typeof(*payload->fstate),
@@ -712,7 +712,7 @@ static int prepare_payload(struct payload *payload,
     {
         const struct payload *data;
 
-        n = sec->load_addr;
+        n = sec->data;
 
         if ( sec->sec->sh_size <= sizeof(*n) )
             return -EINVAL;
@@ -742,7 +742,7 @@ static int prepare_payload(struct payload *payload,
     sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_DEPENDS);
     if ( sec )
     {
-        n = sec->load_addr;
+        n = sec->data;
 
         if ( sec->sec->sh_size <= sizeof(*n) )
             return -EINVAL;
@@ -758,7 +758,7 @@ static int prepare_payload(struct payload *payload,
     sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
     if ( sec )
     {
-        n = sec->load_addr;
+        n = sec->data;
 
         if ( sec->sec->sh_size <= sizeof(*n) )
             return -EINVAL;
@@ -797,8 +797,8 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*region->frame[i].start)) )
             return -EINVAL;
 
-        region->frame[i].start = sec->load_addr;
-        region->frame[i].stop  = sec->load_addr + sec->sec->sh_size;
+        region->frame[i].start = sec->data;
+        region->frame[i].stop  = sec->data + sec->sec->sh_size;
     }
 
     sec = livepatch_elf_sec_by_name(elf, ".altinstructions");
@@ -846,8 +846,8 @@ static int prepare_payload(struct payload *payload,
             return -EINVAL;
         }
 
-        start = sec->load_addr;
-        end = sec->load_addr + sec->sec->sh_size;
+        start = sec->data;
+        end = sec->data + sec->sec->sh_size;
 
         for ( a = start; a < end; a++ )
         {
@@ -870,14 +870,14 @@ static int prepare_payload(struct payload *payload,
              * repl must be fully within .altinstr_replacement, even if the
              * replacement and the section happen to both have zero length.
              */
-            if ( repl               < repl_sec->load_addr ||
+            if ( repl               < repl_sec->data ||
                  a->repl_len        > repl_sec->sec->sh_size ||
-                 repl + a->repl_len > repl_sec->load_addr + repl_sec->sec->sh_size )
+                 repl + a->repl_len > repl_sec->data + repl_sec->sec->sh_size )
             {
                 printk(XENLOG_ERR LIVEPATCH
                        "%s Alternative repl %p+%#x outside .altinstr_replacement %p+%#"PRIxElfWord"\n",
                        elf->name, repl, a->repl_len,
-                       repl_sec->load_addr, repl_sec->sec->sh_size);
+                       repl_sec->data, repl_sec->sec->sh_size);
                 return -EINVAL;
             }
         }
@@ -899,8 +899,8 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*region->ex)) )
             return -EINVAL;
 
-        s = sec->load_addr;
-        e = sec->load_addr + sec->sec->sh_size;
+        s = sec->data;
+        e = sec->data + sec->sec->sh_size;
 
         sort_exception_table(s ,e);
 
@@ -919,7 +919,7 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*payload->metadata.data)) )
             return -EINVAL;
 
-        payload->metadata.data = sec->load_addr;
+        payload->metadata.data = sec->data;
         payload->metadata.len = sec->sec->sh_size;
 
         /* The metadata is required to consists of null terminated strings. */
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 45d73912a3cd..8b0076eb4f87 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -44,7 +44,7 @@ static int elf_verify_strtab(const struct livepatch_elf_sec *sec)
     return 0;
 }
 
-static int elf_resolve_sections(struct livepatch_elf *elf, const void *data)
+static int elf_resolve_sections(struct livepatch_elf *elf, void *data)
 {
     struct livepatch_elf_sec *sec;
     unsigned int i;
@@ -342,7 +342,7 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                 break;
             }
 
-            st_value += (unsigned long)elf->sec[idx].load_addr;
+            st_value += (unsigned long)elf->sec[idx].data;
             if ( elf->sym[i].name )
                 dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => %#"PRIxElfAddr" (%s)\n",
                        elf->name, elf->sym[i].name,
@@ -503,7 +503,7 @@ static int livepatch_header_check(const struct livepatch_elf *elf)
     return 0;
 }
 
-int livepatch_elf_load(struct livepatch_elf *elf, const void *data)
+int livepatch_elf_load(struct livepatch_elf *elf, void *data)
 {
     int rc;
 
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 7116deaddc28..dd0a8c65d79d 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -13,10 +13,11 @@ struct livepatch_elf_sec {
     const Elf_Shdr *sec;                 /* Hooked up in elf_resolve_sections.*/
     const char *name;                    /* Human readable name hooked in
                                             elf_resolve_section_names. */
-    const void *data;                    /* Pointer to the section (done by
-                                            elf_resolve_sections). */
-    void *load_addr;                     /* A pointer to the allocated destination.
-                                            Done by load_payload_data. */
+    void *data;                          /*
+                                          * Pointer to the section.  Note this
+                                          * can either be the temporary buffer
+                                          * or the relocated data.
+                                          */
 };
 
 struct livepatch_elf_sym {
@@ -41,7 +42,7 @@ struct livepatch_elf {
 const struct livepatch_elf_sec *
 livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
                           const char *name);
-int livepatch_elf_load(struct livepatch_elf *elf, const void *data);
+int livepatch_elf_load(struct livepatch_elf *elf, void *data);
 void livepatch_elf_free(struct livepatch_elf *elf);
 
 int livepatch_elf_resolve_symbols(struct livepatch_elf *elf);


