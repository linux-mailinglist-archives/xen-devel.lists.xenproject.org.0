Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE331FCC70
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 13:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlWKp-0002Oi-Jj; Wed, 17 Jun 2020 11:34:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlWKn-0002Od-Dj
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 11:34:25 +0000
X-Inumbo-ID: 7e583032-b08e-11ea-b9cf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e583032-b08e-11ea-b9cf-12813bfff9fa;
 Wed, 17 Jun 2020 11:34:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6FD47AEC8;
 Wed, 17 Jun 2020 11:34:27 +0000 (UTC)
Subject: Re: [PATCH v1 2/7] x86/vmx: add IPT cpu feature
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <1672321493.8765712.1592320839082.JavaMail.zimbra@cert.pl>
 <20200616163022.GR735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c338fef-0077-b69a-1ec1-8729caa218f0@suse.com>
Date: Wed, 17 Jun 2020 13:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616163022.GR735@Air-de-Roger>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.06.2020 18:30, Roger Pau Monné wrote:
> On Tue, Jun 16, 2020 at 05:20:39PM +0200, Michał Leszczyński wrote:
>> Check if Intel Processor Trace feature is supported by current
>> processor. Define hvm_ipt_supported function.
>>
>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>> ---
>>  xen/arch/x86/hvm/vmx/vmx.c                  | 24 +++++++++++++++++++++
>>  xen/include/asm-x86/cpufeature.h            |  1 +
>>  xen/include/asm-x86/hvm/hvm.h               |  9 ++++++++
>>  xen/include/asm-x86/hvm/vmx/vmcs.h          |  1 +
>>  xen/include/public/arch-x86/cpufeatureset.h |  1 +
>>  5 files changed, 36 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index ab19d9424e..a91bbdb798 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2484,6 +2484,7 @@ static bool __init has_if_pschange_mc(void)
>>  
>>  const struct hvm_function_table * __init start_vmx(void)
>>  {
>> +    u64 _vmx_misc_cap;
> 
> Please use uint64_t, and you can drop the leading _vmx prefix, this is
> already vmx specific.

Actually, all of _vmx_ should be dropped (i.e. in particular local
variables shouldn't start with an underscore).

Jan

