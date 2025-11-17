Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE9C65034
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 17:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164180.1491190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL1eu-0006sq-CQ; Mon, 17 Nov 2025 16:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164180.1491190; Mon, 17 Nov 2025 16:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL1eu-0006rR-90; Mon, 17 Nov 2025 16:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1164180;
 Mon, 17 Nov 2025 16:00:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL1et-0006rL-7N
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 16:00:51 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90bf4033-c3ce-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 17:00:40 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so7455779a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 08:00:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a497f27sm10435326a12.17.2025.11.17.08.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 08:00:39 -0800 (PST)
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
X-Inumbo-ID: 90bf4033-c3ce-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763395240; x=1764000040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/0Q7SQYyEKCqzv0PODemPWtOGac2+wn5CQXPT8MqTgY=;
        b=aG9nmRZmFZlStaKl4haf38dXdS0vj8hXpfCwXX3p0ExVhJk3gbNxGG/KRRtLlOs6Sl
         kQN1beEjABC2P1GUrHVFOhxloyLOAjFMzR7WXIi0Lh4rtkHt7lzv1PJBKg79xb8TWebG
         iOYP+tBHjB+hdWkmq7K34l+xv3YPHxwQ1cWoxDr50y8L4E4eqiSjrpFTHQcNNDXHNqo5
         JZDEYTieRcMMRFsy8+dtWhxuxTk/fVOiUjQKiXafwPEjkuXDCN+vIKg+8K9O1tpluibM
         i6WdjEsurXuAfq9PSfalkj4H9L/gme3TIVPTUGrTc+/GkBSmUYQfI8lLAiRbFvxd92Tx
         zM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395240; x=1764000040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Q7SQYyEKCqzv0PODemPWtOGac2+wn5CQXPT8MqTgY=;
        b=a4XCDvEry0tBB2chh/AL2ObUAaDOjXQ8cSnSJefJCiekeOSVdySq6iBHu/b4JEL4oy
         Ma+9/AQDwbs8c5Ack+7ljBtID5JJ7gSVgBLmbfMz/O76SW73UmJMsVRBpPQssfOIQRTM
         1qchhu4eLW45JE/CoD4WyHCj2t+TpKDeBfpKIpnNWw7sWp1T6kILeSsu+NrXpM1IWztQ
         DNO7oQxmFJq3EnDWLeiLoAdGToo5FjphLsBtVvXjhKbd/qLJmAsRGoTCn3H5AEU08mY/
         Hk1pONRh4E/iXh7yvsyCd2rANS43UrIALh2e2oll3JcUBWtr0k3ih3JcaFIy9WBI1t4H
         Q9ew==
X-Forwarded-Encrypted: i=1; AJvYcCXB5moTyQWqq8fb3VTpVvE00kXJptiniy5yPSYS7qAKfuvzkZ++hZAR1McNSZEbmF9cfkvhlY7+jVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHgoUp0h/5TAxT4gVhhNEQjN0LSPIgsrtNRxEwNUWIZ0WpYhvG
	hI+xE5OaI7xbd2zeLs9a7Ze1LrnkWUQq6OMlvnH0lw2ZjbcIkfP7tGntcmthKyzeMg==
X-Gm-Gg: ASbGncsKN4tjbx0RRfcF91UVJDU3EibBpD82LJ6QrRL2FywHH4QQHRlonAOoKm5IbKF
	XC4pzuJDt4jZuN2HxcbyJiu6p3pmYpHfsWQsMHPgNamc4RFjFuMZdLE3Xn9nSB+6XBWGgY7OrDQ
	PMHIk85DOEypHLdFzBlxcEfvAiOrf4C2aeYvWm45fcwlXY860+tyU2DhzCoan2xRgBVZcy436kd
	Jlj0DPevrf0enlbZM2LeJDjRTd0/WqJiJsMQz2SuVfesDvBowcVA7XCBRzrKhim7LYcOJRnefab
	bq8Mo5cIe2xnrP+ZvINQCmK15RT2pQLvGpSfUB0+YJSbRi/SDfjmRgHe54ug0CLvdoUbyDWy/Xv
	jf/8HTZGPNl/v+AAn8EQ4h5CzcG4fDMs6qw0BklaZfuM9hvW5HdY1H9uBmTFKWAdmVoenwx4dlU
	GBBhd/ConB65BXqGEPZRT59yjgJjv3DlAnP8ADOgb1Vd/jQICoTtGtPh3X3hTjYqOxxp9MVKYoS
	po=
X-Google-Smtp-Source: AGHT+IGMyTd7VKvkxUfjOf7Ra/ZIUXvH96Iiy0guNuND0QZcKDGCeexDDEtfYXRIdFbaIGn5HB2xZw==
X-Received: by 2002:a05:6402:1d49:b0:640:a7a9:289f with SMTP id 4fb4d7f45d1cf-64350e04fb0mr10872477a12.2.1763395240309;
        Mon, 17 Nov 2025 08:00:40 -0800 (PST)
Message-ID: <499df585-d50e-435c-8496-bc6078dd504b@suse.com>
Date: Mon, 17 Nov 2025 17:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 17/18] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <3eea04894401202666ea0bb7ee1240a23ba54d8a.1760974017.git.oleksii.kurochko@gmail.com>
 <c40be165-0db3-4115-b96b-92624b669e74@suse.com>
 <1cd26ed4-cf48-4524-acec-3d806a5cf953@gmail.com>
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
In-Reply-To: <1cd26ed4-cf48-4524-acec-3d806a5cf953@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2025 16:52, Oleksii Kurochko wrote:
> On 11/10/25 5:46 PM, Jan Beulich wrote:
>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>> +static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
>>> +                                   unsigned int *level_out)
>>> +{
>>> +    unsigned int level;
>>> +
>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>> +    {
>>> +        unsigned long mask = 0;
>>> +
>>> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
>>> +        {
>>> +            unsigned long masked_gfn;
>>> +
>>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(level));
>>> +            masked_gfn = gfn_x(gfn) & mask;
>>> +
>>> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
>>> +                          : masked_gfn > gfn_x(boundary) )
>>> +            {
>>> +                *level_out = level;
>> For this to be correct in the is_lower case, don't you need to fill the
>> bottom bits of masked_gfn with all 1s, rather than with all 0s? Otherwise
>> the tail of the range may be above boundary.
> 
> I think that I didn't get what you mean by "the range" here and so I can't understand
> what is "the tail of the range".
> Could you please clarify?

By applying "mask" you effectively produce a range (with "gfn" somewhere in
the middle). For the level (which you return to the caller) to be correct,
the entire range must be matching "gfn" in being below or above of the
boundary. My impression is that this isn't the case when is_lower is true.

Jan

