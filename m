Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB042BA9D03
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 17:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132978.1471179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Fu6-0007Cm-VJ; Mon, 29 Sep 2025 15:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132978.1471179; Mon, 29 Sep 2025 15:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Fu6-0007Aw-SK; Mon, 29 Sep 2025 15:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1132978;
 Mon, 29 Sep 2025 15:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4Dr=4I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3Fu6-0007Aq-1s
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 15:35:06 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de437e75-9d49-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 17:35:03 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-62fb48315ddso8715055a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 08:35:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a98d7fsm946635966b.100.2025.09.29.08.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 08:35:02 -0700 (PDT)
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
X-Inumbo-ID: de437e75-9d49-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160103; x=1759764903; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St7MtK7lqhceGoxH8AAxicUHeyaRpXl1YBow1O0Mb/U=;
        b=kK4ARTDvdj6EBBm9Qx2fQQwaDRqyJL4cAqzr25YnycZf/rwTOSik8o0hKgoJgPdzmg
         Ef0OxvJLq/DZOAJU2s8t9B2ET7+JXA8gvpkDSDzgX3g1tRGcczCJgKz11dZEbzLpIjIX
         Fdrm5SpJbwpdd8tixoJ1Q+tzDHvdp9jETOklKUDn2znC0pi6LPWhtcMa/zMyl2ueHXh6
         24aq1HHibaZZOk5d5i/jkKe1RqZPnxzwUOhrKqj/EK8HJWnDaSxSCO7clGXWxfDLC6+W
         MuxLLweNoxb/+d8UuUS6L0ZgwQS1qJDhFOdVUK45c/m4IRyIOLcK4NcBOg/8no2VjzNo
         4KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160103; x=1759764903;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=St7MtK7lqhceGoxH8AAxicUHeyaRpXl1YBow1O0Mb/U=;
        b=izhoM5fuROf06CowTBZrtL5ARUafsyjuKxsm+yESCeJsXv1oY8lvrvNoKslCw5mcWP
         RC8cFkyDnB/aCq8QRwCjoVEekV37gZYDWM0h+CpOOx2UutxbiIBZI2BReNrlTTg3rlSH
         cHRw7sA57vNSRz2g9vpjLCqxtCY/Tvn6fKMAhROehKHvUqeAX2fbdn6Jk0GDaZfTDYYb
         sPj4RtM0QiK3CQnb4hoIn+q/F59he4HGsDJgduWwsyxYvzvO1lt3akXISZZ0oADCdfuk
         yV29mSxcOnnjy2PYKn0xzevcQcrzWBJ4aV2AXV1Yhddykc5/Di47UA9k6S256QSXSYi8
         gbOg==
X-Forwarded-Encrypted: i=1; AJvYcCXCjj5/2uy4eEpjTWsIFS2Io6bfvFOSXu5/l0Q6VPC4E2bmhmj/kv+agfdHz9Xfs+VLeDqRJaeB1js=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztepRl9eaAmZi01RSx/uZUS5jSLl2fXbSWk731Y2tV/Tq/OfeM
	0JK3r59jyHVlrdp4EUMdY+L2MPDKKfzQEuK9sCEczr/OOdvbWFxWGLuj
X-Gm-Gg: ASbGncuum7F0YOqdC7M8BWBSps+v+X917y3Ea4uRDwLWQbqRzJD87o6a4w0dV7QvMiS
	DozW0Fw5T3IuMzvCqh53OTjBuhnWxYaghayUeK3v0wzK/tGz7gzlt00IwptWqX2dG0b6V9zAWJk
	dP/JsX7p5EDf95wdmom1vhjiSeXTHtPj7DQIDPxjeg6jbpesYgBHShRuCVIf+32+rbaDQfAQZbr
	xS0n69QeCzLb/Xp7fnIj4xwT8sv39EP0OpilD8dzSt9ZKOTM17w1hZ74aEnNfkcLJrRTNK8djFc
	UFHL9C1AP04ARPl7BsPs92hQZW/wwshaHX3vDRyXFr47dUI+woGAUf3LyUuABJkIrFrRxmeoXyg
	ipwBeAmkky30g/aM4brmBTS3RQfKxbIrrtW0VNgIL5JHwNeb6zt8Iuu+96HJC4pYv0+W+eg2Vuy
	2P6qaboPA=
X-Google-Smtp-Source: AGHT+IED3nY2IeswDKHnxjb2JCmFaDg/GhqWKfgRq1asooCVh8DCSPdOrP2Hs3ymU5m2+wxfqz7sDg==
X-Received: by 2002:a17:906:dc89:b0:b3d:b3fe:27ed with SMTP id a640c23a62f3a-b3db3fe2fa1mr613933866b.57.1759160102850;
        Mon, 29 Sep 2025 08:35:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------d6rGK2ExZZTEDgY53x6yI8f5"
Message-ID: <a9f5969b-c9b8-4384-b4df-58c7951766ec@gmail.com>
Date: Mon, 29 Sep 2025 17:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/8] Allow to build libxl and other tools with
 json-c instead of yajl
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250929120756.46075-1-anthony@xenproject.org>

This is a multi-part message in MIME format.
--------------d6rGK2ExZZTEDgY53x6yI8f5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/29/25 2:07 PM, Anthony PERARD wrote:
> From: Anthony PERARD<anthony.perard@vates.tech>
>
> Patch series available in this git branch:
> https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.libxl-libjsonc-v2
>
> changes in v2:
> - introduce $(XEN_JSON_LIBS) to have either -lyajl or -ljson-c or both (for a
>    short while).
> - few more changes detail in each patches.
>
> Hi,
>
> The library YAJL has been unmaintained for several years, without an obvious
> fork to pick.
>
> On the other and the library json-c is been maintained and use by several other
> project, it's probably already installed on your machine. So this patch series
> intend to allow to build the Xen toolstack again json-c, and forgo yajl.

Do we have any plans to drop fallback to yajl in the next release? Or because of
this ...

>
> Just in case, YAJL is can still be used.
>
> There's bit of libxl API that exposes YAJL, mainly so it can be used by `xl` to
> call libxl_domain_config_gen_json(). It was exposed via the "libxl_json.h"
> headers. This functions and others won't be available when libxl is build
> against json-c.

... that some API trying to use API exposed by YAJL we just can't drop support
of yajl?

~ Oleksii


>
> Cheers,
>
> Anthony PERARD (8):
>    tools/configure: Introduce deps on json-c lib for libxl
>    libxl: Convert libxl__json_parse() to use json-c
>    libxl: convert libxl__json_object_to_yajl_gen to
>      libxl__json_object_to_libjsonc_object
>    libxl: libxl__object_to_json() to json-c
>    libxl: convert libxl__json_object_to_json() to json_object
>    tools/libxenstat: Use json-c when available
>    configure: Use json-c by default, fallback to yajl
>    Update CHANGELOG and README with dependency on json-c
>
>   CHANGELOG.md                              |   2 +
>   README                                    |   2 +-
>   config/Tools.mk.in                        |   1 +
>   tools/config.h.in                         |   3 +
>   tools/configure                           | 136 +++++-
>   tools/configure.ac                        |  10 +-
>   tools/include/libxl_json.h                |  27 ++
>   tools/libs/light/Makefile                 |   6 +-
>   tools/libs/light/gentypes.py              | 160 +++++-
>   tools/libs/light/idl.py                   |   7 +-
>   tools/libs/light/libxl_cpuid.c            | 119 +++++
>   tools/libs/light/libxl_internal.h         |  23 +-
>   tools/libs/light/libxl_json.c             | 562 +++++++++++++++++++++-
>   tools/libs/light/libxl_qmp.c              |  53 ++
>   tools/libs/light/libxl_types.idl          |   7 +-
>   tools/libs/light/libxl_types_internal.idl |   3 +-
>   tools/libs/stat/Makefile                  |   2 +-
>   tools/libs/stat/xenstat_qmp.c             | 126 ++++-
>   tools/xl/Makefile                         |   2 +-
>   tools/xl/xl_info.c                        | 102 +++-
>   20 files changed, 1312 insertions(+), 41 deletions(-)
>
--------------d6rGK2ExZZTEDgY53x6yI8f5
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
    <div class="moz-cite-prefix">On 9/29/25 2:07 PM, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250929120756.46075-1-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">From: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>

Patch series available in this git branch:
<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git">https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git</a> br.libxl-libjsonc-v2

changes in v2:
- introduce $(XEN_JSON_LIBS) to have either -lyajl or -ljson-c or both (for a
  short while).
- few more changes detail in each patches.

Hi,

The library YAJL has been unmaintained for several years, without an obvious
fork to pick.

On the other and the library json-c is been maintained and use by several other
project, it's probably already installed on your machine. So this patch series
intend to allow to build the Xen toolstack again json-c, and forgo yajl.</pre>
    </blockquote>
    <pre>Do we have any plans to drop fallback to yajl in the next release? Or because of
this ...
</pre>
    <blockquote type="cite"
      cite="mid:20250929120756.46075-1-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">

Just in case, YAJL is can still be used.

There's bit of libxl API that exposes YAJL, mainly so it can be used by `xl` to
call libxl_domain_config_gen_json(). It was exposed via the "libxl_json.h"
headers. This functions and others won't be available when libxl is build
against json-c.</pre>
    </blockquote>
    <pre>... that some API trying to use API exposed by YAJL we just can't drop support
of yajl?

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20250929120756.46075-1-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Anthony PERARD (8):
  tools/configure: Introduce deps on json-c lib for libxl
  libxl: Convert libxl__json_parse() to use json-c
  libxl: convert libxl__json_object_to_yajl_gen to
    libxl__json_object_to_libjsonc_object
  libxl: libxl__object_to_json() to json-c
  libxl: convert libxl__json_object_to_json() to json_object
  tools/libxenstat: Use json-c when available
  configure: Use json-c by default, fallback to yajl
  Update CHANGELOG and README with dependency on json-c

 CHANGELOG.md                              |   2 +
 README                                    |   2 +-
 config/Tools.mk.in                        |   1 +
 tools/config.h.in                         |   3 +
 tools/configure                           | 136 +++++-
 tools/configure.ac                        |  10 +-
 tools/include/libxl_json.h                |  27 ++
 tools/libs/light/Makefile                 |   6 +-
 tools/libs/light/gentypes.py              | 160 +++++-
 tools/libs/light/idl.py                   |   7 +-
 tools/libs/light/libxl_cpuid.c            | 119 +++++
 tools/libs/light/libxl_internal.h         |  23 +-
 tools/libs/light/libxl_json.c             | 562 +++++++++++++++++++++-
 tools/libs/light/libxl_qmp.c              |  53 ++
 tools/libs/light/libxl_types.idl          |   7 +-
 tools/libs/light/libxl_types_internal.idl |   3 +-
 tools/libs/stat/Makefile                  |   2 +-
 tools/libs/stat/xenstat_qmp.c             | 126 ++++-
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl_info.c                        | 102 +++-
 20 files changed, 1312 insertions(+), 41 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------d6rGK2ExZZTEDgY53x6yI8f5--

