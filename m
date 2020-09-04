Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA525D3C5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7DH-0005st-42; Fri, 04 Sep 2020 08:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE7DF-0005sm-Bz
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:36:49 +0000
X-Inumbo-ID: 07531999-d728-4a81-a305-184762203184
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07531999-d728-4a81-a305-184762203184;
 Fri, 04 Sep 2020 08:36:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F9F8AD1A;
 Fri,  4 Sep 2020 08:36:47 +0000 (UTC)
Subject: Re: [PATCH v3 2/8] x86/svm: silently drop writes to SYSCFG and
 related MSRs
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <104af385-f554-b2f6-6d08-37281bb72bba@suse.com>
Date: Fri, 4 Sep 2020 10:36:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901105445.22277-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 01.09.2020 12:54, Roger Pau Monne wrote:
> The SYSCFG, TOP_MEM1 and TOP_MEM2 MSRs are currently exposed to guests
> and writes are silently discarded. Make this explicit in the SVM code
> now, and just return default constant values when attempting to read
> any of the MSRs, while continuing to silently drop writes.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1917,6 +1917,9 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>              goto gpf;
>          break;
>  
> +    case MSR_K8_SYSCFG:
> +    case MSR_K8_TOP_MEM1:
> +    case MSR_K8_TOP_MEM2:
>      case MSR_K8_VM_CR:
>          *msr_content = 0;
>          break;

Andrew, since you did suggest otherwise before, may I ask for an
explicit statement of yours here, be it in ack/nak form or something
less formal?

Jan

