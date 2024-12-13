Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E49F0CBE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 13:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856678.1269227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5BW-0004is-3X; Fri, 13 Dec 2024 12:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856678.1269227; Fri, 13 Dec 2024 12:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5BW-0004h5-0x; Fri, 13 Dec 2024 12:54:22 +0000
Received: by outflank-mailman (input) for mailman id 856678;
 Fri, 13 Dec 2024 12:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OxNP=TG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tM5BU-0004gz-Kn
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 12:54:20 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4aa94e-b951-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 13:54:19 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso1684194e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 04:54:19 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e333dda47sm2287349e87.250.2024.12.13.04.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 04:54:17 -0800 (PST)
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
X-Inumbo-ID: 5e4aa94e-b951-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734094459; x=1734699259; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kT37nskFBPLL/v2ifjenAGgemMKHda0UrLaFaQbzhXk=;
        b=WVEj7dRTUom3VvcyhoQxW1NKszLgt3qPmD5iiHKWYVl5P+/6f1HUu1QqZ1ffihMHm5
         I+6jME6YubstokEuUbmb0BWf5Nkbf4fCxHreiYWkIW5MZ3xpeRfyLVZU+ErF+ntAHVTH
         aLWLALmIhgcJkFjuBY6qhlf3fJGME57EctiMpSm+3+8R4hrgtxum39ImO1gUeUC1YT4Q
         9vIJslokJx/da6sRy/1+3+rwrQ3Y+xfB5Xt4MzehL0f/73+LgUqtDC/NOgSATMl+L4da
         cD4qHzF5W+lu4knqI82sCwP7mXr/WXtCE9HgAU3u6jOxnW2SPGDc5AJreBoK0WlFaaZw
         vqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094459; x=1734699259;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kT37nskFBPLL/v2ifjenAGgemMKHda0UrLaFaQbzhXk=;
        b=HOPGcNY82E7Wp3j8aZonh+LN87v7xN3ogo9J+cfo4DHt3fq41fU5H4CgIl6mBXc0Cx
         U2ylFuhDckVNoInZuXfutvotDh+xFpt5jslLkyuN+3XHFj676y587TYriXTAsS3Rc+3R
         Z46o7E8GR8zwXy8oIOkEjrhNt68kZG8aODv+I5rDyz4oukeOfwE8jaLUTIK7rW30LDzl
         mV89ilbMcfpCa/1ZGoDKFH6No/pMUxEi+N1VZfNIsAYrTXPd5pWFy2sYk4DNy3oAVNU/
         j9bvvKNcnTGKJ3P57GEfrlNem7qj2T/Tqy+snaDxaqQi6pAg9r1IEi9687XXMxs4+v0a
         jvsA==
X-Forwarded-Encrypted: i=1; AJvYcCXapXzyNMDC19k0+I7BmpYJFLIKxvJ0Gd/HLPqj1Kv6Cd9myJwSNKrxbpPASpWb+7yigrJydLlygew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEvwNuDOe0+8BYN7RRY7qc5Rt9fvxygtLn/2v0qzNHCvBQGApQ
	f+ecdeI/wwFfUHvsIVjs492CUqimtamuMnJIKMRpF59wDeD3/6ba
X-Gm-Gg: ASbGnctP0vzeCFTGAJWtEFuvTkT+x3ublIJRKmUW5VedmQIUs4GngkklZ9ZVU40SBCM
	OSeUr98g2rWaPq1aHYJTIeWuA/ppyfMB+uoEoyP27mCTLQqkh1yLgJ/ARWHA7HLbf7K/QxSelNc
	ca9qRVRiuZM2Kyp+1hwT7zcvMAANNWVta372EfRUwnCXhf9Wk/VDq9GIWln1iIjUMUg9yx9RHCZ
	cf67X6mpxXU/6F1SoDIMMP5EKL1U1Pa1sOyKeLBhko+7uQoWkV0AsuX+j+L/S+L86e5Vg==
X-Google-Smtp-Source: AGHT+IEmYt1152AXd5KxqaVYPVTgs3UuOybnOoKk88cbhwKWvCSE5D8Vk6Ejfv1Ts44t7lSVZS2Xyw==
X-Received: by 2002:a05:6512:acb:b0:540:3561:969e with SMTP id 2adb3069b0e04-54090553eccmr762661e87.14.1734094457409;
        Fri, 13 Dec 2024 04:54:17 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ixIz48BZz3EFV8FUvJ4cDO7l"
Message-ID: <3a23d17a-358d-45df-9c9b-65d95a1393f4@gmail.com>
Date: Fri, 13 Dec 2024 13:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/riscv: add destroy_xen_mappings() to remove
 mappings in Xen page tables
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <d52c84417ae4aedb8ce9f73dfa2340fceea137a4.1733937787.git.oleksii.kurochko@gmail.com>
 <d7a286d3-ba85-4903-91c7-920ad35f9580@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d7a286d3-ba85-4903-91c7-920ad35f9580@suse.com>

This is a multi-part message in MIME format.
--------------ixIz48BZz3EFV8FUvJ4cDO7l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/12/24 12:43 PM, Jan Beulich wrote:
> On 11.12.2024 18:27, Oleksii Kurochko wrote:
>> Introduce the destroy_xen_mappings() function, which removes page
>> mappings in Xen's page tables between a start address s and an end
>> address e.
>> The function ensures that both s and e are page-aligned
>> and verifies that the start address is less than or equal to the end
>> address before calling pt_update() to invalidate the mappings.
>> The pt_update() function is called with INVALID_MFN and PTE_VALID=0
>> in the flags, which tell pt_update() to remove mapping. No additional
>> ASSERT() is required to check these arguments, as they are hardcoded in
>> the call to pt_update() within destroy_xen_mappings().
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
> Apparently I just shouldn't provide advance acks, when ...
>
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
>>       return pt_update(virt, mfn, nr_mfns, flags);
>>   }
>>   
>> +int destroy_xen_mappings(unsigned long s, unsigned long e)
>> +{
>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>> +
>> +    return ( s < e ) ? pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0) : -EINVAL;
> ... then you introduce basic style violations like the excess blanks here.

I thought that I could consider ternary operator as `if` which requires spaces around condition.

~ Oleksii

--------------ixIz48BZz3EFV8FUvJ4cDO7l
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
    <div class="moz-cite-prefix">On 12/12/24 12:43 PM, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d7a286d3-ba85-4903-91c7-920ad35f9580@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.12.2024 18:27, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce the destroy_xen_mappings() function, which removes page
mappings in Xen's page tables between a start address s and an end
address e.
The function ensures that both s and e are page-aligned
and verifies that the start address is less than or equal to the end
address before calling pt_update() to invalidate the mappings.
The pt_update() function is called with INVALID_MFN and PTE_VALID=0
in the flags, which tell pt_update() to remove mapping. No additional
ASSERT() is required to check these arguments, as they are hardcoded in
the call to pt_update() within destroy_xen_mappings().

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Apparently I just shouldn't provide advance acks, when ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
     return pt_update(virt, mfn, nr_mfns, flags);
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+
+    return ( s &lt; e ) ? pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0) : -EINVAL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... then you introduce basic style violations like the excess blanks here.</pre>
    </blockquote>
    <pre>I thought that I could consider ternary operator as `if` which requires spaces around condition.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------ixIz48BZz3EFV8FUvJ4cDO7l--

