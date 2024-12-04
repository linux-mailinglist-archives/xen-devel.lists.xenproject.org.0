Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A809E3ACA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 14:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848554.1263404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIp0q-0002hX-7o; Wed, 04 Dec 2024 13:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848554.1263404; Wed, 04 Dec 2024 13:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIp0q-0002fs-58; Wed, 04 Dec 2024 13:01:52 +0000
Received: by outflank-mailman (input) for mailman id 848554;
 Wed, 04 Dec 2024 13:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8ZW=S5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tIp0o-0002fh-Qn
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 13:01:50 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec9304ba-b23f-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 14:01:49 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cf9ef18ae9so1523496a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 05:01:49 -0800 (PST)
Received: from [192.168.86.29] ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c2b9csm724719566b.9.2024.12.04.05.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 05:01:48 -0800 (PST)
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
X-Inumbo-ID: ec9304ba-b23f-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733317309; x=1733922109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OLpOkLrWRhcylB11s7d1FGp4TC8CC1YgVQyvnX1mE+s=;
        b=JKw0Sm9MJueXkV965Esc+JttcQYza4wKr7fFVFaQ+OXeJVOgi+5j+Wnwg6FRCZ02l+
         C7Vq55W2IBlt0YHGP4r1xsHtt3py/P1W/8ziIM4cFAVuj/WRiF2pV4A2rpdv6D+L+NXH
         90WKBTmi123WKWUAoukqft7BnWzHFNWmgw8/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733317309; x=1733922109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLpOkLrWRhcylB11s7d1FGp4TC8CC1YgVQyvnX1mE+s=;
        b=NvyrovyyXw6SXBnOlzxVY0fduP2+33W7IPhJ+ArFLZPBppKz2Hj0oA0JCgMMsncpgk
         x5n8gF3mfAWWhMFhQvuXaLyy1RIsns1Mz+7U5uRXbXuc3jWrfwU3F5H9nZnT7Y2ARtSI
         yZ04kZDGvHrL+dOrAVcDsLDWIJmlJd0i4dGNDj+w7gJChuGAvdipXxs1XQL/ftGdReBu
         DS1cRixDOggOwVW+Pg7hrxMO1FDegw+kc//YO72F4i8pE0p+cS55yERSMBl5LcK5kUkD
         kSSlBrCQ9zQJD9zcXqWeh6jWW+vkh43053Smdnf4etNjJrBCNOnrgvYpcf9QQpjOrG4z
         RK7g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4nXbbza97ek6CtcaqgQll70UUhGtsvd5rRBd2JQShbH1EIp2WD1p2p9HYB9axGK/dntSjFg24ak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRfVmwnkaun5Vw4f7d8X1NcevaTVFJpEBQ0RblP6J4PaSs/kg9
	g5/2+yZZ2qQ0ZBhu9jMEj0cbs+8nMbmiWlU2GYssw5CzFKnbAXaEBjKAPupiTGw3ylGFQ+7cdmr
	LnbQ=
X-Gm-Gg: ASbGnctzXFm78ybfVAbXl3VIIFMfvh2UD0CHWQmOAXh/BQsI8Zp0UhKB0jzSRohynT8
	nMg9lPePb4mkcTugA6iBR0RPV5XjNUSDvJkjGv5kOJmDbRhdEBeqS3ZG7t3AxZHyvV9SDG5HhQb
	P+YOhsjXh3IyWxHTbWctAVcXeMGQbVTmt7oShdwC3fNyU12kInfkS2qSYcU2fU7T4iiEx4KVhnN
	zoEspT4neFX252LBaoepL7YfxnXY+0pXH/nhrS6CPpKLbGSeAC8lOxPw9ybvys=
X-Google-Smtp-Source: AGHT+IGFwBxM3nG2Ci1SHXGSm0Cqv0F3jp30ABIdO+QSn/hOyhcbHUxTLI2z5H3HeEv0hJk9UqgQsQ==
X-Received: by 2002:a17:907:3f96:b0:aa5:55b6:8080 with SMTP id a640c23a62f3a-aa5945353a1mr3218607666b.12.1733317308478;
        Wed, 04 Dec 2024 05:01:48 -0800 (PST)
Message-ID: <79004c19-7e55-4623-86e6-badd165b1d30@citrix.com>
Date: Wed, 4 Dec 2024 13:01:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/hvm: Use constants for x86 modes
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2024 9:49 am, Teddy Astie wrote:
> In many places of x86 HVM code, constants integer are used to indicate in what mode is
> running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these constants are
> are written directly as integer which hides the actual meaning of these modes.
>
> This patch introduces X86_MODE_* macros and replace those occurences with it.
>
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>

As fed back previously, these are (mostly) not modes.

"Mode" has a specific meaning in the x86 architecture which is not
this.  You are going to have to change your commit message, and choice
of constant names.

~Andrew

