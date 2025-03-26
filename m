Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46014A71884
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927905.1330661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRmd-0006np-0R; Wed, 26 Mar 2025 14:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927905.1330661; Wed, 26 Mar 2025 14:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRmc-0006lm-T7; Wed, 26 Mar 2025 14:31:06 +0000
Received: by outflank-mailman (input) for mailman id 927905;
 Wed, 26 Mar 2025 14:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txRma-0006lg-Ot
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:31:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f23bfd08-0a4e-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 15:31:03 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso4603273f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 07:31:03 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a31a7sm16699544f8f.23.2025.03.26.07.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 07:31:02 -0700 (PDT)
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
X-Inumbo-ID: f23bfd08-0a4e-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742999463; x=1743604263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3vEokMRu3Gtd1Sk09JW+GmkgSqV9YNbaVsX4x21sOtA=;
        b=ZK5hq7pjI2vPITcJmZ7l12/ojrozUuMsoEUHxVkayTZdH0Op8qsSOn6Nbu7NdVWBxF
         rSfjZqDOukyYyFHaydHnPR8bTi1UykhzACQHQQNOsXPah4N7nHkaLEXV7oDtHHeRuslp
         xia6+JfGcN4ESiO0Q3MC5YHHzM8+Tv1KBzaKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999463; x=1743604263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vEokMRu3Gtd1Sk09JW+GmkgSqV9YNbaVsX4x21sOtA=;
        b=N9I1wp0UD/kO2vPDuEB0F5VhwUTcDieaEt9k/izWoL4XALw5LDngXCVtJwSJq8Rfa2
         8jxcAc8M1hFqkv3HF27QNWwYuiqAVMO+nhfssPcC3ky3mClR/f40WGjD83HKoA8dM6RL
         eXZJdoryunZ7BIjLo1i1Xocsn/UgNGn98nKo5tCQI3y5EpasFaPPjqouVhiNm6h0UzmI
         +tp8chSP7uvkSzEjG3Q+ZwxtNsKNKF+L5rMNpDjeY2WnrJhsdNipik58gcPKdzDV07V+
         PDka/zb0MVRzwYvOWAFlPTofeR4rCC7TnVARbOeiAynQkvD49163O6Q3IMz16mgcWQDZ
         DHww==
X-Forwarded-Encrypted: i=1; AJvYcCWCSWW6aqQlaSXYZeLbsHGr6bBWe5M+bPJVshfVwxQkTLD3MqMEPSy+EUBXFQAvaCPqHSJpqkT98mI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywxlzf+ylAzcNdRBmj6ATmogjOlLuuedaKO8uD/oa/4UJIM8yPt
	+HELW2CIwtw2zrmFjZlf6bEN2mgTKtO7ozDDnzdKg7Vd8JrdaJUzF9jgJnntDJTlw0p0Y+GSgNq
	j94Y=
X-Gm-Gg: ASbGncuJm72t6kxV/2Rx9uWgjBq3p/mgvdNvmKa3wZ+lCQnVFwVMbaBDO+POrBWT2NM
	opojIPuwiNarRwG253EEnHVIFs79kaz25qSoAMg79cdVIzbixbXs1WTiCrdCQ/uXWgG8fdYmqi4
	fTl7aBM+9Lw4OXdqd8Q20rNTSKeeKq2HG7dK0PBYCnsaN5UDtms2pHtuYj5Gue9i54o3ffYlA0s
	nZ4v6dFbwnOw0dd0yQl9HuVHXGld514ZivtGnaDvUvdLK6+0nxLc3i6CNy3WAHmO44SewcoyKB8
	Bzwd08hpGpCQ+Em3nESEtdyrsq4c+KIDnbmsCrXd0y32iYKMk9SzBmqt7kzZu3h+oMhcvlvZyZp
	ELltYuo1lnDKhSJ6PBjk1
X-Google-Smtp-Source: AGHT+IFwfI9vihWGAcNADS+w/rqw9urgQZJzsLbMMboKlK4XefA4g3NCLWoaVxhciMNT1RDFmR+jMQ==
X-Received: by 2002:a5d:6d0c:0:b0:391:2ab1:d4c2 with SMTP id ffacd0b85a97d-3997f932f12mr16882004f8f.37.1742999463098;
        Wed, 26 Mar 2025 07:31:03 -0700 (PDT)
Message-ID: <90906ac1-5a02-43c5-a196-464fe5f7f07d@citrix.com>
Date: Wed, 26 Mar 2025 14:31:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] kconfig/randconfig: Remove non-existing config
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>
References: <20250326142900.5630-1-anthony.perard@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250326142900.5630-1-anthony.perard@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2025 2:29 pm, Anthony PERARD wrote:
> CONFIG_GCOV_FORMAT_AUTODETECT has been removed in 767e6c5fd55b.
>
> Fixes: 767e6c5fd55b ("kconfig/gcov: remove gcc version choice from kconfig")
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

