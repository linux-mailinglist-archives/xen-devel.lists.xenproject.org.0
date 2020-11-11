Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA47B2AE493
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 01:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24110.51186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcdcH-0001KO-6q; Wed, 11 Nov 2020 00:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24110.51186; Wed, 11 Nov 2020 00:04:01 +0000
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
	id 1kcdcH-0001Jz-3L; Wed, 11 Nov 2020 00:04:01 +0000
Received: by outflank-mailman (input) for mailman id 24110;
 Wed, 11 Nov 2020 00:04:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcdcG-0001Ju-42
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 00:04:00 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42cb2559-726b-46e6-be0c-6ba568fe2fe4;
 Wed, 11 Nov 2020 00:03:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s9so15139008ljo.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 16:03:59 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k21sm30013ljb.43.2020.11.10.16.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 16:03:57 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcdcG-0001Ju-42
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 00:04:00 +0000
X-Inumbo-ID: 42cb2559-726b-46e6-be0c-6ba568fe2fe4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 42cb2559-726b-46e6-be0c-6ba568fe2fe4;
	Wed, 11 Nov 2020 00:03:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s9so15139008ljo.11
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 16:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=76xm+qijDBcEjInIg3M0U+JEDRMn7Wif8SEw0tdElMk=;
        b=ThrRLsnZXo/mU1BCaVwghtoSRultTp31XKN2HkvyxH+lB11mkDr7QXN7GQeJnp9fo8
         zvyDtSKl7Q3DqcE9VgJUGle1ajLq5iv/ccQva+K1mrLsvbGxpzuJr6Qp+BjBLyF2MoHr
         hSbAIaPRufDIEVcMlkcJEMuRhJu+ERlCM0HbT/6O1NR6jwoP1CVOSea3LHXX+CQB4d6o
         ngsUMdGf2jPhnKI4p8qqS0GeK16CDZZDsTBg5JmtoM5h9hQxFdToiduPtEa9w4sUsCDP
         qs2SsAcoL5lRKRESv8FuuNeDstqjngLJ5nDqH0eiv0ujF/kILRcqQERf5S0aopAEYr35
         0VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=76xm+qijDBcEjInIg3M0U+JEDRMn7Wif8SEw0tdElMk=;
        b=UUnTs/ta69JXzKm0ZoZpp0ndCCa8P2ZXE4v1vYROdBQpxIENAHIN2xY2NbTNwR75+v
         Cu/2nvuj1wAjX30lBIfPyaqWObU0FzM0ey6/dmRYXWVRFnJ9R0Z3qEbt2OGogT9KuOM3
         MU2ZQheIiCezdMp3Ue1Smto73RsJXhBkBhiNGlYlVj59qjbGHCDExlhBVAPseqdYbzk6
         /JqkK1U0gp1ywxsf1HVjTQa3Fw4wTa8sgLJdeoD63xbOlF4a6Of4j04vic4Aull+jai0
         DN63gw/fS7AqIl59iQ8IvxOEM6jBUSudl9DYKN8AwPiBSMKISfj8fGYZN5qQNYO4knx7
         cpGg==
X-Gm-Message-State: AOAM530RCq8GXfJihCMSxO6ZuuKaYiEeqsJa4afj4V7PWD5Uf5O0l20I
	/FA/vgvjyPicx5DcbcWE5r0=
X-Google-Smtp-Source: ABdhPJzuw9qiO4fqJ5NLkzharGPNppmAG0y9E9/wbed9HJP8IqF51XGEf9VrM9/I3qmcrXeAARhY9A==
X-Received: by 2002:a2e:9811:: with SMTP id a17mr9046177ljj.164.1605053038083;
        Tue, 10 Nov 2020 16:03:58 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id k21sm30013ljb.43.2020.11.10.16.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 16:03:57 -0800 (PST)
Subject: Re: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
 <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
 <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ecd5c3a5-e889-4fff-8145-3c129f619979@gmail.com>
Date: Wed, 11 Nov 2020 02:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.10.20 11:41, Julien Grall wrote:

Hi Jan, Julien

Sorry for the late response.

> Hi Jan,
>
> On 16/10/2020 07:29, Jan Beulich wrote:
>> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>>> @@ -1067,7 +1068,14 @@ static int __p2m_set_entry(struct p2m_domain 
>>> *p2m,
>>>        */
>>>       if ( p2m_is_valid(orig_pte) &&
>>>            !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
>>> +    {
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +        if ( domain_has_ioreq_server(p2m->domain) &&
>>> +             (p2m->domain == current->domain) && 
>>> p2m_is_ram(orig_pte.p2m.type) )
>>> +            p2m->domain->qemu_mapcache_invalidate = true;
>>> +#endif
>>>           p2m_free_entry(p2m, orig_pte, level);
>>> +    }
>>
>> For all I have to say here, please bear in mind that I don't know
>> the internals of Arm memory management.
>>
>> The first odd thing here the merely MFN-based condition. It may
>> well be that's sufficient, if there's no way to get a "not present"
>> entry with an MFN matching any valid MFN. (This isn't just with
>> your addition, but even before.
> Invalid entries are always zeroed. So in theory the problem could 
> arise if MFN 0 used in the guest. It should not be possible on 
> staging, but I agree this should be fixed.
>
>>
>> Given how p2m_free_entry() works (or is supposed to work in the
>> long run), is the new code you add guaranteed to only alter leaf
>> entries?
>
> This path may also be called with tables. I think we want to move the 
> check in p2m_free_entry() so we can find the correct leaf type.

Well, but inside p2m_free_entry() we don't have a new entry in order to 
check whether new MFN is actually different. An extra arg only comes to 
mind...

[Didn't update call sites yet and didn't tested]

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 5bb23df..4001f46 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -739,7 +739,7 @@ static void p2m_put_l3_page(const lpae_t pte)

  /* Free lpae sub-tree behind an entry */
  static void p2m_free_entry(struct p2m_domain *p2m,
-                           lpae_t entry, unsigned int level)
+                           lpae_t entry, lpae_t new_entry, unsigned int 
level)
  {
      unsigned int i;
      lpae_t *table;
@@ -750,17 +750,19 @@ static void p2m_free_entry(struct p2m_domain *p2m,
      if ( !p2m_is_valid(entry) )
          return;

-    /* Nothing to do but updating the stats if the entry is a 
super-page. */
-    if ( p2m_is_superpage(entry, level) )
+    if ( p2m_is_superpage(entry, level) || (level == 3) )
      {
-        p2m->stats.mappings[level]--;
-        return;
-    }
+#ifdef CONFIG_IOREQ_SERVER
+        if ( domain_has_ioreq_server(p2m->domain) &&
+             (p2m->domain == current->domain) &&
+             !mfn_eq(lpae_get_mfn(new_entry), lpae_get_mfn(entry)) &&
+             p2m_is_ram(entry.p2m.type) )
+            p2m->domain->qemu_mapcache_invalidate = true;
+#endif

-    if ( level == 3 )
-    {
          p2m->stats.mappings[level]--;
-        p2m_put_l3_page(entry);
+        if ( level == 3 )
+            p2m_put_l3_page(entry);
          return;
      }

(END)

-- 
Regards,

Oleksandr Tyshchenko


