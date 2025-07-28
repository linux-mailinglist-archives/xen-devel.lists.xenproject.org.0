Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F0B1392E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061276.1426800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLMe-0005Ot-Pw; Mon, 28 Jul 2025 10:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061276.1426800; Mon, 28 Jul 2025 10:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLMe-0005MB-M6; Mon, 28 Jul 2025 10:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1061276;
 Mon, 28 Jul 2025 10:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugLMc-0005M5-Qj
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:45:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06676b68-6ba0-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:45:49 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45610582d07so27222365e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:45:49 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587abc13b3sm97785875e9.6.2025.07.28.03.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:45:48 -0700 (PDT)
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
X-Inumbo-ID: 06676b68-6ba0-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753699549; x=1754304349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c2DchZiNSLQ1StxfmdwWvlijI4t8cVjnInUAYodZV18=;
        b=rMGU+dqe2GK8N0D0n7IpqH8jsVmkI2Rb3uLA4mq/vx3kwb4QTJ/0pXyxXH46CZVvdc
         +EDf2cTXn0Pgifl0FXqDvSH7ImNULDr0EbPyw5zSvUeghMgdq/3kdSyENrKXkpv0csSb
         hWsQPub/pDShTDiLXKuuNJ1ueSAHF3QlQtJjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699549; x=1754304349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2DchZiNSLQ1StxfmdwWvlijI4t8cVjnInUAYodZV18=;
        b=wMxd+0LnnKY6Cz4kMTqhDGdXekZyD4CZhklgDxyvYLZx5A6dl8kBrayA19A+GT0OX6
         nN7MHTDheGY2JLhv3RFRj04gXzgj6weG4Kij/MJYeZfpkN9zC7Fvs75wRfFd6rz7gcFR
         zyFBZwEuRoxUiJHVxT6+9jGxkIrELZyuq6gdITbcz1o780GdadBgYsEFQkttglC043Vn
         8yPtpmMNnDc6mlL9qw3f2FbsBr1B6kh4fCjaujLnom0abX/RTWMUmidvUvPZypTlTGXH
         r71z3dRD964k/ddnRcjf/z1nJbc90L/j8/0VlL3ikoLgEHfxQL/UJB13a59Pm6YS5/P9
         Mdag==
X-Forwarded-Encrypted: i=1; AJvYcCWyFBMVEdGtS0+zKi3UH6iZhSpEUkH9D/+FKG5htLs44qy+tXMfI4/0SNEXdg0aAFzCTSNjy+pnOEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2httDa4/QeEx57j7sHU8IGc+8lubLVatkDA8PPHMLFdjPDeSg
	zNzYIC7OXSlmUXpfcgXRr2No0/VqWvw727ZYkvl2AwkEm6OM8rJRID2CZkck0ss5IhA=
X-Gm-Gg: ASbGnctKfmkJwzd2XRzEvs7FjSkmhQbMBh+X2JXvyvkwwTq/iX/BLHbM9MgD1urrNHT
	LuAOQc+QLRmXi6vifmIAwp1BThMKL5pdeiGcQqF3SkK3LNrrZ1iIjIWJRZlqOZDWlCH2TpRx6Q/
	30qTr7083I0eoU0IS9RlhtP/lw2zK4w+L9ivvGorSWwoX1o/XtBLKDm3LWsSy2aipxpvwTwmK3l
	ZNUkyDRJz+4gbPsFpPgXCPPAiZOoIRwpuptcuatT4oPaVXsO0p7o9LaHjGHRwsHmklhLh+fa5At
	IF5z94/4F7c27f6BOxoCXj2ln/lp2MxJk72cdf0Aloizoz9UC0XuZQKMIklmurXmxFfBV6+XPW6
	+LmyyB1D6ZvvoBhQBlklNfwE3Xn0LagGhfOiYD85IqTnkaX9670BpW25ovP1Q8MfQjyWN
X-Google-Smtp-Source: AGHT+IH/KC2VrhWW3smwvzdCXmtYkqdvtOpW+Nxhz963aNRGS8ShUpdIX0JmJmnDrY0ZxG5pZ4Cnzg==
X-Received: by 2002:a05:600c:19d1:b0:456:eab:6344 with SMTP id 5b1f17b1804b1-4587631448fmr109305525e9.15.1753699548880;
        Mon, 28 Jul 2025 03:45:48 -0700 (PDT)
Message-ID: <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
Date: Mon, 28 Jul 2025 11:45:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 11:24 am, Marek Marczykowski-Górecki wrote:
> When running xl in a domU, it doesn't have access to the Xen command
> line. Before the non-truncating xc_xenver_cmdline(), it was always set
> with strdup, possibly of an empty string. Now it's NULL. Treat it the
> same as empty cmdline, as it was before. Autoballoon isn't relevant for
> xl devd in a domU anyway.
>
> Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdline()")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> So, apparently the "No API/ABI change" was a lie... it changed "empty
> string" to NULL in libxl_version_info->commandline. Quick search didn't
> spot any other (in-tree) place that could trip on NULL there. IMO NULL
> value in this case makes more sense. Buf maybe for the API stability
> reasons the old behavior should be restored?

Hmm, I didn't intend to change things, but I also didn't anticipate
libxl__strdup()'s behaviour, or for something to depend on that.

While this does turn out to be a marginal API change, I think your
solution is the right one.  I do not think it's reasonable for there to
be one magic pointer that has differing NULL-ness to the others, and
NULL for "no information" is the better interface.

That said, is the other use fully safe?  I can't see anything that
requires sprintf()'s %s to detect a NULL pointer and not crash.

> PS I'm working on a CI test for this case (and driver domains in
> general). I have it working with Alpine already, but it wouldn't detect
> this issue, as musl's regexec() doesn't crash on NULL... So, I'll add a
> test on Debian too.

Excellent.

~Andrew

