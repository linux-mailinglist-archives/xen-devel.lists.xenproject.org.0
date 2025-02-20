Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B66A3D46F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893680.1302550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2iD-00060X-EY; Thu, 20 Feb 2025 09:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893680.1302550; Thu, 20 Feb 2025 09:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2iD-0005z3-Ay; Thu, 20 Feb 2025 09:19:17 +0000
Received: by outflank-mailman (input) for mailman id 893680;
 Thu, 20 Feb 2025 09:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tl2iB-0005Vq-WA
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:19:16 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c08623c9-ef6b-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 10:19:14 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30613802a59so7144681fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 01:19:14 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3092440033fsm20486041fa.14.2025.02.20.01.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 01:19:13 -0800 (PST)
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
X-Inumbo-ID: c08623c9-ef6b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043154; x=1740647954; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuuvhO5AMQg3rO6RO2UGc09K6QJXxRxZ3Vn4LKrlqPA=;
        b=mT4QQ7k/zZfFraHFOOHW44eUfDqznLhm3p1E5xB5jKKGIJ0S/etmdHIJAqtBs8Hubn
         ON2Cyu4CEfyaFnWMGVr31g0o99Cu/aVFWAX3kP0RVZN0TrEjFugnTtUFDVVCAtJXHLDR
         mzxW0ZB/1jbAa7Nu0sONl06cTs7SHyMqdSG6BYHpuhHsnMkiWjnvtehdtadZZmZO5rOk
         EZRsdpxh7p3Si05rTR5XXVm8q/ncaojypU4HG2UUUFOukxjE8In9doOSm7qXOwebm29k
         UrVcgvRz8tnlTQZLYYTM+a+IMr1K04HM0k1EtHNNTmBSjDLk7wBbl/xOCEJYjdQkYafw
         VO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043154; x=1740647954;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uuuvhO5AMQg3rO6RO2UGc09K6QJXxRxZ3Vn4LKrlqPA=;
        b=BS7CEhBspL7ZCHLwsMvOsYjIHHeQ8At2oqevUkBzeZftMHRNNxi7KsuowlSdCu7xes
         qmeOyl0P3yjRP1JrLjWW8hnHiqVf045rCcuIOB9mqmjRlQ5k2NJGZC4hKgjCu+9xMhWZ
         EkWd51kCcDpYFT04u8mNQfcsM+81KNMSGJXcrAHTAPBBmh4jffU4lhfyUmcS5xcp+wn3
         yKJ561EUTXdh/uZ5QoPOHiM0hxd1y0kVoF6ecwo/gBI3X74S6qkiC9asG7eozW3O5CTO
         1Ht3wom1t+Oqhy4vovTwVLRAEgru8/H9b2qSahgvKm7e+95N7ohs1rNVTHR1HfwwiecM
         gfVg==
X-Forwarded-Encrypted: i=1; AJvYcCVfbeLt2c4IMKpOBa7oLmbtzNWkPKbskJzUkEN4XRIJjMaFn+xYfmsbyDNLtpzjaczRWsB0HM5ZqW0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbG4RAiIWAawUivgYOczqhl0KYjx/tPw/3fOAJqHHvLriJM5mb
	gpaDqNIO/atq/Pa1XMOuk2jm/UlXDhTK+gZzjteGjjxGU9GDhXc1
X-Gm-Gg: ASbGncvNTyHqH8hnjphGUWleUP1ARqf79rhE1sGVWykSqsRudG8Ay+3SjghmvR6Xngh
	bgjAiGvN0gQE2M+YoPx+MaUH4meTo24Izdq7lYDzfBBIlTWGf8EozxPDmKN49JsoS0G51ScIAlZ
	eaTHgjr6N2tVShB/4Xd6bHQ+tnBLpDiAHI0dg+W7COdYL566k5MXSR5qrOL2/w2hbE5IS+zWrlr
	LYIO5DPJOvOa7VYNzP4WqLkm+lHZLl4TjjfIOM8iOsd6ZhWyFFLPuHOA6FNKATgokpF98kzxK+w
	VmF3zzjFCUOrZ8utU3KPMSwg
X-Google-Smtp-Source: AGHT+IGDkbeUSTMJbRt6BpAeQtVqR5CI0hvmbWaxIfRHALTRcXA9vYHpoGvPQ9Om6EwbfOiA4Gfk+g==
X-Received: by 2002:a2e:870b:0:b0:309:2198:16f2 with SMTP id 38308e7fff4ca-30a44dcbe20mr19862811fa.10.1740043153578;
        Thu, 20 Feb 2025 01:19:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------4SFpuiOLdclNwDWZUEaD0zvF"
Message-ID: <921cae1e-cd0f-4c4c-aee8-5b82bffc85fa@gmail.com>
Date: Thu, 20 Feb 2025 10:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop>
 <daaf4284-102c-4fc4-819c-2231705ab572@suse.com>
 <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop>
 <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
 <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop>
 <4e084d1c-93c0-4148-b12c-27f56f678a74@suse.com>
 <alpine.DEB.2.22.394.2502191751350.1791669@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502191751350.1791669@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------4SFpuiOLdclNwDWZUEaD0zvF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/20/25 2:52 AM, Stefano Stabellini wrote:
> On Wed, 19 Feb 2025, Jan Beulich wrote:
>> On 18.02.2025 22:42, Stefano Stabellini wrote:
>>> On Tue, 18 Feb 2025, Jan Beulich wrote:
>>>> On 18.02.2025 00:12, Stefano Stabellini wrote:
>>>>> On Mon, 17 Feb 2025, Jan Beulich wrote:
>>>>>> On 15.02.2025 03:16, Stefano Stabellini wrote:
>>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>>> @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
>>>>>>>   {
>>>>>>>       ASSERT(v == current || !vcpu_runnable(v));
>>>>>>>   
>>>>>>> -    switch ( reg )
>>>>>>> -    {
>>>>>>> -    default:
>>>>>>> -        return alternative_call(hvm_funcs.get_reg, v, reg);
>>>>>>> -    }
>>>>>>> +    return alternative_call(hvm_funcs.get_reg, v, reg);
>>>>>>>   }
>>>>>>>   
>>>>>>>   void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>>>>>>   {
>>>>>>>       ASSERT(v == current || !vcpu_runnable(v));
>>>>>>>   
>>>>>>> -    switch ( reg )
>>>>>>> -    {
>>>>>>> -    default:
>>>>>>> -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>>>>>>> -    }
>>>>>>> +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>>>>>>>   }
>>>>>> Both of these were, iirc, deliberately written using switch(), to ease
>>>>>> possible future changes.
>>>>> To be honest, I do not see any value in the way they are currently
>>>>> written. However, if you prefer, I can add a deviation for this, with
>>>>> one SAF comment for each of these two. The reason for the deviation
>>>>> would be "deliberate to ease possible future change". Please let me know
>>>>> how you would like to proceed.
>>>> Well, best next thing you can do is seek input from the person who has
>>>> written that code, i.e. Andrew.
>>> Andrew wrote in chat that he is OK with a deviation and he can live with
>>> a SAF deviation. Here is the patch.
>>>
>>>
>>> ---
>>> xen/x86: resolve the last 3 MISRA R16.6 violations
>>>
>>> MISRA R16.6 states that "Every switch statement shall have at least two
>>> switch-clauses". There are only 3 violations left on x86 (zero on ARM).
>>>
>>> One of them is only a violation depending on the kconfig configuration.
>>> So deviate it instead with a SAF comment.
>>>
>>> Two of them are deliberate to enable future additions. Deviate them as
>>> such.
>>>
>>> Signed-off-by: Stefano Stabellini<stefano.stabellini@amd.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
> Thanks!
>
> Oleksii, may I ask for a release-ack?

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------4SFpuiOLdclNwDWZUEaD0zvF
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
    <div class="moz-cite-prefix">On 2/20/25 2:52 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502191751350.1791669@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Wed, 19 Feb 2025, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 18.02.2025 22:42, Stefano Stabellini wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Tue, 18 Feb 2025, Jan Beulich wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 18.02.2025 00:12, Stefano Stabellini wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Mon, 17 Feb 2025, Jan Beulich wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 15.02.2025 03:16, Stefano Stabellini wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
 {
     ASSERT(v == current || !vcpu_runnable(v));
 
-    switch ( reg )
-    {
-    default:
-        return alternative_call(hvm_funcs.get_reg, v, reg);
-    }
+    return alternative_call(hvm_funcs.get_reg, v, reg);
 }
 
 void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
     ASSERT(v == current || !vcpu_runnable(v));
 
-    switch ( reg )
-    {
-    default:
-        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
-    }
+    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
 }
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">
Both of these were, iirc, deliberately written using switch(), to ease
possible future changes.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">
To be honest, I do not see any value in the way they are currently
written. However, if you prefer, I can add a deviation for this, with
one SAF comment for each of these two. The reason for the deviation
would be "deliberate to ease possible future change". Please let me know
how you would like to proceed.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Well, best next thing you can do is seek input from the person who has
written that code, i.e. Andrew.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Andrew wrote in chat that he is OK with a deviation and he can live with
a SAF deviation. Here is the patch.


---
xen/x86: resolve the last 3 MISRA R16.6 violations

MISRA R16.6 states that "Every switch statement shall have at least two
switch-clauses". There are only 3 violations left on x86 (zero on ARM).

One of them is only a violation depending on the kconfig configuration.
So deviate it instead with a SAF comment.

Two of them are deliberate to enable future additions. Deviate them as
such.

Signed-off-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@amd.com">&lt;stefano.stabellini@amd.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks!

Oleksii, may I ask for a release-ack?</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
  </body>
</html>

--------------4SFpuiOLdclNwDWZUEaD0zvF--

