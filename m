Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60AFCD4EF0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 09:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191959.1511333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXb20-0000e5-FM; Mon, 22 Dec 2025 08:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191959.1511333; Mon, 22 Dec 2025 08:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXb20-0000bu-C3; Mon, 22 Dec 2025 08:12:40 +0000
Received: by outflank-mailman (input) for mailman id 1191959;
 Mon, 22 Dec 2025 08:12:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXb1y-0000bo-NC
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 08:12:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9bd0342-df0d-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 09:12:36 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fb3801f7eso1922436f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 00:12:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08d9sm21237509f8f.30.2025.12.22.00.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 00:12:35 -0800 (PST)
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
X-Inumbo-ID: f9bd0342-df0d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766391156; x=1766995956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mMgbWRHJlcjH1gkZyfQrVR12HAIUL5qZSN3OMOTMnc4=;
        b=MvBjpKI8vRnFXvljg0CdkTY8qdoFXpus+v4jua1gHxuKzT1EXIWJleOMYtkdB75eb+
         PAyaQVqUTpkFCrX3vbI937UziebyN2KQFO6vY+F/TxmXEec7Wnzg5bmA+fJaG4yar6CN
         WEAmICCwwaJnqqkfCQkZWktgiEAByTcq3AAxJ6Jr3s0zz1nfZ7vJ8nxOMRaL6KIcwAk8
         EIXzMV+wphVKGuYPIazxQE0sZmdCR6f+uk4554+t84FHMcT0buU+zcMpztDITq5v9TAf
         qNUsoooJzKw2fTUroDuKUI8oXFwl506JNaq8NVgkciThi4WDCYSeDzo5lshU4rSfNTGX
         pmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391156; x=1766995956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMgbWRHJlcjH1gkZyfQrVR12HAIUL5qZSN3OMOTMnc4=;
        b=ueLyg9tDU+vHLiA9cWRBYnuLbp+Zc84+fTA+pFOxKbyh6VA+wCgNRdAqi1GxkcCsLh
         B/ec5J5DO55hwV3UuZodmEAeTVc2C7JlToQplGRkWnn7Lx4c0NYDIuXDQ0odHk6YE9yM
         i2P+PE81zOJcC2Tg30Dmz03Jb46qI9bJgctflECke1uyrCRMD3+rZxlmj2bxYjEXJ32Y
         1b/JoCUxHI2yck/6UV6KnSjaRWSUugwKpsfX3OQ2liOYWWvJoVQ1a3t3kGxld/xKBH/H
         bsyligC6o50aFMTFiW9wmQ9PqjoAWy3nGHQSSX9XDZmiojEqdXcv06T4SYYqDq/yCY8V
         FA8A==
X-Forwarded-Encrypted: i=1; AJvYcCUsJLu8zdJRtthkt8jvmfdHXI1RGQL628LbzQ7N1Nj7dYxq4Ph1OBwU9yN/LUA4cIbctyQoWOgl0qk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF7Kf/O4utZK5cKH09Mej3Ki/Pv7idT5cugdL1kDlRcGmS8Cqw
	tvBWwWvapON1F6dWHLIZNzn9eFWwaE03UPhv5Cti/1y/DH5HLUTLIKYZIdWaJ5cC9w==
X-Gm-Gg: AY/fxX4JB0CGt57iDc3Wc1bEBs4pBAusAlOnYMUcE96D36LMEnZFYqVZl2eJxWSvPSb
	ey/XSQlkwQsvC9uwC8zBkAONyKtp3ohfV/h0Ejv7hWkYDGP1eaqMW7UnZPl5ojazV2E1Xo7cqqX
	LDbUABRIpxAjYLc3STmvgSXfCCHwJGciCfeSrYKvgv9n1A/7ZOaeHhzSED19e498Bpl/fklkb6D
	X142B7GD1q2BixfKMj+ljwyl1XE2UHWRAuvPZJ4DhW6Jq1A+yMXwt67fcnZiLOAZ4ga43/c1FSN
	3Rua6rcKLAMLU9aI6q0DlLuO6IsmusWmvUcj6Ew0qNuAr7XleW5WZr/yFXDDy0YgAGZu8m5toXD
	YtZ9tW0Vt3KIQBoMqvqROR5pkLIy+KTileBtG+EmfueyBVPkLTpQKQFUhU8iBndgQ/20DDBOWck
	SqctA2UDak9M4CwhnQ+htdid5ytKLcTU8AWL4IcZ1l3CmKwI0JJrLzi36Z+sRz5KsvySrMdeAyX
	vm9D0LiRZMDBQ==
X-Google-Smtp-Source: AGHT+IH3M8CfFtmgcXJWPC4oZ0lhp3Zingm+RWf5JDp/SC+VkVmJUWXRg8rRL9kZD6T/VVTo/k9LEA==
X-Received: by 2002:a05:6000:220c:b0:431:752:671e with SMTP id ffacd0b85a97d-4324e4c906cmr12482561f8f.15.1766391156103;
        Mon, 22 Dec 2025 00:12:36 -0800 (PST)
Message-ID: <a3421224-2f74-4cba-ab9d-c0f197c77669@suse.com>
Date: Mon, 22 Dec 2025 09:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/cpu-policy: define bits of leaf 6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766158766.git.teddy.astie@vates.tech>
 <8a4adb89e6b6152fca074f2bb9091b42af936630.1766158766.git.teddy.astie@vates.tech>
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
In-Reply-To: <8a4adb89e6b6152fca074f2bb9091b42af936630.1766158766.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2025 16:42, Teddy Astie wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> ... as far as we presently use them in the codebase.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> I don't know to which extend Reviewed-by applies as I only applied Andrew's
> proposal.

Which I pointed out has a latent weakness. I'm intending to submit a new version
of my patch, but instead with the names change to better match the SDM (as was
requested by Andrew in reply to a change later in that other series of mine).

Jan

