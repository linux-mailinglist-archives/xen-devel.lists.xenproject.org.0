Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A06B1D4A2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 11:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072706.1435681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwmC-0007BH-6P; Thu, 07 Aug 2025 09:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072706.1435681; Thu, 07 Aug 2025 09:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwmC-00078U-3b; Thu, 07 Aug 2025 09:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1072706;
 Thu, 07 Aug 2025 09:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujwmB-00078O-8D
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 09:19:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 911f7201-736f-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 11:19:06 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61580eb7995so1662777a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 02:19:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff8d3sm11414604a12.6.2025.08.07.02.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 02:19:05 -0700 (PDT)
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
X-Inumbo-ID: 911f7201-736f-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754558346; x=1755163146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=enbLNhtHkZW3vn407/7W86KBNLz0+rLLOav5gWc8h8U=;
        b=bjlLCL7W86Olwc/V1AL+u+FfclvCy/1SsZCECWdMeDRbJjIBzIF+5YvSQMwa9ZT3z4
         U6EZw4qEXqk9n8emaP2FaqGYXFVJ4AnZrrRkkUhaYfZINOjENFFuy7UOlD8ayTiIe8zx
         KJ5mb3aaXfldJAlg6ZBERuqAx1EvHs4d75oEGEvqr1DefI0bc7KuiaeBf3XTnTkFFx3F
         Tm/YJEj7YHyDvTZdWEFtDpeRe4W1Ufq7t6oYDm1hrsOAcm2hYG/xl0HIadbiFRlWwdEO
         vj4p0hb3+uzniQosqJJc87E69cfzuHu2C5E56Zdy5w8LJV6KTOxbbABCZe1SXFkEjd+n
         8XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754558346; x=1755163146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enbLNhtHkZW3vn407/7W86KBNLz0+rLLOav5gWc8h8U=;
        b=C1M3E/cq5DY9Uq8/j3dmSJhWsLHUVYJ1KAxyEQVRQbLzwoxSqP42fmaJGvsm5Yfp1m
         FkKvS5B4mOTA0KDKX8JBE+W6eUA9NLEFbaf+FM9LsA2DPoHp94eoNlFd2fxog1v4+jMq
         MsHfoWV89nsHZtjpCyqGMIqd8lF3rVe67grWus309x5dujfIdI0qmAJMsfJta4RDsMj3
         uUtevhmIfPXtIsG7w5XTVi+jbp48iwW8IPswfPoXZIvrk0oo2mDbiz4WX2ijsna5WUw/
         z9qFNT5E9SeUfZzgP5RKFV5LiGoHXssjESCFCWLjIP8oorF4YbpJJABrTPADtXvvUObl
         W5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc9ghhn6xE91B79y9/7DAc0u+OsZFkLnUTcxNfcgDYelcNPMY8lpJ25/4wIn382Z6iKwX9Unaa/KY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8j/nZsSaenO8wjDhX0U7jmCKAMqwfylMqLHF13hFdzu2Sa3oS
	sSsI0qS+hd3rx3CeY5ihUiOo+M0fygkaLG+adpjXjW1m6UMnfL2qhCdosxUHnpjlXA==
X-Gm-Gg: ASbGncvh87IydMVfWbCRea6GJGzBrRQFHy2MTizoZnhuNH7sJlN005NUb6hD5pKDvoL
	I1U9KSoautRxE5ZRM1VgFsi0BW3oDYuWVX28/lhGzYnoq0mJbHziU4lQZWFPMnzB/lxA9Ijscvq
	oWmqdh6v/jopU62BJSos5FRd3sMugUC2MAnKFksAr7bYzTf52WhObxqUXAf29LBAm0FJt9p1biJ
	llr0Ghg4XJ38P3LljX0tbxLMH3qGxuc6Tq2lL34qxZVbWw/zQApjin+For+aOTuSrcT1HsVWvbc
	rO8+sMB95I8Cg7EPNS+tKmL8pP+C2qUyxx8CbxQ8s5UX8WVM1FZxFFSaNUI9L4EkfStPQ1EaVfs
	ybPnzxoCocWppawXP0FqdjfYIJN0XzruyePUFCkcBAgRiderfdrA9M7I25HFHb9dLpqgVX02m/6
	9ghMGzNNk=
X-Google-Smtp-Source: AGHT+IHKBZRI7oGdz4YDO95XqmbKTa/RGPSv5TJKThj8RZ+Lrc7PGVfILkgUvCAhC2tI75r2bDM1dQ==
X-Received: by 2002:a05:6402:5253:b0:615:3667:f4eb with SMTP id 4fb4d7f45d1cf-617b37b49c2mr2264375a12.6.1754558345689;
        Thu, 07 Aug 2025 02:19:05 -0700 (PDT)
Message-ID: <49691142-a9eb-4d39-a43a-07c5062dd2fe@suse.com>
Date: Thu, 7 Aug 2025 11:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xenconsole: Add connected flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250807015606.4427-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250807015606.4427-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 03:56, Jason Andryuk wrote:
> --- a/xen/include/public/io/console.h
> +++ b/xen/include/public/io/console.h
> @@ -19,6 +19,19 @@ struct xencons_interface {
>      char out[2048];
>      XENCONS_RING_IDX in_cons, in_prod;
>      XENCONS_RING_IDX out_cons, out_prod;
> +/*
> + * Flag values signaling from backend to frontend whether the console is
> + * connected.  i.e. Whether it will be serviced and emptied.
> + *
> + * The flag starts as disconnected.
> + */
> +#define XENCONSOLE_DISCONNECTED 1
> +/*
> + * The flag is set to connected when the backend connects and the console
> + * will be serviced.
> + */
> +#define XENCONSOLE_CONNECTED    0
> +    uint32_t flag;
>  };

Even if the field name is singular, there's the possible reading of everything
together as the connected state merely taking one bit, with other bits available
for future use. IOW I think the field wants giving a less generic name, and
perhaps also shrinking to unsigned char (or uint8_t, but char is being used in
the structure already anyway).

Jan

