Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBE2B6A0E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 17:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29129.58380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf3rs-0005nG-4I; Tue, 17 Nov 2020 16:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29129.58380; Tue, 17 Nov 2020 16:30:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf3rs-0005mq-0U; Tue, 17 Nov 2020 16:30:08 +0000
Received: by outflank-mailman (input) for mailman id 29129;
 Tue, 17 Nov 2020 16:30:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UWEc=EX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kf3rq-0005dY-1f
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:30:06 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7054294-a346-43ff-9c96-ecd32a0792df;
 Tue, 17 Nov 2020 16:30:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x9so24974961ljc.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 08:30:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p25sm3206522lfc.125.2020.11.17.08.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 08:30:03 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UWEc=EX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kf3rq-0005dY-1f
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:30:06 +0000
X-Inumbo-ID: c7054294-a346-43ff-9c96-ecd32a0792df
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c7054294-a346-43ff-9c96-ecd32a0792df;
	Tue, 17 Nov 2020 16:30:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x9so24974961ljc.7
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=01HVuw46qRoOFWw/AqqExtJgoLq9BcD3AdYtNrquhhs=;
        b=U6wgdthK0up06n1FGwW97B1xZU1a6z5C+5cwYLVtkwLLLfKNaWrZZzmqLxFDyEaTjG
         Sey0Op4cZb7f7v1yGh1WDwhlCrLi4I3xQzVLRBnKbl9VIQRDexMguMHiLkAQqEW6MBQR
         APNkY7EmQ4gRgeVs7jB6OMKgFwlpxnHtgpVVwzdte/MOLTYUreriPUgJc3R/+X6Op8D8
         BvDHgZ+OhidChT3q6FYHGyiX1iMdZI91FvGkx7hl5eQue/oWCiCSdGlX+oGw3yqOGJOg
         T6UdFGnnLdDfvCV+wvpJyu3nPGa6KCiS7NQ6Ow1agmZiOcRdk7Lmk6KoPfham2ld8B23
         2kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=01HVuw46qRoOFWw/AqqExtJgoLq9BcD3AdYtNrquhhs=;
        b=COQAPz020Knawkfb2L3QbFiMoJIdeHAhgjdmU89ZCiT91SstVDQdFSVooA6dduqjji
         epKFc3gY3+EkRxqrkKI4/ckTrYsanfoudNWy2KvI0TAmLs7NwCTB3PQHLjS4gM+/0VLI
         fUULU4FqivuYtVIkPGZMHEO/Qk/kOtvGqG0Z1qQm/o/Sftad217WMEecFfBWLDnp0Yt1
         v4Zf6boRrO6wRPYwKnHtO97kQqDnGECiWKFMSdxRJRwHc2Dai/uCymBOq0fKpbPcTbJ8
         tP+pPj5T3Y2jWgNSegp2wedaH+czHPUi3Xnp1GXZPvb7ZGeriAeUjwcgnpGAmEolHh6r
         UQ7Q==
X-Gm-Message-State: AOAM532D94aHMO7LPi/ykVP9ZX0Qwafy137uJ+9SEcgL3aWBmGkjRnyj
	Gn7rKiaHbdSv+h1yQ8rievI=
X-Google-Smtp-Source: ABdhPJy4quR2RyUXySZ14ZAeNfdvGX2JjCG0TrbMG/l0/zJpN3MxlUfAIDdMU8oT7w3C520Tvoo/7Q==
X-Received: by 2002:a2e:1556:: with SMTP id 22mr2435394ljv.416.1605630603584;
        Tue, 17 Nov 2020 08:30:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id p25sm3206522lfc.125.2020.11.17.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 08:30:03 -0800 (PST)
Subject: Re: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Tim Deegan' <tim@xen.org>, 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
 <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org>
 <436143ea-609f-f6c3-4952-19fcf410fe8f@gmail.com>
 <34133df1-bff2-f4df-00a5-674a2af867fc@gmail.com>
 <007401d6bcf6$63d3f420$2b7bdc60$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a2eecf9b-7246-68c8-aee4-b4009ee16ed8@gmail.com>
Date: Tue, 17 Nov 2020 18:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <007401d6bcf6$63d3f420$2b7bdc60$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 17.11.20 17:29, Paul Durrant wrote:

Hi Paul

Thank you for the prompt answer.

>>>> The 'legacy' mechanism of mapping magic pages for ioreq servers
>>>> should remain x86 specific I think that aspect of the code needs to
>>>> remain behind and not get moved into common code. You could do that
>>>> in arch specific calls in hvm_ioreq_server_enable/disable() and
>>>> hvm_get_ioreq_server_info().
>>> Well, if legacy mechanism is not going to be used for other arch and
>>> should remain x86 specific, I will try to investigate what should be
>>> left in x86 code and rework the series.
>>> As a side note, I am afraid, we won't get a 100% code movement (which
>>> I managed to achieve here) for the next version of this patch as we
>>> need arch/x86/hvm/ioreq.c.
>> I am investigating how to split the code in order to leave the 'legacy'
>> mechanism x86 specific and have a few questions. Could you please
>> clarify the following:
>>
>> 1. The split of hvm_ioreq_server_enable/disable() is obvious to me, I
>> would like to clarify regarding hvm_get_ioreq_server_info().
>> Is it close to what you had in mind when suggesting the split of
>> hvm_get_ioreq_server_info() or I just need to abstract
>> hvm_ioreq_server_map_pages() call only?
> I think it is sufficient to just abstract hvm_ioreq_server_map_pages() (and return -EOPNOTSUPP in the Arm case).
> The buf ioreq port should be common.

ok, will do.


>
>> (Not completed and non tested)
>>
>> +/* Called with ioreq_server lock held */
>> +int arch_ioreq_server_get_info(struct hvm_ioreq_server *s,
>> +                               unsigned long *ioreq_gfn,
>> +                               unsigned long *bufioreq_gfn,
>> +                               evtchn_port_t *bufioreq_port)
>> +{
>> +    if ( ioreq_gfn || bufioreq_gfn )
>> +    {
>> +        int rc = hvm_ioreq_server_map_pages(s);
>> +
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    if ( ioreq_gfn )
>> +        *ioreq_gfn = gfn_x(s->ioreq.gfn);
>> +
>> +    if ( HANDLE_BUFIOREQ(s) )
>> +    {
>> +        if ( bufioreq_gfn )
>> +            *bufioreq_gfn = gfn_x(s->bufioreq.gfn);
>> +
>> +        if ( bufioreq_port )
>> +            *bufioreq_port = s->bufioreq_evtchn;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>    int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
>>                                  unsigned long *ioreq_gfn,
>>                                  unsigned long *bufioreq_gfn,
>> @@ -916,26 +954,7 @@ int hvm_get_ioreq_server_info(struct domain *d,
>> ioservid_t id,
>>        if ( s->emulator != current->domain )
>>            goto out;
>>
>> -    if ( ioreq_gfn || bufioreq_gfn )
>> -    {
>> -        rc = hvm_ioreq_server_map_pages(s);
>> -        if ( rc )
>> -            goto out;
>> -    }
>> -
>> -    if ( ioreq_gfn )
>> -        *ioreq_gfn = gfn_x(s->ioreq.gfn);
>> -
>> -    if ( HANDLE_BUFIOREQ(s) )
>> -    {
>> -        if ( bufioreq_gfn )
>> -            *bufioreq_gfn = gfn_x(s->bufioreq.gfn);
>> -
>> -        if ( bufioreq_port )
>> -            *bufioreq_port = s->bufioreq_evtchn;
>> -    }
>> -
>> -    rc = 0;
>> +    rc = arch_ioreq_server_get_info(s, ioreq_gfn, bufioreq_gfn,
>> bufioreq_port);
>>
>>     out:
>>        spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>
>> 2. If I understand the code correctly, besides of the above-mentioned
>> functions the arch specific calls should be in hvm_ioreq_server_init()
>> and hvm_ioreq_server_deinit() to actually hide
>> "hvm_ioreq_server_unmap_pages" usage from the common code.  I noticed
>> that the rollback code in hvm_ioreq_server_init() and the whole
>> hvm_ioreq_server_deinit() have a lot in common except an extra ASSERT()
>> and hvm_ioreq_server_free_pages() call in the latter. My question is
>> could we just replace the rollback code by hvm_ioreq_server_deinit()? I
>> assume an extra hvm_ioreq_server_free_pages() call wouldn't be an issue
>> here, but I am not sure what to do with the ASSERT, I expect it to be
>> triggered at such an early stage (so it probably needs moving out of the
>> hvm_ioreq_server_deinit() (or dropped?) as well as comment needs
>> updating). I am asking, because this way we would get *a single* arch
>> hook here which would be arch_ioreq_server_deinit() and remove code
>> duplication a bit.
> I would arch specific init and deinit, even if one of them does nothing... but then I like symmetry :-)


Both hvm_ioreq_server_init() and hvm_ioreq_server_deinit() call "legacy" 
hvm_ioreq_server_unmap_pages()
which we want to be abstracted. The only difference between these two 
usages is that the former calls it during rollback only (in case of error).
Taking into the account what has been suggested for question #1 could we 
just introduce arch_ioreq_server_unmap_pages() to be called from both 
init and deinit?


[Not completed not tested]

@@ -762,7 +772,7 @@ static int hvm_ioreq_server_init(struct 
hvm_ioreq_server *s,

   fail_add:
      hvm_ioreq_server_remove_all_vcpus(s);
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_unmap_pages(s);

      hvm_ioreq_server_free_rangesets(s);

@@ -776,7 +786,7 @@ static void hvm_ioreq_server_deinit(struct 
hvm_ioreq_server *s)
      hvm_ioreq_server_remove_all_vcpus(s);

      /*
-     * NOTE: It is safe to call both hvm_ioreq_server_unmap_pages() and
+     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
       *       hvm_ioreq_server_free_pages() in that order.
       *       This is because the former will do nothing if the pages
       *       are not mapped, leaving the page to be freed by the latter.
@@ -784,7 +794,7 @@ static void hvm_ioreq_server_deinit(struct 
hvm_ioreq_server *s)
       *       the page_info pointer to NULL, meaning the latter will do
       *       nothing.
       */
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_unmap_pages(s);
      hvm_ioreq_server_free_pages(s);

      hvm_ioreq_server_free_rangesets(s);
@@ -918,7 +928,7 @@ int hvm_get_ioreq_server_info(struct domain *d, 
ioservid_t id,

      if ( ioreq_gfn || bufioreq_gfn )
      {
-        rc = hvm_ioreq_server_map_pages(s);
+        rc = arch_ioreq_server_map_pages(s);
          if ( rc )
              goto out;
      }


So looks like for leaving legacy mechanism x86 specific we need 4 new 
arch callbacks:

- arch_ioreq_server_enable
- arch_ioreq_server_disable
- arch_ioreq_server_map_pages
- arch_ioreq_server_unmap_pages
>
>> Something close to this.
>> (Not completed and non tested)
>>
>> @@ -761,18 +771,17 @@ static int hvm_ioreq_server_init(struct
>> hvm_ioreq_server *s,
>>        return 0;
>>
>>     fail_add:
>> -    hvm_ioreq_server_remove_all_vcpus(s);
>> -    hvm_ioreq_server_unmap_pages(s);
>> -
>> -    hvm_ioreq_server_free_rangesets(s);
>> -
>> -    put_domain(s->emulator);
>> +    hvm_ioreq_server_deinit(s);
>>        return rc;
>>    }
>>
>> +void arch_ioreq_server_deinit(struct hvm_ioreq_server *s)
>> +{
>> +    hvm_ioreq_server_unmap_pages(s);
>> +}
>> +
>>    static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
>>    {
>> -    ASSERT(!s->enabled);
> I assume this is the ASSERT you're referring to... There's no way we should be deinit-ing an enabled server so that should remain in common code as is.
ok, I agree.

-- 
Regards,

Oleksandr Tyshchenko


