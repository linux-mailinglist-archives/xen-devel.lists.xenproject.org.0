Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD3A72C98
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928805.1331463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjeW-0002OS-2j; Thu, 27 Mar 2025 09:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928805.1331463; Thu, 27 Mar 2025 09:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjeW-0002Mz-00; Thu, 27 Mar 2025 09:35:56 +0000
Received: by outflank-mailman (input) for mailman id 928805;
 Thu, 27 Mar 2025 09:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txjeU-0002Mt-GZ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:35:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db226ea3-0aee-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 10:35:44 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso1213425a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:35:44 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf67591sm10779994a12.3.2025.03.27.02.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:35:43 -0700 (PDT)
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
X-Inumbo-ID: db226ea3-0aee-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743068144; x=1743672944; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T18egcP3xFa+j5OuoMHL/WYufvsDa+8iCmW2SU808RA=;
        b=m3PuO4busgihc8UspyXe1NTD5T0VgBRyrVRWd5YJM1iLRFGRpqr8vAe44RMm0EFMgr
         r4FE6Bx/myl1mQ4GG7Qp6wLjvj0w7+iGgevvv22cK4r0ryU+IOvCDIQnIvryGeYYgP93
         4sc1oU835RxRL/tGxpZ2lml2xynQjpXUxyr4jDbKCoTIjEaKF8I42H/0AIQs8oqD/aD0
         tvASNE+Z6V8phHg5SA821Jroc+rVRJg5xaHj/B48VX0TuE8CFiQlw8zmXcBxV7OZubUP
         9I9oQuqc5hgpDLxyCYo378HekEFWel94HvS0ubgNiORGI5zuNkupybzoKRFaSatv8VzQ
         YJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743068144; x=1743672944;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T18egcP3xFa+j5OuoMHL/WYufvsDa+8iCmW2SU808RA=;
        b=rh387Qv17xLp2hIyQjdMVVtOgN+cOTcq6Q8LKCHyIFzzCpZeGaMuJL3xawQZXQyHZ9
         pO7HINZaRfm/AU9hGwO1uCsn6SQ8i0pKiiLMxXHYHGOYiT/YFnjcXjApb0Ku4dhQ10ss
         Z4m8DlQctvdMOmWLV6oC9n3WfDZp5K6XWxzplndDEi92EUffR+tvSVjOEWQiW9c7ZMcc
         xorC9OUtYmSR9R2n/rEra+BwI18AsaDUGk9eA36dcjCjpWxMHC+aKzJlzIlkJPj1B8EG
         O/kr72bckvNC1zgHwanqT927Vph6O/un4fyxWKkrQcMeeT1PFCzoZuEjwYxykpN4t60x
         GaTw==
X-Forwarded-Encrypted: i=1; AJvYcCXnCKoaPoYj6IJUJhiOsV7U9YnoGuA+5poyjUA9x3rDgjgN4ajvjxw4EIIUziawNCsOuLey4lB4Koo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwN5oDFeGVwoX0xNOevnn9SOae9Z2+Yvh5Yq6nTPZQYO2oRldmD
	tCy8G3glQ2EXV6GEK78Mw03XA44+jMz4B7PAs4D1zF/JhJvzaTlY
X-Gm-Gg: ASbGncvG/R0DYnD51iCVy5HJcwVZt3R6oWP9lz64KuJveDmkvJuiGZxea4O4goTyKmX
	2eW0v3XBhc1YSbhLrLiVJMhox90g66OZgYdzn0kh8CCPW5td7cv/XDzHYDjuJdE8lAp0QQFiAfp
	H0TRs4fImMie8YR5lY+/NxtMQ3wVBnx1U+L/Ao6TFFbjZ/66ijEzEBQl6DMY2u5ghjGfLhypAgq
	SGTV9h9TiVOD2b3tfjR5xORs63e8qolVGK2UFiK/2rcO0svSMAqd+Wsu5MOZr8UUVbEHNd+4INT
	3fwvtDImtJGcjArL2CqkPD5o4c0a5CnS86PBWIR1kDGkabNbQZhhcMhUuGFPrVK2nOsMNPoEw7D
	XnbfYgGYUkRBF9+JbJRX6nrZkqu2jVGs=
X-Google-Smtp-Source: AGHT+IGCYK5cQ6E+FxSnyWjug5hyM1PZkTtI217RlaaPvp3n+c4yukNXWJADCwXsHItxap/xKyZVNQ==
X-Received: by 2002:a05:6402:2816:b0:5e5:49af:411d with SMTP id 4fb4d7f45d1cf-5ed8e7bf6c2mr3176756a12.17.1743068143422;
        Thu, 27 Mar 2025 02:35:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------I00DrlvXWfQL64HZgUb4pu1o"
Message-ID: <87fe5ebc-4bbd-4941-814b-5447be06a201@gmail.com>
Date: Thu, 27 Mar 2025 10:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-16-Penny.Zheng@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250326055053.3313146-16-Penny.Zheng@amd.com>

This is a multi-part message in MIME format.
--------------I00DrlvXWfQL64HZgUb4pu1o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/25 6:50 AM, Penny Zheng wrote:
> The following functions are only used to deal with XEN_SYSCTL_physinfo,
> then they shall be wrapped:
> - arch_do_physinfo
> - get_outstanding_claims
>
> Signed-off-by: Penny Zheng<Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - no need to wrap declaration
> - add transient #ifdef in sysctl.c for correct compilation
> ---
>   xen/arch/arm/sysctl.c   | 2 ++
>   xen/arch/riscv/stubs.c  | 2 ++
>   xen/arch/x86/sysctl.c   | 2 ++
>   xen/common/page_alloc.c | 2 ++
>   xen/common/sysctl.c     | 2 +-
>   5 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..2d350b700a 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,6 +15,7 @@
>   #include <asm/arm64/sve.h>
>   #include <public/sysctl.h>
>   
> +#ifdef CONFIG_SYSCTL
>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>   {
>       pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> @@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>       pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>   }
> +#endif
>   
>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 5951b0ce91..7b3f748886 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>       BUG_ON("unimplemented");
>   }
>   
> +#ifdef CONFIG_SYSCTL
>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>   {
>       BUG_ON("unimplemented");
>   }
> +#endif /* CONFIG_SYSCTL */

Considering that now we will have CONFIG_SYSCTL, I think it would be better just to drop
definition of arch_do_physinfo() from riscv/stubs.c as it was added to make common code build
for RISC-V happy.

Thanks.

~ Oleksii

>   
>   /* p2m.c */
>   
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 1b04947516..d7da476379 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
>       return ret;
>   }
>   
> +#ifdef CONFIG_SYSCTL
>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>   {
>       memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
> @@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>       if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>           pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
>   }
> +#endif
>   
>   long arch_do_sysctl(
>       struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 5803a1ef4e..36424a9245 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -601,6 +601,7 @@ out:
>       return ret;
>   }
>   
> +#ifdef CONFIG_SYSCTL
>   void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
>   {
>       spin_lock(&heap_lock);
> @@ -608,6 +609,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
>       *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
>       spin_unlock(&heap_lock);
>   }
> +#endif /* CONFIG_SYSCTL */
>   
>   static bool __read_mostly first_node_initialised;
>   #ifndef CONFIG_SEPARATE_XENHEAP
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index ccce7fe963..76622503e2 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -258,7 +258,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>           ret = sched_adjust_global(&op->u.scheduler_op);
>           break;
>   
> -#endif /* CONFIG_SYSCTL */
>       case XEN_SYSCTL_physinfo:
>       {
>           struct xen_sysctl_physinfo *pi = &op->u.physinfo;
> @@ -301,6 +300,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>       }
>       break;
>   
> +#endif /* CONFIG_SYSCTL */
>       case XEN_SYSCTL_numainfo:
>       {
>           unsigned int i, j, num_nodes;
--------------I00DrlvXWfQL64HZgUb4pu1o
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/26/25 6:50 AM, Penny Zheng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250326055053.3313146-16-Penny.Zheng@amd.com">
      <pre wrap="" class="moz-quote-pre">The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo
- get_outstanding_claims

Signed-off-by: Penny Zheng <a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@amd.com">&lt;Penny.Zheng@amd.com&gt;</a>
---
v1 -&gt; v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/arch/arm/sysctl.c   | 2 ++
 xen/arch/riscv/stubs.c  | 2 ++
 xen/arch/x86/sysctl.c   | 2 ++
 xen/common/page_alloc.c | 2 ++
 xen/common/sysctl.c     | 2 +-
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..2d350b700a 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
 #include &lt;asm/arm64/sve.h&gt;
 #include &lt;public/sysctl.h&gt;
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi-&gt;capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi-&gt;arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
+#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91..7b3f748886 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_SYSCTL */</pre>
    </blockquote>
    <pre>Considering that now we will have CONFIG_SYSCTL, I think it would be better just to drop
definition of arch_do_physinfo() from riscv/stubs.c as it was added to make common code build
for RISC-V happy.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250326055053.3313146-16-Penny.Zheng@amd.com">
      <pre wrap="" class="moz-quote-pre">
 
 /* p2m.c */
 
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..d7da476379 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi-&gt;hw_cap, boot_cpu_data.x86_capability,
@@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi-&gt;capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
+#endif
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5803a1ef4e..36424a9245 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -601,6 +601,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&amp;heap_lock);
@@ -608,6 +609,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
     *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
     spin_unlock(&amp;heap_lock);
 }
+#endif /* CONFIG_SYSCTL */
 
 static bool __read_mostly first_node_initialised;
 #ifndef CONFIG_SEPARATE_XENHEAP
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index ccce7fe963..76622503e2 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -258,7 +258,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = sched_adjust_global(&amp;op-&gt;u.scheduler_op);
         break;
 
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_physinfo:
     {
         struct xen_sysctl_physinfo *pi = &amp;op-&gt;u.physinfo;
@@ -301,6 +300,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     }
     break;
 
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_numainfo:
     {
         unsigned int i, j, num_nodes;
</pre>
    </blockquote>
  </body>
</html>

--------------I00DrlvXWfQL64HZgUb4pu1o--

