Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD526C343
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 15:28:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIXU8-0005kv-Ca; Wed, 16 Sep 2020 13:28:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIXU6-0005ko-Lg
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:28:30 +0000
X-Inumbo-ID: e9a1a324-485f-4244-ac61-88c83b393d98
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9a1a324-485f-4244-ac61-88c83b393d98;
 Wed, 16 Sep 2020 13:28:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600262908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04lApsYYwP0ShfVoEzWqhhyxFcaCGtrT9ZVEuH6OdUw=;
 b=nkpcUQDfpapHiPq3JqwBgfdy20nQ9PUz2ds8hdYl706KH0CKvq/zMLfyMbXwSFSylab5Wl
 +cPp6C+Kgus+wmB3aZWbXU1/Oka1ZNrh6yMF3d8OJBYt0CvamO0NITDFAMz40G1kEGUFHg
 aBxqfSy6VXgYS3piqgiIx2ovN01OPFG+McwYJSMtNSxb9zCrTEV5YdLMlniayElcL0ONMm
 aMZ4BGVPaucwQrXWQWCj/Z2bnUqr/Hw3N7MzmneRgTxpP+de2TJl9XGhcfCp3TuZtvKn5J
 F7onToLKbyKDc7h/61w+ujiDtpFEr7t8P1DXQPHUOTnSF0tKLpsXsXezlUh6+w==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18455B573;
 Wed, 16 Sep 2020 13:28:44 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: ignore accesses to EX_CFG
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200916105426.6663-1-roger.pau@citrix.com>
 <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
 <20200916130439.GV753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33778785-830b-af08-ec64-4a08db92e693@suse.com>
Date: Wed, 16 Sep 2020 15:28:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916130439.GV753@Air-de-Roger>
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

On 16.09.2020 15:04, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 02:55:52PM +0200, Jan Beulich wrote:
>> On 16.09.2020 12:54, Roger Pau Monne wrote:
>>> Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
>>> and injecting a #GP fault will result in a panic:
>>>
>>> svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
>>> d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30
>>>
>>> Return 0 when trying to read the MSR and drop writes.
>>
>> So I've gone through a bunch of BKDGs and PPRs, without finding
>> this MSR mentioned in any of them. Could you point out on which
>> model(s) it actually exists? You must have found it somewhere,
>> or else you wouldn't know a name for it...
> 
> Yes, sorry it took me a while to find it also, and I should have added
> a reference here. It's in "BIOS and Kernel Developer’s Guide (BKDG)
> for AMD Family 15h Models 00h-0Fh Processors", albeit Windows will try
> to access it on Family 17h also.

Ah, and it's exclusively this one as it seems. The models 1xh one
again doesn't have it.

>>> @@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>>      case MSR_K8_TOP_MEM2:
>>>      case MSR_K8_SYSCFG:
>>>      case MSR_K8_VM_CR:
>>> +    case MSR_AMD64_EX_CFG:
>>>          /* ignore write. handle all bits as read-only. */
>>>          break;
>>
>> Is this necessary, rather than having writes fault?
> 
> Hm, I'm not sure about that. This is the same that KVM did to handle
> the MSR, see Linux commit 0e1b869fff60c81b510c2d00602d778f8f59dd9a.

Looking at the sole bit that's defined there, I agree the main reason
for Win10 to read it would look to be to potentially also write it if
it finds certain bits unset. If so, perhaps we want to consider to
report a value with this/these bit(s) set?

> I can try to return #GP for writes, but I don't see much issue in just
> ignoring writes.

The reason for me asking is that I'd prefer if we didn't grow an
endless list of exceptions for no reason. In fact I wonder whether
some MSRs that we currently ignore writes for couldn't be dropped.

Jan

