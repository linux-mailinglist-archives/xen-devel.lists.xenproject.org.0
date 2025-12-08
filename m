Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB777CADB58
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180927.1504024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdrh-0004Gq-Az; Mon, 08 Dec 2025 16:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180927.1504024; Mon, 08 Dec 2025 16:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdrh-0004Di-7l; Mon, 08 Dec 2025 16:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1180927;
 Mon, 08 Dec 2025 16:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSdrf-0004Dc-6x
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:13:31 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5c6ba46-d450-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 17:13:30 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477770019e4so49656755e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:13:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47930920b6dsm269434355e9.1.2025.12.08.08.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:13:28 -0800 (PST)
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
X-Inumbo-ID: d5c6ba46-d450-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765210409; x=1765815209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gh3qUL4MQb25aPiqKltO/J2z0usckCTLzhS1znvJPMI=;
        b=b7b600OC5Q22dlWkoq/mg69hXVAPxKi8mBnmmLknJAVuFZ7oQpauXCrScpS86sDj76
         BF5gUe9ccWeyGq8KyxfCS3YjfM5lLJEuCvfR08jBiGgNzLG1PGd8ZM90oxUy+15KQWG4
         xbxFzpwlYrH5HGqk0PEuSOZER+rI1oF6ZBVFCsN3xxFP4q+3G9k+ZdqDIOMTwPSMvUth
         g2mmyQSlB7vpeSy2d5TRziYq0UN8HSRgghaL4bZ0tTZO8NS3j8pePAN5eRAWiYedYqZh
         ejvJ9m9JALRseiYel5AyMoRI1RWdnxxftSJgvFsDh2uWh468OqARb30Sv1tlU5onX1BR
         H1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765210409; x=1765815209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh3qUL4MQb25aPiqKltO/J2z0usckCTLzhS1znvJPMI=;
        b=sUZjewsk2Lpttt5LpAjXXO48YKCr1xBJ0C3kg8027riZtogm3opasgdI6GguUw9OZm
         +Q9i/WYMH0kXWnundbTt/zdXiDyE4bxNvsi2k0lERjkpZB6PvKRe7+8v+vwJ1kyqEp5s
         vCjxlg+lTSVIbxW5Q6LVLBdnMyjF0nzQdUGm7+1KYK1IY+Oxe/giZUmAnTLmjmIAjRhQ
         rpf6EPiNTvYLuvaf4fg8y3/WSKW3WS4tIlNnevucGuYh9MXLcyd0b5gwc7WlIew8Mc6g
         ZnlcACSPDR20fBpOe1p2AjoJrhr+zoihG2oDwkQ6tjoM8r6Rb0gKMBd1C9hBngud8lZk
         abxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfp9CSkkAQuW5rd1JgiAmShzGLNmQXp4ualJoDZMVjHLxcq+uLphaTmXbPIdcqJVDa2Db5MRKxjMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQh3JghQ7Kn278GTkzZtUuSYsoJx7NWtoLFFQWFgfShSwhra4E
	eFb9pwWJ3+xaLTPrtXJf5PX9DJzVluBJ9355lWnd0Mkk3IiWBq+7OSx3xo0LwirvjQ==
X-Gm-Gg: ASbGncuDtGwoLsPd/DA0TPUZBuWYIvVDqurNLkXfYSTaDGB4zTmzRoFKIladsYSDs8k
	ap1/iKtjvJljmHia1D2IGX2z7Usu3snLhkTg94oyXmdtQfB7SlYs7yI7sI0TTkze8X8vauWGHXN
	HClzKb6GDbyoM1IITBV6/hnxuaJ4qzPyWYB86k7fj7Rm593Nsh7SwKhfy4UFgA4J6v2pTrEyWvL
	B84eD1UOQocNENaqih3K+lVfeXM9YKPLtZIi8rD3gweszSa98W3thxQ5f7CkUmizrbUn+aM2Cfc
	6tj7T7FVfpLVReoGzOppH6LCVzhtZNDccguelZzVTFHuwbKUz1x6sYlOBUm8EKHwvW7WcjNKN+y
	qsUUfFylldffYU11zqDC1qGT3l6nK2m2K55YSp6/CTk79cniaxTmDFPdZ5u/+iL0mqHPzxPP1jK
	PO0aBGwzZvazu7UcopopHMMYPo8dG2cz8chwfDQUo7NCjeafAXyGsLYelWV8D5qWfOoZmo7rQsv
	t8=
X-Google-Smtp-Source: AGHT+IGIUIaZqlmHz3Ob8nEv/tYCWZzNzlCm9smYHG4to6GtklGeYl92TYjgsnWPqi0Slu10t+os4w==
X-Received: by 2002:a05:600c:8b65:b0:479:398d:4bbf with SMTP id 5b1f17b1804b1-47939e03c36mr81507865e9.13.1765210409230;
        Mon, 08 Dec 2025 08:13:29 -0800 (PST)
Message-ID: <92dbeef4-6c86-42a7-b92b-21d91c987850@suse.com>
Date: Mon, 8 Dec 2025 17:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/19] xen/riscv: avoid redundant HGATP*_MODE_SHIFT and
 HGATP*_VMID_SHIFT
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <f2f2e4ad98ca11763a4b754b80ea79121468ee36.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f2f2e4ad98ca11763a4b754b80ea79121468ee36.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> It is sufficient to use HGATP*_MODE_MASK and HGATP*_VMID_MASK without
> the corresponding *_SHIFT definitions.
> 
> Rename HGATP{32,64}_PPN to HGATP{32,64}_PPN_MASK to more accurately
> describe their purpose. The top-level HGATP_PPN and related aliases are
> updated accordingly.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


