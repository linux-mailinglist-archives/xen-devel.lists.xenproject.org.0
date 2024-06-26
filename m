Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70013917EB5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748727.1156538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQAw-000433-CM; Wed, 26 Jun 2024 10:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748727.1156538; Wed, 26 Jun 2024 10:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQAw-00040v-9j; Wed, 26 Jun 2024 10:46:54 +0000
Received: by outflank-mailman (input) for mailman id 748727;
 Wed, 26 Jun 2024 10:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMQAu-00040p-PC
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 10:46:52 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64df71e4-33a9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 12:46:50 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec6635aa43so27032981fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 03:46:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70677465799sm6300002b3a.62.2024.06.26.03.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 03:46:49 -0700 (PDT)
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
X-Inumbo-ID: 64df71e4-33a9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719398810; x=1720003610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LX8UarjuEjWlLpE+YqB6gP+GvT8ofrUFe1yYiIq57Zk=;
        b=Wn6UZNHwAww0baPzHJrrpLwKYlPRJAhYw2iC43RQ4Vgnu7OJrphpR3wPD/RdVCu/oW
         ContYIbtNMEHN2kuvrYA3jC25NANMvA5I8ua5jcoD/+JyGxLHndZ5pw9oB6/tZ0jjb7J
         JCufNNdVt4Iy1tKEoHh78aUpOvHOB0gNshVjVPdAaJHPJWesgwLhZaaVwIkN0VaOpXmE
         h6mOtR8nfH3fhZ3AdJiq/9PCcAkmF5Njkb2w3chYfkoSvwFrngOWIFfp+X0TdYffVCRr
         6OcHz3NmOatZco1G0bVYuybVEBVBYyPrEmSMyWJxk+hJcqdvAlSneLmt/Nygezf5ZKyq
         FUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398810; x=1720003610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX8UarjuEjWlLpE+YqB6gP+GvT8ofrUFe1yYiIq57Zk=;
        b=ChK+Zx86gTTXetr5poXL7SRvvMI1K+cpnewA7vfmyP/mdfV9LQexUCusFATw+wkZ8h
         ZACUaRaCbPLQ4wstam4T3Tl2xMLPtmRa3wQWwtFCZI9ZYXH1bzUbEWhjpQjbW4ZUvoNQ
         3OWEl0raaxDLybwzsFg9BO5hsk/56gs6dJo6FFv1lhON293oo26UZKHbFHk4s4IU4BS3
         xttzJer9dbRLSkqJgZ6TSOVEH7cbhv02loKWTn2wcwjvu3uYc4hiLRc3ubjluCTEjIwG
         sW5zzq2m/aj53Knw2AP1M5MGH8Dye3AyZMN1djlliW/uhQ2s7Swy55Rz54lKbGTajA7O
         KxGA==
X-Forwarded-Encrypted: i=1; AJvYcCUGyFKYhjPGzlxPToVDOTcezWp0uflRhm5jSFFf2E35m7/rhH7QxGYzlRpwZgciRxDysqWlRtZrMCL13LTQ62Qx5QM+1/u2frTtyTPmtU0=
X-Gm-Message-State: AOJu0YymQ2vFPKFSQzIauuY3dxKGE4FLvag6p2DFrSvlSkHPKrK4t9vN
	Mca3lh1nYhI4qrHLb1XXrYl41kNpBrCXjU+Li0MObrnCXvkRsh6ZgszT8S25XA==
X-Google-Smtp-Source: AGHT+IFJt5LhZmNKG9s9VgdPvey+K00VQWW4fci4js7Y9ufaRnArwS8sxZuqCUZMKSBCY0brrVL/gg==
X-Received: by 2002:a2e:6a0f:0:b0:2ec:505e:c45b with SMTP id 38308e7fff4ca-2ec579c936fmr61171611fa.35.1719398810178;
        Wed, 26 Jun 2024 03:46:50 -0700 (PDT)
Message-ID: <f324a4f3-b64d-4b20-92d0-8cfea050d44a@suse.com>
Date: Wed, 26 Jun 2024 12:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <f14f2c5629a75856f4bafdbff3cc165c373f8dc2.1719319093.git.oleksii.kurochko@gmail.com>
 <4a4e37a9-eac7-4e72-8845-6b4bbd7bafe6@suse.com>
 <c52181a7aca8b56716d7ee354ebda9d32e67816c.camel@gmail.com>
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
In-Reply-To: <c52181a7aca8b56716d7ee354ebda9d32e67816c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 18:23, Oleksii wrote:
> On Tue, 2024-06-25 at 16:25 +0200, Jan Beulich wrote:
>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>> During Gitlab CI randconfig job for RISC-V failed witn an error:
>>>  common/trace.c:57:22: error: expected '=', ',', ';', 'asm' or
>>>                               '__attribute__' before
>>> '__read_mostly'
>>>    57 | static u32 data_size __read_mostly;
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> If you give a release-ack, this can go in right away, I think.
> Release-Acked-by: Oleksii Kurochko  <oleksii.kurochko@gmail.com>

Thanks, but actually I was misled by the subject prefix. From a formal
perspective this really wants an ack from George (and mine doesn't
count anything at all).

Jan

