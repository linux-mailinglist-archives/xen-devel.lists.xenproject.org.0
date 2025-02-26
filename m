Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DBA464A4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 16:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896877.1305623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJJu-0004hV-Ct; Wed, 26 Feb 2025 15:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896877.1305623; Wed, 26 Feb 2025 15:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJJu-0004fh-9A; Wed, 26 Feb 2025 15:27:34 +0000
Received: by outflank-mailman (input) for mailman id 896877;
 Wed, 26 Feb 2025 15:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnJJs-0004fa-WF
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 15:27:33 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31bb4103-f456-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 16:27:31 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5461dab4bfdso8188357e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 07:27:31 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b292asm482682e87.51.2025.02.26.07.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 07:27:29 -0800 (PST)
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
X-Inumbo-ID: 31bb4103-f456-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740583650; x=1741188450; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G3BBdlkq+yjXhYVaaliW4cCOw0Imd1PXNrvQWVq3VA=;
        b=dzSZuSUpMNN2GXkC6+caMn23ZdMClsg2wTP4iCNhBNzwfUB724RpbO1BRNVSUYq+rO
         MHor27CoFEmBI+fMU/fJipel7cN07AhKLS9nen+D0JRgPF698QXPo87jBf+g3iRXIc1j
         WUG+F3sIpIQSfDz4VxZ934xIR6mq7cl0/4udtoNm3WiJIW87Ao6FzTkP87eicRlVPMz5
         /jmEitpLg/X0ij4cVg7zP8Oh/iGpVUFJXkFBKM57IjklYs6nAGP/UWR3Xb3kelFN/ozQ
         EuD5Y8WCRx4tY2U5bxHOQgIRbolhG0T06P+zsQQ/77UHXh9deijBZGEC72fCg5xalHKJ
         fDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583650; x=1741188450;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3G3BBdlkq+yjXhYVaaliW4cCOw0Imd1PXNrvQWVq3VA=;
        b=N4XXRIeQd6G+BnZDYvZd+h4gnfdnVqBSlOZEuKib+thzeXS4/9UHhXPtadmJkPpVCI
         nlosyDCQHpcr+5WhP5FXsheq2BeT9o+Q/V1TWSYGyXWW29xj1/0xk533yYEBtxUrN3SP
         dGBtQGphdLl5Lgl9Fe0jThhrYywzuEs0bmK6L6tnlA/2TyHDnzYKJ3ggRFsemvb+pe1a
         egbrmC4tKERtQJslqUB2vRw+eTumPx1loCTj8aU01UrVjrnK/o88hJwGC1J0RSy1WW1V
         FJVy+uj1OfvetNpMCHEc1cJk3UkH0D/kiE7xo2e2WZu8PRKJc9k/VyhoGyjjRIt9dCuh
         M5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/tPhbLIgg6j0e6ohVz4r3D+A7L/8lagjUcXFpQAfedrMIakIAe1cpJgoGRhR/1vs201ViDWwwhNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFq6Zih60nntXfMmpJTcxc63hrd4h31hqyJkJEDA5jXQmu7r04
	+O0sj+XaYSrCoNvbGs+V/iCAZngzpc5Pc29hlt0T71F79GnMWvVK
X-Gm-Gg: ASbGnctrSMGhK7PfZi4jlhFIStYmFe0Xxyjz85tU2OsKl1MnpV336NwGJeuGfHFlpTG
	gld52ozs1gs36Q0EZ7qM8SFIn2TL52NKTPN79QEueSAFeZzPIvBUgMMmFAdYiOaiUyn6B4iF229
	fwc+F7HqfUPOUV6k4/+jUAgBQ0egwb+7hq2NdpirjbBdteienUo1JT4/8HotQL0MEMoJxv8C2dP
	J49TfJTyOQVFT04g3kUPxePGBHnJZaZ09qaYLv5gVVY3TXuN5qCcEvojVq7lVjy3ox0Z5C6yYAh
	SY11h0xmhNwh8yUVrryVOP1ov9ByO0onc7s=
X-Google-Smtp-Source: AGHT+IHg0Ao7dp2o77f7W62TukkHgtt8M77KY2e/2hgVGR9KLKpPArMxAfuXuGYFYw08go6TbrZPhA==
X-Received: by 2002:a05:6512:104e:b0:545:2e5d:f3f3 with SMTP id 2adb3069b0e04-54838f5b0bcmr11112779e87.46.1740583650132;
        Wed, 26 Feb 2025 07:27:30 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------4Is0CO3YF00rLFIpxKSaowhg"
Message-ID: <3046f71e-78c3-43ad-8dee-b452e21403cb@gmail.com>
Date: Wed, 26 Feb 2025 16:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <5e917a68-c350-4d98-aa66-840d678486d6@citrix.com>
 <9d024b2f-32cc-4a22-8b45-0811ae4e07f7@suse.com>
 <8a64a0a4-7e6a-4503-ac96-0b9c5d18b197@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8a64a0a4-7e6a-4503-ac96-0b9c5d18b197@citrix.com>

This is a multi-part message in MIME format.
--------------4Is0CO3YF00rLFIpxKSaowhg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/26/25 4:20 PM, Andrew Cooper wrote:
> On 26/02/2025 3:17 pm, Juergen Gross wrote:
>> On 26.02.25 16:12, Andrew Cooper wrote:
>>> On 26/02/2025 10:45 am, Oleksii Kurochko wrote:
>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>    - Drop "Support device passthrough when dom0 is PVH on Xen" from
>>>>      CHANGELOD.md becuase it isn't really ready:
>>>>     
>>>> https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16
>>>> ---
>>>>    CHANGELOG.md | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>> index 1979166820..5f5a40855a 100644
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -18,6 +18,11 @@ The format is based on [Keep a
>>>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>     - Fixed blkif protocol specification for sector sizes different
>>>> than 512b.
>>>>     - The dombuilder in libxenguest no longer un-gzips secondary
>>>> modules, instead
>>>>       leaving this to the guest kernel to do in guest context.
>>>> + - Reduce xenstore library dependencies.
>>> What is this in reference to?  I don't think all of Juergen's series has
>>> been merged yet.
>> Not all of the series has been merged, but some library dependencies have
>> been dropped already (e.g. to libxenguest). This is especially affecting
>> the build of xenstore-stubdom positively.

Yes, it is connected to stubdom:

  https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/

~ Oleksii

> Oh, that's good to hear.
>
> ~Andrew
--------------4Is0CO3YF00rLFIpxKSaowhg
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
            <pre wrap="" class="moz-quote-pre">Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v2:
  - Drop "Support device passthrough when dom0 is PVH on Xen" from
    CHANGELOD.md becuase it isn't really ready:
   
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16">https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16</a>
---
  CHANGELOG.md | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820..5f5a40855a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,11 @@ The format is based on [Keep a
Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
   - Fixed blkif protocol specification for sector sizes different
than 512b.
   - The dombuilder in libxenguest no longer un-gzips secondary
modules, instead
     leaving this to the guest kernel to do in guest context.
+ - Reduce xenstore library dependencies.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
What is this in reference to?  I don't think all of Juergen's series has
been merged yet.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Not all of the series has been merged, but some library dependencies have
been dropped already (e.g. to libxenguest). This is especially affecting
the build of xenstore-stubdom positively.</pre>
      </blockquote>
    </blockquote>
    <pre>Yes, it is connected to stubdom:</pre>
    <pre> <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/">https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/</a>

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:8a64a0a4-7e6a-4503-ac96-0b9c5d18b197@citrix.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh, that's good to hear.

~Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------4Is0CO3YF00rLFIpxKSaowhg--

