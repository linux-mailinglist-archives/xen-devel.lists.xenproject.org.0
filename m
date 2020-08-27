Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3525484A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 17:04:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBJRQ-0007nZ-Ck; Thu, 27 Aug 2020 15:03:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBJRO-0007nU-PQ
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 15:03:50 +0000
X-Inumbo-ID: 218e0ac4-f14e-41c6-b541-2cd8b870ea27
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 218e0ac4-f14e-41c6-b541-2cd8b870ea27;
 Thu, 27 Aug 2020 15:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBB26B80D;
 Thu, 27 Aug 2020 15:04:20 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] x86/svm: silently drop writes to SYSCFG and
 related MSRs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52cde027-e7c2-3ca7-3d7e-7abfe19198da@suse.com>
Date: Thu, 27 Aug 2020 17:03:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820150835.27440-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.2020 17:08, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1917,6 +1917,21 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>              goto gpf;
>          break;
>  
> +    case MSR_K8_TOP_MEM1:
> +    case MSR_K8_TOP_MEM2:
> +        *msr_content = 0;
> +        break;

Any reason you don't fold this with ...

> +    case MSR_K8_SYSCFG:
> +        /*
> +         * Return MtrrFixDramEn: albeit the current emulated MTRR
> +         * implementation doesn't support the Extended Type-Field Format having
> +         * such bit set is common on AMD hardware and is harmless as long as
> +         * MtrrFixDramModEn isn't set.
> +         */
> +        *msr_content = K8_MTRRFIXRANGE_DRAM_ENABLE;
> +        break;
> +
>      case MSR_K8_VM_CR:
>          *msr_content = 0;
>          break;

... this existing case, and ...

> @@ -2094,6 +2109,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>              goto gpf;
>          break;
>  
> +    case MSR_K8_TOP_MEM1:
> +    case MSR_K8_TOP_MEM2:
> +    case MSR_K8_SYSCFG:
> +        /* Drop writes. */
> +        break;
> +
>      case MSR_K8_VM_CR:
>          /* ignore write. handle all bits as read-only. */
>          break;

... similarly these?

Jan

