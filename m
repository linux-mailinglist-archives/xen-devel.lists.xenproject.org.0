Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB938BCAB7
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717393.1119544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ukR-0005Bm-Oz; Mon, 06 May 2024 09:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717393.1119544; Mon, 06 May 2024 09:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ukR-00059q-KZ; Mon, 06 May 2024 09:35:03 +0000
Received: by outflank-mailman (input) for mailman id 717393;
 Mon, 06 May 2024 09:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3ukQ-00059k-II
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:35:02 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8a135bd-0b8b-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:35:00 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41e82b78387so10906995e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:35:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5412000000b00346bda84bf9sm10261442wrv.78.2024.05.06.02.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:34:59 -0700 (PDT)
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
X-Inumbo-ID: e8a135bd-0b8b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714988100; x=1715592900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amZL2ATlg3xNvQ3/IvNYNfGTONfI++zlDrkaHJkdsvw=;
        b=UYVcGxkHhN8Wlzb73fjpnfnLVDSXcJS2VS/3QxvKBv+cnCTGUiIlAcvHX1NINxvoAE
         Ok5tVnFMMB4KQjxWHwnAibixEn79QH9MOgsNS95MhBVEUoz58ZpwVyBwqERKiUQkqKYW
         c+3jzjrB7ioVbjiPjmRFuwokrzClyG7x7cFEDrz/+rKW5Yxl9AVjfNcYhOxmCTkNcUp/
         hvVGTdHPqCAFhdSHNPAjKW/Ot3IgoVAUcMkMaGoCeudxX/m9t4eWCjIM7Gi5va8ZUey+
         k1trymykJdsOUIljThtSrM6EOk7e7jHADNEWKu4d8N7wX2G4ZJzc33Tz/sKB8+SjAPPt
         EMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714988100; x=1715592900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amZL2ATlg3xNvQ3/IvNYNfGTONfI++zlDrkaHJkdsvw=;
        b=a8UUKa0ozO2ck2lriUe9YYC/8J0ORlWfmnH+2YFWil1zCmeMrHAAns24SYTBZQTbcg
         oxD3NEmVB33cpwvlLDON9o+UYv2Vk3w4SuZFKSEwPTS5BL4H54L8DIG7rIapuGljGsi3
         K5StiVNzjeCWAY+gNsgGdMvMHcmlbh7aXGI92k6Hsa4ofcAPyyKAHxZFm/+FuBTDNyIN
         krjaO+rAhoxab7oXOt75BOlven081+sNX6wOFgiDGSuuM8FnCGxeCRtZpGhyq8EJGfE2
         Fw6JVgI+JhcYVGVG5kokEKhzcPkx99NQL6dyPda1fTve7UZVwVwdKt6Uvg3j3mx+d87N
         SpIQ==
X-Gm-Message-State: AOJu0YxbErs0UWyR/uVOvsO7uAhF7L4HcFvHlLWBZTwPGmoGl25bVB1N
	zSA0MODK4hMW+QDg/DVl1RiIH6Xy70xUS0yPQzlq9xo0dGDjllJPTu1k6FIjBg==
X-Google-Smtp-Source: AGHT+IGYA4wldbHo2Jg6kKK9VlI8Zytyb2g4rclyI1eSbO4rt1dSM5egO0Cuc3907lMg84/exo2TMQ==
X-Received: by 2002:a5d:5960:0:b0:34c:f5d2:528d with SMTP id e32-20020a5d5960000000b0034cf5d2528dmr6802471wri.43.1714988099881;
        Mon, 06 May 2024 02:34:59 -0700 (PDT)
Message-ID: <a8be9d16-36e1-4528-b14c-42746bae605c@suse.com>
Date: Mon, 6 May 2024 11:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list [ May ]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 community.manager@xenproject.org, Kelly Choi <kelly.choi@cloud.com>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
 <ZjiiOtvJq1KjXo5F@macbook>
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
In-Reply-To: <ZjiiOtvJq1KjXo5F@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 11:26, Roger Pau Monné wrote:
> And then some patches that I don't expect to make progress:
> 
> x86/shutdown: change default reboot method preference
> https://lore.kernel.org/xen-devel/20230915074347.94712-1-roger.pau@citrix.com/
> 
> x86/time: prefer CMOS over EFI_GET_TIME
> https://lore.kernel.org/xen-devel/20240315114242.33309-1-roger.pau@citrix.com/
> 
> I find it quite funny how everyone complains about all downstreams
> carrying similar patches to deal with firmware bugs, yet when I
> attempt to formally post them I get zero interest from such
> downstreams.  Maybe raising them here will help get some eyes.

Well, as indicated on the Community Call I've meanwhile proposed a design
session (which won't really be about design) for Lisbon, as to maintenance
of our EFI interfacing. I think I had provided feedback on the shutdown
patch, and I didn't think there was much of a point repeating almost the
same for the time one.

As a minor remark on what you say above: It's clearly not "all"
downstreams, as we don't carry anything similar to either of the two
patches. But I'm pretty sure you meant "most" or "many" anyway.

Jan

