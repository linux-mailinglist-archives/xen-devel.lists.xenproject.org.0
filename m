Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E607A3740E
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 12:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889593.1298668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjdHy-0003pr-Lo; Sun, 16 Feb 2025 11:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889593.1298668; Sun, 16 Feb 2025 11:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjdHy-0003na-Ii; Sun, 16 Feb 2025 11:58:22 +0000
Received: by outflank-mailman (input) for mailman id 889593;
 Sun, 16 Feb 2025 11:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8J0d=VH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tjdHw-0003nU-Rh
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 11:58:20 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce26aa7-ec5d-11ef-9896-31a8f345e629;
 Sun, 16 Feb 2025 12:58:14 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so1145185e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 03:58:14 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b83a3sm122983545e9.33.2025.02.16.03.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 03:58:12 -0800 (PST)
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
X-Inumbo-ID: 4ce26aa7-ec5d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739707093; x=1740311893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mCF/N2ar0OeH4jmW4+aU8Op+++OCjjfuV3a/zX/8oGI=;
        b=TKw1644ofIjD1bkQZlFokvDWe/0fVVqRT03kB3LdpXuZZenruSrbG5Tf1BWU019zQf
         WV6bxw7n7ReoabMeu32GPbiWhhZq1LgsELy8x6XwIU/BXpbTZBeDCE8QdzoZg26qlYur
         inwc5jD+eK++0qkwJYNYOpOVZt1kk268ZEsjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739707093; x=1740311893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCF/N2ar0OeH4jmW4+aU8Op+++OCjjfuV3a/zX/8oGI=;
        b=JvPrWL6gozjT/OeAVS/nT3CjOkng9dOL07/MRZ+B8idFO9MmcXx51xT+zz4lqnPpmX
         mH3bggPZW6Kt3UIed2+dOw7amiTMhWDoeOnuNI1eoLQ0d5/B5JchEuM4/zxGWHIzh/FO
         PibA2HkYIsEcAzIenxftbZSxcY3gvotQ9MRMI7p830Jh/IOUOaQsGE0cB/iHl8qRPptP
         7BVEh5/DsOCgYD/f4sOWIx84oz0yaa8dJciOb5elgdFsLJ6rWgLcnzrF4nBxcNNGBKq3
         OomUJXaS+NiXHHRErrJKl1E4u8ekeyD/nQbA24hYLY/6M864EQmsVbTLGia+JV+Adm2q
         c9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnaTt1F9xmlo6lhVFeUE44LyjsKL2RoUQ5QgoYfE+qMXH+EhDIwPheqS90WAPpV4E3mmtLcyh26rM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/vY0pCF75C+1DfzOER9jpbfHQ9LM+zc4M6rMe8hR1sWiqLpGO
	BjZnInFPadib7cAC6oqIj8YNeXNirRb34dpp04bWALoHx7UMdL2fbVH0ugmkiHw=
X-Gm-Gg: ASbGncttKOMkACwysR5/je9EQixprR8+tkq9xUI2U9GvdDh73XgR1h5jLyATPwgqgNL
	SQR9G+lIpZNDgjj/Uuontk8sQh2ERqvWs+tf7zX/yYzOL3LArQ7WVO486j5AW5MFFJ6sJTxU9mA
	KvL16JaEfLn/pqyX1/YDdRc9q76KEKQcDrJ3YJa5sKHdL5AURQklzUx8MhhNzs4Pu2rFMzHQJv0
	qnKuu1j1YDvEMc3RJY9OLD4xviLVhVE/vNvZwmRHAQ5PDRgM40YQGL0vydXZqZr8wVgjGIf83uu
	MH99cprfqvKLrNnSdmSVzc4XFMsefthSHNxxzDDRY31FbrEJN9ixLEU=
X-Google-Smtp-Source: AGHT+IGLNXBaIjYJC6vRRT9S7kK5GDMlVeqxu5aMNBMLedGG11WiXS2i4tK55aIZ8ryTQlcg/umCnw==
X-Received: by 2002:a05:600c:154d:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-4396e701614mr62229785e9.15.1739707093346;
        Sun, 16 Feb 2025 03:58:13 -0800 (PST)
Message-ID: <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
Date: Sun, 16 Feb 2025 11:58:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250216102108.2665222-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2025 10:21 am, Oleksandr Andrushchenko wrote:
> There are two diff files which show what happens in case the same is
> applied to the whole xen/drivers directory:
> - first one is the result of the "git diff" command, 1.2M [3]
> - the second one is for "git diff --ignire-all-space", 600K [4]

Please can you format everything, and put it on a branch somewhere, so
people can browse.

~Andrew

