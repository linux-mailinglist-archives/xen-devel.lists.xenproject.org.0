Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C12A7A1DB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936646.1337837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Il7-0001EQ-0u; Thu, 03 Apr 2025 11:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936646.1337837; Thu, 03 Apr 2025 11:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Il6-0001Cy-UT; Thu, 03 Apr 2025 11:29:20 +0000
Received: by outflank-mailman (input) for mailman id 936646;
 Thu, 03 Apr 2025 11:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0Il5-0001Cq-TR
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:29:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d52477-107e-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:29:19 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso4820225e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 04:29:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b8ae1sm1577366f8f.51.2025.04.03.04.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 04:29:18 -0700 (PDT)
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
X-Inumbo-ID: e1d52477-107e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743679758; x=1744284558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1hgtLHeUx0/BP7kMGb1rHCPAsT4+st2ctrCwWoIE24=;
        b=QlbPrgATGLG/r71ZN0XDhjxaJ9KUzmEKHYa//CabgwL7V+v4WGPujbFMtwT9JXNC4R
         xOR5edtRz/QJMNZ6OSvP8jiqHq7kmxYqur922KL+Igg3NVYpq4aK7LJRn/Dwd7gPEMG5
         6MTWu1GOLyTd+g4fHxtCpPoAmZBEIJ45sYMYj4ummKUHrK2vw6e44YSMjjCN0yVhXwdH
         QTRPWlW/kI9Xz9JmIc+CJLY+PpKIO+sYedj2DuPwYVDwrZKqkLVi2zQtCc4G5UKHQSAL
         fNJ0a/1GBlnPOE2vy1XMIjKFFBG415l83omY7RpaOMtm5mW6jJQNug2nrWd80dY+4KBj
         0AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679758; x=1744284558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1hgtLHeUx0/BP7kMGb1rHCPAsT4+st2ctrCwWoIE24=;
        b=mS73NgLnSk2Lxi1wzvon3DDkjcgxsF2LOztLkH6FI74+5eG4ufSZ44JZfYI6OMbccm
         I8lkXupZjCUXeKdG/yg7Vte1C0H3BVCGKOjq75hBjWvUogAPtr24pHZaXXzuZwzIwcTp
         NU21z/sAXkp0G8/grx0A8hCbOIYtItfiMm1fDc8ZiiVIPe/r5A75tvRhYzfwbLIzaASp
         evpIV65XNVcbsUjPzagzow698buM+xYzjS8koKp02iLfvSknDGAXuZhnJIao9YsbK0Pz
         1wc2H9jAVNHWQcZVN92w+qw+ESndJCJgNQHV3aZx/wDIwAWto2ADwCEK1cnZYhoWXwId
         zBtg==
X-Forwarded-Encrypted: i=1; AJvYcCUKyj5kwpgujOZo3mgEcRsYU3T4/6WfgDvCd4nlJp2Vge8yORxtrMuN1BOluXgIf6l0ERH71NK/kW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/xHtVv0jTHaEbQlmUeV4FSqdgT4MnAXCTbdP75QCaQfw0InhO
	OSxLitrmvZrTUH0oyE/4z3yNK96w6Jx7VR6BtAt77PbFNjaQOvjMyNscpddycg==
X-Gm-Gg: ASbGncuzbVQaV/PmTQDv7Rqbv+pOwYTztxDdqm/22kz5mkLFx8xyaCXxKBKLyGE8nSO
	Va5bXDxf2fNk6qPe5pModRn1ztplP8o3KYDD9FoUiGmibtLGwVohaRdVCy9PXdwjm2Y1Hf4ajvU
	puEFTxutMBeRWeXEc1FlCUwKkcMgwoFx3GJXzlenv790I38EdkoNZkt9KjUBfiSG2J1rEolLifC
	qZjyUqjkwdPQahYeEOyfIFtnYQ4X6E5y5N2i8DEeTfWrXPdQOqvDQR0QJEZ0f3/atiNs2+Bn2hW
	lz5Qy4wTmKzXP3sbg5V8V8MgM3u6+yDm50GY9wCFBNWniij2LTi40XHB/+CYpyBEndX/bT5f/OZ
	CRVHP8nLSwF4LP0n9Rm3POnSoyhtD2Q==
X-Google-Smtp-Source: AGHT+IGt8LsZupWO8aiGn8SX51kaAd5qf6N8nzOIlNcu6sHqWTXKpLFBgSTG2HFpxWfO/QB2F8jesA==
X-Received: by 2002:a05:600c:190b:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-43ec13fdf41mr23281975e9.16.1743679758550;
        Thu, 03 Apr 2025 04:29:18 -0700 (PDT)
Message-ID: <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>
Date: Thu, 3 Apr 2025 13:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2025 13:04, Marek Marczykowski-Górecki wrote:
> It fails on larger initramfs (~250MB one) and sometimes even smaller
> depending on memory size/memory map, let Linux do it.

Iirc grub only unpacks gzip-ed modules, so wouldn't a yet better approach
be to use a better compressing algorithm, which simply as a side effect
would keep grub from decompressing it, while at the same time moving
farther away from any critical boundaries?

Jan

