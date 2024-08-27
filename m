Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9D960710
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783778.1193070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sitB8-0005vg-VM; Tue, 27 Aug 2024 10:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783778.1193070; Tue, 27 Aug 2024 10:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sitB8-0005sV-Rc; Tue, 27 Aug 2024 10:11:58 +0000
Received: by outflank-mailman (input) for mailman id 783778;
 Tue, 27 Aug 2024 10:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sitB7-0005sP-6z
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:11:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9831800-645c-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 12:11:55 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so558309966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 03:11:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e592d9a3sm89745166b.193.2024.08.27.03.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 03:11:54 -0700 (PDT)
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
X-Inumbo-ID: c9831800-645c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724753515; x=1725358315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5IyZ1xSNKaCZh8FN85uGFgt/sG9NKrQQlldMvA0JaiU=;
        b=UBtI7OelWG80mcl4CSWH2ACMkfm+jett9QBJt1dQfpLzyaw6kf2i4cHe2HLUL1YLmO
         y9CBmFaAEarJMF6lPYRr5EVS0WFNStkzXmGHLDOJtDBUhaRNkSEHwAnmeIDbAD2dW3Iv
         upujVawYK7x7xNVRUr4BtW25HUZ2jed7QWMqQ8KJhRadqXkKMOS8Y7EtP/h0cHNRsSKW
         4WTy0tE6OGh+Vb/m2X2LCms4tnAOCQI/X+PvWI6YRikTGjSFzbB5a9RJlfBA/MNodXGN
         Sp+UPHq1cZauEIkoIEGJGesQVnr/XB1Zi4+3rGJhQcZZe3FSxQlMxdLxd2piSV+Un+3C
         FCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753515; x=1725358315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IyZ1xSNKaCZh8FN85uGFgt/sG9NKrQQlldMvA0JaiU=;
        b=Vz/lA5OzBgycBiyIM19FH23FI1vgDjXF4e2piiRDuxyvHMcVxOefXtxqCnKG9TZJ04
         qNp83rTqJGcbQJ+938aCWJ9PrXtVOvcbEEAz2DLb7zVSv0NfUv7fcKft1lYDWSRVZDsk
         Py9POLibcml/1Z3JkultcpmuFSRHHuyV1LKEBwqDA9NIwCUB6DalokjRSvROtecJtx6e
         Mxl0uZZmf26sDFVNO/12cT5R1Yr8rqacaNGBDh4jRooFYdtBgeBT1K0Jjc36rEvIEidX
         jtbDelbF6LkXOmM7qhQLkCh4M9SDYdsLxQVNijeJBVA3ehZuQ7LGbA9/fIRztkXBp0mz
         viLg==
X-Forwarded-Encrypted: i=1; AJvYcCUj0UGlBkBL7BpO3BDZPdMXhR5DwnKBbh/71pcn9DZtbxpatcRZ+m+YaYloy5o1I9XrL/V4XCf03nY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgRnprSlgV0GDgHr4wD9Ml8j/FZHqeo6KKSd5n/D/N17zHJw0h
	pYiJPYnP+YoAl07eNXY+IlLxTrxWTS/6x74TzUzn942zgQYprTMWUPcZdOcoKQ==
X-Google-Smtp-Source: AGHT+IF2uTYJt5DfWm535wpGj93TIlJrHcT55L5iu4jxgHA53+9Ayhs8XuI1xA1P9sOXIfPlehWE+g==
X-Received: by 2002:a17:907:72c7:b0:a7a:9144:e251 with SMTP id a640c23a62f3a-a86e397e641mr193513666b.11.1724753514579;
        Tue, 27 Aug 2024 03:11:54 -0700 (PDT)
Message-ID: <6b86e515-c68c-4c3b-9e99-bce4119ab1a2@suse.com>
Date: Tue, 27 Aug 2024 12:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] xen/bitops: Drop the remnants of hweight{8,16}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-5-andrew.cooper3@citrix.com>
 <8c6599fa-22c0-455e-9d6a-51b3bf3d24b3@suse.com>
 <f0a5525f-cfb8-4669-a0b7-3da4fdd9eaaf@citrix.com>
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
In-Reply-To: <f0a5525f-cfb8-4669-a0b7-3da4fdd9eaaf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 11:49, Andrew Cooper wrote:
> On 26/08/2024 11:39 am, Jan Beulich wrote:
>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>> They are no more, and won't be returning in this form.
>> And what's the plan? Use hweight32((uint8_t)...) in an open-coded manner?
>> Not overly nice I would say.
> 
> If we ever regain a genuine need for the 8 or 16 forms, they can go back
> into bitops.h, in terms of hweightl(), just like hweight32().
> 
> But it's been 20 years so far and we haven't actually needed
> hweight8/16, and I'm expecting this to continue for the forseeable future.

Well, I'm not fully convinced. People may (try to) add open-coded forms like
in my earlier reply instead. But anyway:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

