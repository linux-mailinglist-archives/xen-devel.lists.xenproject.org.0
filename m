Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2DA78AE0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935332.1336743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuEd-0006uU-NC; Wed, 02 Apr 2025 09:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935332.1336743; Wed, 02 Apr 2025 09:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuEd-0006rh-KU; Wed, 02 Apr 2025 09:18:11 +0000
Received: by outflank-mailman (input) for mailman id 935332;
 Wed, 02 Apr 2025 09:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuEc-0006rZ-7Y
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:18:10 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64624342-0fa3-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:18:08 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so44836105e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:18:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm16894939f8f.54.2025.04.02.02.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:18:07 -0700 (PDT)
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
X-Inumbo-ID: 64624342-0fa3-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743585488; x=1744190288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zZezMXvIcwKj55KZ2ucC+5Rw5WbJ4OWTiUFXPCRvTss=;
        b=JFedLb9YpH4/V1az5ul62C0rc5VyFAsj36jZp/hgh3E7j90dBBDm13SP8AsGMNJ0xx
         E8PdVcl68eIbQcuB+A52lUf1IAZ7dLGlzFhCpFEIkCgYBeJsVgJSCx0vDBSY2ZQ+h6+H
         T01I4xIrPHQeDSm6WkJl4Q376J8FesOrwFbjeocxpVmqXzVdUL3HqWNrBfaiRQ7wwmhJ
         rRokyqDiG4fGoW9tqksU9vEkiZrUxUfFFBejlGD3ZAtnzufa7Z+3wnjKbyqpHF6eZ37d
         rxAu7/6pEsVjB1n+3OfmRX9v8p3mMT1UbZrsSxT12fUNHGf34TByn1gopwfpipFIUhiC
         9Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585488; x=1744190288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZezMXvIcwKj55KZ2ucC+5Rw5WbJ4OWTiUFXPCRvTss=;
        b=k549peKwX048K0Qcnip+clIDom7nJa/p9Lxy5cMnBj28O/I4+pobiAQgj06fRSYJS3
         mZ8NWMdYsdEcfaC++3DSyXFwbJ7WeOMe2nyNAKVljygQAONwx0HHXav4P3OKQpBNa5UP
         /PDUBbXqgzdkUdwz2CYwBOH2XprZ4dTqoV9hxOyyBiCMIBOHpMotrkofptVDvBkzhQGx
         +aHzzoKl+zsfrOgqGZffv9nwP9zzN7Yu5WNIfdpEvvhsrupAoUn8jTQaodWRB1tDtlZY
         OEv2qcZaC0l4crkOroTZEm8D0QXLECjJ4CUMgwe7CboszovWPFNSxtDo1Wi8SkyVqvIb
         qitw==
X-Forwarded-Encrypted: i=1; AJvYcCWcgg1BFef/AbBBi1wrzWNpFJWAiMBPKEfBDttXvk+rih/6GzPMY+kO+2/OGWYYKkfrqLXvgvMEe28=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjdGaeUhUyDtBS7S615cJCMtDPD8ubFoWMOnjT5HAc4GGhzJFr
	YBa198Br63XMwcaABJL8MqdnabcwSK40snApzuAt2dA0TERa1vtkZPFGPDxM5g==
X-Gm-Gg: ASbGnctKfmGNp7vWM9Uaev17h3syYkhNxemFXEXnzPOAG8YTE4oGqQtr2RDTX5/KJmY
	yGYeHM9zuLbLFpb94ye0kDqlJ56SJdQaJnH2l1HtaxzwJv7YzuM3hQvlqa1WKfFvqeopfqm7lTA
	aPEmwKr9yjXh43q1bnD+JUm21Us8h+0XCTnxwmUE2o7PlojeqnZ/8S4nuDnuHw/ccVaagDJ3Ls3
	oxwDE15OyP9TE5XB+bdCqjRmZk3Jqe0vVk/0FNjCNvrJnIbDT8M4TIvzCWX3TtUXouciLdKBNeM
	4iuNiV9icRTRSzNBAakeWi/JQTQcc26GQDBUiYo8QbbS44I3RTTTUrBW/nz0MyDF2sD/6XnBZSd
	IQgk6qKr9AjXQiYer5eMELo3y793dv2rHsJ2LYQkZ
X-Google-Smtp-Source: AGHT+IH+aqNfHD39mIV7ldSawEbddk4nWjJrqUMdCyG62gyCBY9QtE+xT1kO/b0FXXef3lr6ldZz5w==
X-Received: by 2002:a05:6000:144d:b0:39c:1ef6:4364 with SMTP id ffacd0b85a97d-39c2364b2cfmr4991150f8f.14.1743585488204;
        Wed, 02 Apr 2025 02:18:08 -0700 (PDT)
Message-ID: <fada573b-a195-43a6-8777-96ee6b5c402c@suse.com>
Date: Wed, 2 Apr 2025 11:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250401005008.2787764-1-stefano.stabellini@amd.com>
 <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
 <alpine.DEB.2.22.394.2504011708290.3098208@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504011708290.3098208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 02:14, Stefano Stabellini wrote:
> On Tue, 1 Apr 2025, Jan Beulich wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> The little endian implementation of bitmap_to_xenctl_bitmap leads to
>> unnecessary xmallocs and xfrees. Given that Xen only supports little
>> endian architectures, it is worth optimizing.
>>
>> This patch removes the need for the xmalloc on little endian
>> architectures.
>>
>> Remove clamp_last_byte as it is only called once and only needs to
>> modify one byte. Inline it.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v5: Fix IS_ENABLED() use. Keep more code common. Move comment.
>>     Convert LE bitmap_long_to_byte() to just a declaration.
> 
> Thanks Jan, I looked at your version carefully and it looks correct to
> me. I could give my reviewed-by but it looks weird given that I am also
> the first author.

./MAINTAINERS has a section specifically on this situation, starting with
"In the case where two people collaborate on a patch, ..."

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

Jan

