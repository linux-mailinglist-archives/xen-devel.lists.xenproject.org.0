Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED6ABB65D
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 09:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989614.1373633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvBh-0008Dx-42; Mon, 19 May 2025 07:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989614.1373633; Mon, 19 May 2025 07:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvBh-0008BF-0y; Mon, 19 May 2025 07:45:29 +0000
Received: by outflank-mailman (input) for mailman id 989614;
 Mon, 19 May 2025 07:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRlD=YD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uGvBf-000854-Pq
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 07:45:27 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad0779d-3485-11f0-9eb8-5ba50f476ded;
 Mon, 19 May 2025 09:45:27 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so685297766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 00:45:27 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4908cesm553063666b.132.2025.05.19.00.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 00:45:25 -0700 (PDT)
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
X-Inumbo-ID: 3ad0779d-3485-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747640726; x=1748245526; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcSg5UPLHL6rIvTqybciMnu5FShDp9d0RmBAadVtesI=;
        b=lSwedTRe3f8TH4MtzseUDnS7HRneWuGXJ3NHeO4uyVdIf6ZEsQFT2Zl1biGgek5d1u
         nmHOGR57Sve7wBhLe/rV5L1NsV67fBxEBHnuclcZqO+sIY/gYpN8X2LwzHwHMBkXVQ4E
         c4wjdNwfPSEmE+eEJc8KvB0xB1dcGPD0kQuM3iRdJZMKbw7to3lofJX6cRbgnNFRK416
         5Ede6lFh1QQWpNar3APwJ5z3g8cEW/mOmFq40OVFywzUII7pNRjow102OMV5/MX0QjOy
         oQ9sqEsJ0lUH35JiZtgpq5+/tZ4idjH50XNKBK4ei3JSv1pCh9W5OKWoycok7v9EiAFE
         ed6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640726; x=1748245526;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcSg5UPLHL6rIvTqybciMnu5FShDp9d0RmBAadVtesI=;
        b=kYYMGXROFCX5XWgAG5EfqtJUnx0GdxNYcgUUwfEugawQyzs0yuNyFOMlO2LL+BHkPp
         YzYRwvjhTa5hWGyI/w0txFjiQT3d9EDzNkPvJSHPT58ePcH3cvbESZM0pra7yBuSLdJF
         cEo6EhZeL5DuVHb1xRtEV8lHPQrVQ4iGTlTaZWXDm3W4cTLlo2Kk/N5+Pxeq77uX2zju
         udzoby2UZQz8PGOTj44j2iAkOA+Yqn8WzD1rtReib6v/v+c5Xs9KdKi3XWzGaRXthHsV
         iMUMa13kUvp3AHforA6QwpgIF9ilvdC/ym+LYqKO6b5rHnBzaYJrD0eFJDcOisjCzsHp
         Eoqg==
X-Forwarded-Encrypted: i=1; AJvYcCVvb4lTyg5/L37UJJCgId7Q3qc3US2E6DSRm5purb27MJ20uZx1VH9jcKTh3xd0//E3N/t86M3T4Dw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsqK4XehQ9JqkyaImCQS4O10jzT/fF1mM1VfBhVgWKIxFkWDU2
	vE7y7IKfdoWUJmdzLEsYz19hJ+Bae/dOun0gnk3Xk+4/aOOJxxKUyi0z
X-Gm-Gg: ASbGncuqjYNOI885A6+6TP4N980CV3zi6mrWDqYggjg5aKRNGtrAetSfJmUCDtZ1xHn
	v0QRM9cgqU1iu5++PA20R6iSXDgmc3ada1I9CmnycSKDzZk4q4nxorpqysMxvS6IABBI4RTk5pX
	awJYj0AU+dhY/bAeDM68yFi8R2bq9Azbx2nTugtXZ2waWQ3KXQ2GPf5gVQpiVSg4mlGjAdZDKZw
	8b/ESMPp0BMrlBNS8dTT+MnFfKhDFCqlKPzFPAd5WhOIlqV4WiXIru98cPg/MKXXjd8FrDgqv6k
	rC2jext8JTeqjNkNdeusYrGVIO2ZYncgnC4AN8DMW+NxPIhjNhkk9jVY3Rfv70Zy+u172dRF/tk
	Fuzn6Kzxas6lf9TbS3tP92qTbwpImz5WOHNQ=
X-Google-Smtp-Source: AGHT+IF38RlBYEyodhMYrUxfWDfdwW5VS+O0f8W/LQZyFu4sHcf5zmn61x7byJOIaF8ntAsGvS7Olw==
X-Received: by 2002:a17:906:230a:b0:ad4:f6d2:431b with SMTP id a640c23a62f3a-ad536dce6cfmr767896066b.44.1747640725751;
        Mon, 19 May 2025 00:45:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------aUJxhS7Ncp1fkvfo4wFfMZoN"
Message-ID: <145c4507-4810-42c7-b34d-76d256619037@gmail.com>
Date: Mon, 19 May 2025 09:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/gnttab: do not implement GNTTABOP_cache_flush
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-3-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250516094535.63472-3-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------aUJxhS7Ncp1fkvfo4wFfMZoN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/16/25 11:45 AM, Roger Pau Monne wrote:
> The current underlying implementation of GNTTABOP_cache_flush on x86 won't
> work as expected.  The provided {clean,invalidate}_dcache_va_range()
> helpers only do a local pCPU cache flush, so the cache of previous pCPUs
> where the vCPU might have run are not flushed.
>
> However instead of attempting to fix this, make the GNTTABOP_cache_flush
> operation only available to ARM.  There are no known users on x86, the
> implementation is broken, and other architectures don't have grant-table
> support yet.
>
> With that operation not implemented on x86, the related
> {clean,invalidate}_dcache_va_range() helpers can also be removed.
>
> Fixes: f62dc81c2df7 ("x86: introduce more cache maintenance operations")
> Fixes: 18e8d22fe750 ("introduce GNTTABOP_cache_flush")
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
> Changes since v1:
>   - Introduce Kconfig option.
>   - Introduce CHANGELOG entry.
> ---
>   CHANGELOG.md                        |  3 +++
>   xen/arch/x86/include/asm/flushtlb.h | 19 -------------------
>   xen/common/Kconfig                  |  5 +++++
>   xen/common/grant_table.c            |  6 ++++++
>   4 files changed, 14 insertions(+), 19 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1ea06524db20..21d7be0aa389 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -24,6 +24,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       - Ability to enable stack protector
>   
>   ### Removed
> + - On x86:
> +   - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
> +     broken.
>   

LGTM: Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
>   
> diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
> index 209ea1e62fae..cd625f911436 100644
> --- a/xen/arch/x86/include/asm/flushtlb.h
> +++ b/xen/arch/x86/include/asm/flushtlb.h
> @@ -184,25 +184,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
>   }
>   
>   static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
> -static inline int invalidate_dcache_va_range(const void *p,
> -                                             unsigned long size)
> -{ return -EOPNOTSUPP; }
> -static inline int clean_and_invalidate_dcache_va_range(const void *p,
> -                                                       unsigned long size)
> -{
> -    unsigned int order = get_order_from_bytes(size);
> -    /* sub-page granularity support needs to be added if necessary */
> -    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
> -    return 0;
> -}
> -static inline int clean_dcache_va_range(const void *p, unsigned long size)
> -{
> -    unsigned int order = get_order_from_bytes(size);
> -
> -    /* sub-page granularity support needs to be added if necessary */
> -    flush_area_local(p, FLUSH_CACHE_WRITEBACK | FLUSH_ORDER(order));
> -    return 0;
> -}
>   
>   unsigned int guest_flush_tlb_flags(const struct domain *d);
>   void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 6d43be2e6e8a..563b036474c0 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -35,6 +35,11 @@ config GRANT_TABLE
>   
>   	  If unsure, say Y.
>   
> +config HAS_GRANT_CACHE_FLUSH
> +	bool
> +	depends on GRANT_TABLE
> +	default ARM
> +
>   config EVTCHN_FIFO
>   	bool "Event Channel Fifo support" if EXPERT
>   	default y
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index e75ff98aff1c..cf131c43a1f1 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -940,6 +940,7 @@ static void reduce_status_for_pin(struct domain *rd,
>           gnttab_clear_flags(rd, clear_flags, status);
>   }
>   
> +#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
>   static struct active_grant_entry *grant_map_exists(const struct domain *ld,
>                                                      struct grant_table *rgt,
>                                                      mfn_t mfn,
> @@ -975,6 +976,7 @@ static struct active_grant_entry *grant_map_exists(const struct domain *ld,
>   
>       return ERR_PTR(-EINVAL);
>   }
> +#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
>   
>   union maptrack_node {
>       struct {
> @@ -3520,6 +3522,7 @@ gnttab_swap_grant_ref(XEN_GUEST_HANDLE_PARAM(gnttab_swap_grant_ref_t) uop,
>       return 0;
>   }
>   
> +#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
>   static int _cache_flush(const gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
>   {
>       struct domain *d, *owner;
> @@ -3631,6 +3634,7 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
>   
>       return 0;
>   }
> +#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
>   
>   long do_grant_table_op(
>       unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
> @@ -3773,6 +3777,7 @@ long do_grant_table_op(
>           break;
>       }
>   
> +#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
>       case GNTTABOP_cache_flush:
>       {
>           XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) cflush =
> @@ -3789,6 +3794,7 @@ long do_grant_table_op(
>           }
>           break;
>       }
> +#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
>   
>       default:
>           rc = -ENOSYS;
--------------aUJxhS7Ncp1fkvfo4wFfMZoN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/16/25 11:45 AM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250516094535.63472-3-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">The current underlying implementation of GNTTABOP_cache_flush on x86 won't
work as expected.  The provided {clean,invalidate}_dcache_va_range()
helpers only do a local pCPU cache flush, so the cache of previous pCPUs
where the vCPU might have run are not flushed.

However instead of attempting to fix this, make the GNTTABOP_cache_flush
operation only available to ARM.  There are no known users on x86, the
implementation is broken, and other architectures don't have grant-table
support yet.

With that operation not implemented on x86, the related
{clean,invalidate}_dcache_va_range() helpers can also be removed.

Fixes: f62dc81c2df7 ("x86: introduce more cache maintenance operations")
Fixes: 18e8d22fe750 ("introduce GNTTABOP_cache_flush")
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
Changes since v1:
 - Introduce Kconfig option.
 - Introduce CHANGELOG entry.
---
 CHANGELOG.md                        |  3 +++
 xen/arch/x86/include/asm/flushtlb.h | 19 -------------------
 xen/common/Kconfig                  |  5 +++++
 xen/common/grant_table.c            |  6 ++++++
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1ea06524db20..21d7be0aa389 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,6 +24,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
     - Ability to enable stack protector
 
 ### Removed
+ - On x86:
+   - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
+     broken.
 </pre>
    </blockquote>
    <pre>LGTM: Reviewed-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:20250516094535.63472-3-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 ## [4.20.0](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0</a>) - 2025-03-05
 
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 209ea1e62fae..cd625f911436 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -184,25 +184,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 }
 
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
-static inline int invalidate_dcache_va_range(const void *p,
-                                             unsigned long size)
-{ return -EOPNOTSUPP; }
-static inline int clean_and_invalidate_dcache_va_range(const void *p,
-                                                       unsigned long size)
-{
-    unsigned int order = get_order_from_bytes(size);
-    /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
-    return 0;
-}
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
-{
-    unsigned int order = get_order_from_bytes(size);
-
-    /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE_WRITEBACK | FLUSH_ORDER(order));
-    return 0;
-}
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6d43be2e6e8a..563b036474c0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -35,6 +35,11 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config HAS_GRANT_CACHE_FLUSH
+	bool
+	depends on GRANT_TABLE
+	default ARM
+
 config EVTCHN_FIFO
 	bool "Event Channel Fifo support" if EXPERT
 	default y
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e75ff98aff1c..cf131c43a1f1 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -940,6 +940,7 @@ static void reduce_status_for_pin(struct domain *rd,
         gnttab_clear_flags(rd, clear_flags, status);
 }
 
+#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
 static struct active_grant_entry *grant_map_exists(const struct domain *ld,
                                                    struct grant_table *rgt,
                                                    mfn_t mfn,
@@ -975,6 +976,7 @@ static struct active_grant_entry *grant_map_exists(const struct domain *ld,
 
     return ERR_PTR(-EINVAL);
 }
+#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
 
 union maptrack_node {
     struct {
@@ -3520,6 +3522,7 @@ gnttab_swap_grant_ref(XEN_GUEST_HANDLE_PARAM(gnttab_swap_grant_ref_t) uop,
     return 0;
 }
 
+#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
 static int _cache_flush(const gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 {
     struct domain *d, *owner;
@@ -3631,6 +3634,7 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
 
     return 0;
 }
+#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
 
 long do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
@@ -3773,6 +3777,7 @@ long do_grant_table_op(
         break;
     }
 
+#ifdef CONFIG_HAS_GRANT_CACHE_FLUSH
     case GNTTABOP_cache_flush:
     {
         XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) cflush =
@@ -3789,6 +3794,7 @@ long do_grant_table_op(
         }
         break;
     }
+#endif /* CONFIG_HAS_GRANT_CACHE_FLUSH */
 
     default:
         rc = -ENOSYS;
</pre>
    </blockquote>
  </body>
</html>

--------------aUJxhS7Ncp1fkvfo4wFfMZoN--

