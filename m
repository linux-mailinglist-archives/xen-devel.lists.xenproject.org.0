Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A196B218
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789832.1199498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljnV-00048L-Q1; Wed, 04 Sep 2024 06:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789832.1199498; Wed, 04 Sep 2024 06:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljnV-00045K-M1; Wed, 04 Sep 2024 06:47:21 +0000
Received: by outflank-mailman (input) for mailman id 789832;
 Wed, 04 Sep 2024 06:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljnU-0003pA-D4
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:47:20 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87e16523-6a89-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 08:47:19 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a86984e035aso758526866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:47:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89972cf240sm683197766b.118.2024.09.03.23.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:47:18 -0700 (PDT)
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
X-Inumbo-ID: 87e16523-6a89-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725432439; x=1726037239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ftEq+k41f1/QJP+44quWJrpK4qTaLu/gSQVXcQ4pasI=;
        b=KFuP8Z+PvTA0l9megioE93acX34+Strb7IqsVpmTSPcQ+HCpx35lZZVrLwmgRFUOp4
         zY0u4Vw1YXiEVtjsu6BjKlG10onFkWxvltYmlTw5KBiElNqtK0kYZgR+/9VBbm/lbjvn
         cLpGQO/gZCvE62AhMeTepdIFoCxyje87EMyzLxmzSK4q/7gmuc2Kd0ISx2C3BmEoGCU+
         iPhCkiSYWGHK7ILv5DFmSNi1CvwkIxjosOcPS/9PPUUM7tsUaRwg3pu1JyGb5ZZMYAZd
         YTDGGdeJJFKszIesJALj5QHp/ieXm0k44yZ0A0BtER/wqLzdkSVMUe67rDELTFX4nWQJ
         zTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432439; x=1726037239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftEq+k41f1/QJP+44quWJrpK4qTaLu/gSQVXcQ4pasI=;
        b=BAZ1nkA9lkhKyrFBvH5sKWMvRJBHpgggSNM7dR+o09rkMLPjuScK9CCTxYQEK3WNa7
         sFJhGhm2n2cL23ZqDn1xgKv7l3z0q0G9pmn7fZQ/QDj9uD6J2UAoML82c1Ve1IBkouQq
         Sinvr1uamn2fNLW7EY35zZ1ASjlRMio8rk4knCv+8+MMGbw6ZId4fUua32Tk8wkc0saY
         O5okc8TxKnkJRfrpoq6V8m624oLRVhVKWH5QT4sj2yaTI/CEloqIDZxTuROhifa+wDwT
         5xSY0Sb1prf8shQK8Ka8+W+/0Oq+GySuej49Tr79cU52+MuJ3LjhdYGafHSd8qrQ5O+Y
         lj2w==
X-Forwarded-Encrypted: i=1; AJvYcCVJjlVwRIkDhOmCJN+zH4DLfh5DpKil7e1cFlACoIZKfnLx2aY7TlnpUz46xsaK2fmjABLSXWmtm7w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMQHFtnw5N7mU0byQjK5l4zj7/zcFPfWPtbPBt9AlyK59nOafh
	S8oT7JLtduE8+3o5nsQWSswcKpgBaKVKiZ16c2gYbDiX7+zGAPyW8yrrgiwyrw==
X-Google-Smtp-Source: AGHT+IFFdk2W8JaV/jesgqBEttg2qS9DiYvgB0m6nAnUj27Rl2vHWZwZQy9sel9YG+gAYgeGaWESAQ==
X-Received: by 2002:a17:906:c113:b0:a86:8f8f:4761 with SMTP id a640c23a62f3a-a89a35e1dd5mr926350366b.25.1725432439205;
        Tue, 03 Sep 2024 23:47:19 -0700 (PDT)
Message-ID: <789911fc-eb37-427e-9d3e-b82f93a61099@suse.com>
Date: Wed, 4 Sep 2024 08:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/44] x86/boot: convert setup.c mod refs to early_mod
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-9-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> To allow a slow conversion of x86 over to struct boot_module, start with
> replacing all references to struct mod to the early_mod element of struct
> boot_module. These serves twofold, first to allow the incremental transition
> from struct mod fields to struct boot_module fields.  The second is to allow
> the conversion of function definitions from taking struct mod parameters to
> accepting struct boot_module as needed when a transitioned field will be
> accessed.

Yet earlier it was mentioned that early_mod is a transitory name. Will all of
this then need touching a 2nd time?

Jan

