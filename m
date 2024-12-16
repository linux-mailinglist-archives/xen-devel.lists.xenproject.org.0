Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB39F323A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858095.1270340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBjX-0006WP-VP; Mon, 16 Dec 2024 14:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858095.1270340; Mon, 16 Dec 2024 14:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBjX-0006Tv-Sq; Mon, 16 Dec 2024 14:06:03 +0000
Received: by outflank-mailman (input) for mailman id 858095;
 Mon, 16 Dec 2024 14:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4xN=TJ=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tNBjW-0006Tp-FY
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:06:02 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e12aae42-bbb6-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 15:06:01 +0100 (CET)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3eb7ecc3c54so2314184b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:06:01 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3ebb492a328sm1552586b6e.44.2024.12.16.06.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:05:59 -0800 (PST)
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
X-Inumbo-ID: e12aae42-bbb6-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734357960; x=1734962760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kSWekSVktEYmf12kc9swILeOvBfo99CjqVpCRN5BqHM=;
        b=jfz7+je/qzzzpB2zT1BMkVzMIcN02ZqycYRy05F+O2ErT/p8QIO+WDJDsd1xfTiX3C
         jkoAPrSZ4C8M2vU0opAXnyqoVeQ0xuvLWZQx75AL9+Edzey3LGKwAGwvM+n3OJ/yG216
         StdWBOcgCgRC1pvKhqtw0YndMC3g8R2XG2CJMtWpL9MtmQQr+CCUXbSO6bLIK2sJ/qVq
         IPcHZTM5N3N748UahL2iGdOYXiOWvp5rG/d44xvHijGLaGScLxVwHO0gBR8onnLQEelQ
         ZyoySZy2UPkk4vMdo6Dk91bINAJau5YBSKqQhNvxeu5JV0OrRkrq8oznY5sGvLTQ/tsC
         QIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734357960; x=1734962760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSWekSVktEYmf12kc9swILeOvBfo99CjqVpCRN5BqHM=;
        b=OWfCNa6q4GiPznD215zBFk1Y+54PVytA32GuwL/zaZV8ZZp6TjnJfMFNvPEdYwwKqs
         Qg0Clc6rNadmJMoPJCika0B25+eamrwGEWoZQZNH3wNnl1J93PIW/zmk+YnJY0801qr+
         ntO056/84LHp4zIyn2hyEFefCegT86VtvmUbWIiSkd7iuyZnugfkYecbad2wgSE2wSZZ
         ScFc05BZD0JKDl4qdgN1C77SaMNKrHMKQl6Pm4tOeot1qKoBZHs/4hPrHkKb28G3R/qB
         UrDjxEIWCUhALsPziU4J+32JZVUKORPpUZ1YMIYZd/F6EYPmKm0PI0TKA/RJPYGuFRfh
         uCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWmnWeVAorcG/v4rNKgsA/DOauOCc8G1DvZugUnj/DejjjUu53KBnAZ51DEZDop8ug0nw0KktOfuo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlZJg3IszDy9tSCdm9IgcxLd6I3hA8Z83jkWkB6yYYDM0QjDZk
	9OTMSrb2xNf7iqHPMafrmrt9C4el4jyXxOnPqqgQhFFZvsxFTepSxdTGfYQ6KkA=
X-Gm-Gg: ASbGnctwz1yGxIY9+J5XL4p2eFjvrb+NIfLrMIfcMbZ+FWEccQCiaRcQNdUk37MG26W
	SWGKOpFuPRbB4aMV2NIc+Mk8eV+/QTMDLhBxbQyqwzQMhz4UDPh4GvAtB2s6He5f0UJ8blCqk0N
	FkQvJMNntokHA0L/ulCDIFOKr5Nq5TM2LodLtYX1lZTFaLOAjH9tSaI9WNohJlfanxwvHnd84KB
	o5Sa8Nc7k8IslHrKjSMG4G09VDJxfF6zUjMxA9SpqZ8wUmt9mPDtKCzyPhcNrhITJYZdeWnlvFD
	tucMem9qA5ntyoqlCNJ7+dpkq62fqHNMKZc=
X-Google-Smtp-Source: AGHT+IEYZltRF3Xk2M2/eYQrbngda+UogA4Snbi+1SqsSAHFMIXRUkYBThrOo1fnHuEkK/CNGlSqJA==
X-Received: by 2002:a05:6808:bca:b0:3eb:428b:fa5f with SMTP id 5614622812f47-3eba691e695mr5189702b6e.33.1734357960125;
        Mon, 16 Dec 2024 06:06:00 -0800 (PST)
Message-ID: <10d4be0d-1d50-415d-aed8-f71e81098604@linaro.org>
Date: Mon, 16 Dec 2024 08:05:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/71] hw/i386: Constify all Property
To: CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jason Wang <jasowang@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-34-richard.henderson@linaro.org>
 <774bd939-8015-47c2-910d-f36c44bc0379@eviden.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <774bd939-8015-47c2-910d-f36c44bc0379@eviden.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/24 00:14, CLEMENT MATHIEU--DRIF wrote:
> Hi Rihard.
> 
> Good idea, LGTM.
> 
> Just out of curiosity, what was the motivation for such a patch?
> It it simply about cleaning the code or is it intended to solve a deeper
> problem.

Simply cleaning the code, prompted by a change to core QAPI code for Rust enablement.


r~

