Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056ACEA1C2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 16:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194361.1512765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vac1g-000314-9V; Tue, 30 Dec 2025 15:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194361.1512765; Tue, 30 Dec 2025 15:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vac1g-0002yt-6e; Tue, 30 Dec 2025 15:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1194361;
 Tue, 30 Dec 2025 15:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKsM=7E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vac1e-0002yn-Nl
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 15:52:46 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a3b21e-e597-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 16:52:44 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64ba9a00b5aso11684488a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 07:52:44 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b91599844sm35260022a12.25.2025.12.30.07.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 07:52:43 -0800 (PST)
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
X-Inumbo-ID: 94a3b21e-e597-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109964; x=1767714764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLkc9FoZq3YTct54aDb92kNA/9i0FxcpSqRx6vpEmH4=;
        b=T4J2qIzSdngydBnH7i7YMoSlx+Qa2qop9YNcleF/V8XmCTHyEqLPURE0UIfrRVTPcI
         qYZ9TXAmGxD/GuwmB7Cehtgj6zBCoLjQwd85f1vpI5hC70GkKGhW+iENyFQv7xgI8P5d
         Hs406XhKSilbILrkwQRBxBcJKF0wIOL6DK3HJ67XAspwyH/DZUa8W2rYINDJpuFI0pyt
         P6sE514b0A2dN/hjNX0cIeANmMnu/h6YhWqlPNQ+/d5cxlpV1F4Ft2VvDYKQ/kmgeGTF
         FRixBP4qsUpyo22ZyxvV8opIQQzFkR3oFeW8sKnUU7SLSJ6XDASaxe/kMfymmW4qdq2m
         f+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109964; x=1767714764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLkc9FoZq3YTct54aDb92kNA/9i0FxcpSqRx6vpEmH4=;
        b=LBKdISjlnWph1RstnhvApItxx//UScq+4hiPssxGjwKPownFSaqBdRUgogA6HtgVDb
         O9jAwwtPiVh/FgIeCr+SmNC7U5G4o3pJWTfcriS3T3V9U0wknOkb3iA2b+JRcgF+VcCh
         1+lKkShPnoqC5iAZYa9AjDhAXO7vn80WAyNxiDfZrLO1W5EaYcn9dgKtxoS3ZDTeX5qD
         4XNjhYcPCxzPNX1sgopeq9C7TFFvU8G+jcn1cqYOcfQrdojnzPy6IjO/RnVxupdfsUHb
         RAa43Cokg8VC0Xp8BdZ0H9MnoldTesTNPHv1uxgIs82wqTv/puBq+3HncPJmop83++Zr
         e+kg==
X-Forwarded-Encrypted: i=1; AJvYcCVSvqVrNEtBrA07pMB3I74u6wAjRwzkc69Oj+8ucoBHjYJUh7mss9Vv+zZgh+SYEPpDssbMKIEwOEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjARdZrzIaMSK9HOtl1YsseSMONcEKg7loZLFg6sdZ8D/M66A8
	IVb0PfJsoN0wDE4bU2HM63FAjnd1igtc30ajiuAOh4Ifk6uFXOPPlA4M
X-Gm-Gg: AY/fxX5pXB9HyYrziExxc/9yJ+qr2aOLAdktEJc9IRGnXxbFCf20xK2zaOqsg0XYoA2
	CWnMqfGTAVPZvUHTiV92QRYew345M85IWxt5E/a5CCvIbPD3VTDii45Ji4OPjgk1gbl6rO6e7Nc
	1JJ3WOYYfYq0kqH/xjDBE9aJ9KUL3ZfGW8eYx1Y/W8RimuGgZ3iJNNcWA1aMYgiSVQu7N6mprdP
	rhjfRrQFqIEN9k5edZ1AYBRcwGG5lF/G20hGurioxTNeEQsMw0e7gukjY0ksgberL4EJx31tv+M
	U7/YamGqxApGO7ZSecqwD0jXkKHQdUDNODMH/1r3AXAPFg0hlAF3T2+Fh4MRESsNhQ6uAsYpmmm
	VbB3/wroBeou18dm3PF2cRSpv0cegOH2BrDUSB9IdsRD39PwmaAAKNFd+fa5Hb9LkaXEmhyofy4
	OsFdU80Nv2MYpQqDYn5D/As8FuYPcR3UqOV4IMs3pTTK28KHBYvQccladaCyRpoqk=
X-Google-Smtp-Source: AGHT+IF7nUKnadZrx5gs11egT3DU4G1WMv3sk3hckkCfKISBVERyvcgKwBe1iEgy5CNPXKoQH85fKg==
X-Received: by 2002:a05:6402:3596:b0:64d:1d2b:238f with SMTP id 4fb4d7f45d1cf-64d1d2b268cmr28013387a12.19.1767109963862;
        Tue, 30 Dec 2025 07:52:43 -0800 (PST)
Message-ID: <a691f12f-e453-4286-a0ff-d6db8f582874@gmail.com>
Date: Tue, 30 Dec 2025 16:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xen/arm: vcpu_vgic_free() updates
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <ca86bf36375d19555961225f214b9d23557b0d3a.1766504313.git.oleksii.kurochko@gmail.com>
 <4c09cc87-307e-440d-9a1d-7ef2313ae466@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4c09cc87-307e-440d-9a1d-7ef2313ae466@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/29/25 11:50 AM, Orzel, Michal wrote:
>
> On 23/12/2025 18:01, Oleksii Kurochko wrote:
>> Use XFREE() instead of xfree() so that vcpu_vgic_free() can be idempotent.
>> With XFREE(), vgic_vcpu->private_irqs is set to NULL, so calling
>> vcpu_vgic_free() a second time is not an issue.
> Usually it would be beneficial to back such statement with an example of a
> situation where this is or will be the issue.

I think there is not a case now in current code base, but just common practice
to have such type of functions to be idempotent.

>
>> Update the prototype of vcpu_vgic_free() to return void to satisfy MISRA
>> Rule 17.7, since the return value of vcpu_vgic_free() is not used by any
>> callers.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

~ Oleksii


