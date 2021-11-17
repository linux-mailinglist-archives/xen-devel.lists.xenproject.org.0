Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50145512B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 00:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227038.392551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnUPP-0004AQ-Bp; Wed, 17 Nov 2021 23:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227038.392551; Wed, 17 Nov 2021 23:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnUPP-00048M-8f; Wed, 17 Nov 2021 23:32:07 +0000
Received: by outflank-mailman (input) for mailman id 227038;
 Wed, 17 Nov 2021 23:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnUPO-00048G-77
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 23:32:06 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 927477c5-47fe-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 00:32:04 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47612)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnUPH-000TGa-gH (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 23:31:59 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B09271FD7A;
 Wed, 17 Nov 2021 23:31:58 +0000 (GMT)
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
X-Inumbo-ID: 927477c5-47fe-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4a97e977-da9e-5ca0-0013-75a2f9411de0@srcf.net>
Date: Wed, 17 Nov 2021 23:31:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Andrew Cooper <amc96@srcf.net>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <6306ecd3-011b-51ee-65d3-107099b6dfa1@suse.com>
Content-Language: en-GB
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
In-Reply-To: <6306ecd3-011b-51ee-65d3-107099b6dfa1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2021 09:57, Jan Beulich wrote:
> On 11.11.2021 18:57, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>>       return 0;
>>   }
>>   
>> -static void do_domain_pause(struct domain *d,
>> -                            void (*sleep_fn)(struct vcpu *v))
>> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
>>   {
>>       struct vcpu *v;
>>   
>>       atomic_inc(&d->pause_count);
>>   
>> -    for_each_vcpu( d, v )
>> -        sleep_fn(v);
>> +    if ( sync )
>> +        for_each_vcpu ( d, v )
>> +            vcpu_sleep_sync(v);
>> +    else
>> +        for_each_vcpu ( d, v )
>> +            vcpu_sleep_nosync(v);
> Is this really better (for whichever reason) than
>
>      for_each_vcpu ( d, v )
>      {
>          if ( sync )
>              vcpu_sleep_sync(v);
>          else
>              vcpu_sleep_nosync(v);
>      }
>
> ?

Yes.  For cases where it can't be optimised out via constant 
propagation, it removes a conditional branch from the middle of a loop.  
I forget what the name for the compiler pass which does this is, but it 
makes a big difference given the way that L0 instruction caches and 
loop-stream-detectors/etc are build.

~Andrew

