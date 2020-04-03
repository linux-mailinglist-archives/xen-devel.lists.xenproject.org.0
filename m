Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE819D16E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 09:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKGzH-0002xE-WC; Fri, 03 Apr 2020 07:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKGzG-0002wh-Eo
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 07:43:34 +0000
X-Inumbo-ID: d18f3214-757e-11ea-bcc1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d18f3214-757e-11ea-bcc1-12813bfff9fa;
 Fri, 03 Apr 2020 07:43:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C3FBADCC;
 Fri,  3 Apr 2020 07:43:32 +0000 (UTC)
Subject: Re: [PATCH] x86/HVM: expose VM assist hypercall
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cb4a6f8f-eda8-f17c-54e5-af1353d6358c@suse.com>
 <18adfe82-4882-c835-cd1d-b3069416e0ab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1837d16-53e1-b382-3c63-c9c60ef26829@suse.com>
Date: Fri, 3 Apr 2020 09:43:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <18adfe82-4882-c835-cd1d-b3069416e0ab@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 21:49, Andrew Cooper wrote:
> On 02/04/2020 08:46, Jan Beulich wrote:
>> In preparation for the addition of VMASST_TYPE_runstate_update_flag
>> commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
>> the hypercall for Arm. I consider it not logical that it then isn't also
>> exposed to x86 HVM guests (with the same single feature permitted to be
>> enabled as Arm has); Linux actually tries to use it afaict.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd declare this a bug in 2529c850ea4.  It was clearly intended as a
> common feature, and wasn't tested for HVM guests.
> 
> However, ...
> 
>>
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -78,6 +78,11 @@ static long hvm_grant_table_op(
>>  }
>>  #endif
>>  
>> +static long hvm_vm_assist(unsigned int cmd, unsigned int type)
>> +{
>> +    return vm_assist(current->domain, cmd, type, HVM_VM_ASSIST_VALID);
>> +}
>> +
>>  static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  {
>>      const struct vcpu *curr = current;
>> @@ -128,6 +133,7 @@ static const hypercall_table_t hvm_hyper
>>  #ifdef CONFIG_GRANT_TABLE
>>      HVM_CALL(grant_table_op),
>>  #endif
>> +    HVM_CALL(vm_assist),
> 
> ... this means we've now got 3 stub functions making no-op ABI changes
> for the general vm_assist() function.

Not sure what you mean with "no-op" here. It's not like the
mask values would all be the same.

> Renaming it to do_vm_assist(), latch current->domain internally, and an
> arch_vm_assist_valid(d) helper can cover the final parameter.

I can certainly do this, but it very much seems to me to be a
request you'd call "scope creep". I was meaning to address the
issue at hand with a minimally invasive change. The bigger
variant you suggest is unlikely to cause backporting issues,
yes, but still ... Anyway, I'll do as you ask, to cut the
discussion short.

Jan

