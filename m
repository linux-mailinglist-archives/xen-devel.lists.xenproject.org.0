Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFCD923A6B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752151.1160268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOa4u-0003BD-7y; Tue, 02 Jul 2024 09:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752151.1160268; Tue, 02 Jul 2024 09:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOa4u-000391-4V; Tue, 02 Jul 2024 09:45:36 +0000
Received: by outflank-mailman (input) for mailman id 752151;
 Tue, 02 Jul 2024 09:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWIE=OC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOa4s-00038v-Pb
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:45:34 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d360aba0-3857-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 11:45:33 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-79c06a06a8eso253268885a.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:45:33 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d6932c4d0sm430776185a.130.2024.07.02.02.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 02:45:32 -0700 (PDT)
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
X-Inumbo-ID: d360aba0-3857-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719913533; x=1720518333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ggeOy6WYeXxjc+ugYM8nxhyvF0NE3P/XnvKREEwY8ZA=;
        b=q1OHhNV8nmRLNIrnaotstL66ZQjdHDy/P+U37fCjP0GVU8SO85GSH7jMRFlsSWQxuB
         GTm3JSMMJo0ng5Fgw7UO1P0ntn5JJvp/JpSf4TzIIEHUn8KCqRcQUJQHJBb0ILvdBpVs
         ZSm5JknGjiJL9JkBU+ernxQgU8g5oj4MchGo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719913533; x=1720518333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggeOy6WYeXxjc+ugYM8nxhyvF0NE3P/XnvKREEwY8ZA=;
        b=dQ4dke+Xmo6Thk4de1GOgXJlB45jZj4nYzfoPQVrHyVFCjHi4uO7dXEqa48Xq8+hTJ
         tGXcYmrGuzyl7SP83ZUMh3TW5Pjslj4hJqpFR3rEPNCxt/vZDi8Nb0IACsuwhv3rJMgJ
         tkGDeTjG382vXBD2+sC8vxF5RdUB0klbU84ij95pKWgLD6mnR33wat7e3AIiHd4a3iQL
         T90IIIO7JKnGWvnmnx6DV63nh1eq02m8qKe72Q/XlOWP9T/I5/Eij6PQMVeinTvkSpCw
         1sBTi6MdDolP30ZGR1XzYwWjeJd0OfCOzL38WdiLVF607YyRREhXrhPEdHTang7RrrGc
         4eMA==
X-Forwarded-Encrypted: i=1; AJvYcCWDX3AsLn1zjzg6DiQJpeDLQ9xhc37cDn5BvXPikrwTG+39KR+mYl1unakiHgWqMCm0qOYfMCyTN1KVOO74Wc7RCmNZAtW+Br7iTKaYD3g=
X-Gm-Message-State: AOJu0YxiQ9eRzG6b4ZaVTC38ZAI2hf/M8589WnDEqnPtSerDSyU5/SJy
	Y5hYv5/9X9SVeHSllKMK8Jem8REiTMH0tfI8E/Xkd+45UvyL0YRp/KVEL/T2SRE=
X-Google-Smtp-Source: AGHT+IHysWhDj/uQttrKvo2I0di9oLNdmMWOVKJeaKZwuQ8Jke//NgaL6vI2l1H63Hj3aQA0JNFJvA==
X-Received: by 2002:a05:620a:4510:b0:79d:5fce:5928 with SMTP id af79cd13be357-79d7ba789famr1142377385a.52.1719913532684;
        Tue, 02 Jul 2024 02:45:32 -0700 (PDT)
Message-ID: <93b0cc94-019a-4731-91e0-5cc54ec1c6f8@citrix.com>
Date: Tue, 2 Jul 2024 10:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v1] automation: add python3-packaging to suse
 images
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240702085608.3612-1-olaf@aepfle.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240702085608.3612-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2024 9:56 am, Olaf Hering wrote:
> The qemu-xen build system uses gdbus-codegen, which relies on 'packaging'.
> Make sure it is available.
>
> [188/2647] Generating ui/dbus-display gdbus-codegen with a custom command
> FAILED: ui/dbus-display1.h ui/dbus-display1.c
> /usr/bin/gdbus-codegen ../qemu-xen-dir-remote/ui/dbus-display1.xml
>   --glib-min-required 2.64 --output-directory /build/tools/qemu-xen-build/ui
>   --interface-prefix org.qemu. --c-namespace QemuDBus
>   --generate-c-code dbus-display1
> Traceback (most recent call last):
>   File "/usr/bin/gdbus-codegen", line 53, in <module>
>     from codegen import codegen_main
>   File "/usr/share/glib-2.0/codegen/codegen_main.py", line 30, in <module>
>     from . import dbustypes
>   File "/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
>     from . import utils
>   File "/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
>     import packaging.version
> ModuleNotFoundError: No module named 'packaging'
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Again, CC Oleksii for 4.19.

~Andrew

> ---
>  automation/build/suse/opensuse-leap.dockerfile       | 1 +
>  automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index 1344cbb0d1..0eea74be15 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -59,6 +59,7 @@ RUN zypper install -y --no-recommends \
>          'pkgconfig(sdl)' \
>          'pkgconfig(sdl2)' \
>          python3-devel \
> +        python3-packaging \
>          python3-setuptools \
>          # systemd-devel for Xen < 4.19
>          systemd-devel \
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 2587a3fa4f..caf0d42ce1 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -60,6 +60,7 @@ RUN zypper install -y --no-recommends \
>          'pkgconfig(sdl)' \
>          'pkgconfig(sdl2)' \
>          python3-devel \
> +        python3-packaging \
>          python3-setuptools \
>          # systemd-devel for Xen < 4.19
>          systemd-devel \
>


