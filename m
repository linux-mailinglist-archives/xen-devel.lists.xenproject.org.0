Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC0E9EAF7A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852134.1266030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyBt-0002dY-EY; Tue, 10 Dec 2024 11:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852134.1266030; Tue, 10 Dec 2024 11:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyBt-0002aP-Be; Tue, 10 Dec 2024 11:14:09 +0000
Received: by outflank-mailman (input) for mailman id 852134;
 Tue, 10 Dec 2024 11:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tKyBs-0002aJ-13
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:14:08 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de7c9e1b-b6e7-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 12:14:05 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d2726c0d45so8271875a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:14:05 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3cf972f6dsm5830550a12.61.2024.12.10.03.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 03:14:04 -0800 (PST)
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
X-Inumbo-ID: de7c9e1b-b6e7-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733829245; x=1734434045; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PanCeP32sCOlzvOWZ2FsBznZgpJOGljF9olnOzuk8VE=;
        b=RcNltJA8qd3NdRc0slSQ9CDtUf8ktWztHosZ5sSzomPQWf2LocfdVeMtu8CZfkiw8F
         fPwqEbhpQGe16/GrZy+LHvKnogRYU5FPTdl0dMTrDlDaWUG3iC0P9nu9nqDu715kIWeZ
         zGt3h6IrNxOU5bcnuX7xS00p9AHOM2FNx3CsgqBWXmSP2DzGmK183olp5+k8cfBu04Uw
         3JebCdlH7HtJroBEkDn3xugGqjyfFa2ez+4ZGM/NnSD/7raxyBW5BpZHAvT5OYwCLwrQ
         UHebo62skBwRIubHEWt5g4/NV0xKqfoPYsrD2G/HhGIAiu17xeojuZFE3UTk6AG4EooV
         hRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733829245; x=1734434045;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PanCeP32sCOlzvOWZ2FsBznZgpJOGljF9olnOzuk8VE=;
        b=btsCS+cHWAG7v1hxFqi77Jlw9dYn4CuNrzNe7MuXMlA3Sq51QvBgwJNx+fC5tkWCyo
         8Z8GB76X7f/NGAEk1XOrMIcvAVY4YDpzk1Nv2UoV2K+zwqKJpoHklm98+rmmDNZVZhEm
         /rCj2LEsotdJkgxqf2dYsLe1A802p2X1AQdhQc/v+68+54hREVjiLGvScf04Dtz6IStT
         1qN7rR3AITzW5MUHXJDYG9vZwAKWOW6D8jr++LuN3SOFv2mEUm/fysUp67c//Rg4o2Y5
         H2RRxGzYgWcAsu9OLW9+dM6QAUAPs+MEWFQLI+6gaJxpBg3NtFCbWDr6D7dWeG0qpXp3
         Esxg==
X-Forwarded-Encrypted: i=1; AJvYcCU1bvHBivLvG7dx/v2r0SITU3NSH6uZ248b+eeiy04e3LV0PO02tMMsvnMoSh+wtWmbvKMQqPE2yZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh2HnGbsmKK/D/TMzudzU393yO2c4O4gqz+eZtRrDZ3KnM88DO
	WseHLtpwU3HmQSw3DiTzc1e0RCSUzgZf96w17CNPt2dKj/N+KvD4
X-Gm-Gg: ASbGncuVH/xmSc/WFc7v7F5SsQr+OHsln6/m95qsC+qIx2h7WqHrc5Gqi4BejTjBOTf
	PZLnztqI4KNx3RYRhVa9/fmKL4CI9l8UBZ0gxrALpIcf2fFlkUzQ7L11elVi1U87D34kfnlWONh
	ra4LXqsG1t/0ITLIOhSPh3HBZVL8nOjMmPTe02Sww37EJl2SE1oyVmnISpE2RpqnfIsgZbu3BIQ
	1/mcrrqfQvyKqLttUVr1tP3TZlYiZJ+xFZrJMZTmnzKMl2aTIXNOwk+fh0ugMJawWA=
X-Google-Smtp-Source: AGHT+IEvm9kcCXTVGnyWs5XOpmf4fe7Q66fbqNPsMyRbvKdmtWWwEM+RCds0qLO3agb61X3Aqobjqg==
X-Received: by 2002:a05:6402:388f:b0:5d2:73b0:81ef with SMTP id 4fb4d7f45d1cf-5d4185fdeebmr4637559a12.22.1733829245093;
        Tue, 10 Dec 2024 03:14:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------eSPJsR1z4PnPkS5pjaIYUzk5"
Message-ID: <e887040e-5402-4314-926f-5cd8947bbedc@gmail.com>
Date: Tue, 10 Dec 2024 12:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: add destroy_xen_mappings() to remove
 mappings in Xen page tables
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <eed2acbf660cadbfb267e7854e9f67eb382cc966.1732709650.git.oleksii.kurochko@gmail.com>
 <0640888f-3b9d-4f5c-9797-856374f16155@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0640888f-3b9d-4f5c-9797-856374f16155@suse.com>

This is a multi-part message in MIME format.
--------------eSPJsR1z4PnPkS5pjaIYUzk5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/24 3:23 PM, Jan Beulich wrote:
> On 27.11.2024 13:50, Oleksii Kurochko wrote:
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
> Acked-by: Jan Beulich<jbeulich@suse.com>
>
> However, ...
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
>> +    ASSERT(s <= e);
>> +    return pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0);
>> +}
> ... I'm unconvinced the constraints need to be this strict. You could,
> for example, very well just avoiding to call pt_update() when s > e
> (or really when s >= e). Thoughts?

On one hand, we could simply avoid calling |pt_update()|, but on the 
other hand, this approach might cause us to miss a bug without any 
notification.

Given that this is an|ASSERT()| that only triggers in debug builds and is unlikely to occur,
I believe it is not critical to include the|ASSERT()| here. Additionally, avoiding an extra
|if| condition helps prevent any potential performance impact. However, the|if| condition
would likely evaluate to true most of the time, allowing hardware optimizations to handle
it efficiently.

~ Oleksii

--------------eSPJsR1z4PnPkS5pjaIYUzk5
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
    <div class="moz-cite-prefix">On 12/9/24 3:23 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0640888f-3b9d-4f5c-9797-856374f16155@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.11.2024 13:50, Oleksii Kurochko wrote:
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

However, ...

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
+    ASSERT(s &lt;= e);
+    return pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... I'm unconvinced the constraints need to be this strict. You could,
for example, very well just avoiding to call pt_update() when s &gt; e
(or really when s &gt;= e). Thoughts?</pre>
    </blockquote>
    <pre><font face="monospace">On one hand, we could simply avoid calling <code>pt_update()</code>, but on the other hand,
this approach might cause us to miss a bug without any notification.</font></pre>
    <pre>Given that this is an <code>ASSERT()</code> that only triggers in debug builds and is unlikely to occur,
I believe it is not critical to include the <code>ASSERT()</code> here. Additionally, avoiding an extra
<code>if</code> condition helps prevent any potential performance impact. However, the <code>if</code> condition
would likely evaluate to true most of the time, allowing hardware optimizations to handle
it efficiently.</pre>
    <pre></pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------eSPJsR1z4PnPkS5pjaIYUzk5--

