Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4842C48214
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158656.1486977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV99-0003LM-Me; Mon, 10 Nov 2025 16:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158656.1486977; Mon, 10 Nov 2025 16:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV99-0003Jy-Io; Mon, 10 Nov 2025 16:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1158656;
 Mon, 10 Nov 2025 16:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpW6=5S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vIV98-0003Js-Dq
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:53:38 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd42984e-be55-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:53:37 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so2891864a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:53:37 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f713a68sm11747199a12.2.2025.11.10.08.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:53:36 -0800 (PST)
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
X-Inumbo-ID: cd42984e-be55-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762793617; x=1763398417; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqYiM8716F5Irc6ZGhE2C1vfyNNOVpEmZavfNHXNCzs=;
        b=ltjfRWdriY7A2SnneVATkMmR4bJDMB2UEz+azyZx77SGRrI/14oZewqjh+XVGKqK1c
         YM911/ATrETarivgRFq/QF6VY+7BGBMv7JUd7uAUXVhfeCv5FJ/ZakeGYPrbUBWnyHZG
         OGe92xzNH1nHFoVqNWJ6UvpwTK4qgr64Eghjejh14hPTYNYmiXPuJQYbut0ISryWGuWi
         2pU3VplrEMfR5rjjFwVT7gs7gYqKCYD29CnXoY7krU38XgKQ9tOiruTIbYzhKswA+QPu
         GZWYdTdhgeEC5hl9YhKuaLXKPYFUNcXGAuWNe57EuXSUxVlQc9ppbY0sH7SCtW6ZDc/+
         A1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793617; x=1763398417;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqYiM8716F5Irc6ZGhE2C1vfyNNOVpEmZavfNHXNCzs=;
        b=TUPsFepaqOix54p99JPmvgOxbUD/n0uKh++40dMjZVnNuKe4IZKmAbFX2JSVBzlE6g
         vWvMDBlvy3HoSRv2JZVIUU4k3r2gxGtZJ4jBuXzEDZXmPkXzFo148gr+xg0SW65Cqr2b
         Xzzsao0yvtw7qyMLgQ3qkg5yhMi1RSOXUtAsC/F9yJIH9ptR05MAHs2Z9tXTcvLj5Z9L
         0CpAayH1A7cF4bcUKNfEmpR6BE4NN3Ahb+xw0dMiIeaR7geYnIUO8TwMLPbU260X9O6b
         NHr3ulnsq+jPKS+v0qtDbR8WMBCqXIiaRF3z9U9h3fNRNJvRblURUV0f9yJocigRAZcY
         iv8w==
X-Forwarded-Encrypted: i=1; AJvYcCUDkDDMyYAxLy8nP/6DoA0WcMAUq0HK4Dcir69zFgDdMP1nQwtI9QUm0CrcUO5icOvE3bI9TLKvalQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuxD9RjvVTSF99sww87bGlLvCniFN3Zp0tvmwGCnEdomUDlMMF
	P6IKuYXqXBrxw/+VLF/r3uAlPrpxC5eK4p1fdlQ2x67TMZqHGp6MX+yb
X-Gm-Gg: ASbGncueqjuyutzltdXBVp/5PcTodq6CjZqpgJpmbQBKs7G7MSY62kqOoBVq3HtR1dJ
	EPh4W5d3WFZmas3JlLFa/htiXEeVKTKxNxWRiYqcuSUT/87PM6G7I4cgOkIw0jRwktP0mpL1Qmb
	y17q08YZ+j6GIB1g+druju/LvOnVduVb9ipL3LsYUHkEto/C1C8uTwHaqJIcbaQqTfcnrOuoUCJ
	xf8XnUjii3fAcUSNZLZxv/JeLjMBI7rtUVLu6MwLqFFd9Iq1Xgb3P/Q1knaqo0vBinIaWCCYp/F
	hyyztJjt20cK7G8wvt+x0LmBDSpbnR2WCSOWHNXooJ30m6RKydGJLns+GefVt/jWLn1vdGnfBBY
	BEvGips/lCN7M0fueE3xNGLrmbstjtgbvlQMAr/Kp4vjBVT5sIu7MRnq2u7m4TBBHu6Vwa2vraX
	yOpyLpeQPgFYXjNLdjyvcuVQvFEkYH62kk/J+MFz9lk0dnLN+VX2XVMvdfVlrg
X-Google-Smtp-Source: AGHT+IHdZCCoMgZe6OW5EM0rxzL90QYVYbv/XC+Nh5KF4n4y/XUC2UxWtkFM+hvKYFlBLdn0UtL+pg==
X-Received: by 2002:a05:6402:26d0:b0:640:3210:6e48 with SMTP id 4fb4d7f45d1cf-6415dbf4f94mr7209732a12.4.1762793616760;
        Mon, 10 Nov 2025 08:53:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------oe5d8GbDWJ2guFaWTtG6z0U0"
Message-ID: <d5b79f66-2b03-418c-96bf-f0f4fad3b713@gmail.com>
Date: Mon, 10 Nov 2025 17:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: Note about oxenstored being deprecated
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, Pau Ruiz Safont <pau.safont@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>
References: <20251110164427.54299-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251110164427.54299-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------oe5d8GbDWJ2guFaWTtG6z0U0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/25 5:44 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Christian Lindig<christian.lindig@citrix.com>
> CC: David Scott<dave@recoil.org>
> CC: Edwin Török<edwin.torok@cloud.com>
> CC: Rob Hoes<Rob.Hoes@citrix.com>
> CC: Pau Ruiz Safont<pau.safont@vates.tech>
> CC: Andrii Sultanov<andriy.sultanov@vates.tech>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> I'd like to add a --with-system-oxenstored= but I don't have time.  That will
> have to wait for 4.22.

It would be nice to introduce "--with-system-oxenstored=", but, at the moment,
I can agree that it is enough to announce that oxenstored is deprecated and
will be removed in a future version of Xen:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   CHANGELOG.md | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index fc4f6d7c8a09..080305ef456f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -53,6 +53,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>    - Support of qemu-traditional has been removed.
>   
> + - The in-tree oxenstored is deprecated and will be removed in a future
> +   version of Xen.  It is moving into the Xapi project
> +https://github.com/xapi-project/oxenstored so it can be maintained in line
> +   with the other Ocaml projects in the Xen ecosystem.
> +
>   ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
>   
>   ### Changed
>
> base-commit: 343e01fd1d31dc6867473599c2c49039386bdf79
--------------oe5d8GbDWJ2guFaWTtG6z0U0
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
    <div class="moz-cite-prefix">On 11/10/25 5:44 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251110164427.54299-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Christian Lindig <a class="moz-txt-link-rfc2396E" href="mailto:christian.lindig@citrix.com">&lt;christian.lindig@citrix.com&gt;</a>
CC: David Scott <a class="moz-txt-link-rfc2396E" href="mailto:dave@recoil.org">&lt;dave@recoil.org&gt;</a>
CC: Edwin Török <a class="moz-txt-link-rfc2396E" href="mailto:edwin.torok@cloud.com">&lt;edwin.torok@cloud.com&gt;</a>
CC: Rob Hoes <a class="moz-txt-link-rfc2396E" href="mailto:Rob.Hoes@citrix.com">&lt;Rob.Hoes@citrix.com&gt;</a>
CC: Pau Ruiz Safont <a class="moz-txt-link-rfc2396E" href="mailto:pau.safont@vates.tech">&lt;pau.safont@vates.tech&gt;</a>
CC: Andrii Sultanov <a class="moz-txt-link-rfc2396E" href="mailto:andriy.sultanov@vates.tech">&lt;andriy.sultanov@vates.tech&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

I'd like to add a --with-system-oxenstored= but I don't have time.  That will
have to wait for 4.22.</pre>
    </blockquote>
    <pre>It would be nice to introduce "--with-system-oxenstored=", but, at the moment,
I can agree that it is enough to announce that oxenstored is deprecated and
will be removed in a future version of Xen:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251110164427.54299-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 CHANGELOG.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index fc4f6d7c8a09..080305ef456f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -53,6 +53,11 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 
  - Support of qemu-traditional has been removed.
 
+ - The in-tree oxenstored is deprecated and will be removed in a future
+   version of Xen.  It is moving into the Xapi project
+   <a class="moz-txt-link-freetext" href="https://github.com/xapi-project/oxenstored">https://github.com/xapi-project/oxenstored</a> so it can be maintained in line
+   with the other Ocaml projects in the Xen ecosystem.
+
 ## [4.20.0](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0</a>) - 2025-03-05
 
 ### Changed

base-commit: 343e01fd1d31dc6867473599c2c49039386bdf79
</pre>
    </blockquote>
  </body>
</html>

--------------oe5d8GbDWJ2guFaWTtG6z0U0--

