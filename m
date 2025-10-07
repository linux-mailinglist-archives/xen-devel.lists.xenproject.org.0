Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0FBC2372
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 19:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139139.1474678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6B9F-00007U-Q2; Tue, 07 Oct 2025 17:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139139.1474678; Tue, 07 Oct 2025 17:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6B9F-0008Vw-ML; Tue, 07 Oct 2025 17:06:49 +0000
Received: by outflank-mailman (input) for mailman id 1139139;
 Tue, 07 Oct 2025 17:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6B9E-0008Vq-Eq
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 17:06:48 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01ee398b-a3a0-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 19:06:47 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so1177298f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 10:06:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8efffasm26232491f8f.41.2025.10.07.10.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 10:06:46 -0700 (PDT)
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
X-Inumbo-ID: 01ee398b-a3a0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759856807; x=1760461607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jIVKaaOIkETWhsVZWFFuO59apGFrLg40zIPBjcm/ljE=;
        b=iQ5Z62Hm5hfbQjWgecJSgUJrJyTCMAJL5vLvKC/MYa9D4Mxr8CwIQFqjUa4NFFo4Gb
         dRWuSJWrsiBlBZklEzserG2zFGDPpqH0s4uVd1L3Wq+WfvhpZVaz9WqLW3AZvsZN3uPg
         m59RUkzkPZB2TJz1C9gQpygkA46vThOn18u/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759856807; x=1760461607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIVKaaOIkETWhsVZWFFuO59apGFrLg40zIPBjcm/ljE=;
        b=tOfF9Zc8+1CzqVwY+ZmooJi2bGcrFkhEfUt62wDEq5UIXDHarRtPUMVrsp64x8Rpa5
         EdLO5RgXbo4o94wiGi5n/Asb3bh9qfwIFnWWb8FgsgPqsmHMc4RJfiXZ8fRxuyPJvhEO
         Tk8JvPbAy1I9sjumXCNISgAo3ptXf4GWcGZ3GvP3GifrDQ2N9QpvesOZftwn2SXC5q4c
         LXxc3CfB5VdWaHRpOrzyHoqdkzAg45R5RpGp+f/1SOtkbU/6ko6CYVfHK5ECPhbfHzhd
         Qaj4yKVpDKQlm2j/AznI05zjtTiGTvSwpyJGQZvsH04aGrUgfwkNKVuQBTV1AT70NXMS
         c4ag==
X-Forwarded-Encrypted: i=1; AJvYcCWx8MRijDhwcMIo+dI0iLWa85gz//n0DO8ysemMqyDbv/EGXfrbPQjpZK4yVlF5aKJF/SeJNxem524=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/xOlmK+R24F4U/LQL/K+sM8iQMEPjLwXkrYLlOGcrFMmT9iAy
	KilTI/Z4kn633nyKWnj355lWUa+wZ34przO6/NZP3pbQYgRGKQ4V+sDaphZ8u5hngaQ=
X-Gm-Gg: ASbGnctIKQSFc2cj/ImvAYuM/r5u1f0LiQaAZEs9AxqaYfL/nWa9FfSPxlIjaFnmeDy
	SN3j2Gyiju86BAkNhWIIcGsoawbB2EOGr9FDECt1otcAIAP8+AS6FYK/NBsIEQS/YA/VbTPF80y
	cwb/94vx3AN5qQdo68ebFIVObkchrP7PFQJP4TZs6aWAttA47r203XoW3ZS8P9/lI4dW8L2pYZH
	rtfRtkHY0xFkNazjzyb86iSZI+mWQAlwsT0bcguCJKUcJBNFrJ2YEU18uoO0JN2iWnb93NHhH55
	3HJqPSwRvEKn3wnqysqUuf3xH5e15ltjrSxWQwuQWDqK6zdaTu41CO7BJ3ehnQyip91V9DDaPqw
	hjCW7kxRvjE+c1aBaxIUW3XthcsS9JruQqbJMkJaWrG1cFJtk/XgFgd2CtvzNJy7msbMoCPy/ls
	XEmomzuNjjHKHu/jinaoY+BXY=
X-Google-Smtp-Source: AGHT+IHAVhgy8qwVxnmKKQakOnSpsu9+LWtGmEEWvfkpMd1GWPvJeLC1TFrAVNVg4WVailn0SarxcA==
X-Received: by 2002:a05:6000:2283:b0:3ff:17ac:a34b with SMTP id ffacd0b85a97d-4266e8db451mr32514f8f.42.1759856806560;
        Tue, 07 Oct 2025 10:06:46 -0700 (PDT)
Message-ID: <5f2e6f4e-cbc9-4705-8817-366790717164@citrix.com>
Date: Tue, 7 Oct 2025 18:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] cirrus-ci: add json-c for libxl dependency
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251007161333.89190-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251007161333.89190-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2025 5:13 pm, Roger Pau Monne wrote:
> Add json-c package for libxl usage.  At the same time drop YAJL.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Would be nice to have for 4.21, so that we test with json-c instead of
> YAJL.  I plan to switch the FreeBSD Xen port use json-c for 4.21.
>
> All seems fine:
>
> https://cirrus-ci.com/build/5366905441091584
> ---
>  .cirrus.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 7df7ff552222..0de1012d8c60 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -50,7 +50,7 @@ task:
>  
>    install_script: pkg install -y seabios gmake ninja bash
>                                   pkgconf bison perl5
> -                                 yajl lzo2 pixman argp-standalone
> +                                 json-c lzo2 pixman argp-standalone
>                                   libxml2 glib git python3 libinotify
>  
>    configure_script:


Comparing before and after, we've got:

- yajl: 2.1.0

- Number of packages to be installed: 27
+ Number of packages to be installed: 26

So, json-c seems to be in the base image, but even that points to it
being a more popular library and the right way for Xen to be moving.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

