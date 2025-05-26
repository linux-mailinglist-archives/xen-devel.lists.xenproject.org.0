Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9FAC43A6
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 20:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997712.1378529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcNy-0003up-73; Mon, 26 May 2025 18:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997712.1378529; Mon, 26 May 2025 18:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcNy-0003tM-3l; Mon, 26 May 2025 18:17:18 +0000
Received: by outflank-mailman (input) for mailman id 997712;
 Mon, 26 May 2025 18:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJcNw-0003tG-4v
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 18:17:16 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b50e8d-3a5d-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 20:17:15 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so35578205e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 11:17:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4481ca9f2d9sm248745775e9.19.2025.05.26.11.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 11:17:14 -0700 (PDT)
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
X-Inumbo-ID: a6b50e8d-3a5d-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748283435; x=1748888235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uT7MFMIBahtSoJ63NquYomc3Bx/JlsKkNqQA0fqnIKA=;
        b=dJEX0RJxGZoBXx+jqxB3KEXqH36/23qCQpnaRItt6hVn2FlrxpfA9p15zacqheDoU6
         AGDAONfqpjf3xrVz5xS/WnzvzP83GRh9JnA3qDC3AFodVJ9UEn2PeakHBUsTzH1V5FPY
         DblwLtWRpX8DtaSKFP2CGlTJDbYd09gjr43Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283435; x=1748888235;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uT7MFMIBahtSoJ63NquYomc3Bx/JlsKkNqQA0fqnIKA=;
        b=OK+LinOtjM2FAJ72XVW4LHZ6SMG93eng9Dls/XpPH5VXLzz7yOURlkntoousfId+ed
         z4OvH8unUCY/2/Jf17BzB1FAkMoDzKYrK3t6amLQhssZpLZon/14SUxKQRfRN8bz6KK3
         b7514r9NYVsFhNO6LrtkA1Dg3len2rH7BSBbnErL3GXgU7H5DQ/V4GZU6E9UV5TdyT4n
         qAaRuWdzVlNx7i+w3EC9tbGmWo2hjPIoQMrkeK2d1ankYVQUbo2NiIHNMkN33aIc6z+l
         kjiCzdZs/SvDmcU8WYj+V+jAQfcJRr3DMlbnvQT/Ah4blqIF/phUaEnZCicDGeqSS5ZE
         HaoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUA950vksswfzPaSqsWsd0gl+otGsm3JTnDelB6CfqW2n1H04vd/d4YcMJylOcko8zlu+xp8Olgt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQAiVbswU0f+pw4klxr0D75pJCfUl1Ep4u41qTYul2orWoClfP
	57nWGVHTYvOoSSqfT3glMIEVDFfMI7xbPx9xCvyODaWkz6MvCJxq5Y9qvHrb9teK4W7pPQBvQWY
	9vMTB
X-Gm-Gg: ASbGncsnbXR5aMVizKU5KWmQiHbTJT1XmsF/c+gmXWe/fZQ9/GwxM5nt3j2rBGLD0NI
	kQdHDJ6ythQjDCEOvSDv11wbJtWiTVmwY7wAzhfr1bihvwggcvxyGfpZEESFheZkAw4T6+MJsGR
	9xBEJlT50MdVKC3YwS59q8NSYJQlU/gP3s+pXWJ0ty5CZ/heuXQdELaiBuYlwB0TBptHEP00AMp
	GRPoO2GYkiaq398DbkdCQSoHNY6IwIp34CUCBO3H2LpRLsB6xi+U8T5H5gp9qvNY7C0AKQqmDKq
	OlXl1B49jMFkRZIzLXtQiPuCfEAhefG/1MKZIHg+n49Chst4q9OkZ2JYvaFtV1SHZdvUusJfi4T
	iSbD3dLahwGSJiarY
X-Google-Smtp-Source: AGHT+IF5W3O6TPk7e+LNd2sqAVYEmytSNfjUVZC6qzt3rMNA2T82wSq3belaG83TFf0+SfJGaNxBOg==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-44f96fadce5mr19923225e9.9.1748283434634;
        Mon, 26 May 2025 11:17:14 -0700 (PDT)
Message-ID: <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
Date: Mon, 26 May 2025 19:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18.5 PV dbregs fail
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 7:06 pm, Andrew Cooper wrote:
> On 26/05/2025 6:59 pm, Manuel Bouyer wrote:
>> Hello,
>> since I updated to Xen 4.18.5 (from 4.18.4), NetBSD's dbregs-related tests
>> are failing. Only for PV; PVH and HVM guests are fine. They are
>> failing for both 32bits and 64bits guests.
>>
>> I tracked it down to dr6 being 0xffff0ff0 after the trace trap, when at
>> last one of the lower bits should be 1 (I think it's bit 0, from the code).
>>
>> I looked at the commit log between 4.18.4 and 4.18.5 but didn't see
>> anything obvious.
>>
>> Any idea ?
>>
> Have you got a link to the test in question?
>
> We've had a couple of bugfixes in this area, although debug handling
> isn't helped by the fact that both the SDM and APM are factually
> incorrect on how to write a #DB handler (and the vendors are moving at a
> glacial pace to correct them).

But yes, having looked between 4.18.4 and 4.18.5, I can't see anything
relevant to debug handling either.

Judging from your description, it looks like a breakpoint is going missing.

The relevant recent change for that is
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=54ef601a66e8d812a6a6a308f02524e81201825e
although it's a bit older than 4.18.4.

I suppose it's possible that we call x86_merge_dr6() more than once when
forwarding #DB to the guest, which might lose the breakpoint bits?

~Andrew

