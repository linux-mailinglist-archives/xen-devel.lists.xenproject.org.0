Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CEBA158B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 22:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130844.1470210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1sUP-0000fp-9G; Thu, 25 Sep 2025 20:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130844.1470210; Thu, 25 Sep 2025 20:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1sUP-0000dg-6A; Thu, 25 Sep 2025 20:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1130844;
 Thu, 25 Sep 2025 20:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCQs=4E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1sUO-0000da-4Z
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 20:22:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 680d9e0d-9a4d-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 22:22:49 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b28e1b87aa7so208818166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 13:22:49 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3ae3227sm1716997a12.28.2025.09.25.13.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 13:22:48 -0700 (PDT)
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
X-Inumbo-ID: 680d9e0d-9a4d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758831769; x=1759436569; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbcLYtMnNA+Jyh0i0G4D9kZWWK8dybnKoE4FEnaFBC0=;
        b=gkyyaaDmEOE31swIn/oAFyNSSH7idTVMEIvcTgzPQjsQ1Cqaurs+bWblVIt9wzQnyR
         7qWMEIkF67kTRSu3PsF21Z9wNABUdNBq9NSZixVdqtaGFrSiWV9HesXO56xUihexNFxA
         G8lls4p5N8WV/orRIRFHZX0MN2BOoxJvCoZQYNQx8lLX8s+Zm8XGFykUSONQsJ0d2+DV
         XgDoSobQLwX1Dsc/9kXxZmpapFmEr3W1B7Rc2Thny4WIdNQRyY5lVJoVdlLB782kVTbM
         pPwe6IZVXi5VIGpMvNLFZSu0SlTBpOcNbC7572Bu5EGZICNPGlNW1snPWJHVQQsS2aIE
         bAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758831769; x=1759436569;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UbcLYtMnNA+Jyh0i0G4D9kZWWK8dybnKoE4FEnaFBC0=;
        b=umkjda9sobZl7lth+58f9QreSJm6hHLIhw2+FUD+W6r99qhhLyPt5QEdz6+muYxEJP
         konaTXLIAFst1Ft2h+cRK4IDN8CosgS/Cq5sgXYpRptqVRtCxHOmb2+lB4aHrkBlxCQZ
         oSiGGhpqVtr9yhGeeHvDZ4hAOz9aFcmnYmdKKAhJqPyiwZwTFACPHKifLYPepkqfu3JU
         rqNPhqnUFocyUeO2qYqvmUQxSLhIRcYWH0EzT2ev2sGhgWqPQllgINfT0f8JfN2YamkG
         dF0EmdeB0L23mYE43uG7SrvV2K1oilVwbuBs8G71VTCd1XBgmj70IS7cPKS5Lgl6iZsg
         ch2w==
X-Forwarded-Encrypted: i=1; AJvYcCVaG/3k8vY2ZC53PGjR8eDgFzC8FXGlqbRagSGaFjpo5H4PpfQWs+uDHKrKKZvV3bbtKAe5gJ0+Nkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf829YjYW60tZgitZZu8b8s4ztaAzoktIWq3mG0mkgwksGmjTg
	odrvs848ubZOjFGLHxKjJCobWJlgX14qng8oyNU0OJ4WQsnehCAUAeBG
X-Gm-Gg: ASbGncsmvJlfXZFZJsI499pX9kXaIlfPOhR66B245oZcpaFb/NkeRe7LO1Adl9OR8YV
	t0oJ3UPObMbIoLT2EK8hNX7WqYi7JHTH+LaEU7nWQAWsNofzRv2MEeJ+DMv406MqhvbYd/mPkj1
	b4/t7yQUMr5WFlASbzvZ8MPzDFZZcHMlKAP/LkVaUWZ4d8GPe+tvazHSR7wAL0uxYmagUHdnz/n
	vDDPECSt53GR0N55azbcNgOinnUG7hwDyMibYzipnwASPX5ANPpKR9YPTW/dn6yZZ8wQuYBZHfj
	2ACy5M94J8SdFsO02TZxsFDWux7NY1SdH7UPm99pBbfYH6nz1iaIF4iJ/5E3Ux7eDOG1EyEw2gC
	sJfrBjQ/Oaz74QJX3BymVkXRjDj2Yzsy6Jq76DO4nn2h96BOo1eja36p0Wwm7Wri8PEx6/7Ypo9
	4WpLftAj4=
X-Google-Smtp-Source: AGHT+IG3dJacIiSoHeRTH5XUJgv+ZeiKSC8JZsc1F4WzD9BvK0EmH5ExVwkkhXf0rQfOgQdR7NOs+w==
X-Received: by 2002:a17:906:7954:b0:b04:848f:a0d4 with SMTP id a640c23a62f3a-b34b9f5b524mr561238066b.13.1758831769098;
        Thu, 25 Sep 2025 13:22:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------x2H67mzQyCiVpP00MH70Xlnu"
Message-ID: <97488f35-3f94-42b0-8443-4feacf3d587d@gmail.com>
Date: Thu, 25 Sep 2025 22:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Update for 4.21 release cycle
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
 <814501c8-94e3-4930-87ed-88e7506456ed@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <814501c8-94e3-4930-87ed-88e7506456ed@suse.com>

This is a multi-part message in MIME format.
--------------x2H67mzQyCiVpP00MH70Xlnu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/25/25 8:26 AM, Jan Beulich wrote:
> On 24.09.2025 11:36, Oleksii Kurochko wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>>      to the baseline change.
>>    - Linux based device model stubdomains are now fully supported.
>> + - Remove libxenctrl usage from xenstored.
>>   
>>    - On x86:
>>      - Restrict the cache flushing done as a result of guest physical memory map
>> @@ -21,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>      - Allow controlling the MTRR cache attribute of the Xen platform PCI device
>>        BAR for HVM guests, to improve performance of guests using it to map the
>>        grant table or foreign memory.
>> +   - Allow to unflatten DTs.
> What is this about? There continues to be no use of DT on x86, so without context
> this feels pretty much meaningless to me.

I am referring tohttps://lore.kernel.org/xen-devel/20250722000525.7247-1-alejandro.garciavallejo@amd.com/.

>
>> @@ -36,11 +38,20 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>      - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>>        Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>>        and 28 (Temperature Probe).
>> +   - Basic kexec support to Mini-OS for running in PVH mode.
> Hmm, MiniOS isn't an integral part of a Xen release, so I wonder if such really
> belongs here. Yes, I also understand that there's not really anywhere else to
> put such.

I decided to put it here since we include information about stubdoms in|CHANGELOG.md|,
and MiniOS is related to that.

~ Oleksii

--------------x2H67mzQyCiVpP00MH70Xlnu
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
    <div class="moz-cite-prefix">On 9/25/25 8:26 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:814501c8-94e3-4930-87ed-88e7506456ed@suse.com">
      <pre wrap="" class="moz-quote-pre">On 24.09.2025 11:36, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
    to the baseline change.
  - Linux based device model stubdomains are now fully supported.
+ - Remove libxenctrl usage from xenstored.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
@@ -21,6 +22,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Allow controlling the MTRR cache attribute of the Xen platform PCI device
      BAR for HVM guests, to improve performance of guests using it to map the
      grant table or foreign memory.
+   - Allow to unflatten DTs.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What is this about? There continues to be no use of DT on x86, so without context
this feels pretty much meaningless to me.</pre>
    </blockquote>
    <pre>I am referring to <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250722000525.7247-1-alejandro.garciavallejo@amd.com/">https://lore.kernel.org/xen-devel/20250722000525.7247-1-alejandro.garciavallejo@amd.com/</a>.

</pre>
    <blockquote type="cite"
      cite="mid:814501c8-94e3-4930-87ed-88e7506456ed@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -36,11 +38,20 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - Basic kexec support to Mini-OS for running in PVH mode.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, MiniOS isn't an integral part of a Xen release, so I wonder if such really
belongs here. Yes, I also understand that there's not really anywhere else to
put such.</pre>
    </blockquote>
    <pre>I decided to put it here since we include information about stubdoms in <code
    data-start="140" data-end="154">CHANGELOG.md</code>,
and MiniOS is related to that.

~ Oleksii
</pre>
  </body>
</html>

--------------x2H67mzQyCiVpP00MH70Xlnu--

