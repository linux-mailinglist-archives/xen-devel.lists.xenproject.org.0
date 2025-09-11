Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BDB52A5F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119467.1464816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwbzg-0001lB-Np; Thu, 11 Sep 2025 07:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119467.1464816; Thu, 11 Sep 2025 07:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwbzg-0001jY-KY; Thu, 11 Sep 2025 07:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1119467;
 Thu, 11 Sep 2025 07:45:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8rd=3W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uwbzf-0001WI-F3
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:45:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 447366c8-8ee3-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 09:45:21 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b0787fc3008so52522766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 00:45:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da43esm73482166b.14.2025.09.11.00.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 00:45:19 -0700 (PDT)
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
X-Inumbo-ID: 447366c8-8ee3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757576720; x=1758181520; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmGPRKp7wyDkMZLVbkuaXn9JmpRopky+vuOQLMD+HII=;
        b=aOQDNYz5jMSa7ccq6OwfK7GOeLH7PHMHcml8VjuCTQHSg4hPGxUYq6lDeh5mhb/UmZ
         yCwaC09/2EnG9XMW1chdy5A7JC6Wan6ApTfuZNoxsKqoWDlnqrdYn0cXQlzGm45Mnn+F
         aeIjJ8yqbMxPtcQZ4C7ByUF/wlCFYbFCSTUfSGtF/C4hy4yOdqLvGOOImK71QcRu8J1R
         huDPgVTva7sV0yFyPqixJC/4GJFt2mEcbPawE2DlHysC8K2oKzVkNvfyK7AirItSf+7h
         c8EbC+A6Fq36hzPxDAncUThKyrdXiK7wCiSP8dIjO0GKy1iWYs48o74QSuWOQd8mkpDI
         aMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576720; x=1758181520;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xmGPRKp7wyDkMZLVbkuaXn9JmpRopky+vuOQLMD+HII=;
        b=VMV92RqjVIWTj3YxAF8Zo+lKzEewLdOG/OodFXLy1duYtugJyGZ1KC42uvwd7xKi6y
         31XooZJvbEupeH0RbXSFZACsDfPJ2Z3QVlUX5mqB+ANkXe9v1TkC/otdCiUaiZYMti+S
         3fnY2kfZ7t/lMAIsqlyf5+Sw1wqAan0oSiq01cbWnS1ggeFt03K6Cfr/rdjse5MLDkoc
         tTXW7pFmxhnfiKfCItWP4LkCQoGaq1yORupdFh6SKo0Uv5FKKx4nttfTno4hSnOmr6hx
         FO0U1P+E9KMhfcBxFCErDfZj3K07HD8KsVQPdeXAhibRe0zIJ2xuy0dvYppuhxCeOwCj
         p0FA==
X-Forwarded-Encrypted: i=1; AJvYcCUiaslQhGREfETf8qI5/YOGevaZcxU1inU9+7H2+5ljnrG1kGO02MErOvk0+j+E7n582vH/Ur1Dszw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxi5U1Koz+Lew6Ly2XAXLicTTEduI5+1e343DDJdot1e11rQXG
	inmU1gtYbGIAcgeG0//htmd3weVD2jwYTfMwUKBvf/CmoiRGNf6dL6Vw
X-Gm-Gg: ASbGnctb0wQ9jgjKhGLcAHDY4vszJXV9lOfwzIWOYm53cX6k6B/52yItiv30dnh5YGF
	Q/s3LLuKsnm8ZuO4eBqTVn9oTby4qWtG1ZWxJh9zCUHOPAJP4aHOziCq017+gV/jOSmrV2Sqoum
	85Os1FsdwxK64yEKoi/mY5ixWqh6EHd3oVFLtMIzQCfmMHlp+Zk1NYATnZWnqtvdydpsjahVAmU
	Y8hScJcKWWLqA43Thx8SO11kIME+9zClQLo+MLj4HoLfGt/a3HbwjjAsoJElKXHHVn7yAyk6cYh
	MYz7S1a+Qt4ZfJJFOh/nfEIUcIql/7FN1o1xtOb51/lqi9w1PuhOAA8N+07HxHNF78reQ72poF9
	dH5KvrVkS+vCrxGN+1pKX47TP9bEGEOUSk9mAjuMl0A9EHLcvsAxe8s3/wm1BodoR9TB94oig
X-Google-Smtp-Source: AGHT+IGesPJpsrn25kj+9GrTGFTO0cu3anl96ByXKb+08bSpeNLljpU8H38EYhDEXdXAWLMhfRZ73g==
X-Received: by 2002:a17:907:728c:b0:b07:88ef:fe1a with SMTP id a640c23a62f3a-b0788f004c2mr545448066b.40.1757576719847;
        Thu, 11 Sep 2025 00:45:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------nh800EQ0QKFzbDBJVeyaxtB7"
Message-ID: <95737e6b-0834-45e0-b8a4-f3f9cd2717ae@gmail.com>
Date: Thu, 11 Sep 2025 09:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/IO-APIC: drop setup_ioapic_ids_from_mpc()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
 <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
 <bbe33d31-949c-4bf1-96f5-598b21faf149@citrix.com>
 <3c678b60-4e1d-4c51-bfe4-efe3acee4e8f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3c678b60-4e1d-4c51-bfe4-efe3acee4e8f@suse.com>

This is a multi-part message in MIME format.
--------------nh800EQ0QKFzbDBJVeyaxtB7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/10/25 3:36 PM, Jan Beulich wrote:
> On 10.09.2025 15:26, Andrew Cooper wrote:
>> On 03/09/2025 8:55 am, Jan Beulich wrote:
>>> Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
>>> said, the function is dead logic as well: All 64-bit capable Intel systems
>>> have (at least) xAPIC (if not x2APIC).
>>>
>>> Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
>>> code; we didn't accept that yet, but - where possible - we probably would
>>> better follow it). Depending on one's reading, this code may actually be a
>>> violation of rule 2.1 (unreachable), which we did accept:
>>>
>>> "Code is unreachable if, ..., there is no combination of program inputs
>>>   that can cause it to be executed."
>>>
>>> Otoh it's "only" __init code.
>>>
>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>> The code change is fine, but the commit message should be first
>> paragraph only.
>>
>> The first paragraph is plenty of justification to make the change,
>> irrespective of anything else.
> Well. I wouldn't have added the other parts if we weren't where we are in
> the release cycle. Strictly speaking, with them dropped I can't put these
> two patches in right now. Oleksii, may I ask for your view please (on
> both of the patches, as they're both similar in this regard)?

For both patches, I think it would still be useful to retain the explanation
about the MISRA Rule 2.2 violation in the commit message. While I agree that
the first paragraph provides sufficient justification on its own, the additional
context helps clarify why we're committing this change now, rather than waiting
until after the release. It also highlights the additional benefit of improving
MISRA compliance by removing this dead code.

Anyway, I am okay with having these patches merged now:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
>> The other 3 paragraphs are musings on an area of MISRA where which is
>> unclear, or even disputed.  The code here is statically reachable,
>> dynamically unreachable, and trying to argue this in terms of dead or
>> unreachability detracts from an otherwise clear patch.
>>
>> With a very strong preference to have the commit message be only the
>> first paragraph, Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Thanks (also for the one for patch 2).
>
> Jan
--------------nh800EQ0QKFzbDBJVeyaxtB7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/10/25 3:36 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3c678b60-4e1d-4c51-bfe4-efe3acee4e8f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.09.2025 15:26, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 03/09/2025 8:55 am, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
said, the function is dead logic as well: All 64-bit capable Intel systems
have (at least) xAPIC (if not x2APIC).

Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
code; we didn't accept that yet, but - where possible - we probably would
better follow it). Depending on one's reading, this code may actually be a
violation of rule 2.1 (unreachable), which we did accept:

"Code is unreachable if, ..., there is no combination of program inputs
 that can cause it to be executed."

Otoh it's "only" __init code.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The code change is fine, but the commit message should be first
paragraph only.

The first paragraph is plenty of justification to make the change,
irrespective of anything else.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well. I wouldn't have added the other parts if we weren't where we are in
the release cycle. Strictly speaking, with them dropped I can't put these
two patches in right now. Oleksii, may I ask for your view please (on
both of the patches, as they're both similar in this regard)?</pre>
    </blockquote>
    <pre dir="auto" style="white-space: pre-wrap;">For both patches, I think it would still be useful to retain the explanation
about the MISRA Rule 2.2 violation in the commit message. While I agree that
the first paragraph provides sufficient justification on its own, the additional
context helps clarify why we're committing this change now, rather than waiting
until after the release. It also highlights the additional benefit of improving
MISRA compliance by removing this dead code.

Anyway, I am okay with having these patches merged now:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:3c678b60-4e1d-4c51-bfe4-efe3acee4e8f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The other 3 paragraphs are musings on an area of MISRA where which is
unclear, or even disputed.  The code here is statically reachable,
dynamically unreachable, and trying to argue this in terms of dead or
unreachability detracts from an otherwise clear patch.

With a very strong preference to have the commit message be only the
first paragraph, Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks (also for the one for patch 2).

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------nh800EQ0QKFzbDBJVeyaxtB7--

