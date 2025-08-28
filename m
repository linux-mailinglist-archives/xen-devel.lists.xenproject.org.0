Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD0B39D0B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098658.1452655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbdT-0004j6-Jb; Thu, 28 Aug 2025 12:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098658.1452655; Thu, 28 Aug 2025 12:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbdT-0004hT-Gm; Thu, 28 Aug 2025 12:21:47 +0000
Received: by outflank-mailman (input) for mailman id 1098658;
 Thu, 28 Aug 2025 12:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbdS-0004g4-0R
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:21:46 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90063bb1-8409-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 14:21:45 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso122045166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:21:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cc944f1e1sm1849377a12.19.2025.08.28.05.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:21:08 -0700 (PDT)
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
X-Inumbo-ID: 90063bb1-8409-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756383669; x=1756988469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VAbveMvrYakX2Q6GB3F/CnIDOavA7tm+QqoN5PlXxf0=;
        b=FxArF13PLzfhhIyRTQGsEBm692h2yprur+moDqK0pmJ5n3ZAQaMQv/DuEbcRgd7Ynx
         kI/ZZoteV7+S47zLtWieTuCkNo5iWtwYhJEi9rchpacSkHwG5aGueDwxMgu+BaUa5GTl
         zOj45eaWD6K1xU1ZL1OqgBub3gfYXwX1vGJJLZQngCHwnJY574sYgY5DAz70J2H1wbjB
         ZisRnoddaO4lEMZM91NmXoY+FFcEK+QCT80/ThFqBFmE/Z3/4RTFb5CAburtBcwXe8F4
         jU6e0Re494ZwluFcjh7+taISxLmEWO8I5y/gKShD2at5lXAcIAOk2C04Rb8kwv+0Dagx
         BDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383669; x=1756988469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAbveMvrYakX2Q6GB3F/CnIDOavA7tm+QqoN5PlXxf0=;
        b=ZIu06Ubjxa8sXELpFnZKfK6nKw3atTHDV1dS9tjvAywAVXqHiaCzcCIhG8vxCPFo6Y
         +I20Pb8cAxfgQF4HrCQgZ8WX2iak4cnQeqgO8ynqdFOzpCYfFW+8aLaFvE98cnsVcvK+
         GAlfi5mH2W0XB8I38smFuvAPI6Ec9cbdvShlMWC3LpHA11PGdNkCoL2Vk+hEhPDLSjm5
         EUa6Pkn+Hov/2dTdD8EqinR76fxgKIJKhWtzPRKI4LMnAfMm6rkzTMFdJVJAsST/g4Cd
         3ExYCEItRaaYZ/O1uEE7+mvoniHZ9qihgMOtyhCwFhyk4TkZgOeNplU7E+o3IYmVS6qO
         JHVw==
X-Forwarded-Encrypted: i=1; AJvYcCWpWw1li7451jki8qKQUwIo/zA8RTAuq6dthefv+iY8FVI3EDeEGX3OlEyy4FS8DClFUT5eGLMzpC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMMagXMdHjKntZf/ojvHB1CdbdeyMIVZ5IF0rquDI0cS4gZBOt
	xszSv6vSJrzf5TCL3IC7hK9SAEudAYDxFTzPlC6GTFbeOs9wjyWZUjbOUcPvtNpqbg==
X-Gm-Gg: ASbGncvTWR0gGmv27pTBYQwdBb2YGjSXYHYITahy8QnsNORlm8ca4+Jw/ruWCNEGpB1
	y4jZp8Or7ksYll4hBjSVIT7THmse5UWk6OT5gUObEMCLzi0xyU/lOApb1AoTJ3JZd816XniJzrp
	v6YAZPDpxxjrGU0y/Z7wKxu/GLzVYMXeNGVGSefryVZ6QX7089dw8/ddEhMGa4rgYP6srZzmGrP
	IixdLj70ER52Pb9D+C4jq6CtNmJPmAnWfQ4uT4hDmIRyuHpUAjs4uvpMssxGvF30exGZU/0gxmD
	00qoSnoaSNloRBaldMbvTFzQuMG/UyiJzw7A/YspZ4q7cT6qhIVNAeLhZS/xBpoMt8TWKKBszIJ
	8tm0xRRI3ng5k4QZWA2gA7wExUDxYFOe3x+AxQN+0HY4VdYnNySiEo/tvwtKushJloyIv3gzNCa
	b05bCo+L8=
X-Google-Smtp-Source: AGHT+IG9C5PEdqGY7hK4L95H/n+2P8NFHyMlOJQgzHmWDsi/fsFovCsIX5wyKxg6Ld1MMMPkJyL35g==
X-Received: by 2002:a17:907:985:b0:afe:6648:a24c with SMTP id a640c23a62f3a-afe6648c0damr1393627566b.52.1756383668817;
        Thu, 28 Aug 2025 05:21:08 -0700 (PDT)
Message-ID: <478ab6ba-1ae9-4be0-bdf3-a62ae4b54acc@suse.com>
Date: Thu, 28 Aug 2025 14:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/9] common/grant_table: Use direct structures instead
 of guest handles
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <3443dc8528075ce8ed8dd89ee5d0b78515c81e8e.1755785258.git.teddy.astie@vates.tech>
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
In-Reply-To: <3443dc8528075ce8ed8dd89ee5d0b78515c81e8e.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> Make these functions work with hypervisor-owned pointer rather than
> guest handles, so the function parameters don't have to live in guest memory.
> 
> No functional changes.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Unlike title/description suggest, this only touched two out of many sub-ops.
As others don't lend themselves to your goal, that makes things overall
inconsistent, for a questionable gain.

Jan

