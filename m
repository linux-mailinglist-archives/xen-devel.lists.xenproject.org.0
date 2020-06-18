Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BB1FF317
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlue4-0004Gu-7O; Thu, 18 Jun 2020 13:31:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlue2-0004Gp-NL
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:31:54 +0000
X-Inumbo-ID: 12a032b0-b168-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12a032b0-b168-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 13:31:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E607AFF7;
 Thu, 18 Jun 2020 13:31:52 +0000 (UTC)
Subject: Re: [PATCH v1 1/7] x86/vmx: add Intel PT MSR definitions
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <2141998496.8765382.1592320789155.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82380390-f3c8-29e1-202e-a32abf5d8f58@suse.com>
Date: Thu, 18 Jun 2020 15:31:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2141998496.8765382.1592320789155.JavaMail.zimbra@cert.pl>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.06.2020 17:19, Michał Leszczyński wrote:
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -621,4 +621,41 @@
>  #define MSR_PKGC9_IRTL			0x00000634
>  #define MSR_PKGC10_IRTL			0x00000635
>  
> +/* Intel PT MSRs */
> +#define MSR_IA32_RTIT_CTL              0x00000570
> +#define RTIT_CTL_TRACEEN               (1ULL << 0)
> +#define RTIT_CTL_CYCEN                 (1ULL << 1)
> +#define RTIT_CTL_OS                    (1ULL << 2)
> +#define RTIT_CTL_USR                   (1ULL << 3)
> +#define RTIT_CTL_PWR_EVT_EN            (1ULL << 4)
> +#define RTIT_CTL_FUP_ON_PTW            (1ULL << 5)
> +#define RTIT_CTL_FABRIC_EN             (1ULL << 6)
> +#define RTIT_CTL_CR3_FILTER            (1ULL << 7)
> +#define RTIT_CTL_TOPA                  (1ULL << 8)
> +#define RTIT_CTL_MTC_EN                (1ULL << 9)
> +#define RTIT_CTL_TSC_EN                (1ULL << 10)
> +#define RTIT_CTL_DIS_RETC              (1ULL << 11)
> +#define RTIT_CTL_PTW_EN                (1ULL << 12)
> +#define RTIT_CTL_BRANCH_EN             (1ULL << 13)
> +#define RTIT_CTL_MTC_FREQ_OFFSET       14
> +#define RTIT_CTL_MTC_FREQ              (0x0fULL << RTIT_CTL_MTC_FREQ_OFFSET)
> +#define RTIT_CTL_CYC_THRESH_OFFSET     19
> +#define RTIT_CTL_CYC_THRESH            (0x0fULL << RTIT_CTL_CYC_THRESH_OFFSET)
> +#define RTIT_CTL_PSB_FREQ_OFFSET       24
> +#define RTIT_CTL_PSB_FREQ              (0x0fULL << RTIT_CTL_PSB_FREQ_OFFSET)
> +#define RTIT_CTL_ADDR_OFFSET(n)        (32 + 4 * (n))
> +#define RTIT_CTL_ADDR(n)               (0x0fULL << RTIT_CTL_ADDR_OFFSET(n))
> +#define MSR_IA32_RTIT_STATUS           0x00000571
> +#define RTIT_STATUS_FILTER_EN          (1ULL << 0)
> +#define RTIT_STATUS_CONTEXT_EN         (1ULL << 1)
> +#define RTIT_STATUS_TRIGGER_EN         (1ULL << 2)
> +#define RTIT_STATUS_ERROR              (1ULL << 4)
> +#define RTIT_STATUS_STOPPED            (1ULL << 5)
> +#define RTIT_STATUS_BYTECNT            (0x1ffffULL << 32)
> +#define MSR_IA32_RTIT_CR3_MATCH        0x00000572
> +#define MSR_IA32_RTIT_OUTPUT_BASE      0x00000560
> +#define MSR_IA32_RTIT_OUTPUT_MASK      0x00000561
> +#define MSR_IA32_RTIT_ADDR_A(n)        (0x00000580 + (n) * 2)
> +#define MSR_IA32_RTIT_ADDR_B(n)        (0x00000581 + (n) * 2)

Please honor the comment at the top of the file as well as the one
separating new content from not necessarily well-formed one further
down. I also think Andrew wants no IA32 infixes anymore in new
additions, albeit I'm still not fully convinced the resulting
deviation from SDM naming is really helpful.

Jan

