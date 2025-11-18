Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A8C686B5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 10:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164554.1491488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLHeR-0005rY-EU; Tue, 18 Nov 2025 09:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164554.1491488; Tue, 18 Nov 2025 09:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLHeR-0005pF-BN; Tue, 18 Nov 2025 09:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1164554;
 Tue, 18 Nov 2025 09:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLHeQ-0005p9-4L
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 09:05:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e5bdc3-c45d-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 10:05:24 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so25029395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 01:05:24 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a972141bsm13055395e9.2.2025.11.18.01.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 01:05:22 -0800 (PST)
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
X-Inumbo-ID: b7e5bdc3-c45d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763456724; x=1764061524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RDIA6kJm7u/sdHm1R9Dvcv8HwuFRfkQo5VTH0mU4jcE=;
        b=VY42susf+mdOGhw7M8HOJIDzz5iA8ly0BTpPAZiPbEZ5FpZtk2V+94N8TO8bipMD9w
         OZ0F/UiTw9AhImpvyrF/CF2zOjSpjF2wWqGFB5D1+fVUU+lv8AePo4FuGQWONgdU7C8u
         w3BIjkOmuevcDOJOXBWI4uHSDIs9IaNM9E5o0EEu5JpKQFFag9wHTZ/AHvB9vw5T3LeB
         eoOrz0cj/+Vm+KNslomHhHM04AG/TPOoHevvNhaAGyVAN5Pee6FOmobvx81WL4br4Bes
         sXoCXCBGj3iJhFJJKtNWRDGEF0BJccecdR6qk7DyqSS88YD33X6VhX7RW0BKtnzOBa1t
         7aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456724; x=1764061524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDIA6kJm7u/sdHm1R9Dvcv8HwuFRfkQo5VTH0mU4jcE=;
        b=co15jytGdGokdaejQeQNoMq+cXihJiTNmGMZ84MvoF0iS1JnNfd9GIwh877DZrr7VS
         hMuvAGBprdofQMkgMy4DDZ4soQaYdYgTaymXssTK8UbmeFwNPxCZ969qmvxTD3QTyGbe
         RhUskvnAlMiv1rfha/UoT64CPMxJBs1GIcI8dB/H0gCuZZ2j/OFCc8gOoa91ZriG0Bdp
         +hZpoSwgHlQTH2mvqJ9j3k05HVd+baL39kFiyIEdDIZLTEYySInM4JLMsS+sejyT2sp4
         yNEuzUdKVkI07VAQ3+hoARtLw+x70/jz1JBZnOahk9fC1w2FnKT/CQgwGAwYTb9mUshd
         AY5A==
X-Forwarded-Encrypted: i=1; AJvYcCV8iJQgnN2g5RX1F2IuF7RQPJ5kB/IGnECmgbdiMBvTbbo7ZPNEM9f8+2hxb+2JddBLwPOytb3sFTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU1/QMB/0C77HpBmsxczg5E7fwozDA+K9l3koxiQEEqyN1IOm8
	G+sssfqlyp0PLEfuzGUaDa/iQ4FQUa0JpTLgJJrVvVmolzA168662FFvBK+N3CqQbA==
X-Gm-Gg: ASbGnctXPOVaH2qsqW51gYCSJSODEfkrMhfxaDSy8wZ/NGDPBohEfUmIFVvLdC+7edl
	A8DJnh+ojDtUkXxM1AsRtJQYd25Inhx/N6hxrDl34BcAglfHlA6laIj9iRGMZ5YUwasgaz0YWVD
	PlahkQqmE/8GEhPLcejhxjx+xl0y5r4IJNFXfA+UJgJNdhw2okTCcwUDHr5Xy3niRVd3pVQdF80
	T4+C0fnSe0MBRqq8IO0hKdNwUMgVzx6b6ZSN7BKf7/1wVQr86M2beyJ5Nb2Xk630VY2VSwC97+e
	wOx8KDrY0Z4WYZ8hxQ97n+sdLYvR2tOq5JQzR9wfeH5NHJ18hBbjprPp4HEI5s5P3e8ZZANUtRZ
	SCbdARrrd6C2T7KbVfkBAVHztvZW48Y43ZO7MoTjE7cQD/oR6AkJaIZclp/MktKFxQeb8is/e+/
	+exXUUUvnyvqOxt4TmM7MB/SvG+HHT2u4WQFirWNP176vDpiwCuk1/JeLx32G7Xa+qSubfu2obo
	7pK2a8A2lq7BoRer5yOM8xBY6t6dzVA113LZQ==
X-Google-Smtp-Source: AGHT+IFq46EFT0naRVasLso9yBUvMqg1yCxpMDpvstyXX3bM3CPTNzLbuZpFXzXa761I3TAGe1XdTw==
X-Received: by 2002:a05:600c:3b19:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-4778fe95fe2mr146223555e9.21.1763456723992;
        Tue, 18 Nov 2025 01:05:23 -0800 (PST)
Message-ID: <01405772-da90-489e-bf9c-4065b37a6e08@suse.com>
Date: Tue, 18 Nov 2025 10:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 01/18] xen/riscv: detect and initialize G-stage mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
 <8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com>
 <6938d333-816d-49f8-9945-db9d4b17f1f1@gmail.com>
 <7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com>
 <e0aea302-00ba-426b-b65d-c616656f6836@gmail.com>
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
In-Reply-To: <e0aea302-00ba-426b-b65d-c616656f6836@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 09:56, Oleksii Kurochko wrote:
> On 11/13/25 5:32 PM, Jan Beulich wrote:
>> On 13.11.2025 17:18, Oleksii Kurochko wrote:
>>> Also, I’d like to note that it probably doesn’t make much sense to record all
>>> supported modes. If we traverse the|modes[]| array in the opposite order—checking
>>> |Sv57| first—then, according to the RISC-V specification:
>>> - Implementations that support Sv57 must also support Sv48.
>>> - Implementations that support Sv48 must also support Sv39.
>>> So if Sv57 is supported then lower modes are supported too. (except Sv32 for RV32)
>>>
>>> Based on this, it seems reasonable to start checking from Sv57, right?
>> No. Bigger guests want running in 48x4, huge ones in 57x4 (each: if available),
>> and most ones in 39x4. It doesn't matter what direction you do the checks, you
>> want to know what you have available.
> 
> My point was that if we change the direction, then once we find the first (largest)
> supported MMU mode, there is no need to check the others (lower modes) as according
> to the RISC-V specification, the lower modes must be supported automatically.

Oh, I see, makes sense.

Jan

