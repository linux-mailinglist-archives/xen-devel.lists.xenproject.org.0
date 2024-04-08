Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE589BC71
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701879.1096459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlkk-0008Ff-FH; Mon, 08 Apr 2024 09:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701879.1096459; Mon, 08 Apr 2024 09:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlkk-0008Ca-Cg; Mon, 08 Apr 2024 09:57:26 +0000
Received: by outflank-mailman (input) for mailman id 701879;
 Mon, 08 Apr 2024 09:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2aee=LN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rtlkj-0008CU-3Z
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:57:25 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64c5099d-f58e-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 11:57:22 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-78d575054c8so100835985a.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:57:22 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vv20-20020a05620a563400b0078d632edfd4sm1238673qkn.14.2024.04.08.02.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:57:20 -0700 (PDT)
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
X-Inumbo-ID: 64c5099d-f58e-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712570241; x=1713175041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o4Y7ls6k2FQQRv3VGW2KKfHMGLoL5vTu39zdhaowL/w=;
        b=WQN4oJJDjEyB0gqTbG2ZAbslp/vnuqt96EcyvGLO9JXNqNmfb7AHZd3weAQlXkiBmG
         Y5DBdKg4hXHONg4XwIcM3GBAc/ddOAKOX0cxl4FawT34K5kAmGCA/kBviUK0q2c8vmND
         3xQ41BlDYb+0BMGfh2PXdH5+zSPPaMhpG7czg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712570241; x=1713175041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4Y7ls6k2FQQRv3VGW2KKfHMGLoL5vTu39zdhaowL/w=;
        b=AOwC5KtVtWn1QFcTBQsjGVGry7S7h8W8TZAwl3w4UxG960OlejWhrFN2tieKuy4gYg
         F21M9EmtJIm0BNhCA/q8i39b9BHrb4aNLCe1s5+qDvtHPXHb5Mn3SYRERM6t3FP4EI3A
         JzTQqrrs1oLuEnDt24a5138EeVtjyqoAwiHmkRj+nnWJtEXi9Uc55OkohMfKuZ1m7mZi
         fCxx0zraZKmuz3Fl2p8xg/7hOPiaZxtT/iQ/47iVIk6vuN1g8Yd7gC12AUlYaH8XrjvR
         cHNjp8Kmrj4XxMt/O2UB3gQwa5rnXfXyob5YXzP4AF+nk/Y2rh32U+LeDtOXxeNrxxf+
         hNPw==
X-Forwarded-Encrypted: i=1; AJvYcCWT26sLRVkGqYJkfa3T/FEoH2OQDJk8GeG/Fsfd2jyiCLfifjOJalV3rPcAE8obXFfEFgGvkZ7yaLNjs/AaN1X3Vgo8syuAUr5Rx9YqUiI=
X-Gm-Message-State: AOJu0Yy6kUNFyNFjWke9RMoDJxw/gaFaBp4RQ+ntZ+jDKf2eWgNjDYm/
	0yevvf3ejMviHkUzroUQyo1bdj1W87o6qpJd3VniNsed7vccr1VTKlGa/9cI/IE=
X-Google-Smtp-Source: AGHT+IHroqRrlrsPzfZvf4RzCi4YpeqqTMBRAkqmDfCc/WoqUnSDUAAbhrRHyVo4eT4HPp/a0ljZFA==
X-Received: by 2002:a05:620a:cfb:b0:78d:3a84:5ae8 with SMTP id c27-20020a05620a0cfb00b0078d3a845ae8mr7782957qkj.65.1712570241510;
        Mon, 08 Apr 2024 02:57:21 -0700 (PDT)
Message-ID: <8382517c-7516-4f40-b508-fbd6e7f1e65e@citrix.com>
Date: Mon, 8 Apr 2024 10:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86/xen-ucode: Introduce --force option
To: Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240405121128.260493-1-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/04/2024 1:11 pm, Fouad Hilly wrote:
> Refactor and introduce --force option to xen-ucode, which skips microcode
> version check when updating x86 CPU micocode. A new hypercall introduced
> with flags field to facilitate the new option and allow for future flags
> as needed.

It's worth giving a bit of background for reviewers.

Basically, my "ucode=allow-same" for testing purposes has proved
insufficient, so we're wanting to replace it with a "user knows what
they're doing and gets to keep the pieces" option instead.

Upcoming is the Intel microcode-revision extension, which has different
implications for Xen than it does for Linux, by virtue of our
proto-support to re-scan CPUID and cope with new things appearing.

Also, while not a consideration for this issue, it subsequently turns
out that there is a microcode bug on Gemini Lake CPUs for which
downgrading the microcode is a viable and practical fix.

In all cases, having an ability to say "trust me, I know what I'm doing,
really try and give this blob to the CPU" would help in some corner cases.

~Andrew

