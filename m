Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AEE7A2781
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 21:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603353.940314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhEvd-0002HG-Pp; Fri, 15 Sep 2023 19:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603353.940314; Fri, 15 Sep 2023 19:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhEvd-0002F7-NA; Fri, 15 Sep 2023 19:56:37 +0000
Received: by outflank-mailman (input) for mailman id 603353;
 Fri, 15 Sep 2023 19:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qhEvc-0002F1-CZ
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 19:56:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f84b3998-5401-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 21:56:33 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40472f9db24so23031845e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 12:56:33 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b003feae747ff2sm8303820wmk.35.2023.09.15.12.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 12:56:32 -0700 (PDT)
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
X-Inumbo-ID: f84b3998-5401-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694807792; x=1695412592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6TkOterh9fe1/HlzeIQ0N7U+46D332sSrYEkMg1TyLg=;
        b=il/AreYKsGeRf1yYEgm0o0u5EYNotf+JaJAl91kNezNpcihXaXPwVLpOZTOShMRj0S
         742HlGccilgspM0ILKF8MGYYiTtZDfBSAKwRPyvY5y/ffAsFwbsBdQfljaGyzRDbnpiC
         l8Ew0kEbh/0CwpaocsSwedcKFwEcWh2ER+xHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807792; x=1695412592;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TkOterh9fe1/HlzeIQ0N7U+46D332sSrYEkMg1TyLg=;
        b=kXWwYL0JIB/dIy44P60w0ZtpaqZlTSXhRVlpO760t23AhJ5hRgdMIbC5SRjVFdNslo
         i2UomkgvMxvb6+1qYGy0gMKCCpUymH50HgZk95Ry94k1zXOZWz07NAZgSyDKtMXZGgwd
         /kJ+EJ0aTtVJIPTS8anozcsQGN3/u4zmgUTkUuPaeKy6jXpErgVoC8Uv8Yxo0u0Uzyw5
         eIASdJLQCak3b373JME3Ok88oarkM7dRFsqE4pKSFnLv2WZ1pKce6Wd6y36dbRKeJwtj
         GlB5dN91HWoOYO7v1EXXpYthHeyqDuzTRR46jtrelRMwaqHCtc3zAnFKFrzHnh+z6nGh
         erSw==
X-Gm-Message-State: AOJu0Yx833WR469pOFW7a3UizMH7b9haACRAMQ5dEEhQr4oCUdrSo6Cr
	P/mWNcYSrpQdYhDErLN/jmmm7j8yuiCTf0fq11Y=
X-Google-Smtp-Source: AGHT+IHi3Z0KeKufclJhjdZShCARhE5XbkKO+ydt2pfOJUJbYhuyxjTSpzzJmfPJICli/DD4Twez4Q==
X-Received: by 2002:a05:600c:d7:b0:401:be77:9a50 with SMTP id u23-20020a05600c00d700b00401be779a50mr2285937wmm.8.1694807792569;
        Fri, 15 Sep 2023 12:56:32 -0700 (PDT)
Message-ID: <7148ecb7-f1b0-754f-ba1c-f8be18cf6bd9@citrix.com>
Date: Fri, 15 Sep 2023 20:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/5] x86/pv: #DB vs %dr6 fixes, part 2
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jinoh Kang <jinoh.kang.kr@gmail.com>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230912232113.402347-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2023 12:21 am, Andrew Cooper wrote:
> Slightly RFC.  This is the next chunk of debug fixes from the bug that Jinoh
> reported.

I was trying to do a bit of due diligence before posting v2, and have
made some discoveries.

pv/emul-priv-op SingleStep vs Branch Step
  https://gitlab.com/xen-project/xen/-/work_items/170

HVM IO Breakpoints:
  https://gitlab.com/xen-project/xen/-/work_items/171


A third which I'm on the fence about is about PV guests and General
Detect.  We firmly prohibit PV guests from setting DR7.GD, but we them
play with the DR6.GD bit as if it had been asserted.

It would be easy to put GD back into the set of reserved bits for DR6,
but it also wouldn't be hard to handle GD via dr7_emul and let the PV
guest have a more-normal looking set of debug functionality.

Thoughts?

~Andrew

