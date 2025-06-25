Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787F9AE8700
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025159.1400825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURPz-0002Wh-Fs; Wed, 25 Jun 2025 14:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025159.1400825; Wed, 25 Jun 2025 14:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURPz-0002Uv-Be; Wed, 25 Jun 2025 14:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1025159;
 Wed, 25 Jun 2025 14:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahiT=ZI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uURPx-0002SA-IF
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:48:05 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65acc9aa-51d3-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:48:03 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad88d77314bso344632166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:48:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ecbf36sm1071643166b.53.2025.06.25.07.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:48:02 -0700 (PDT)
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
X-Inumbo-ID: 65acc9aa-51d3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750862883; x=1751467683; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fge5zHFjiGQNL2sTZ1U7ExzyqJgZjSHIFj9BUTjsG58=;
        b=Oy6l6fxmlktiMrpmiJ8ihEiiTDlRQIwxBvvLA3cwcEzFqnJJuUukrfcsT2hr7Ajqc/
         i7z5YDQLrw59ms3D2MgGO4Zi2rI/aEGEYrbZOUSc0Dkm+y87m+HR9reI9sCTxkF4rTBz
         hUJFf55PlzDjCbc223u8IxHBF63dyaBjxRJR9uNOp1lsJ0gSHbF454DSVcU8Hk3bhb1Z
         O7gqe7ygVNZWzOHqKp2IwSI3XiICPA6qLO+Wyiu6WfGdKZO+7dAoR+7pXu6FcOVf98P7
         jpR6WOg10FWEtxreR/BgInXDvL7izmoNeOby20hd0IAoTSS+s4uhZPOgfTZw5Jaq/0Nq
         53Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862883; x=1751467683;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fge5zHFjiGQNL2sTZ1U7ExzyqJgZjSHIFj9BUTjsG58=;
        b=Uhdw87gIzRmIvBQifaq14HUJx/ktKPO4MFe0RSsG4LZOQMPbDl+8+ZxR2uJjd6RF9i
         u+WM2VfMHw1WUcEoLqS9p+TIPSIMACuwBVdYqWjqZigQsn8gGpZqcQdQ4HHpVkSDD9Yt
         O2uwrWbUSnyfFf7DIHkoV0o0DEF2JOguGrCrVNPwqTRUELwVKiUJbd0iU3u0XMiGXtkD
         TUuHsiLvsZFDVilUDKTf8vhteskiJjLcX5hbHEgsxhXyQiUeFsYHctOswVhLCbRd8Lwa
         TNagQsFZyjDDjNzBAXIgbnD+gw4E4WgfLblEvph+bzcorZAZkH7HzxB/w42HQcHX5SED
         y7kA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6iSrdXTEJXxh16bYRnJuCTSVuVC6qXPfFKpZsinLFOmfwOQS8A/NAufnbvuHRa70aPGr/W2eyQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPoPsTcxLxnPloWMJ1g/vS09nOxpTUl34rsR2dGYGKmd9tl4zv
	dVj6o78H9sg63RssLtZiqqk2v0qkrdMnU4sjV8AkKr9RYrKxcG7xPNIJ
X-Gm-Gg: ASbGncs2kn69FBWvL1gKrKfr4FQtxg04rxgC67CYI8JN8UlmDvEqhq7DHttnXQFeBUF
	bd+Zr+phMUIFyQmkkNUG4ber8/FXoQZ4sh/4rmp1euq5MjTYzv8OxLunjlFv7YEJEJBSm+nHnHl
	hzhHqvWxFtSktXyXFk6oJiOrIkGyZ2TgpgKmlVGMEBpN9e1tfjCJH0T2jYVkajSZAobJcns79jG
	MT+7w9kx4dzVQBbsFpALbLv+lZsceXvFCIe0eex2BBP88fd6DRaJV04ued+UB3FHIWkD/YJP7c/
	04DxkYpoNaNvF80Gl8E/e3L1kWdHpkorHrOlWVMAVU3L/OGkSelQ67dYirft6+hZO/Jb6x9l+PE
	J7hpU58Gx5pOVVsG2FhLt93MlGYrcVdrTIyQ=
X-Google-Smtp-Source: AGHT+IGvol92BsSzpbkNsKXd4lbpieZOu3E/OeEyZ+2JuL/BhiAVRwOCXdiS8cL75SovyCLe/XUFsw==
X-Received: by 2002:a17:906:7953:b0:ad8:930b:4c32 with SMTP id a640c23a62f3a-ae0be9bd89amr325693566b.28.1750862882586;
        Wed, 25 Jun 2025 07:48:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jFpNxgHsVLo55CahoZCNutO2"
Message-ID: <3db6770c-005f-4123-bb85-0445b4d2d437@gmail.com>
Date: Wed, 25 Jun 2025 16:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
 <3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com>

This is a multi-part message in MIME format.
--------------jFpNxgHsVLo55CahoZCNutO2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/25 5:53 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> @@ -18,10 +20,20 @@ struct arch_vcpu_io {
>>   struct arch_vcpu {
>>   };
>>   
>> +struct paging_domain {
>> +    spinlock_t lock;
>> +    /* Free P2M pages from the pre-allocated P2M pool */
>> +    struct page_list_head p2m_freelist;
>> +    /* Number of pages from the pre-allocated P2M pool */
>> +    unsigned long p2m_total_pages;
>> +};
>> +
>>   struct arch_domain {
>>       struct hvm_domain hvm;
>>   
>>       struct p2m_domain p2m;
>> +
>> +    struct paging_domain paging;
> With the separate structures, do you have plans to implement e.g. shadow paging?
> Or some other paging mode beyond the basic one based on the H extension?

No, there is no such plans.

>   If the
> structures are to remain separate, may I suggest that you keep things properly
> separated (no matter how e.g. Arm may have it) in terms of naming? I.e. no
> single "p2m" inside struct paging_domain.

Arm doesn't implement shadow paging too (AFAIK) and probably this approach was
copied from x86, and then to RISC-V.
I thought that a reason for that was just to have two separate entities: one which
covers page tables and which covers the full available guest memory.
And if the only idea of that was to have shadow paging then I don't how it should
be done better. As p2m code is based on Arm's, perhaps, it makes sense to have
this stuff separated, so easier porting will be.

>
>> @@ -105,6 +106,9 @@ int p2m_init(struct domain *d)
>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>       int rc;
>>   
>> +    spin_lock_init(&d->arch.paging.lock);
>> +    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
> If you want p2m and paging to be separate, you will want to put these in a new
> paging_init().

I am not really understand what is wrong to have it here, but likely it is because
I don't really get an initial purpose of having p2m and paging separately.
It seems like p2m and paging are connected between each other, so it is fine
to init them together.

~ Oleksii

--------------jFpNxgHsVLo55CahoZCNutO2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/25 5:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -18,10 +20,20 @@ struct arch_vcpu_io {
 struct arch_vcpu {
 };
 
+struct paging_domain {
+    spinlock_t lock;
+    /* Free P2M pages from the pre-allocated P2M pool */
+    struct page_list_head p2m_freelist;
+    /* Number of pages from the pre-allocated P2M pool */
+    unsigned long p2m_total_pages;
+};
+
 struct arch_domain {
     struct hvm_domain hvm;
 
     struct p2m_domain p2m;
+
+    struct paging_domain paging;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With the separate structures, do you have plans to implement e.g. shadow paging?
Or some other paging mode beyond the basic one based on the H extension?</pre>
    </blockquote>
    <pre>No, there is no such plans.

</pre>
    <blockquote type="cite"
      cite="mid:3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com">
      <pre wrap="" class="moz-quote-pre"> If the
structures are to remain separate, may I suggest that you keep things properly
separated (no matter how e.g. Arm may have it) in terms of naming? I.e. no
single "p2m" inside struct paging_domain.</pre>
    </blockquote>
    <pre>Arm doesn't implement shadow paging too (AFAIK) and probably this approach was
copied from x86, and then to RISC-V.
I thought that a reason for that was just to have two separate entities: one which
covers page tables and which covers the full available guest memory.
And if the only idea of that was to have shadow paging then I don't how it should
be done better. As p2m code is based on Arm's, perhaps, it makes sense to have
this stuff separated, so easier porting will be.

</pre>
    <blockquote type="cite"
      cite="mid:3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -105,6 +106,9 @@ int p2m_init(struct domain *d)
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
+    spin_lock_init(&amp;d-&gt;arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&amp;d-&gt;arch.paging.p2m_freelist);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you want p2m and paging to be separate, you will want to put these in a new
paging_init().</pre>
    </blockquote>
    <pre>I am not really understand what is wrong to have it here, but likely it is because
I don't really get an initial purpose of having p2m and paging separately.
It seems like p2m and paging are connected between each other, so it is fine
to init them together.

~ Oleksii</pre>
  </body>
</html>

--------------jFpNxgHsVLo55CahoZCNutO2--

