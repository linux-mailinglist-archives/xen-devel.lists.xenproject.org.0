Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D5A26062
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880903.1291001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezUX-0006Rl-RM; Mon, 03 Feb 2025 16:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880903.1291001; Mon, 03 Feb 2025 16:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezUX-0006P9-O2; Mon, 03 Feb 2025 16:40:09 +0000
Received: by outflank-mailman (input) for mailman id 880903;
 Mon, 03 Feb 2025 16:40:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tezUW-0006Oz-Ff
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:40:08 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86dcbb73-e24d-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:40:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so46700325e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:40:07 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f0d2sm164202445e9.30.2025.02.03.08.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:40:06 -0800 (PST)
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
X-Inumbo-ID: 86dcbb73-e24d-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738600807; x=1739205607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FdpQ9yTm5ilHVQusQIsD4v4qd6J2r7RIC+GIrQO1kKI=;
        b=X2nmZ9JF5p/Ru7wer3eVh/ajh8UaIAp+/fkQUQQf0yudjIGhNQCHyh2L+DAq9mQfGR
         4ujdRjZfssuyNCRLhZEzcTqNjK1B72LpDA4nwqVLENt/LczTQYX2ytptdBRIn1aopWzH
         ECWqOpac3V2EFawhx/I56Y2IEqiXtF5LEx81w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600807; x=1739205607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdpQ9yTm5ilHVQusQIsD4v4qd6J2r7RIC+GIrQO1kKI=;
        b=TOxsfnGEaBrzqMDbmeeSjt06LjcvF6i2VqFiEoKSI4urFB/UK8kqIW/RCXgsur6ZOs
         +DIucnNOlh3KRv4M1ibd+xKQePKTtPDn1BVzfxnSm6V9TI+d5i7SAIkUvIjoDL94tk8c
         K8ifV94u7bFjVCzvcjwCDGRXN+RAoRkExR+Tq9fqqIe7EU4evDj/VH7GmZk0kUcgYhUp
         LtQBXbuYmZiUdDS3mrBIUkZ7uZSCGpY7phglciLQVoUOkc/JlPp4VrfU3BsoniH8QLD1
         AxVqNcPwmABgJnpsp1UIsJvs/cFCyEw3UdCnbc9wrzt4FWsVWUWO6lxo6AXoMt0Tj6cS
         aiYg==
X-Forwarded-Encrypted: i=1; AJvYcCXKT380heEaBOYrr7yTKouw3Fw/IY71sPvKQrad7BGc1ncoe2Tp6BZD/Gdv30A+d06Ont1lCiO4b4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJPC56W7pFCX1i1pwW7J/xzGdoxuDW0VmOBh+uM3khp2k+aL1t
	lPzeT0Y23JlDUrgWHjmuckAW+5OjTIjKjb0QWDcS/4OVgfXygTpl/ON5Y5YHH2Y=
X-Gm-Gg: ASbGnctwkSJ4t4QyWGZ862Kz22DTqKoXGguHU80VJge/8U8EkGyUUGVgbnmvQ4zt0zz
	prXYkAnFCGWhu5cUfWk1Hz590WEAhIB0Bb0q5lySk+pFfHyBKDfBWxQLHWf8gKudENPgZAswSYU
	3pWTfmU3CrYdB+s3qk7568oGSdS3nNUvyX1FIIUgvUXcJmT8SA9v+det5Q520Cw8j/JxY4dHAnG
	UVCGjjSGt4ZhIFQGTDPvu7lY630XcunO3NPE/U8/QAZdVnlEv7k/rPR41OaCTcfjbIr+VoEKUdz
	aqSVG/difHxIcw0vW1bUry3gHfiplavgGgKtb5l3rxOfANDr1xbvvcc=
X-Google-Smtp-Source: AGHT+IEMPeTaUoU3GyO7fKiWkqjNeiia7zMNnViFiqAk94HA3719s+NKZhpqcx1qAneYevucoWAuvA==
X-Received: by 2002:a05:600c:4e45:b0:434:f623:a004 with SMTP id 5b1f17b1804b1-438dc3ca1d7mr213851305e9.16.1738600807009;
        Mon, 03 Feb 2025 08:40:07 -0800 (PST)
Message-ID: <e4879cc1-bf71-4da2-9ec6-8ae1b045dcfe@citrix.com>
Date: Mon, 3 Feb 2025 16:40:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 4/6] radix-tree: drop "root" parameters from
 radix_tree_node_{alloc,free}()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <c68586ea-9e6a-4922-9c33-1691bd26931c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c68586ea-9e6a-4922-9c33-1691bd26931c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 4:25 pm, Jan Beulich wrote:
> They aren't used anymore.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

