Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF68ACF243
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006984.1386246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBpA-00005m-Vm; Thu, 05 Jun 2025 14:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006984.1386246; Thu, 05 Jun 2025 14:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBpA-0008VB-Sj; Thu, 05 Jun 2025 14:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1006984;
 Thu, 05 Jun 2025 14:44:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNBp9-0008V1-7o
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:44:07 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87f3b107-421b-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:44:06 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so854373f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:44:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bdd06fsm120655405ad.101.2025.06.05.07.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:44:05 -0700 (PDT)
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
X-Inumbo-ID: 87f3b107-421b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749134646; x=1749739446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9NanXTpNjjgTPjZfmAZcsWJv6jBI3rzDlUYGZAfdXqA=;
        b=LMT0uRuObfW0lUMSnCUDcmXATBpFsoMiusa2MuaUXcxoZQR+yXE27X6XwHJQAJKyyN
         FyvCyEArUiFRRK48TR8Z7AWv4dCAYMwjdWwGRJM5yfs2m4DARoWLiEeA0xcU0to2US4u
         JIigDL16JJqwTeVAHDpASLbRw3UFzyBOseFc+hAc38KCpcH7eojF837Ml8PIkSOlc+FW
         4Sf7v6fzbRMOHuKgnUnfv8zBtDYXHt46IMARoe+aMXwMbOsDLq5K6u4oeswnhBlherFS
         5jDVFPgr2Dmzn9xwBzt6DfSSbVcUayJk7Uabt9r+Cmh06y4j5aPpuErxwXBOUj1HRSyG
         x/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749134646; x=1749739446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NanXTpNjjgTPjZfmAZcsWJv6jBI3rzDlUYGZAfdXqA=;
        b=eCp8/VfTJoAunX3FwRPLpHk7v0DXradm1m7P/Bu5QbDtOXCbs7T4KcQsTZvW82G8rh
         d9cOaoLfmU9nTxO1G/XNuLIZuH/VUgXc3h2vcWavWSPAd4Rk5g6dGMiHJlPgp0CTiRna
         IOMzlBY1VuuoqB20U51xzHGLPsjoCYlByzb8EhlkySJcdROK/bIjWaiiQFTuxFhKKi6P
         Ia9wwvTcwua26lmBdx7svKxRaYBk6th/ybDpcMNMBiP85418ZO37RICbCFTxLTEFMs0m
         IdK7+VdCMncth3/ezb7fKlUEX2i/fJEzFGVKLr3d/Nom08C1BEytpgpFw7c7/FVByCkc
         Ksew==
X-Forwarded-Encrypted: i=1; AJvYcCVZtEOeoIACLKKdJdIUW5Td4HgX9RxY2toBeNvJHs1X2CZyX2JfEfxhtCR5TnDHQDwg6XnaVoOSNhg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIQdkffJ8KBgxLndflRRoiERR64g+J5dRj2qIKCSLrN2Or+yig
	FE7ZEdZ6KuUIduIplXLo06D3kLGp85NaTW7xg9APNNBFHbyC1lhnueflIoKCvdt8tA==
X-Gm-Gg: ASbGncv8ThulNUQPCBgNTia+3mJoo+2ZGv4CkSwodIp7KyyAWmvZ3TSzO/m+UCSO6gB
	7WNR5bYylc5qxXsuXDTRB7bha6ubjtvp7gBvy1/CISNVpXwyMxtuJ8pY6Sn/aE6kJqOAifBF7dr
	bncMnbEOb3MNfS4g5OK7/n9wcr1tG0vfmUS5K/ptIo8/OdymdC8KoRLaUcc3RVTiiwQOquM0Sks
	Y15HjXfEcKzBrD3FFd8HHZSbdz8ALubRwFhvac6Jpj6yIO+ZzN3p93gMy6TGz5mUXrSBgMg+aH4
	5Ct3YNjioux1GRpWrsMOcNk9IJolay0vNd0+UjAWM1bidktLdIm8P7NCL3abn4PbqQE3Pqdv4FO
	g/aR6V0yAd+vm+55Oi5FWXEE12vA3HRuXkc/9im34ywfNQJo=
X-Google-Smtp-Source: AGHT+IGbBtShWuBwRWtj2mXCX+/UefX5xtamWy3jwxnBNYRMZ38o+3ELbjYC0o+PFaBVESr6NI6G2A==
X-Received: by 2002:a05:6000:3105:b0:3a1:fcd6:1e6b with SMTP id ffacd0b85a97d-3a51d975e3amr6691725f8f.57.1749134645618;
        Thu, 05 Jun 2025 07:44:05 -0700 (PDT)
Message-ID: <80d75ea7-35b6-406a-aae3-6a0fc3374682@suse.com>
Date: Thu, 5 Jun 2025 16:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drivers/char: remove outdated comment in xhci
 driver
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <6abaf3a05c8ea7204bea2046a799bc577e0b77e8.1748182535.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <6abaf3a05c8ea7204bea2046a799bc577e0b77e8.1748182535.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.05.2025 16:15, Marek Marczykowski-Górecki wrote:
> The input handling is already implemented, and that limitation is not
> there anymore.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


