Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EAACAA1A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002856.1382250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzx3-0001GG-5B; Mon, 02 Jun 2025 07:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002856.1382250; Mon, 02 Jun 2025 07:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzx3-0001DT-27; Mon, 02 Jun 2025 07:51:21 +0000
Received: by outflank-mailman (input) for mailman id 1002856;
 Mon, 02 Jun 2025 07:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLzx0-0001DN-Si
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:51:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dacc608-3f86-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 09:51:18 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fdc27c4aso914663f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:51:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe966f5sm7031824b3a.32.2025.06.02.00.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:51:16 -0700 (PDT)
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
X-Inumbo-ID: 5dacc608-3f86-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748850677; x=1749455477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3I5ocxBZaCZUzTigw4wiLT3+ZKZMcMmKbkujRIPO+AI=;
        b=QFxeYQlFEhXB2ssO/Q8VjgA0Pc7tIMTAU89pvtATWFVNi+V/LYii10SU5rzV7W1OBC
         p3SZHE2TlMy1dfwY3e2Eru+h0fhg8mLLhC4jRx6ipP1SA3c3eJyE7OGWZiA+BKT6vxYA
         TDKkbRW6/okQWqAhlo+FhVhFIn+D5i6yXC1kJCtwGgm3EJKqRi2r4AXwV3+mHcvG6Gu9
         7dSjjg1sYPCgy6NSVmYnGGzciiba7LGZVvm7IlvNUhWonwDEaAJ2P8xR7OEQO6cUX/5t
         mBa5SYrzBk2esRoiJTburPHVDyE3qG5WCykw8Kwjsc+RKNSEE1ygEOO1COuwszJMkS57
         AdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850677; x=1749455477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I5ocxBZaCZUzTigw4wiLT3+ZKZMcMmKbkujRIPO+AI=;
        b=Jwj9c/I8RevZVvWa0HfjLCIdaG48ucthPXqQvfcBSXjUTV3rMBE0UKyScjGYUdbygo
         YVcuiq5dWZdVE/NRd9QZkvraZxWj1XQPE5eQvtp7KUV7E/CATyxfPk96aVjtz1p5GWwo
         lKeQ2AB+Z2f9IHT640WUXE4iWHy6AWi5V2I/obHJhzQuKcoo0L3QOWSPSxCHKMMoDCXu
         HmE3Hn5gxwExcHakAWjclqkBLvKA9rwCKWVNRCHjhfKVXd/6om4wvnlxd6rk/2cmlIrV
         VTOCajNJ2pbcOonP2kf9J1yDnlgbUV9eWHeIE7u0ThieuYpubnaq1534QUVQYxcaIfLd
         nNXA==
X-Forwarded-Encrypted: i=1; AJvYcCUV9SwQVRYrEh4OPjoJCb7HgBoe62ziVzGL58jlt5EuA1AQY6w1HZNYkJWJiUOUuJr2tGMd7gBS3cI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpRVtLt3fBkXakSpdX+c1h/d8mON3PDtQy6/vJE8tDbOO1edYH
	eAhiljZkGHspYa9BicM2GAT3A7jPGcotcja/7qTCY6qFMeg/t5U9yYwiyOWLqKYJHg==
X-Gm-Gg: ASbGncuAsHt1btsVYHMVEVyVAo6pIaUdmfENTxU58Bcgy2VOfdtR1820vZVsgMDQdqE
	hBx8t5NcCroURmP7LtmzMndOGnNiuNUyIJ5VUc7jWqFFNsEnAe5P41OD8+0ippQlsyrjvdRiJkt
	iG8Lhcrdt2AAInb0zk1DG9DeL0HWLWNYdiXNrTIwzMHCebeePbD6YWS1t8DbzEAvfHbhlCp2QE0
	nyCQ9wNrDneLTBBKZIeTttaJyRChAiJ4DJr26QSonhW0nP2u7+f6cIPzMYxD2kFCY5x1oC3q+Yp
	sd12XaGr1pcbJ1WylitILZXyadx6ymcfmxbJ58eZskTHQFQF/XRoP8AshbGFSKI/z5yY5PNXMxD
	17B2eSQKF+1s4ClaIEzuyZ7eM05aW3y82yFbzLQjOhFbaXsI=
X-Google-Smtp-Source: AGHT+IHN+S7cDseoV/xLp721ZC/KU1I8mJFys0x0aP4dEI497NMhuF6YTmg7j/10zhNC+Sgq02qv4w==
X-Received: by 2002:adf:a152:0:b0:3a4:f8fa:9116 with SMTP id ffacd0b85a97d-3a4f8fa9122mr6173341f8f.8.1748850677407;
        Mon, 02 Jun 2025 00:51:17 -0700 (PDT)
Message-ID: <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
Date: Mon, 2 Jun 2025 09:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
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
In-Reply-To: <20250530120242.39398-7-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 14:02, Alejandro Vallejo wrote:
> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -6,9 +6,7 @@
>  
>  enum device_type
>  {
> -#ifdef CONFIG_HAS_DEVICE_TREE
>      DEV_DT,
> -#endif

Why would this enumerator need exposing on a non-DT arch? In fact I would have
hoped for ...

>      DEV_PCI

... this to be hidden for arch-es not supporting PCI.

Similar concerns elsewhere in this change.

Jan

