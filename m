Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EDAE6745
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023745.1399800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU44p-0000tL-2X; Tue, 24 Jun 2025 13:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023745.1399800; Tue, 24 Jun 2025 13:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU44o-0000r3-WD; Tue, 24 Jun 2025 13:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1023745;
 Tue, 24 Jun 2025 13:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU44n-0000qc-55
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:52:41 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e0aff32-5102-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 15:52:39 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso4306097f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:52:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118ea2esm8941179a12.7.2025.06.24.06.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:52:38 -0700 (PDT)
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
X-Inumbo-ID: 7e0aff32-5102-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750773159; x=1751377959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xT8pVmc99bP6/tpx5FsVFRp5st876WhQAswAfOva5gU=;
        b=W4P34lcGdB0MS76viJLdHsyp9m7XiatULB8JzbDj2snCoP6MhRfr3Z1/1SiO89+mUT
         oe/RCl/ql9T4grHQWwe25YluzyWb3gEd+pySXppx48S6VqznXMpt7+0j9COC/3X2ItUH
         15O7//sMulAP1gEteNNqy+iIgB96pVgfcXn41XA2o6uG4WpkUYXQJCWEZCUaiv2VMPLf
         z05fm+oTnPg8uu269I198dwZBsbLEnCCMic/4R4kQr8X1RwQmc4d3A4LyAp3T9Au/Gtj
         tumD8UtLRJjiPCPJ4kG8iB5yojQpnI7V+QOS9+YvW9TyCX4TN+hyQKQ3+kmqdu+xvg/d
         xxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773159; x=1751377959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT8pVmc99bP6/tpx5FsVFRp5st876WhQAswAfOva5gU=;
        b=J7H3RQDbbN7IiewNHtvzeaMZ7X1RYmRlb9ROy5kEEE4hC+rTDF27Kqw02jGRWHGCl7
         XZMPr/lOs0767ezhfucl+TPbhezjUpbuCesJgC0Jy36NW/sqosJbYJDvGWBFAo0VSo7c
         ACRH4PVKsKjC8DZWlLkV0yajRqbTBvJ0lmLsKziDqGDGymPBWpfTaa5BnQxxvoRnRApB
         6HAdJnh4j9zfAb8ZrmRU8voklUa34PiFzMpZZFIyp90RAXCNYHpSvWkCUKKnmkc9miwO
         SVUnrq9gHmmweqbcJ6zbgJkgJnQ58v+EyRbwM+K5RgNKWhLp2xQ0UL+MJUJRYvc3yMPq
         Tu0A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7XIQqEB1kWjTJWDYs7K0bgOB5RzIXZhIMDadVYncnvaGT6x9ZEBUhGevMExTmD5bGxnfc2tapxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz04b4SU4QsgYqqPHtk3bPc/I0KW+sPQ5+0DXMi0BZvbTh3qWo
	qOUez0zOHjXRDTJp0KA3fVqXQi9mOK/qezhtYUHvmhZfzfyax32m3g8aSjXouUJuDQ==
X-Gm-Gg: ASbGncsmeVeS/D3oZkcFmv/KlHpn8CThQEF6N1JuTWllzPtm9HhT/g4QXUk9oL1wluX
	8cXQoB+oGNQyTdDyyIQYLmNgo0Z8Bmr5N2Ac+MVrv3xEBrly2hDVoj5GZybaNzymjwt3ZqjhYCB
	rLcoMRFwAY034Mupei/mXvnP79jiR3BsqJGep2bOxd3qlCpGXunUkdv9tuFQnSFSYBLPHrAPXQw
	UHV8RSW2pNyzSevb4GTvLQxe6HKVB5Tiw4vg3hI/PHXsdMI6RBqDlofKyraX2WePeWdI3oPSqIQ
	pIcPs7g7xfgX/NKerq0DQMOy3XXc8yNmwiJVtSp5DfxkGhwtEf595UwaBaMZ8SMBNsGK2/s2TrW
	RPd7oSfFE8OmPAkF5AQ5PBhZCk0itAePd3FEitV6i9XluMAg=
X-Google-Smtp-Source: AGHT+IHSrZaa3CHTH4I+4Ok+QAKsPp4FLWzFw60J4Q8BqvO2TBrsPAXVdV3JpP5uNoOKkF6amBWk+A==
X-Received: by 2002:a05:6000:2003:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a6d12dbd58mr14346689f8f.3.1750773159074;
        Tue, 24 Jun 2025 06:52:39 -0700 (PDT)
Message-ID: <b3970f44-535c-4c52-9782-5bc0f1dbd763@suse.com>
Date: Tue, 24 Jun 2025 15:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] pdx: move some helpers in preparation for new
 compression
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-8-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
> Move fill_mask(), pdx_region_mask() and pdx_init_mask() to the
> !CONFIG_PDX_NONE section in preparation of them also being used by a newly
> added PDX compression.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


