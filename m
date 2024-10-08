Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BB995404
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813305.1226189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCiy-0007yy-97; Tue, 08 Oct 2024 16:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813305.1226189; Tue, 08 Oct 2024 16:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCiy-0007wg-6U; Tue, 08 Oct 2024 16:06:12 +0000
Received: by outflank-mailman (input) for mailman id 813305;
 Tue, 08 Oct 2024 16:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syCiw-0007wY-PT
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:06:10 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aef0ad9-858f-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 18:06:08 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso8246316a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 09:06:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994787fa61sm388977766b.169.2024.10.08.09.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 09:06:07 -0700 (PDT)
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
X-Inumbo-ID: 3aef0ad9-858f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728403568; x=1729008368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=10R+q4cNG7YIf3GtFxYZtpMB5Pf/OK0yaXmE7ifSyDQ=;
        b=GAABs/zYYciGobVKZmEKCZc8OKbRQkgkT6cCf41SqFFjWNBllWgIYWjl29PDVjcyB9
         s/pHrXXwq1mXDKiZrfMKEvI40OdjANJ4CyhpZeRc4fWg7+M3tYJhzezgiFh90Puj2twZ
         p3J3evc5dyakYadxm1oi8bzLT8lsb/7hwMideo2mlKCNbcqQcUKcaO8zupewJt8KsBOZ
         yP+R1EHbVJfAraAEMeQz4QDLlvZ1eAMk4szQ9THFLIglPLiF73z9RZcKyL9LGnb1hfKl
         JahrkGWyZWRG9bGKTCzaNtSyJ+X4xTFIfrFy4Fiv+DmLdxNXvdz87SdIpWEMg/0ZchtL
         y1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728403568; x=1729008368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10R+q4cNG7YIf3GtFxYZtpMB5Pf/OK0yaXmE7ifSyDQ=;
        b=G7S/WWzqLE8ZRC1GHOH/BqOo2pB1AZPTcRz36Wc/kNGQJbLMZwPyFr+Mu2Ymva6z31
         t7zkYkzQi6nhICttcX4mHiNN+Fh7HYDNok5OA7/g1MuaYh4fCRei/STkEdceXa6jxPKG
         WLsmP6VJoUZtn9XyHWD4ZuZE6zi1zp9q7tAoeYHe74046g+vgrKlGziYgCitnFdarq9A
         rVxVXOF5nq+iOtzRHnE7jEU7XbIZv87YpSJQD+dvZXK3u8dYIrZ47DWFOHHux4ceouY5
         wA4ED7pc2H6aj7TOGCQXzh71mAoSC3AQBmsJFVhALN1cgzXOujOSH6gxBzrxPKQaeJyj
         QMnw==
X-Forwarded-Encrypted: i=1; AJvYcCX2URUgSROpe03d+hzx9CC/oDx9RFBKL1owTC35cdd3XL4L2DmNu2yY4qd3MIB9tX9G0970ggh+INQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFZVaZNPQHzIAuJ73s1Gjt0w6JM29++nbCVLNk0lslRM6+jrEK
	oNMFQlQeF8/88rU3OSa5PrneaDQwG013Bh4YEdXXBh25Ap87AtJnMicM0FJchw==
X-Google-Smtp-Source: AGHT+IEt9QvormQHAzyxBdzgMY06j20Mh4q/KdWkVuolDVgwvvPPuYIdQaWn/vD/ryHen1Z/MChtlA==
X-Received: by 2002:a17:907:ea0:b0:a80:7193:bd93 with SMTP id a640c23a62f3a-a991bd40f79mr1710939366b.25.1728403568158;
        Tue, 08 Oct 2024 09:06:08 -0700 (PDT)
Message-ID: <ff4d8168-9e9b-4c24-86af-6960652d803a@suse.com>
Date: Tue, 8 Oct 2024 18:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for RISC-V
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241008160309.78329-1-oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20241008160309.78329-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 18:03, Oleksii Kurochko wrote:
> As an active contributor to Xen's RISC-V port, so add myself
> to the list of reviewers.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



