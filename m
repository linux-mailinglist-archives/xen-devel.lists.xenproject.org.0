Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AD914EED
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 15:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746647.1153764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjwE-0000pc-9b; Mon, 24 Jun 2024 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746647.1153764; Mon, 24 Jun 2024 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjwE-0000o6-6R; Mon, 24 Jun 2024 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 746647;
 Mon, 24 Jun 2024 13:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLjwC-0000o0-Nx
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 13:40:52 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f7ec253-322f-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 15:40:51 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso46668941fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 06:40:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c8c01sm62702855ad.129.2024.06.24.06.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:40:50 -0700 (PDT)
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
X-Inumbo-ID: 5f7ec253-322f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719236451; x=1719841251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KLzkamUjja3jxtbo0dxxGSX71v1mCJ21/2iw1rHe5K0=;
        b=HrMFGFTlnIKgEMJ9NwVyblEtRrbQbGQEkXBzM7LgCAB+8lpfdZ4SvaTaxzaB/WBTR/
         q7lUSIWoRlN71Zp4LpNwOZEiuHLO1X92HMl53M1/3Ci8AYxl9u783tjXo3CyKGNjz0s7
         xgU8Moz8lwp0oB0tOVY6eU0R2YYv8/fSLFVuP/g8cv1M7UNmnMekE1oyKCisinG0+Vcf
         i9bU9vPDxMBGDuxN4Wvlpd99vvrlw+ZazC5nNqFvKcMYXEvA9NI2dRT/O/DpDp8Jq5GR
         Lb1c1dqU/78PILUDi2lA/z+T2SCLmTxHEv8t1fyZOO4g1WUW7RGKEO66GKNUydmKPEJS
         d6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719236451; x=1719841251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLzkamUjja3jxtbo0dxxGSX71v1mCJ21/2iw1rHe5K0=;
        b=FuQTbfW+ju1/r60r1ODg2WUHmZzP5wnZ6oSvhZAhVjDMJxeLaWvHCjz6NN6KIXMKJF
         RVU3wCvDb5oUvQ8cp50Hyu6ocYYK1OMHagmHSs2rY6MKdQ24lsimqGgWzFjr/f2xHOZb
         z44nzrvBKQMrEkjVAN5xGTMj7lD2ds1YDya4c7iFvkcRYnEnOE1vJXC3ur7TtQr/sYFB
         CP624DzN4V8/mNs0EVyt0kD6tqYu5ppXaDD67ZHCYbiw0F7fZvncfpk8zSC3PxLMQBmH
         JmEtf4Qv93bYkSs88dUjzrOEH37TR4JonY9EW/ftaNxYb0WAQIzxQy1r8PqoOzHGLbUX
         aqHg==
X-Forwarded-Encrypted: i=1; AJvYcCVECIkXb1Kf4BouKVtwxNsu2NvXR905VTH7gWno/FOPuuFvpRoEXe3tHitNtG02fBRPP+WGn+zlzJQ9LtcOj6xWLwHEBqB7ecDPgWqu4rI=
X-Gm-Message-State: AOJu0Yy6fqwVugULAGr7dx2IbmaKsZyVUs+ZZsDy/dktQIY395rH49B9
	l6wCdHccbC8CZbfTKCFVw/TaF/vxjfbPORYk8k0visIhPM9ntyEBBaFnUvke9g==
X-Google-Smtp-Source: AGHT+IEJlbkh48uEmGZMyRNc2OFdg4O04Y6YkGtSRxTuC6TavMEwvRkFjmIhl6nsH2gdr0UKFb4ryg==
X-Received: by 2002:a2e:92d6:0:b0:2ec:514f:89b4 with SMTP id 38308e7fff4ca-2ec5951ca7bmr30496521fa.43.1719236451364;
        Mon, 24 Jun 2024 06:40:51 -0700 (PDT)
Message-ID: <23f4b971-a161-47db-85a7-54f50300d039@suse.com>
Date: Mon, 24 Jun 2024 15:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
To: Branden Sherrell <sherrellbc@gmail.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <ZaeoWBV8IEZap2mr@macbook>
 <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com> <ZafOGEwms01OFaVJ@macbook>
 <7BAC7BB5-C321-4C34-884A-21CC12F761BB@gmail.com>
 <36d581a0-f144-4756-b345-8b74ccc25c74@suse.com>
 <70B65B5D-C075-4D8E-8D2B-08A1930EE68B@gmail.com>
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
In-Reply-To: <70B65B5D-C075-4D8E-8D2B-08A1930EE68B@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 15:07, Branden Sherrell wrote:
> What is the reasoning that this fix be applied only to PVH domains? Taking a look at the fix logic it appears to walk the E820 to find a suitable range of memory to load the kernel into (assuming it can be determined that the kernel is also relocatable). Why can this logic not be applied to dom0 kernel load in general?

Because PV requirements are different, first and foremost because there
we have pseudo-physical and machine memory maps to deal with. As you can
see from [1] I've raised the topic on how to deal with PV there, but so
far there was no reply helping the issue towards resolution.

Btw - please don't top-post.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2024-06/msg00831.html

