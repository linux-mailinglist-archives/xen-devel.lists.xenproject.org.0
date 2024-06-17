Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE78F90B483
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 17:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742493.1149301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJENO-0006aF-VO; Mon, 17 Jun 2024 15:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742493.1149301; Mon, 17 Jun 2024 15:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJENO-0006YG-SL; Mon, 17 Jun 2024 15:34:34 +0000
Received: by outflank-mailman (input) for mailman id 742493;
 Mon, 17 Jun 2024 15:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJENN-0006YA-U0
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 15:34:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b37d18c-2cbf-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 17:34:11 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so561540466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 08:34:11 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb7438a18sm6500989a12.82.2024.06.17.08.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:34:10 -0700 (PDT)
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
X-Inumbo-ID: 0b37d18c-2cbf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718638450; x=1719243250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kau6RjO1EJJYBkiTGtGs2LEHEzcR7Sfp+HbdphasrAU=;
        b=rdgsZd5teoNPA/j/tMNk1pOF7jVbyts5hjis7W33M8qxwrz7dknUKCxTzoLYi8afbn
         4Zmmk9UB0Gcnui6mdkFQ+jEjizcIYLxEC5u3biwiXEAxRKDxYwFJulpFGVd3o/+giv/F
         fiSiVVn/Aeby7BeBq2oO8BPoV5SpZZYYIdXtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638450; x=1719243250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kau6RjO1EJJYBkiTGtGs2LEHEzcR7Sfp+HbdphasrAU=;
        b=gR96O18VjGJYd/YWWxIUNWGwD04XEF6+X2aJiKGQ2pwKBXsULlfNG5DoicpDAV8pvC
         rYw/09q6n2hJ+IBP0P886IfINSBn3WTAkwR3ht86Iu5KGyYQtNby0qqj3UBQlrxaa7cF
         1lHPWMPX1ebJFfaoQAnf9AC2lmAY6JNn7bsG3dSExyACWL2GAIPNKPBXaNU3zp2ajDit
         sU7F54ErHAGioyVG3J1BN1PMpaODVyJ45f2mtsFFNM1emVndfVDd7mJNlgn2TPtEQdcl
         YpxvytK+ECSLP/ixaWSGy2ssfwzPDO8RQmYcgap2ncVTIiq7cFoRwhbwgDiM+O9Epsjq
         rGLw==
X-Forwarded-Encrypted: i=1; AJvYcCVp9Z6BJy0X4unASyFgsRjeFkShers4vFqGl36Fh5OIGMPb6GIT38Gt30WXTWmuC2YKDLYHdxZ7AO4utncOFz0MbQcr7FhlnPBeAYNgono=
X-Gm-Message-State: AOJu0Yzo3StLoRqU1OCfkvYqFCDlNmfCx+Ifj/NNA5Ws480z5qoHJGHt
	RTpV4AwZFsA7xSNpIqB8IcZvmZmhB+jm12e3AUYgMG+LeSKHgxAba3xMCWtRnpI=
X-Google-Smtp-Source: AGHT+IHOuRP1n1WsIiXO/pAVmXfGzUoNYbcVUQBHo+wA+r1uywdzBQymQfjmzIOxsXjULY/L1xWyDA==
X-Received: by 2002:a17:907:d312:b0:a6f:7d7e:ab0c with SMTP id a640c23a62f3a-a6f7d7eabd9mr328638166b.64.1718638450620;
        Mon, 17 Jun 2024 08:34:10 -0700 (PDT)
Message-ID: <a65a83be-1236-4699-8124-c0bd809c4b97@citrix.com>
Date: Mon, 17 Jun 2024 16:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OSSTEST PATCH] preseed_base: Use "keep" NIC NamePolicy when
 "force-mac-address"
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20240617144051.29547-1-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240617144051.29547-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 3:40 pm, Anthony PERARD wrote:
> diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
> index 3545f3fd..d974fea5 100644
> --- a/Osstest/Debian.pm
> +++ b/Osstest/Debian.pm
> @@ -972,7 +972,19 @@ END
>          # is going to be added to dom0's initrd, which is used by some guests
>          # (created with ts-debian-install).
>          preseed_hook_installscript($ho, $sfx,
> -            '/usr/lib/base-installer.d/', '05ifnamepolicy', <<'END');
> +            '/usr/lib/base-installer.d/', '05ifnamepolicy',
> +            $ho->{Flags}{'force-mac-address'} ? <<'END' : <<'END');

The conditional looks suspicious if both options are <<'END'.

Doesn't this just write 70-eth-keep-policy.link unconditionally?

~Andrew

> +#!/bin/sh -e
> +linkfile=/target/etc/systemd/network/70-eth-keep-policy.link
> +mkdir -p `dirname $linkfile`
> +cat > $linkfile <<EOF
> +[Match]
> +Type=ether
> +Driver=!vif
> +[Link]
> +NamePolicy=keep
> +EOF
> +END
>  #!/bin/sh -e
>  linkfile=/target/etc/systemd/network/90-eth-mac-policy.link
>  mkdir -p `dirname $linkfile`
>

