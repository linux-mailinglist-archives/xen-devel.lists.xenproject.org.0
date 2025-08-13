Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30974B242D0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 09:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079493.1440324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um60Y-0008JV-Oz; Wed, 13 Aug 2025 07:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079493.1440324; Wed, 13 Aug 2025 07:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um60Y-0008I4-M3; Wed, 13 Aug 2025 07:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1079493;
 Wed, 13 Aug 2025 07:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=InlY=2Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1um60X-0008Hy-Pz
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 07:34:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fddbb9ce-7817-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 09:34:48 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af96d097df5so1146975766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 00:34:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a22057esm2337664366b.115.2025.08.13.00.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 00:34:47 -0700 (PDT)
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
X-Inumbo-ID: fddbb9ce-7817-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755070488; x=1755675288; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2I/Po+P5avufAcUnjJgeoC1esKLjSIh6UubSNkOccc=;
        b=gW2JD4SsA7NuCjpNvnnMJwfjsRcYO1OU69xnYQzrrTzM3GmDjLcaH0VURVJdfkEwpK
         rt/TmqLe6pUJHe1tgGsfeZMO5cyByy27uiYgQ+bNPYIXvgDJqU1jqt2ZLf/uFmxeKdXL
         TqRN5U8q7vAoZPuesxO4K6FKgRRkIbFnSIxIeHwjc/sMb7EExxJvA5Hv+olMMtnF/sw+
         aLLZj0kS+g1dscIBzkiODkqX/3XKfnGLYrQqZC/ePOsQQypqj3KyvWFo0KrmKhwGZ7R5
         Q+U1qZBmEZ2vDNlSQsBqxIP9HHhMzdVsuko6WB9ern+UYCGzhvtNwaBrsEXlPGVJ1FpZ
         ofTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755070488; x=1755675288;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2I/Po+P5avufAcUnjJgeoC1esKLjSIh6UubSNkOccc=;
        b=GwFQWdgPOJHzf5c32byNB3HMJdpUOK8updB8H18zqhTp62jYM5LWK4bzu3f+V0b1Nc
         rC09ahnlCAalK72Pi+gXrX3zw/hPD4VjNwscHSIwOgr/6tUFFKN7vf8cyLzZ3TPzzaYx
         mfjbrSFFvY7i3BOUrMDVysc/GoAnvewKD/nFMCuduP5KmtbocfHujvr50xJJV4Kkv331
         JLeWRRG4GPpsq+IrgXjvKx4EEIp+ggMy+Ed6iOBS/L8BO5TtUKNDhyw9YoJPAvWnWLSR
         dkb+XfoA6ZBeFWGdGwFtNUQrj0exDJPmPAnHg/R2rBlS4rozNThS1KGWhIJyFNV95fcS
         eK7w==
X-Forwarded-Encrypted: i=1; AJvYcCUAWLpRGa/a2+YofwvGWg8wEvkjziuuAWUxA6DYpwfrWJwIfWF+6U5pKoCxcrOAHTT/YQUkuhtZ4/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF0inQBLPrf0V9mJy9CSC3Su1gVaW3kkNTBn13IPF8kiewXkTQ
	6OZxkKC4OYIh2/BUBSL79IhglgQhoihnWTCjEUZrZENwPdH09qLbAJgTwkx8Xg==
X-Gm-Gg: ASbGncvEXmuKkpUmPN1pgmjUw9o9GJR069Iwjsu0VWFJDa9+vUxtfBg26gjbUIkBJLK
	g0d2W26Zq3P50BkR+cMy3NOV/ImNpIXZSz4wx5QWlLcegmvyzXjIvmJ581YatXVhDTAJCE2moOL
	MycR//A9s6oTHBaFihWInpud3ozAeq3Ruzov8g+3gTuAbdhgzYRZHhFg1rOoUiwkF9LTHCpe39x
	fOpnGkPm5mFywDCH48rj66ABBBLFUd4IsdBxMusWXTbLmFuUEuiZCxKIf/PdWksQJt6QUUeG2VK
	5OpfwySUMMu+EHBlvVqWEfZ+o4EQhxW1SF2TN6120EoGQQwZwvWV5FHVLoN0Kgr0ilcxIYXFV2q
	YGLcRJ8pPWPQelhcbFIlSCJ+UEuuvWW57h4e0QabQKmrqlvJfZW/suk1SJXRVgfnJZEEoFwQ=
X-Google-Smtp-Source: AGHT+IErwiAdxd3x1aGEDKReW/jRPpAB5+/1IxButhYdK092nzemWgPZIqL+z+77GMAEC6pvu+iZqw==
X-Received: by 2002:a17:907:1c07:b0:ae3:ab68:4d7a with SMTP id a640c23a62f3a-afca4d459dfmr219159366b.25.1755070487802;
        Wed, 13 Aug 2025 00:34:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------plMxZf8F0sg5G3reG1OodzN6"
Message-ID: <e10ce36c-fe5b-4f34-8fe4-bfc843c10c7a@gmail.com>
Date: Wed, 13 Aug 2025 09:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21?] x86: drop detection of ld supporting
 SORT_BY_INIT_PRIORITY()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7a24d8c9-97c2-4721-9e38-600858b30119@suse.com>
 <75f5d54e-8ec1-42dd-8f4f-6023113203ee@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <75f5d54e-8ec1-42dd-8f4f-6023113203ee@citrix.com>

This is a multi-part message in MIME format.
--------------plMxZf8F0sg5G3reG1OodzN6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 1:10 PM, Andrew Cooper wrote:
> On 11/08/2025 12:02 pm, Jan Beulich wrote:
>> GNU ld 2.25 supports this, and we already assume all lld versions do.
>>
>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> Acked-by: Andrew Cooper<andrew.cooper3@citrix.com>
>
>> ---
>> While past the submission deadline, this fits the toolchain baseline
>> update we did in this release cycle, so I'd like to ask that it be
>> considered to still permit this in.
> There's loads of cleanup still in the ticket I made and talked about at
> the start of 4.21.
>
> There are a view bits posted and still in need of pushing through, but I
> consider anything along these lines to be fair game in the short term.

Agree with that.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------plMxZf8F0sg5G3reG1OodzN6
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
    <div class="moz-cite-prefix">On 8/11/25 1:10 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:75f5d54e-8ec1-42dd-8f4f-6023113203ee@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 11/08/2025 12:02 pm, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">GNU ld 2.25 supports this, and we already assume all lld versions do.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
While past the submission deadline, this fits the toolchain baseline
update we did in this release cycle, so I'd like to ask that it be
considered to still permit this in.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There's loads of cleanup still in the ticket I made and talked about at
the start of 4.21.

There are a view bits posted and still in need of pushing through, but I
consider anything along these lines to be fair game in the short term.</pre>
    </blockquote>
    <pre>Agree with that.

Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
  </body>
</html>

--------------plMxZf8F0sg5G3reG1OodzN6--

