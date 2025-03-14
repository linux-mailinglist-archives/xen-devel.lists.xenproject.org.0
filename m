Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80FA60CFD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914215.1320002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1BQ-0005po-T5; Fri, 14 Mar 2025 09:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914215.1320002; Fri, 14 Mar 2025 09:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1BQ-0005ms-Pc; Fri, 14 Mar 2025 09:18:24 +0000
Received: by outflank-mailman (input) for mailman id 914215;
 Fri, 14 Mar 2025 09:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt1BP-0005Q9-Ey
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:18:23 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46f1adc5-00b5-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 10:18:22 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43948021a45so16732565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:18:22 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010e2e4sm10689385e9.37.2025.03.14.02.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:18:22 -0700 (PDT)
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
X-Inumbo-ID: 46f1adc5-00b5-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741943902; x=1742548702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+bGNCNgSiR1Q0tiLQS5aZLu3UxZIWtcxJJJiR67HjU=;
        b=TjySt6+GMSkdN/1d6TWPk09VcNM8CbO5dzd4ANUMSUTBx63hhNfu43ho00y+gfclaK
         FB0PuYhIi+D119B3YsYdcnv6RetXJkepyaG7xB/7h26v1ebL6k4q2NRPj4ZTgKL6bCuI
         gJ4OuJeoDqEl6T93qIjj11cqHx96rlAQ5xVqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943902; x=1742548702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+bGNCNgSiR1Q0tiLQS5aZLu3UxZIWtcxJJJiR67HjU=;
        b=FG/mJ6uI7I02Ulq3ZdqFyTxVB3ysBhfpRTr9qmqjNZ4lAHNslUgYA1QcvNEJqHdc68
         dsQToycaYCf+KaQbQRc3crRnBKXurW9cvnS6Hr9NIz+NqGkZ6lPIqnZrB9VFk5V/ox+2
         DrOgN+B62/Jat/ep15GB+sTe0z/7jyX0CfmSLu2V9cgaMZOwfJeGbCQBVyNQAm0+a+Ie
         C58uqIHoKBuHuovU+lz9hERT0BgaPOCgtd7bkc7jcIHAosCN99y7jp2kqNXTLXjQn8v6
         HeCqlgFHeqqwFgO/lVtFJ4KiSYE59hDcoOI/CwGWf+EF5hZqH9R5iQ3dOfBrNJQuEUso
         YgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxg+1yCsburKeG45fY21qGwuBCcFfvmBfmBsB7XZ5HOmnFZpdMdw3JaOQNWceQI0GkU2muZ+rhGNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTTkXC2Csw0NebJjNqpY9kFbDrYFUB//F3aGJXKGG0E2IfmzKo
	NE61A3fpU6Hwk4uP3oKSVf0u/9+WPk5hx4lKnNjW8bNoSE1zgr4c+MQ+sBZVrf4=
X-Gm-Gg: ASbGnctrwxiHSoUd32cQmRceWhtHxx6f0I2qB8YzeuC9zdwCTN2yYSGUQExl4BA7OMm
	ZmuUJLKvEPsuIbe3sviDRvaooj6c57jwBd1AzT4ogLni88KUGecGwTH7iLEPeWwYFKxRMlIxw/y
	LjaF//gLbMUnFMucfE8HXubaA2jNFR+5YsaY/jacyJthoi+/jmtxOQsybrS1GZ1n9mop9jSmycL
	3d9+E2xYOSPFIoofvFwbfYFll9FfBQzUenUnjwMDtKsUEZknbsvN+mBadN7Luy+9akjCc3awVse
	1PUagxFvx+5p4j9fDYu3x3mHhKEiWdGbVlGDbJD+Xm7h2m9clz1L2fPFIO7vx65qx+6x5Af4LsL
	eBRlAAz3TigSBcnuNuuE=
X-Google-Smtp-Source: AGHT+IGWbtPUh9QgR1IrFHQrJ0oWLpydbsAGPs7az6UeOOh0cCeju+2dIaEP1bPbVqFz4wp4Dy8b6g==
X-Received: by 2002:a05:600c:3b0a:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43d1ecc31b8mr20062445e9.19.1741943902393;
        Fri, 14 Mar 2025 02:18:22 -0700 (PDT)
Message-ID: <b6ce5ff4-17bd-4199-a89d-2a6d4f5a7a46@citrix.com>
Date: Fri, 14 Mar 2025 09:18:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250314011528.2608217-1-dmukhin@ford.com>
 <94879059-1a38-45e3-ab3a-4f8eacd885cf@citrix.com>
 <2fd26b5f-2d72-4261-a963-e05cf7fe56b7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2fd26b5f-2d72-4261-a963-e05cf7fe56b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 9:16 am, Jan Beulich wrote:
> On 14.03.2025 10:14, Andrew Cooper wrote:
>> On 14/03/2025 1:20 am, dmkhn@proton.me wrote:
>>> Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
>>> readability.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> There are currently very few uses of NR_ISAIRQS, and you're about
>> tripling that.
>>
>> Please could you do a prep patch renaming to NR_IRS_IRQS first for
>> legibility?
> Ftaod - did you perhaps mean NR_ISA_IRQS?

Oh, yes, sorry.  That was a typo.

~Andrew

