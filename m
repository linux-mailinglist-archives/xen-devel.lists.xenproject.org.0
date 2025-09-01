Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA7B3E68E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104927.1455942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut580-0003on-D3; Mon, 01 Sep 2025 14:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104927.1455942; Mon, 01 Sep 2025 14:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut580-0003mQ-9W; Mon, 01 Sep 2025 14:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1104927;
 Mon, 01 Sep 2025 14:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut4xp-0006av-1p
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:52:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37f1b5c-873a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:52:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso148101866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:52:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0413782b94sm441257966b.35.2025.09.01.06.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:52:50 -0700 (PDT)
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
X-Inumbo-ID: f37f1b5c-873a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756734771; x=1757339571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3y9mL5hrwYwKk2Rj4802Pv1GSH/ciYwuHCdvajLR05M=;
        b=cbRxZfCJbcH/bl6Mv3kGf+CUJ3T0sb9FsuPLElZECtNMnkAXEZ7qnCIUmryl1n7U6B
         MFC3AuSGbhbLpScc/YdFtzDJBLCErPO7zXTyElTSGkNLhfAGQOQph1cEwKQt4KX6W2+p
         5rjqaT1tRw738JU0pUN6WRaYcZqBxwRKFbSlRaakQ22279i2PW38I/EaPCRQ3sIOPyqd
         dUFzRJ5rq1nRAi24k3qFcHzKoaRgwItxZR9wrzFgcAlqIcE4Evv+tLl+6+5l47fBKvLe
         TZ23AvFpuy3VuDLai1I39MI54KyOTl4lLtC93hIbz71RUPC7KhrixBoYmBKH3Zn+tUKB
         GKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734771; x=1757339571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y9mL5hrwYwKk2Rj4802Pv1GSH/ciYwuHCdvajLR05M=;
        b=sy/+SyLI4p7QV4PqSSwtXV+vDs1LZjm1su26J4ReZb1+ApuzGpLeGRGPwnRfWfDSte
         n+/hnoXi9O4ADudaBT8KSEsga3i+KruUXoyU0+cKSnUX1CqmiDmjYbya7wwuemLD8h+C
         2xMXzyxqE3zj8ULKKaPe3NFB9cbZXbRgA+sAujNbhfhd7DCsb9qACgLb5FpFiE2talz0
         idSqRDc6M9ksmcFxRWIXgj6qeClAX8Y06UBY04alb1xkXzvYI8wGFZb2u/q+bcUQcKxZ
         BMBn1YX7TDg1GNaDzrvy5nO25A7Hfasy9cu4BvOp7plvQOphQDUV7pwlW59gzzL5Fsx9
         6VTw==
X-Forwarded-Encrypted: i=1; AJvYcCW35eQPm31W2Fy71KEvxGbRnpHnZHfqqDzdy4ExBiDiZPT3jSJA5KfjZzmn1XADTbasr1lirj7ALnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqjKgwUW4NLyQnXRqxbxq3Cm8tVOfALW4WivHiUTL3F1JYjuGB
	iX5V9kJopMVX+A02IR65gmMAxdLyWtzenyws1XWkgOgbwfW2m3RVCOO+BgPVuKxILg==
X-Gm-Gg: ASbGnctFQjMqBlrQzF10ANR+STgHdX77XG/gFtdfDgwzq2Px7+o53UCl67w08xTYRGo
	PPNDl/TRS27eYzCvWOjTVoEIMja1Xfi7cTgAbzIi3w64X88eDbClzgH30oNHOMWsShW9AkdNd5Q
	ZUd2/5lqjATZAPax0+FGZr5bs5cAya2FBvvbvTIpvk1/fCb7kQF9oBnOveldtDlF+hYwx77NOQg
	S8et6ko7AlGFosCvttcK8lUBITP38j/a1+/BTucDKafuc7oti1LCoLQmRrjFOYaoa83DW0rDREM
	WRe1NGU6lUm2/UhAPdxTRm0iUrINI7wBuzogsc9B7QLcbLseKpFo2dvKbtXFAwRvarsdMUqUeJS
	1VmkwaBvehlt5Bi7wW/jBbLja+dRpB7ET1G1kpEm9e3kTk2op7txWnRtVb20/NnhPIYV0GqUQpO
	QWv9V+F2U=
X-Google-Smtp-Source: AGHT+IFzlLV8pp5YtAnjigJIfJCwJETHKdO/Aoi8tP6NniwigTBQYVuM/BvYQgRYEedYNRnf3IKKRQ==
X-Received: by 2002:a17:907:7289:b0:ade:c108:c5bf with SMTP id a640c23a62f3a-b01d976d963mr873351266b.43.1756734770656;
        Mon, 01 Sep 2025 06:52:50 -0700 (PDT)
Message-ID: <027f25f0-4871-4e2a-abca-ea83bcda267b@suse.com>
Date: Mon, 1 Sep 2025 15:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 3/3] CHANGELOG.md: Add SMBIOS 2.6 update
 statement
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech>
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
In-Reply-To: <301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 11:58, Teddy Astie wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -34,6 +34,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>       Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>       and 28 (Temperature Probe).
> +   - Updated SMBIOS version to 2.6.

Like the earlier SMBIOS related entry, this should be more specific. At the very
least it needs to similarly mention this is about hvmloader.

Jan

