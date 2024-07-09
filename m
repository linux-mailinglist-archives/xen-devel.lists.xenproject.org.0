Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F83D92B450
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756042.1164605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7Ra-00060c-Ap; Tue, 09 Jul 2024 09:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756042.1164605; Tue, 09 Jul 2024 09:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7Ra-0005z8-7B; Tue, 09 Jul 2024 09:47:30 +0000
Received: by outflank-mailman (input) for mailman id 756042;
 Tue, 09 Jul 2024 09:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sR7RY-0005z2-V9
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:47:28 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409ad585-3dd8-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 11:47:28 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso613708466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 02:47:28 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a86ed10sm62625666b.190.2024.07.09.02.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:47:26 -0700 (PDT)
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
X-Inumbo-ID: 409ad585-3dd8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720518447; x=1721123247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpf1+y60EeiGL+Twva2xkz30FSTXU/fwLUpyVoek8ys=;
        b=dDJn0GATw0cWPifqym/iddoHsyH+x8II0gQJQu1VXCKO3SR+mrUiBLqFpWXmBrupfT
         zPR3GFJCeOtiONX3K9IJuWm+OcllqdnWFPpxbjymfdXhnUm0AbtpTVqxQazQWjqOnwF8
         0fn24m4ab9j7RN83+Au/6PTYCfBVgk4Cc5d1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518447; x=1721123247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpf1+y60EeiGL+Twva2xkz30FSTXU/fwLUpyVoek8ys=;
        b=CvIeQdYyzQTY0jH58lzZH2xfFcvPdGvROvZZits9BwOdCwsVwM2UfHBxpDXJdG8+gu
         /j4INoFwoTAdUrWqSIqbGNJOsuSYO+46I27481iy1O8bdutM6VvtFQRbymbl9FMx8B/f
         OEUOpqSE9fqZ2GkNnBZdJLQ1YNJlj5MidMGJMZy18D8S9j8oube6Ot9PXSkxFiXGVP7D
         2mC9M2ynRZSwSsLEisuVa3/OMlDXT+Mh25kpfraukWdZibA68ITsXvMb+YY8N+byod2A
         1RFknxf0MWy41+SmJomdf4TFOMi6QXn0zJp/Yn7BfLbsDWd857LCAszm+QHlpMKZ2HC+
         Znow==
X-Forwarded-Encrypted: i=1; AJvYcCXYTW/jNw6s8fg5k6ztZP+4F5dyZWB8BsHyQJTxRzcF0kkskmhEBdhXHR3f9dpzLQCv7dyy0MVoX1daeubdobi12y/vpXlpltz/sRD8HEI=
X-Gm-Message-State: AOJu0Yzwt1J8JsnIGXkpfvkdKaqgBYiHyezT6GN1YyBqHlTVDoDhe0xV
	m8Flm4Ah313SUHNZbvVuiA4dMMjk6997neEFRdTAIIVryNo0MkPmj9sCxyhqKBo=
X-Google-Smtp-Source: AGHT+IGZvAzhFN3iRfXik8wjVKrEjJVnNwO3CKjcs+9Q+wtuR6HHpGWYM1NGL49eq5h5RLEqFh4oYg==
X-Received: by 2002:a17:906:4118:b0:a77:e58d:d8db with SMTP id a640c23a62f3a-a780b6b35b9mr143879566b.32.1720518447386;
        Tue, 09 Jul 2024 02:47:27 -0700 (PDT)
Message-ID: <ce22ad38-2797-42fe-b4b2-34bf5bf1eb15@citrix.com>
Date: Tue, 9 Jul 2024 10:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 0/4] CI: part 3 (improvments to PPC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
 <0a661f4c-5701-4ed1-b15a-493da99e04d1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0a661f4c-5701-4ed1-b15a-493da99e04d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/07/2024 7:31 am, Jan Beulich wrote:
> On 08.07.2024 19:35, Andrew Cooper wrote:
>> Here is a run with these improvements in place:
>>
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7277624801
>>
>> Jan: I hope to backport this series to 4.18 so we can remove
>> qemu-system-ppc64/8.1.0-ppc64 entirely.  This will simplify changes in the
>> future by making the testing more consistent.
> This being part 3 a relevant question would be in how far this is independent
> of the earlier two parts?

Patch 1 is only tangentially related to 2-4.

It's a long-standing script bug that I've encountered for the second
time now, and will compound everywhere (even older branches) by making
the containers be non-root by default.

We should never had had root-based containers.  It's not necessary for
our build or qemu smoke test containers, and it's a stupid risk given
that patchew consumes *everything* from the mailing list which applies.

In terms of a fixes tag, its 17fbe6504dfd from 6 years ago.

It's a problem for anyone using the containers manually with the
containerize[sic] script, not for Gitlab itself.

~Andrew

