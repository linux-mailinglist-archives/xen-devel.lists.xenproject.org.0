Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42512AB6E3A
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984371.1370511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDDt-0003ST-2n; Wed, 14 May 2025 14:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984371.1370511; Wed, 14 May 2025 14:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDDs-0003Q0-WD; Wed, 14 May 2025 14:36:41 +0000
Received: by outflank-mailman (input) for mailman id 984371;
 Wed, 14 May 2025 14:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFDDr-0003Pu-BN
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:36:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7efb414-30d0-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 16:36:38 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so218940266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:36:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8ac2sm946663666b.27.2025.05.14.07.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 07:36:37 -0700 (PDT)
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
X-Inumbo-ID: d7efb414-30d0-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747233398; x=1747838198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BXLcGL1xN+qlBvUwYYBOUGEDXze3nPBsHdQ0+6HdSqU=;
        b=CnLQVW2qJtTCYZDxZ7YoIU3UN4njQBzVU79cgRjW86TPhnigN/D5bIVLXLtOYpUNR8
         PUcwnMp7mOnihz69G9Z0PylY2WG3w763TicsZkcYzdMi2l0bQlysxHz1jblwvLon5GZK
         IIAvOLpD9F36czVJLJ46WbbmUrSlwit5R0jx4EhDeIHqci3Wy34DC1341WtI7lxK9EBN
         W4FtQUw7WUIRDTKjdz+tG0UI+JRsK5CPkkb2ymM6o6wNpLUdX1Jq66yAFJoPSuoXBtdh
         I/ByKxm23PjyByJmx5ZW9apjj6MEnCO7PYVlpWVkbTe0Hs0yWv3yu16iBcSEoyCCHQv1
         Er0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233398; x=1747838198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXLcGL1xN+qlBvUwYYBOUGEDXze3nPBsHdQ0+6HdSqU=;
        b=HVRNRKL0MXwREzhBR5Gki0307+IaebC+Qf8D7vJZ6GgqQTA2MD9tKHLZ71hwxSNRi7
         /kzyc62YQeDYPneeGC1hPRcr67GqpQQmKf9TCnStGo53h0e3NOY6vZ2xmEbXo4Vypq+B
         aTFrGWzZYoBm7hgDPoxMhMp/GlLy3/WYQjL0rQybR01e+AAQbrVQqSKXEaZ2cGohJcT6
         leLqInmowgAwzqw3v1+QlJ3VIwtGgEBreZvNwn/HEV4bOZt0BxrUro3d0cz8+vzYXOOJ
         lA5ILkps3dLhyrmjEd2Oub+9mKNZmUqOLgGVEHh6tZmK2ZOR4abjsseUX0vOj90rO3bg
         NvAA==
X-Forwarded-Encrypted: i=1; AJvYcCXxHiNlk9pFgLCKE8Zz5HFgyG0pRIMETPuPCTioaXVgPcspD4P2Z+WgQC+hmAci2gJ3NAhPW3rKny8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhjCEK/3VZaLLObOFbY9ZETXI2vpnTXzyFjo0L9nxMAnKPiEYa
	FsDQ0mK5P8qSfh4vm/2uFDjswCkrZUm9UHlXB2S+Mk31ZF+GqTZYx+PduXScAQ==
X-Gm-Gg: ASbGncv47KzJnM69D98tv394mAzLgkDufx8uf/Aj82RWrTxJtG+0nu/y/yayKaf/Pt0
	Oj/wEcV8gccO8VOle4WdthCqY0VSvXZkB7424naCoRkTRfZkxZB4DEz+SH296jJ73HP//FGXY+Q
	2rWDm2yModX3RTRNxawFYCQKepFRs1B1Z6TJnZ25gFbeObxX1vvE9UKnCfo9cyAs/wJfZ2u/MeL
	+prW5qGl4iMi7/ZujoP+Iyb2ZKRpZ1URekd2TVPMJjQ58jpDBQ/FYW5779rTMUahJRyH/AqFb5o
	X+pNb1MTkIyyC1L1IKvTftPQ38x/Itf5bMFk6Y4N3W5/qSgPp3HCvL9L7pzFq1s5WHgQyvLHH83
	JbCjDmEdkisdak9iCvFPp8G0kiUGKU6pdg9bt
X-Google-Smtp-Source: AGHT+IG5s5wU8+rfC66N5yXQmElbW7RsDukJ63d+Rn2X7RATkCHJbDwHHkaJWwAY9O7AAwAnqhyMKw==
X-Received: by 2002:a17:907:2ce4:b0:ad2:2f9f:d4e6 with SMTP id a640c23a62f3a-ad4d4cd6734mr851506466b.5.1747233397885;
        Wed, 14 May 2025 07:36:37 -0700 (PDT)
Message-ID: <74c6872a-7221-4656-8655-16b53f9b2bd7@suse.com>
Date: Wed, 14 May 2025 16:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] xen/asm-generic: introduce asm-generic/irq-dt.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <35c68e57e5348c6610e030890802e967f6be4230.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <35c68e57e5348c6610e030890802e967f6be4230.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> Introduce defintions of IRQ_TYPE_* which correspond to the Xen internal
> representation of the IRQ types and make them the same asthe existing
> device tree defintions for convenience.
> 
> These defines are going to be re-used, at least, by RISC-V architecture.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Assuming an Arm ack would arrive, this looks like it's independent of the
earlier patches, and hence could go in right away?

Jan

