Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB7F2FD763
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71680.128552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HWi-0005Ni-Bn; Wed, 20 Jan 2021 17:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71680.128552; Wed, 20 Jan 2021 17:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HWi-0005NL-8R; Wed, 20 Jan 2021 17:44:16 +0000
Received: by outflank-mailman (input) for mailman id 71680;
 Wed, 20 Jan 2021 17:44:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2HWg-0005NG-SW
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:44:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HWf-0006By-HS; Wed, 20 Jan 2021 17:44:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HWf-00080J-9j; Wed, 20 Jan 2021 17:44:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=hk3aYC9kVmQdbH4T//kFU9NPt5/jYQQGZ3acn7lCibQ=; b=werg4A1v4Z+qbWP6O/b12aZCax
	/N6kRLeBU5NGToLbISvddVpu2IJCJZkJ2OnBMijnvMRfTFX71YfnOEsooObHLS3eRe3z15Q2NnL5t
	uKwW4z0oYslxoYuN9iMoRh69BCF5i0jFnzXxb3aMiqWIve97ex4uLyp9PCCm8jQdOqCg=;
Subject: Re: [XEN PATCH] xen/arm: Hide Pointer Authentication (PAC)
To: Vladimir Murzin <vladimir.murzin@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
References: <20210120112712.9534-1-vladimir.murzin@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2b70b207-4893-e08a-6fdc-52c0b5c8cc6b@xen.org>
Date: Wed, 20 Jan 2021 17:44:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120112712.9534-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Vladimir,

On 20/01/2021 11:27, Vladimir Murzin wrote:
> The ARMv8.3 Pointer Authentication extension is not supported by Xen
> at the moment, so do not expose that via ID register.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/cpufeature.c        |  6 +++++
>   xen/include/asm-arm/cpufeature.h | 38 +++++++++++++++++++++++++++++++-
>   2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 99fe4db28..1d8878380 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -187,6 +187,12 @@ static int __init create_guest_cpuinfo(void)
>   
>       /* Hide MTE support as Xen does not support it */
>       guest_cpuinfo.pfr64.mte = 0;
> +
> +    /* Hide PAC support as Xen does not support it */
> +    guest_cpuinfo.isa64.apa = 0;
> +    guest_cpuinfo.isa64.api = 0;
> +    guest_cpuinfo.isa64.gpa = 0;
> +    guest_cpuinfo.isa64.gpi = 0;
>   #endif
>   
>       /* Hide AMU support */
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index c6e5711b2..43135abef 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -212,8 +212,44 @@ struct cpuinfo_arm {
>           };
>       } mm64;
>   
> -    struct {
> +    union {
>           uint64_t bits[2];
> +        struct {
> +            /* ISAR0 */
> +            unsigned long __res0:4;
> +            unsigned long aes:4;
> +            unsigned long sha1:4;
> +            unsigned long sha2:4;
> +            unsigned long crc32:4;
> +            unsigned long atomic:4;
> +            unsigned long __res1:4;
> +            unsigned long rdm:4;
> +            unsigned long sha3:4;
> +            unsigned long sm3:4;
> +            unsigned long sm4:4;
> +            unsigned long dp:4;
> +            unsigned long fhm:4;
> +            unsigned long ts:4;
> +            unsigned long tlb:4;
> +            unsigned long rndr:4;
> +
> +            /* ISAR1 */
> +            unsigned long dpb:4;
> +            unsigned long apa:4;
> +            unsigned long api:4;
> +            unsigned long jscvt:4;
> +            unsigned long fcma:4;
> +            unsigned long lrcpc:4;
> +            unsigned long gpa:4;
> +            unsigned long gpi:4;
> +            unsigned long frintts:4;
> +            unsigned long sb:4;
> +            unsigned long specres:4;
> +            unsigned long bf16:4;
> +            unsigned long dgh:4;
> +            unsigned long i8mm:4;
> +            unsigned long __res0:8;

This unfortunately break the build on arm64 becase __res0 is defined 
twiced in the structure:

oss/xen/xen/include/asm/cpufeature.h:251:27: error: duplicate member 
‘__res0’
              unsigned long __res0:8;
                            ^~~~~~

The change is trivial, so I have resolved it (see change below) and 
committed it:

diff --git a/xen/include/asm-arm/cpufeature.h 
b/xen/include/asm-arm/cpufeature.h
index 2baf7919615d..70cb67301f74 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -248,7 +248,7 @@ struct cpuinfo_arm {
              unsigned long bf16:4;
              unsigned long dgh:4;
              unsigned long i8mm:4;
-            unsigned long __res0:8;
+            unsigned long __res2:8;
          };
      } isa64;

Cheers,

-- 
Julien Grall

