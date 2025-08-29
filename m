Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD5B3B67C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 10:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100889.1454159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruuC-0004Ra-Hk; Fri, 29 Aug 2025 08:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100889.1454159; Fri, 29 Aug 2025 08:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruuC-0004PC-F7; Fri, 29 Aug 2025 08:56:20 +0000
Received: by outflank-mailman (input) for mailman id 1100889;
 Fri, 29 Aug 2025 08:56:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uruuB-0004P6-40
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 08:56:19 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06b93bf4-84b6-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 10:56:18 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3c79f0a604aso1086093f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 01:56:18 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf270fc11dsm2495695f8f.4.2025.08.29.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 01:56:16 -0700 (PDT)
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
X-Inumbo-ID: 06b93bf4-84b6-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756457777; x=1757062577; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEuOslCkTgll46YNahAgnaUJhpCYVVZsAhHCwmfTjU8=;
        b=HltATjrNDlNrzb9/ZPOcNN6laGfNQUsB63Czgsnm/k4vqstkwZ6Mx10oDW05tfm6YA
         siu8xq/hjnil6H1tQ9DWpGY1kxaM7qz+vS2XYygk5C1gZYmgaFEJQPWK3EeJqALBAOVY
         jd0nWYVdDqooXpVN05OMbYbFNwT1NsFGMrcZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457777; x=1757062577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEuOslCkTgll46YNahAgnaUJhpCYVVZsAhHCwmfTjU8=;
        b=QnOk0ykNW8rkyuRpRrFdbPeG53YSh+zSces0uPsPfPcAOj9mPlrq6tHgtuOc5qslTg
         Femu8hYFQB80dMz8LDUEXPCLVXGIyaqjm7AhYLf9JWXWmYTz4fUGMqu3LAwxzzGKbm2d
         aFqpyWYMYxU1gfbNbYRZZcVw3bQYSRLR3vsz72pExf/8T9hPfJvbZQ8w84rR1Y9T59Es
         Div+FcEMOSInDjHzuZxdSmm0vvwILFmze5fG93X+EK/VBkEO++IK1MBNJVoWWPa/NGGE
         LpzW4vCNzW1xxAoTt2Nqz8HeEOHSsEVVhwQt1QENpE4w2dRm3GO+R6tMZmUno7Se6uXN
         wvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqtTNMSQ65/KUbB4WL1xx8+bgm2VEEeUtxu1SVqk84B5C8jsemx62Js66JQDezb3eCwqgzTou3Mxs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTqvWCFw0xS0BTjPmO7zxJwvq8fPjywxvm0Sf4E/JUPGbBjDMI
	fVjq5lkSque5t+Qft0KJnCvJiDimAfI83y5vPjsEjrXOoRcfQh0TAle3c0JNBdpySyg=
X-Gm-Gg: ASbGncuhN1zyMsU9Sh4c27NoZiTQKUGbuE3uOFDfwRsFJhku7HJLRDcc7ffkOFnUIm/
	ZqP4Ht4uNMEhmtSasYomRKI+NIUje/mRpGqDLqUY5edUQk+Fs2eCh2fPc3txOTC3vqqYfy7NUon
	ilt5923XMQJlGBDVh70T2oQ1R2RTdlzMKyMoxf0BGh5OqKt4jZweHNEcTOXb1clRiip5LqMe4Xm
	zi7aQGIegnXankZRYqA9Np/VbailNH+stcqE+Icuf77wo6uqiwbOpIZe6XPQDtJIM1ILR+pUzq+
	/bHtA6ECGfvNB8mkmiTBSn+fhsZ6SXgqFgxDQoeOG/nGuIHbdQH0ugM1ZfQvVOsZIq5OPsUlr2j
	AZKbyEnWW7H6Xr3hoTNabcX9vVZJc9UVGEpHMFS5RoflBPUyRAWnIIn62G0CJvUK9Ag==
X-Google-Smtp-Source: AGHT+IEzNyVp1BSzCTFjtXz5xOnwt46meqNrPp1wZjUszgNh8wUWpBssLKsvQlefCJnmzmGP/P1KmQ==
X-Received: by 2002:a05:6000:1788:b0:3c0:7e02:67b6 with SMTP id ffacd0b85a97d-3c5dd1e15f3mr19592719f8f.62.1756457777344;
        Fri, 29 Aug 2025 01:56:17 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:56:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pvshim: disable PDX compression in PV shim defconfig
Message-ID: <aLFrLxdcb2nIkim6@Mac.lan>
References: <20250829075154.48787-1-roger.pau@citrix.com>
 <e11d81c9-cb3b-4838-b25d-50545deba64b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e11d81c9-cb3b-4838-b25d-50545deba64b@suse.com>

On Fri, Aug 29, 2025 at 10:10:59AM +0200, Jan Beulich wrote:
> On 29.08.2025 09:51, Roger Pau Monne wrote:
> > There's no need for PDX compression given the memory map provided by Xen
> > to guests is contiguous, turn off the feature by default in the PV shim
> > defconfig.
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Fixes: c5c45bcbd6a1 ('pdx: introduce a new compression algorithm based on region offsets')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Not sure if a Fixes: tag is really appropriate here. The shim is working as
> is, just carrying code which won't ever be used.

I was borderline also, but I felt it was important to notice that the
change here should ideally had been part of that commit.  Do you have
a recommendation of any other tag I could use for that purpose?

Thanks, Roger.

