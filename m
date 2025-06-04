Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0CDACE112
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005670.1385095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpqX-0000qc-V8; Wed, 04 Jun 2025 15:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005670.1385095; Wed, 04 Jun 2025 15:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpqX-0000nX-S7; Wed, 04 Jun 2025 15:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1005670;
 Wed, 04 Jun 2025 15:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMpqW-0000nR-M7
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:16:04 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3db2ac7-4156-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 17:16:02 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a3673e12c4so4598230f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:16:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb35702sm7690356a12.33.2025.06.04.08.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 08:16:01 -0700 (PDT)
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
X-Inumbo-ID: d3db2ac7-4156-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749050162; x=1749654962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VrYmFIQbGOCJvVH7bubKFU+nq46q1ZjZsLP8JCXNox8=;
        b=L2AX7q4vIfj8rHzfG2rQ4mIkyZU/CE2eGpht1/rudhHD2YgJobPlpUKvfSEC5eMjB3
         TWkbyxQf+IlU/N1QRVdWdguzWfvMRVinHWGzWjILU6ANlJgPzWDd0Bn+MVRbipvUQD6Q
         1XoTCkevKvGM4GL+SUekqbcvwHzx77OcxWsiDZc6/Gd7fkS9FSvVZmZUtJMir4NOQVDJ
         sfGdarUiF81hPnTOA6+xiKHL8A6T/dhYgVTjUywhWU3QY/WXaOFRUnUtwqxJcg80FQB5
         +FkSEFN6V5slYdohKtgBRMKkManxkVME/Xr28WWyEnxKWyeCWS19EDaxqGgQKolV5n+K
         DjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050162; x=1749654962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrYmFIQbGOCJvVH7bubKFU+nq46q1ZjZsLP8JCXNox8=;
        b=kRnoBNJ+94vhDtmolLewisM/T82f03qcB/bBhyT5O74j72Wr1sn0g3xW1nlcj4+/XO
         wJwsEb45j6ajFUCf46baxT+h28bTRuGnqe8YQs3ANDQKr/sRr3diYM/9hlSa8xEITPFi
         Kn4/flxwpzPP/XhuMhwxOcpoEDyLcTftmH3LqJfdASFhtP2PTAb2eF4NBllinCkZ8hZY
         nqmDI5AMtvUzA8aB5izXkOQEpFTGYD4KVN7oH4HTRGbNWDFSN1J5F6MIpSuirkLPWxzj
         /f7eHPgNBrI2w7sXoSt+H07QKhMt+EDuq8xiZaeabSHdR4rReprW/OFT+jmgBjyQAc8Y
         3WyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCpfdslRUptsUI9gETWxXL74DbZrFgPgBErUF20QfPGrD57sQTNPexUu82rRpCoHgQH0duQ5k4z1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgsIFbotKBByRbT+G5nvUqtjY2nRGl17gAe7Qk/1RuX+46R1Yt
	+ZMZbSwXS/S+ZG4oeWXm48gUyQ4yb0ewr7E9qypW10EH8tnNaR5DkoDLda6VnlFugw==
X-Gm-Gg: ASbGnctFjRZa4e7r1fsVHldLY2+5g3LNR3qQzB0g+zWVKIlc4IhKIfBut7XQtykgOij
	u2F+FUT7hsCNz/qhetkBIeJdvxL3zZ4g1eIsWhTVVZVOOVzX6Fei6QAN0k9Kz3DBtDW/R4lLQn5
	6MUi5zh2ttMZtsyA/dQAo1PGAMJwJRE4YI7hIkpCVRoRzoIq0oRESx+ybR9LMTRIZCSjb0rRPq0
	I56CsXdXDwj0gpKPLvdzoGW67xcSUMSOGKgS2LukOKwFsoQR4sh/hgFErU81fOFazjx8iwV3dJg
	a4pYjh/r+7DBrrVHGNBmO3Tr66fCvDZS+qpdTjeoCLCQKLZihC0Mlu1bUK1tZhJqd0BNjPH9bzu
	xM40eTnmw6E9eMelMUTp1StaKCZ/LQLEBAlvIIkWu8XwyPO8=
X-Google-Smtp-Source: AGHT+IEedwOOlksAyr7VLCJx98WGfZ4X+I+UB4nt7jJSsMnNRdyZLCwkwsium2ep4id77ZyPGqHNhg==
X-Received: by 2002:a05:6000:250c:b0:3a0:b84c:7c64 with SMTP id ffacd0b85a97d-3a51d8ff9e2mr2515175f8f.13.1749050162040;
        Wed, 04 Jun 2025 08:16:02 -0700 (PDT)
Message-ID: <b212dffb-0efa-48e4-9899-104db4754446@suse.com>
Date: Wed, 4 Jun 2025 17:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Process pending softirqs while dumping VMC[SB]s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Aidan Allen <aidan.allen1@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2025 15:02, Andrew Cooper wrote:
> @@ -246,6 +248,8 @@ static void cf_check vmcb_dump(unsigned char ch)
>              }
>              printk("\tVCPU %d\n", v->vcpu_id);
>              svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
> +
> +            process_pending_softirqs();

It's only an RCU read lock we're holding here, but it still feels somewhat
odd to do this with any kind of lock held. Then again (I didn't even
consider this upon earlier insertions of such into keyhandler functions)
we may even be holding a real lock (the sysctl one) when getting here, yet
apparently that was deemed fine in the past. Plus dump_domains() does the
same as what we end up with here ...

Jan

