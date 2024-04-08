Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD089B7B3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 08:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701729.1096110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtic2-0005R6-S0; Mon, 08 Apr 2024 06:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701729.1096110; Mon, 08 Apr 2024 06:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtic2-0005PW-Nt; Mon, 08 Apr 2024 06:36:14 +0000
Received: by outflank-mailman (input) for mailman id 701729;
 Mon, 08 Apr 2024 06:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtic1-0005PQ-Vy
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 06:36:13 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b132fe4-f572-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 08:36:13 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516b6e75dc3so5010034e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 23:36:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d11-20020adff84b000000b0033e7a102cfesm8161402wrq.64.2024.04.07.23.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:36:12 -0700 (PDT)
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
X-Inumbo-ID: 4b132fe4-f572-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712558172; x=1713162972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvqhavDAF+jKlOZbCyPM1gJYd3LyK2rmrFJ2kIM8BGo=;
        b=exAlgqPhVjKEp+O5AR05ucNq4Ok6dRCjnUG6f5LgK7BtOp3anwe4w6L8f/mh9XTUBD
         4h5tVDELUVGicwEJG4Bx5IM+jTRbm+/ava4sNmSjuJ9PjOBfIB5Wbr2hbv1mkdq1k6VB
         hERdxkbGipwtI8+AHV5kDVZC6ANMBB8pAYHPUNZ9pPu348lK4rGIfDGjlqUH7Dlaqp+C
         6Ds4sOQBmHJZF/LmdM+Zefux1awJb4q/Vc/tDOpivWwTWRkP8Nr+KmLM7UzWF+56nKxp
         XyPZsLhyXVd+Zayg4QEA/zat6Rh5YF4h+VDbP8GBSetD8Z49oaIWkzfv6Ev2JkoTNAHr
         XLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558172; x=1713162972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvqhavDAF+jKlOZbCyPM1gJYd3LyK2rmrFJ2kIM8BGo=;
        b=GhSYZKZzxH+3LY6OFj/y+mlkftnbISpxJCMg3O1SXPYjP23gpssnMKibv+an7YlWVc
         2fZw86Ym++l2JAne29vu2I0v0yFj2bX7a7Hg6/v4CBvcysoH63UUI4q2CLn+HTwkGJ2l
         pCRrQVWDEquYAhh5rYr8sryx984+cdt/WTr1zMLkXH+ZGZoUkQZFfdKtBYTm8hQQstnh
         cUrKUJ+9Qs0jocihxQdHAg2Ya9r2DocdYE3bJg27+h1AmBsdiXq7I8nNoyQmNU/ILdeU
         nUxwK+ZjaHNnlV4K0BERmFRWR/RFgpozoAPGrDnGeIjhs+S76kbPl+RQV65zj8Aeu5tI
         t+dw==
X-Forwarded-Encrypted: i=1; AJvYcCU08WTU5Lv+EkxXBHQfU45UtphL+FC/26hP+rqDTG+B8xK+rtHtJjS2s7n6VBrwlhoc8NgoVFGrWov3M2Tvem6IPDF3HP3uNX5S1SV7nBU=
X-Gm-Message-State: AOJu0YwdVeRJLegw5t0YDVtgVazlgy9TJcGsmF0SPY7g/tP20zqLPN+K
	xad1uo7qJO9QC1gpI+x/y/vehmTxTBOZHIL8oXOAp8nOp+sFNJm53lqPeTMTyA==
X-Google-Smtp-Source: AGHT+IEWkViVOGI6beku9exmoy/ec8At4MFVL1JfjJUkGAE1CXu0PuKkHjzeZP0VAujU3g+ufKmfLw==
X-Received: by 2002:a05:6512:6c9:b0:515:a5b1:1dd0 with SMTP id u9-20020a05651206c900b00515a5b11dd0mr5995755lff.55.1712558172555;
        Sun, 07 Apr 2024 23:36:12 -0700 (PDT)
Message-ID: <b5ab32e6-60ef-483b-90d8-233c9779501d@suse.com>
Date: Mon, 8 Apr 2024 08:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] libxl: Support blktap with HVM device model
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20240407204953.60442-1-jandryuk@gmail.com>
 <20240407204953.60442-3-jandryuk@gmail.com>
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
In-Reply-To: <20240407204953.60442-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2024 22:49, Jason Andryuk wrote:
> blktap exposes disks over UNIX socket Network Block Device (NBD).
> Modify libxl__device_disk_find_local_path() to provide back the
> QEMU-formatted NBD path.  This allows tapdisk to be used for booting an
> HVM.
> 
> Use the nbd+unix:/// format specified by the protocol at
> https://github.com/NetworkBlockDevice/nbd/blob/master/doc/uri.md
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Please remember to keep tags in chronological order, i.e. R-b after S-o-b.

It's also not clear to me whether this could sensibly go in ahead of patch 1;
for now I'll assume it shouldn't.

Jan

