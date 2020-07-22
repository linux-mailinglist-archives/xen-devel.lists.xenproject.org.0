Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3967F229506
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 11:35:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyB9H-0006GS-Cc; Wed, 22 Jul 2020 09:34:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyB9G-0006GN-3e
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 09:34:50 +0000
X-Inumbo-ID: 95968525-cbfe-11ea-a18b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95968525-cbfe-11ea-a18b-12813bfff9fa;
 Wed, 22 Jul 2020 09:34:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 049E6ADAD;
 Wed, 22 Jul 2020 09:34:55 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Fold nsvm_{wr,rd}msr() into
 svm_msr_{read,write}_intercept()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200721172208.12176-1-andrew.cooper3@citrix.com>
 <20200722092653.GV7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d57ec557-3b6a-3571-3c63-08166e40af75@suse.com>
Date: Wed, 22 Jul 2020 11:34:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722092653.GV7191@Air-de-Roger>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.07.2020 11:26, Roger Pau Monné wrote:
> On Tue, Jul 21, 2020 at 06:22:08PM +0100, Andrew Cooper wrote:
>> @@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>              goto gpf;
>>          break;
>>  
>> +    case MSR_K8_VM_CR:
>> +        /* ignore write. handle all bits as read-only. */
>> +        break;
>> +
>> +    case MSR_K8_VM_HSAVE_PA:
>> +        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )
> 
> Regarding the address check, the PM states "the maximum supported
> physical address for this implementation", but I don't seem to be able
> to find where is this actually announced.

I think you'd typically find this information in the BKDG or PPR only.
The PM is generic, while the named two are specific to particular
families or even just models.

Jan

