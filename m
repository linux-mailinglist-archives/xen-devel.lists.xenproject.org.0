Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF2A6A65C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 13:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921960.1325798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFCO-0005NA-8V; Thu, 20 Mar 2025 12:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921960.1325798; Thu, 20 Mar 2025 12:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFCO-0005K5-51; Thu, 20 Mar 2025 12:40:36 +0000
Received: by outflank-mailman (input) for mailman id 921960;
 Thu, 20 Mar 2025 12:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvFCM-0005Jz-V0
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 12:40:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83369074-0588-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 13:40:32 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso5210785e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 05:40:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb8c2sm23204056f8f.85.2025.03.20.05.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 05:40:31 -0700 (PDT)
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
X-Inumbo-ID: 83369074-0588-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742474432; x=1743079232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=heSHwGoQB1NZez0vymM/u3z76sGUjl1+SrU5Islp7Cg=;
        b=g8/OAdKImwQ2Txm38W3e2EB9069U2ByLNacUCBwUwlTWjrE7BauvfWPLMltFNGgtlk
         4FSD6DE3bEn0n6Dsd+bsRaxGGPsfm2jD5K6AtS7vxDxD+wpAezHyvejtcfPmnZNqclvo
         BD83CB3di9yFYAojAQ8VhpxXVa0FRICr9wf1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742474432; x=1743079232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heSHwGoQB1NZez0vymM/u3z76sGUjl1+SrU5Islp7Cg=;
        b=sfpXezpE2LRC6QjV7jQ8RZuU77fqFbNH0TESJTuRYynZG3NZY11SnP51HL3KoyWOdI
         dlnFq3v/ONkRJFLiv3aP9XD3VcoP5M2c1vtB0l+z/CKVD00mFPDJ6++09/gxd2yADALN
         aBHN7HH9W8XaqZjUBkRjHOTDkbz6GViQ3T/M5CQcXsONOEYtuZkSrTWmU4uOOeiq4pm0
         EINXW9/HW5RX5im118FnOsO/u0cAbTskBc5LUXhAbY13/hPN6N+Yjf+zjmD+Rc1fFEWV
         FaYw3k6avbeLCjhaPoL2T4Cya7NLHjHHFgVteAk8pg+zLDew0VavjXZBYjvUGzyS6DB7
         yKxA==
X-Forwarded-Encrypted: i=1; AJvYcCVATE0l3PmLqty2NbqA0UxLpKWJCYb8dcI2QshI+P8fYFZrNZcFIW4MFWlD3yhbGMDQ0QLHeYiOHlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzneCQD+rfGN8Jgzesne0mdFTLFmogJK4JEQVlv2GYp5ygrfniS
	o1yAVp0Q4an0LipX4UDRiFd/cotMexUeMHFzC/tZBy8avmcvq8w5rcwK0MhZ2Ho=
X-Gm-Gg: ASbGncvEYVD86/9jrFz/Xlzl+bQ2PXjMwDmPJLsE2DzzGId8q7T/2owLl+g2NeQcSsx
	EFfemCRD5InZjiL3JPrVyr0xd83kozC1ejauI2CIGnLy9o9U7WOYfb7bKRhvcRtLfDuu+0kMGHy
	McUy2C274Mf5+glZgIFTZdhggl77ABrZ3FUsptO8r4I5zaqEFU0MyXAysIHFLlO3lX7Kee0IvNO
	ROyINi9gOoCxpL+Cr8UEJyIspxCIZ4nv7ZewxN9vCQTfWxUxg7eepvBKiLmMolAgbEf3tdLl7C4
	1L+heAKQ7j3+3rZrGNwY92gbQQDo1QWj73SXC9n8lg/MEF8JFdPsU3O3jmqpEuvkWXY/Wqisktr
	xrLeGHvH0Ng==
X-Google-Smtp-Source: AGHT+IHeaAbzKUSeLneDkhGIQ/mziQAw1UXr/tS9jqp6rBbcBgLxK/FBWcv3lLMrVGMXpu/gQj0K3w==
X-Received: by 2002:a05:600c:8483:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-43d43782b8amr56949785e9.5.1742474431862;
        Thu, 20 Mar 2025 05:40:31 -0700 (PDT)
Message-ID: <0158ee4f-635b-4183-a2c8-edc5d3189b27@citrix.com>
Date: Thu, 20 Mar 2025 12:40:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discussion on unexpected behavior of ARINC653 scheduler
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>,
 Juergen Gross <jgross@suse.com>
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
 <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2025 9:27 am, Choi, Anderson wrote:
> May I know when you think it would be mainlined? And will it be applied to all branches, like 4.19 and 4.20?

FYI, backports of this and the xfree() bug have just happened, back to 4.18.

~Andrew

