Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F4A7D458
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 08:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939180.1339379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gAD-0002wU-4A; Mon, 07 Apr 2025 06:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939180.1339379; Mon, 07 Apr 2025 06:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gAD-0002uS-0E; Mon, 07 Apr 2025 06:40:57 +0000
Received: by outflank-mailman (input) for mailman id 939180;
 Mon, 07 Apr 2025 06:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1gAB-0002uF-Hc
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 06:40:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40fcc4b8-137b-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 08:40:54 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso2163658f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 06 Apr 2025 23:40:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795243sm123903075e9.32.2025.04.06.23.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Apr 2025 23:40:53 -0700 (PDT)
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
X-Inumbo-ID: 40fcc4b8-137b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744008053; x=1744612853; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zragjoZ0urZdBmqIfZzXuZqqBe4r2jSo9CSVoS/Px4M=;
        b=XAAqgC/wTXHPD3abuZCqE8Hjuw/Z43j0s3INqIMHkn1t5eNvrGKLQiUsb3RiJmoa/S
         CEYvpU1Q8IsrtfWcNET0zmnrhI9N887t29Kmvwt56Is8zbVvKPWNtEck60InZbGUG40F
         aWzrBbdv1eoCWZziuYjBeUX4+e5kyhKhOMlQGzzUn22IM7v53as3kZC7zQGCia0InldX
         jM9mv6+8HTkk/ksOFco1HQwLd1wCEV4wb+kFcdjGp6ianK/UcFxcxk78VsXwBwIKUXqm
         hcyIrQDaQh2UGzYZIiFLzKzRGBf0sdxCygAVL/qx+PoQ3jngAxTEB6kcrDTd8osndyGC
         qbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744008053; x=1744612853;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zragjoZ0urZdBmqIfZzXuZqqBe4r2jSo9CSVoS/Px4M=;
        b=btDXGmD0gih2kbmCBesQ5Fr/ykloqu4OBEsNSIxPDNREWIDzYVYoET1nOpa1grWBVe
         Xl+Fcnv8jHxvj6q1jXjlD0bDP/dD4UU+hHso1OCxTLC71vYQbgFxgQzUGJ4A+fCO88Br
         EEC8M1dasCMhgPIRn7PMRWSWHS+p2iHoWEVFTlZ0nFFCWhdzd7pn0U+lV7W+deDudwcd
         Aesy28wu2T5RVEvvWi3V8jvEtpPUFrzsyXLb5wdHFp7k2dPEwaiHW29Yj/Yc5FNbIVGp
         5oA1haL7cDmagIU5FxIl4mBAN05mLQjF4Y4KqxIJSTR9O8jJNLmhclhG6X8vUs/XAh8q
         blYA==
X-Gm-Message-State: AOJu0Yxow5pUerUkJMs0G3+rIktAATMSS9nC1nVk03AJ/PAUp3N6iV5D
	yysa1Sk+A1DQb5CMi5kbu/pspIU8q+SvI3mNYJUJgcaaWD1YL4HO8AjVSihtnw==
X-Gm-Gg: ASbGncuGI5aQHyMZQmY/xlyqdf0zO/UXd7yIC35tLfrSbqA2jwWyyishcDhGjx4DIK0
	RgfjMAckG6ZOiXtTMw5+WUXjAI2pBzvXtiBWbydUBrdVgblu/hEwAqTZJqx8WEJ2rVn9C5pGn/Y
	/lbrJY3+oLwOlvL/FJLZmYdh3w90ojHI7Nf3oUpXYYNDG09pCs6KBiTr1WDz0QOraLfTMyOYmZL
	HY5F7S9SzyVNZ6npsMweI4qVDeoc/8MI7Fkc+8C6gruglFeCqLrotYg1XaJztkLSw0LDvIxuPag
	J0rPOxbTIknmRDgkPoHBVPXJVo6qQBV7omxJqQa4f26QIFjoan86Dsru0rcwfRQ5RxyUZ6ZGzOq
	8m1PuoTsRZnk+h/14eZYPMEokJiGQSw==
X-Google-Smtp-Source: AGHT+IHsEhGx6092aGVdyQPpml5dOljoy/n3I4F5EpsUOlkvRsFhjFuAILNp+6f1zE9/iM8jBYz+qw==
X-Received: by 2002:a05:6000:4212:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-39c2e6219b2mr13511027f8f.15.1744008053666;
        Sun, 06 Apr 2025 23:40:53 -0700 (PDT)
Message-ID: <cc999f58-12a1-417c-83bb-9b35ab5546ae@suse.com>
Date: Mon, 7 Apr 2025 08:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.19.2 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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

we're pleased to announce the release of another bug fixing Xen version.

Xen 4.19.2 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.19
(tag RELEASE-4.19.2) or (eventually) from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.19 stable series to update to this latest
point release.

Regards, Jan

