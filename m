Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344F66B816
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478380.741538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJny-0005Mw-9j; Mon, 16 Jan 2023 07:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478380.741538; Mon, 16 Jan 2023 07:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJny-0005KN-68; Mon, 16 Jan 2023 07:21:18 +0000
Received: by outflank-mailman (input) for mailman id 478380;
 Mon, 16 Jan 2023 07:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJnv-0005KH-Vf
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:21:16 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c48ae01-956e-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 08:21:14 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id bk15so8396785ejb.9
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:21:14 -0800 (PST)
Received: from [192.168.1.93] (adsl-115.37.6.0.tellas.gr. [37.6.0.115])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b0085c3f08081esm6688249ejo.13.2023.01.15.23.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 23:21:13 -0800 (PST)
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
X-Inumbo-ID: 5c48ae01-956e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JtSkaQcflK1ahTg7wrc6bjO4kE/9rKv9Ni62yEvH/s=;
        b=D4ANXSIWN1we4EyrbxP6TS1dKkdqt7xSOuxTxGbYUdBN4UmzHDoEmSVgiq86cmW/I1
         38Y0Zz9wfRY8pNV+93qFGGoyIG9zAEUEAlmjxoDnDWpvolBOmPT8lupQsLQBA3n0jPpM
         NHJsaSmwBYEpGSaVKY2AJN4nuPMKnbrp7Lt54VIWcHwKHzMBgeo3tmDR3g+Ou6+g2Mzk
         bbeO0+2g1ogUNvo80T/IM3CrdJnzgUzQIlRSes0NLvBm9bOWiZ0+N8pAzRrgpAeXnqIL
         D9uuhD5cBB8lSdpMeD8NMVa+0HfVDprE6Wl3FgrnR6TQLxmOYv88qIvV69lth18OcqKT
         /CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JtSkaQcflK1ahTg7wrc6bjO4kE/9rKv9Ni62yEvH/s=;
        b=Rjq/0K7q3hNGZxmFUciag7FTWh2NkUjcS8bCBaJgHmlBvpqPJLiJSnTL5GtH/swSqq
         +UJL7DfpKDHeX2W+Ciq4QBnayVEvDoqrQoXvhjvHL9H95aWoPBMI2WALhwr8A2sl/mVL
         LOB5tM+0EkHiwflmNdmLcuR+2fi8zmOGBp8ijn3xkfK+Viu2Gjkr+kzwB/nlLiDeC0j6
         vY7E8GoEMsVzpLctoHSSaIqoHpEUYenPJ4N87pJId1XEpFEse/qRMHnKTJ6XGAs67foS
         7pTlHXNuID1XTn00INq66gp/zQJlu5k/l4Q3SOISEiJxbJ5JiMEAQAJ5xxPAHdho1AF5
         agnQ==
X-Gm-Message-State: AFqh2koyd+rzak5l+gGZA6cQRhwYDL5bhY/Ncis8f/O5vL4OQORtuZHd
	8jWMrHoKSx2prHxhwOV4hWZ/dXJsWIk=
X-Google-Smtp-Source: AMrXdXv5qu3GRSkdYu6nL25slAEnZKoB4CTJIsdIjI3L02KPY4u05mp84FrUfX19YuL3tOUUz6olaA==
X-Received: by 2002:a17:907:cb89:b0:870:8beb:9735 with SMTP id un9-20020a170907cb8900b008708beb9735mr1357971ejc.54.1673853673953;
        Sun, 15 Jan 2023 23:21:13 -0800 (PST)
Message-ID: <f620f8ee-e852-de62-53ef-5cd243e4cc09@gmail.com>
Date: Mon, 16 Jan 2023 09:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-6-burzalodowa@gmail.com>
In-Reply-To: <20230116070431.905594-6-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/23 09:04, Xenia Ragiadakou wrote:
> The variable untrusted_msi indicates whether the system is vulnerable to
> CVE-2011-1898 due to the absence of interrupt remapping  support.
> AMD iommus with interrupt remapping disabled are also exposed.
> Therefore move the definition of the variable to the common x86 iommu code.
> 
> Also, since the current implementation assumes that only PV guests are prone
> to this attack, take the opportunity to define untrusted_msi only when PV is
> enabled.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> 
> Changes in v3:
>    - change untrusted_msi from being VT-d specific to PV specific and
>      update commit log accordingly
>    - remove unnecessary #ifdef guard from its declaration
> 
>   xen/drivers/passthrough/vtd/iommu.c | 3 ---
>   xen/drivers/passthrough/x86/iommu.c | 5 +++++
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 62e143125d..dae2426cb9 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -54,9 +54,6 @@
>                                    ? dom_iommu(d)->arch.vtd.pgd_maddr \
>                                    : (pdev)->arch.vtd.pgd_maddr)
>   
> -/* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
> -bool __read_mostly untrusted_msi;
> -
>   bool __read_mostly iommu_igfx = true;
>   bool __read_mostly iommu_qinval = true;
>   #ifndef iommu_snoop
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index f671b0f2bb..c5021ea023 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -36,6 +36,11 @@ bool __initdata iommu_superpages = true;
>   
>   enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
>   
> +#ifdef CONFIG_PV
> +/* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
> +bool __read_mostly untrusted_msi;
> +#endif
> +
>   #ifndef iommu_intpost
>   /*
>    * In the current implementation of VT-d posted interrupts, in some extreme

Here, somehow I missed the part:
diff --git a/xen/drivers/passthrough/vtd/iommu.c 
b/xen/drivers/passthrough/vtd/iommu.c
index dae2426cb9..e97b1fe8cd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2767,6 +2767,7 @@ static int cf_check reassign_device_ownership(
          if ( !has_arch_pdevs(target) )
              vmx_pi_hooks_assign(target);

+#ifdef CONFIG_PV
          /*
           * Devices assigned to untrusted domains (here assumed to be 
any domU)
           * can attempt to send arbitrary LAPIC/MSI messages. We are 
unprotected
@@ -2775,6 +2776,7 @@ static int cf_check reassign_device_ownership(
          if ( !iommu_intremap && !is_hardware_domain(target) &&
               !is_system_domain(target) )
              untrusted_msi = true;
+#endif

          ret = domain_context_mapping(target, devfn, pdev);

I will fix it in the next version.

-- 
Xenia

