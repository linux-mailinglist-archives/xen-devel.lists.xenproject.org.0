Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6051B17032
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065457.1430828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRDQ-00045s-Hm; Thu, 31 Jul 2025 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065457.1430828; Thu, 31 Jul 2025 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRDQ-00042l-EI; Thu, 31 Jul 2025 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1065457;
 Thu, 31 Jul 2025 11:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhRDP-00042f-So
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:12:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b7bc945-6dff-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 13:12:50 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso145808f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:12:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975c89sm15257985ad.96.2025.07.31.04.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 04:12:48 -0700 (PDT)
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
X-Inumbo-ID: 4b7bc945-6dff-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753960369; x=1754565169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xU97/oSml6hJUupS4ZJrSlZ8p/67ZsEfsC0n8G2wK48=;
        b=gw1l1ja60x74Q7R+rOYLU3q16Rkepb9SHsBxpcxXfhFKzGVURwKqHgs0RLLQk6k0BK
         pqHoN38TZi6l2QWoW/03bHJMSJwNzl7JMbZUmxwqMS2WyxGT3lbngojWFt7UclOpvjHp
         IQPQ2zz7WueVTgJ7xTyTOcnHk1jjnbcE+JdRp3O0AFKx18Te8u0ijIA11RkfIvkhpl1X
         yueJpARIm8LYnXcLCDKbGLanT47n+P7coNzSDF/zCcHexcYH2GSlIj8CAHG/k4ANGRIr
         U6hsg3OzOuks8BHQqtsHOevGZdWWlKywN2xyF+KV51x79c0Rrg2KpdCnj6ztuMKxI8Lw
         h2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753960369; x=1754565169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xU97/oSml6hJUupS4ZJrSlZ8p/67ZsEfsC0n8G2wK48=;
        b=T5EK6GojpAjDJ9gHkK4C6A4ytxc5VH4bX6e4rzSpzm3kgrML+d+wW+Ee11GOk7jlTw
         ee4OExs4bNBtrRie9P1DcBeWGOSAHJ+Qf8f10bPzrxFoK98H8fQyTA/6lMTPac48CGgV
         0YFbAdhmon88hjI0JWyDeTAYI+9K8ecy11sgJAJkdVQXLqtHFzQIut94hTryhcrzsPVE
         zlstIX1f5RBzn+aOuKi6M5LxbXlPhJQ2ah3lO/HwBqnzsT+1qoBww2gITB2+1vF+vDRU
         pdaPHpDwnGJqi48MjFjCAfOFAkvTeOmtt16QlFhoumr0Q1aoY8wg6LXMf2g9RJfo9S/d
         HT6A==
X-Forwarded-Encrypted: i=1; AJvYcCUN/4Wq8PcF7hLn4jHWgY8gPEiA5nvyV8ZySbmfEx99hRBlwIYChsJd1YCpC6+5Ofi+UvLPsrFJjL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrsLm6U77rLksb2WJLLyKV+sfiDFUzmX2exfvrHsZ3UTAg5EDi
	X/ZnPk87Uv7iePG3zNPouuyAme05WFeZ845ud2eiBcHlbOIMofcfG5Gdl+9rHv+JIA==
X-Gm-Gg: ASbGncs7blMSLnv4G73liwB3kYbPrIimcu4Febjl2EjYRiykAMyWhu7ArhoCoP493l2
	8vHvxV481HbceomNPatAypHuPt01acd1JQosy9FADHb4Rtd6Em0pz/GnPWc/py2IdryKNVqYG+4
	FpgKbckRL2G3Qh0q0KAQbvH8TV6CuwFxz18OY9UDwHOzDQFUcXyewUDzeupV93MDQG1DkKUFgAC
	Wfu26hzrYdo/GECjp9haH13+XOSuG2MNZmf9Fy7oG7YXYD7tyZWkK+5vEqyShjlTtDoSBPkDmNL
	FV0R23A39ND+ymgqOYWhr74XxcCmTEbihbmdNY4Fha9cmVzU9rsKK5UwTBGGrbJVllUiFbL5TUP
	j1bmLAeK+ug9uQcfqoFk3HsXWMxzJftX0EDqH9wMZOaL/oaWQW943gLn3sPGrSXWgGM+GYYPlxP
	pVYlly+E4=
X-Google-Smtp-Source: AGHT+IEtu3UWFh7NBV07ecUBzGRCVGW8/lUrW0Kb59A0JpviBrJEEF2WAUEQMqiomNu6rllF2aRRbg==
X-Received: by 2002:a05:6000:2f84:b0:3b7:88e5:ce57 with SMTP id ffacd0b85a97d-3b794ff1544mr5188788f8f.27.1753960369458;
        Thu, 31 Jul 2025 04:12:49 -0700 (PDT)
Message-ID: <08c4f197-6651-4fe4-9b25-844b38a664b0@suse.com>
Date: Thu, 31 Jul 2025 13:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/version: Fold print_build_id() into
 print_version()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
 <20250731110231.3551636-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250731110231.3551636-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 13:02, Andrew Cooper wrote:
> Both callsites call them as a pair, and the buildid really is as much a part
> of the version as the changeset.

I wouldn't view it as strongly, but then I also don't mind making the
connection, so ...

> This involves rearranging console_init_preirq() to ensure xen_build_init() is
> ahead of print_version().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

