Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F0A3D465
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893661.1302529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2hU-0004yv-QA; Thu, 20 Feb 2025 09:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893661.1302529; Thu, 20 Feb 2025 09:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2hU-0004w4-NM; Thu, 20 Feb 2025 09:18:32 +0000
Received: by outflank-mailman (input) for mailman id 893661;
 Thu, 20 Feb 2025 09:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tl2hT-0004vv-SC
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:18:31 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6af59ec-ef6b-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 10:18:30 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so6665681fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 01:18:30 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3092b270c73sm17255441fa.9.2025.02.20.01.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 01:18:29 -0800 (PST)
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
X-Inumbo-ID: a6af59ec-ef6b-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043110; x=1740647910; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjOac9/ho41mGe3aAgNT6sndPVOIr+U0FOWtJH6Asvc=;
        b=hF4HDNAZ/7iYu2ltOArTtR6zeGgLtLdrKuTieYW8lcv8OJ0ju6I+BpuO9ZYSc54W74
         5SWJW0Tw3z2+PI2XwUDbn4Jspk873SkM+VXMPi/7p/wH6689GUv2moLQHq0A01oIWxlY
         8QHdLiZy3Nmwx7Li1/D6iAspRDRuwqo4uGf89/DMnX7hBkJUnXXGjk/ZyC1IcwmlMInf
         PgRDoOMnOsaSxOKKlLKhSNfgUX0MIE4UOSWw+n2/hZiFTnndu37kmdMrh0PBse0H4MTQ
         GTbaApmdXz4BDeqJb0Xsi836/fJ23MOVPLDj7XO2vZof7wpTFcnhHl3Gwzx1yXNFOzRE
         If2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043110; x=1740647910;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjOac9/ho41mGe3aAgNT6sndPVOIr+U0FOWtJH6Asvc=;
        b=bsC86MR4xNrJerp1qXFYupnrF8zsKItMKH42fPReaWekSQr7n4it/K0yQkQMIQV8fU
         IJfdWlP0vLn9NhztqrosKQXrD/EapL31tHM8YOEQfQIUCGmnS0Te2kPKKVTsTWyoPlIB
         sSkrpZVJPQKw2JSBokRv8kopSrV1qDcXpLPcTFamkjnw4Wjttx6XRXJHNp4kxx093giL
         1lGP3psaM0yFqtluYgT8weoMDqy0SPFydd8w0YeQ5SI9fqWrGKhRcKgYFudFKLtX0Of9
         bWC6t5L77t3teSayprA1GVOS1/sOuz2HHahHmC6L1f7rq4Y9UIEJ4+BPYuJyhbXeOeYd
         GPDA==
X-Forwarded-Encrypted: i=1; AJvYcCXbOGo62Oo5iImQgfCAo3yOAs2Nl9jhDTMI3l0HzNmHXvuc4bCvJ9uhQlo4VSJCT+wTBBaeNIDNJb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0sY5/Opq77m3Z4Ygo3mUj1r/SzijLtx2yOe6dMP+KeDMa7z67
	qhw5WOLdlRQq5VmPqpE4jJnx3vz9eNRRR3goTCh92fTdBr8Su+d0
X-Gm-Gg: ASbGncvHCgVqgIQ/qOzRmZy+zdDBeV7Gw4GWcQXbI00fz7OppWhHxFZZ+mG6rY057JC
	vu3PAI7Ij7iA99gdhVpg9cd+f6e0cZirpom7i+gRjYyA69BK6Ze3HJ1U9hCOlUDlK7lYKs8d5Ce
	FOL1UkeY4na6NdXTmwFs0CoIMayFOIXZCZRx0ayxR9EPaonIdPlRa5SJbz4qmjM035Cnft0DEPN
	b/aVOFEn0w47bwV1mmn8bybytL2BTv/bQzIT+q6IH+FNmxel6GgkoUp2aaBUh6JX9NBRlw1+dKM
	USHhIZgGUcMAyZD0h8DMceNo
X-Google-Smtp-Source: AGHT+IFRP3Mw0MwPB4QtD5OTTVLL0sQY/YY/OdSb+KGhWccKes/T9MwtkTlkWfYsTFRCAaG+DKod3w==
X-Received: by 2002:a2e:95c4:0:b0:309:1d34:1089 with SMTP id 38308e7fff4ca-3092796aa74mr70931881fa.0.1740043109859;
        Thu, 20 Feb 2025 01:18:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------R0CrVUIZo0TDrRbCu5D2gGCO"
Message-ID: <86730a83-2044-4fbb-9600-aee19668f13a@gmail.com>
Date: Thu, 20 Feb 2025 10:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE-telem: adjust cookie definition
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano@stabellini.net>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <bd74b357-b254-4c43-a417-f26434361340@suse.com>
 <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
 <alpine.DEB.2.22.394.2502191748470.1791669@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502191748470.1791669@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------R0CrVUIZo0TDrRbCu5D2gGCO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/20/25 2:50 AM, Stefano Stabellini wrote:
> On Wed, 19 Feb 2025, Andrew Cooper wrote:
>> On 19/02/2025 10:00 am, Jan Beulich wrote:
>>> struct mctelem_ent is opaque outside of mcetelem.c; the cookie
>>> abstraction exists - afaict - just to achieve this opaqueness. Then it
>>> is irrelevant though which kind of pointer mctelem_cookie_t resolves to.
>>> IOW we can as well use struct mctelem_ent there, allowing to remove the
>>> casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
>>> Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
>>> pointer to an incomplete type and any other type") violations.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757
>>
>> Eclair does appear to be happy with this approach (assuming I stripped
>> down to only checking R11.2 correctly, and making it fatal).
>>
>> For the change itself, it's an almost identical binary, differing only
>> in the string section which I expect means some embedded line numbers.
>>
>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Thank you very much Jan for writing the patch, and thank you Andrew for
> running the pipeline. It is great that resolves all the 11.2 issues!
>
> Oleksii, may I ask for a release-ack? I'll follow up with a patch to
> mark 11.2 as clean.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------R0CrVUIZo0TDrRbCu5D2gGCO
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
    <div class="moz-cite-prefix">On 2/20/25 2:50 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502191748470.1791669@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Wed, 19 Feb 2025, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 19/02/2025 10:00 am, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">struct mctelem_ent is opaque outside of mcetelem.c; the cookie
abstraction exists - afaict - just to achieve this opaqueness. Then it
is irrelevant though which kind of pointer mctelem_cookie_t resolves to.
IOW we can as well use struct mctelem_ent there, allowing to remove the
casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
pointer to an incomplete type and any other type") violations.

No functional change intended.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757">https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757</a>

Eclair does appear to be happy with this approach (assuming I stripped
down to only checking R11.2 correctly, and making it fatal).

For the change itself, it's an almost identical binary, differing only
in the string section which I expect means some embedded line numbers.

Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thank you very much Jan for writing the patch, and thank you Andrew for
running the pipeline. It is great that resolves all the 11.2 issues!

Oleksii, may I ask for a release-ack? I'll follow up with a patch to
mark 11.2 as clean.</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502191748470.1791669@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------R0CrVUIZo0TDrRbCu5D2gGCO--

