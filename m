Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB9889B7CE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 08:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701736.1096129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtikF-0007oW-Tl; Mon, 08 Apr 2024 06:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701736.1096129; Mon, 08 Apr 2024 06:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtikF-0007mQ-Qq; Mon, 08 Apr 2024 06:44:43 +0000
Received: by outflank-mailman (input) for mailman id 701736;
 Mon, 08 Apr 2024 06:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtikE-0007mK-0Z
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 06:44:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79152f29-f573-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 08:44:39 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4168a5d75c4so451525e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 23:44:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b00416770871f7sm1889348wmq.25.2024.04.07.23.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:44:39 -0700 (PDT)
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
X-Inumbo-ID: 79152f29-f573-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712558679; x=1713163479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCIHWXF2lyNJSWs9KQI6aB07fYaouarYQjiZpMHLirk=;
        b=KYCoJwZCqjfiywrhRKKgrHQm5AujoAgfUCnV1vzpBbeDC/P3sLnOl0/jRz6CK2Qhsl
         lNboyLTrvCsT3YbZZLn0qXm1E4c4bJxE3D+1Xt7czHovQhsXatBxiZ1K5k/hvhx9QuDH
         rXjdEvEyJLyLU9jm1MEhasU8tF0H4lhK52FZOVY7lRSQnNNLTQFPa+tcmZjoklaNmq3W
         kmO3NIRrnMqjJ6pFRBg1GXZ21sBr51HP/vw/C/kPFEH/2BEHs3/sOET6VRLGBpUe2aIW
         FB25+b5YJWoefyf2RIB8RJ1xkCBbOll15/5+x8Unl9SW/autQdR7gCzGItdQcWdLigQ4
         QKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558679; x=1713163479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCIHWXF2lyNJSWs9KQI6aB07fYaouarYQjiZpMHLirk=;
        b=bC9CTJ2jiePbVBVhjMXZ+CaSfG/e8gS4/874aan7asoJf3IWV1FbtaAY7kcR5Gdzyn
         rKmL/0oALb2UYvCo7VPoxtkHXEz/S+ALp6pobX1/58oTSnboMKoNjt8Xd+SKcRrMNVI8
         bJJPnU3gMPbzeOy5bXAVi+DHEjkSZns+DGca3gOq9uq5plle+iI/Z6vu2aVgMFY0b0Ny
         FsM+gjoQmTbWXmSjsq65aaEkV8nCBC10bTv0ktv6YNdeXoOFkUzXKa/Q52jdUZ5ZY/7x
         8k9Z5RIw5Ga9R6eQLwMXu8ETlbhxKzC3njGykwVtxjBFHn4I1U4NYC50of964MgpQbs+
         SJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs+X8fnwuKMso/KdwkEdIzCavZ60WjeDJ8xMqu82BIafHuQVxMYitFzqgN2P+mylWYa9x5xMj11ZtDA+NfG/KCGb/9cjoVHFhXGBLyiy8=
X-Gm-Message-State: AOJu0Yz26QjXw1vWthQ17VJpXUppLZzK9eX7YJnqZrZ/scIRii4t64TY
	9ljNLDTQSl44g2KwR4n+MXMDxrMBrZ94FYXz4XtCsI6C7uErkWUAEFB4brn9cw==
X-Google-Smtp-Source: AGHT+IGiFftMmnIy5QKQgEebKMPgZZeFUYblfobQkA4H2c+2wM9Q1gI5ng8OQxuxwBfLpNTSREzUag==
X-Received: by 2002:a05:600c:b99:b0:416:72a9:96bd with SMTP id fl25-20020a05600c0b9900b0041672a996bdmr1297040wmb.20.1712558679476;
        Sun, 07 Apr 2024 23:44:39 -0700 (PDT)
Message-ID: <0863b4f1-47ce-478a-88a9-add009d4a23e@suse.com>
Date: Mon, 8 Apr 2024 08:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404051144020.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404051144020.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 20:44, Stefano Stabellini wrote:
> Xen makes assumptions about the size of integer types on the various
> architectures. Document these assumptions.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Thanks, I can live with this form. Yet I'm afraid I'm not happy enough
with it to offer an ack. I'm sure someone else will.

Jan

