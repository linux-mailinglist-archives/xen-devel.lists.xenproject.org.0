Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D576AB5380
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 13:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982751.1369092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEnWD-0006BI-Fy; Tue, 13 May 2025 11:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982751.1369092; Tue, 13 May 2025 11:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEnWD-00069I-DC; Tue, 13 May 2025 11:09:53 +0000
Received: by outflank-mailman (input) for mailman id 982751;
 Tue, 13 May 2025 11:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEnWC-00067M-R6
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 11:09:52 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca445b26-2fea-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 13:09:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5fbf534f8dbso8410907a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 04:09:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d70d55bsm7051474a12.65.2025.05.13.04.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 04:09:50 -0700 (PDT)
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
X-Inumbo-ID: ca445b26-2fea-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747134591; x=1747739391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nNM21eq9u1oC73bbfqviyTd2L8fCDU+BOAj5ecnoVH8=;
        b=ZAbNlrAG5EJ3l91xfhEvZVz0lOchRrNRrhCNvA3DZLITlvE6FDDOJ59EHGWTT/DnSP
         NHKrfLaQtUmAGhEOL2h1Txrt6pXSB2n7xDpQo/P97m/UPkK+TXD0Sm4QayANCCsQxC8d
         DRDZijH3U8h7Yx7GK/F+WGpCnMk0VK6Yfp22EZ/4vRyrRceQNDWJq+Z53fUyn/UXHgac
         yrIsGNqBhntWpKeH3VtkDcUY91GixoCGdIa2JG1RjDbIiGXkvBpM1iYxWEzj6lt6ioLL
         Gs/QObjo4R02L9V9gN5ckIyAv6dBhfoQ7hR9IQ2/3FCFsY6n39b5tEVdh5IJwYLAEDtD
         PH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134591; x=1747739391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNM21eq9u1oC73bbfqviyTd2L8fCDU+BOAj5ecnoVH8=;
        b=hZIoMXcfrnMKmwrEBsALdVkZwTpMNnWLFHlwdj6fy51HwrFRllnWnEBHvHDtZNDcXZ
         /PtS6tw+7k6/r2gjRJyf/sRcIxKbj8jLB4PuRVjua5So9dQ4zNwFsWAvwDh3Ep5L59BG
         CeZTIt2S/Nhr49PVPvIb/8Ras7LTetIXhTnL1G6tKJSChCiXdd4tZuuCOQsdzRSaY+zJ
         xnt+nMVL2jrlDgn3QbhW408/ruGKMioD4CRwI/885HwL0vTk3xxRfOPRBlTp05SjOg85
         nAwzuLz2Rc8MjOAMMyQLHajPyY8IyojiovbyA32outKrdGqv9IQu6S5Tz8fwMvY0Vv2D
         9t4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2vxrIcGUUe6V2gBVp5b5jk7LeYOw5DwtyQLbSGdMqhCyeTW90I2eL/il1zLoh/LNDtItR4fJKLs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6lO5NI3Tjt8Ie05RCXdK+gcCCBrr3SYm62tA6iACSVH1b419a
	yvs2cAuc8KoaYgRYsZTbcthNeOPXKeUmcnkUmASfQBiDRfpZGDRyyFkEXnkcmA==
X-Gm-Gg: ASbGncvlW1kGe2dd2x+cH1K4lourQ68HAOz2T3wMdcEuOzMwcQoCILPR+5zIDQDBeO0
	aTr/1Q5trmCK5BC3G50124lGn4dArkLLEa1HBwv7SCG/MiZkZUm34oPSMd+tOQtPze63Dv8HvLB
	l11qckGOBlBLGBh4bYQU5Xhss7K45jiGRNhJdL+kKdPWq1efYRt3dUK5miDsezOFUJHIJWE1KnL
	y9OA838dbXh/peKnQUV7LTwXJ52NwuR/QPRGqzQJUL7qZbSIl8ugJm/IMCRdgKxtFqUox/Iang1
	9m058/eGJvoMogvWO3G3MyQiuLZwGqzqFXSg/5MnoR6JVhpuoygtqfPm5zlbVmmsOWVZR8fBtUX
	olNiG/zt+mYJ4GFFTJfS81RZvPgriDF2DUd3D
X-Google-Smtp-Source: AGHT+IGF7P+W97cyL4RKmFF8g/lAkpuY+/rwoT5TqVKVjSE+jHYA/2UOREs2lLjwvdc1vQCo11Bw8Q==
X-Received: by 2002:a05:6402:5388:b0:5f8:e6de:fd0f with SMTP id 4fb4d7f45d1cf-5fca0770801mr12781385a12.15.1747134590623;
        Tue, 13 May 2025 04:09:50 -0700 (PDT)
Message-ID: <55e73266-7727-4a1c-93e8-dd69712d64d2@suse.com>
Date: Tue, 13 May 2025 13:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
 <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
 <504f0be0-91fd-4847-8fcd-505771674814@suse.com>
 <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
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
In-Reply-To: <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2025 13:07, Kevin Lampis wrote:
> On Tue, May 13, 2025 at 8:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Well, there is an alternative: Require the lockdown argument to be absolutely
>> first. (There are further alternatives, but likely less usable.)
> 
> Is this your recommendation?

I would like this to at least be considered. As you likely were able to guess,
I don't like that custom command line parsing very much.

Jan

