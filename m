Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE9B15B5B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063598.1429305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2xq-0006Oq-8e; Wed, 30 Jul 2025 09:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063598.1429305; Wed, 30 Jul 2025 09:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2xq-0006Mu-5s; Wed, 30 Jul 2025 09:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1063598;
 Wed, 30 Jul 2025 09:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh2xo-0006Mo-KJ
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:19:08 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e722b6d-6d26-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:19:07 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b791736d12so1221305f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:19:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b2de3dbsm10119446b3a.113.2025.07.30.02.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:19:06 -0700 (PDT)
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
X-Inumbo-ID: 3e722b6d-6d26-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753867147; x=1754471947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/gA97v5OEVcdsL4PTuJiCw+/PWGqk30SFnLSRdRlCHM=;
        b=FvqxUKzdGpriE/LCmghShNqW9uqWoSuoSWFAhYr62Pj2oA8aci7x/HBKgMnRB8Coav
         SgBSkP0etooYE/aIAj7pWzN5LfCBxksKu2z6dj2yaJBt8+u2UoOPl9DOBOVq+H7yDgfT
         xw9rgJ8BAjrInhyuj2hw1IRa9ZdscaPSzDgFLGXgidLa2kp9VDBUq/PQxesH3om7dzKx
         5wE0fhPvPSZsaUFGIhvsxi35GYKvPlKxCP0O3gmgDt6WY3nTghdjxiryaYNlSqVlNh4R
         Kq7BZXCl7X6njar6UQlJO1GhVr3EwTXt2L7WMZxSaRJCi85WVrLEfQcrShxFG2dsrCSa
         YLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867147; x=1754471947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gA97v5OEVcdsL4PTuJiCw+/PWGqk30SFnLSRdRlCHM=;
        b=QUFzQCJojMLwweJSkQszacsgl1JWKGCAzLeCWws39XAXP3Us3S0RgLvZTqz+Tu7CTk
         noi09MzaUnmLN/JoPvZXBU/MyosN+/WrUd2ENcd6KGRpJplNKI4Wd/HXycQBIxS60psB
         5Zcym6H5bgTEzyaA3FE8C4IR4/PHwmWFkpsUx8aRDvclgbi8S6CRwcF9UVYGjmX/bluM
         C6emaly47xvl/rWWFond4K4aqcF5DCEhKv8gqXk1/RUo0mAj5ovhQCXEqFUGtWGpQdP/
         5Az1b9YejQ2MyjL597y5XIB+bdur2EaNcEoQrpUTkRtDkCtVEID7N2C1HP8bOwUSnGR+
         rBpA==
X-Forwarded-Encrypted: i=1; AJvYcCVHw908v1dkEIYpWBXo0ix79Sd/9/gGHtu5/f6whrOLSVlOjfQEuVvCnVO4ShxGOEVKUPYZs1eK2UE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqckUQ7EWfdn/pMAZ1DjUhaM7alM2xyCEXeZ1ixsENCPBG5qWg
	5CY+yqX9KHwjk23nYN0TSslrs3DA/qIePUlVxhGsKimDhPH538mA8b/GK5hKgMD4Wg==
X-Gm-Gg: ASbGnctqv/MKH5Gp66PKf7QyB34nayl+XeIZ+a6mwZBMYIb/UhnnGwivpo9RwhGTr+o
	7XNu/nFFQwnkPxZFHemI9VeS9MQyKKDSe/y58EWchfP4lyLyfZpQX6QRLV/52j4Gx3OknZewano
	Y2+kpn6FtCfxNXYDtqKmeETzAaZRayt13nSv77XtaZ4rUfIsPiyV0+my4+CgiaFneMBXF5mNLLb
	qJtLlp7Nr2uVwThYt6ETkWSg7YnhociGBnitL1rq1+S0yQWLrl/fehriB5Xn+Z1c6Z/RPJkQRbl
	Cfc/ZNcrj3UMQSv55iu1GQX8cHfZOhNovOfx5x1pDn+udQ18CnEu+Puaccon5awArFY7vaLcwZi
	E7Id2+/wTByGZ3UjYkFx0GzggJezzZDSw5A1X8dEVzYrM48yVGPy8fAaz38lSZz3++J/0xFi0Bi
	4G82WhTYxZbONuD4stPQ==
X-Google-Smtp-Source: AGHT+IFi/TUqSTFeAsQnQi4hmtCBERjXimEiPpptzZsK9YCg/v+Sovu7HQplSRtpgOJ4ZpbTVoKjKw==
X-Received: by 2002:a05:6000:4305:b0:3a4:f70d:a65e with SMTP id ffacd0b85a97d-3b794ffe750mr1735055f8f.37.1753867146682;
        Wed, 30 Jul 2025 02:19:06 -0700 (PDT)
Message-ID: <06e28dbf-dd86-476a-8b0d-39f3e8fb898e@suse.com>
Date: Wed, 30 Jul 2025 11:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Introduce CONFIG_PLATFORM_OP to disable platform_op
 hypercalls
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2025 08:15, Jiqian Chen wrote:
> Hi all,
> This is a continuation of the disabling some hypercalls handling code series.
> https://lore.kernel.org/xen-devel/20250704092952.822578-1-Penny.Zheng@amd.com/
> 
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> via disabling some hypercalls handling code, which may not to be used &
> required in such systems. Each hypercall has a separate option to keep
> configuration flexible.
> 
> Options to disable hypercalls:
> - sysctl
> - domctl
> - hvm

Is this hvmop? If so, how can it reasonably be disabled when the majority of
guests are HVM ones these days? Some of the operations can be invoked by
guests on themselves, iirc.

> - physdev
> - platform_op

For everything else, it's not clear whether it was conveyed to you that there
is a more general argument against this fine-grained splitting at the Kconfig
level. Already with domctl you've learned the hard way that it's intertwined
with e.g. sysctl. The basic direction to move into appears to be to allow to
exclude such special "management" operations via on single control.

In the light of this it's not quite clear how useful it would be to actually
review this series. In any event, before anything further can go in, issues
with what has already gone in will need sorting, imo.

Jan

