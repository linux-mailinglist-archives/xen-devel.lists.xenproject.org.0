Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358742723D0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 14:23:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKKpz-0003yg-Iq; Mon, 21 Sep 2020 12:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPbg=C6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKKpy-0003yb-Qi
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 12:22:30 +0000
X-Inumbo-ID: 88768b91-88eb-462d-aeb2-cf8a4806eb87
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88768b91-88eb-462d-aeb2-cf8a4806eb87;
 Mon, 21 Sep 2020 12:22:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q8so13761281lfb.6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mb2CL2srX6AGewSezXbj9JNamxifmZnSioGEDBy+lnc=;
 b=Oylfjz6VoEzdMSdjKaRcoZawdfj4clDn8zYiMgmDwVojW4eC2IGdTCJm82oG71l/mY
 rt9y5bwAbq2h6fyqiI84GmVqIjAUeoJDCbiGggA2ztk2rLHbZpQ21kdC7eXVUlUT0R2Q
 LYSv2Qfmvob5sVxDcignHEv8sepT/I8MdDFh4S3bp6Upcy0hh/KS1senwT2U8VDpGOBb
 wTN32FOO30giIzSSQQFvMTHmWhT2z+Sn3H5WF4i50siGdWJY/9S7mnPGkAQoSnk4ZUrB
 Kl11G7R7WHMbjK+BD5eldTFE4hg/+OzuGR5wqboKbsgId4ju7UjBHO+btPc9OM8Hh5PJ
 vn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mb2CL2srX6AGewSezXbj9JNamxifmZnSioGEDBy+lnc=;
 b=gG20mtkG1SE4ADiYle/I5bRNBF8EQtg9HWe0Oi7MChXWmNiJ+pmYYCcsTQQn6dBJDH
 SxmBYw5QebhakoIjBPCFL2AX49nPyBSWYcIH52tZQRp8LigTbEhxnXl2rW8ELqmsRcFK
 VEk8yRSwgNhN+umfma5oi3JaAbiVL4N2q503pOkB2RLdA/EZSdoJat1Ujcphs6DB5PGR
 /PNdGORaRb3p06S7uXODMahLO2+c7pJ8Lq88VizdhUq5QPyIkuw0kQ59xCfGONbRH6Gr
 ve1dD8zyqnGwReWoYaYmdEW+PkaenjN3qSqv9pU3nu3e1MfYw38XkBKaut0jb4CGI1Zq
 Ke7A==
X-Gm-Message-State: AOAM532qRR/MLdzohK0OUO7aJTei5zwyAGqJbRlAi+ISQ5isc25chBqB
 HLcf2GOTP50dzhWZ2AFb3ww=
X-Google-Smtp-Source: ABdhPJwlz2AgMk2ddfXyLJqjLZPpcWPRephqoNDscJx0AJG6h1/OR8J7ettRzI99RX1dLgK6rLFHtw==
X-Received: by 2002:ac2:4301:: with SMTP id l1mr14109581lfh.389.1600690948312; 
 Mon, 21 Sep 2020 05:22:28 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 189sm2673447ljj.54.2020.09.21.05.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 05:22:27 -0700 (PDT)
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
 <98420567-40a9-7297-d243-4af90f692bf9@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <123d8e2a-96c2-a97c-a0c0-a5dca4288a2b@gmail.com>
Date: Mon, 21 Sep 2020 15:22:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98420567-40a9-7297-d243-4af90f692bf9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 14.09.20 16:52, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> prepares IOREQ support before moving to the common code. This way
>> we will get almost a verbatim copy for a code movement.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
> This is all fine, but you should then go on and explain what you're
> doing, and why (at which point it may become obvious that it would
> be more helpful to split this into a couple of steps).

Got it. Will add an explanation.


> In particular
> something as suspicious as ...
>
>> Changes RFC -> V1:
>>     - new patch, was split from:
>>       "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"
>>     - fold the check of p->type into hvm_get_ioreq_server_range_type()
>>       and make it return success/failure
>>     - remove relocate_portio_handler() call from arch_hvm_ioreq_destroy()
>>       in arch/x86/hvm/ioreq.c
> ... this (see below).
>
>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -170,6 +170,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>>       return true;
>>   }
>>   
>> +bool arch_handle_hvm_io_completion(enum hvm_io_completion io_completion)
> Do we need "handle" in here? Without it, I'd also not have to ask about
> moving hvm further to the front of the name...
For me without "handle" it will sound a bit confusing because of the 
enum type which
has a similar name but without "arch" prefix:
bool arch_hvm_io_completion(enum hvm_io_completion io_completion)


Shall I then move "hvm" to the front of the name here?


>
>> @@ -836,6 +848,12 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
>>       return rc;
>>   }
>>   
>> +/* Called when target domain is paused */
>> +int arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
>> +{
>> +    return p2m_set_ioreq_server(s->target, 0, s);
>> +}
> Why return "int" when ...
>
>> @@ -855,7 +873,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>>   
>>       domain_pause(d);
>>   
>> -    p2m_set_ioreq_server(d, 0, s);
>> +    arch_hvm_destroy_ioreq_server(s);
> ... the result has been ignored anyway? Or otherwise I guess you'd
> want to add error handling here (but then the result of
> p2m_set_ioreq_server() should still get ignored, for backwards
> compatibility).

I didn't have a plan to add error handling here. Agree, will make 
arch_hvm_destroy_ioreq_server() returning void.


>
>> @@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>       struct hvm_ioreq_server *s;
>>       unsigned int id;
>>   
>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>> -        return;
>> +    arch_hvm_ioreq_destroy(d);
> So the call to relocate_portio_handler() simply goes away. No
> replacement, no explanation?
As I understand from the review comment on that for the RFC patch, there 
is no
a lot of point of keeping this. Indeed, looking at the code I got the 
same opinion.
I should have added an explanation in the commit description at least.
Or shall I return the call back?


>
>> @@ -1239,19 +1256,15 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>   }
>>   
>> -struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
>> -                                                 ioreq_t *p)
>> +int hvm_get_ioreq_server_range_type(struct domain *d,
>> +                                    ioreq_t *p,
> At least p, but perhaps also d can gain const?

Agree, will add.


>
>> +                                    uint8_t *type,
>> +                                    uint64_t *addr)
> By the name the function returns a type for a range (albeit without
> it being clear where the two bounds of such a range actually live).
> By the implementation is looks more like you mean "range_and_type",
> albeit still without there really being a range passed back to the
> caller. Therefore I think I need some clarification on what's
> intended before even being able to suggest something.

This function is just an attempt to split arch specific things (cf8 
handling) from "common" hvm_select_ioreq_server().


>  From ...
>
>> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
>> +                                                 ioreq_t *p)
>> +{
>> +    struct hvm_ioreq_server *s;
>> +    uint8_t type;
>> +    uint64_t addr;
>> +    unsigned int id;
>> +
>> +    if ( hvm_get_ioreq_server_range_type(d, p, &type, &addr) )
>> +        return NULL;
> ... this use - maybe hvm_ioreq_server_get_type_addr() (albeit I
> don't like this name very much)?

Yes, hvm_ioreq_server_get_type_addr() better represents what function does.


>
>> @@ -1351,7 +1378,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
>>       pg = iorp->va;
>>   
>>       if ( !pg )
>> -        return X86EMUL_UNHANDLEABLE;
>> +        return IOREQ_IO_UNHANDLED;
> At this example - why the IO infix, duplicating the prefix? I'd
> suggest to either drop it (if the remaining identifiers are deemed
> unambiguous enough) or use e.g. IOREQ_STATUS_*.

Agree, I would prefer IOREQ_STATUS_*


>> @@ -1515,11 +1542,21 @@ static int hvm_access_cf8(
>>       return X86EMUL_UNHANDLEABLE;
>>   }
>>   
>> +void arch_hvm_ioreq_init(struct domain *d)
>> +{
>> +    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
>> +}
>> +
>> +void arch_hvm_ioreq_destroy(struct domain *d)
>> +{
>> +
>> +}
> Stray blank line?

Will remove.


-- 
Regards,

Oleksandr Tyshchenko


