Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88204C355F7
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 12:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156124.1485417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGblC-00048m-9e; Wed, 05 Nov 2025 11:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156124.1485417; Wed, 05 Nov 2025 11:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGblC-00046j-6H; Wed, 05 Nov 2025 11:33:06 +0000
Received: by outflank-mailman (input) for mailman id 1156124;
 Wed, 05 Nov 2025 11:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vGblA-00046d-KH
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 11:33:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30360758-ba3b-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 12:33:02 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-640f0f82da9so2746414a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 03:33:02 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640e6a5cb52sm4347161a12.23.2025.11.05.03.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 03:33:01 -0800 (PST)
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
X-Inumbo-ID: 30360758-ba3b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762342382; x=1762947182; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3fbrSR+S0wjwZx2MzK904Nl57+lEsQQsSVR5YtMngU=;
        b=WUJNs3WuZZrAeGlEdbtZzFwcJZQGmL1SfM01QJKCx1UE9XKsC3VipU6TpCo+v0R3bH
         KeSlcqUi/iqh1Po/vgccq9f0VsDNLjczvZBvQKbEnKDsyWO2tOi1y7ydnkWPacoy7zSE
         NO1IRTfEBD72qUgwIznxhtvXyECzEH0ZjCFiKp47jpiLf13yHg+ar+YDM1R6nlBphP2T
         QPfX+PQi02//V7zf2Vdio99YHt1qwKABhcXTHMocyNSgrJKRejOjiYAt80fSLNGNEQn8
         kg2Ddldf0qSjLwSjOfSSl06qjGzB/BG0LH8ACbrdgd1IEEBdesJUIdprECmrURimMCI1
         SbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762342382; x=1762947182;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3fbrSR+S0wjwZx2MzK904Nl57+lEsQQsSVR5YtMngU=;
        b=Cox7P536+8Kya08HAMT2dVuW2DCUUAPbLXD4apg0bxPJb6nErY22OVVupOnqQEjk0Q
         3n0eSKtb74HUxMd2jyNCUT16oPhx8GW5T/Yn2SSGwpA9cE8VYtkWADSzUnFki9lE3z8f
         lpo2nU8fKViOxSgSFdQsiiQ+/q1A6QjlTfjdT7hfg/CNuRstWSXudCuTbtKFVDdBA5RX
         /VaCHczNSqVuRfIPGQ43SL7ZxCAmQgd8LMChvcModXLcDXMnzdmVAX6uTFrXSLmEst0G
         Pu4F7elJrRnwrigcpwSAjkTg3hzNMP8hNJD9eXA1IRRX1+7P+cgeU9IIpRNc5QM3vKOn
         Pd8A==
X-Forwarded-Encrypted: i=1; AJvYcCVtOA2QI9o/0ShCbNskJ44YUS95H1MYE7nTXY0NFc+1dSG98QWRPWSo4G08cP7G8Fh+HHSYTv/XC6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDS9jFauA8VhvK7APFoHUtFX6W0T1P7VN5dFlFT79RCTnW4g2y
	dIwTrMA/z79ddt0ue5LlkFzdS7b13N2DpCai48IbY0qXtzaAzMRza+d+
X-Gm-Gg: ASbGncv/TNM9NxBFHq+Mzmy9UEfPbjAoEx3XeMLlHQQnrM1uhd5itp2Cv91Z8ylPAGB
	5Cd/2Z65mkwshJJKDpG3sXGSRJAB6y4UV81jFapA8OWmfQoZxn52JfZmAuC5HKWeg4Ux98aKpiE
	ENClaaUAY5T5LzPeq4exd+twGsOfPfaBqypShi7hZbMvd0Z8Ml4/QCShDOOosJC7j2qJ2tbT7DD
	KGHmbjM8hgCJw8M33+dLd0dtEIfqaws2mQisj10W2bSEnzZpUnvdhg7KOmwPUmUNTyX8J525Kul
	fgn1V9Eg9rHz/a2D8FPVGUojMqP5HhtTfeICpGUngJw0PneSVCQBvPXykwT2O19vT8KPfL7qccY
	5zNpKvPfJH51uCvfkg51RlH8UpAjR8CMriOgppd31w4CnmZCsfJe5AD97rr+B0O3mThEAUBBpKZ
	n8oJdak8tT8PMmYfGo/GnhxiGcovR2i9mE1nuORmGubG4Z3qjRiw==
X-Google-Smtp-Source: AGHT+IFfxiQQE/szujT+Xc8iyZvMhxrB2hkpgxdfmS3xI5cIhmKMS52QQMN0tGvMrXUW6rQ853A7Sw==
X-Received: by 2002:a05:6402:26cd:b0:640:ccb0:f4e9 with SMTP id 4fb4d7f45d1cf-64105a3ee29mr2289182a12.19.1762342381584;
        Wed, 05 Nov 2025 03:33:01 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------tc1rLMnO1ZU67CxLD9ETtSQQ"
Message-ID: <3baba476-9d64-4619-b391-4afcc5fd7dba@gmail.com>
Date: Wed, 5 Nov 2025 12:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: adjust soft-reset arch dependency
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>

This is a multi-part message in MIME format.
--------------tc1rLMnO1ZU67CxLD9ETtSQQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/30/25 1:10 PM, Jan Beulich wrote:
> Arm's arch_domain_soft_reset() returning -ENOSYS is quite unhelpful: This
> way a domain will be crashed if a tool stack mistakenly invokes
> XEN_DOMCTL_soft_reset on it. Instead the tool stack should be told of its
> mistake.
>
> Introduce HAS_SOFT_RESET, implied only by x86. "imply" rather than
> "select" such that HAS_SOFT_RESET can later gain a dependency on
> MGMT_HYPERCALLS. That way HAS_SOFT_RESET will go off when
> MGMT_HYPERCALLS is off.
>
> Check the new setting early in domctl handling, and compile out the thus
> dead (when HAS_SOFT_RESET=n) domain_soft_reset() as well as its dedicated
> helpers.
>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

LGTM:

Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -875,11 +875,6 @@ void arch_domain_unpause(struct domain *
>   {
>   }
>   
> -int arch_domain_soft_reset(struct domain *d)
> -{
> -    return -ENOSYS;
> -}
> -
>   void arch_domain_creation_finished(struct domain *d)
>   {
>       p2m_domain_creation_finished(d);
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -214,11 +214,6 @@ void arch_domain_unpause(struct domain *
>       BUG_ON("unimplemented");
>   }
>   
> -int arch_domain_soft_reset(struct domain *d)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>   void arch_domain_creation_finished(struct domain *d)
>   {
>       BUG_ON("unimplemented");
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -188,11 +188,6 @@ void arch_domain_unpause(struct domain *
>       BUG_ON("unimplemented");
>   }
>   
> -int arch_domain_soft_reset(struct domain *d)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>   void arch_domain_creation_finished(struct domain *d)
>   {
>       BUG_ON("unimplemented");
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -29,6 +29,7 @@ config X86
>   	select HAS_PCI_MSI
>   	select HAS_PIRQ
>   	select HAS_SCHED_GRANULARITY
> +	imply HAS_SOFT_RESET
>   	select HAS_UBSAN
>   	select HAS_VMAP
>   	select HAS_VPCI if HVM
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1030,6 +1030,7 @@ void arch_domain_unpause(struct domain *
>           viridian_time_domain_thaw(d);
>   }
>   
> +#ifdef CONFIG_HAS_SOFT_RESET
>   int arch_domain_soft_reset(struct domain *d)
>   {
>       struct page_info *page = virt_to_page(d->shared_info), *new_page;
> @@ -1131,6 +1132,7 @@ int arch_domain_soft_reset(struct domain
>   
>       return ret;
>   }
> +#endif /* CONFIG_HAS_SOFT_RESET */
>   
>   void arch_domain_creation_finished(struct domain *d)
>   {
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -155,6 +155,9 @@ config HAS_PMAP
>   config HAS_SCHED_GRANULARITY
>   	bool
>   
> +config HAS_SOFT_RESET
> +	bool
> +
>   config HAS_STACK_PROTECTOR
>   	bool
>   
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -2351,6 +2351,7 @@ argo_destroy(struct domain *d)
>       write_unlock(&L1_global_argo_rwlock);
>   }
>   
> +#ifdef CONFIG_HAS_SOFT_RESET
>   void
>   argo_soft_reset(struct domain *d)
>   {
> @@ -2374,3 +2375,4 @@ argo_soft_reset(struct domain *d)
>   
>       write_unlock(&L1_global_argo_rwlock);
>   }
> +#endif /* CONFIG_HAS_SOFT_RESET */
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1687,6 +1687,7 @@ void domain_unpause_except_self(struct d
>           domain_unpause(d);
>   }
>   
> +#ifdef CONFIG_HAS_SOFT_RESET
>   int domain_soft_reset(struct domain *d, bool resuming)
>   {
>       struct vcpu *v;
> @@ -1724,6 +1725,7 @@ int domain_soft_reset(struct domain *d,
>   
>       return rc;
>   }
> +#endif /* CONFIG_HAS_SOFT_RESET */
>   
>   int vcpu_reset(struct vcpu *v)
>   {
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -466,6 +466,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>   
>       case XEN_DOMCTL_soft_reset:
>       case XEN_DOMCTL_soft_reset_cont:
> +        if ( !IS_ENABLED(CONFIG_HAS_SOFT_RESET) )
> +        {
> +            ret = -EOPNOTSUPP;
> +            break;
> +        }
> +
>           if ( d == current->domain ) /* no domain_pause() */
>           {
>               ret = -EINVAL;
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3962,6 +3962,7 @@ int gnttab_release_mappings(struct domai
>       return 0;
>   }
>   
> +#ifdef CONFIG_HAS_SOFT_RESET
>   void grant_table_warn_active_grants(struct domain *d)
>   {
>       struct grant_table *gt = d->grant_table;
> @@ -4006,6 +4007,7 @@ void grant_table_warn_active_grants(stru
>   
>   #undef WARN_GRANT_MAX
>   }
> +#endif /* CONFIG_HAS_SOFT_RESET */
>   
>   void
>   grant_table_destroy(
--------------tc1rLMnO1ZU67CxLD9ETtSQQ
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
    <div class="moz-cite-prefix">On 10/30/25 1:10 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com">
      <pre wrap="" class="moz-quote-pre">Arm's arch_domain_soft_reset() returning -ENOSYS is quite unhelpful: This
way a domain will be crashed if a tool stack mistakenly invokes
XEN_DOMCTL_soft_reset on it. Instead the tool stack should be told of its
mistake.

Introduce HAS_SOFT_RESET, implied only by x86. "imply" rather than
"select" such that HAS_SOFT_RESET can later gain a dependency on
MGMT_HYPERCALLS. That way HAS_SOFT_RESET will go off when
MGMT_HYPERCALLS is off.

Check the new setting early in domctl handling, and compile out the thus
dead (when HAS_SOFT_RESET=n) domain_soft_reset() as well as its dedicated
helpers.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>LGTM:

Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -875,11 +875,6 @@ void arch_domain_unpause(struct domain *
 {
 }
 
-int arch_domain_soft_reset(struct domain *d)
-{
-    return -ENOSYS;
-}
-
 void arch_domain_creation_finished(struct domain *d)
 {
     p2m_domain_creation_finished(d);
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -214,11 +214,6 @@ void arch_domain_unpause(struct domain *
     BUG_ON("unimplemented");
 }
 
-int arch_domain_soft_reset(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_domain_creation_finished(struct domain *d)
 {
     BUG_ON("unimplemented");
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -188,11 +188,6 @@ void arch_domain_unpause(struct domain *
     BUG_ON("unimplemented");
 }
 
-int arch_domain_soft_reset(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_domain_creation_finished(struct domain *d)
 {
     BUG_ON("unimplemented");
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
+	imply HAS_SOFT_RESET
 	select HAS_UBSAN
 	select HAS_VMAP
 	select HAS_VPCI if HVM
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1030,6 +1030,7 @@ void arch_domain_unpause(struct domain *
         viridian_time_domain_thaw(d);
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 int arch_domain_soft_reset(struct domain *d)
 {
     struct page_info *page = virt_to_page(d-&gt;shared_info), *new_page;
@@ -1131,6 +1132,7 @@ int arch_domain_soft_reset(struct domain
 
     return ret;
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
 
 void arch_domain_creation_finished(struct domain *d)
 {
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -155,6 +155,9 @@ config HAS_PMAP
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_SOFT_RESET
+	bool
+
 config HAS_STACK_PROTECTOR
 	bool
 
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2351,6 +2351,7 @@ argo_destroy(struct domain *d)
     write_unlock(&amp;L1_global_argo_rwlock);
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 void
 argo_soft_reset(struct domain *d)
 {
@@ -2374,3 +2375,4 @@ argo_soft_reset(struct domain *d)
 
     write_unlock(&amp;L1_global_argo_rwlock);
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1687,6 +1687,7 @@ void domain_unpause_except_self(struct d
         domain_unpause(d);
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 int domain_soft_reset(struct domain *d, bool resuming)
 {
     struct vcpu *v;
@@ -1724,6 +1725,7 @@ int domain_soft_reset(struct domain *d,
 
     return rc;
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
 
 int vcpu_reset(struct vcpu *v)
 {
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -466,6 +466,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     case XEN_DOMCTL_soft_reset:
     case XEN_DOMCTL_soft_reset_cont:
+        if ( !IS_ENABLED(CONFIG_HAS_SOFT_RESET) )
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
         if ( d == current-&gt;domain ) /* no domain_pause() */
         {
             ret = -EINVAL;
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3962,6 +3962,7 @@ int gnttab_release_mappings(struct domai
     return 0;
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 void grant_table_warn_active_grants(struct domain *d)
 {
     struct grant_table *gt = d-&gt;grant_table;
@@ -4006,6 +4007,7 @@ void grant_table_warn_active_grants(stru
 
 #undef WARN_GRANT_MAX
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
 
 void
 grant_table_destroy(
</pre>
    </blockquote>
  </body>
</html>

--------------tc1rLMnO1ZU67CxLD9ETtSQQ--

