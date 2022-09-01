Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D945A9EC0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 20:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396897.637286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTojE-0005Cb-KD; Thu, 01 Sep 2022 18:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396897.637286; Thu, 01 Sep 2022 18:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTojE-00059I-Fn; Thu, 01 Sep 2022 18:15:48 +0000
Received: by outflank-mailman (input) for mailman id 396897;
 Thu, 01 Sep 2022 18:15:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTojC-00059C-Vl
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 18:15:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTojC-0001cU-Mv; Thu, 01 Sep 2022 18:15:46 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTojC-0004OO-Fb; Thu, 01 Sep 2022 18:15:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=+eJ8yffwd3+I1PKdtLVlUSP0MI8XZQkWC7Gi+VUC6GM=; b=JwP2v6fFiKfkkUgxu5nNikbguO
	ykaslXD4kjHqXWQPmLUi0M4cT5jp4M3p+GE8KYO5SYQ2NY1Jftm315pO6J1T4KGB7+5S9RyhEQWR5
	E+qDAjc5lOhfhNcdnuulpcf6EbaP8agyfcQSFi17w3oWRJvekrEYn1aW2shFeTBdECfg=;
Message-ID: <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
Date: Thu, 1 Sep 2022 19:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 01/09/2022 10:13, Rahul Singh wrote:
> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
> disable xenstore interface for dom0less guests.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v3:
>   - new patch in this version
> ---
>   docs/misc/arm/device-tree/booting.txt |  4 ++++
>   xen/arch/arm/domain_build.c           | 10 +++++++---
>   xen/arch/arm/include/asm/kernel.h     |  3 +++
>   3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index edef98e6d1..87f57f8889 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -204,6 +204,10 @@ with the following properties:
>       - "disabled"
>       Xen PV interfaces are disabled.
>   
> +    - no-xenstore
> +    Xen PV interfaces, including grant-table will be enabled for the VM but
> +    xenstore will be disabled for the VM.

NIT: I would drop one of the "for the VM" as it seems to be redundant.

> +
>       If the xen,enhanced property is present with no value, it defaults
>       to "enabled". If the xen,enhanced property is not present, PV
>       interfaces are disabled.
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4b24261825..8dd9984225 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3336,10 +3336,14 @@ static int __init construct_domU(struct domain *d,
>            (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>       {
>           if ( hardware_domain )
> -            kinfo.dom0less_enhanced = true;
> +            kinfo.dom0less_xenstore = true;
>           else
> -            panic("Tried to use xen,enhanced without dom0\n");
> +            panic("Tried to use xen,enhanced without dom0 without no-xenstore\n");

This is a bit hard to parse. How about:

"At the moment, Xenstore support requires dom0 to be present"

>       }
> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
> +        kinfo.dom0less_xenstore = false;
> +
> +    kinfo.dom0less_enhanced = true;

Wouldn't this now set dom0less_enhanced unconditionally?

>   
>       if ( vcpu_create(d, 0) == NULL )
>           return -ENOMEM;
> @@ -3379,7 +3383,7 @@ static int __init construct_domU(struct domain *d,
>       if ( rc < 0 )
>           return rc;
>   
> -    if ( kinfo.dom0less_enhanced )
> +    if ( kinfo.dom0less_xenstore )
>       {
>           ASSERT(hardware_domain);
>           rc = alloc_xenstore_evtchn(d);
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index c4dc039b54..3d7fa94910 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -39,6 +39,9 @@ struct kernel_info {
>       /* Enable PV drivers */
>       bool dom0less_enhanced;
>   
> +    /* Enable Xenstore */
> +    bool dom0less_xenstore;
> +

AFAIU, it is not possible to have *_xenstore = true and *_enhanced = 
false. I think it would be clearer if ``dom0less_enhanced`` is turned to 
an enum with 3 values:
  - None
  - NOXENSTORE/BASIC
  - FULLY_ENHANCED

If we want to be future proof, I would use a field 'flags' where 
non-zero means enhanced. Each bit would indicate which features of Xen 
is exposed.

Cheers,

-- 
Julien Grall

