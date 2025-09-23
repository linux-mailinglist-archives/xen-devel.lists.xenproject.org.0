Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F88B967B6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 17:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128474.1468817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14XV-00012J-60; Tue, 23 Sep 2025 15:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128474.1468817; Tue, 23 Sep 2025 15:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14XV-0000zA-2r; Tue, 23 Sep 2025 15:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1128474;
 Tue, 23 Sep 2025 15:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v14XT-0000z4-OJ
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 15:02:43 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab0f778-988e-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 17:02:42 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so3778357f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:02:42 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8a47d925092sm557549939f.17.2025.09.23.08.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 08:02:40 -0700 (PDT)
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
X-Inumbo-ID: 5ab0f778-988e-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758639762; x=1759244562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJNox54r0lPmdy3UucKOhC4eXV0k2IyMBun8tm2qtpA=;
        b=eh+6FsaBjHZED1O279jp/iuk7OUKIt0uLiPfOiQCkBGEZoQbX28rYXBzs+NdfxuL3p
         eghM00MlWWpO6cIvnc2CZBaUivFP17owIn9NAxzIechyDMyjjYAB+NRXOaMSuEWTu8fI
         Dyf/yjVNGeZ9qIPAApJLLm9SmZThUS4kcPEonLjga/S1X1412VxKeJCNn/j9RXcn8GHk
         8Xa6YxTUebuqsHZzLUarwExPScK3xNrJWQRvmKMOa2IhlQRpPa2MuJ3CSvjleNx+VIxV
         X1aVQOpwuyDTGEWWddgg5sNvrPyehZxslsL7Ph057c50lEScSELZ2rRuZLxYlFVWOUSM
         jy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639762; x=1759244562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJNox54r0lPmdy3UucKOhC4eXV0k2IyMBun8tm2qtpA=;
        b=MMC9rly0FXzA42cWhBICM7DUOseUoVMJvCTFeawz3gNnELAXbqtL2wMV4bhwqfhuhF
         Fn6jWUgGfhD25PQKgehBl52tdiGI5XsuvqQq/pSJ3SYtHKEUm7OvFiYMxEWWE+pdtQaO
         1SzW7TZ4GS1mMPgFN1Pi8wjHQlOgx5mNW4SFKXqySq5yHcIecgwaZeOKE7+ji6NRn7Cx
         yUwDhnFON70v/e+QqF/B0qV0l2L+wEv2HyxkRZpOAcIcyhkQG5VnRRKar3mGr7xzx9iE
         hjw86jRx4vIXpqjBTQ8oSBqIjc9lEtKgbRqdCQineUOE+EBLgpJiHYC5dgsJnMe8Z96i
         loFA==
X-Forwarded-Encrypted: i=1; AJvYcCWk+Wu3Tm3zMaojyP2ZfaKFWnU4peOqNTdOkxzmMucVjI+p0/OKvtlEb7pFcMxV8Q3aPQL4Keg1Gwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6PgOWSZyDs5Hr0aAI9b9wfuV49oMyc/Xe2Ur27g6F2NI8d7L6
	2SzN5YElKE7ZCv/m/dIeYp9s558zY+0SRkK4g/3Z441FCe1uPeDclxiJFvfCU5Jv7w==
X-Gm-Gg: ASbGncs7XbUWRiXtpnsXkP5hyvqkiF8IZ5sYZa/jB1vDmy+xS3e0/ZsJDb5z3cK3A/k
	uAQ2OMhUVllLZOuXf/u3hT+bS2PaTSIw3AKjnmXM+Ds3LfGjsCsXZALiWx28IMuGp6bGNHN+xi7
	dSP4J8mtJWYtXTvttCZFwjrlJWtV0aEFv2u43qTBThkOX4WRRpIRPBg5rhS+gOwsk8hmKASLCKN
	KZDROcIuXl8U4cz9k2m2KABbUbad13K/8SM2Y9qDrMyJEimUVFcoUuQ/0I24QXK+s6YdjCp7JHe
	060LvWVP5Nx9hDHBAJiu6K/iqVkGQ0XoIZDYcUWSNHwuPXhKGPAGPMmS7SbNDloNlCcbIQytV2V
	masyBl01dZLkoueUtjRZVsXz8Nc+Xnuld
X-Google-Smtp-Source: AGHT+IEQ3qWt9QoMFUCF5HyL9xYSwZ/REK5zTfo9GjDs0juUbv8VJyuYBmhp+tcYhb16d858sRNKRQ==
X-Received: by 2002:a05:6000:200f:b0:402:5708:629c with SMTP id ffacd0b85a97d-405ca959e6amr2075020f8f.41.1758639761698;
        Tue, 23 Sep 2025 08:02:41 -0700 (PDT)
Message-ID: <83441882-6b4f-441c-a10e-49be26516054@suse.com>
Date: Tue, 23 Sep 2025 17:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] xen/cpufreq: make HW_ALL the only expected value
 for CPPC mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-2-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250923043826.3831957-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 06:38, Penny Zheng wrote:
> Right now, no matter for code construction or hardware restriction, HW_ALL
> shall be the only expected values in _PSD for AMD CPPC mode
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


