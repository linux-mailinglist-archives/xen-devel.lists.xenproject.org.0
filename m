Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2927B48833
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114886.1461683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvY4n-0003RV-5W; Mon, 08 Sep 2025 09:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114886.1461683; Mon, 08 Sep 2025 09:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvY4n-0003Ol-2h; Mon, 08 Sep 2025 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1114886;
 Mon, 08 Sep 2025 09:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvY4m-0003Of-7z
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:22:16 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e07cbe1-8c95-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 11:22:14 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b043a33b060so649902266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:22:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042c7b3671sm1889634366b.42.2025.09.08.02.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:22:12 -0700 (PDT)
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
X-Inumbo-ID: 4e07cbe1-8c95-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757323333; x=1757928133; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To+fyq1+DsW+Z7hPJvmq0jsMSUnqGvpSSfICJdqPr84=;
        b=Pu1fS/qIN5HN2datNm1Nj4uM/d1j2fbd2DLIm1Yw2STcVUR+g5u2F5sXIkFBffZcRY
         pO01KQMUNfodPDHx0ZQMZGjL+PAPwaUvmXYFE42U17M3KXyuPTX4uWfS/yPV/2bjiTdv
         HX0393ly6wYNVElSroMIqqqxuWg6zpPLCXrl/CKm4IJMTbTf0K0oyRgeFJaMQbb5fLSi
         ro7TMufXKn6iwae0TCToKlIByXJhFk+SV1JGgQrVaeODwwlAeqBhT3VEiP09ccHg71ka
         9/wBPFAoJ2wAkmmLKyTPmOmDNhyQBKbwAiLGRxkVAC67rKj3BA5KQFhvc36wp7/zGfjY
         7w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757323333; x=1757928133;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=To+fyq1+DsW+Z7hPJvmq0jsMSUnqGvpSSfICJdqPr84=;
        b=C0xdWNcomCaEUTFD5QX9pau8ZzwIQNhNYGUHdRrmwQz3ThuSfr6Z1VWfLxeXbkh5s6
         Yorj3ogh+l7qX+O9+pJjV9+80Aaw47nK3u9Hi5xAcnJSOI0aF5W0BXegwKL+tukbSDFG
         DzMmDAAMPYZXf8ruylxqNZ+UkW281/AbdVHpwOx9dPXnR+5ScbmAkXpfWqbQnI9qvbV3
         vLHXKSORM677FYVifaAUVaEA3RJF/5XDvzEKvQc9BMw7sieNp4rxHJ8oMh+7g6w7xfDe
         hK187Meio/jFT0caZ6r0YGKFpZwfePXRQV+70IUqrJYhMkPj4EL18u+mCuRRc+rh4Yo+
         ADfA==
X-Gm-Message-State: AOJu0YwFOrWnehFYsXeV+UlcUVGMMcdKK+dbh51c99pQA8dkQf7vdE98
	ijZRlB9fjxdscvky0vDBTb1rvX8GdwR4yUsiuu5sve0ECjxr705rPVHIvgkcmsdfL9Rv8q9tssb
	0eh8=
X-Gm-Gg: ASbGncsuCLNUWoMYu0c3v6eGkApGiO8d+AxfGMnTmvd4EiWQRRL1zDlQ6WwW/wNBvuv
	UHUvMtFTRA6ej0x42DFtSmMygXAfofuP3ENKWV/jWGvWxnewosGasVxCqNBaFEjTazb+5dFJOEK
	+p0DnkqUWKy/6I/afYJJ45GwIYUWuGXreS2ungT0fq3k6XzaUl6sWSfh8oAfDP6MvFjGWO32K/0
	8KJU7cAkMGsMA5/Lb+bLbUFFPN26vEoHISZ5ivT9dQ8GJfYSseTm42Ti8/iTZPM5TbAQnF3R4eA
	u6P6TTSIdSDlAuZHXUAGteizsACzQgn1m3mji0WAU+WAXng2VfAOHbySaCtwey44OZEiI86nWrX
	8/korlJOSYaM6avy81t8RhKRk919oQH2NRSrEp8/bSSTErljaI3LbjA8Vz43pOPYfCQjxt/7/Ob
	PegQiPZI32jadLojdNrg==
X-Google-Smtp-Source: AGHT+IFqSMQ4+y9luPqZJq3VrSrWEw/FSiwLEj+ID/hfLNdG0MjUPZP9FX/bLo1s0qyXjoT7vdT+lQ==
X-Received: by 2002:a17:907:3ccb:b0:b04:3a46:c4f2 with SMTP id a640c23a62f3a-b04b1702e94mr699330766b.48.1757323333074;
        Mon, 08 Sep 2025 02:22:13 -0700 (PDT)
Message-ID: <d5136292-e02d-47bc-b230-c85c6aba2174@suse.com>
Date: Mon, 8 Sep 2025 11:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] symbols: fix xensyms_read() hitting the final "end" symbol
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

A new "no (more) symbol" path there was lacking a necessary unlock.

Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
Coverity ID: 1665212
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -202,7 +202,10 @@ int xensyms_read(uint32_t *symnum, char
     {
         ++next_offset;
         if ( ++*symnum == symbols_num_addrs )
+        {
+            spin_unlock(&symbols_mutex);
             goto no_symbol;
+        }
     }
 
     *type = symbols_get_symbol_type(next_offset);

