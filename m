Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F523A46020
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896554.1305298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnH55-0007Sx-7G; Wed, 26 Feb 2025 13:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896554.1305298; Wed, 26 Feb 2025 13:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnH55-0007QI-4E; Wed, 26 Feb 2025 13:04:07 +0000
Received: by outflank-mailman (input) for mailman id 896554;
 Wed, 26 Feb 2025 13:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnH53-0007QC-VJ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:04:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26dbad53-f442-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 14:04:03 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e04f87584dso10381402a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:04:03 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e45a8bb9d0sm2724254a12.31.2025.02.26.05.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:04:01 -0800 (PST)
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
X-Inumbo-ID: 26dbad53-f442-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740575042; x=1741179842; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OS7EGnkC4yf4uz0nRcWmZg0I1VuERl3yyFL5HIoS7o=;
        b=hvpRKlHksuXXHyYElR6yywr5oZhnkAmd6SXMk034wFbAs41H7CCScnBHWgmGEp4brB
         3iD00stxdBjCTFXDbh3uQxzKPLrfu2XlYzWH7wWVbgcgWT2woJAnqAM9n7RVw+DE2zXV
         zolHspv8vqCvucQTgF8OG5Q8pSuhTLg7yy9+dhnaDnIvKRzmyFidt8fnrZYEzomeHLn4
         Wca2A92XTxDwhPuBUMIZm2SUNlBUAjo6ouggybT5EDNU6epjqqLIAqZv6MrQUn7mid6p
         3FeoxPD6dq28A0d6l/k28C63vOVpUtFClq6R9Zp2nSRZ3dzKipcvDgg8RcBjCzmWpm+n
         /gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575042; x=1741179842;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3OS7EGnkC4yf4uz0nRcWmZg0I1VuERl3yyFL5HIoS7o=;
        b=l+hgmr0Z36cZ1UOWhVdf8UqxqW855uR6GGszq6ZIiJaP+hxcvETTGVROmMtaglWh8d
         aT2uWP0krFeQ6N4Aeb43HTfXUsSH+Lp1PqlGuqRYTjTMc9lxRkF18ryb3hMfdjOmVdbl
         FFqO5dClQBLUTymjJH/rgwX8dUss9DQm5BUSpm6unqXVy1FAyIRqb0VGhLNVhWxMRbt3
         QfuY77VzTGEruzmuqXWX2e7obqq2JZmrwODps13U+SDXKPj2xJRtzxlQBozzGIIO86S3
         /NXo/z+UCEwX2Q4Z+ShOqpLl1OSaF2PNhttHQmRmFw6a5jYAWeAwnINHwIz61rc1MNfD
         Nu7g==
X-Forwarded-Encrypted: i=1; AJvYcCXCLAfyxeNu3Snd+Cn1DKJNrOkfPyBXi5bUwA2X58uns3Ejdv20/KoPPYGcQswj+BcWirJcmVo31kE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaxGpvp7v9RcpvYD9Yi4UpBdGLkoyClkVaHcKcDrl177XZO4P8
	rMXZqjjH4Ri34IXdz9xapNBrRub02Mx4Ql5cPIZ4Z+WC92cF3uEB
X-Gm-Gg: ASbGnctfT9fykalyPRY2C8+U7J8DzjRTxjYzPEdQq5zwI03ck6oZzlaGBiiGoXco3v0
	KlF2RYIpdfVob2d0tEWEMWgFmf9RYx0j7d+g4QCvOF9vMZU+7jTD7PIvl2nE11+X8aqansyVHta
	B1f+ZxmEskDKs31ohLTbplOUH3HZkZfLwzNBwev89D3/+k6sTHMMpnDxTdng0Vge9tf1Oq+3QI6
	oLaAMds8O0Wx8jguqM7dX6H+6qgL7Flx+4EJ19XVsA8DsbsS6/djUcsotYQ1VzWnrZlLfRrvI/6
	mfxA59DJjXHmRrhYIqEvm+Tg+Q3cf9Mr3KI=
X-Google-Smtp-Source: AGHT+IE/uU+LGorRxTRPcpy3FAh8rknwGqI5VkrUyHmV8XSU93XhFHvXp5HF26jzKmyAAtZ5KPOeIQ==
X-Received: by 2002:a05:6402:1e88:b0:5e4:95d0:7e1f with SMTP id 4fb4d7f45d1cf-5e4a0e29775mr3751225a12.29.1740575041594;
        Wed, 26 Feb 2025 05:04:01 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------TI0OLt68va0W3F08Ucjj3ON6"
Message-ID: <0f07557a-f340-4056-b8a0-5efe680bddc7@gmail.com>
Date: Wed, 26 Feb 2025 14:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com>

This is a multi-part message in MIME format.
--------------TI0OLt68va0W3F08Ucjj3ON6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/26/25 11:50 AM, Jan Beulich wrote:
> On 26.02.2025 11:45, Oleksii Kurochko wrote:
>> @@ -34,6 +40,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - On x86:
>>      - xl suspend/resume subcommands.
>>      - `wallclock` command line option to select time source.
>> +   - Add Support for Paging-Write Feature.
> That EPT (i.e. Intel) only, which may want making explicit?

Agree, it would be better to write: "Add support forEPT paging-write feature".

>
>> +   - Zen5 support (including new hardware support to mitigate the SRSO
>> +     speculative vulnerability).
> I'd also suggest to qualify Zen5 with AMD.

I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.

>   Whether to mention this here
> when I think I backported all the pieces isn't entirely clear to me either.

What is the better place then?

~ Oleksii

--------------TI0OLt68va0W3F08Ucjj3ON6
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
    <div class="moz-cite-prefix">On 2/26/25 11:50 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.02.2025 11:45, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -34,6 +40,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
+   - Add Support for Paging-Write Feature.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That EPT (i.e. Intel) only, which may want making explicit?</pre>
    </blockquote>
    <pre>Agree, it would be better to write: "Add support for<span
    style="white-space: pre-wrap"> EPT paging-write feature".

</span></pre>
    <blockquote type="cite"
      cite="mid:8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+   - Zen5 support (including new hardware support to mitigate the SRSO
+     speculative vulnerability).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'd also suggest to qualify Zen5 with AMD.</pre>
    </blockquote>
    <pre>I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.

</pre>
    <blockquote type="cite"
      cite="mid:8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com">
      <pre wrap="" class="moz-quote-pre"> Whether to mention this here
when I think I backported all the pieces isn't entirely clear to me either.</pre>
    </blockquote>
    <pre>What is the better place then?

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------TI0OLt68va0W3F08Ucjj3ON6--

