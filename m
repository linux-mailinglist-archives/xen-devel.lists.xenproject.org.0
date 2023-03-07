Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF06AE7AA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507641.781412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaez-0005xe-Co; Tue, 07 Mar 2023 16:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507641.781412; Tue, 07 Mar 2023 16:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaez-0005uw-8e; Tue, 07 Mar 2023 16:59:33 +0000
Received: by outflank-mailman (input) for mailman id 507641;
 Tue, 07 Mar 2023 16:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaex-0005uq-Nw
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:59:31 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cbd9138-bd09-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 17:59:29 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id e13so12805346wro.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:59:29 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4cd2000000b002c551f7d452sm13378718wrt.98.2023.03.07.08.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:59:28 -0800 (PST)
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
X-Inumbo-ID: 6cbd9138-bd09-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678208369;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FP/kP9sLcpCuLCw0esZoAmg3jKAAmnrlfS+QSo9YyCw=;
        b=MvOB5b+1KMpQB3yysitnKHhLEb3b2Bv7lHUgfyzXLnywW/ObXguSKIk4RM5p3l6M84
         c6mnKNCmagmgMIiAgszyrdFuN5fnTEmznbWXIdS8fUE5m5kxCTlExaZpH7L1t61Mzla8
         8tZMA6o+bdTKOn7sXUpmDCb85Fe2vG1hks0PQCfcqBp8lUq8x4wI6Q7zXyu2SxbRkK9C
         gm6RVuSzD2GPCjsTZiE8WWsuEOag6oQZ3DIVzvIClMRUPyXLgDzNUsTshOMVqdSNQITN
         HQK1RpR/43rEpMl2bQ9rll0x+2Fmm6V6jjLQrQKvvU8yfIhdGohdP5Lb7QK0wfvg+3vs
         WPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678208369;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FP/kP9sLcpCuLCw0esZoAmg3jKAAmnrlfS+QSo9YyCw=;
        b=GeBTOwPwTVG4K7OhU3b8BJdVK1/mfnWY9UUBVNJZvRosMEYDPXQ/ns9W8cXRcWWCXv
         pRKBQhtRYKFyKdBnzBe38SnQ3dnmqve3TpXGSgU0kX0QqHlcxq8HCvdaac4HQxpQ0fSH
         DK9L89PwBGibEr6doIfv1EaECd3NFKJZDTLYJT75OIxTkAd2kLDELeS7HWRFUL/euaRf
         cSMXnRNUwUF01cdp/pHUV/Ewcu+FvdZ8Wgn/ECzRCsVBq19ht3JlqX1dBfOHRloyTgFI
         E00NcXbxNpQem+MBdN6rXXEVLZC4ekU10npWihYhmz0L9qtFdeBk2TR79EqH7f+8o50S
         PPPA==
X-Gm-Message-State: AO0yUKW13zJXMTMI8xFydrxTy6/uUbKWEckYDsc3Jx5LFZUljh61Fb0m
	bkhT5ZxzEVb9x0f6IRG2Sh0=
X-Google-Smtp-Source: AK7set+t/WQFpoA92F2tLgxx4+F1P6LExXIvvbui9CFAkZ48Rz/j1Z8RbWBn/5wh1yoEdzOO1FCiSA==
X-Received: by 2002:a5d:457c:0:b0:2ce:5106:36ee with SMTP id a28-20020a5d457c000000b002ce510636eemr7359301wrc.27.1678208369023;
        Tue, 07 Mar 2023 08:59:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <335a946a-6eae-00e6-b30f-142522cc4c26@xen.org>
Date: Tue, 7 Mar 2023 16:59:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
 <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
 <1ab939956031328a9a16fb4e76417e23f292e6ba.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <1ab939956031328a9a16fb4e76417e23f292e6ba.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/03/2023 16:52, David Woodhouse wrote:
> On Tue, 2023-03-07 at 16:39 +0000, Paul Durrant wrote:
>> On 07/03/2023 16:33, David Woodhouse wrote:
>>> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>
>>>> In fact I think we want to only serialize the contents of the domain's
>>>> path in /local/domain/${domid} and leave the rest to be recreated? Will
>>>> defer to Paul for that.
>>>>
>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
>>> mentioned migration in the cover letter — this much is working fine,
>>> but it's the PV back ends that don't yet work.
>>>
>>> I'd quite like to merge the basic serialization/deserialization of
>>> XenStore itself, with the unit tests.
>>
>> The patch is basically ok, I just think the serialization should be
>> limited to the guest nodes... filtering out those not owned by xen_domid
>> would probably work for that.
> 
> Yeah, so let's just do this (as part of this patch #7) for now:
> 
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -235,6 +235,7 @@ static int xen_xenstore_post_load(void *opaque, int
> ver)
>   
>   static const VMStateDescription xen_xenstore_vmstate = {
>       .name = "xen_xenstore",
> +    .unmigratable = 1, /* The PV back ends don't migrate yet */
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .needed = xen_xenstore_is_needed,
> 
> 
> It means we can't migrate guests even if they're only using fully
> emulated devices... but I think that's a reasonable limitation until we
> implement it fully.
> 

Ok. With that added...

Revieweed-by: Paul Durrant <paul@xen.org>


