Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8941909E9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 10:47:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGg7h-0006pT-TW; Tue, 24 Mar 2020 09:45:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGg7g-0006pO-7M
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 09:45:24 +0000
X-Inumbo-ID: 2e332aac-6db4-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e332aac-6db4-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 09:45:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6256AD32;
 Tue, 24 Mar 2020 09:45:21 +0000 (UTC)
To: Paul Durrant <paul@xen.org>
References: <a036b093-0f0d-6998-c6ec-4463d53b337f@suse.com>
 <f6c5299a-e84e-dd81-9143-0c7bda4eb782@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75a5f87d-f3ae-17db-d8ab-1701a8399b6b@suse.com>
Date: Tue, 24 Mar 2020 10:45:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f6c5299a-e84e-dd81-9143-0c7bda4eb782@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] Ping: [PATCH] x86/HVM: fix AMD ECS handling for Fam 10
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.03.2020 14:41, Andrew Cooper wrote:
> On 16/03/2020 11:00, Jan Beulich wrote:
>> The involved comparison was, very likely inadvertently, converted from
>>> = to > when making changes unrelated to the actual family range.
>>
>> Fixes: 9841eb71ea87 ("x86/cpuid: Drop a guests cached x86 family and model information")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Paul?

>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -1284,7 +1284,7 @@ struct hvm_ioreq_server *hvm_select_iore
>>          if ( CF8_ADDR_HI(cf8) &&
>>               d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
>>               (x86_fam = get_cpu_family(
>> -                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) > 0x10 &&
>> +                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
>>               x86_fam < 0x17 )
>>          {
>>              uint64_t msr_val;
>>
> 


