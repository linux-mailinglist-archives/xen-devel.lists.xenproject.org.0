Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB69D88EC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842789.1258467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFanQ-0000OY-MX; Mon, 25 Nov 2024 15:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842789.1258467; Mon, 25 Nov 2024 15:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFanQ-0000M5-Jk; Mon, 25 Nov 2024 15:14:40 +0000
Received: by outflank-mailman (input) for mailman id 842789;
 Mon, 25 Nov 2024 15:14:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFanO-0000Ec-JV
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:14:38 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb71dd82-ab3f-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 16:14:36 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434a099ba95so7248935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 07:14:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde8fcdfsm130278935e9.32.2024.11.25.07.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:14:35 -0800 (PST)
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
X-Inumbo-ID: fb71dd82-ab3f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC13bTEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiNzFkZDgyLWFiM2YtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ3Njc2LjM0NTQ2NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732547676; x=1733152476; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyuD4K1sHrhw+y8DqTrBQovFbOZHn/VYVv9g7sH6d+k=;
        b=OlvlgKSwrulkzEYPshpDK/Bg23PHvEW6MruWKJOLlz3bn1CxQ9/NuSS5y4FzJMUdDd
         uS/g2nZM2OrBA72TpmP3layGFc8HWvp2vkJ7uKXnHj+64PgouM2znPubPi7/SIs4dCQG
         /xQDCn0VQEy/kNgB0rdmyD+GzTi+tx0r4TVWz0cCLue9ufhDrtFNdfMu0ZDJJyRC6W7d
         7lcXN/Y9M0RVi6M08VyGRZNwX7BnEqQtX7v2tVeI+ZSt8VxSP0s9m6j+xqIWPhpZVVZ5
         Cp/uTb55UnwfFeM6MN/RUfva3mit3PMQr29xfD3F1PngfKVoJlDr/GA/mn6SMhu+AS1u
         ZRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547676; x=1733152476;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyuD4K1sHrhw+y8DqTrBQovFbOZHn/VYVv9g7sH6d+k=;
        b=V2fCuaJN9zeYbvvwBIO2a/lwsBzhxL5rJNgu6cztFZiMCRM1DocvT++vRTNjy/ISR8
         p5Jt2SMwTOtpu/NVFTfmpK7F3mgpwWZzQsy+4+ma3LMe5P0Jfv6BBYHyc9oZqbbkgOuo
         NwpSqMmND+tur4doq6TzDStOSSYqngMpKyqI181F17VBOc4o2q6tdhtIrTIc9in8sXGh
         lZ3GLXxXSgHZR2a5S83dyG2pFUqNSXkbeWed3+UTxq4hCmdLymoMGfauNPUi7GPtmNqA
         40/h8UWAnxWQ5GCqN+ehURpwClw7fSPp+ELq9vhB4oZSrF7Fycs3N55m3hk9IfkNIx8g
         zixQ==
X-Gm-Message-State: AOJu0YzLDpqJ7xUyvaSvmoWCTfKbEqjdA7vPCxR9/4XIt5VYVIH4Q4Lw
	iJHFA9E3jExUQFl8E5q3u8UQzAiGRrP/VHPH+xzZIgT0lKQqB3JFiC99tZkb0DRGwomwsFoTRjk
	=
X-Gm-Gg: ASbGncu9kHoiRI7rz7Praa3IBqfPSVPLHgcbNJD4w14tVGWJ87xUm5qY8N6KDsM2DQ2
	yFaEEhET4Y+5l4VUXBLooM20aE2iB0fO9vUtCGJZB7Pc/RI21NTt4C6PXiHr7VjODa6TiYUKggB
	cmqMXpfEH8Oo1H4ZtALBWbX2NWxcYw2PHTWAKi6sU3I9mBKnMm1zRSlmgiPEzZEJq1HdQlMXmfo
	wBdhapR74ZEVoPa6C2AgTzgpw5aqFe1BqQCMAMIbIGM0T7hFDyh9S485+7Zdlw5l60ufjOZ6Q8f
	pIwS4Ku6nIbqd6gjVy42/SpYU9oirMb48vw=
X-Google-Smtp-Source: AGHT+IHstv5PaZ7AFicsKmR3JZmDTlRaVdSVrDsBKGIlLOO6RWiimS45vcD5259Hxo9XBf9JfTFwTw==
X-Received: by 2002:a05:600c:5805:b0:432:a36b:d896 with SMTP id 5b1f17b1804b1-434872f56a9mr95328135e9.26.1732547675677;
        Mon, 25 Nov 2024 07:14:35 -0800 (PST)
Message-ID: <7455ff48-4bbc-465c-baff-d5c0ff684dfd@suse.com>
Date: Mon, 25 Nov 2024 16:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] libxl/ACPI: address observations from XSA-464
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

1: don't hard-code guest page size
2: bound RSDP allocation

Jan

