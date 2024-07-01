Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADA91E3EA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751805.1159874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIpo-0007MF-52; Mon, 01 Jul 2024 15:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751805.1159874; Mon, 01 Jul 2024 15:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIpo-0007KP-27; Mon, 01 Jul 2024 15:20:52 +0000
Received: by outflank-mailman (input) for mailman id 751805;
 Mon, 01 Jul 2024 15:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypwj=OB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOIpm-0007KJ-M3
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:20:50 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef83f39-37bd-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 17:20:49 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6b5031d696dso16711896d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:20:49 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e613c82sm34080486d6.117.2024.07.01.08.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:20:48 -0700 (PDT)
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
X-Inumbo-ID: 7ef83f39-37bd-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719847248; x=1720452048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyJI4RuSOKiRBGBoMY/1X2h1xsUsszHhpt/vMx+eiNw=;
        b=v1Mq7GUECRFWkG6Ij7jjLeM/XQC58kK3hb0xPPPLaeH1FCkJJmUcpu5QQTTETggNGP
         KJbnGa63GHL4/yDkXtItEhUBGOS+SgYevq7qhxjbUHsIrxHZGE3+2MGCNY7EKIWHkXg4
         QwxqOvVUZwERnObaHtwiXq2qEz7G1uBudnPD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847248; x=1720452048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyJI4RuSOKiRBGBoMY/1X2h1xsUsszHhpt/vMx+eiNw=;
        b=YEBeJLWwCafNikVCE0Z9yJJQNPXlb/F94nLpDZz0NwpsYxHIZvgmeA6hjtNGBS7XzL
         Ylz2d8WyIZmYC+uFPx/i81EYxNB4i8iQlvmw+j3dt5D9n+27twhU3cn8OOZSyAneFl87
         Bw6FfaJ0tgPaKema/7hSX7kYKAJDo+FjDx817142FcRnmEIJv0Pu1+7TowPpH+p+r1fk
         a0PVQ8RvUXwu9FYqiJ2oPQHD90T0O+XVw/1r+ZMGTMAySwg0D8Hw2oJtSxJxth+tIaUy
         9f8Xd+3pTcO3DC/4na6FXeWspi7cuOhkfQa/MctU3EhR76oobupDEDjLbHQkJn0XvGoR
         nUbg==
X-Forwarded-Encrypted: i=1; AJvYcCXzh0SYfUiZvtFjgT6F6eT0XuJU4wXIVBo7HAnoyODa9tHY5Lsja9T/9mX8R/1amfpG/b5A0GqKL/+Yfmm4O1IAnkVxTR/jY3fxAPIGGr8=
X-Gm-Message-State: AOJu0Yyz96De67ZrUeDMap/YWhNSYazUYYcyQjSAwih9WKsRHfhagqVZ
	TAZrKTNX11RICxlQMqQlowhtyVJehl3qdY1nb/KnTnUL46n7Ip+Khch+uHaygmM=
X-Google-Smtp-Source: AGHT+IGaltnMPP1TaKeIBc0BgVSCFr45BgPw+2TqCDmhq5Rqn3X+rJmZfPthmV/WNk+mKkC7quKLRg==
X-Received: by 2002:a05:6214:500a:b0:6b0:74f5:8b1d with SMTP id 6a1803df08f44-6b5b70b6606mr72739166d6.25.1719847248597;
        Mon, 01 Jul 2024 08:20:48 -0700 (PDT)
Message-ID: <6231910f-b4c9-4604-83dc-c53e53d30409@citrix.com>
Date: Mon, 1 Jul 2024 16:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: add findutils to suse images
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240701151512.10187-1-olaf@aepfle.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240701151512.10187-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2024 4:15 pm, Olaf Hering wrote:
> The build system uses find(1). Make sure it is available.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC Oleksii.  This is probably non-optional to take.

I suspect it means we can't rebuild the OpenSUSE dockerfiles any more...

~Andrew

> ---
>  automation/build/suse/opensuse-leap.dockerfile       | 1 +
>  automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index 3ef33458a0..1344cbb0d1 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -20,6 +20,7 @@ RUN zypper install -y --no-recommends \
>          dev86 \
>          diffutils \
>          discount \
> +        findutils \
>          flex \
>          gawk \
>          gcc \
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index a793601c87..2587a3fa4f 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -18,6 +18,7 @@ RUN zypper install -y --no-recommends \
>          cmake \
>          diffutils \
>          discount \
> +        findutils \
>          flex \
>          gawk \
>          gcc \
>


