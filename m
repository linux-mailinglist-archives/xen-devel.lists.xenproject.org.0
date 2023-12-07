Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8C08085B8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649765.1014628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBu4-00056n-Dq; Thu, 07 Dec 2023 10:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649765.1014628; Thu, 07 Dec 2023 10:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBu4-00053t-An; Thu, 07 Dec 2023 10:46:48 +0000
Received: by outflank-mailman (input) for mailman id 649765;
 Thu, 07 Dec 2023 10:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBBu2-00053n-Vp
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:46:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9fc0a67-94ed-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 11:46:45 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-333536432e0so707507f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:46:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b003333c2c313bsm1103151wrp.100.2023.12.07.02.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:46:44 -0800 (PST)
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
X-Inumbo-ID: e9fc0a67-94ed-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701946004; x=1702550804; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqo33Yk2KU43QCZVEEkVJ3s4U4ViuGvdy1fL8Tumqkg=;
        b=We8280aF8Hy9CebANqIVytBCVH/xZnieqLkVPA+Wd5EjoMtzLnCMBUau+tVsuczNcD
         TD3vDUFNz6HrXg5jfqEWBrrxsg4bFDe1s3O0bVW+sXeUaN9p82BIx2aTBQNwrYC/mnn7
         IbpOja8Lh4Ml77I6KY2sgs/9PromjufazdVqgnIG3uKcWNg12VHvpEzwMhC7nvBSmgQN
         DwYW5cTUqrDw8DWRgAIA/Iq84MjRiACAHi5humC4gfvNHEQtjyCwEChJKtMqQqFCklfO
         WIKEM3PDYj1MC7x68EDM5/LwaNPzgu4douTrRJFlb/xk3hS5X/eNUhOta19/TlMdkSHA
         E8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946004; x=1702550804;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqo33Yk2KU43QCZVEEkVJ3s4U4ViuGvdy1fL8Tumqkg=;
        b=Nu4lfmqsS70/hQ1oTfIFoKLDEUUnywycgG90j9RSHPhhmWU5PtcCVaTjkE9wy8SHS5
         pJIx5MYXpXgH5VM+8/waHzBC4Iwh0wJAcnEE1DT+nB/Ss75k0XcS0hPDI4+m7SkbBE9K
         nx5opLWqBRKFqcM3irc3d1HvgozOkJmQAaxZaIRdb+PAwV8FnkWrCNw714kV/i+A7Q5Y
         52p30y3oX8wXZ0amitnq23qiDRuQVhzy2UJuJ9ZTym3srr/0XdlLBjiTu/TokDJzOZp+
         PMzj1Fj9Hfbqa7vuGCoshhD907UOQBd+HdOtCuCXyOdZddB0EWZ8dUHlgljZ+Sh/M5CO
         aMWQ==
X-Gm-Message-State: AOJu0YxNoW1xJQG8ZMXAvLYwydGPiCJwFiKmpQAGl0wQSal3pww90f9s
	nmUktjDxfqh9J+MggNjs+TODFWxWina8L6hKqcbt
X-Google-Smtp-Source: AGHT+IGNke+Ib9OLp/jVGt/rbmFpei8DBRO5RLic9P7zkVkWhDH4+uijROBBVEplT8a6Edj1nfnTtA==
X-Received: by 2002:adf:f7d2:0:b0:32d:9d3a:d8c0 with SMTP id a18-20020adff7d2000000b0032d9d3ad8c0mr1428169wrq.60.1701946004555;
        Thu, 07 Dec 2023 02:46:44 -0800 (PST)
Message-ID: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
Date: Thu, 7 Dec 2023 11:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] build: tool option handling adjustments
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

The first is a fix for a latent issue (which became real with one of my
pending changes), while the 2nd is merely cleanup noticed as possible /
useful to do in the course of investigating.

1: x86/EFI: correct compiler probing
2: Kbuild: simplify as-insn a little

Jan

