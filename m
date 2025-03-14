Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FCA619A7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 19:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915325.1320852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9wZ-0007rE-Kv; Fri, 14 Mar 2025 18:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915325.1320852; Fri, 14 Mar 2025 18:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9wZ-0007pm-H9; Fri, 14 Mar 2025 18:39:39 +0000
Received: by outflank-mailman (input) for mailman id 915325;
 Fri, 14 Mar 2025 18:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt9wY-0007pg-87
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 18:39:38 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8f9cd6-0103-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 19:39:36 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff80290debso48314a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 11:39:36 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7bd0csm3027381a12.47.2025.03.14.11.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 11:39:34 -0700 (PDT)
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
X-Inumbo-ID: ad8f9cd6-0103-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741977575; x=1742582375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOozeBnii/eu0U/Pc7KwHCWiz8f0qLLsCP/hc4MPynk=;
        b=hMinOE7x+CVzJsSiFQURF4/LH9MHJibSw+NL6WdjOK1p0xcoELO4cesW1BQhtbz+Hp
         QHnobVCxAM0yrqlKHx5bqEQSc09g4MWlVDEoGNob5M5MVg443lQHBeJvF9m7nnvHEkv9
         AkIshew4lPK/0f9gTunL1PvIzG7rs09jCA0MZVQheTR6M1dVnX0SUkGN037Wysj+cmZp
         Ypyxf6AR5+SsMG8PzrL4Am8flU19gEk903AJXOtik8rLkYooIVCrxBXgbvb1WhmgDZCj
         EGE+9FYwsExf8IzrqBs3QAes69GUrd07IYZlt+WJwXtnQTo7L3APmj/j1VtVzubY7B6/
         wGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741977575; x=1742582375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOozeBnii/eu0U/Pc7KwHCWiz8f0qLLsCP/hc4MPynk=;
        b=Qc8HHoJd0WeX/+tJgk5apgR9C1oPg6+2siFDFmSHtB66GuxpJp+CFl7Lv/C/v6IPNl
         nP2Jqmqj3BETALs1MNP+gNHHfWlQy+nQrmezWtLzNHFpTRXknxoLT/U5gXsWqDzWjyHP
         t3U4NmFEBzhD0HiyPauk6HYi1tOLKQoqd/XQA3/lQilDlVMpAb6f3223JQwvCCF09EOG
         vqQlUXZ0AQDvP+TcPhRqStQBgRmcxwDGfP59ZQD7ZfYPXrIBYNdSOb+8gqmK399H3AnN
         POR9AhQfgM3fTdmMa/UuS3mXkVyeLy0Bdz399iz0Zxt+6Mq9fcfVJXIrJyb/OnWK6MWI
         NolA==
X-Forwarded-Encrypted: i=1; AJvYcCXMP0m/S+vhJ/8dh7RpOZRizkCHfJ3qKAg4pHX7ndDC8wEZ7qPZikTivSGIxReLpVCvdOzDARREeOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGZWJe8CoGvMG0VOK7YTesOGOcf58Q5nBKArtDUekYzJ/t+QCW
	jjXFM73CQvWQr6wvvay7ZzhgsQepHkMRvyLWVCMiQXJbBjQMc2q0v8/+JjQDri4=
X-Gm-Gg: ASbGncvusVZGjfYp7IZE8JJqGEpg4HUjitlt1eMAhZDqLA+rQKG1D+NQs403ziRClPv
	oZtZYeChSSf5vgPVo3nliNWNR2PBafR+8pRWkr310/KNYKcCtPc9T14jftAWNBsZWoO+EGZgtDh
	zynrTLPhduQAA74iajPRujIGcjN0i/RiBSHqCXJ2MWgtBBBY6fwT0TAXg1buGGkXuU/6dB8IeiB
	8wosTMCvU+ZLgQrlM+hyEJRpcGvp2UftW3Y74sSmhhejY5r41FyuShBwgdrcoBlZoIEW5KgK1bE
	ikMtLvN90ssjfQKrEXqYSz9lTsrJPiNL70Qbq7iX44cQ8O3hwPGvTUKY5g==
X-Google-Smtp-Source: AGHT+IHy4R1pysrhxzZHf8PsIff+cJIi5Kt3lbwGj1TI7jFN2ZmDtBraZqUWWgeIc5QjfTBBwo1w6Q==
X-Received: by 2002:a05:6a21:6d82:b0:1f5:8eec:e50a with SMTP id adf61e73a8af0-1f5c12c7864mr4910034637.31.1741977574981;
        Fri, 14 Mar 2025 11:39:34 -0700 (PDT)
Message-ID: <ee814e2f-c461-4cc2-889d-16bb2df44fdf@linaro.org>
Date: Fri, 14 Mar 2025 11:39:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] make system memory API available for common code
Content-Language: en-US
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, alex.bennee@linaro.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org> <Z9R2mjfaNcsSuQWq@l14>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <Z9R2mjfaNcsSuQWq@l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 11:34, Anthony PERARD wrote:
> On Fri, Mar 14, 2025 at 10:33:08AM -0700, Pierrick Bouvier wrote:
>> Hi,
>>
>> one patch is missing review:
>> [PATCH v5 12/17] hw/xen: add stubs for various functions.
> 
> My "Acked-by" wasn't enough? Feel free try change it to "Reviewed-by"
> instead.
> 

Those are differents. From what I understand, Reviewed implies Acked, 
but the opposite is not true. If it was, they would be equivalent.
Thanks.

> Cheers,
> 


