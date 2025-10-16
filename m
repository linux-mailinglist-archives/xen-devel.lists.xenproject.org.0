Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2952BE4C01
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 19:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144678.1478016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9RLm-0001Zq-Bb; Thu, 16 Oct 2025 17:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144678.1478016; Thu, 16 Oct 2025 17:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9RLm-0001YN-8j; Thu, 16 Oct 2025 17:01:14 +0000
Received: by outflank-mailman (input) for mailman id 1144678;
 Thu, 16 Oct 2025 17:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCbN=4Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v9RLl-0001YH-Q5
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 17:01:13 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b77ef06f-aab1-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 19:01:11 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-471075c0a18so10534325e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 10:01:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d9e8sm36788515e9.7.2025.10.16.10.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:01:10 -0700 (PDT)
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
X-Inumbo-ID: b77ef06f-aab1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760634071; x=1761238871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QSNW8uRaXIRiJoCFt2g4qlMRk6braa0z4yjTHB7VjU8=;
        b=MQzEDC2KP/Mnqvd4npiaN7h4FvWHLsnjKtKsXd4BbXW3wHHew9QnUvwBNrCyJuyx+6
         sb2PuU9nEj13+sdTd575mamsxgxTPOJAtX1pLcBxUqUVapfmV+T55DchqAtyNRE8KjWi
         GPtJEOtFUK5EqcQQTz/Lo5ttKUn8M6qa6eTDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760634071; x=1761238871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSNW8uRaXIRiJoCFt2g4qlMRk6braa0z4yjTHB7VjU8=;
        b=RK1qf/N8IC0pKmWzSrGFrEWdpZ6kEy6Jc0ETl7DVQhiN4/XZcWjyzLZ5Y+3Tm8oTLS
         GEQLL6OuG55rqKbUxAK2/iSUHlJT05/c7ifVf1hOiHHr/k0wmRx7D8ndhkbiQU9Ka0Cr
         QDYXAvnyKUcnbmpA8XUfaVLVcYc2QqOIsl0Z6EAnLHjk1ycVCwjAhCijoTmSKAHbRiex
         eZph03tV+JkwT0oqhlqZoI839kYjaFRx9c1GAcbyEgW0eC/8AsxBJK7zj7Cq/fK3A+GD
         WJwRfsY38K5Ee090I7X7LEYt/c4gshbyobNBY7NrzilM8+q6haeEm1WAxm6DS/EJP1Vg
         df9w==
X-Forwarded-Encrypted: i=1; AJvYcCX9/dK+WammqogE7bqlJuWgiyHlyaasedjb8EVvhoarpJ2eRvHq6cOQPkqXiUyvXnXuHa2Z2Z3j4o0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzojriQGI2PhVtjQZC/TjbwCq+mwIp+iqBmzaOk3JgzVSJVimgn
	JBgE23LHr3YL5I0rGH4/GalJ92YYczWLoPTOvQ51fSjxQSC3gRweAwc1cW16L1sL1vA=
X-Gm-Gg: ASbGncvi4TrWeDvRnalclgm3nuzVuN5ruYE3HM2s53fWE3+8IFmCdmS27DLev3k4MhU
	iYt4e0bqEZ7MootcTBHza/rkgFuv8gnlV8BGWxS3YaGwD/aQShb82QSvpjtHJ1e73TBxjOjn91A
	2V9G2j81ilFsPFje8QF2t4oS0NDw2t3GVo1nYKJ3DmAGFj7oJn/0MRSL6mLrnvaapAmkaAMTCSG
	Le8ahzZqnQlDVOklQLdJJd9t7eeCC+UCHPOpbIEY4db5WO9NpN1kO6uUVOoFerqHOTz7z8khQfV
	MvDjLxmX6x7f13I+r8T5jINQ/x7GkYsZcY7Upt2MFQ1bvFp34ChJWB7iuSQWMu/0mwgx6UNIkWx
	mJ55rjsOLGHPb2+fqKkEeoRhvNVIA1BwgeSIJCG8bULR+dHMdJo6hxrLR7aLdoQH3I//k0QgUBY
	NjwjqqCMsNfOmiiXDbhvVRyzWsBmqjd8Q+Jc8Ef/DXfUKhl75p
X-Google-Smtp-Source: AGHT+IFpO+ZWUwL7eqtzwCT+nUL205DLOMjNxK47819arLKsbv8fZ1Yw1lD73UNPgQHT0Sxq1t3yfg==
X-Received: by 2002:a05:600c:3ba1:b0:46e:47cc:a17e with SMTP id 5b1f17b1804b1-47117870544mr6448815e9.1.1760634070709;
        Thu, 16 Oct 2025 10:01:10 -0700 (PDT)
Message-ID: <d4b8ebac-fdb4-48fc-8ff1-d16492d440d2@citrix.com>
Date: Thu, 16 Oct 2025 18:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/10/2025 8:32 am, Jan Beulich wrote:
> Using dynamically allocated / maintained vectors has several downsides:
> - possible nesting of IRQs due to the effects of IRQ migration,
> - reduction of vectors available for devices,
> - IRQs not moving as intended if there's shortage of vectors,
> - higher runtime overhead.
>
> As the vector also doesn't need to be of any priority (first and foremost
> it really shouldn't be of higher or same priority as the timer IRQ, as
> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
> and use a vector from the 0x10...0x1f exception vector space. Exception vs
> interrupt can easily be distinguished by checking for the presence of an
> error code.
>
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is so cunning that it took me a while to figure out how this even
functioned, given no apparent change to TPR.

Having this behaviour under FRED is easy.  In fact, allowing the use of
vectors 0x10-0x1f under FRED is one "extra" I haven't gotten around to
doing yet.

But, the problem it introduces under IDT is that for all the other
reserved exceptions, we'll panic if we see them.  That was the point of
setting TPR to 0x10 originally.

~Andrew

