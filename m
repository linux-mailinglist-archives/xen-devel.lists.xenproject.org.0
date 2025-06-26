Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD9AE9671
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 08:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025906.1401153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUgIn-0003qN-Nu; Thu, 26 Jun 2025 06:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025906.1401153; Thu, 26 Jun 2025 06:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUgIn-0003nI-L5; Thu, 26 Jun 2025 06:41:41 +0000
Received: by outflank-mailman (input) for mailman id 1025906;
 Thu, 26 Jun 2025 06:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUgIl-0003nC-EH
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 06:41:39 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b50adf4-5258-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 08:41:36 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so369627f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 23:41:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8851337sm6084616b3a.126.2025.06.25.23.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 23:41:35 -0700 (PDT)
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
X-Inumbo-ID: 9b50adf4-5258-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750920096; x=1751524896; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YRQYjpAwhqBYk3HxETddrIIdoO8JHXwaW3HZ/hSgaKI=;
        b=giyid+dd5JFJlUspftCptxXhsezQASF/sT7wBOlJgxGeqbPlkDc/+p0KJw6Z2daV18
         cBQ/05u2ehvquPCJs7SEVCxe0TEYXS1jrrdHhgYfQOTN2l+MPPfY5DMn9KkWA3/mERa3
         t9onGfkGhKUlVtzo1XOLPfZzG+Av32Mjb7z9oXwAUXAaJIit5JoSSIpQ5vMZpwJA6o2e
         CJo2EbkqqKsvLEhhVyXJYL+hge5hNULvzLKToi4JGnav/XLSK9xu0SZG0sAv2QOmRJT9
         1gKTghTdzlFphIjWd2YakbXyAhgIWXG0bEAx5hTl7Xto6a91n40ON/uInbAGhlrGEE+I
         TPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750920096; x=1751524896;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRQYjpAwhqBYk3HxETddrIIdoO8JHXwaW3HZ/hSgaKI=;
        b=Q63yeda+7/a7VcLdoGJfAqHZO+E4KVmmBKBksIHVJC3ruuu4YLMOaxeUqwaFG+gmRm
         IT4AniV+v+++uZHV1n33Bi0tbaNySLZs6Xrz384Sm8MgiyrvsjP6QiNPV6TdgJlsdr59
         FDQD9Cf8onfotItE5fZFjLdPR3WmrYU23+3Y/boe8O11qMdQO0GR53CDE1J8D3uGi5lV
         CQpMQMjFghYFxBrL6JUnVrtHMy/l76TnZPvasu0mJVO5STFvvCnrC+0VE55kEzd+MKz+
         cDwU9fxpo86u4/rJ0RQyFWs2ZAbtXBOWeSsuTXGjKSiQx9isWmp2Z2qvXT2yKo+qQX9+
         rpMw==
X-Gm-Message-State: AOJu0Yzp62s4Yh0qDNLPrgO0cses/i3IDiNHvA+5D6D39LHZfh6r1kB3
	b1RrufZSDoc40DyjCtZ0R1clOFBmGIXpEx+8HQTS1SCn87nT6KCCsMLjEQ+JZHQbvSP9itlZPLL
	jqoo=
X-Gm-Gg: ASbGnctLku9SznLCnPx0u+f8ys7AnD2JBmRCnLrq+I7N2dnzOlsjPsIcj0WVHAdSC8K
	3eFR8fbllnoCCQM8Swz42CBU1wani+qVyDCgDslN9z9XOadGJQhyNqZkky5Fvq/eOSlIJO04XMR
	sS3bgAa3lIwVOiyO7Z7klQtCmxrGI82SLwoyc2YtunwMtnXekQ6t0vqk7i7G55BeUiQXTqXGfgf
	dm9p/epjsU8OHTnLyF5BspESDhH75VCqOJqh9ZHMbjN2xjLmZ3U1rbvBitJzysSPXL0zmQdLSMv
	zFc9sI8dxFDnyRfCSCOF7u/hiAwP0uODBDrJUCH8fzU7S+/A8dcFqdg4X6FduXx9R8skfjGD+c3
	cIc//8ZdZ03sBkb0q2DLxrfFw0E7eoxe8OVKbIiqS0SZenjk=
X-Google-Smtp-Source: AGHT+IEu5LzMptFkmHsSXaVLgUfRl4RYzJ+9Cnc7ERaey9OtF4rFbbCL2yAo4Frvaka371T8QgP6aQ==
X-Received: by 2002:a05:6000:2004:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3a6ed61a4admr4580524f8f.12.1750920095916;
        Wed, 25 Jun 2025 23:41:35 -0700 (PDT)
Message-ID: <24bc698d-4e60-4f34-9b8b-8b1f315655f1@suse.com>
Date: Thu, 26 Jun 2025 08:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.20.1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

the release is due in about a week or two. Please point out backports you find
missing from the respective staging branch, but which you consider relevant.

Jan

