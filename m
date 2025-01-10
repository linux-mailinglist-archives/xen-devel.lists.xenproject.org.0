Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B6A09951
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 19:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869928.1281369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJjV-0003Sz-Kb; Fri, 10 Jan 2025 18:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869928.1281369; Fri, 10 Jan 2025 18:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJjV-0003Qr-Gw; Fri, 10 Jan 2025 18:27:45 +0000
Received: by outflank-mailman (input) for mailman id 869928;
 Fri, 10 Jan 2025 18:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vlD=UC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tWJjT-0003QV-DZ
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 18:27:43 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9348f1c0-cf80-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 19:27:41 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso2403007e87.0; 
 Fri, 10 Jan 2025 10:27:40 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49e18sm600334e87.31.2025.01.10.10.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 10:27:39 -0800 (PST)
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
X-Inumbo-ID: 9348f1c0-cf80-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736533660; x=1737138460; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJU6nsxiXJxqV9ClbAa3IjgowBH3TtQdk3f7AL4Hbmo=;
        b=U6LDwRWeNOFnRIdvCzWR+elaUezvIdXK9yhoONDcynmQnwdwBAi9jsEbhIQyyD490u
         8nv8TgfAaKQqpcaNwT/DmvJz5gDGzaEqHRpOmWA0tsTtUWo5TmPi33QukURKlxmV/LDl
         1vs2IvvwE8VQ83Pve66on82mop2SK84L9vweRR/x6iVUSpZ7Saen70W17r7cYReE8hHh
         f1+VgypCqcEMM4Ynj3oT0E9WBIdJsBoYO3cmzjd3tQUcHUASQdAuM8sa7TmMf7s0Cdun
         CLDz+sDe0fz5jm0Tebax478Y/QqPS8NhV9vDi8E05gdkj4yksxI5DGfFsx8+sLIY2Zsq
         9+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736533660; x=1737138460;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sJU6nsxiXJxqV9ClbAa3IjgowBH3TtQdk3f7AL4Hbmo=;
        b=JqsJCHdV3f4tutGI5kF0Hro1JSuEjYkcK5BMdfI2kQs5hdmt65F9vlolSurUTe7Keh
         vGLhbZpVnGkraQrjVHBZ0AwmIrywZwqLiQNc08ToPCvcLLDPwZCayrNRsc7qy54rm87e
         CrDR+zZ8jOsVShsNzyXwWwlqvzGANZR90iKxhM+EAQvpNzWcQNf71Rv0AZQSvXtRmokU
         M9u524WMATOCKLqQR4qVUInmF+JW7E92Dc6+ValDiRZ5s9j/8KM88Qb8SPDHFFJ6CnK6
         cstsE8zK85VN840LWqGl2CgIX6eEWg+AVPeE5JwmLKzzvUYHKh3bfkcxXxSx8qZ4Z/gj
         X49Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtQiYqhy4ZvApmZE1GoDzDaj4NrxIqrVzeo3zUgP/8Vul3qg+r8bZCMMy2RubHnBh9GJ8jGWAV75HwQeg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypufwswe4pLHWzCperCV/NoeDTC57NqbKKe7vTo1G0Q47CA1xR
	cwHxu7DMO0nchQHjDqY0LYBk8RA4FfAX/XYGOxD7sYVhM5AFNcrHIkQ0Rw==
X-Gm-Gg: ASbGncvzCbcpcKm/vBn8/yAu6hhzZSovMPQ8qNA2Zk9DriJuBqYNZQGqcSeAAYlZxYU
	24BK1KERq1HlSkquZtXvwJ9WohOAbCh03tdkoortiCU5LFAXvpUZ1zs8lvooEi20XUmI8puKwhw
	DEHPLBhnOALeNIm4FkUWGgWaaNBv0IncqakBqES4g55sudxOgchuNk2hpaRkKco6a9RGI5ShHll
	KkvTmT1+eEwkiI6ncB3i7AF9OkIk8xkVKF+YileWRSL5ev05Hm9y+mpfogpA0Mu0TbggA==
X-Google-Smtp-Source: AGHT+IEcQCkVV81W0EPT6eAwxj6CsW3xFoMewrcwmZ23migfLB+tXncZV+lLbRepxQuh9+DG+f00yg==
X-Received: by 2002:a05:6512:23aa:b0:53f:167e:390f with SMTP id 2adb3069b0e04-542845c089cmr3171218e87.53.1736533659603;
        Fri, 10 Jan 2025 10:27:39 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Qa1tvSDmwNToFT4yR1BXsx6y"
Message-ID: <35db8072-4da2-44dd-9167-fa1211f5e8d5@gmail.com>
Date: Fri, 10 Jan 2025 19:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] Xen 4.20.0-rc1 is tagged
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
References: <4c90bca8-997a-43d2-a0e0-963ac5555b93@gmail.com>
Content-Language: en-US
In-Reply-To: <4c90bca8-997a-43d2-a0e0-963ac5555b93@gmail.com>

This is a multi-part message in MIME format.
--------------Qa1tvSDmwNToFT4yR1BXsx6y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for inconvenience but I did something wrong with link location in my e-mail application.

Please find the corrected links below:

On 1/10/25 6:46 PM, Oleksii Kurochko wrote:
> Hi all,
>
> Xen 4.20 rc1 is tagged. You can check that out from xen.git:
>
> git://xenbits.xen.org/xen.git 4.20.0-rc1
>
> For your convenience there is also a tarball and the signature at:
> https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz
>
> And the signature is at:
> https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig

Corrected links:

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig

Have a nice weekends.

~ Oleksii

> Please send bug reports and test reports to
> xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
> When sending bug reports, please CC relevant maintainers and me
> (oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).
>
> Best regards,
>   Oleksii
--------------Qa1tvSDmwNToFT4yR1BXsx6y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Sorry for inconvenience but I did something wrong with link location in my e-mail application.</pre>
    <pre>Please find the corrected links below:

</pre>
    <div class="moz-cite-prefix">On 1/10/25 6:46 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4c90bca8-997a-43d2-a0e0-963ac5555b93@gmail.com">
      <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi all,

Xen 4.20 rc1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc1

For your convenience there is also a tarball and the signature at:
<a
href="https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
      class="moz-txt-link-freetext">https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz</a>

And the signature is at:
<a
href="https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
      class="moz-txt-link-freetext">https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig</a>
</pre>
    </blockquote>
    <pre>Corrected links:</pre>
    <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">For your convenience there is also a tarball and the signature at:
<a
href="https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    moz-do-not-send="true" class="moz-txt-link-freetext">https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz</a>

And the signature is at:
<a
href="https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://downloads.xenproject.org/release/xen/4.20.0-rc1/xen-4.20.0-rc1.tar.gz.sig</a>

Have a nice weekends.

</pre>
    <p></p>
    <pre>~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:4c90bca8-997a-43d2-a0e0-963ac5555b93@gmail.com">
      <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Please send bug reports and test reports to
<a class="moz-txt-link-abbreviated moz-txt-link-freetext"
      href="mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenproject.org</a><a
      class="moz-txt-link-rfc2396E"
      href="mailto:xen-devel@lists.xenproject.org">&lt;mailto:xen-devel@lists.xenproject.org&gt;</a>.
When sending bug reports, please CC relevant maintainers and me
(<a class="moz-txt-link-abbreviated moz-txt-link-freetext"
      href="mailto:oleskii.kurochko@gmail.com">oleskii.kurochko@gmail.com</a>&lt;<a
      class="moz-txt-link-freetext"
      href="mailto:oleskii.kurochko@gmail.com">mailto:oleskii.kurochko@gmail.com</a>).

Best regards,
 Oleksii</pre>
    </blockquote>
  </body>
</html>

--------------Qa1tvSDmwNToFT4yR1BXsx6y--

