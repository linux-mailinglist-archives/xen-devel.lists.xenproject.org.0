Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E69A46770
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 18:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897082.1305807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKsm-00075z-HO; Wed, 26 Feb 2025 17:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897082.1305807; Wed, 26 Feb 2025 17:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKsm-00073L-EU; Wed, 26 Feb 2025 17:07:40 +0000
Received: by outflank-mailman (input) for mailman id 897082;
 Wed, 26 Feb 2025 17:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnKsl-00073F-37
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 17:07:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e051797-f464-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 18:07:37 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-abb90c20baeso900365466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 09:07:37 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed20b6cfbsm360302666b.175.2025.02.26.09.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 09:07:36 -0800 (PST)
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
X-Inumbo-ID: 2e051797-f464-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740589657; x=1741194457; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc019Qg7RRw46z/L2MVxZEpFIRL1DugWS+9NSv/WwFo=;
        b=CgbPXNjQs8FZpsS7wftgahVMnhTf32YQWIHm/Py+wzZPa5ZHsCkpgnJKBMSdwvlCIx
         UQ7JMO0RX0pUa/ZajiDUSbJ+gCzGtV5MruB9aw1IB3p9EJW5ul0vhrPmmjeayQ7YVGsj
         MureiomV7XLL8gyPi53O1Y+bIQ7QkqopDXr3RlU7CP14dqZ5/5TZMG3iDvr8HiitgIPa
         Q++39TOe0ti+v5j6tSbLoCcsWqPI4wj9suRysBqzs8vy670NJPTdZLlR/hq2DfZVCe47
         0fl+HZzdSBaGYdlAmmIGQI6cV1vEgWaorFBHsvqs0tN3fB8V5HSu6byYbPfpB/39J4/s
         c29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740589657; x=1741194457;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qc019Qg7RRw46z/L2MVxZEpFIRL1DugWS+9NSv/WwFo=;
        b=RpOO/c1ipcskveXRzBDUccb+rf2brmFIKWZQXDKL9Fb3JcA5lKWjdV0oTMLXpJzIgA
         2iC5Dz8rjZfgmukHRyjKqZaOrkScadQw4C/O79tLM/xCt7ukZkp5UNqVNnv+q1+FgTOx
         RWaxhbqK9rjgCG2PjhJ+bMcxLCppHEZMTKz0dzjo5bUVOYV2opxhqPN+1brh8ocDUEH/
         GTKICPMFGl9K3gDqGgIa9JYiofrwEGJYGSqHy5BQvwwt3fHPGzOGtK74IyvnGrkXfEH1
         R7ay3Kn+Ac7TdNIyTSQQtNwxqWXLnqUMfODNBY34OYx4j/hTBYBiF3StqqjfOizAB6m0
         VXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxgXmj5brFLj6BsnmiVwM9+cxD+L9PB5vrKcH710LgCtF8r9HXtlG6eJCR1jYx69u/Gv8SXTWV8bk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlOeKnbhpO+foPxSfKPs+Dzt1gi86X9zN48jWokvnQKYvCnnXU
	nHHm29Ph/1T903j9tmPUnBLVLZTaofOg7WNxLY6BNYcpTR+zAUw7
X-Gm-Gg: ASbGncuJIg7radJnrjT4HW6RPH0jCEqhE0dMY7v6JbM5q860Sk4FewQZIomaQOJoNLn
	c7Z+Oq40IgBUDGbZR1p1mTSrhd+RodOAEQ5l80yjc8KWaN5Y1wylW1fukncCVtx0xRib9eKN7ah
	H0pI9YslaH2yA1qOvZcXUGiWL3Dj8zTqs11pu6rKwCUhNPuvXvl4MeFH5S3X5joORRWr/RjVfZW
	ZiibfyX0jEaAZ4KfUfuj1pmUE0oPRHJySphChSkBLBo4E+AHcPIGeZElWBRZJW9+XB/KGpTt5Ue
	DGbeeFdqhtmetonJHV83vT2wvYQ+pGUUed8=
X-Google-Smtp-Source: AGHT+IG0gXLl7ds2H1OHFzWKLK0FFpXrLw2qOCsjUKLR3RR9NnxE3oE8eYH/kw4oGUonAmCCd0BuZQ==
X-Received: by 2002:a17:906:318b:b0:abb:b322:2b37 with SMTP id a640c23a62f3a-abc0d9888eemr1787669566b.7.1740589656933;
        Wed, 26 Feb 2025 09:07:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------CIxkhMeaIJuyiLSR1U4TiAb6"
Message-ID: <957413e1-b348-44c2-9d72-4af8d155518c@gmail.com>
Date: Wed, 26 Feb 2025 18:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <5e917a68-c350-4d98-aa66-840d678486d6@citrix.com>
 <9d024b2f-32cc-4a22-8b45-0811ae4e07f7@suse.com>
 <8a64a0a4-7e6a-4503-ac96-0b9c5d18b197@citrix.com>
 <3046f71e-78c3-43ad-8dee-b452e21403cb@gmail.com>
Content-Language: en-US
In-Reply-To: <3046f71e-78c3-43ad-8dee-b452e21403cb@gmail.com>

This is a multi-part message in MIME format.
--------------CIxkhMeaIJuyiLSR1U4TiAb6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/26/25 4:27 PM, Oleksii Kurochko wrote:
>
>
> On 2/26/25 4:20 PM, Andrew Cooper wrote:
>> On 26/02/2025 3:17 pm, Juergen Gross wrote:
>>> On 26.02.25 16:12, Andrew Cooper wrote:
>>>> On 26/02/2025 10:45 am, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>>    - Drop "Support device passthrough when dom0 is PVH on Xen" from
>>>>>      CHANGELOD.md becuase it isn't really ready:
>>>>>     
>>>>> https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16
>>>>> ---
>>>>>    CHANGELOG.md | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>> index 1979166820..5f5a40855a 100644
>>>>> --- a/CHANGELOG.md
>>>>> +++ b/CHANGELOG.md
>>>>> @@ -18,6 +18,11 @@ The format is based on [Keep a
>>>>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>     - Fixed blkif protocol specification for sector sizes different
>>>>> than 512b.
>>>>>     - The dombuilder in libxenguest no longer un-gzips secondary
>>>>> modules, instead
>>>>>       leaving this to the guest kernel to do in guest context.
>>>>> + - Reduce xenstore library dependencies.
>>>> What is this in reference to?  I don't think all of Juergen's series has
>>>> been merged yet.
>>> Not all of the series has been merged, but some library dependencies have
>>> been dropped already (e.g. to libxenguest). This is especially affecting
>>> the build of xenstore-stubdom positively.
> Yes, it is connected to stubdom:
>   https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/
>
> ~ Oleksii

Do we need some rewording for the item in CHANGELOG.md?

~ Oleksii
   

--------------CIxkhMeaIJuyiLSR1U4TiAb6
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
    <div class="moz-cite-prefix">On 2/26/25 4:27 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3046f71e-78c3-43ad-8dee-b452e21403cb@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/26/25 4:20 PM, Andrew Cooper
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:8a64a0a4-7e6a-4503-ac96-0b9c5d18b197@citrix.com">
        <pre wrap="" class="moz-quote-pre">On 26/02/2025 3:17 pm, Juergen Gross wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 26.02.25 16:12, Andrew Cooper wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 26/02/2025 10:45 am, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Signed-off-by: Oleksii Kurochko <a
              class="moz-txt-link-rfc2396E"
              href="mailto:oleksii.kurochko@gmail.com"
              moz-do-not-send="true">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v2:
  - Drop "Support device passthrough when dom0 is PVH on Xen" from
    CHANGELOD.md becuase it isn't really ready:
   
<a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16"
              moz-do-not-send="true">https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16</a>
---
  CHANGELOG.md | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820..5f5a40855a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,11 @@ The format is based on [Keep a
Changelog](<a class="moz-txt-link-freetext"
              href="https://keepachangelog.com/en/1.0.0/"
              moz-do-not-send="true">https://keepachangelog.com/en/1.0.0/</a>)
   - Fixed blkif protocol specification for sector sizes different
than 512b.
   - The dombuilder in libxenguest no longer un-gzips secondary
modules, instead
     leaving this to the guest kernel to do in guest context.
+ - Reduce xenstore library dependencies.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">What is this in reference to?  I don't think all of Juergen's series has
been merged yet.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Not all of the series has been merged, but some library dependencies have
been dropped already (e.g. to libxenguest). This is especially affecting
the build of xenstore-stubdom positively.</pre>
        </blockquote>
      </blockquote>
      <pre>Yes, it is connected to stubdom:</pre>
      <pre> <a class="moz-txt-link-freetext"
href="https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/"
      moz-do-not-send="true">https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/</a>

~ Oleksii</pre>
    </blockquote>
    <pre>Do we need some rewording for the item in CHANGELOG.md?

~ Oleksii
  
</pre>
    <p></p>
  </body>
</html>

--------------CIxkhMeaIJuyiLSR1U4TiAb6--

