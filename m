Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6FF9EAEF6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852105.1266008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKy1v-0008Vd-6P; Tue, 10 Dec 2024 11:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852105.1266008; Tue, 10 Dec 2024 11:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKy1v-0008U6-3W; Tue, 10 Dec 2024 11:03:51 +0000
Received: by outflank-mailman (input) for mailman id 852105;
 Tue, 10 Dec 2024 11:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKy1u-0008U0-Bz
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:03:50 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f091f28-b6e6-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 12:03:49 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so3760822f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:03:49 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3863afc16b0sm7247176f8f.37.2024.12.10.03.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 03:03:48 -0800 (PST)
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
X-Inumbo-ID: 6f091f28-b6e6-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733828629; x=1734433429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OXIX+4qELLkm2iATGIFnUkN8RiljZvitomEBLL4mB8s=;
        b=Ci2xKpldBkbxdY34uOZ9VhMuvelRWc/C1/xYecGAyjqkHgP8O0T8KNDIULmPSaKWMe
         QyHjwqBddjjrVIoglOzdbW4qTayBqNDCfS5Pk3nTJ+UJ7qvysaC8EqwEYJA/dP5aN4i3
         BPOwdLqhFHNmFgo8aY940tKFU5fmXIGrd/KhXuaVT53vaC4cZxSG15AozHVY79Vcj5Lf
         3Z8o68HNLW9umSz/7tLNzf2PSf4PnnBTcdlrmuBgHsyB/v0TxrLnRU/aIltYVnPKPyES
         dZMvTpBSmF4cX6tGTzJvM5hKgfDc+0cxk6xar6IpukbLJ3eRKltl+eZNBvDZBi5OkYbR
         jREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828629; x=1734433429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXIX+4qELLkm2iATGIFnUkN8RiljZvitomEBLL4mB8s=;
        b=vRRtXpgHp+rYE8eODDl4wb1wk0mvZdC6YJeuIfXN/Is5xmkrlfWqAQ47XV2NCFIO/l
         52lUTXAfM2/UEk5/O6OO11C/Wg851RyMoqLOAef2652gYZU8qIOD4p7JSR9Nouw+QpBt
         EVOjfIhbQnY6IDuewR496bHcZkfmVFcdKLXEqU8RICwgR2c+5OCntZrd91dR6TMTs4E1
         6laWjxkzDNE2IZybFdoOZ+9bssTx2YXpxP8OGudwVFq/PMnGKGOgt9dNvGuhsksbnwVJ
         w9J/KokC8h9k/uibVdI8sPXgqjwRt5+ExNJMmVjwzNtDzLQmvjdE6dVh06Q8NEpU1y2i
         OTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR4c6v1DpCfW0QpjHtG2VsEicrGah7jgK+G1mlO7wU4ZwzFCJ3C2urFiAu3XaK55qi0Ff8vmQ8YxM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/ELGnZElSQfozmfxtSyluJVlF8Mb3q43WEMmq/0yGeP6HI2c4
	vxoA+ykO5E4Pl0G0SBIeo+ACCNWMYxrwKGzU7/YSrAfPz57/LHxnc1OH/a5ubA==
X-Gm-Gg: ASbGncu/52RAxsSg+GFjd5eSbTiY+fCFM3a2p4sAjaYyOZJFOCe1aK7KbyWg9hNSueV
	A61pcLCx2xXzMYrIjvtm0DnVsPAPRcgQ0oFAypRmsPcjkSV8rCBkueaaVp3FJlDQkb8Hgw/90Ym
	zjUpV2BCK8ta5572RFPnqdt0IIYDa+2qDbSEMpy8FHIRJ/Gw75UkVGbiLUncvHlXlGujrIqhrXn
	yI5XYcDw1KXAAENkmh4Dd5EM+WeHV23Ve+Adp2AroWBOdeg9sHY9VEQuAnwIJNUe9jcGmFh3YHb
	j48Rg2BtjdG2JLWmFwi6KEpRwXyEMrGpCuD0c7n8nqOVH75IbTNd0v5pkWn/mvWVvYHU+8ExL1P
	vXKparN/53Q==
X-Google-Smtp-Source: AGHT+IGd+8b1Bwje2BKjl1Vo5u3xODS04RUVwUwUha0bPnqtDWtMoxjhtaDwEaFDVqAMmkk1ChciRg==
X-Received: by 2002:a05:6000:2ad:b0:382:45db:6a1e with SMTP id ffacd0b85a97d-386469ad719mr1955396f8f.14.1733828628937;
        Tue, 10 Dec 2024 03:03:48 -0800 (PST)
Message-ID: <361bcfe8-6c76-4508-bbd9-961f75baa10f@suse.com>
Date: Tue, 10 Dec 2024 12:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [November]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, kelly.choi@cloud.com,
 xen-devel@lists.xenproject.org
References: <20241204102035.22505-1-oleksii.kurochko@gmail.com>
 <3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com>
 <412fabb2-04e2-49cd-a204-340fea3ad940@gmail.com>
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
In-Reply-To: <412fabb2-04e2-49cd-a204-340fea3ad940@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 11:29, Oleksii Kurochko wrote:
> On 12/4/24 12:01 PM, Jan Beulich wrote:
>> On 04.12.2024 11:20, Oleksii Kurochko wrote:
>>> *  Support device passthrough when dom0 is PVH on Xen (v16)
>>>    -  Jiqian Chen
>>>    -https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
>> Some of this went in too, I think?
> 
> "Support device passthrough when dom0 is PVH on Xen" should be moved to Completed. ( Accidentally did a grep for the cover letter subject not
> for the subject of the 1st patch so though that 1st patch isn't merged.
> 
> And it seems to me that it should be mentioned in CHANGELOG.md, shouldn't it?

If that work is deemed to be complete, perhaps.

Jan

