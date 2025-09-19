Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD03B8B62C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 23:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127085.1468225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzisp-0001vr-If; Fri, 19 Sep 2025 21:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127085.1468225; Fri, 19 Sep 2025 21:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzisp-0001sv-Fc; Fri, 19 Sep 2025 21:43:11 +0000
Received: by outflank-mailman (input) for mailman id 1127085;
 Fri, 19 Sep 2025 21:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzisn-0001sp-6v
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 21:43:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a16ca53e-95a1-11f0-9d14-b5c5bf9af7f9;
 Fri, 19 Sep 2025 23:43:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3f42b54d1b9so44025f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 14:43:08 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ed2685793sm9249128a91.5.2025.09.19.14.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 14:43:06 -0700 (PDT)
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
X-Inumbo-ID: a16ca53e-95a1-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758318187; x=1758922987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nW8KJRWbZ6hFlOoFBWjVICnwu/SIoZCAWVK/u8Gpej8=;
        b=I0pK/YXNh1sUsZ7kKfhRf6jvW5/QJtS18Bap/++09kiZlqQ0qP54qSc4wT+S8hebVa
         TYHmXwPf9C9vjJFaDW3upiVeeQ6SZob60edcYr0esvEqCv8qZ2Q3pFWfoDgyDxEhf2eM
         DWRkTMtqNQfbhwabzGgDOk5oyFU5Nazw6t1PzWb16vfxyZxqOrG2bMaqdA3ro0zJzw8J
         FCwHpuQir1khROSEvPUL2hDBN52a4iNTvaBAxMXeYxNKxtQGrXf2eXTkiULo4kegCVmu
         zIKxt6YWtFYdqEgEOc85CiyRacICw3WlSoGvOkquoKLXqzGiRtx+pfBuwFrT6vA8fZnf
         ZEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758318187; x=1758922987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nW8KJRWbZ6hFlOoFBWjVICnwu/SIoZCAWVK/u8Gpej8=;
        b=FBeO3eEId/oLUQLzDUEM55C+EtYmLaib5H5prbHZfp7kWkXCe86NR1VVULGzLHkwbU
         LiNaRIl3aO7OJhM1VHSdbtgb4+COS9T/Wwkz9Akk9l0mx8AntqCtZHSD66LPQ8cXOumC
         bpCx456o9iiA2VsprMFemyn1zoKvIIuyNdevVhzQCypYvDBp47T0aqhkmfCWBf04oRC7
         C0A74OAH2prpCXsRw6CsDA9l38Ei0DnwCQFgdEgc4h2iGlwT4y5JD7PszxLfzZv+sNjZ
         AlazZlABaxUBfLUr3Re0bqu7CRkJOXnK8M9QyQqtIJV8VRe6XtnAe7W2Ne+KE5nj1Ijq
         pqNw==
X-Forwarded-Encrypted: i=1; AJvYcCU1jHQqPv0QSuc0ZxVnHt+dCErYQdB3y07sEVFsNo5QsMXeZayILJzr5/SJTs+9eR9mUjnJ5qOBkrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZrmFlN2GCyrpY6T2VOtdO0ik75T2QUz/ViYTG0+lgfeRfbPNz
	UNlq1wh1s3eVB3GMrypKelVqPRnUWHzrpIHwyZgya3LKvgU59WYpXijS0AF6u4ueDw==
X-Gm-Gg: ASbGnct9T+oI9hkKASs2NKD7JWgU0jMpHSwU7wUJXIBH69H7AJ+EAtR9xCZiuXKvIlZ
	t8ylkVl1HFUoRf8Br2K+4QuuYYJCYtBuG+fqC+MDGXSglpGXzEs1o4KlI0Bwnyh1uQdNuG1UCS8
	GA9OHXrYvZBolaD5xyZn7zeBaTnBhMbSuOu8KtF/g4G3lMyoM9rxhzAACisECgTRXxBAgAVls0H
	2hHXDp1C7lD9Pvz69rlmngf8zeXfY6fX5gVtTYJIkU3zigVii4RNjqT/aa7UbIztIzxmyr2x2mh
	8aQ+tWJ/ku8BphreV1+NWPWtitNdHL4EX1TTc3U7I4g/p48rgchriUQNvGIZcKKyKY+ss0BKuVS
	Dbx/cbCRsV+nETPLX+LrnQx0IbFVdT8Kf
X-Google-Smtp-Source: AGHT+IFPqfVh4eLEH0inY9OUEi2OeJe87qiwA2QzEijZdpZLmGepMTRXLvdh1tV1722OkjEDsAfUDQ==
X-Received: by 2002:a05:6000:1ac8:b0:3e1:734b:5393 with SMTP id ffacd0b85a97d-3ee7ea92d70mr4194843f8f.28.1758318187467;
        Fri, 19 Sep 2025 14:43:07 -0700 (PDT)
Message-ID: <e3b7dd54-b1f0-4e98-80b7-e5157c014df8@suse.com>
Date: Fri, 19 Sep 2025 23:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/18] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f4bc51f1f0c6df6774f55e85654846592f52f9ee.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f4bc51f1f0c6df6774f55e85654846592f52f9ee.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> Introduce the following things:
> - Update p2m_domain structure, which describe per p2m-table state, with:
>   - lock to protect updates to p2m.
>   - pool with pages used to construct p2m.
>   - back pointer to domain structure.
> - p2m_init() to initalize members introduced in p2m_domain structure.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


