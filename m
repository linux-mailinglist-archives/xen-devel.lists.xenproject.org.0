Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1014C50D9C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 08:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159500.1487812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4vZ-0003xd-T4; Wed, 12 Nov 2025 07:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159500.1487812; Wed, 12 Nov 2025 07:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4vZ-0003vR-QY; Wed, 12 Nov 2025 07:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1159500;
 Wed, 12 Nov 2025 07:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ4vY-0003vJ-9K
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 07:06:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a6c0591-bf96-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 08:05:59 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42b427cda88so261698f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Nov 2025 23:05:59 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a60:8d0a:6473:d951:bd22?
 (p200300cab70c6a608d0a6473d951bd22.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a60:8d0a:6473:d951:bd22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b4789896esm6498295f8f.38.2025.11.11.23.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 23:05:57 -0800 (PST)
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
X-Inumbo-ID: 0a6c0591-bf96-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762931158; x=1763535958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEzIo7/N6EGU0IppSdci/EWmEm145xbiQsm65A5WP0E=;
        b=NRBjhZJ8xUePU3KuqpPNkXpU8yvdPMPkOx0FlZen/vzdcWt7WZjgDfSUaYRJZPJOAW
         oOBwJeA6Sf5L6Iirk/g3HyV6NvYPvMOvIcRSCkbpaxRlrtg54hDjDS+b75JUWl26uFU6
         fxMUNEFsU27qiGmv3/1vgBfqfH0ilo9oD1tEAPbZBOkUqSpbX22SkLzxmx/y2IOXsCJX
         Uh2X/sWFJKW0c8jN97SgOl1IA7TmK7d67mFqHrZ5faGhiaM2D231fpi4/nLIJT9dh9Lb
         l7sD1Ph/shmDnhDRx39tX2mVK6/FtrbgUoZWzbUnqn8/SH9OK/EgGLzDJ2BG01ZHv1Wf
         Y9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762931158; x=1763535958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEzIo7/N6EGU0IppSdci/EWmEm145xbiQsm65A5WP0E=;
        b=go4NmJ7DMS3gejXEFa1ogFUmYrEuhD2Mb20kZchKDtbcukJy/MWf8cfK5ok4qsWVM3
         d0hB+7VS2glIdHh4JeS1MJo8zsk03rW8JMejo2yVyVinUo+4yEbxAFamsunGKT7tNmxD
         m/W8XKQENITbBpsqQxA4q9PGc11Z5qsqq/ALwB3tMT8aW1sQVIrqHvwPgbmkOdL+LWJq
         qqvf4qisYNupvvxteMrcnzMNSNgFtlQNzdT0Zk4tHIrCm7ZohVn6LVCzoTJNwhByRAo3
         S7PRn/99lltY4/CukKc+Co15UXDIStxmsRMiQsI5nIMxxLsmZOuU8jRHrGV/MnMKeDqL
         KtMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGakKyFvwXsYQ6QgHBBLze6q0RZ+k2b/M3yew/i4CYoXLPttzfWVjbIF5fTEMyi/cgCm8vZR1QOy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydYtt1O9xX/ulpTUg4rbn6d7LQ6AgUFUTenbYtijMCykof2zRS
	nz/LX6+4Gb3dZnkx2dkNUheonDjl/cKXSGufHjZ39cgQodp4lncDcICJmU28SZ2ZkA==
X-Gm-Gg: ASbGncsq9j6VQc38bYaXfPRYo/CnzKRCB1uZtGByFoUroSbWZhhlLeFxCEM6mNyUkcv
	ucViPRweIQss01m2LQpUkq95X3cmNyeKpqNtUryxdZnyp0b5WuGsC3rbgQYcrBjF2AqoruDvlXn
	dSLD07qKc9jOf8VdqvwDvkTpZz9GUjBw4k0uhPpQezD4ntmkygX/MIYX+6lWVN5r5PxuKW/BZWU
	Du80FJQEkTHyfwDG/fh+eDlEVseTJciJY2agZRhMg+9XPsA6gtIQVzXSwMZY0MJ7UP4Q3rSIbno
	84zjFNLYNprW8XLP5ax6G1BHoyyU1TVJESoWHDTu2UmNTaHra9axh1i3AuSz4W1wn3Q+hF9ivbo
	KEV/nbU+XMwlcWj/WyAPqEsEU0IwbSF/Oju+cuSWfcO8jE02Os+mvOS6BKaOi82OiHmW38M6hE4
	7smD9K0xvLqOcYeb0n4iS5SkH9wwbzT/ZPtCJ5eLcxgrKW6cdce8Dq2ymHRVHZB9RtKk0Ju9x8a
	Vv0X9fj8y4OnHjsSAkz4rdxdrpvZEER8XY53g==
X-Google-Smtp-Source: AGHT+IG2U3PMGkNQQCcqiCvmR+tiG4atE0kkbDtxKYB0IZ/Q6/XYA3RGptxpGDhxWVRCNv3ivM5wVA==
X-Received: by 2002:a05:6000:178c:b0:42b:4081:ccea with SMTP id ffacd0b85a97d-42b4bdaacbdmr1238512f8f.35.1762931158498;
        Tue, 11 Nov 2025 23:05:58 -0800 (PST)
Message-ID: <0192173c-c88d-4f73-95fc-5ae2ab3a0bb1@suse.com>
Date: Wed, 12 Nov 2025 08:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] config: remove stale definition from Config.mk
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-2-jgross@suse.com>
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
In-Reply-To: <20251111161959.13667-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 17:19, Juergen Gross wrote:
> buildmakevars2shellvars is used nowhere, so remove it.

Amends: 1eb944f65055 ("tools: remove qemu-traditional")

> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


