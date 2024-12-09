Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CAB9E98B6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 15:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851413.1265491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKegb-0008Ps-Uk; Mon, 09 Dec 2024 14:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851413.1265491; Mon, 09 Dec 2024 14:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKegb-0008Mj-Rx; Mon, 09 Dec 2024 14:24:33 +0000
Received: by outflank-mailman (input) for mailman id 851413;
 Mon, 09 Dec 2024 14:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKega-0007vn-7H
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 14:24:32 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d935129-b639-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 15:24:30 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3863494591bso1023679f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 06:24:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2708b8f7sm9846142a91.49.2024.12.09.06.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 06:24:29 -0800 (PST)
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
X-Inumbo-ID: 4d935129-b639-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733754270; x=1734359070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xza+nitPHaeOIRJlQMRvXUUaHgI74PCwz8BIrlAVq8s=;
        b=f9ZBloRiZfZ8blZOukxRM4n71i9cYWvbryt7WKqrXR8Ebf4KRkpI6sZdwBkhPCQGyA
         uaHYZwo4EpRV3X3RKb4dyAFdGpuOHTBw8keNAcJKHwOj5v+hXdEWyjLgJurxWrXAw58O
         AfcRN9Nbws+uIWVv+UIH0NEw2/BSz2h5f2J6gLb1QtUWRpUnZrf2erCjz7EgCXcZyxMW
         ULhiEVRqH5rGzZB7F3guAd/wP1vg2tAcBJF1hbz1iUL6IxKpIV596XZ1lEzQ0FqV+MNc
         6koz4ZWRYvoOiAGowuMV2kAEktoOl2m0UTMi+qlg8x/D09aI2OW+w9sYKuzp8oYKC7R6
         0o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754270; x=1734359070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xza+nitPHaeOIRJlQMRvXUUaHgI74PCwz8BIrlAVq8s=;
        b=liOdQnoCp4mpg0LrA/XXyadgUFiaIYhcSNqoNDWXVoFaJ1W2aCbBgZNfgzyRN14V2J
         J6Pp1LCIbYE/Pk4Vawk60UmGe4Ds1y1dghw0wzQKoFirF0XfvQUDqnXt27bUh29z2ij3
         M/tK/sTaQ0iULyF0TvArM8/d12/E7DOAA40j+Hbh4Flc80oH0B5uTK6Lt7yro3mfwgVn
         jFHGbpd4LebaeM+89dQ86/IdhotgkUOTUsunR2YzyeXTfGCKxycIZ80S8fY3VyRA96VX
         Opn151NFi6+8cNNr2/ZuSGa+9PjDuZ6QzBZ0aY7YwAzsvz5V0k4oJKB2tOcgACW+tndV
         iBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/fzGLh+IJskSR+EMZIWrnUPE/D6fh2qZvXwdDtF5E+8VEo7FNamp3qdi4jI+No+8QgDZ1Z7KS7eo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yymh1RvwGa5VzjDAhngYUydHjfWrrUxTveIzWjAlQWRoIaLXhVo
	M6jixHPTKgfVtl++mv5JIGcBchIs9d8bmffDPdH9ylYkGV8331X5RtNDL86ABw==
X-Gm-Gg: ASbGncumnUd7zbAANQix5CyGErXW3gZhDIFbzTGT8GJ5CVLWmNl3XXRE37uVHD5XiTX
	psV3GnZ+N5p9N+FH2QnouXq0KCPllJXqcPWGEKnsXAayg4e/zlX6czjNlh7oNBZPVsnBwlRdv6N
	nV3NbEYpD82VR3zrC5PC/sarTu6PIUtElO3dzerJn9gYeta/6yHHqgV8kUVSe12xInaxEE3wrao
	Zzvnp53KKbtRwSnBfXKi9uMAJ9ycixe2G/Uu9Hf4/KvekajrIlHd0MwKlh2aQbf6OXTjbrrb9nL
	GekV9eQtlQUnOFfPf7XIMmsra13k32d7fOY=
X-Google-Smtp-Source: AGHT+IFIwNCdqD80RGiAPLqkjZVd5JuPc2NnouMJsWWAwjoFRsp+/9MZJxLfuLNvelzeeR3axyfBhg==
X-Received: by 2002:a5d:47c9:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-386453d6c46mr471864f8f.22.1733754270185;
        Mon, 09 Dec 2024 06:24:30 -0800 (PST)
Message-ID: <17acd01b-2342-4daa-b73c-9f118da38e17@suse.com>
Date: Mon, 9 Dec 2024 15:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: reorder includes in asm/page.h
 alphabetically
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <4b458dea207cc6f2c2ab5d5a3d67ca9f6d5958da.1732709650.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4b458dea207cc6f2c2ab5d5a3d67ca9f6d5958da.1732709650.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 13:50, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



