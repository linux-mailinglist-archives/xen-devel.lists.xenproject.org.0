Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512D9D5A77
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 08:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841738.1257235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOVA-0004uw-8S; Fri, 22 Nov 2024 07:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841738.1257235; Fri, 22 Nov 2024 07:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOVA-0004t1-5l; Fri, 22 Nov 2024 07:54:52 +0000
Received: by outflank-mailman (input) for mailman id 841738;
 Fri, 22 Nov 2024 07:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYSV=SR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tEOV8-0004sv-Vi
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 07:54:51 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac3837c-a8a7-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 08:54:46 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cec9609303so2057851a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 23:54:46 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b57c1e6sm65579366b.157.2024.11.21.23.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 23:54:45 -0800 (PST)
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
X-Inumbo-ID: 0ac3837c-a8a7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBhYzM4MzdjLWE4YTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjYyMDg2LjczOTI4OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732262086; x=1732866886; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wllQQcW9IV92W3o3FO1lZKoZou2H3eOmasZCp2hnNA=;
        b=rVH//zglI7gYuzQMfDwBVdlkaAbYzX62YZRaEvl1mm+pxU1M+6l3kEuqyQdWNOiVqY
         QnLbY+mX3AYebkDdSDCNjJCOxyNpqnxevanDtJ9uq9zCyp0OnFcmJobmlmfQo+SUWWRJ
         0+ZKTKdTwPdeMQdVEPVXEBRSZUvyhX3XXRO/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262086; x=1732866886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wllQQcW9IV92W3o3FO1lZKoZou2H3eOmasZCp2hnNA=;
        b=SBU7zJULnSoALIiv+M5S0s+KtcYAQUPGTRN7+4KLBNcxpyyMV/J2J9DxAi+xRFYMtf
         wNabgMPkBnZqPhWvrL8gKvVuUJeJW6r9e7rkz2Mug2WKn1M3lsxo/KFKksmt9iRIpUc2
         AqGmjPETbpbh2T3oupd0PKUwmUa1NtKHD31eRc5QvVH8JJS74t3+Hko/mWgfRgo5g3VH
         wISbdsGps8B9rglYFuClDlR9XCNK8eQM5dH3tsRcsS9jDeL9XiN04ItAVu0C+qcauQW+
         pjh/GBBpynvrklpxfekRg2ux7dWPLyHhikmLBVfDsLkfK9GUVF+uOuug7YWT9gZISFVY
         CulA==
X-Gm-Message-State: AOJu0Yybtw7sSXBwUGkc4hk2qjZdZOymNMPvurZ/hij8EgPkceLqpKBI
	pIxwBnUhhKyXYloFfQYqR+TOipyviGkpZuvmyGt70xTE/U5tBe9xeAvCZ7q38c4=
X-Gm-Gg: ASbGncu4a9cBrr3t3G5hBXlGaRQvxt5unl6YBnsRVPSY2WX/ln18rWEPRPd/uYqsqSC
	3y3Ub4u41w21bvKzUaQo2lsxanCVoPW85ePJpr49KHVKHgvJit4Z6C5UePtxSVDFHr+ZbpoZE1t
	TcNeTUbDiigd5HHrVBTaQ6i7ywI1TXDHD0QZf2nWeuZUQEM90/lMHl59LtMxwffOvspAGeTb2R6
	q0a+ECwiGKs9YooqjVi4vOXDcklez5WEM/JiuGA1U1zRx4VMLRUGLz5tgk=
X-Google-Smtp-Source: AGHT+IEoc8oAuVw+ExICcF2A+w2ZLxPd8xYd7sxHBmFqyUQzSIxgqWtlFaOvj7b8AIcmB18VvVjeXA==
X-Received: by 2002:a17:907:2718:b0:a9e:b86f:c478 with SMTP id a640c23a62f3a-aa509a0388bmr162467366b.36.1732262086077;
        Thu, 21 Nov 2024 23:54:46 -0800 (PST)
Date: Fri, 22 Nov 2024 08:54:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
Message-ID: <Z0A4xER41zciSbiW@macbook>
References: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
 <Zz9gkhQgsOtJUA0I@macbook>
 <bb6736b2-ec3e-4e72-bd6c-fabeccc3654b@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb6736b2-ec3e-4e72-bd6c-fabeccc3654b@citrix.com>

On Thu, Nov 21, 2024 at 05:35:16PM +0000, Andrew Cooper wrote:
> On 21/11/2024 4:32 pm, Roger Pau Monné wrote:
> > On Thu, Nov 21, 2024 at 02:50:00PM +0000, Andrew Cooper wrote:
> >> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
> >> index 91ae961440af..0edd62d25c28 100644
> >> --- a/xen/common/bitops.c
> >> +++ b/xen/common/bitops.c
> >> @@ -110,6 +110,22 @@ static void __init test_for_each_set_bit(void)
> >>  
> >>      if ( ull != ull_res )
> >>          panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
> >> +
> >> +    /* Check that we break from the middle of the loop */
> >> +    ui = HIDE(0x80001008U);
> >> +    ui_res = 0;
> >> +    for_each_set_bit ( i, ui )
> >> +    {
> >> +        static __initdata unsigned int count;
> > Preferably as you suggested without the static variable, I may suggest
> > that you use ui_tmp instead of plain tmp as the variable name?
> 
> For this, I'd prefer not to.
> 
> For ui, ul and ull, there are a pair of variables with precise usage.
> 
> This is one random number that gets as far as 2.  And it's test code.

My suggestion was on the basis that we might need to add more 'tmp'
variables of different types in the future maybe?  No strong opinion
anyway, I'm fine if you prefer to leave as plain 'tmp'.

Thanks, Roger.

