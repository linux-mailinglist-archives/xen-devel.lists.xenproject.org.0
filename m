Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138F2008F5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGRH-00057x-BF; Fri, 19 Jun 2020 12:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmGRG-00057r-L0
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:48:10 +0000
X-Inumbo-ID: 1e8a1c30-b22b-11ea-bb7a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e8a1c30-b22b-11ea-bb7a-12813bfff9fa;
 Fri, 19 Jun 2020 12:48:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18EC3ACB8;
 Fri, 19 Jun 2020 12:48:03 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/msr: Disallow access to Processor Trace MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200619115823.22243-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32440578-e346-85cc-abad-1aa5694f0ab2@suse.com>
Date: Fri, 19 Jun 2020 14:48:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619115823.22243-1-andrew.cooper3@citrix.com>
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
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 13:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -168,6 +168,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      case MSR_TSX_FORCE_ABORT:
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE:
> +    case MSR_RTIT_OUTPUT_MASK:
> +    case MSR_RTIT_CTL:
> +    case MSR_RTIT_STATUS:
> +    case MSR_RTIT_CR3_MATCH:
> +    case MSR_RTIT_ADDR_A(0) ... MSR_RTIT_ADDR_B(3):

The respective CPUID field is 3 bits wide, so wouldn't it be better
to cover the full possible range (0...6 afaict)?

Jan

