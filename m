Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C504AB3842
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981443.1367840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uET1G-0008AP-Fs; Mon, 12 May 2025 13:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981443.1367840; Mon, 12 May 2025 13:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uET1G-00087W-Cl; Mon, 12 May 2025 13:16:34 +0000
Received: by outflank-mailman (input) for mailman id 981443;
 Mon, 12 May 2025 13:16:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uET1F-00087Q-4B
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:16:33 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51d25c7e-2f33-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 15:16:31 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fbe7a65609so7228635a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:16:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2397f76e4sm421679966b.21.2025.05.12.06.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:16:30 -0700 (PDT)
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
X-Inumbo-ID: 51d25c7e-2f33-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747055791; x=1747660591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=28ygnLv+YxBBbD/HB3d/4WbFbTv+JnAin77j7lJJENw=;
        b=BdF7NcmiFbI3/g3Wsk4Sf6oyssQfPrUNRqlU+q4MUMAkzV0iIO2LZAyFFR/Z2I65Oe
         8Btnc/pe3KYSvsMcYIdNZyIw0Pxi/yyZELz1VtYgihZxQIo2M+yUfJFu5wk193kYd2xK
         OpgMI0gUSX+tUGxiIQ7Iy0nwc5m8omwjIuLu8PSE0AcfX3ih8SbtZN4Xd9pCfE4Hv0hZ
         M1Ca+QmKkv4Gwi4jWs7veHzcRT4neh/iokQhJXqnL8aeuVpgticwHtGRIpXYPVy1rLgU
         mSajvD7Soe8E8PLwpbo7CzxeNlegtdbi5XnomhOBZPQmWJ9r6X0R0DJah7z+hFW8pboQ
         HOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055791; x=1747660591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28ygnLv+YxBBbD/HB3d/4WbFbTv+JnAin77j7lJJENw=;
        b=W0AwzHAcyVUf4rVTo+hnrukR/IMO88etQJ1vEqN0iKmS2oMGGHeIJDHLLFMdMrkwas
         6xYJIMQV6zySExOtJK2+BU6BOAzaA9xEWO+HFXLIAi5qrOkzMWAKcRmMDqgTp3nPWyqP
         /Hb+S8e5KiN1NhYV/lN0YX+IzxIBAqWcTLTPBFgrl8jVwqQqQMgLLn51XOl1c0UCKyBy
         CqJK1w7KfGwk8WfcwLYzAeiP0O8n3u34xW3itoMyHJPoOXIpPl3pTW2xbezO9vHL6Wfm
         zGTBuow7whcLos7B7xD4G85NCsfaYJelvfIBPyb3iHl+zgmRouMCv7K+OoSJls7LptBC
         sXyA==
X-Forwarded-Encrypted: i=1; AJvYcCUWlP1NRyQxZXLnU6RYC2GXbYcAPlTn+CGL+oID27IcybmIKTynlUSGgv4DCp3z3npFiPWnQlm/SVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2+ftFCiwGcehW7gpB0ObBkpi139urO7IWYcv+AlmnUQfTOPiY
	7dljRKCrS2o2k9ShUt6XQq+YeR+mAdZn4iP9wbC8mBuFoUbPsTdQMHpSQRi1zA==
X-Gm-Gg: ASbGncv/MBwckbS6A2LnJIcL+bx+CaaiCs0iK8Sd4Rb6oEKCkY7PlGWsFA23e7RYFL5
	gnqr1Eney/iZLn4M16FV0fafe4EHI6hr7W7h+5Uyx0UNaU4PHIc95eeK8y+wugPcCrkKnfeJ6ay
	TWAgZyqIoHVgWnpw8YOClpM+4jGrT945Ni0gTEPzFUWl80iuWbPxQdNIO6EVrzT0th3qvbHTLOX
	0idW6JL7HEzX2xueLE1AcqnarP4aUdFi3R/fsjC4rSjPaPFpblG+B81P2VIbtiVAuq+cjjVup88
	FYYToX7+WpZh6j2MaRj48roqrPZ/ZYT+PpR+rIL/VXdjvKTzTr/vlnLipB2XeyTLhZhQq7gBwJY
	S7RPmRjtglOERx5d3bgvZU1GUwibxcS6NEm9D
X-Google-Smtp-Source: AGHT+IFEhzs69mAnj7zPtZ3ZzujnBV3aQ/mjNEvQMYSCvSM2uYnqlSvHO2e/v2hjK7VqE//jz5Q63A==
X-Received: by 2002:a17:907:84c:b0:ac6:fcdd:5a97 with SMTP id a640c23a62f3a-ad21914204dmr1288107366b.48.1747055790692;
        Mon, 12 May 2025 06:16:30 -0700 (PDT)
Message-ID: <b5fbe7ca-ca90-4846-8c5f-e67dedf7367b@suse.com>
Date: Mon, 12 May 2025 15:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/elfstructs: Include xen/types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
 <20250509163212.2948359-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250509163212.2948359-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 18:32, Andrew Cooper wrote:
> elfstructs.h needs the stdint.h types.  Two headers arrange this manually, but
> elf.h and livepatch.h do not, which breaks source files whose headers are
> properly sorted.
> 
> elfstructs.h is used by tools too, so use stdint directly outside of Xen.
> 
> Clean up trailing whitespace.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



