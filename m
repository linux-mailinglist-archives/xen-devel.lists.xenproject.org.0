Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8CA10133
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 08:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870952.1282003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXb5n-0005sQ-Dg; Tue, 14 Jan 2025 07:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870952.1282003; Tue, 14 Jan 2025 07:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXb5n-0005qG-Ap; Tue, 14 Jan 2025 07:12:03 +0000
Received: by outflank-mailman (input) for mailman id 870952;
 Tue, 14 Jan 2025 07:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXb5m-0005pu-B0
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 07:12:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d904c8d5-d246-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 08:12:00 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso36502115e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 23:12:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b82ddsm13921368f8f.71.2025.01.13.23.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 23:11:59 -0800 (PST)
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
X-Inumbo-ID: d904c8d5-d246-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736838720; x=1737443520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t0Hp/Kam9LQwJSG67zKI1k1XxiCYOfg5B6NKJoLfhlg=;
        b=Bj4QHmiCIvg5mj63NHnA//SN9TFBK5jRFNrJ891aSDXxUNNVlDwxS+vifIMC+EJ+GM
         7h/3F2aYMsdMLgZLyHgGxamkP9xmCf6zKnZO+V6lF7pAX/MZovCRw7SzsMIOAaOG6S64
         z9zWEnT7nstge1va55v4LhaKEwHPSdr/jjy2azo6vbuogZSo7dPyOThuXKvjfgMGs9fC
         CgYs5AjuLax/wWgnyIeu2zq8iNP3mNx155n0VtABvDaW/FftU+JivzrlDEP+wnd02tzO
         1yIm2kkg5G2fdylgxDbM7JrPY2NKeqxKM3yAq8GtqnhxvdWoIeVya1v83zc3jyqQ2j5c
         2sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736838720; x=1737443520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0Hp/Kam9LQwJSG67zKI1k1XxiCYOfg5B6NKJoLfhlg=;
        b=m1qMMP991IqCHvBDfxRz7p9X4TuChnhc82sgQthb99iLkiZVl5J8oMbtqd4K8t3oaM
         MSKka/0gWv4NlD9Yc9HGVQwamCGBX4QTSZZ8cn4e5YSBpxC/iEX/mrN00xCeIo6uJZg9
         lvJN+5rzRS9kFgmdGXSKi4PRadW/ItZKHtbZVRbnCGPL58mPBzdxiDPkUlF1pumaxZz+
         7HPJup+buuDg1p99Whv+p4AxcIE4EZRH53bHaxKzkqAyPpGgyoP4bbWGQoGuRWpTGVXQ
         rw7jSC/9drVTwj+7PE9u45NMDWj+TXsggwS5086Ksp5cRNg/WmN25RGSuO3aDN38m87m
         kfVw==
X-Forwarded-Encrypted: i=1; AJvYcCUU85RejebGYq/KDZ9o+BAPDCzJApMGOcgxOGPfQuII1xEqE7OM8xS6fiFeSE3PFI/V4G1vamo3TjY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd3yqJz4PRr7Hq3gZm18/YiEdmuu60LIduXVh8Tnfm0nTVFwL5
	QZ9B+8oerL0aw+C4y2EG9pz5reU6Hqa0ToRswc0PGr12+7H+ENH00rCtgyqPsw==
X-Gm-Gg: ASbGncs5kI90lgI1+l7Rd4GJGGWVur1xeuXoDJDqqjGjwAM2B6NBJHqNetUZWqKAxEA
	qmYU2HSHKyf1AtA42QaEUJ0T8XWXC3VwgA1C4wCOzOy1bImEgfjRlefOJR4WXav3H83yRg6HPXa
	7OMECAhdDRvQT8+eLDyRPQx1aR4OGJD78GHNS0vdpHe2wAiprKTj+Y2EFIaaO3h/L6vcBluoEwr
	2vZUuNnvji/zdYhgPZbrnqPQwXgn3zLYtslHfz5ShtyOwDSQzEVpoPLlWo0mOl3uiCag0lfBlb7
	L9mjx8GU7PVVpgeICAWtvKsRVa6cqXZeFe3s8XRz4A==
X-Google-Smtp-Source: AGHT+IGCLfQ97jTKrIjqc96yNUowEbgezwUf0gmYNLPk65kq3/+zsHp9GtmYC3n+TqYuSRqD7qebvg==
X-Received: by 2002:a5d:5889:0:b0:38a:a074:9f3c with SMTP id ffacd0b85a97d-38aa074a517mr9140082f8f.16.1736838719938;
        Mon, 13 Jan 2025 23:11:59 -0800 (PST)
Message-ID: <91ec5be2-d229-4d51-974a-821d75f7250f@suse.com>
Date: Tue, 14 Jan 2025 08:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] x86: Add Support for Paging-Write Feature
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Tamas K Lengyel <tamas@tklengyel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1735837806.git.w1benny@gmail.com>
 <4eea61a2-cf56-4ff5-8c43-58f5a20c9cb1@gmail.com>
 <CABfawhmHK_Lg8GuVr9yb1gw82YFs3e1gh76azzH8C98R552dSw@mail.gmail.com>
 <333f50dd-927d-43de-8b49-6865648a9ec5@gmail.com>
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
In-Reply-To: <333f50dd-927d-43de-8b49-6865648a9ec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2025 18:18, Oleksii Kurochko wrote:
> I would like to kindly ask the x86 maintainers for clarification on why 
> this patch series was not merged.

v1 of this patch was submitted on Dec 19, when patch submission deadline
was Nov 29.

Jan

