Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E92757D8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 14:29:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL3tI-0003N6-AP; Wed, 23 Sep 2020 12:28:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Zf1=DA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kL3tH-0003N1-5K
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 12:28:55 +0000
X-Inumbo-ID: a6d3bc61-295e-4a39-a788-1925b97cac51
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6d3bc61-295e-4a39-a788-1925b97cac51;
 Wed, 23 Sep 2020 12:28:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b12so21852998lfp.9
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9YfDysznGc9tx2Vo6Js83YWMRqdteyCheP+Gs/5UA/M=;
 b=NCI/Wgjs9VlQO0XEaUIBJN/jXcsKVtAfVq+iUurwqiQOrSmrm3wVck9dvPSprnIj/+
 nPu3orsyx5Ims9X3lJmrp5FzBsGv1Q4oQPXCtq5rHLqXW5wFdUMiLk/YzBl0J/1dRhPN
 O0/eQkoIqUy8xNdm8vAZLzD8Mk3V/iBHoID5Rj3/dnocJ2Mm2ucxIm3X+kH/e/euHoKz
 WvewlUsu7nHNg6kb3qAmrloUkfsFW9xId81JWlSwo3zM9nPkbPYriwIa3rM/wPUslBX+
 SooLFGGxJWFjsFzts/BUvwSUMuYuuDLly61eEZJkuhWnux2t3fDphBCvSpzWrdxdLF4k
 aGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9YfDysznGc9tx2Vo6Js83YWMRqdteyCheP+Gs/5UA/M=;
 b=kxLxfx5XIFYyXTSot4Ec23iOth2KKo8iDD1v5yb4lNe1cgnde5Wi06NJp/r+o8wPKq
 igFMjVAsDt7LNMJAYT8Nw7haUi5Vu/aQtNLneyCrt8iBpqbL5PYw9/ISFXimARpPY8TW
 Uq9jCbtFyrKZ0mDf5i8FYxSiUI5VH08qiIyx1y8IDo9CIQXcLvXPbiBYB+nL8mdC/p1u
 E28BTNJWCS1ifvqIrwQf7E5A9NxP0R8Fg0+YUDN8AFMz1WHArjRnuS2sKLT62nNXpMb7
 Bg/8gBxj53UVjCOEKDmpcV5QhddoweyX3Urdcsz65vqeYxMbAloHlXBQMnilMn6eGyk3
 l30Q==
X-Gm-Message-State: AOAM531cmshWSO5nMeYkXsBRFuCmQZv9+hxZKOjPNREnvZSaNxePtasD
 sEsI1TUvCt+0q7ugL/3ANK0=
X-Google-Smtp-Source: ABdhPJwuS3qYVobBoFyjSc6QyU/blp3c+BCjyIQP3N4N0lN0ltwvrgM5gDCyZ+jxe/F7wJZrgBcT2Q==
X-Received: by 2002:ac2:4469:: with SMTP id y9mr3074281lfl.72.1600864132911;
 Wed, 23 Sep 2020 05:28:52 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p18sm5091408ljg.26.2020.09.23.05.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 05:28:52 -0700 (PDT)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
 <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
 <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
 <7bffd6ec-8c41-202a-655d-df2240c1491a@gmail.com>
 <5e59dd52-71ea-6c63-8f63-13928813bb2f@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9ebdca87-4105-c27b-635d-7a1b6d4cde82@gmail.com>
Date: Wed, 23 Sep 2020 15:28:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5e59dd52-71ea-6c63-8f63-13928813bb2f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 22.09.20 18:52, Jan Beulich wrote:

Hi Jan

> On 22.09.2020 17:05, Oleksandr wrote:
>> 2. *arch.hvm.params*: Two functions that use it
>> (hvm_alloc_legacy_ioreq_gfn/hvm_free_legacy_ioreq_gfn) either go into
>> arch code completely or
>>       specific macro is used in common code:
>>
>>      #define ioreq_get_params(d, i) ((d)->arch.hvm.params[i])
> If Arm has the concept of params, then perhaps. But I didn't think
> Arm does ...
I think it has in some degree, there is a handling of 
HVMOP_set_param/HVMOP_get_param and
also there is a code to setup HVM_PARAM_CALLBACK_IRQ.


>
>>      I would prefer macro than moving functions to arch code (which are
>> equal and should remain in sync).
> Yes, if the rest of the code is identical, I agree it's better to
> merely abstract away small pieces like this one.

ok


>
>> 3. *arch.hvm.hvm_io*: We could also use the following:
>>
>>      #define ioreq_get_io_completion(v) ((v)->arch.hvm.hvm_io.io_completion)
>>      #define ioreq_get_io_req(v) ((v)->arch.hvm.hvm_io.io_req)
>>
>>      This way struct hvm_vcpu_io won't be used in common code as well.
> But if Arm needs similar field, why keep them in arch.hvm.hvm_io?
Yes, Arm needs the "some" fields, but not "all of them" as x86 has.
For example Arm needs only the following (at least in the context of 
this series):

+struct hvm_vcpu_io {
+    /* I/O request in flight to device model. */
+    enum hvm_io_completion io_completion;
+    ioreq_t                io_req;
+
+    /*
+     * HVM emulation:
+     *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
+     *  The latter is known to be an MMIO frame (not RAM).
+     *  This translation is only valid for accesses as per @mmio_access.
+     */
+    struct npfec        mmio_access;
+    unsigned long       mmio_gla;
+    unsigned long       mmio_gpfn;
+};

But for x86 the number of fields is quite bigger. If they were in same 
way applicable for both archs (as what we have with ioreq_server struct)
I would move it to the common domain. I didn't think of a better idea 
than just abstracting accesses to these (used in common ioreq.c) two 
fields by macro.


>
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -194,7 +194,7 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu
>> *sv, ioreq_t *p)
>>    bool handle_hvm_io_completion(struct vcpu *v)
>>    {
>>        struct domain *d = v->domain;
>> -    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>> +    ioreq_t io_req = ioreq_get_io_req(v);
>>        struct hvm_ioreq_server *s;
>>        struct hvm_ioreq_vcpu *sv;
>>        enum hvm_io_completion io_completion;
>> @@ -209,14 +209,14 @@ bool handle_hvm_io_completion(struct vcpu *v)
>>        if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
>>            return false;
>>
>> -    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
>> +    io_req.state = hvm_ioreq_needs_completion(&io_req) ?
>>            STATE_IORESP_READY : STATE_IOREQ_NONE;
> This is unlikely to be correct - you're now updating an on-stack
> copy of the ioreq_t instead of what vio points at.
Oh, thank you for pointing this, I should have used ioreq_t *io_req = 
&ioreq_get_io_req(v);
I don't like ioreq_get_io_req much), probably ioreq_req would sound a 
little bit better?


>
>>        msix_write_completion(v);
>>        vcpu_end_shutdown_deferral(v);
>>
>> -    io_completion = vio->io_completion;
>> -    vio->io_completion = HVMIO_no_completion;
>> +    io_completion = ioreq_get_io_completion(v);
>> +    ioreq_get_io_completion(v) = HVMIO_no_completion;
> I think it's at least odd to have an lvalue with this kind of a
> name. Perhaps want to drop "get" if it's really meant to be used
> like this.

ok


>
>> @@ -247,7 +247,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct
>> hvm_ioreq_server *s)
>>        for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>        {
>>            if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
>> -            return _gfn(d->arch.hvm.params[i]);
>> +            return _gfn(ioreq_get_params(d, i));
>>        }
>>
>>        return INVALID_GFN;
>> @@ -279,7 +279,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct
>> hvm_ioreq_server *s,
>>
>>        for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>        {
>> -        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
>> +        if ( gfn_eq(gfn, _gfn(ioreq_get_params(d, i))) )
>>                 break;
>>        }
>>        if ( i > HVM_PARAM_BUFIOREQ_PFN )
> And these two are needed by Arm? Shouldn't Arm exclusively use
> the new model, via acquire_resource?
I dropped HVMOP plumbing on Arm as it was requested. Only acquire 
interface should be used.
This code is not supposed to be called on Arm, but it is a part of 
common code and we need to find a way how to abstract away *arch.hvm.params*
Am I correct?


-- 
Regards,

Oleksandr Tyshchenko


