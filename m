Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0292F225
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 00:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757727.1166851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS2S3-0007YI-AT; Thu, 11 Jul 2024 22:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757727.1166851; Thu, 11 Jul 2024 22:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS2S3-0007W3-7c; Thu, 11 Jul 2024 22:39:47 +0000
Received: by outflank-mailman (input) for mailman id 757727;
 Thu, 11 Jul 2024 22:39:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sS2S2-0007Vx-K4
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 22:39:46 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 785b1266-3fd6-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 00:39:45 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42795086628so8990495e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 15:39:44 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2679b1sm2696625e9.15.2024.07.11.15.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 15:39:43 -0700 (PDT)
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
X-Inumbo-ID: 785b1266-3fd6-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720737584; x=1721342384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=93DoMi/9tG886Udz7YTKHXgSgT1e2i2Mxz+xyxoIZjk=;
        b=Mfq1Fb/saIGyb/x9sd2Kbc7kN4UszZsFTSyzbHNheEODpgRKbnxvEiiba8E8cCAjLY
         L/viNv/bpOPTVDCR/l6iQHKULv5tEZBi0y7+Sar39yWoAS9inbI02OwmVBS3Y8ayN4H3
         30IXy9ivtTtHZFdFnxZ4RIO1V/4A857+C4S1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720737584; x=1721342384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93DoMi/9tG886Udz7YTKHXgSgT1e2i2Mxz+xyxoIZjk=;
        b=krSZ5Buj9JNEk94+IjEfB6GDoAztG/gHFKXS1IFu+YAaCpmjdKSw8ff2al9qdGQXe8
         d0syCiuYNRdXxgOmEEzBq0uhnd73FekxoBdvBmAv2a9M7wcjF5Y6qKMfzVyUcHa8S6dK
         JwvL6tnmTbxHaxv6w6sPgMaRvITKXhlqZ9mP0xOM1IzlSLfmhiEgusaam4i6XqIWwEsC
         O0lJeNJvpkTDXkS2tH88OyUhUGCPSDK6sjzMde4pxVgkCLYYc5nPidk/5oaU0Vpqj4P+
         CLgTroK+hnEF6Yi4wCYRQuks2WV9S512HHQqnvWlWa1xYaq3wmGEBLOTwVRo632WstWE
         w66g==
X-Gm-Message-State: AOJu0Yzxr14Xo+j2vkx1UOtejgvch4ytnFQmlJcnt6de7UPaQ4EVLdKj
	RdFJbWolbWDhS64oCLFumuNgLsIVT92GJzT4XZTgtO1CdV6eSd0Q8QdY4Jpq82M=
X-Google-Smtp-Source: AGHT+IGTbd7bqpIW6501EY7fZm7ZUp6LvmXYoNwicEyjIdU0FOiXpBzYMzeDXLQzK9kxTgwcQ2D3sw==
X-Received: by 2002:a05:600c:42cb:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-426707d88e9mr69672875e9.10.1720737584146;
        Thu, 11 Jul 2024 15:39:44 -0700 (PDT)
Message-ID: <44cc71ca-00b2-42a8-9dc4-bc0b6f1df6d0@citrix.com>
Date: Thu, 11 Jul 2024 23:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/12] CI: Refresh OpenSUSE Tumbleweed container
To: Olaf Hering <olaf@aepfle.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240711202337.3128473-1-andrew.cooper3@citrix.com>
 <20240711234925.189e16d5.olaf@aepfle.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240711234925.189e16d5.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 10:49 pm, Olaf Hering wrote:
> Thu, 11 Jul 2024 21:23:37 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> use the zypper long names for the benefit of those wondering what was being referenced or duplicated.
> Names of rpm packages do change over time, configure already searches for "something" where it is available,

configure has to cope with distros taking different naming decisions,
and while I appreciate that packages may change over time even within a
distro ...

>  instead of some library or header.
> If it is touched anyway, I would use more instead of less 'pkgconfig(something)' references:
>
> libbz2-devel
>     pkgconfig(bzip2) = 1.0.8
> libzstd-devel
>     pkgconfig(libzstd) = 1.5.6
> lzo-devel
>     pkgconfig(lzo2) = 2.10
> xz-devel
>     pkgconfig(liblzma) = 5.6.2
> zlib-devel
>     pkgconfig(zlib) = 1.3.1
> libuuid-devel
>     pkgconfig(uuid) = 2.40.1
> libyajl-devel
>     pkgconfig(yajl) = 2.1.0
> ncurses-devel
>     pkgconfig(form) = 6.5.20240629
>     pkgconfig(formw) = 6.5.20240629
>     pkgconfig(menu) = 6.5.20240629
>     pkgconfig(menuw) = 6.5.20240629
>     pkgconfig(ncurses) = 6.5.20240629
>     pkgconfig(ncurses++) = 6.5.20240629
>     pkgconfig(ncurses++w) = 6.5.20240629
>     pkgconfig(ncursesw) = 6.5.20240629
>     pkgconfig(panel) = 6.5.20240629
>     pkgconfig(panelw) = 6.5.20240629
>     pkgconfig(tic) = 6.5.20240629
>     pkgconfig(tinfo) = 6.5.20240629
> glib2-devel
>     pkgconfig(gio-2.0) = 2.80.3
>     pkgconfig(gio-unix-2.0) = 2.80.3
>     pkgconfig(girepository-2.0) = 2.80.3
>     pkgconfig(glib-2.0) = 2.80.3
>     pkgconfig(gmodule-2.0) = 2.80.3
>     pkgconfig(gmodule-export-2.0) = 2.80.3
>     pkgconfig(gmodule-no-export-2.0) = 2.80.3
>     pkgconfig(gobject-2.0) = 2.80.3
>     pkgconfig(gthread-2.0) = 2.80.3
> libpixman-1-0-devel
>     pkgconfig(pixman-1) = 0.43.4

... this is just a differently-inconsistent list of names, with some
very dubious aliases such as `form` and `menu`.

What makes pkgconfig() any more stable than the main package name?

Why do we want to be treating libraries different to other packages?

> python3-devel is "special", can be used as is.

As an aside, I looked for a python3-minimal or equivalent, and couldn't
find one.  I take it there isn't one?

> 'git' could be just 'git-core'

Thanks.  Will fix locally, for Tumbleweed and Leap.

~Andrew

