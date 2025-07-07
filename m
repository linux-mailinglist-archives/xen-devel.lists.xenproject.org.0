Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A48AFAC3F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 08:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035234.1407452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfmH-0003E2-B9; Mon, 07 Jul 2025 06:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035234.1407452; Mon, 07 Jul 2025 06:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfmH-0003CV-8O; Mon, 07 Jul 2025 06:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1035234;
 Mon, 07 Jul 2025 06:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYfmF-0003CN-T8
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 06:56:35 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84b627ee-5aff-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 08:56:34 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so1377127f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jul 2025 23:56:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455cc27sm78953525ad.122.2025.07.06.23.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 23:56:32 -0700 (PDT)
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
X-Inumbo-ID: 84b627ee-5aff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751871393; x=1752476193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LqZl58JHqVJFSG73G7xIjFOyk0DI68UDFXOKsJ4+Opw=;
        b=MsfkEGrQSjtm3769NuAs6w/f39zFfVpeAOwLSdAhYdILpQZSI99Pv9N25nAkJEGKJk
         0tyj9i9woeZF3mfSqGgwdPzdVZqMY0AvjvZevZcqa+7pcXpalmt7jLjbnNweMMsBYzlB
         FqBYJtB3yUVMYCfaiwraHldXsUjVpXoOLSpr2KjgOrPk3UIuuWWtfycnTru6yHognudo
         FHg2duXcF/AvxsLoJZT2EeJtWZdmK440LR7CQL9xOpPzR3LIWg2zw795AZGGvwTBfv2E
         5QyepAe5dX4kNpo5otC2t5PwbNyrvbBIlnySj2+ci2L4OLdGpLRSp4t664sO6XUiPUQo
         YoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871393; x=1752476193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqZl58JHqVJFSG73G7xIjFOyk0DI68UDFXOKsJ4+Opw=;
        b=F8OxKxcoD1GQqNvG79UHMK1+JqOOM9D7rARdNh2kAMBzmuHZQKamNF6z3zgpgOvptY
         xYsWifXaQ/q+chkH+plaazK390SanySTCdpdhDsKNqluiGNldrjcoLgh/+7Kam1InNkx
         Nhj/RpBet9vHMxJQBJvAVpceBCG7zqEKrY0eNoV5dAd6Zn3v2eP490e8FQR2Eij7ZBAj
         GqL/BYRhPUCZZt1OTas8LVeIH7MvPlUYX+wpqPf/ocsnuai5xKTDCGna4SKBGV7D8gxv
         MZv8UaAFbIw8AYaLSjKf2DuZM0wYsAkUCpOnkUGhOT35eVwsiAsgQ6DVDpw0StO4zCqz
         EMvA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzwPeXn6huvJhY765FgY3ufpSpCyL6f/pEXyQJEPAJDQTi0JbhVRJnPLNBg1+T0RMWpz2NHfrn8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBZoUR1z8nKboYL2AsjYPqbjSUWViytOyUEwCbCv9GQmnTQAf+
	tYjfq+bZg9qbNy2TKV1lQh5yzNc81C3mKOoqEIC4Xbwc3cPMjppV8c1nENiaWcqAG/uiDl+vlKE
	0xKc=
X-Gm-Gg: ASbGnct+lpJH5LZcmSGfNJXKPiwYxMJDvq7UDHB2//jNQB9tF6FD3JUSkQMEbaBecwz
	jp10CwGiImSl7EH6K9oxCk/LDUMa8h0vB8eatAcUjoWMtHOFX0b0VPRpfYpake7wg9ZOsXPe51S
	o/4RU5OrQswmOyhfwcxWiR62NBcHi7HM0asPjFVcmqjVTaFK6Ad5yRB71xEZsIKBHxmLBDdKPnb
	zpfUHLmrMDgaLK541oWnpGt6lewZmBlH9uo1FHeQek1A1pX+2UKdjIgoRpBadEBoyhVsycHmfqd
	RtR8cZGWfPHwTvFMppNgywdvNh4R1gEwosULc7ZJJ8KXki6gp0HF2/YTrUItKQF2zEVd+d2is2j
	YHJ7Ui//NwDDRIipmGBb+mSLMm5JkGu1cJ8ZhXZ1sRXNirfU=
X-Google-Smtp-Source: AGHT+IGe1s9oPFJMebMPq+KhS5R6/+Aw7r5wr65sIafmqwZb+OFNorV9/1AiJPLdDlTVLhPf0zJi0g==
X-Received: by 2002:a5d:64ce:0:b0:3b3:9c75:bb0e with SMTP id ffacd0b85a97d-3b49aa08fa0mr5346772f8f.11.1751871393372;
        Sun, 06 Jul 2025 23:56:33 -0700 (PDT)
Message-ID: <9299a995-21ad-4b9c-8c82-8662f70b447f@suse.com>
Date: Mon, 7 Jul 2025 08:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Anton Belousov <blsvntn@outlook.com>, xen-devel@lists.xenproject.org
References: <cover.1751412735.git.w1benny@gmail.com>
 <99e281ad05537d2384eaffe95155a03382493c96.1751412735.git.w1benny@gmail.com>
 <8143b492-6e3a-48bb-b564-52b2623a78f7@suse.com>
 <CAKBKdXhOdMqPFO5GZpm5p=6PQf8G3Ho0+UG5rZjku6QESCeJtA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXhOdMqPFO5GZpm5p=6PQf8G3Ho0+UG5rZjku6QESCeJtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.07.2025 01:48, Petr Beneš wrote:
> On Wed, Jul 2, 2025 at 9:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.07.2025 01:45, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>
>> This isn't in line with the first S-o-b, nor with the fact that in the cover
>> letter you say this was previously submitted (and hence authored?) by Anton.
> 
> Can you please point me to the right direction? I have no idea what
> tags should I specify here.

Well, in the common case the original author would never change, and it would
be their S-o-b that remains first forever. Anything else would need explaining.

Jan

