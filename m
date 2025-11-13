Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C88C57FB2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 15:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161707.1489592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJYTP-0005ob-6d; Thu, 13 Nov 2025 14:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161707.1489592; Thu, 13 Nov 2025 14:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJYTP-0005lc-3x; Thu, 13 Nov 2025 14:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1161707;
 Thu, 13 Nov 2025 14:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8X8=5V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJYTO-0005lW-H7
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 14:38:54 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79f34612-c09e-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 15:38:53 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-640860f97b5so1455902a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 06:38:53 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac667sm172877866b.58.2025.11.13.06.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:38:51 -0800 (PST)
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
X-Inumbo-ID: 79f34612-c09e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763044733; x=1763649533; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5g5qgfb4LsK/HupJGU+7qgFDOXQXFe7HbR17kKXTRE=;
        b=c7uhg2tcolovKcSxzMKglAyY0upLSP9mc5y+J3ftPfvPuy4pX4FowkK45rIxWoyYlJ
         vqgFBUXVRQAB7//bbcbsJwBcVetvo+I58Fhq+aew4G//ysyPD1es040GjMRkhlRWp/xb
         aHj9aAZtHxeTcq/PJaZrQMRvuOqmmgTJSuLVKpu9eCzfO4VOglto1kjHHPvWeaNa3zX5
         5Qr+988jIwY6YBGPJGkGpqzTNSSaM4acR+HqdsiSr/z2kKypqzyHeVfaaaywzERd2N4l
         DUAMmv+3QTs3nOpcKAgQOHuhgMd8ITc5bD2vr8DntyC6ryv5TauEsrL+gEdKYkhv2FEG
         VFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044733; x=1763649533;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5g5qgfb4LsK/HupJGU+7qgFDOXQXFe7HbR17kKXTRE=;
        b=utcrqU34RSbAsIFjLEQQCOir+l4+woN84iRO/pRzA4jPS4Z1kfqbNVzA/MArlL64qh
         f1lGjLjL5czPCa3mKBATjfw2VSDE+VNPC/H0jHj1wpTzUhh4KGAm8XdQco/yAaEX1T31
         4/EYKc6rCGmpMq3W/Pew0YIQgaON7cSzVxPXlkJFsTXWo3+33wTLz61joSRXmi0JHsTa
         G9IcjgFCqKa3XAL99mb7MvAII8mOXowj8LsooH3YQUUK2kmiJuh/HS9MveAswrd+Ttb+
         OTyOb3vD3P2NznWNP1NEYeVOEL/PDTDVRzmx971qBAylGE3UN+PCdtBj53RUV5M4MHB8
         RYxg==
X-Forwarded-Encrypted: i=1; AJvYcCWJjg5e1klYZtHpORxuFXlVLkUuEPWmSZ+tKcx2KcSLLS7CxyKOn1MvXbEg9Kc4AXk4z0oudoD+30I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF3gsJpwAKMjrBgLXQGBBJQpSVBCsilMT6TtiH8Ib91qpvZn2D
	OYxO9x+4lPIF/WaS8pLNxiX3W26ZzKUnHfxkmcB0a6zRAm0l/O6HDAk/
X-Gm-Gg: ASbGnct7MCECHOmQUdomdfzkAym6zgQEORGfum330KdkBJO4ndFaAbvhT550SJTY7dt
	FjF1FUl68v8/trmT8BfwkQttLbtb7PBbJIUvZWqZOubb6TNWC5jhlPPxvIJK1md0/ZwIiesKEGe
	rq7O0uFonpBmGW+Szo/SwHRzfXfkOaERRUvwgswleLTmdXZ9W/HW+UqgXqWQbPLC0wkbLs4uQek
	AkUTL9nLquCMLmk9CC5gRhwwFp3t7QS1sFrjbzR3EJJbweu/eHK+lnhsOxdFt2+ODcpWvTCr6u3
	natcsGuHE6AgKl7ORk9ErVlual+x7fUcHaYc4+UY+My258P5uLb5Tg1bvex+PJkOqdUOyIPFxCZ
	a2pntjebkvIt7m9d+FS7TvB3AoId70Nvym603SKbMlH/uOqAYZimlhi1/CYD5IxnOIKVnx96qUQ
	ZNjdYe8OvX2n6IE5bpYo+QmFE7YR7UmueYv9Eh0HtczYcwmaG3rw==
X-Google-Smtp-Source: AGHT+IGsQ2quCIAFaX2f8j+OFprm9Ag60uWgXrs3ZXlUVEjrAAIlHjccm0ERFAgyGhfBqssKazg4OA==
X-Received: by 2002:a17:906:478d:b0:b72:ad95:c1bc with SMTP id a640c23a62f3a-b7331a8e7a1mr717815466b.30.1763044732285;
        Thu, 13 Nov 2025 06:38:52 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------C1pOg6sJzSjWiwO5G8v6cD00"
Message-ID: <7928118a-6274-4636-bcef-7b103dce9610@gmail.com>
Date: Thu, 13 Nov 2025 15:38:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v7] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20251113124945.25343-1-frediano.ziglio@citrix.com>
 <5c14f58d-c8bf-4c63-b48a-9af5af88c8f2@citrix.com>
 <CAHt6W4fGe1rYh_J_97dnkYHaaSqXRy6Y96OGtsgKj5YJOzuoDA@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAHt6W4fGe1rYh_J_97dnkYHaaSqXRy6Y96OGtsgKj5YJOzuoDA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------C1pOg6sJzSjWiwO5G8v6cD00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/25 2:43 PM, Frediano Ziglio wrote:
> On Thu, 13 Nov 2025 at 13:17, Andrew Cooper<andrew.cooper3@citrix.com> wrote:
>> On 13/11/2025 12:49 pm, Frediano Ziglio wrote:
>>> From: Frediano Ziglio<frediano.ziglio@cloud.com>
>>>
>>> For xen.gz file we strip all symbols and have an additional
>>> xen-syms.efi file version with all symbols.
>>> Make xen.efi more coherent stripping all symbols too.
>>> xen-syms.efi can be used for debugging.
>>>
>>> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>
>>> ---
>>> Changes since v1:
>>> - avoid leaving target if some command fails.
>>>
>>> Changes since v2:
>>> - do not convert type but retain PE format;
>>> - use xen-syms.efi for new file name, more consistent with ELF.
>>>
>>> Changes since v3:
>>> - update documentation;
>>> - do not remove xen.efi.elf;
>>> - check endbr instruction before generating final target.
>>>
>>> Changes since v4:
>>> - simplify condition check;
>>> - avoid reuse of $@.tmp file.
>>>
>>> Changes since v5:
>>> - avoid creation of temporary file.
>>>
>>> Changes since v6:
>>> - install xen-syms.efi;
>>> - always strip xen.efi;
>>> - restore EFI_LDFLAGS check during rule execution;
>>> - update CHANGELOG.md;
>>> - added xen-syms.efi to .gitignore.
>>> ---
>>>   .gitignore            |  1 +
>>>   CHANGELOG.md          |  3 +++
>>>   docs/misc/efi.pandoc  |  8 +-------
>>>   xen/Kconfig.debug     |  9 ++-------
>>>   xen/Makefile          | 25 +++----------------------
>>>   xen/arch/x86/Makefile | 11 ++++++++---
>>>   6 files changed, 18 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index d83427aba8..213972b65c 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
>>> @@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
>>>   xen/xen
>>>   xen/suppression-list.txt
>>>   xen/xen-syms
>>> +xen/xen-syms.efi
>>>   xen/xen-syms.map
>>>   xen/xen.*
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index c9932a2af0..3bdcc3b47a 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>         for hypervisor mode.
>>>
>>>   ### Removed
>>> + - The install-time environment variable INSTALL_EFI_STRIP is no longer
>>> +   supported, xen.efi will is now always being stripped.
>> I'd rephrase this a little.  "... INSTALL_EFI_STRIP no longer exists.
>> xen.efi is always stripped, while the symbols remain available in
>> xen-syms.efi."
>>
> Done
>
>> Personally, I'd have put this in the Changed section rather than
>> Removed, but both can be adjusted together.
>>
> Done
>
>> This bug is on the 4.21 tracking list.  CC'ing Oleksii.
>>
> So.. should I leave the CHANGELOG.md change in 4.21 or should I move
> it to 4.22 ??

It should be in 4.21 as it is bug from 4.21 tracking list.

Thanks.

~ Oleksii

--------------C1pOg6sJzSjWiwO5G8v6cD00
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
    <div class="moz-cite-prefix">On 11/13/25 2:43 PM, Frediano Ziglio
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHt6W4fGe1rYh_J_97dnkYHaaSqXRy6Y96OGtsgKj5YJOzuoDA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 13 Nov 2025 at 13:17, Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 13/11/2025 12:49 pm, Frediano Ziglio wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>

For xen.gz file we strip all symbols and have an additional
xen-syms.efi file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen-syms.efi can be used for debugging.

Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>
---
Changes since v1:
- avoid leaving target if some command fails.

Changes since v2:
- do not convert type but retain PE format;
- use xen-syms.efi for new file name, more consistent with ELF.

Changes since v3:
- update documentation;
- do not remove xen.efi.elf;
- check endbr instruction before generating final target.

Changes since v4:
- simplify condition check;
- avoid reuse of $@.tmp file.

Changes since v5:
- avoid creation of temporary file.

Changes since v6:
- install xen-syms.efi;
- always strip xen.efi;
- restore EFI_LDFLAGS check during rule execution;
- update CHANGELOG.md;
- added xen-syms.efi to .gitignore.
---
 .gitignore            |  1 +
 CHANGELOG.md          |  3 +++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 11 ++++++++---
 6 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/.gitignore b/.gitignore
index d83427aba8..213972b65c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
 xen/xen
 xen/suppression-list.txt
 xen/xen-syms
+xen/xen-syms.efi
 xen/xen-syms.map
 xen/xen.*

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c9932a2af0..3bdcc3b47a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
       for hypervisor mode.

 ### Removed
+ - The install-time environment variable INSTALL_EFI_STRIP is no longer
+   supported, xen.efi will is now always being stripped.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I'd rephrase this a little.  "... INSTALL_EFI_STRIP no longer exists.
xen.efi is always stripped, while the symbols remain available in
xen-syms.efi."

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Done

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Personally, I'd have put this in the Changed section rather than
Removed, but both can be adjusted together.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Done

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This bug is on the 4.21 tracking list.  CC'ing Oleksii.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So.. should I leave the CHANGELOG.md change in 4.21 or should I move
it to 4.22 ??</pre>
    </blockquote>
    <pre>It should be in 4.21 as it is bug from 4.21 tracking list.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------C1pOg6sJzSjWiwO5G8v6cD00--

