Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE35A74A4B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930619.1333214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty9Oy-0003YV-EQ; Fri, 28 Mar 2025 13:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930619.1333214; Fri, 28 Mar 2025 13:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty9Oy-0003X2-Bi; Fri, 28 Mar 2025 13:05:36 +0000
Received: by outflank-mailman (input) for mailman id 930619;
 Fri, 28 Mar 2025 13:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty9Ox-0003Wt-0t
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:05:35 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5584c781-0bd5-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:05:34 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso1138648f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:05:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66a8c9sm2554732f8f.47.2025.03.28.06.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 06:05:32 -0700 (PDT)
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
X-Inumbo-ID: 5584c781-0bd5-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743167133; x=1743771933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mRWTylH9KBu3wLOowxXO6GgnL+/lOGKwdWoSuNSZmi8=;
        b=OeESjjFbW23xM1SUu7L7hA4ZUgkO7PyFoDqNlN6KLbL0dQZHD6eCJCEPF/LSeHKbVq
         vWSwlhv8Y3M26lf/kymLPKm3KI0Ggb+OqKYqjQYa53PKTyaFMJ9ef5FQ9UMN3EA92zPb
         YrHDbrf95BGwQOTY3U3JL15jN5LBgTtsDSstHbNRZVhXnlq1+Q70gLNm2cwNZjYEmngT
         6+Zqfz8SRWm7hX8hqgj7jHvRCUo2utI3kyR/xe0jPZYEf/5vTkMdKS6P+YyuhR3LuBss
         5Rgg91uV1+Ti12ov231gcQVRSJMV/K6KgqLxM1lQ8YhnM5CT6gYZ5y3VYqU64oAs5PEd
         XrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743167133; x=1743771933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRWTylH9KBu3wLOowxXO6GgnL+/lOGKwdWoSuNSZmi8=;
        b=F9nI6EwwPYuvMhd3Gii4AJ7pdCJRBpIrPnFnRkRbFlCR6Cal9AerNeFKh4lOblKz31
         +KI4MGXT6tbyvqw7ksu4L6m1pf4wz7lvilL62iy2xNl8EU85TNf34KugnTTKjMFk0OHi
         fA4f06t41dZkPPdsJGstbNj79WJEuxDEndL2PSTQJ2WY9Es81wriI1TrJWCIGHK8KIHz
         wtIPZ5KdsebhsjyO+HsT24eHi2ZM3JjjLq2M2z1itdOM+xbe9trEIc2Vkg8a+YVEVbbp
         STVpd5ekVs5sRAw+T/Zg86PDufNsRN6KeSSxdwhbszzM2q0NGF5ySNPEjay8fvtJHpmq
         V/7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWBjUr6PECAk3W7qlTvmFKP5yJLEJ3WaMyPjn/O5NicCisUvyBjcJ8rsEwSxIrhvVuvc+FiSLLJhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymJ2CvQ/92ck1S1zls3T+Yc0DdLBiNIBxGM+cH7tOniJoeBNoI
	7TkwHCtOcR9P1A91pWEpzdl60PnPetmqqMG74CzpCutShhygFkG7ooiepO/m9g==
X-Gm-Gg: ASbGnctbAXU0mNr/nS8MBCpBlrR7+cxAPKih4FM0zfWLw52eDabXjMIbacS8ocE6ANK
	IYyEFSls8AUzN/6kaZNK5CpW70MTHKTg599MDENPLIWPr0XolbvFtYhbunEoi5DpC6ZUzYMNhTz
	zIpaWtwZd0nRfVaJSJM557+YeAykEzcy14imq06l3hQ7j5a9MuW4XyBk3rFhacmLQcVjjsVnPo6
	tq32GOlPmt/w34lghUYkHmz841I1iB6giC0RdAVm88iaUCmH7HtCK4eSoFZNotNKhX+0jO1zhBf
	L5Lr2oe1HvBU3trao7Q4INna01In2DOx+WAkHvWZTmlGJ5u8YujZ9UWmlJmF1IFTN5s3GMp4s2U
	M/tgPCbt8Ks/oKV+8yqS6NS6viI5prgSWt6MVlco/
X-Google-Smtp-Source: AGHT+IHu81nOXFQVWqLqOTIfTB0mqtDqhNTSrgCU+eX5ZmWr5AaBxoT6sK1zU7zAS8jDMBn336Awyw==
X-Received: by 2002:a05:6000:4024:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39ad177f70bmr6158944f8f.39.1743167132957;
        Fri, 28 Mar 2025 06:05:32 -0700 (PDT)
Message-ID: <d6be28f6-7c33-41c7-9502-799e484014bf@suse.com>
Date: Fri, 28 Mar 2025 14:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen: gcov: add support for gcc 14
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
 <20250328121902.2134020-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250328121902.2134020-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 13:19, Volodymyr Babchuk wrote:
> gcc 14 (with patch "Add condition coverage (MC/DC)") introduced 9th
> gcov counter. Also this version can call new merge function
> __gcov_merge_ior(), so we need a new stub for it.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



