Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA7AA0C19
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972504.1360853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kPp-0001Ye-Mx; Tue, 29 Apr 2025 12:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972504.1360853; Tue, 29 Apr 2025 12:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kPp-0001WK-K0; Tue, 29 Apr 2025 12:50:25 +0000
Received: by outflank-mailman (input) for mailman id 972504;
 Tue, 29 Apr 2025 12:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9kPo-0001WE-FL
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:50:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84185e2e-24f8-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:50:23 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso37465425e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:50:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e0241sm188940335e9.37.2025.04.29.05.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 05:50:22 -0700 (PDT)
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
X-Inumbo-ID: 84185e2e-24f8-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745931023; x=1746535823; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SLGZoAC2GDBsjIi2XWp1JTPEcBHD8CD6AameulPUcFE=;
        b=B75l07Lpet6aH2zF0I1cCneXPcJ5NVQlCSYqltYV3OwSjpS6DtFJXxsmRErBtrwJwy
         iyFl+yT6gd80W83XPyeP3vtmTyo/FHciwlqSPN1o3DIn4ZYy255aV46pMN0IytadeaL8
         Vr9W6dldNtA4GcDeJ7HqKr5wMAxZnlAwyo4Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745931023; x=1746535823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLGZoAC2GDBsjIi2XWp1JTPEcBHD8CD6AameulPUcFE=;
        b=rplWyip5eTdREhrpQsybwa7WFveBiWeouuodytbmOYZxtIRusDgVNtOqNQL1XqyzqM
         XaTF0JMVIs9OlUqpC+xXaO7hy2fCKRruorRhzIOT4584uh7QirKcgJMskqcZCjM7qXuC
         FthE4R9JXFgIYANv3lPE0/eX0gI2VJ0R87WdflbXPHO7NfxvHxvGNwWf4wDr4UdaOVef
         /w6ZWsbdzTox0wNKFygTkWE/rEz6XzxMaBlA5LPAaS8SEEWnDa8KCQk6rSzPxXSSnNgB
         D06lkoR1TsN2m0kidF5S8nM/Xw7FZVm1og3s8K1cho1J+c2Dw66A2l9gaZVn04qXRAxt
         1xdw==
X-Gm-Message-State: AOJu0YyV7ULY2Hvbvnn1TaSbKJoZLptFTtd03A0DmYCvsv5aLOk/bsWM
	wzPYP2BJDUaRL6TgncII5ZmYnxV9uCihv03RwL46JDUDE15NyAjoJYMpe9At2Xc=
X-Gm-Gg: ASbGncskILf2FExZVO0/+I6NdKruFxVxp92+Wqi9QOi1nS2snZJpl+RNxar07xty0Ox
	6RqVQBpXHeos4CiGv5H0t34kz28PFH5zokVot+9jrava4rBQflR/1xw1Mk0DMZuaPVVZ/Xoy/79
	97BJB0d0X/X2HGC3jLUnSlCGrBcifHV/axmfUArqJ4/whMmvoXVOeoGucWrqh2nLedyXvaTwZ6Z
	vTrsSzO5GBzGIF5GdOP+WVPbTxfAyP/LNid1R06Phc3u6tvr5WuXo8GhzL1qvYfiWcEVSG8jgGp
	s6LhFGt+/aWporF/M8pNa60bn1Ol1BP6T7EIyrLWxZdpJUNDFMpVZRCRJowLOb/LQqfBmN/+MGQ
	fnJa3gw==
X-Google-Smtp-Source: AGHT+IFMcpCJm59F2DuUWOTGMNvA9+uSYjikxhK6hO9JcF96PyyjnriBpmPTmQHNM0IOMEpf57B0xg==
X-Received: by 2002:a05:600c:1546:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-441acadeaa5mr22889945e9.1.1745931023092;
        Tue, 29 Apr 2025 05:50:23 -0700 (PDT)
Message-ID: <0f5887d3-052a-40cb-a8cc-14c7e6838ba8@citrix.com>
Date: Tue, 29 Apr 2025 13:50:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS] (Re)add libgcc to alpine rootfs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <JBeulich@suse.com>
References: <20250429123643.230423-1-andrew.cooper3@citrix.com>
 <aBDKijzZMEUopmSk@macbook.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aBDKijzZMEUopmSk@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2025 1:48 pm, Roger Pau Monné wrote:
> On Tue, Apr 29, 2025 at 01:36:43PM +0100, Andrew Cooper wrote:
>> It turns out that QEMU built in staging-4.19 (only) depends on it.
>>
>> But, GCC can emit libgcc calls for arbitrary reasons, so include it
>> unconditionally.
> Is there a fixes tag for this, or it has always been this way?

Fixes: d18d7eba888e ("Shrink the rootfs substantially")

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.  I'll get this deployed.

~Andrew

