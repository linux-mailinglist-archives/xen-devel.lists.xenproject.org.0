Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8AA76723
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932531.1334636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFa4-0006cd-Hx; Mon, 31 Mar 2025 13:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932531.1334636; Mon, 31 Mar 2025 13:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFa4-0006a2-FK; Mon, 31 Mar 2025 13:53:36 +0000
Received: by outflank-mailman (input) for mailman id 932531;
 Mon, 31 Mar 2025 13:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzFa3-0006Zw-DO
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:53:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88cc5b7f-0e37-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 15:53:33 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso2508563f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 06:53:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658ab2sm11480760f8f.15.2025.03.31.06.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 06:53:32 -0700 (PDT)
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
X-Inumbo-ID: 88cc5b7f-0e37-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743429212; x=1744034012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O5gfNlu1e3BmgxSnfDwX3uM9INrfHXH4hzogVViSJQI=;
        b=JMSC42Oo8RdjJokhQ5ODrJUfRb3/OEovGmQWfyrvA89JL59nMp7eMDvncqrc2vsQ/E
         Y0WCfOpe9zHJU4ADXwdvV/+Li9QbAa6u84k4qSk+2oXJ9Pd+3a3v8flFNytqwYiQlKYD
         CqtR4hGGTdonM7DzGOH8bhkrp6Bot2yHQ2NvkjkEG0TAtP2dX+e0uDzRNK8UKxXiyl0K
         5nCto95s74/ohCfc06qGLGM0BNvmuti4WUTgmMRGgt2Vy94z59zoDsdzSpBHxkD4Xtsm
         SQXqz9bZJuzPrA3U1lz3nyCOqTdR934wJe2GSqK0+MoNV9G2uimkmREtu2tdTLwU5E4K
         cEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429212; x=1744034012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5gfNlu1e3BmgxSnfDwX3uM9INrfHXH4hzogVViSJQI=;
        b=IkAiaTd3MM/hOuVljvCjW4B2TbTi1x7PE9CSFrvBbcutTPsv7yi9LpcQopc6u1gOmV
         k7NxDuchut9RT9foZCunMeA1y4d8ZA2gS2DMBLxlTPnYa47lXHvjZnXek8u48KnasE6u
         u+4nZB7IR/xEKJb+6eyRnbESL/viCf2hgmMejSOyAcfrx6iRuQR+hyb9TaTbiS8HoIxF
         azEx6k9iltqIk+CLeGACFmGGaKQNIoHF8I0gQJxRr7AbNy+M0rMO865hRTb+CTY5MEJU
         UkfUBuc7FHxuOfgoGiGap2StelXZV+kvNvpxmU7g8aWA9833KSInUasTjnwfp8z5ZDzn
         gAjA==
X-Forwarded-Encrypted: i=1; AJvYcCUkfcU1DSALydmbyYuO74y/IToVfApzlmbIHcmq48CDTbpyMwaoSjpWTJZ15WRYFkFzYpvJTqU9/+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6MGC1X92AfdzEAo6ZyOmOlwsUDdi37ENe+XKixWbsPRO+c4fZ
	s24m5Q3qaDjush01+EQkVg4MuGDgun/0B9rCrPH1fPaelo780kG6YHYG3HC++A==
X-Gm-Gg: ASbGncv4JxlNjkng0yI7+swmJHKomSBcMIWQnMmScmCixUTsdNN9ef2GzWQviDphR3d
	CCKd4murEarxfp0Bx/2DoBpClp8HbeaoX8dye6tO7WRnbmfIzVW1qI/0SCMPlvNbRCDU0UIvThR
	Wj1D5IADvRWynmXMTw2j1GWBIH++JSUDr/YHkvkC5tjuU0gDqsZLxXutTEyIt2bOyi+he2ucJFY
	u0V5oOinQIw8XQZDmuDLfygbBbOzuiTCF5AK3OzsmD4zP6pUZjOOF0v7Nm8zMucDnBN3mh5lCmX
	YHWcqV4+WH1YfhE3r4FbhCgb0uYf6SEY4tS5YwpLxglP9pvQHlltY/ryIRlR/9wPnXc113zrYNf
	lGYkWQfgh/FB8HagOAWb4gYqOZfuoDA==
X-Google-Smtp-Source: AGHT+IHbesReDlu0gp/qqhuF0xHwdwmMc1o7POcd9sh8Vflo293OrLez1+OP4KA/rghmZHqw0yoElA==
X-Received: by 2002:a05:6000:1446:b0:38f:5057:5810 with SMTP id ffacd0b85a97d-39c120e3231mr7275243f8f.25.1743429212605;
        Mon, 31 Mar 2025 06:53:32 -0700 (PDT)
Message-ID: <4f2fbb41-e807-47f2-b8d1-0b44d4cfcdc8@suse.com>
Date: Mon, 31 Mar 2025 15:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] xen/arch: Switch to new byteorder infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lin Liu <lin.liu@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> From: Lin Liu <lin.liu@citrix.com>
> 
> This needs to be done in several steps, because of common vs arch issues.
> Start by using the new common infastructure inside the arch infrastructure.
> 
> libelf-private.h is awkward, and the only thing in Xen using swabXX()
> directly.  It needs updating at the same time.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



